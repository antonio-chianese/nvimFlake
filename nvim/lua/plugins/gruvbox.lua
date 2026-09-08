return {
  "gruvbox.nvim",
  colorscheme = "gruvbox",

  keys = {
    { "<leader>p", "<cmd>lua print(vim.inspect(require('gruvbox').palette))<CR>", desc = "Show palette" },
    -- { "<leader>p", "<cmd>lua vim.fn.writefile(vim.inspect(require('gruvbox').palette), vim.fn.expand('%:h') .. '/palette.lua')<CR>", desc = "Save palette" },
  },

  after = function()
    vim.o.background = "dark"

    require("gruvbox").setup({

      transparent_background = true,
      palette_overrides = {
        bright_green = "#a9b665",
        dark0 = "#1d2121", -- #3d4b3d
        dark1 = "#1d2121", -- #3c3836
        bright_orange = "#b66375",
	bright_yellow = "#a9b665",
	bright_red = "#ca4e4e",

        -- dark0_hard = "#1d2121",
        -- dark0_soft = "#1d2121",
      }

    })
  end,
}
