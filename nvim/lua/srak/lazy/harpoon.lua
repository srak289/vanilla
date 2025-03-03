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
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<leader>i", function()
      harpoon:list():next()
    end)
    vim.keymap.set("n", "<C-h>", function()
      vim.print("HARPOON-ONE")
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-j>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-k>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(4)
    end)
    vim.keymap.set("n", "<C-;>", function()
      harpoon:list():select(5)
    end)
  end
}
