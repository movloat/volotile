--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["alias"] = "keyword", ["and"] = "keyword", ["begin"] = "keyword",
	["break"] = "keyword", ["case"] = "keyword", ["class"] = "keyword",
	["def"] = "keyword", ["defined?"] = "keyword", ["do"] = "keyword",
	["else"] = "keyword", ["elsif"] = "keyword", ["end"] = "keyword",
	["ensure"] = "keyword", ["false"] = "keyword", ["for"] = "keyword",
	["if"] = "keyword", ["in"] = "keyword", ["module"] = "keyword",
	["next"] = "keyword", ["nil"] = "keyword", ["not"] = "keyword",
	["or"] = "keyword", ["redo"] = "keyword", ["rescue"] = "keyword",
	["retry"] = "keyword", ["return"] = "keyword", ["self"] = "keyword",
	["super"] = "keyword", ["then"] = "keyword", ["true"] = "keyword",
	["undef"] = "keyword", ["unless"] = "keyword", ["until"] = "keyword",
	["when"] = "keyword", ["while"] = "keyword", ["yield"] = "keyword",
	["FILE"] = "keyword", ["LINE"] = "keyword",

	["attr_accessor"] = "type", ["attr_reader"] = "type", ["attr_writer"] = "type",
	["include"] = "type", ["extend"] = "type", ["require"] = "type",
	["public"] = "type", ["private"] = "type", ["protected"] = "type",
	["puts"] = "type", ["print"] = "type", ["raise"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["**"] = "operator", ["="] = "operator", ["=="] = "operator",
	["!="] = "operator", ["==="] = "operator", ["<"] = "operator", [">"] = "operator",
	["<="] = "operator", [">="] = "operator", ["<=>"] = "operator",
	["&&"] = "operator", ["||"] = "operator", ["!"] = "operator", ["~"] = "operator",
	["&"] = "operator", ["|"] = "operator", ["^"] = "operator", ["<<"] = "operator",
	[">>"] = "operator", ["&&="] = "operator", ["||="] = "operator",
	[".."] = "operator", ["..."] = "operator", ["?"] = "operator", [":"] = "operator",
}

lex.tokens = {
	{ "comment", "^#.*" },

	{ "string",  "^:[%a_][%w_]*" },

	{ "string",  '^"[^"\n]*"' },
	{ "string",  "^'[^'\n]*'" },
	{ "string",  "^%b%{%}" },

	{ "number",  "^0x[%da-fA-F_]+" },
	{ "number",  "^0b[01_]+" },
	{ "number",  "^%d[%d_]*%.%d+" },
	{ "number",  "^%d[%d_]*" },

	{ "var",     "^%[%$@%a_][%w_]*" },

	{ "operator", "^<=>" },
	{ "operator", "^%.%.%.?" },
	{ "operator", "^||=" },
	{ "operator", "^&&=" },
	{ "operator", "^[<>!=]=" },
	{ "operator", "^[%+%-%*/%%%^#=<>~&|!%?]+" },

	{ "word",    "^[A-Za-z_][A-Za-z0-9_]*%??" },

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