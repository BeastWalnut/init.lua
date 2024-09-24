local opt = vim.opt

vim.g.mapleader = " "
opt.title = true

-- Line numbers and wrap
opt.number = true
opt.relativenumber = true
opt.wrap = false

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 0 -- same as tabstop
opt.softtabstop = -1 -- same as shiftwidth
opt.smartindent = false

-- Spelling and word detection
opt.ignorecase = true
opt.smartcase = true

opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true
opt.swapfile = false

-- Search highlights
opt.incsearch = true
opt.hlsearch = false

-- Characters
opt.listchars = {
    trail = "-",
    tab = "│ ",
    eol = "↲",
}
opt.list = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.hidden = true

opt.isfname:append("@-@")

opt.backspace = "indent,eol,start"
opt.scrolloff = 8
