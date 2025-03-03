return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  depth = 1,
  tag = "v0.9.3",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "norg",
      "vim",
      "vimdoc",
      "query",
    },
    highlight = {
      enable = true,
    }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
