vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		vim.cmd.redrawstatus()
	end,
})

vim.opt.statusline = "%!v:lua.StatusLine()"
function _G.StatusLine()
	local function bufferList()
		local buffers = {}
		for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_get_option(bufnr, "buflisted") then
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				bufname = vim.fn.fnamemodify(bufname, ":t")

				local active = (bufnr == vim.api.nvim_get_current_buf()) and "%#PmenuSel#" or ""
				local modified = vim.api.nvim_buf_get_option(bufnr, "modified") and "*" or ""

				table.insert(buffers, string.format("%s[%d %s%s]%%#Normal#", active, bufnr, bufname, modified))
			end
		end

		return table.concat(buffers, "")
	end

	local function curMode()
		local modes = {
			n = "NORMAL",
			no = "O-PENDING",
			o = "O-PENDING",
			v = "VISUAL",
			V = "VISUAL LINE",
			s = "SELECT",
			S = "SELECT LINE",
			i = "INSERT",
			R = "REPLACE",
			c = "CMD",
			["!"] = "SHELL",
			t = "TERMINAL",
		}

		return modes[vim.api.nvim_get_mode().mode] or "-"
	end

	local function attachedClients()
		local clients = {}
		for _, client in ipairs(vim.lsp.get_clients()) do
			table.insert(clients, client["name"])
		end
		return table.concat(clients, " ")
	end

	local function clock()
		return vim.fn.strftime("%H:%M")
	end

	local modules = {}
	table.insert(modules, " ")
	table.insert(modules, curMode())
	table.insert(modules, " ")
	table.insert(modules, bufferList())
	table.insert(modules, "%=")
	table.insert(modules, attachedClients())
	table.insert(modules, "%#StatusLine#%s ")
	table.insert(modules, clock())
	table.insert(modules, " ")
	return table.concat(modules, "")
end
