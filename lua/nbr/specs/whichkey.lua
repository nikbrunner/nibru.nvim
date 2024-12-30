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
            mappings = false, -- Disable all icons
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
                -- v3
                { "<leader>a", group = "[A]pp", icon = " " },
                { "<leader>as", group = "[S]ettings", icon = " " },
                { "<leader>w", group = "[W]orkspace", icon = "󰲃 " },
                { "<leader>wv", group = "[V]ersion Control", icon = "󰋚 " },
                { "<leader>d", group = "[D]ocument", icon = "󱔘 " },
                { "<leader>dv", group = "[V]ersion Control", icon = "󰋚 " },

                -- v2
                { "<leader>c", group = "Code", icon = " " },
                { "<leader>.", group = "TMUX", icon = "󱂬 " },
                { "<leader>;", icon = " " },
                { "<leader>N", icon = "󱀂 " },
                { "<leader>U", icon = "󰣜 " },
                { "<leader>c", group = "Code", icon = " " },
                { "<leader>cl", group = "Log", icon = " " },
                { "<leader>cp", group = "Picker", icon = "󱥚 " },
                { "<leader>dc", group = "Calls", icon = " " },
                { "<leader>e", group = "Explorer", icon = "󰙅" },
                { "<leader>g", group = "Git", icon = " " },
                { "<leader>gC", group = "Checkout", icon = " " },
                { "<leader>r", group = "REST", icon = "󰿘 " },
                { "<leader>h", group = "[H]unk", icon = " " },
                { "<leader>i", group = "Intelligence", icon = "󰧑 " },
                { "<leader>j", group = "Jumps", icon = "󰴪 " },
                { "<leader>o", group = "Obsidian", icon = " " },
                { "<leader>s", group = "Search", icon = " " },
                { "<leader>S", group = "Session", icon = " " },
                { "<leader>m", group = "Marks", icon = "󰍐 " },
                { "<leader>n", group = "Notes", icon = " " },
                { "<leader>u", group = "UI", icon = "󰙵 " },
                { "<leader>ai", group = "[I]nfo", icon = " " },
                -- { "[", group = "Prev", icon = "󰒮 " },
                -- { "]", group = "Next", icon = "󰒭 " },
                { "g", group = "G", icon = "󱡓 " },
                { "S", group = "Surround", icon = "󰅩 " },
            },
        },
    },
}
