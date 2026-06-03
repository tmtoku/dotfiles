vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.format_on_save = false

-- Install lazy.nvim if it is not installed yet.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
end

-- Load plugins from lua/plugins.
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ import = "plugins" }, {
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
    rocks = { enabled = false },
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")
