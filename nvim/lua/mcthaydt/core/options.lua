local opt = vim.opt

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs and Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = false

-- Apperance
opt.termguicolors = true
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Text  
opt.clipboard:append("unnamedplus")
opt.iskeyword:append("-")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

