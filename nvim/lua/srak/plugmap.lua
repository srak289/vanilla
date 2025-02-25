-- Harpoon Commands
local h = require("harpoon")
h.ui = require("harpoon.ui")
h.mark = require("harpoon.mark")

vim.keymap.set("n", "<leader>hk", function()
  h.ui.toggle_quick_menu()
end
)
vim.keymap.set("n", "<leader>hh", function()
  h.ui.nav_prev()
end
)
vim.keymap.set("n", "<leader>hl", function()
  h.ui.nav_next()
end
)
