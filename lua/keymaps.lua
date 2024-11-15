local utils = require("utils.keymap")
local set_keymap = vim.keymap.set

-- VimRegex helpers
set_keymap("n", "<Leader>qr", [[:%s/\<<C-r><C-w>\>/]], { desc = "Query Replace" })

-- Move highlighted lines up or down
utils.set_keymap({
    K = { ":m '<-2<Cr>gv=gv", desc = "Move lines up" },
    J = { ":m '>+1<Cr>gv=gv", desc = "Move lines down" },
}, { mode = "x" })

-- Remove '\n' without moving cursor
set_keymap("n", "J", "mzJ`z", { desc = "Join line", noremap = true })

-- Move half a screen up or down
utils.set_keymap({
    ["<C-u>"] = { "<C-u>zz", desc = "Move screen up" },
    ["<C-d>"] = { "<C-d>zz", desc = "Move screen down" },
})

-- Center screen on search
utils.set_keymap({
    n = { "nzzzv" },
    N = { "Nzzzv" },
}, {
    mode = "n",
})

-- Clipboard Interactions
utils.set_keymap({
    y = { '"+y', desc = "y" },
    Y = { '"+Y', desc = "Y" },
    p = { '"+p', desc = "p" },
    P = { '"+P', desc = "P" },
    d = { '"+d', desc = "d" },
    D = { '"+D', desc = "D" },
}, {
    mode = { "n", "x" },
    prefix = "<Leader>",
    name = "Clipboard",
})

-- Void delete
utils.set_keymap({
    x = { '"_x' },
    X = { '"_X' },
}, {
    mode = { "n", "x" },
    name = "Void",
})

-- Number Interactions
utils.set_keymap({
    ["+"] = { "<C-a>", desc = "Increment" },
    ["-"] = { "<C-x>", desc = "Decrement" },
}, {
    mode = "n",
    prefix = "<Leader>",
    name = "Number",
})
