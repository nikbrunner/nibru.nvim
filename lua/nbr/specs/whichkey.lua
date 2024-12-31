---TODO: Fix the the +Prev ftFT text before the key bread crumbs

---@module "which-key"
---@type LazyPluginSpec
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@type wk.Opts
    opts = {
        preset = "helix",
        win = {
            title = "nbr.nvim",
            border = "solid",
            padding = { 1, 4 },
            wo = {
                winblend = 10,
            },
        },

        delay = 150,
        sort = { "local", "order", "group", "case", "alphanum", "mod" },
        layout = {
            spacing = 5, -- spacing between columns
        },

        icons = {
            mappings = true, -- Disable all icons
            separator = "", -- symbol used between a key and it's label
            rules = {
                { plugin = "yazi.nvim", icon = " " },
                { plugin = "file-surfer.nvim", icon = " " },
                { plugin = "gitpad.nvim", icon = "󰠮 " },
                { plugin = "no-neck-pain.nvim", icon = "󰈈 " },
                { plugin = "supermaven-nvim", icon = "󰧑 " },
            },
        },

        show_help = false, -- show a help message in the command line for using WhichKey
        show_keys = false, -- show the currently pressed key and its label as a message in the command line

        ---@type wk.Spec
        spec = {
            {
                mode = { "n", "v" },

                -- [A]pp
                { "<leader>a", group = "[A]pp", icon = " " },
                { "<leader>ao", group = "[O]ptions", icon = " " },
                { "<leader>ai", group = "[I]nfo", icon = " " },
                { "<leader>ah", group = "[H]elp", icon = " " },

                -- [W]orkspace
                { "<leader>w", group = "[W]orkspace", icon = "󰲃 " },
                { "<leader>wv", group = "[V]ersion Control", icon = "󰋚 " },
                { "<leader>wS", group = "[S]ession", icon = " " },

                -- [D]ocument
                { "<leader>d", group = "[D]ocument", icon = "󱔘 " },
                { "<leader>dv", group = "[V]ersion Control", icon = "󰋚 " },

                -- [H]unk
                { "<leader>h", group = "[H]unk", icon = " " },

                -- v2
                { "<leader>c", group = "Code", icon = " " },
                { "<leader>cl", group = "[L]og", icon = " " },
                { "<leader>cp", group = "[P]icker", icon = "󱥚 " },
                { "<leader>g", group = "[G]it", icon = " " },
                { "<leader>r", group = "[R]EST", icon = "󰿘 " },
                { "<leader>i", group = "[I]ntelligence", icon = "󰧑 " },
                { "<leader>s", group = "[S]earch", icon = " " },
                { "<leader>n", group = "[N]otes", icon = " " },
            },
        },
    },
}
