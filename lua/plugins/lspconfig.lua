return {
	"neovim/nvim-lspconfig",
	opts = {},
	config = function()
		-- vim.lsp.enable({ "denols", "clangd", "jdtls", "cssls", "html", "lua_ls", "ts_ls" })
		vim.lsp.enable({ "clangd", "jdtls", "cssls", "html", "lua_ls", "ts_ls" })
	end,
}
