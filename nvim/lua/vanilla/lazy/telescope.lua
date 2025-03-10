-- Generally the telescope key is 'f'
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
    require("telescope"):setup({})
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fr", function()
      vim.ui.input({prompt="Enter path to search: "}, function(input)
        builtin.find_files({cwd=input})
      end)
    end, { desc = "Telescope relative find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    -- XXX this has the potential to hang if there are tons of containers
    -- in .local ?
    vim.keymap.set("n", "<leader>fh", function()
      builtin.find_files({hidden = true})
    end, { desc = "Telescope find hidden files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope relative find files" })
  end
}
