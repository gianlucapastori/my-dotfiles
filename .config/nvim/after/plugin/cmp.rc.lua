local s, cmp = pcall(require, "cmp")
if (not s) then
  print("lspking not installed, try :PackerInstall")
  return
end
local s, lspkind = pcall(require, 'lspkind')
if (not s) then
  print("lspking not installed, try :PackerInstall")
  return
end
local s, pairs = pcall(require, 'nvim-autopairs.completion.cmp')
if (not s) then
  print("nvim-autopairs.completion.cmp not installed, try :PackerInstall")
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

cmp.event:on(
  'confirm_done',
  pairs.on_confirm_done()
)

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
