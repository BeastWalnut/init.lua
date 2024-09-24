require("options")
require("autocmd")

local colorscheme = "default"
local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
if colorscheme and not ok then
    vim.notify(err, vim.log.levels.WARN, { title = "init.lua" })
end
