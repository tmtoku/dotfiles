local format_group = vim.api.nvim_create_augroup("UserLspFormat", { clear = true })
local hover_group = vim.api.nvim_create_augroup("UserLspHover", { clear = true })

local function enable_format_on_save(args)
    if not vim.g.format_on_save then return end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if (not client) or (not client.supports_method("textDocument/formatting")) then
        return
    end

    local buffer_id = args.buf

    -- Clear existing save-before-format autocmds.
    vim.api.nvim_clear_autocmds({
        group = format_group,
        buffer = buffer_id,
        event = "BufWritePre",
    })

    -- Format the buffer before saving.
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_group,
        buffer = buffer_id,
        callback = function()
            vim.lsp.buf.format({ bufnr = buffer_id, id = client.id })
        end,
    })
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = format_group,
    callback = enable_format_on_save,
})

-- Disable conceal in LSP hover windows and close them on BufLeave.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        for _, window in ipairs(vim.fn.win_findbuf(args.buf)) do
            local ok = pcall(vim.api.nvim_win_get_var, window, "lsp_floating_bufnr")
            if ok then
                vim.wo[window].conceallevel = 0

                vim.api.nvim_create_autocmd("BufLeave", {
                    group = hover_group,
                    buffer = args.buf,
                    once = true,
                    callback = function()
                        if vim.api.nvim_win_is_valid(window) then
                            vim.api.nvim_win_close(window, true)
                        end
                    end,
                })
            end
        end
    end,
})
