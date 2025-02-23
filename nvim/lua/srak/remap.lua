-- set options

vim.opt.ai = true
vim.opt.aw = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.et = true

-- set leader
vim.g.mapleader = " "

-- netrw command
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffer commands
vim.keymap.set("n", "<leader>h", ":bp<CR>")
vim.keymap.set("n", "<leader>j", ":bw<CR>")
vim.keymap.set("n", "<leader>l", ":bn<CR>")
vim.keymap.set("n", "<leader>k", ":ls<CR>")

-- 'dir' commands
-- dir-list
vim.keymap.set("n", "<leader>dl", ":!ls<CR>")
vim.keymap.set("n", "<leader>dm", function()
  print("todo")
end
)

vim.keymap.set("n", "<leader>dm", function()
  print("todo")
end
)

-- todo need treesitter to change lua indent to 2space
