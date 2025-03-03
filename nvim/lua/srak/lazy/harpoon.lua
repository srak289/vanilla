return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  dependencies = {
      "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.g.harpoon_log_level = "trace"
    local harpoon = require("harpoon")
    harpoon.ui = require("harpoon.ui")

    harpoon:setup({})

    vim.keymap.set("n", "<leader>u", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set("n", "<leader>o", function()
      harpoon.ui:nav_prev()
    end)
    vim.keymap.set("n", "<leader>i", function()
      harpoon.ui:nav_next()
    end)
  end
}
