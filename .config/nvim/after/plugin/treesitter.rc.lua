local s, ts = pcall(require, "nvim-treesitter.configs")
if(not s) then
  print("treesitter not installed, try :PackerInstall")
  return
end

ts.setup{
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "go",
    "lua",
    "html",
    "css",
    "toml",
    "json",
    "yaml"
  },
  autotag = {
    enable = true,
  },
}
