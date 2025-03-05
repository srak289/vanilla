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
vim.g.vanilla_nvim_local = {}
vim.g.vanilla_nvim = {}

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

vim.keymap.set("n", "<leader>b", function()
  print("TODO read integer for buffer")
end
)

-- 'dir' commands
-- dir-list
vim.keymap.set("n", "<leader>dl", ":!ls<CR>")
-- FIXME: not all versions off `tree` have `--gitignore`
vim.keymap.set("n", "<leader>dt", ":!tree --gitignore<CR>")
vim.keymap.set("n", "<leader>dm", function()
  print("TODO read name for mkdir")
end
)

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
