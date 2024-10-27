---@module "lazy"
---@type LazyPluginSpec
local Treesitter = { "nvim-treesitter/nvim-treesitter" }

Treesitter.event = { "BufReadPre", "BufNewFile" }
Treesitter.opts = {
    ensure_installed = {
        "lua",
        "vimdoc",
        "markdown",
        "comment",
        "query",
    },
    textobjects = {
        select = {
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "a func def" },
                ["if"] = { query = "@function.inner", desc = "a func def" },
                ["ac"] = { query = "@call.outer", desc = "a func call" },
                ["ic"] = { query = "@call.inner", desc = "a func call" },
                ["at"] = { query = "@class.outer", desc = "a class" },
                ["it"] = { query = "@class.inner", desc = "a class" },
            },
            enable = true,
            lookahead = true,
        },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    auto_install = true,
}

Treesitter.build = ":TSUpdate"
Treesitter.main = "nvim-treesitter.configs"

return Treesitter
