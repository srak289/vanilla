return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "v9.2.0",
  config = function()

    --[[
    local vanilla_neorg_sync = vim.api.nvim_create_augroup("vanilla_neorg_sync", { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', { 
      ---Push notes on write
      group = vanilla_neorg_sync,
      pattern = "*.norg",
      callback = function()
        --"silent !bash "
        if vim.g.vanilla_nvim_config.notes.sync then
          if vim.g.vanilla_nvim_config.notes.branch then
            print("lmao")
          end
        end
      end
    })

    --TODO write link path if not exists when jumping to new directory from index
    vim.api.nvim_create_autocmd('BufRead', {
      ---Pull notes if not present
      group = vanilla_neorg_sync,
      pattern = "*.norg",
      callback = function()
          -- Check if we've already pulled the notes in this session
          if not vim.g.vanilla_nvim.notes.has_synced then
              -- Your command to pull from the git repository
              vim.g.has_pulled_notes = true
          end
        if vim.g.vanilla_nvim_config.notes.sync then
          print("push")
        end
      end
      end
    })
    --]]

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
    vim.keymap.set("n", "<leader>nj", ":Neorg journal today")
    vim.keymap.set("n", "<leader>nc", ":Neorg journal custom")
    vim.keymap.set("n", "<leader>nr", ":Neorg return<CR>")
    vim.keymap.set("n", "<leader>nw", ":Neorg workspace")
  end,
}
