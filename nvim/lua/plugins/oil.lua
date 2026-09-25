return {
  {
    "nvim-web-devicons"
  },
  {
    "oil.nvim",

    keys = {
      { "<leader>o", function() require('oil').toggle_float( nil, { preview = { horizontal = true, }, } ) end, desc = "Oil toggle float" },
      { "<leader>e", "<cmd>edit .<CR>", desc = "Oil file manager" },
    },

    -- dependencies: nvim-web-devicons

    after = function()
      vim.o.autochdir = true

      require('oil').setup({

        default_file_explorer = true,
        watch_for_changes = true,

        columns = {
          { "permissions", align = "right" },
          "icon",
          -- { "birthtime", align = "right", format = "%d-%m-%y %T" },
        },

        float = {
          preview_split = "below",
        },
      })
    end,
  }
}
