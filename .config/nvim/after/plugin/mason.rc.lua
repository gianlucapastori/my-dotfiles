local s, mason = pcall(require, 'mason')
if (not s) then
  print("mason not installed, try :PackerInstall")
  return
end

local s, lspconfig = pcall(require, 'mason-lspconfig')
if(not s) then
  print("mason-lspconfig not installed, try :PackerInstall")
  return
end

mason.setup({})

lspconfig.setup{
  automatic_installation = true
}
