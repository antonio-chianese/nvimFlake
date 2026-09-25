return {
  "luasnip",
  after = function()
    vim.notify("LUASNIP AFTER ESEGUITO")

    local opts = {
			delete_check_events = "TextChanged",
			region_check_events = "InsertEnter",
			link_children = true,
			link_roots = false,
			keep_roots = true,
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
    }

    local ls = require("luasnip")

    -- ls.setup(opts)
    ls.config.set_config(opts)
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { "~/Documents/_to-order/nvimFlake/nvim/snippets", "~/Documents/current-root/current-course/snippets" },
    })

		vim.keymap.set({ "i" }, "<C-j>", function() ls.jump(1) end, { silent = true })
		vim.keymap.set({ "i" }, "<C-k>", function() ls.jump(-1) end, { silent = true })
		vim.keymap.set({ "i" }, "<C-e>", function() ls.expand() end, { silent = true })
  end,
}
