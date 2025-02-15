-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local nvim_keymap = vim.api.nvim_set_keymap
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

-- Save with kj
keymap("i", "kj", "<Esc><cmd>w<CR>", opts)

-- File explorer
keymap("n", "<leader>pv", vim.cmd.Ex, opts)
keymap("n", "<leader>go", ":cd %:h<CR>", { desc = "Set CWD to current file's directory" })

-- Moving lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Moving to start and end of sentences
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- Centered movements
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Clipboard operations
keymap("x", "<leader>p", '"_dP', opts)

-- Search and replace current word
keymap("n", "<leader>sw", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>", opts)

-- Clear search highlight with Enter
keymap("n", "<CR>", [[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], { silent = true, expr = true })

-- Remap enter for jukit
keymap("n", "<s-cr>", ":call jukit#send#line()<CR>", { noremap = true, silent = true })

-- Allow clipboard copy paste in neovim
nvim_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
nvim_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
nvim_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
nvim_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- -- Cody Related shortcuts
-- -- Create a function to handle ask_range with visual selection
-- function ask_range()
--   -- Get the current buffer number
--   local bufnr = vim.api.nvim_get_current_buf()
--
--   -- Get the start and end positions of the visual selection
--   local start_pos = vim.fn.getpos("'<") -- Start position of the selection
--   local end_pos = vim.fn.getpos("'>") -- End position of the selection
--
--   -- Extract the line numbers from the positions
--   local start_line = start_pos[2]
--   local end_line = end_pos[2]
--
--   -- Prompt the user for their question
--   local question = vim.fn.input("Ask Cody: ")
--
--   if question ~= "" then
--     -- Call ask_range with the selection and question
--     require("sg.cody.commands").ask_range(bufnr, start_line, end_line, question)
--   end
-- end
--
-- -- Map it to a key combination in VISUAL mode
-- -- Here we use <leader>ca (you can change this to whatever you prefer)
-- keymap("x", "<leader>ca", ":lua ask_range()<CR>", { desc = "Cody: Ask about selection", noremap = true, silent = true })

-- refactoring keymaps
keymap("x", "<leader>re", function()
  require("refactoring").refactor("Extract Function")
end)
keymap("x", "<leader>rf", function()
  require("refactoring").refactor("Extract Function To File")
end)
-- Extract function supports only visual mode
keymap("x", "<leader>rv", function()
  require("refactoring").refactor("Extract Variable")
end)
-- Extract variable supports only visual mode
keymap("n", "<leader>rI", function()
  require("refactoring").refactor("Inline Function")
end)
-- Inline func supports only normal
keymap({ "n", "x" }, "<leader>ri", function()
  require("refactoring").refactor("Inline Variable")
end)
-- Inline var supports both normal and visual mode
keymap("n", "<leader>rb", function()
  require("refactoring").refactor("Extract Block")
end)
-- Extract block supports only normal mode
keymap("n", "<leader>rbf", function()
  require("refactoring").refactor("Extract Block To File")
end)

-- Remapping for window sizign
keymap("n", "<M-h>", ":vertical resize -5<CR>")
keymap("n", "<M-l>", ":vertical resize +5<CR>")
