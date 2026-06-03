local opt = vim.opt

-- General editor behavior and UI defaults.
opt.mouse = "nv"
opt.timeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.number = true
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = false
opt.cursorline = true
opt.showmode = false
opt.winborder = "single"
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.undofile = true
opt.exrc = true
opt.clipboard = "unnamedplus"

-- Use ripgrep for :grep when it is available.
if vim.fn.executable("rg") == 1 then
    opt.grepprg = "rg --vimgrep --smart-case"
    opt.grepformat = "%f:%l:%c:%m"
end

-- Use ASCII diagnostic signs.
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN]  = "W",
            [vim.diagnostic.severity.INFO]  = "I",
            [vim.diagnostic.severity.HINT]  = "H",
        },
    },
    virtual_text = true,
})
