-- set options
local vanilla_nvim_config = {
  opt = {
    autoindent = true,
    autowrite = true,
    background = "dark",
    relativenumber = true,
    number = true,
    lazyredraw = true,
    incsearch = true,
    hlsearch = true,
    showmatch = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    scrolloff = 999,
    mouse = "",
    colorcolumn = "79",
    termguicolors = true,
  },
  cmd = {
    colorscheme = "kanagawa-wave",
  }
}
local vanilla_nvim_local_config = {
  opt = {},
  cmd = {},
}

vim.g.vanilla_nvim_scripts_path = os.getenv("HOME") .. "/.vanilla/nvim/scripts/"
vim.g.vanilla_nvim_local_path = os.getenv("HOME") .. "/.vanilla.lua"

-- load any local config
local f = loadfile(vim.g.vanilla_nvim_local_path)
if f ~= nil then
  vanilla_nvim_local_config = f()
end

local background = os.getenv("VANILLA_NVIM_BACKGROUND")
local colorscheme = os.getenv("VANILLA_NVIM_COLORSCHEME")
if background ~= nil then
  vanilla_nvim_local_config.opt.background = background
end
if colorscheme ~= nil then
  vanilla_nvim_local_config.cmd.colorscheme = colorscheme
end

-- merge local config
for k, v in pairs(vanilla_nvim_local_config) do
  vanilla_nvim_config[k] = vim.tbl_extend("force", vanilla_nvim_config[k], v)
end

vim.g.vanilla_nvim_config = vanilla_nvim_config
vim.g.vanilla_nvim_local_config = vanilla_nvim_local_config

for k, v in pairs(vim.g.vanilla_nvim_config.opt) do
  vim.opt[k] = v
end
for k, v in pairs(vim.g.vanilla_nvim_config.cmd) do
  local status = pcall(vim.cmd, {cmd=k, args={v}})
  if not status then
    vim.print("Cmd "..k.." failed!")
  end
end

