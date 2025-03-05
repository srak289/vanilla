-- Source any local configuration

local f = loadfile(vim.g.vanilla_nvim_local_path)
if f ~= nil then
  f()
end
