return {
  --"srak289/harpoon",
  --branch = "harpoon2",
  dir = "~/project/harpoon",
  lazy = false,
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

    -- harpoon:list():prev()
    -- harpoon:list():next()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)

    vim.keymap.set("n", "<leader>r", function()
      harpoon:list():remove()
    end)

    -- Maybe we need to extend the quick menu to accept actions other than
    -- <Enter> so we can do something like <leader>u[nav]r -> remove
    --
    -- sometimes we want to remove a harpoon w/o naving to
    -- the file to press <leader>r
    --
    -- Would be nice to make this interactive with UI
    vim.keymap.set("n", "<leader>sr", function()
      vim.ui.input({prompt="Harpoon number to remove: "}, function(input)
        harpoon:list():remove_at(input)
      end)
    end)

    vim.keymap.set("n", "<leader>sR", function()
      vim.ui.input({prompt="Harpoon number to Replace: "}, function(input)
        harpoon:list():replace_at(input)
      end)
    end)

    --harpoon:list():replace()

    vim.keymap.set("n", "<C-h>", function()
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

  end
}
