local keymap = vim.keymap

keymap.set('n', 'd', '"_d')
keymap.set('n', 'dd', '"_dd')

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', 'te', ':tabedit')

keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

keymap.set('n', 'ex', ':Explore<CR>')

keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', '<S-Space>', '<C-w>W')
