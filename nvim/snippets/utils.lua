local M = {}

local in_env = function(name) -- generic environment detection
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

M.ls = require("luasnip")

M.s = M.ls.snippet -- Basic snippet
M.t = M.ls.text_node -- Testo
M.i = M.ls.insert_node
M.sn = M.ls.snippet_node -- Sub-snippet
M.f = M.ls.function_node
M.d = M.ls.dynamic_node
M.fmt = require("luasnip.extras.fmt").fmta
M.rep = require("luasnip.extras").rep

M.get_visual = function(_, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return M.sn(nil, M.t(parent.snippet.env.LS_SELECT_RAW))
	else
		return M.sn(nil, M.i(1))
	end
end

M.mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

M.get_parenthesis = function(pre, post, char)
	return function(_, snip)
		char = char or 1

		local capture = snip.captures[1]
		-- -1 skips `/` checking
		local ind = string.len(capture) - char
		local depth = 0

		while true do
			local sel = string.sub(capture, ind, ind)
			if sel == ")" then
				depth = depth + 1
			end
			if sel == "(" then
				depth = depth - 1
			end
			if depth == 0 then
				break
			end
			ind = ind - 1
		end

		return string.sub(capture, 0, ind - 1) .. pre .. string.sub(capture, ind + 1, -(char + 2)) .. post
	end
end

M.in_tabular = function() return in_env("tabular") end
M.in_itemize = function() return in_env("itemize") end
M.in_enumerate = function() return in_env("enumerate") end
M.in_description = function() return in_env("description") end

return M
