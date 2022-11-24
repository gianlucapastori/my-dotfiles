local s, lsp = pcall(require, "lspconfig")
if (not s) then
  print("lsp-config not installed, try :PackerInstall")
  return
end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

local att = function(client, bufnr)
  -- optional (i use the auto format in every server, if you want to disable in some server, just comment this line and configure in the "on_attach" individually)
  enable_format_on_save(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

local s, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if (not s) then
  print("cmp-nvim-lsp not installed, try :PackerInstall")
  return
end

local cap = cmp_lsp.default_capabilities()

-- servers
--

lsp.sumneko_lua.setup {
  on_attach = att,
  capabilities = cap,
  settings = {
    Lua = {
      diagnostics = {
        -- configure your globals here
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

lsp.tsserver.setup {
  on_attach = att,
  capabilities = cap,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}

lsp.gopls.setup {
  on_attach = att,
  capabilities = cap,
}

lsp.tailwindcss.setup {
  on_attach = att,
  capabilities = cap,
}

lsp.vuels.setup {
  on_attach = att,
  capabilities = cap,
}

lsp.jsonls.setup {
  on_attach = att,
  capabilities = cap,
}

lsp.yamlls.setup {
  on_attach = att,
  capabilities = cap,
}
