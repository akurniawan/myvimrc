return {
	-- you can enable a plugin with just its name
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				-- Add this hover config
				hover = {
					enabled = true,
					view = "hover", -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				-- Add message handling
				message = {
					enabled = true,
					view = "notify",
					opts = { replace = true, level = "error" },
				},
				-- Add signature config
				signature = {
					enabled = true,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
					view = "hover", -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
			},
			cmdline = {
				enabled = true,
				view = "cmdline_popup", -- classic | cmdline_popup
				opts = {}, -- global options for the cmdline
				format = {
					-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
				},
			},
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				enabled = true, -- enables the Noice messages UI
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			popupmenu = {
				enabled = true, -- enables the Noice popupmenu UI
				backend = "nui", -- backend to use to show regular cmdline completions
			},
			notify = {
				-- Noice can be used as `vim.notify` so you can route any notification like other messages
				enabled = true,
				view = "notify",
				opts = {
					replace = false,
					merge = false,
					timeout = 3000,
				},
			},
			commands = {
				history = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {
						any = {
							{ event = "notify" },
							{ error = true },
							{ warning = true },
							{ event = "msg_show", kind = { "" } },
							{ event = "lsp", kind = "message" },
						},
					},
				},
			},
			routes = {
				-- Hide written messages
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
				-- Hide search virtual text
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = { skip = true },
				},
        {
          filter = {
            event = "lsp",
            kind = "diagnostics",
          },
          view = "notify",
          opts = { level = "error" }
        },
        {
          filter = {
            event = "vim.diagnostic",
          },
          view = "notify",
          opts = { level = "error" }
        },
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
