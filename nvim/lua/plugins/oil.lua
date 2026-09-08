return {
  "oil.nvim",

  keys = {
    { "<leader>o", function() require('oil').toggle_float( nil, { preview = { horizontal = true, }, } ) end, desc = "Oil toggle float" },
    -- { "<leader>o", function() require('oil').toggle_float() end, desc = "Oil toggle float" },
    { "<leader>e", "<cmd>edit .<CR>", desc = "Oil file manager" },
  },

  -- dependencies: nvim-web-devicons

  -- before = function()
  --   require("lz.n").trigger_load("nvim-web-devicons")
  -- end,

  after = function()

    require('oil').setup({

      default_file_explorer = true,

      keymaps = {
        [ "<CR>" ] = {
	  callback = function()
	    local oil = require('oil')
	    local entry = oil.get_cursor_entry()

	    if not entry then
	      return
	    end

	    require('oil.actions').select.callback()

	    if entry.type == "directory" then
	      vim.defer_fn(function()
	        require('oil.actions').cd.callback()
	      end, 10)
	    end
	  end,
	},
      },

      columns = {
	-- :h oil-columns

        { "permissions", align = "right" },
	"icon",
        -- { "birthtime", align = "right", format = "%d-%m-%y %T" },
      },

      float = {
        preview_split = "below",
	-- border = "rounded", -- single
	border = {
	  { " ", "FloatBorder" },
	  { "─", "FloatBorder" },
	  { " ", "FloatBorder" },
	  { " ", "FloatBorder" },
	  { " ", "FloatBorder" },
	  { " ", "FloatBorder" },
	  { " ", "FloatBorder" },
	  { " ", "FloatBorder" },
	},
      },

    })
  end,
}
