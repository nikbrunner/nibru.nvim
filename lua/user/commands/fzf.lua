-- Wrapper functions for fuzzy finding commands
local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
	return
end

local Fzf = {}

Fzf.find_files_without_preview = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.5,
			preview = {
				hidden = "hidden",
			},
		}

	fzf_lua.files(opts)
end

Fzf.find_files_with_preview = function(opts)
	opts = opts or {}
	fzf_lua.files(opts)
end

Fzf.find_files_in_dotfiles = function(opts)
	local nvimConfigPath = "~/.config/nvim"

	opts = opts or {}
	opts.cwd = opts.cwd or nvimConfigPath

	fzf_lua.files(opts)
end

Fzf.find_colorscheme = function(opts)
	opts = opts or {}
	fzf_lua.colorschemes(opts)
end

Fzf.find_commands = function(opts)
	opts = opts or {}
	fzf_lua.commands(opts)
end

Fzf.find_buffers = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.5,
			preview = {
				hidden = "hidden",
			},
		}
	fzf_lua.buffers(opts)
end

Fzf.find_in_file = function(opts)
	opts = opts or {}
	fzf_lua.lgrep_curbuf(opts)
end

Fzf.find_help_tags = function(opts)
	opts = opts or {}
	fzf_lua.help_tags(opts)
end

Fzf.find_man_page = function(opts)
	opts = opts or {}
	fzf_lua.man_pages(opts)
end

Fzf.find_old_files = function(opts)
	opts = opts or {}
	fzf_lua.oldfiles(opts)
end

Fzf.find_problems_in_workspace = function(opts)
	opts = opts or {}
	fzf_lua.lsp_workspace_diagnostics(opts)
end

Fzf.find_problems_in_document = function(opts)
	opts = opts or {}
	fzf_lua.lsp_document_diagnostics(opts)
end

Fzf.find_in_registers = function(opts)
	opts = opts or {}
	fzf_lua.registers(opts)
end

Fzf.find_in_quickfix = function(opts)
	opts = opts or {}
	fzf_lua.quickfix(opts)
end

Fzf.find_text = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts or {
		preview = {
			layout = "vertical",
		},
	}

	fzf_lua.live_grep_native(opts)
end

Fzf.find_word_under_cursor = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.grep_cword(opts)
end

Fzf.find_keymaps = function(opts)
	opts = opts or {}

	fzf_lua.keymaps(opts)
end

Fzf.find_symbols_in_workspace = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.lsp_live_workspace_symbols(opts)
end

Fzf.find_references = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.lsp_references(opts)
end

Fzf.find_defintions = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.lsp_definitions(opts)
end

Fzf.find_modified_files = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.35,
			preview = {
				hidden = "hidden",
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.git_status(opts)
end

Fzf.find_modified_files_with_preview = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.5,
			width = 0.95,
			preview = {
				horizontal = "right:65%",
			},
		}

	fzf_lua.git_status(opts)
end

Fzf.find_branches = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.35,
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.git_branches(opts)
end

Fzf.find_commits = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.35,
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.git_commits(opts)
end

Fzf.find_spelling = function(opts)
	opts = opts or {}
	fzf_lua.spell_suggest(opts)
end

return Fzf
