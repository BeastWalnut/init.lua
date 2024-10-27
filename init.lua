require("options")
require("keymaps")
require("autocmd")
require("lazy_init")

local colorscheme = "catppuccin-macchiato"
local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
if colorscheme and not ok then
    vim.notify(err, vim.log.levels.WARN, { title = "init.lua" })
end
