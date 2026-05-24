--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["break"] = "keyword", ["case"] = "keyword", ["continue"] = "keyword",
	["default"] = "keyword", ["defer"] = "keyword", ["do"] = "keyword",
	["else"] = "keyword", ["fallthrough"] = "keyword", ["for"] = "keyword",
	["guard"] = "keyword", ["if"] = "keyword", ["in"] = "keyword",
	["repeat"] = "keyword", ["return"] = "keyword", ["switch"] = "keyword",
	["where"] = "keyword", ["while"] = "keyword", ["as"] = "keyword",
	["as?"] = "keyword", ["as!"] = "keyword", ["is"] = "keyword",
	["nil"] = "keyword", ["self"] = "keyword", ["Self"] = "keyword",
	["super"] = "keyword", ["true"] = "keyword", ["false"] = "keyword",

	["associatedtype"] = "keyword", ["class"] = "keyword", ["deinit"] = "keyword",
	["enum"] = "keyword", ["extension"] = "keyword", ["fileprivate"] = "keyword",
	["func"] = "keyword", ["import"] = "keyword", ["init"] = "keyword",
	["inout"] = "keyword", ["internal"] = "keyword", ["let"] = "keyword",
	["open"] = "keyword", ["operator"] = "keyword", ["private"] = "keyword",
	["precedencegroup"] = "keyword", ["protocol"] = "keyword", ["public"] = "keyword",
	["rethrows"] = "keyword", ["static"] = "keyword", ["struct"] = "keyword",
	["subscript"] = "keyword", ["typealias"] = "keyword", ["var"] = "keyword",

	["Bool"] = "type", ["Int"] = "type", ["Double"] = "type", ["Float"] = "type",
	["String"] = "type", ["Character"] = "type", ["Optional"] = "type",
	["Array"] = "type", ["Dictionary"] = "type", ["Set"] = "type",
	["Any"] = "type", ["AnyObject"] = "type", ["Void"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["="] = "operator", ["=="] = "operator", ["!="] = "operator",
	["==="] = "operator", ["!=="] = "operator", ["<"] = "operator", [">"] = "operator",
	["<="] = "operator", [">="] = "operator", ["&&"] = "operator", ["||"] = "operator",
	["!"] = "operator", ["~"] = "operator", ["&"] = "operator", ["|"] = "operator",
	["^"] = "operator", ["<<"] = "operator", [">>"] = "operator", ["??"] = "operator",
	["..."] = "operator", ["..<"] = "operator", ["?"] = "operator",
	["->"] = "operator", ["."] = "operator", [":"] = "operator",
}

lex.tokens = {
	{ "comment", "^//.*" },
	{ "comment", "^/%*.-%*/" },
	{ "comment", "^/%*.*" },

	{ "string",  '^"""[^"]*"""' },
	{ "string",  '^"[^"\n]*"' },

	{ "number",  "^0x[%da-fA-F_]+" },
	{ "number",  "^0o[0-7_]+" },
	{ "number",  "^0b[01_]+" },
	{ "number",  "^%d[%d_]*%.%d+[eE][%+%-]?%d*" },
	{ "number",  "^%d[%d_]*" },

	{ "operator", "^%.%.%." },
	{ "operator", "^%.%.<" },
	{ "operator", "^%?%?" },
	{ "operator", "^===" },
	{ "operator", "^!==" },
	{ "operator", "^%->" },
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