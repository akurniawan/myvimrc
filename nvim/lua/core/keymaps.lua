local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keymaps for better default experience
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Window navigation
-- hack to move ctrl+l for netrw plugin
keymap("n", "<leader>r", "<Plug>NetrwRefresh", { noremap = false })
keymap("n", "<C-h>", "<C-w>h", { noremap = true })
keymap("n", "<C-j>", "<C-w>j", { noremap = true })
keymap("n", "<C-k>", "<C-w>k", { noremap = true })
keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- Save with kj
keymap("i", "kj", "<C-c>:w<CR>", opts)

-- File explorer
keymap("n", "<leader>pv", vim.cmd.Ex, opts)
keymap("n", "<leader>go", ":cd %:h<CR>", { desc = "Set CWD to current file's directory" })

-- Moving lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Centered movements
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Clipboard operations
keymap("x", "<leader>p", '"_dP', opts)

-- Search and replace current word
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>", opts)

-- Clear search highlight with Enter
keymap("n", "<CR>", [[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], { silent = true, expr = true })

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_option("clipboard", "unnamed")

-- fterm shortcuts
vim.keymap.set("n", "<leader>t", ":FloatermToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })

-- Cody Related shortcuts
-- Create a function to handle ask_range with visual selection
function ask_range()
	-- Get the current buffer number
	local bufnr = vim.api.nvim_get_current_buf()

	-- Get the start and end positions of the visual selection
	local start_pos = vim.fn.getpos("'<") -- Start position of the selection
	local end_pos = vim.fn.getpos("'>") -- End position of the selection

	-- Extract the line numbers from the positions
	local start_line = start_pos[2]
	local end_line = end_pos[2]

	-- Prompt the user for their question
	local question = vim.fn.input("Ask Cody: ")

	if question ~= "" then
		-- Call ask_range with the selection and question
		require("sg.cody.commands").ask_range(bufnr, start_line, end_line, question)
	end
end

-- Map it to a key combination in VISUAL mode
-- Here we use <leader>ca (you can change this to whatever you prefer)
vim.keymap.set(
	"x",
	"<leader>ca",
	":lua ask_range()<CR>",
	{ desc = "Cody: Ask about selection", noremap = true, silent = true }
)
