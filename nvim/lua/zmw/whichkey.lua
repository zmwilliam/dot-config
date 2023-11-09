local M = {}

local function setup_opts(which_key)
	local setup = {
		plugins = {
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
		},
		window = {
			border = "rounded", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	}
	which_key.setup(setup)
end

local function register_mappings(which_key)
	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["a"] = { "<cmd>Alpha<cr>", "Alpha" },
		-- ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["e"] = { "<cmd>Telescope file_browser<cr>", "Explorer" },
		["w"] = { "<cmd>w!<CR>", "Save" },
		["q"] = { "<cmd>qa!<CR>", "Quit" },
		["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
		["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		["T"] = { "<cmd>Telescope<CR>", "Telescope" },
		["z"] = { "<cmd>lua require('zen-mode').toggle({window={width=.5}})<CR>", "ZenMode" },
		f = {
			name = "Find",
			f = { "<cmd>lua require('zmw.telescope').project_files()<cr>", "Files" },
			F = { "<cmd>Telescope find_files<cr>", "Files (all)" },
			g = {
				function()
					vim.ui.input({ prompt = "  " }, function(input)
						return input and require("telescope.builtin").grep_string({ search = input })
					end)
				end,
				"Grep For",
			},
			G = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live grep" },
			c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Live grep ([C]urrent Buffer)" },
			w = { "<cmd>Telescope grep_string<cr>", "Grep string" },
			p = { "<cmd>Telescope projects<cr>", "Projects" },
			e = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
			m = { "<cmd>Telescope marks<cr>", "Marks" },
		},
		m = {
			name = "Packer",
			p = { "<cmd>runtime lua/zmw/plugins.lua | PackerSync<cr>", "Source and Sync Plugins" },
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		g = {
			name = "Git",
			g = { "<cmd>Git<CR>", "Fugitive" },
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
			P = { "<cmd>Git push<CR>", "Push" },
		},
		b = {
			name = "Buffers",
			b = { "<cmd>Telescope buffers<cr>", "List" },
			p = { "<cmd>BufferLinePick<CR>", "Pick" },
			q = { "<cmd>bdelete!<CR>", "Close Current" },
			c = { "<cmd>BufferLinePickClose<CR>", "Close Pick" },
			l = { "<cmd>BufferLineCloseRight<CR>", "Close buffers to the RIGHT" },
			h = { "<cmd>BufferLineCloseLeft<CR>", "Close buffers to the LEFT" },
			o = { "<cmd>%bd|e#|bd#<CR>|'\"", "Close all buffers but current" },
			s = {
				name = "Sort By",
				e = { "<cmd>BufferLineSortByExtension<CR>", "Extension" },
				d = { "<cmd>BufferLineSortByDirectory<CR>", "Directory" },
				r = { "<cmd>BufferLineSortByRelativeDirectory<CR>", "Relative Directory" },
				t = { "<cmd>BufferLineSortByTabs<CR>", "Tabs" },
			},
		},
		t = {
			name = "Tab page",
			n = { "<cmd>tab split<CR>", "New with current buffer" },
			t = { "<cmd>tabnext<CR>", "Next" },
			T = { "<cmd>tabprevious<CR>", "Previous" },
			q = { "<cmd>tabclose<CR>", "Close current" },
			o = { "<cmd>tabonly<CR>", "Close all but current" },
		},
		n = {
			name = "Obsidian Notes",
			q = { "<cmd>ObsidianQuickSwitch<CR>", "Quick Switch" },
			s = { "<cmd>ObsidianSearch<CR>", "Search" },
			n = { "<cmd>ObsidianNew<CR>", "New" },
			t = { "<cmd>ObsidianToday<CR>", "Note for TODAY (open or create)" },
			y = { "<cmd>ObsidianYesterday<CR>", "Note for YESTERDAY (open or create)" },
			o = { "<cmd>ObsidianOpen<CR>", "Open in the Obsidian App" },
		},
	}
	which_key.register(mappings, opts)
end

local function register_clipboard_mappings(which_key)
	local normal_visual = {
		d = { [["+d]], "delete to clipboard" },
		p = { [["+p]], "paste from clipboard (after)" },
		P = { [["+P]], "paste from clipboard (before)" },
		y = { [["+y]], "yank to clipboard" },
	}

	local normal_only = {
		D = { [["+d$]], "delete to clipboard (d$)" },
		Y = { [["+y$]], "yank to clipboard (y$)" },
	}

	which_key.register(normal_only, { prefix = "<leader>", mode = "n" })
	which_key.register(normal_visual, { prefix = "<leader>", mode = "n" })
	which_key.register(normal_visual, { prefix = "<leader>", mode = "x" })
end

function M.setup()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	setup_opts(which_key)
	register_mappings(which_key)
	register_clipboard_mappings(which_key)
end

return M
