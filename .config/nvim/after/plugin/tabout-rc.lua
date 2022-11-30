local s, tabout = pcall(require, 'tabout')
if (not s) then
  print("tabout not installed, Try :PackerInstall")
  return
end

tabout.setup({
  tabkey = '<Tab>',
  backwards_tabkey = '<S-Tab>',
  act_as_tab = true,
  act_as_shift_tab = false,
  enable_backwards = true,
  completion = true,
  tabouts = {
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = '`', close = '`' },
    { open = '(', close = ')' },
    { open = '[', close = ']' },
    { open = '{', close = '}' },
    { open = '<', close = '>' }
  },
  ignore_beginning = true,
  exclude = {}
})
