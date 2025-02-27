-- Harpoon Commands
local harpoon = require("harpoon")

-- debugging
vim.g.harpon_log_level = "trace"

-- REQUIRED
harpoon:setup()
-- REQUIRED

harpoon.ui = require("harpoon.ui")
harpoon.mark = require("harpoon.mark")

vim.keymap.set("n", "<leader>u", function()
  harpoon.ui.toggle_quick_menu()
end
)
vim.keymap.set("n", "<leader>o", function()
  harpoon.ui.nav_prev()
end
)
vim.keymap.set("n", "<leader>i", function()
  harpoon.ui.nav_next()
end
)

-- Telescope Commands
local telescope = require("telescope")
telescope:setup()
