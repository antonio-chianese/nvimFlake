local u = dofile(vim.fn.expand("~/Documents/_to-order/nvimFlake/nvim/snippets/utils.lua"))
local s, sn, t, i, d, fmt, rep, get_visual = u.s, u.sn, u.t, u.i, u.d, u.fmt, u.rep, u.get_visual

return {
	s(
		{
			trig = "^env",
			trigEngine = "ecma",
			snippetType = "autosnippet",
		},
		fmt(
			[[
        \begin{<>}
          <>
        \end{<>}<>
      ]],
			{ i(1), i(2), rep(1), i(0) }
		)
	),

	s(
		{
			trig = "cnt",
			snippetType = "autosnippet",
		},
		fmt(
			[[
        \begin{center}
          <>
        \end{center}
        <>
      ]],
			{ i(1), i(0) }
		)
	),

	s(
		{
			trig = "tbx",
			snippetType = "autosnippet",
		},
		fmt(
			[[
			\begin{table}[h]
        \begin{tabularx}{\textwidth}{<>}
          <>
        \end{tabularx}
      \end{table}<>
      ]],
			{ i(2), i(1), i(0) }
		)
	),

	s(
		{
			trig = "tbt",
			snippetType = "autosnippet",
		},
		fmt(
			[[
			\begin{table}[h]
			  \centering
        \begin{tabular}{<>}
          <>
        \end{tabular}
        \caption{<>}
      \end{table}<>
      ]],
			{ i(2), i(1), i(3), i(0) }
		)
	),

	s(
		{
			trig = "tm",
			name = "itemize",
			snippetType = "autosnippet",
		},
		fmt(
			[[
	       \begin{itemize}
	         \item <>
	       \end{itemize}
	       <>
	    ]],
			{ i(1), i(0) }
		)
	),

	s(
		{
			trig = "dsd",
			name = "description",
			snippetType = "autosnippet",
		},
		fmt(
			[[
	       \begin{description}
	         \item[<>] <>
	       \end{description}
	       <>
	    ]],
			{ i(1), i(2), i(0) }
		)
	),

	s(
		{
			trig = "enm",
			name = "enumerate",
			snippetType = "autosnippet",
		},
		fmt(
			[[
	       \begin{enumerate}
	         \item <>
	       \end{enumerate}
	       <>
	     ]],
			{ i(1), i(0) }
		)
	),
}
