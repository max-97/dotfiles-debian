require "nvchad.options"

-- add yours here!

local o = vim.o

o.guicursor = ""

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"

o.updatetime = 50

o.colorcolumn = "120"
o.cursorlineopt ='both'

vim.opt.isfname:append("@-@")
