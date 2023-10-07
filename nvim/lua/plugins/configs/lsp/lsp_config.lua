local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
    underline = true,
    virtual_text = {
        prefix = "",
        format = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return "  " .. diagnostic.message
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                return "  " .. diagnostic.message
            end
            return nil
        end,
    },

    signs = {
        severity = vim.diagnostic.severity.ERROR,
    },
    float = { severity_sort = true, border = "rounded" },
    update_in_insert = true,
    severity_sort = true,
}

-- Jump directly to the first available definition every time.
vim.lsp.handlers["textDocument/definition"] = function(_, result)
    if not result or vim.tbl_isempty(result) then
        print "[LSP] Could not find definition"
        return
    end

    if vim.tbl_islist(result) then
        vim.lsp.util.jump_to_location(result[1], "utf-8", true)
    else
        vim.lsp.util.jump_to_location(result, "utf-8", true)
    end
end

vim.api.nvim_create_user_command("LspLog", function()
    local path = vim.lsp.get_log_path()
    vim.cmd("tabedit " .. path)
end, { force = true, nargs = 0 })

vim.api.nvim_create_user_command("LspCCapabilitiesapabilities", function()
	local curBuf = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_active_clients { bufnr = curBuf }

	for _, client in pairs(clients) do
		if client.name ~= "null-ls" then
			local capAsList = {}
			for key, value in pairs(client.server_capabilities) do
				if value and key:find("Provider") then
					local capability = key:gsub("Provider$", "")
					table.insert(capAsList, "- " .. capability)
				end
			end
			table.sort(capAsList) -- sorts alphabetically
			local msg = "# " .. client.name .. "\n" .. table.concat(capAsList, "\n")
			vim.notify(msg, vim.log.levels.TRACE, {
				on_open = function(win)
					local buf = vim.api.nvim_win_get_buf(win)
					vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
				end,
				timeout = 14000,
			})
			vim.fn.setreg("+", "Capabilities = " .. vim.inspect(client.server_capabilities))
		end
	end
end, {})
