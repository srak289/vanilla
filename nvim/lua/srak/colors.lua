vim.o.termguicolors = true
local background = os.getenv("NVIM_BACKGROUND")
local colorscheme = os.getenv("NVIM_COLORSCHEME")
if background == "" then
  background = "dark"
end
if colorscheme == "" then
  colorscheme = "kanagawa-wave"
end
vim.o.background = background
vim.cmd.colorscheme(colorscheme)
