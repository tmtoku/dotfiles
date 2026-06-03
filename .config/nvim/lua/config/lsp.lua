-- Server configs passed to vim.lsp.config().
local servers = {
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
            },
        },
    },

    clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "cuda", "objc", "objcpp" },
        root_markers = { ".clangd", "compile_commands.json", "CMakeLists.txt", ".git" },
    },

    pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
    },

    rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", "Cargo.lock" },
        settings = {
            ["rust-analyzer"] = {
                inlayHints = {
                    bindingModeHints = { enable = true },
                    chainingHints = { enable = true },
                    closureReturnTypeHints = { enable = "always" },
                    expressionAdjustmentHints = { enable = "always" },
                    lifetimeElisionHints = { enable = "always" },
                    parameterHints = { enable = true },
                    typeHints = { enable = true },
                },
            },
        },
    },

    bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" },
        root_markers = { ".git" },
    },

    marksman = {
        cmd = { "marksman", "server" },
        filetypes = { "markdown" },
        root_markers = { ".marksman.toml", ".git" },
    },

    texlab = {
        cmd = { "texlab" },
        filetypes = { "tex", "bib", "plaintex" },
        root_markers = { ".git", "Makefile" },
    },
}

-- Focus the LSP hover window.
local function focus_lsp_hover(buffer_id, attempts)
    if not vim.api.nvim_buf_is_valid(buffer_id) then return end

    local window = vim.b[buffer_id].lsp_floating_preview
    if window and vim.api.nvim_win_is_valid(window) then
        vim.api.nvim_set_current_win(window)
        return
    end

    if attempts > 0 then
        local retry_delay_ms = 25
        vim.defer_fn(function()
            focus_lsp_hover(buffer_id, attempts - 1)
        end, retry_delay_ms)
    end
end

-- Add LSP keymaps to the current buffer.
local on_attach = function(_, buffer_id)
    local opts = { buffer = buffer_id, silent = true }

    -- gd: jump to definition.
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    -- K: open hover and enter it.
    vim.keymap.set("n", "K", function()
        local retry_count = 8
        vim.lsp.buf.hover()
        focus_lsp_hover(buffer_id, retry_count)
    end, opts)
end

-- Apply nvim-cmp support and LSP keymaps to all servers.
vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = on_attach,
})

-- Register all server configs.
for server, config in pairs(servers) do
    vim.lsp.config(server, config)
end

-- Start the configured servers when matching files are opened.
vim.lsp.enable(vim.tbl_keys(servers))
