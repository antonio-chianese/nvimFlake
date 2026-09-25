local u = dofile(vim.fn.expand("~/Documents/_to-order/nvimFlake/nvim/snippets/utils.lua"))
local s, i, d, f, fmt, mathzone, get_visual, get_parenthesis = u.s, u.i, u.d, u.f, u.fmt, u.mathzone, u.get_visual, u.get_parenthesis
local t = u.t

-- Functions
local m = function(name, trig, expand, dict)
	dict = dict or {}

	table.insert(
		dict,
		1,
		f(function(_, snip)
			return snip.captures[1]
		end)
	)

	return s({
		trig = trig,
		wordTrig = false,
		regTrig = true,
		condition = mathzone,
		name = name,
		snippetType = "autosnippet",
	}, fmt("<>" .. expand, dict))
end

local me = function(name, trig, expand, dict)
	dict = dict or {}

	table.insert(
		dict,
		1,
		f(function(_, snip)
			return snip.captures[1]
		end)
	)

	return s({
		trig = trig,
		wordTrig = false,
		regTrig = true,
		condition = mathzone,
		name = name,
	}, fmt("<>" .. expand, dict))
end

return {
	s({
		trig = "(%f[%w])mk",
		wordTrig = false,
		regTrig = true,
		name = "Inline math",
		snippetType = "autosnippet",
	}, fmt("$<>$<>", { i(1), i(0) })),

	s(
		{
			trig = "(%f[%w])dm",
			wordTrig = false,
			regTrig = true,
			name = "Display math",
			snippetType = "autosnippet",
		},
		fmt(
		  [[
        \[
          <>
        .\]
        <>
      ]], { i(1), i(0) })
	),

	-- Fractions
	s(
		{
			trig = "//",
			condition = mathzone,
			name = "fraction",
			snippetType = "autosnippet",
		},
		fmt("\\frac{<>}{<>}<>", {
			d(1, get_visual),
			i(2),
			i(0),
		})
	),

  -- TODO: Segfault error quando è presente sulla riga un multi-byte character
  -- (es. è, à, ...)
  -- Il problema è il trig.
	s(
		{
			trig = [[((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/]],
			trigEngine = "ecma",
			condition = mathzone,
			name = "fraction multiplication",
			snippetType = "autosnippet",
		},
		fmt("\\frac{<>}{<>}<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(0),
		})
	),

	s(
		{
			trig = [[(^.*\)/)]],
			trigEngine = "ecma",
			condition = mathzone,
			name = "fraction parenthesis",
			snippetType = "autosnippet",
		},
		fmt("<>{<>}<>", {
			f(get_parenthesis("\\frac{", "}")),
			i(1),
			i(0),
		})
	),

	s(
		{
			trig = [[(^.*\)\|d)]],
			trigEngine = "ecma",
			condition = mathzone,
			name = "underbracket",
			snippetType = "autosnippet",
		},
		fmt("<>_{<>}<>", {
			f(get_parenthesis("\\underbracket[0.4pt]{", "}", 2)),
			i(1),
			i(0),
		})
	),

	s(
		{
			trig = "|d",
			condition = mathzone,
			name = "underbracket v",
			snippetType = "autosnippet",
		},
		fmt("\\underbracket[0.4pt]{<>}_{<>}<>", {
			d(1, get_visual),
			i(2),
			i(0),
		})
	),

	s(
		{
			trig = [[(^.*\)\|u)]],
			trigEngine = "ecma",
			condition = mathzone,
			name = "overbracket",
			snippetType = "autosnippet",
		},
		fmt("<>^{<>}<>", {
			f(get_parenthesis("\\overbracket[0.4pt]{", "}", 2)),
			i(1),
			i(0),
		})
	),

	s(
		{
			trig = "|u",
			condition = mathzone,
			name = "overbracket v",
			snippetType = "autosnippet",
		},
		fmt("\\overbracket[0.4pt]{<>}^{<>}<>", {
			d(1, get_visual),
			i(2),
			i(0),
		})
	),

	s(
		{
			trig = "([A-Za-z])([\\d])",
      trigEngine = "ecma",
      wordTrig = false,
			condition = mathzone,
			name = "Indices",
			snippetType = "autosnippet",
		},
		fmt("<>_<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		})
	),

	s(
		{
			trig = "([A-Za-z])_([%d]+)",
			wordTrig = false,
			regTrig = true,
			condition = mathzone,
			name = "More indices",
			snippetType = "autosnippet",
		},
		fmt("<>_{<>}<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
			i(0),
		})
	),

	-- s(
	-- 	{
	-- 		trig = "([A-Z])([a-z])",
	-- 		wordTrig = false,
	-- 		regTrig = true,
	-- 		condition = mathzone,
	-- 		name = "Predicates",
	-- 		snippetType = "autosnippet",
	-- 	},
	-- 	fmt("<>(<>)<>", {
	-- 		f(function(_, snip)
	-- 			return snip.captures[1]
	-- 		end),
	-- 		f(function(_, snip)
	-- 			return snip.captures[2]
	-- 		end),
	-- 		i(0),
	-- 	})
	-- ),

	s(
		{
			trig = [[([A-Za-z0-9\)]+)sq]],
      trigEngine = "ecma",
			condition = mathzone,
			name = "^2",
			snippetType = "autosnippet",
		},
		fmt("<>^2<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(0),
		})
	),

	s(
		{
			trig = "([A-Za-z])cb",
			wordTrig = false,
			regTrig = true,
			condition = mathzone,
			name = "^3",
			snippetType = "autosnippet",
		},
		fmt("<>^3<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(0),
		})
	),

	s(
		{
			trig = "([A-Za-z])comp",
			wordTrig = false,
			regTrig = true,
			condition = mathzone,
			name = "complementar",
			snippetType = "autosnippet",
		},
		fmt("<>^{c}<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(0),
		})
	),

	s(
		{
			trig = "([A-Za-z0-9])tp",
			wordTrig = false,
			regTrig = true,
			condition = mathzone,
			name = "superscript",
			snippetType = "autosnippet",
		},
		fmt("<>^{<>}<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(0),
		})
	),

	s(
		{
			trig = "^csc",
			trigEngine = "ecma",
			name = "cases",
			snippetType = "autosnippet",
		},
    fmt(
      [[
        \[
          \begin{cases}
            <>
          \end{cases}
        \]
        <>
      ]],
      {
        i(1),
        i(0)
      }
    )
	),

	s(
		{
			trig = "csc",
			condition = mathzone,
			name = "cases",
			snippetType = "autosnippet",
		},
    fmt(
      [[
        \begin{cases}
          <>
        \end{cases}<>
      ]],
      {
        i(1),
        i(0)
      }
    )
	),

	s(
		{
			trig = "lgn",
			name = "align",
			snippetType = "autosnippet",
		},
    fmt(
      [[
        \begin{align*}
          <>
        \end{align*}<>
      ]],
      {
        i(1),
        i(0)
      }
    )
	),

	-- Lettere grece

	m("Alpha", "a;", "\\alpha "),
	m("Beta", "b;", "\\beta "),
	m("Gamma", "g;", "\\gamma "),
	m("Epsilon", "e;", "\\epsilon "),
	m("Lambda", "l;", "\\lambda "),
	m("Nu", "n;", "\\nu "),
	m("Omega", "o;", "\\omega "),
	m("Phi", "p;", "\\phi "),
	m("Pi", "pi", "\\pi "),
	m("Cdot", "*", "\\cdot "),

	-- Blocchi

	m("Square root", "sr", "\\sqrt{<>}<>", { i(1), i(0) }),
	m("Root", "rt", "\\sqrt[<>]{<>}<>", { i(1, "2"), i(2), i(0) }),

	m("Lim", "lim", "\\lim_{<>}{<>}<>", { i(1), i(2), i(3) }),
	m("Log", "log", "\\log_{<>}{<>}<>", { i(1), i(2), i(3) }),

	m("Sum", "sum", "\\sum_{k=<>}^{<>}<>", { i(1, "0"), i(2, "n"), i(3) }),

	-- m("Parentheses", "ap", "\\left(<>\\right) <>", { i(1), i(0) }),

	m("Min", "mn", "\\min\\left(<>\\right)<>", { i(1), i(0) }),
	m("Max", "mx", "\\max\\left(<>\\right)<>", { i(1), i(0) }),

	-- Corti

	m("Ge slanted", ">=", "\\geqslant "),
	m("Le slanted", "<=", "\\leqslant "),

	m("Logic or", "or", "\\vee "),
	m("Logic and", "nd", "\\wedge "),

	m("Seno", "sn", "\\sin "),
	m("Arcoseno", "asn", "\\arcsin "),

	m("Coseno", "cos", "\\cos "),
	m("Arcocoseno", "acs", "\\arccos "),

	m("Tangente", "tg", "\\tan "),
	m("Arcotangente", "atg", "\\arctan "),

	m("Prodotto cartesiano", "cp", "\\times "),
	m("In", "in", "\\in "),
	m("Not in", "ff", "\\notin "),
	m("ni", "ni", "\\ni "),
	m("Plus or minus", "pm", "\\pm "),
	m("Minus or plus", "mp", "\\mp "),
	m("Contenuto in stretto", "ssbs", "\\subset "),
	m("Contenuto in", "sbs", "\\subseteq "),
	m("Measured angle", "mangl", "\\measuredangle "),
	m("Exists", "ex", "\\exists "),
	m("For all", "fa", "\\forall "),
	m("Doesn't exist", "nex", "\\exists "),
	m("Tale che", "st", ": "),
	m("Infinity", "nf", "\\infty "),
	m("Implies", "lf", "\\implies "),

	m("Real numbers", "R", "\\R"),
	m("Natural numbers", "N", "\\N"),
	m("Integers", "Z", "\\Z"),
	me("Rational numbers", "Q", "\\Q"),
	me("Irrational numbers", "I", "\\I"),
	m("Complex numbers", "C", "\\C"),

	m("Testo", "tt", "\\text{<>}<>", { i(1), i(0) }),
	m("Insieme vuoto", "es", "\\emptyset"),
	m("Freccia", "->", "\\to"),
	m("Non uguale", "!=", "\\neq"),

	m("Unione", "uu", "\\cup "),
	m("Intersezione", "nn", "\\cap "),

	m("Overline", "ll", "\\overline{<>}<>", { i(1), i(0) }),

	m("Insieme", "ii", "\\{ <> \\}<>", { i(1), i(0) }),
	m("Big cup", "bu", "\\bigcup_{<>}^{<>}<>", { i(1, "i=1"), i(2, "n"), i(0) }),
	m("Big cup", "bn", "\\bigcap_{<>}^{<>}<>", { i(1, "i=1"), i(2, "n"), i(0) }),

	m("Equivalente", "qq", "\\equiv "),
	m("Equivalente", "mm", "\\pmod{<>}<>", { i(1), i(0) }),
}
