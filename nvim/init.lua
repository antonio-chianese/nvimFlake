-- map leader must be set before loading lazy!
vim.g.mapleader = " "

-- repo: https://github.com/lumen-oss/lz.n

-- Nice plugins:
--   https://github.com/kevinhwang91/nvim-ufo

require("lz.n").load("plugins")
require("config.init")

vim.cmd.colorscheme("gruvbox-material")
