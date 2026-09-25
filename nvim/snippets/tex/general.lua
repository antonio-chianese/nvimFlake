local u = dofile(vim.fn.expand("~/Documents/_to-order/nvimFlake/nvim/snippets/utils.lua"))
local s, f, t, i, d, fmt, get_visual, in_tabular, in_itemize, in_enumerate, in_description =
	u.s, u.f, u.t, u.i, u.d, u.fmt, u.get_visual, u.in_tabular, u.in_itemize, u.in_enumerate, u.in_description

-- s({
--   trig = "",
--   name = "",
--   desc = "",
--   wordTrig = true, -- Boolean ([%w_]+)
--   regTrig = false, -- Boolean
--   -- trigEngine =
--   priority = 1000,
--   snippetType = "autosnippet", -- `snippet` or `autosnippet`
-- }, {
--   -- t("")
-- })

return {
	s({ trig = "it", name = "textit" }, fmt("\\textit{<>}<>", { d(1, get_visual), i(0) })),

	s({
		trig = "bf",
		name = "textbf",
	}, fmt("\\textbf{<>}<>", { d(1, get_visual), i(0) })),

	s(
		{
			trig = "^dc",
			wordTrig = false,
			regTrig = true,
			name = "Document",
		},
		fmt(
			[[
	       \documentclass{article}

	       \input{~/Documents/university/preamble.tex}

	       \title{<>}
	       \author{<>}
	       \date{\today}

	       \begin{document}
	         \maketitle

	         <>

	       \end{document}
	    ]],
			{ i(1, "title"), i(2, "Antonio Chianese"), i(0) }
		)
	),

-- L'ordine è importante tra in_description e in_itemize

	s({
		trig = "^\\s*- ",
		trigEngine = "ecma",
		name = "new description item",
		condition = in_description,
		snippetType = "autosnippet",
	}, {
		t("  \\item["),
		i(1),
		t("] "),
		i(0),
	}),

	s({
		trig = "^\\s*- ",
		trigEngine = "ecma",
		name = "new item",
		condition = function()
			return in_itemize or in_enumerate
		end,
		snippetType = "autosnippet",
	}, {
		t("  \\item "),
	}),

	s({
		trig = "^\\s*---",
		trigEngine = "ecma",
		name = "hline",
		condition = in_tabular,
		snippetType = "autosnippet",
	}, {
		t("    \\hline "),
	}),

	s(
		{
			trig = "^scs",
			trigEngine = "ecma",
			name = "section",
			snippetType = "autosnippet",
		},
		fmt(
			[[
	    \section{<>}
	    <>
	  ]],
			{ i(1), i(0) }
		)
	),

	s(
		{
			trig = "^sbs",
			trigEngine = "ecma",
			name = "subsection",
			snippetType = "autosnippet",
		},
		fmt(
			[[
	    \subsection{<>}
	    <>
	  ]],
			{ i(1), i(0) }
		)
	),

	s(
		{
			trig = "^chp",
			trigEngine = "ecma",
			name = "chapter",
			snippetType = "autosnippet",
		},
		fmt(
			[[
	    \chapter{<>}
	    <>
	  ]],
			{ i(1), i(0) }
		)
	),

	s(
		{
			trig = "ms",
			name = "medskip",
			snippetType = "autosnippet",
		},
    { t("\\medskip") }
	),

	s(
		{
			trig = "(.*?)\\.\\.\\.",
			trigEngine = "ecma",
			name = "ldots",
			snippetType = "autosnippet",
		},
    fmt(
      "<>\\ldots", {
        f(function(_, snip)
          return snip.captures[1]
        end),
      }
    )
	),
}
