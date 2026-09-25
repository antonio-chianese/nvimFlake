-- Visual style:
vim.opt.wrap = false                -- long lines wrap and continue on the next line
vim.opt.colorcolumn = "80"          -- columns to highlight
vim.opt.cursorline = false           -- highlight the screen line of the cursor

vim.opt.list = true                 -- show <Tab> and <EOL>
vim.opt.listchars = {
  tab = "| ",
  trail = "-",
  lead = "·",
  leadmultispace = "| "
}                                   -- characters for displaying in list mode

vim.opt.winborder = "rounded"       -- border of floating windows inside neovim

vim.opt.number = true               -- print the line number in front of each line
vim.opt.relativenumber = true       -- number of columns used for the line number
vim.opt.scrolloff = 5               -- minimum nr. of lines above and below cursor
vim.opt.sidescroll = 5              -- minimum number of columns to scroll horizontal

vim.opt.ruler = false               -- show cursor line and column in the status line
vim.opt.cmdheight = 0               -- number of lines to use for the command-line

-- Indent:
-- vim.opt.smartindent = true -- smart autoindenting for C programs
vim.opt.autoindent = true           -- take indent for new line from previous line
vim.opt.copyindent = true           -- make 'autoindent' use existing indent structure

-- Comfort:
vim.opt.autoread = true             -- autom. read file when changed outside of Vim
-- vim.opt.autowrite = true -- automatically write file if changed

-- Note: Consider calling |:syncbind| on |WinResized|, |WinEnter| events
-- (scoped to relevant buffers).
-- vim.opt.scrollbind = true           -- scroll in window as other windows scroll

vim.opt.clipboard = "unnamedplus"   -- use the clipboard as the unnamed register
-- vim.opt.expandtab = false -- default

vim.opt.shell = "bash"              -- name of shell to use for external commands

vim.opt.smoothscroll = true         -- scroll by screen lines when 'wrap' is set

vim.opt.splitbelow = true           -- new window from split is below the current one
vim.opt.splitright = true           -- new window is put right of the current one

vim.opt.confirm = true              -- ask what to do about unsaved/read-only files

-- Format comments with "gq"
vim.opt.formatoptions = "cr1]jp"    -- how automatic formatting is to be done

-- Search:
vim.opt.ignorecase = true           -- ignore case in search patterns
vim.opt.smartcase = true            -- no ignore case when pattern has uppercase

-- Tab:
local width = 2

vim.opt.shiftwidth = width          -- number of spaces to use for (auto)indent step
vim.opt.smarttab = true             -- <Tab> in leading whitespace indents by 'shiftwidth'
vim.opt.tabstop = width             -- number of columns between two tab stops
vim.opt.softtabstop = width         -- number of columns between two soft tab stops
vim.opt.expandtab = true            -- use spaces when <Tab> is inserted
