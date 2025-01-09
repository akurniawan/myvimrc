-- lua/plugins/init.lua
return {
	-- Core plugin configurations
	require("plugins.aerial"),
	require("plugins.flash"),
	require("plugins.toggleterm"),
	require("plugins.undotree"),
	require("plugins.sg"),
	require("plugins.nvim-tree"),
	-- require("plugins.jukit"),
	require("plugins.editor"), -- Load UI plugins first
	require("plugins.lsp"), -- LSP configurations
	require("plugins.completion"), -- Completion
	require("plugins.telescope"), -- Telescope
	require("plugins.treesitter"), -- Treesitter
	require("plugins.git"), -- Git plugins
}
