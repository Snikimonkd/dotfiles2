-- remap leader key to space
vim.g.mapleader = " "

-- amount of lines to screan edge
vim.opt.scrolloff = 7

-- for tests
vim.g["test#neovim#start_normal"] = 1

-- eng as default
vim.cmd("language en_US.utf-8")

-- relative line number
vim.wo.rnu = true

-- absolut current line number
vim.wo.nu = true
-- disable eof symbols
vim.api.nvim_command("set fillchars=eob:\\ ")

-- highlight current line
vim.wo.cursorline = true

-- copy to clipboard
vim.opt.clipboard = "unnamedplus"

-- tab = 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true

-- ignore case while searching
vim.opt.ignorecase = true
-- do not ignore case if upper case
vim.opt.smartcase = true

-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- vim.cmd.set("noruler")

-- stop comments
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

vim.o.numberwidth = 4

-- statusline always max width and on the bottom
vim.o.laststatus = 3
vim.o.showmode = false

-- just the most usefull stuf from vim kickstart
vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")

-- column for diagnostic not moving
vim.opt.signcolumn = "yes"
