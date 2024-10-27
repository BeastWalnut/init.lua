---@module "lazy"
---@type LazyPluginSpec
local Harpoon = { "ThePrimeagen/harpoon", branch = "harpoon2" }

Harpoon.dependencies = { "nvim-lua/plenary.nvim" }
Harpoon.keys = function()
    local function harpoon_toggle()
        local harpoon = require("harpoon")
        return harpoon.ui:toggle_quick_menu(harpoon:list())
    end

    local function harpoon_add()
        return require("harpoon"):list():add()
    end

    local function harpoon_next()
        return require("harpoon"):list():next({ ui_nav_wrap = true })
    end

    local function harpoon_prev()
        return require("harpoon"):list():prev({ ui_nav_wrap = true })
    end

    return require("utils.keymap").lazy_spec({
        ["<Leader>ha"] = { harpoon_add, desc = "Add" },
        ["<C-e>"] = { harpoon_toggle, desc = "Toggle" },
        ["<C-n>"] = { harpoon_next, desc = "Next" },
        ["<C-p>"] = { harpoon_prev, desc = "Prev" },
    }, {
        mode = "n",
        name = "Harpoon",
    })
end

Harpoon.config = function(_, opts)
    require("harpoon"):setup(opts)
end

return Harpoon
