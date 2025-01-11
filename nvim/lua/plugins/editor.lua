return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false,
	},
	{
		"echasnovski/mini.icons",
		lazy = false,
	},
	"tpope/vim-sleuth",
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_enable_bold = "1"
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "gruvbox-material",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 2,
					},
				},
			},
		},
	},
	--[[ {
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	}, ]]
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")

			-- Register which-key groups for normal mode
			wk.add({
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>h", group = "Git [H]unk" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>w", group = "[W]orkspace" },
			})

			-- Register which-key VISUAL mode mappings
			wk.add({
				{ "<leader>", group = "VISUAL <leader>", mode = "v" },
				{ "<leader>h", desc = "Git [H]unk", mode = "v" },
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	--[[ {
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

			require("fine-cmdline").setup({
				cmdline = {
					enable_keymaps = true,
					smart_history = true,
					prompt = ": ",
				},
				popup = {
					position = {
						row = "10%",
						col = "50%",
					},
					size = {
						width = "60%",
					},
					border = {
						style = "rounded",
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
			})
		end,
	}, ]]
}
