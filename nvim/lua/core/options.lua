local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
-- opt.colorcolumn = "120"
opt.scrolloff = 8
opt.updatetime = 750
opt.cursorline = true
opt.guifont = "Berkeley Mono:h11"
opt.guicursor = "n-v-c-i:block-Cursor/lCursor-blinkwait100-blinkon500-blinkoff500"

-- Editing
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.wrap = true
opt.breakindent = true
opt.clipboard = "unnamedplus"

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.inccommand = "split"

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Window
opt.splitright = true
opt.mouse = "a"

-- Completion
opt.completeopt = "menuone,noselect"
