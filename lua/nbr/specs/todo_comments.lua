local lib = require("nbr.lib")

local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    keys = {
        {
            "<leader>sx",
            "<cmd>TodoTrouble<CR>",
            desc = "Todos",
        },
        {
            "<leader>ct",
            function()
                local branch_name = lib.git.get_current_git_branch()
                if branch_name then
                    local issue_id = lib.git.parse_issue_id_from_branch(branch_name)

                    vim.ui.input({ prompt = "Enter todo comment" }, function(todo_comment)
                        local comment

                        if issue_id then
                            comment = "TODO: " .. issue_id .. " " .. todo_comment
                        else
                            comment = "TODO: " .. " " .. todo_comment
                        end

                        -- TODO:  Can this done in one line? vim.cmd(...)
                        vim.cmd("norm O" .. comment .. " ")
                        vim.cmd("norm gcc")
                        vim.cmd.wa()
                    end)
                end
            end,
            desc = "Add todo",
        },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next todo comment",
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Prev todo comment",
        },
    },
    opts = {},
}

return M.spec
