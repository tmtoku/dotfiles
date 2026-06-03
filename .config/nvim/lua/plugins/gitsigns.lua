return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
        signs = {
            add          = { text = "+" },
            change       = { text = "~" },
            delete       = { text = "-" },
            topdelete    = { text = "-" },
            changedelete = { text = "~" },
        },
        on_attach = function(buffer_id)
            local gs = package.loaded.gitsigns
            local opts = { buffer = buffer_id, silent = true }

            -- ]c/[c: move to the next/previous Git hunk.
            vim.keymap.set("n", "]c", function() gs.nav_hunk("next") end, opts)
            vim.keymap.set("n", "[c", function() gs.nav_hunk("prev") end, opts)
        end,
    },
}
