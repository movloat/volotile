--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["true"] = "keyword",
	["false"] = "keyword",
	["null"] = "keyword",

	["{"] = "operator",
	["}"] = "operator",
	["["] = "operator",
	["]"] = "operator",
	[":"] = "operator",
	[","] = "operator",
}

lex.tokens = {
	{ "string",  '^"[^"\n]*"' },

	{ "number",  "^%-?%d+%.%d+[eE][%+%-]?%d+" },
	{ "number",  "^%-?%d+[eE][%+%-]?%d+" },
	{ "number",  "^%-?%d+%.%d+" },
	{ "number",  "^%-?%d+" },

	{ "word",    "^[A-Za-z_][A-Za-z0-9_]*" },

	{ "operator", "^[%[%]{}:,]" },
}

lex.commentOptimize = "^$" 

lex.colors = {
	keyword = "d19a66",
	type = "abb2bf",
	operator = "56b6c2",
	comment = "5c6370",
	string = "98c379",
	number = "d19a66",
	func = "61afef",
	var = "e06c75"
}

return table.freeze(lex)