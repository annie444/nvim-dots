local utils = {}
local uv = vim.uv or vim.loop

---@param path_components string[]
---@return string
function utils.concat(path_components) return vim.fs.normalize(table.concat(path_components, "/")) end

---Get TypeScript server path from project root
---@param root_dir string Project root directory
---@return string? ts_server_path Path to TypeScript server lib directory, or empty string if not found
function utils.get_typescript_server_path(root_dir)
  local project_roots = vim.fs.find("node_modules", { path = root_dir, upward = true, limit = math.huge })

  vim.notify_once(
    string.format("Searching for TypeScript in project roots: %s", table.concat(project_roots, ", ")),
    vim.log.levels.DEBUG
  )

  local typescript_path = ""
  local stat = nil
  local err = nil
  for _, project_root in ipairs(project_roots) do
    -- Reset variables for each iteration
    typescript_path = ""
    stat = nil
    err = nil
    -- Check for node_modules/typescript/lib
    typescript_path = utils.concat { project_root, "typescript" }
    stat, err, _ = uv.fs_stat(typescript_path)
    if err then vim.notify(string.format("Error checking for TypeScript path: %s", err), vim.log.levels.WARN) end
    if stat and stat.type == "directory" then return utils.concat { typescript_path, "lib" } end
  end

  return nil
end

---Finds the TypeScript module file in the given lib directory.
---@param lib_dir string
---@return string?
function utils.find_typescript_module_in_lib(lib_dir)
  for _, filename in ipairs { "tsserverlibrary.js", "typescript.js", "tsserver.js" } do
    local filepath = utils.concat { lib_dir, filename }
    local stat, err, name = uv.fs_stat(filepath)
    if err then
      vim.notify(
        string.format("Error checking for TypeScript module file %s: %s", name or filepath, err),
        vim.log.levels.WARN
      )
      return nil
    end
    if stat and stat.type == "file" then return filepath end
  end
  return nil
end

---@param dir string
---@return string?
function utils.tsdk(dir)
  local ts_path = utils.get_typescript_server_path(dir)
  if ts_path then return ts_path end
  vim.notify(string.format("Could not find TypeScript installation in node_modules from %s", dir), vim.log.levels.WARN)
  return nil
end

---@param package_dir string The Mason package installation directory where a vendored Typescript installation can be found.
---@param workspace_dir string?
---@return string?, string?
function utils.resolve_tsdk(package_dir, workspace_dir)
  local cwd = vim.fn.getcwd()
  local tsdk = nil

  ---First, try to resolve from workspace directory (if provided)
  if workspace_dir then tsdk = utils.tsdk(workspace_dir) end
  if tsdk then
    local local_tsserverlib = utils.find_typescript_module_in_lib(tsdk)
    if local_tsserverlib then return tsdk, local_tsserverlib end
  end

  ---Next, try to resolve from current working directory
  tsdk = utils.tsdk(cwd)
  if tsdk then
    local local_tsserverlib = utils.find_typescript_module_in_lib(tsdk)
    if local_tsserverlib then return tsdk, local_tsserverlib end
  end

  ---Finally, fall back to vendored Typescript installation
  tsdk = utils.tsdk(package_dir)
  if tsdk then
    local vendored_tsserverlib = utils.find_typescript_module_in_lib(tsdk)
    if not vendored_tsserverlib then
      vim.notify(string.format("Failed to find vendored Typescript module in %s", package_dir), vim.log.levels.WARN)
      return nil, nil
    end
    return tsdk, vendored_tsserverlib
  end

  --- If we reach here, we couldn't resolve TypeScript installation
  vim.notify(
    string.format("Could not resolve TypeScript installation in workspace or vendored path from %s", package_dir),
    vim.log.levels.WARN
  )

  return nil, nil
end

---@param package_dir string The Mason package installation directory where a vendored Typescript installation can be found.
---@param workspace_dir string?
function utils.resolve_tsserver(package_dir, workspace_dir)
  local _, tsserver = utils.resolve_tsdk(package_dir, workspace_dir)
  return tsserver
end

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "astro" })
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      -- safely extend the servers list
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, {
        "astro",
      })

      -- Configure Astro LSP to find TypeScript (handles npm workspaces)
      opts.config = opts.config or {}
      ---@diagnostic disable-next-line: missing-fields
      opts.config.astro = {
        ---@param config lspconfig.options.astro
        before_init = function(_, config)
          local package_dir = vim.fn.expand "$MASON/packages/astro-language-server"

          local root_dir = ""
          if type(config.root_dir) == "function" then root_dir = config.root_dir() or "" end
          if type(config.root_dir) == "string" then
            root_dir = config.root_dir--[[@as string|nil]]
          end
          if root_dir == nil or root_dir == "" then root_dir = vim.fn.getcwd() end

          config.init_options.typescript.serverPath = utils.resolve_tsserver(package_dir, root_dir)
          config.init_options.typescript.tsdk = utils.resolve_tsdk(package_dir, root_dir)
        end,
      }

      -- Ensure ESLint LSP validates Astro files
      opts.config.eslint = opts.config.eslint or {}
      opts.config.eslint.filetypes = opts.config.eslint.filetypes
        or { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "astro" }
      if not vim.tbl_contains(opts.config.eslint.filetypes, "astro") then
        table.insert(opts.config.eslint.filetypes, "astro")
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "astro-language-server" })
    end,
  },
}
