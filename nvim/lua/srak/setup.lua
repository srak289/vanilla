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

-- window commands
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wqa<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")

vim.keymap.set("n", "<leader>b", function()
    print("TODO read integer for buffer")
end
)

-- 'dir' commands
-- dir-list
vim.keymap.set("n", "<leader>dl", ":!ls<CR>")
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

-- todo need treesitter to change lua indent to 2space

vim.keymap.set("n", "<leader><leader>", ":so<CR>")
--function like leader>m > manpage
