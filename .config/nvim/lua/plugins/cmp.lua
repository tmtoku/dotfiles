return {
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = false,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                -- Expand snippet-style completion items with vim.snippet.
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },

                -- <C-n>/<C-p>: next/previous completion item.
                -- <C-b>/<C-f>: scroll completion docs.
                -- <C-e>: close completions.
                -- <CR>: confirm the selected completion item.
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),

                -- Prefer LSP completion items over file path completion items.
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                }, {
                    { name = "path" },
                }),
            })
        end,
    },
}
