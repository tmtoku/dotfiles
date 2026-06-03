return {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
        -- <Space>e: open the current directory in Oil.
        { "<Space>e", "<Cmd>Oil<CR>", desc = "Open current directory" },
    },
    opts = {
        default_file_explorer = true,
        keymaps = {
            -- q: close Oil.
            ["q"] = { "actions.close", mode = "n" },
        },
        view_options = {
            show_hidden = true,
        },
    },
}
