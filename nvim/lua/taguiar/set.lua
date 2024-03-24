vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true

vim.opt.wrap     = false
vim.opt.backup   = false
vim.opt.swapfile = false

if vim.fn.has('macunix') == "0" then
    vim.opt.undodir  = os.getenv("HOME") .. "/.vim/undodir"
-- else
    -- vim.opt.undodir  = os.getenv("USERPROFILE") .. "/.vim/undodir"
end
vim.opt.undofile = true
vim.opt.writebackup = false

vim.opt.hidden   = true
vim.opt.mouse = "a"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.hlsearch  = false
vim.opt.incsearch = true

vim.opt.encoding = "utf8"

vim.opt.clipboard="unnamedplus"

vim.opt.cc=""

vim.opt.wildignore = "*.pyc,__pycache__,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*"

vim.g.mapleader = " "
