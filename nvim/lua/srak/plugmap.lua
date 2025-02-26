-- Harpoon Commands
local harpoon = require("harpoon")
harpoon:setup()

harpoon.ui = require("harpoon.ui")
harpoon.mark = require("harpoon.mark")

-- remove <leader>_h_ : causes delay for <leader>h :bp
vim.keymap.set("n", "<leader>hk", function()
  harpoon.ui.toggle_quick_menu()
end
)
vim.keymap.set("n", "<leader>hh", function()
  harpoon.ui.nav_prev()
end
)
vim.keymap.set("n", "<leader>hl", function()
  harpoon.ui.nav_next()
end
)

-- Telescope Commands
local telescope = require("telescope")
telescope:setup()
