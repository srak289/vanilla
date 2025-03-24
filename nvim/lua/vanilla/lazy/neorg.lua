return {
  "nvim-neorg/neorg",
<<<<<<< Updated upstream
	dev = false,
=======
  version = "v9.2.0",
>>>>>>> Stashed changes
  dependencies = {
    "juniorsundar/neorg-extras",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
	dev = false,
  lazy = false,
  config = function()

    --[[
    vim.keymap.set("n", "<localleader>nn", function()
      local dirman = require("neorg").modules.get_module("core.dirman")

      vim.ui.input({ prompt = "Enter note name: " }, function(user_input)
        -- Cancelled input
        if not user_input or user_input == "" then
          return
        end

        local file_name = user_input:gsub(" ", "_")
        local date = os.date("%Y-%m-%d--")
        local ws = dirman.get_current_workspace()[1]

        dirman.create_file(date .. file_name, ws, {
          no_open = false, -- open file after creation?
          force = false, -- overwrite file if exists
          metadata = {
            title = require("neorg.core").lib.title(user_input),
            -- title = user_input,
          },
        })

        -- Set cursor to after metadata
        vim.api.nvim_win_set_cursor(0, { 10, 0 })
      end)
    end, { desc = "Create New Note", buffer = true })
    --]]

    -- TODO: make notes sync on close
    -- Perhaps we can have multiple upstreams e.g. gh, router
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

    --[[
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "norg",
      callback = function()
        vim.keymap.set("n", "<leader>n", "<Plug>(neorg.pivot.list.toggle)", { buffer = true })
      end
    })
    --]]

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
        ["external.many-mans"] = {
          config = {
            metadata_fold = true,
            code_fold = true,
          }
        },
        ["external.agenda"] = {
          config = {
            workspace = nil,
          }
        }
      },
    })

    --vim.keymap.set("i", "()", "<ESC>dh0i- ( ) <ESC>")
    vim.keymap.set("n", "<localleader>ne", function()
    end)
    vim.keymap.set("n", "<localleader>ni", ":Neorg index<CR>")
    vim.keymap.set("n", "<localleader>nj", ":Neorg journal today<CR>")
    vim.keymap.set("n", "<localleader>nc", ":Neorg journal custom<CR>")
    vim.keymap.set("n", "<localleader>nr", ":Neorg return<CR>")
    vim.keymap.set("n", "<localleader>nw", ":Neorg workspace")
  end,
}
