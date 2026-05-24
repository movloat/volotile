--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["and"] = "keyword", ["as"] = "keyword", ["assert"] = "keyword",
	["break"] = "keyword", ["class"] = "keyword", ["continue"] = "keyword",
	["def"] = "keyword", ["del"] = "keyword", ["elif"] = "keyword",
	["else"] = "keyword", ["except"] = "keyword", ["False"] = "keyword",
	["finally"] = "keyword", ["for"] = "keyword", ["from"] = "keyword",
	["global"] = "keyword", ["if"] = "keyword", ["import"] = "keyword",
	["in"] = "keyword", ["is"] = "keyword", ["lambda"] = "keyword",
	["None"] = "keyword", ["nonlocal"] = "keyword", ["not"] = "keyword",
	["or"] = "keyword", ["pass"] = "keyword", ["raise"] = "keyword",
	["return"] = "keyword", ["True"] = "keyword", ["try"] = "keyword",
	["while"] = "keyword", ["with"] = "keyword", ["yield"] = "keyword",
	["async"] = "keyword", ["await"] = "keyword",

	["int"] = "type", ["float"] = "type", ["complex"] = "type",
	["bool"] = "type", ["str"] = "type", ["list"] = "type",
	["tuple"] = "type", ["dict"] = "type", ["set"] = "type",
	["frozenset"] = "type", ["bytes"] = "type", ["range"] = "type",
	["object"] = "type", ["type"] = "type", ["self"] = "type",
	["cls"] = "type",

	["print"] = "type", ["len"] = "type",
	["input"] = "type", ["open"] = "type", ["sum"] = "type",
	["max"] = "type", ["min"] = "type", ["abs"] = "type",
	["enumerate"] = "type", ["zip"] = "type", ["map"] = "type",
	["filter"] = "type", ["iter"] = "type", ["next"] = "type",
	["super"] = "type", ["isinstance"] = "type", ["issubclass"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["//"] = "operator", ["%"] = "operator", ["**"] = "operator",
	["=="] = "operator", ["!="] = "operator", ["<"] = "operator", [">"] = "operator",
	["<="] = "operator", [">="] = "operator", ["="] = "operator",
	["+="] = "operator", ["-="] = "operator", ["*="] = "operator", ["/="] = "operator",
	["//="] = "operator", ["%="] = "operator", ["**="] = "operator",
	["&"] = "operator", ["|"] = "operator", ["^"] = "operator", ["~"] = "operator",
	["<<"] = "operator", [">>"] = "operator", ["@"] = "operator",
	["->"] = "operator", ["."] = "operator", [":"] = "operator",
}

lex.tokens = {
	{ "comment", "^%s*#" },
	{ "comment", "^#.*" },

	{ "string",  '^[fFrRuU]?["\']["\']["\'].-["\']["\']["\']' },
	{ "string",  '^[fFrRuU]?"[^"\n]*"' },
	{ "string",  "^[fFrRuU]?'[^'\n]*'" },

	{ "number",  "^0x[%da-fA-F]+" },
	{ "number",  "^0b[01]+" },
	{ "number",  "^0o[0-7]+" },
	{ "number",  "^%d+%.%d+[eE][%+%-]?%d+" },
	{ "number",  "^%d+%.%d+" },
	{ "number",  "^%d+" },

	{ "operator", "^//=" },
	{ "operator", "^%*%*=" },
	{ "operator", "^//" },
	{ "operator", "^%*%*" },
	{ "operator", "^[<>!=]=" },
	{ "operator", "^[%+%-%*/%%%^#=<>~&|@]+" },

	{ "word",    "^[A-Za-z_][A-Za-z0-9_]*" },

	{ "operator", "^[%p]" },
}

lex.commentOptimize = "^%s*#"

lex.colors = {
	keyword = "c678dd",
	type = "61afef",
	operator = "56b6c2",
	comment = "5c6370",
	string = "98c379",
	number = "d19a66",
	func = "61afef",
	var = "e06c75"
}

return table.freeze(lex)