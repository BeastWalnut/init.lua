---@module "lazy"
---@type LazyPluginSpec
local LuaLine = { "nvim-lualine/lualine.nvim" }

LuaLine.dependencies = { "nvim-tree/nvim-web-devicons" }
LuaLine.event = { "VeryLazy" }
LuaLine.opts = {
    sections = {
        lualine_x = { "fileformat", "filetype" },
    },
}

return LuaLine
