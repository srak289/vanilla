return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "v9.2.0",
    config = function()
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "norg",
        callback = function()
          vim.keymap.set("n", "<leader>n", "<Plug>(neorg.pivot.list.toggle)", { buffer = true })
        end
      })
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            }
          },
        },
      })
      vim.keymap.set("n", "<leader>ni", ":Neorg index<CR>")
      vim.keymap.set("n", "<leader>nj", ":Neorg journal")
      vim.keymap.set("n", "<leader>nr", ":Neorg return<CR>")
      vim.keymap.set("n", "<leader>nw", ":Neorg workspace")
    end,
}
