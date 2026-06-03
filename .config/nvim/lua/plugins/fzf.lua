return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
        -- <Space>ff: find files under the current directory.
        { "<Space>ff", function() require("fzf-lua").files() end,    desc = "Find files" },

        -- <Space>fg: search text under the current directory.
        { "<Space>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },

        -- <Space>fb: switch between open buffers.
        { "<Space>fb", function() require("fzf-lua").buffers() end,  desc = "Buffers" },

        -- <Space>fr: open a recent file.
        { "<Space>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },
    },
    opts = {
        fzf_opts = {
            ["--layout"] = "reverse",
            ["--info"] = "inline",
        },
        files = {
            fd_opts = "--type f --strip-cwd-prefix --hidden --exclude .git",
        },
        grep = {
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden --glob '!.git/' -e",
        },
        previewers = {
            bat = {
                cmd = "bat",
                args = "--style=numbers,changes --color=always",
            },
        },
        winopts = {
            height = 0.85,
            width = 0.80,
            preview = {
                layout = "vertical",
                vertical = "down:45%",
            },
        },
    },
    config = function(_, opts)
        require("fzf-lua").setup(vim.tbl_deep_extend("force", {
            "default",
            defaults = {
                formatter = "path.filename_first",
            },
            keymap = {
                builtin = {
                    ["<C-f>"] = "preview-page-down",
                    ["<C-b>"] = "preview-page-up",
                },
                fzf = {
                    ["ctrl-f"] = "preview-page-down",
                    ["ctrl-b"] = "preview-page-up",
                },
            },
        }, opts))
    end,
}
