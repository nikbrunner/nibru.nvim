local M = {}

---@type LazySpec
M.spec = {
    "mikavilpas/yazi.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = {
        {
            "<leader>f",
            function()
                require("yazi").yazi()
            end,
            desc = "[E]xplorer",
        },
        {
            "<leader>F",
            function()
                require("yazi").yazi(nil, vim.fn.getcwd())
            end,
            desc = "[E]xplorer (CWD)",
        },
    },
    ---@type YaziConfig
    opts = {
        yazi_floating_window_winblend = 20,
        floating_window_scaling_factor = 0.8,
    },
}

return M.spec
