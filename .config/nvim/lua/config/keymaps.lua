local map = vim.keymap.set

local function toggle_quickfix()
    for _, window in ipairs(vim.fn.getwininfo()) do
        if window.quickfix == 1 then
            vim.cmd.cclose()
            return
        end
    end

    vim.cmd.copen()
end

-- <Space>: do nothing.
map("n", "<Space>", "<Nop>", { silent = true })

-- <Esc>: clear search highlights.
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true })

-- <C-n>/<C-p>: move to the next/previous item in the command history.
map("c", "<C-n>", "<Down>")
map("c", "<C-p>", "<Up>")

-- <Space>q: toggle the quickfix window.
map("n", "<Space>q", toggle_quickfix, { silent = true, desc = "Toggle quickfix" })

-- <Space>ih: toggle LSP inlay hints.
map("n", "<Space>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
