local k = vim.keymap

-- open file tree
k.set("n", "<leader>t", ":NvimTreeToggle<CR>")
-- open file tree on current file
k.set("n", "<leader>T", ":NvimTreeFindFile<CR>")

-- close buffer wihtout closing of the window
k.set("n", "<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>")
-- prev buffer
k.set("n", "<S-Tab>", ":bprev<CR>")
-- next buffer
k.set("n", "<Tab>", ":bnext<CR>")

-- Clear search highlighting with esc
k.set("n", "<Esc>", ":noh <CR>")

-- generate unit test
k.set("n", "<leader>ut", ":GoTestAdd<CR>")

-- run nearest test
k.set("n", "<leader>gt", ":TestNearest -strategy=neovim<CR>")

-- generate uuid and past undder the cursor (very usefull in tests)
k.set("n", "<leader>uu", function()
	local pos = vim.api.nvim_win_get_cursor(0)

	local command = "uuidgen | tr '[:upper:]' '[:lower:]'"

	io.stdout:setvbuf("no")
	local handle = io.popen(command, "r")
	local result = ""
	if handle then
		handle:flush()
		result = handle:read("*all")
		handle:close()
		result = string.gsub(result, "\r", "")
		result = string.gsub(result, "\n", "")
		vim.api.nvim_buf_set_text(0, pos[1] - 1, pos[2], pos[1] - 1, pos[2], { result })
	else
		vim.print("something went wrong with uuidgen")
	end
end)

k.set("n", "<leader>c", "<Plug>RestNvim<cr>")
k.set("n", "<leader>pp", "<Plug>RestNvimPreview")

-- vertical split
k.set("n", "<leader>v", ":vsplit<CR>")

-- Copy relative path
vim.api.nvim_create_user_command("CRpath", function()
	local path = vim.fn.expand("%:p:.")
	vim.fn.setreg("+", path)
	vim.notify(path)
end, {})
k.set("n", "<leader>rp", ":CRpath<CR>")

-- znemode
k.set("n", "<leader>zm", ":Zenmode 30<CR>")

local builtin = require("telescope.builtin")
-- diagnostics
k.set("n", "<leader>dd", builtin.diagnostics, {})
-- find file
k.set("n", "<leader>F", builtin.find_files, {})
-- find text in all files
k.set("n", "<leader>f", builtin.live_grep, {})
-- browse open buffers
k.set("n", "<leader>bf", builtin.buffers, {})
-- git status
k.set("n", "<leader>gs", builtin.git_status, {})
-- lsp references
k.set("n", "gr", builtin.lsp_references, {})
-- lsp implementations
k.set("n", "gi", builtin.lsp_implementations, {})
-- git conflicts
k.set("n", "<leader>lc", ":Telescope conflicts<CR>", {})

-- go generate current file
k.set("n", "<leader>gg", ":GoGenerate %<CR>")

-- add json tags
k.set("n", "<leader>at", ":GoTagAdd json<CR>")

-- open files redactor
k.set("n", "-", "<CMD>Oil --float<CR>")

k.set("n", "Ó", "<C-w>h")
k.set("n", "Ô", "<C-w>j")
k.set("n", "", "<C-w>k")
k.set("n", "Ò", "<C-w>l")

k.set("n", "<A-h>", "<C-w>h")
k.set("n", "<A-j>", "<C-w>j")
k.set("n", "<A-k>", "<C-w>k")
k.set("n", "<A-l>", "<C-w>l")
