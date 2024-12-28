---@diagnostic disable: undefined-field
local lib = require("nbr.lib")

local function set(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    opts.silent = opts.silent == nil and true or opts.silent
    vim.keymap.set(mode, lhs, rhs, opts)
end

set("n", "Q", "<nop>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set({ "n", "x" }, "<leader><leader>", function()
    vim.api.nvim_feedkeys(":", "n", true)
end, { desc = "Enter Command Mode" })

set("n", "<Esc>", function()
    vim.cmd.nohlsearch()
    vim.cmd.wa()
    require("snacks.notifier").hide()
end, { desc = "Escape and clear hlsearch" })

set("n", "<S-Esc>", function()
    require("snacks.notifier").hide()
    lib.ui.close_all_floating_windows()
end, { desc = "Clear Notifier and Trouble" })

-- exit terminal to normal mode with esc
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal" })

set("n", "<C-o>", "<C-o>zz", { desc = "Move back in jump list" })
set("n", "<C-i>", "<C-i>zz", { desc = "Move forward in jump list" })

set("n", "yc", function()
    -- store the current column
    local col = vim.fn.col(".")
    -- duplicate the line
    vim.cmd("norm yy")
    -- comment out the duplicated line
    vim.cmd("norm gcc")
    -- paste the duplicated line below the current line
    vim.cmd("norm p")
    -- move the cursor to the original column
    vim.fn.cursor(vim.fn.line("."), col)
end, { desc = "Dupe line (Comment out old one)" })

set("n", "yp", function()
    -- store the current column
    local col = vim.fn.col(".")
    -- duplicate the line
    vim.cmd("norm yy")
    -- paste the duplicated line below the current line
    vim.cmd("norm p")
    -- move the cursor to the original column
    vim.fn.cursor(vim.fn.line("."), col)
end, { desc = "Duplicate line" })

set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

set("n", "x", '"_x', { desc = "Delete without yanking" })

-- Join lines while keeping position
set("n", "J", "mzJ`z", { desc = "Join Lines" })

set("n", "<C-c>", "ciw")

-- Resize splits with shift + arrow
set({ "n", "v", "x" }, "<S-Down>", "<cmd>resize -2<cr>", { desc = "Resize Split Down" })
set({ "n", "v", "x" }, "<S-Up>", "<cmd>resize +2<cr>", { desc = "Resize Split Up" })

set("n", "M", lib.ui.maximize_window, { desc = "Maximize Window" })

set({ "n", "v", "x" }, "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Resize Split Left" })
set({ "n", "v", "x" }, "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Resize Split Right" })

-- Better up/down
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

set("n", "go", "<cmd>e #<cr>", { desc = "Go to Other File" })

-- indenting and reselect
set("v", "<", "<gv")
set("v", ">", ">gv")

set("i", ",", ",<c-g>u")
set("i", ".", ".<c-g>u")
set("i", ";", ";<c-g>u")

-- Center screen when using <C-u> and <C-d>
set({ "n", "i", "c" }, "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
set({ "n", "i", "c" }, "<C-d>", "<C-d>zz", { desc = "Scroll Down" })

-- Center screen when going to next/previous search result
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<leader>g.", function()
    local git_root = require("snacks").git.get_root()
    if git_root then
        vim.cmd("cd " .. git_root)
        vim.notify("Changed directory to " .. git_root, vim.log.levels.INFO, { title = "Git Root" })
    else
        vim.notify("No Git root found", vim.log.levels.ERROR, { title = "Git Root" })
    end
end, { desc = "[.] Root" })

set("n", "<leader>ur", function()
    -- Reload the config file and colorscheme
    package.loaded["nbr.config"] = nil
    vim.cmd.colorscheme(require("nbr.config").colorscheme)
    vim.cmd("norm zz:e!<CR>zz")
end, { desc = "Redraw" })

set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Position" })

set("n", "<leader>uc", function()
    local defaultLevel = 0
    local currentLevel = vim.o.conceallevel
    local nextLevel = currentLevel == 0 and 3 or defaultLevel
    vim.o.conceallevel = nextLevel
    vim.notify("Conceal level set to " .. nextLevel, vim.log.levels.INFO, { title = "Conceal" })
end, { desc = "Toggle [C]onceal (0, 3)" })

set("n", "<leader>uC", function()
    local defaultLevel = 0
    vim.ui.select({ 0, 1, 2, 3 }, {
        promt = "Select Conceal Level",
    }, function(selected)
        if selected ~= nil then
            vim.opt.conceallevel = selected or defaultLevel
            vim.notify("Conceal level set to " .. selected, vim.log.levels.INFO, { title = "Conceal" })
        end
    end)
end, { desc = "Toggle Specific [C]onceal Level" })

-- prev/next
set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

set("n", "H", vim.cmd.tabprevious, { desc = "Previous Tab" })
set("n", "L", vim.cmd.tabnext, { desc = "Next Tab" }) -- attention: this will block native binding <ctrl-i>
for i = 1, 9 do
    set("n", "<leader>" .. i, function()
        local existing_tab_count = vim.fn.tabpagenr("$")

        if existing_tab_count < i then
            vim.cmd("tablast")
            vim.cmd("tabnew")
        else
            vim.cmd(i .. "tabnext")
        end
    end, { desc = WhichKeyIgnoreLabel })
end

-- nbr.nvim Group
set("n", "<leader>ap", "<cmd>Lazy<CR>", { desc = "[P]lugins" })
set("n", "<leader>al", "<cmd>Mason<CR>", { desc = "[L]anguage Servers" })
set("n", "<leader>ail", "<cmd>LspInfo<CR>", { desc = "[L]anague server information" })
set("n", "<leader>aR", function()
    vim.notify("Restarting LSP Servers", vim.log.levels.INFO, { title = "LSP" })
    vim.cmd("LspRestart")
end, { desc = "[R]estart language servers" })

-- [C] Action Group
set({ "n", "v" }, "<leader>cc", function()
    lib.copy.list_paths()
end, { desc = "Copy" })

-- Only native Vim lsp keymaps are defined here.
-- Lsp Mappings which are depended on a plugin are defined in the plugin spec file with the same event name.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- See `:help vim.lsp.buf for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        set("n", "K", vim.lsp.buf.hover, opts)
        set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        set("n", "gD", function()
            vim.cmd.vsplit()
            vim.lsp.buf.definition()
            vim.cmd("norm zz")
        end, vim.tbl_extend("keep", opts, { desc = "Go to Definition in Split" }))

        set("n", "gi", vim.lsp.buf.implementation, opts)
        set("n", "gy", vim.lsp.buf.type_definition, opts)

        -- set("n", "g.", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))

        set("n", "cn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
        set("n", "<leader>cn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))

        set("n", "dh", vim.diagnostic.open_float, { desc = "Diagnostics Hover" })
        set("n", "<leader>dh", vim.diagnostic.open_float, { desc = "Hover" })
    end,
})
