--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["break"] = "keyword", ["case"] = "keyword", ["chan"] = "keyword",
	["const"] = "keyword", ["continue"] = "keyword", ["default"] = "keyword",
	["defer"] = "keyword", ["else"] = "keyword", ["fallthrough"] = "keyword",
	["for"] = "keyword", ["func"] = "keyword", ["go"] = "keyword",
	["goto"] = "keyword", ["if"] = "keyword", ["import"] = "keyword",
	["interface"] = "keyword", ["map"] = "keyword", ["package"] = "keyword",
	["range"] = "keyword", ["return"] = "keyword", ["select"] = "keyword",
	["struct"] = "keyword", ["switch"] = "keyword", ["type"] = "keyword",
	["var"] = "keyword",

	["bool"] = "type", ["string"] = "type", ["error"] = "type",
	["int"] = "type", ["int8"] = "type", ["int16"] = "type", ["int32"] = "type", ["int64"] = "type",
	["uint"] = "type", ["uint8"] = "type", ["uint16"] = "type", ["uint32"] = "type", ["uint64_t"] = "type",
	["uintptr"] = "type", ["byte"] = "type", ["rune"] = "type",
	["float32"] = "type", ["float64"] = "type", ["complex64"] = "type", ["complex128"] = "type",
	["true"] = "keyword", ["false"] = "keyword", ["iota"] = "keyword", ["nil"] = "keyword",

	["make"] = "type", ["new"] = "type", ["len"] = "type", ["cap"] = "type",
	["append"] = "type", ["copy"] = "type", ["delete"] = "type", ["panic"] = "type",
	["recover"] = "type", ["print"] = "type", ["println"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["&"] = "operator", ["|"] = "operator", ["^"] = "operator",
	["="] = "operator", ["!"] = "operator", ["<"] = "operator", [">"] = "operator",
	["=="] = "operator", ["!="] = "operator", ["<="] = "operator", [">="] = "operator",
	["&&"] = "operator", ["||"] = "operator", ["<<"] = "operator", [">>"] = "operator",
	["&^"] = "operator", ["&^="] = "operator",
	["+="] = "operator", ["-="] = "operator", ["*="] = "operator", ["/="] = "operator",
	["%="] = "operator", ["&="] = "operator", ["|="] = "operator", ["^="] = "operator",
	["<<="] = "operator", [">>="] = "operator", [":="] = "operator",
	["++"] = "operator", ["--"] = "operator", ["<-"] = "operator",
	["."] = "operator", [":"] = "operator", ["..."] = "operator",
}

lex.tokens = {
	{ "comment", "^//.*" },
	{ "comment", "^/%*.-%*/" },
	{ "comment", "^/%*.*" },

	{ "string",  '^"[^"\n]*"' },
	{ "string",  "^[^]*`" },
	{ "string",  "^'[^'\n]*'" },

	{ "number",  "^0x[%da-fA-F_]+" },
	{ "number",  "^0b[01_]+" },
	{ "number",  "^0o[0-7_]+" },
	{ "number",  "^%d[%d_]*%.?%d*[eE]?[%+%-]?%d*i?" },

	{ "operator", "^:=" },
	{ "operator", "^&%^=" },
	{ "operator", "^&%^" },
	{ "operator", "^<%-" },
	{ "operator", "^%.%.%." },
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