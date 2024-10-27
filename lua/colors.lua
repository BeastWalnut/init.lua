---@module "lazy"
---@type LazyPluginSpec
local OneDark = {
    name = "onedark",
    lazy = false,
    priority = 1000,
    "olimorris/onedarkpro.nvim",
}

---@type LazyPluginSpec
local Catppuccin = {
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    "catppuccin/nvim",
}

---@type LazyPluginSpec
local Rosepine = {
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    "rose-pine/nvim",
}

return {
    OneDark,
    Catppuccin,
    Rosepine,
}
