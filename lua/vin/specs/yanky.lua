local M = {}

---@type LazyPluginSpec
M.spec = {
    "gbprod/yanky.nvim",
    opts = {},
    keys = {
        { "<c-p>", "<Plug>(YankyPreviousEntry)" },
        { "<c-n>", "<Plug>(YankyNextEntry)" },

        { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
        { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },

        {
            "<C-r>",
            -- "<cmd>Telescope yank_history theme=ivy<cr>",
            "<cmd>YankyRingHistory<cr>",
            desc = "[Y]ank History",
            mode = { "i", "n", "x" },
        },
    },
}

return M.spec
