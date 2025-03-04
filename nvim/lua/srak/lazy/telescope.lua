return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
    require("telescope"):setup({})
    local cmd = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", cmd.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fr", function()
      vim.print("enter file")
    end, { desc = "Telescope relative find files" })
    vim.keymap.set("n", "<leader>fg", cmd.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", cmd.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", cmd.help_tags, { desc = "Telescope help tags" })
  end
}
