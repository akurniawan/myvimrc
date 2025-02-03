-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Terminal window size
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,

      on_open = function(term)
        -- Map Alt + Left/Right for word movement
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<A-Left>", "<C-\\><C-n>bi", { noremap = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<A-Right>", "<C-\\><C-n>wi", { noremap = true })

        -- Map Command + Left/Right for line start/end
        -- Note: <D-> represents CMD key on macOS
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<D-Left>", "<C-\\><C-n>0i", { noremap = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<D-Right>", "<C-\\><C-n>$i", { noremap = true })
      end,

      -- Window settings
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",

      -- Float window settings
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Keymaps
    local opts = { noremap = true, silent = true }

    -- Toggle terminal from both normal and terminal mode with <C-\>
    vim.keymap.set({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
    -- Split terminals (when in terminal mode)
    vim.keymap.set("t", "<C-w>h", "<cmd>ToggleTerm direction=vertical<CR>", opts) -- Split terminal horizontally
    vim.keymap.set("t", "<C-w>v", "<cmd>ToggleTerm direction=vertical<CR>", opts) -- Split terminal vertically

    -- Terminal navigation
    function _G.set_terminal_keymaps()
      local terminal_opts = { buffer = 0 }
      -- Exit terminal mode
      vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], terminal_opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], terminal_opts)
      -- Window navigation from terminal
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], terminal_opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], terminal_opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], terminal_opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], terminal_opts)
    end

    -- Auto command to set terminal keymaps when terminal opens
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
