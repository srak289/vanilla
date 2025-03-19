-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- where we put things we want to wrench on / experiment with
vim.g.vanilla_nvim_local_plugin_path = os.getenv("HOME") .. "/.vanilla/nvim/local/"

-- netrw command
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffer commands
vim.keymap.set("n", "<leader>h", ":bp<CR>")
vim.keymap.set("n", "<leader>j", ":bw<CR>")
vim.keymap.set("n", "<leader>J", ":w<CR>:bw<CR>") -- this is our write-close for buffer
vim.keymap.set("n", "<leader>l", ":bn<CR>")
vim.keymap.set("n", "<leader>k", ":ls<CR>")

-- window commands
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wqa<CR>") -- perhaps W/Q can detect split and only fire to close the split
-- perhaps W can do :w :bw instead of :wqa because it feels more natural to W when I want to write-close just the one
-- file rather than two keys to write, then close just the one buffer ...
vim.keymap.set("n", "<leader>q", ":q!<CR>") -- we may not necessarily want q!
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")
vim.keymap.set("n", "<leader>:", "q:")
vim.keymap.set("i", "jk", "<ESC>")

-- term commands
vim.keymap.set("n", "<leader>t", ":term<CR>A")
vim.keymap.set("n", "<leader>pt", ":term python3<CR>A")

-- Would be nice to have a shortcut for scratch buffer
--:setlocal buftype=nofile
--:setlocal bufhidden=hide
--:setlocal noswapfile

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

vim.keymap.set("n", "<leader>b", function()
  vim.ui.input({prompt="Buffer to jump to: ", completion="buffer"}, function(input)
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
  vim.ui.input({prompt="File to edit: ", completion="file"}, function(input)
    vim.cmd(":e "..input)
  end)
end)

-- toggle nu/rnu
vim.keymap.set("n", "<leader>sn", function()
  vim.wo.nu = not vim.wo.nu
  vim.wo.rnu = not vim.wo.rnu
end)

--[[
vim.keymap.set("x", "#", function()
  local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."))
  local newlines = {}
  for i, line in ipairs(lines) do
    newlines[i] = vim.bo.commentstring..line
  end
  vim.api.nvim_buf_set_lines(bufnr)
end)
--]]

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
