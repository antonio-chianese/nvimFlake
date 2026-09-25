local utils = require("config.utils")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = utils.lsps,
  callback = function(args)
    -- local disable = { "oil", "man", "directory", "log" }

    if vim.tbl_contains(disable, args.match) then
      return
    end

    vim.treesitter.start()
    -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- vim.wo[0][0].foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md" },
  desc = "Enable spell checking and autoformatting for certain filetypes",
  callback = function()
    -- Wrap:
    -- vim.opt_local.wrap = true
    -- -- vim.opt_local.linebreak = true
    -- vim.opt_local.breakindent = true
    -- vim.o.textwidth = 80

    -- Spell:
    vim.opt.spell = true
    -- :h fo-table
    vim.opt.formatoptions = "atrwnal1]cjp"
    -- vim.o.spelllang = { "en_us", "it_it" }
    vim.opt.spelllang = "en,it"
  end,
})
