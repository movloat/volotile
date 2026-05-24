--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["abstract"] = "keyword", ["as"] = "keyword", ["base"] = "keyword",
	["break"] = "keyword", ["case"] = "keyword", ["catch"] = "keyword",
	["class"] = "keyword", ["const"] = "keyword", ["continue"] = "keyword",
	["default"] = "keyword", ["delegate"] = "keyword", ["do"] = "keyword",
	["else"] = "keyword", ["enum"] = "keyword", ["event"] = "keyword",
	["explicit"] = "keyword", ["extern"] = "keyword", ["finally"] = "keyword",
	["fixed"] = "keyword", ["for"] = "keyword", ["foreach"] = "keyword",
	["goto"] = "keyword", ["if"] = "keyword", ["implicit"] = "keyword",
	["in"] = "keyword", ["interface"] = "keyword", ["internal"] = "keyword",
	["is"] = "keyword", ["lock"] = "keyword", ["namespace"] = "keyword",
	["new"] = "keyword", ["operator"] = "keyword", ["out"] = "keyword",
	["override"] = "keyword", ["params"] = "keyword", ["private"] = "keyword",
	["protected"] = "keyword", ["public"] = "keyword", ["readonly"] = "keyword",
	["ref"] = "keyword", ["return"] = "keyword", ["sealed"] = "keyword",
	["sizeof"] = "keyword", ["stackalloc"] = "keyword", ["static"] = "keyword",
	["struct"] = "keyword", ["switch"] = "keyword", ["this"] = "keyword",
	["throw"] = "keyword", ["try"] = "keyword", ["typeof"] = "keyword",
	["unchecked"] = "keyword", ["unsafe"] = "keyword", ["using"] = "keyword",
	["virtual"] = "keyword", ["while"] = "keyword", ["await"] = "keyword",
	["async"] = "keyword", ["yield"] = "keyword", ["var"] = "keyword",

	["bool"] = "type", ["byte"] = "type", ["char"] = "type",
	["decimal"] = "type", ["double"] = "type", ["float"] = "type",
	["int"] = "type", ["long"] = "type", ["sbyte"] = "type",
	["short"] = "type", ["uint"] = "type", ["ulong"] = "type",
	["ushort"] = "type", ["object"] = "type", ["string"] = "type",
	["void"] = "type", ["dynamic"] = "type", ["true"] = "keyword",
	["false"] = "keyword", ["nil"] = "keyword", ["null"] = "keyword",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["&"] = "operator", ["|"] = "operator", ["^"] = "operator",
	["!"] = "operator", ["~"] = "operator", ["="] = "operator", ["<"] = "operator",
	[">"] = "operator", ["?"] = "operator", [":"] = "operator", [";"] = "operator",
	["=="] = "operator", ["!="] = "operator", ["<="] = "operator", [">="] = "operator",
	["&&"] = "operator", ["||"] = "operator", ["++"] = "operator", ["--"] = "operator",
	["<<"] = "operator", [">>"] = "operator", ["+="] = "operator", ["-="] = "operator",
	["*="] = "operator", ["/="] = "operator", ["%="] = "operator", ["&="] = "operator",
	["|="] = "operator", ["^="] = "operator", ["<<="] = "operator", [">>="] = "operator",
	["=>"] = "operator", ["??"] = "operator", [".."] = "operator", ["."] = "operator",
}

lex.tokens = {
	{ "comment", "^//.*" },
	{ "comment", "^/%*.-%*/" },
	{ "comment", "^/%*.*" },

	{ "string",  '^%$?"[^"\n]*"' },
	{ "string",  '^@"[^"]*"' },
	{ "string",  "^'[^'\n]*'" },

	{ "number",  "^0x[%da-fA-F]+" },
	{ "number",  "^%d+%.%d+[fFdDmM]?" },
	{ "number",  "^%d+[fFdDmM]?" },
	{ "number",  "^%d+[uUlL]+" },

	{ "operator", "^%?%?" },
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
	operator = "abb2bf",
	comment = "5c6370",
	string = "98c379",
	number = "d19a66",
	func = "61afef",
	var = "e06c75"
}

return table.freeze(lex)