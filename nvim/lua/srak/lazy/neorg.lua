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
    end,
}
