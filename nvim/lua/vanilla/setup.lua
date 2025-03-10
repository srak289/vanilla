-- set options
vim.opt.ai = true
vim.opt.aw = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.et = true
vim.opt.scrolloff = 999
vim.opt.wrap = false
vim.opt.colorcolumn = "79"

vim.g.vanilla_nvim_scripts_path = os.getenv("HOME") .. "/.vanilla/nvim/scripts/"
vim.g.vanilla_nvim_local_path = os.getenv("HOME") .. "/.vanilla.lua"
-- make a local copy and write back
-- e.g.
-- local foo = vim.g.foo = {}
-- foo.whatever = "something"
-- vim.g.foo = foo
--
vim.g.vanilla_nvim_local = {}
vim.g.vanilla_nvim = {}

--vim.g.Vanilla = vim.api.nvim_create_augroup(
--  "vanilla"
--)
--vim.api.nvim_create_autocmd(
--  callback = function()
--			      autocmd TermOpen * startinsert
--  end
--)
--
-- TODO: nice to have a map for "open terminal at current buffer position"
-- TODO: run cmd at current buffer position

-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- netrw command
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffer commands
vim.keymap.set("n", "<leader>h", ":bp<CR>")
vim.keymap.set("n", "<leader>j", ":bw<CR>")
vim.keymap.set("n", "<leader>l", ":bn<CR>")
vim.keymap.set("n", "<leader>k", ":ls<CR>")

-- window commands
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wqa<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")
vim.keymap.set("n", "<leader>:", "q:")
vim.keymap.set("i", "jk", "<ESC>")

-- term commands
vim.keymap.set("n", "<leader>t", ":term<CR>A")
vim.keymap.set("n", "<leader>pt", ":term python3<CR>A")

vim.keymap.set("n", "<leader>b", function()
  vim.ui.input({prompt="Buffer to jump to: "}, function(input)
    vim.cmd(":b "..input)
  end)
end)

-- 'dir' commands
-- dir-list
vim.keymap.set("n", "<leader>dl", ":!ls<CR>")
-- FIXME: not all versions off `tree` have `--gitignore`
--[[
local tree = function()
  local tv = vim.cmd("tree --version")
  if tv then
    return function()
      vim.cmd(":tree --gitignore<CR>")
    end
  else
    return function()
      vim.cmd(":tree --gitignore<CR>")
    end
  end
end
--]]

vim.keymap.set("n", "<leader>dt", ":!tree --gitignore<CR>")
vim.keymap.set("n", "<leader>dm", function()
  vim.ui.input({prompt="Directory to create: "}, function(input)
    vim.cmd(":silent !mkdir "..input)
  end)
end)
vim.keymap.set("n", "<leader>e", function()
  -- tab complete would be sick
  vim.ui.input({prompt="File to edit: "}, function(input)
    vim.cmd(":e "..input)
  end)
end)

-- toggle nu/rnu
vim.keymap.set("n", "<leader>sn", function()
  vim.wo.nu = not vim.wo.nu
  vim.wo.rnu = not vim.wo.rnu
end
)

vim.keymap.set("n", "<leader><leader>", ":so<CR>")

-- TODO read about the api
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.lua", "*.yml", "*.yaml"},
  callback = function(evt)
    vim.bo.ts = 2
    vim.bo.sw = 2
  end
})
-- https://www.reddit.com/r/neovim/comments/1b6dsb4/changing_certain_settings_based_on_filetype/
