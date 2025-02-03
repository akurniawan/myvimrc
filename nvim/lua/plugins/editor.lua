return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        auto_open = false, -- This will prevent Neo-tree from auto-opening on startup
      },
    },
  },
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
}
