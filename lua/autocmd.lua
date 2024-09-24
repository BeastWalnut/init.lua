local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt_group = augroup("PersonalGroup", { clear = true })

autocmd("TextYankPost", {
    group = opt_group,
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 250,
        })
    end,
})
