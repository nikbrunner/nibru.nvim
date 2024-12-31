local M = {}

---@type LazyPluginSpec
M.spec = {
    "anuvyklack/windows.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = {
        "anuvyklack/middleclass",
    },
    keys = {
        {
            "<C-w>z",
            "<cmd>WindowsMaximize<CR>",
            desc = "Maximize Split",
        },
        {
            "<leader>aoa",
            function()
                vim.cmd("WindowsToggleAutowidth")
                vim.notify("Windows Autowidth Toggled")
            end,
            desc = "Autowidth Windows",
        },
    },
    opts = {
        autowidth = {
            enable = true,
            winwidth = 15,
        },
        ignore = {
            buftype = { "quickfix" },
            filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "grug-far" },
        },
    },
    config = function(_, opts)
        local windows = require("windows")

        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
        windows.setup(opts)
    end,
}

return M.spec
