local custom_group = vim.api.nvim_create_augroup("custom_group", { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',  { 
    group = custom_group,
    pattern = "*.norg",
    command = "silent !bash -c 'cd ~/notes && git add * && (git diff-index --quiet HEAD || git commit -am \"sync\") && git pull && git push && echo \"git push to neorg-notes completed.\" && cd - ' "
})


-- Define a global variable to track if the pull has been executed in the session
vim.g.has_pulled_notes = false
vim.api.nvim_create_autocmd('BufRead', {
    group = custom_group,
    pattern = "*.norg",
    callback = function()
        -- Check if we've already pulled the notes in this session
        if not vim.g.has_pulled_notes then
            -- Your command to pull from the git repository
            vim.cmd("silent !bash -c 'cd ~/notes && git pull && echo \"git pull from neorg-notes completed.\" && cd -'")
            -- Set the flag to true so this block won't run again in this session
            vim.g.has_pulled_notes = true
        end
    end
})
