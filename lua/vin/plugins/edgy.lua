return {
    -- edgy
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        init = function()
            vim.opt.laststatus = 3
            vim.opt.splitkeep = "screen"
        end,
        opts = {
            ---@type table<Edgy.Pos, {size:integer, wo?:vim.wo}>
            options = {
                left = { size = 50 },
                bottom = { size = 10 },
                right = { size = 50 },
                top = { size = 10 },
            },
            bottom = {
                {
                    ft = "toggleterm",
                    size = { height = 0.4 },
                    filter = function(buf, win)
                        return vim.api.nvim_win_get_config(win).relative == ""
                    end,
                },
                {
                    ft = "noice",
                    size = { height = 0.4 },
                    filter = function(buf, win)
                        return vim.api.nvim_win_get_config(win).relative == ""
                    end,
                },
                {
                    ft = "lazyterm",
                    title = "LazyTerm",
                    size = { height = 0.4 },
                    filter = function(buf)
                        return not vim.b[buf].lazyterm_cmd
                    end,
                },
                "Trouble",
                { ft = "qf", title = "QuickFix" },
                {
                    ft = "help",
                    size = { height = 20 },
                    -- don't open help files in edgy that we're editing
                    filter = function(buf)
                        return vim.bo[buf].buftype == "help"
                    end,
                },
                { ft = "spectre_panel", size = { height = 0.4 } },
                {
                    title = "Neotest Output",
                    ft = "neotest-output-panel",
                    size = { height = 15 },
                },
            },
            left = {
                {
                    title = "Neo-Tree",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "filesystem"
                    end,
                    pinned = true,
                    open = function()
                        vim.api.nvim_input("<esc><space>e")
                    end,
                    size = { height = 0.5 },
                },
            },
            right = {
                {
                    title = "Neo-Tree Git",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "git_status"
                    end,
                    pinned = true,
                    open = "Neotree position=right git_status",
                },
                {
                    title = "Neo-Tree Buffers",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "buffers"
                    end,
                    pinned = true,
                    open = "Neotree position=top buffers",
                },
            },
        },
    },

    -- prevent neo-tree from opening files in edgy windows
    {
        "nvim-neo-tree/neo-tree.nvim",
        optional = true,
        opts = function(_, opts)
            opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types
                or { "terminal", "Trouble", "qf", "Outline" }
            table.insert(opts.open_files_do_not_replace_types, "edgy")
        end,
    },
}
