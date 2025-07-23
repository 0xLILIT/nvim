return {
	"neovim/nvim-lspconfig",
	opts = {},
	config = function()
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
		vim.lsp.enable({ "jdtls", "cssls", "html", "lua_ls", "ts_ls" })
	end,
}
