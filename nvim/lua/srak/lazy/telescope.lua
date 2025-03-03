return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
      local telescope = require("telescope")
      telescope:setup({})
  end
}
