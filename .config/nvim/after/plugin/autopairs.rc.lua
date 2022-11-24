local s, autopairs = pcall(require, "nvim-autopairs")
if (not s) then
  print("autopairs not installed, try :PackerInstall")
  return
end

autopairs.setup({})

