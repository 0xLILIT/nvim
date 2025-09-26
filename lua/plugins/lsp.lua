return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.lsp.enable({ "kotlin_language_server", "clangd", "jdtls", "cssls", "html", "lua_ls", "ts_ls" })
	end,
}
