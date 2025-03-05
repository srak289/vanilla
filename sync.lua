local srak_neorg_sync = vim.api.nvim_create_augroup("srak_neorg_sync", { clear = true })

vim.api.nvim_create_autocmd('BufWritePost',  { 
---Push notes on write
    group = srak_neorg_sync,
    pattern = "*.norg",
    callback = function()
      --"silent !bash "
      if vim.g.srak_nvim_config.notes.sync then
        if vim.g.srak_nvim_config.notes.branch then
          print("lmao")
        end
      end
    end
})

--TODO write link path if not exists when jumping to new directory from index
vim.api.nvim_create_autocmd('BufRead', {
---Pull notes if not present
    group = srak_neorg_sync,
    pattern = "*.norg",
    callback = function()
        -- Check if we've already pulled the notes in this session
        if not vim.g.srak_nvim.notes.has_synced then
            -- Your command to pull from the git repository
            vim.g.has_pulled_notes = true
        end
      if vim.g.srak_nvim_config.notes.sync then
        print("push")
      end
    end
    end
})
