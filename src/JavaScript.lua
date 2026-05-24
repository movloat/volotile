--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["break"] = "keyword", ["case"] = "keyword", ["catch"] = "keyword",
	["class"] = "keyword", ["const"] = "keyword", ["continue"] = "keyword",
	["debugger"] = "keyword", ["default"] = "keyword", ["delete"] = "keyword",
	["do"] = "keyword", ["else"] = "keyword", ["export"] = "keyword",
	["extends"] = "keyword", ["finally"] = "keyword", ["for"] = "keyword",
	["function"] = "keyword", ["if"] = "keyword", ["import"] = "keyword",
	["in"] = "keyword", ["instanceof"] = "keyword", ["new"] = "keyword",
	["return"] = "keyword", ["super"] = "keyword", ["switch"] = "keyword",
	["this"] = "keyword", ["throw"] = "keyword", ["try"] = "keyword",
	["typeof"] = "keyword", ["var"] = "keyword", ["void"] = "keyword",
	["while"] = "keyword", ["with"] = "keyword", ["yield"] = "keyword",
	["async"] = "keyword", ["await"] = "keyword", ["let"] = "keyword",
	["static"] = "keyword", ["get"] = "keyword", ["set"] = "keyword",

	["true"] = "keyword", ["false"] = "keyword", ["null"] = "keyword",
	["undefined"] = "type", ["NaN"] = "type", ["Infinity"] = "type",
	["arguments"] = "type", ["window"] = "type", ["document"] = "type",
	["console"] = "type", ["module"] = "type", ["exports"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["&"] = "operator", ["|"] = "operator", ["^"] = "operator",
	["!"] = "operator", ["~"] = "operator", ["="] = "operator", ["<"] = "operator",
	[">"] = "operator", ["?"] = "operator", [":"] = "operator", [";"] = "operator",
	["=="] = "operator", ["!="] = "operator", ["==="] = "operator", ["!=="] = "operator",
	["<="] = "operator", [">="] = "operator", ["&&"] = "operator", ["||"] = "operator",
	["++"] = "operator", ["--"] = "operator", ["<<"] = "operator", [">>"] = "operator",
	[">>>"] = "operator", ["+="] = "operator", ["-="] = "operator", ["*="] = "operator",
	["/="] = "operator", ["%="] = "operator", ["??"] = "operator", ["?."] = "operator",
	["=>"] = "operator", ["..."] = "operator", ["."] = "operator",
}

lex.tokens = {
	{ "comment", "^//.*" },
	{ "comment", "^/%*.-%*/" },
	{ "comment", "^/%*.*" },

	{ "string",  '^"[^"\n]*"' },
	{ "string",  "^'[^'\n]*'" },
	{ "string",  "^[^]*`" },

	{ "number",  "^0x[%da-fA-F]+" },
	{ "number",  "^0b[01]+" },
	{ "number",  "^0o[0-7]+" },
	{ "number",  "^%d+%.%d+" },
	{ "number",  "^%d+n" },
	{ "number",  "^%d+" },

	{ "string",  "^/[^/]+/[gimyus]*" },

	{ "operator", "^===" },
	{ "operator", "^!==" },
	{ "operator", "^%?%?" },
	{ "operator", "^%?%." },
	{ "operator", "^%.%.%." },
	{ "operator", "^=>" },
	{ "operator", "^[<>!=]=" },
	{ "operator", "^[%+%-%*/%%%^#=<>~&|!%?]+" },

	{ "word",    "^[A-Za-z_][A-Za-z0-9_]*" },

	{ "operator", "^[%p]" },
}

lex.commentOptimize = "^%s*//"

lex.colors = {
	keyword = "c678dd",
	type = "e5c07b",
	operator = "56b6c2",
	comment = "5c6370",
	string = "98c379",
	number = "d19a66",
	func = "61afef",
	var = "abb2bf"
}

return table.freeze(lex)