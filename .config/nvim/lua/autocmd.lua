local function file_exists(name)
	local path = vim.fn.expand("%:p:h")
	path = path .. "/" .. name

	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

-- store env variables in env.lua and load them on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if file_exists("env.lua") then
			vim.api.nvim_command("source env.lua")
		end
	end,
})
