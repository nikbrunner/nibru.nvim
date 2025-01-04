---@type LazyPluginSpec
return {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    event = "BufEnter",
    keys = {
        {
            mode = { "n", "v" },
            "<leader>dY",
            "<CMD>GitLink<CR>",
            desc = "[Y]ank GitHub Link",
        },
    },
    opts = {},
}
