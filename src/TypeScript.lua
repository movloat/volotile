--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["break"] = "keyword", ["case"] = "keyword", ["catch"] = "keyword",
	["class"] = "keyword", ["const"] = "keyword", ["continue"] = "keyword",
	["debugger"] = "keyword", ["default"] = "keyword", ["delete"] = "keyword",
	["do"] = "keyword", ["else"] = "keyword", ["enum"] = "keyword",
	["export"] = "keyword", ["extends"] = "keyword", ["finally"] = "keyword",
	["for"] = "keyword", ["function"] = "keyword", ["if"] = "keyword",
	["import"] = "keyword", ["in"] = "keyword", ["instanceof"] = "keyword",
	["new"] = "keyword", ["return"] = "keyword", ["super"] = "keyword",
	["switch"] = "keyword", ["this"] = "keyword", ["throw"] = "keyword",
	["try"] = "keyword", ["typeof"] = "keyword", ["var"] = "keyword",
	["void"] = "keyword", ["while"] = "keyword", ["with"] = "keyword",
	["yield"] = "keyword", ["async"] = "keyword", ["await"] = "keyword",
	["let"] = "keyword", ["static"] = "keyword", ["implements"] = "keyword",
	["interface"] = "keyword", ["package"] = "keyword", ["private"] = "keyword",
	["protected"] = "keyword", ["public"] = "keyword",

	["abstract"] = "keyword", ["as"] = "keyword", ["asserts"] = "keyword",
	["declare"] = "keyword", ["is"] = "keyword", ["keyof"] = "keyword",
	["module"] = "keyword", ["namespace"] = "keyword", ["readonly"] = "keyword",
	["type"] = "keyword", ["get"] = "keyword", ["set"] = "keyword",

	["any"] = "type", ["boolean"] = "type", ["constructor"] = "type",
	["never"] = "type", ["number"] = "type", ["object"] = "type",
	["string"] = "type", ["symbol"] = "type", ["unknown"] = "type",
	["undefined"] = "type", ["true"] = "keyword", ["false"] = "keyword",
	["null"] = "keyword", ["NaN"] = "keyword",

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
	var = "e06c75"
}

return table.freeze(lex)