--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["alignas"] = "keyword", ["alignof"] = "keyword", ["asm"] = "keyword",
	["auto"] = "keyword", ["break"] = "keyword", ["case"] = "keyword",
	["catch"] = "keyword", ["class"] = "keyword", ["const"] = "keyword",
	["constexpr"] = "keyword", ["const_cast"] = "keyword", ["continue"] = "keyword",
	["decltype"] = "keyword", ["default"] = "keyword", ["delete"] = "keyword",
	["do"] = "keyword", ["dynamic_cast"] = "keyword", ["else"] = "keyword",
	["enum"] = "keyword", ["explicit"] = "keyword", ["export"] = "keyword",
	["extern"] = "keyword", ["false"] = "keyword", ["for"] = "keyword",
	["friend"] = "keyword", ["goto"] = "keyword", ["if"] = "keyword",
	["inline"] = "keyword", ["mutable"] = "keyword", ["namespace"] = "keyword",
	["new"] = "keyword", ["noexcept"] = "keyword", ["nullptr"] = "keyword",
	["operator"] = "keyword", ["private"] = "keyword", ["protected"] = "keyword",
	["public"] = "keyword", ["reinterpret_cast"] = "keyword", ["return"] = "keyword",
	["sizeof"] = "keyword", ["static"] = "keyword", ["static_assert"] = "keyword",
	["static_cast"] = "keyword", ["struct"] = "keyword", ["switch"] = "keyword",
	["template"] = "keyword", ["this"] = "keyword", ["thread_local"] = "keyword",
	["throw"] = "keyword", ["true"] = "keyword", ["try"] = "keyword",
	["typedef"] = "keyword", ["typeid"] = "keyword", ["typename"] = "keyword",
	["union"] = "keyword", ["using"] = "keyword", ["virtual"] = "keyword",
	["volatile"] = "keyword", ["while"] = "keyword",

	["bool"] = "type", ["char"] = "type", ["char16_t"] = "type",
	["char32_t"] = "type", ["double"] = "type", ["float"] = "type",
	["int"] = "type", ["long"] = "type", ["short"] = "type",
	["signed"] = "type", ["unsigned"] = "type", ["void"] = "type",
	["wchar_t"] = "type", ["size_t"] = "type", ["uint8_t"] = "type",
	["uint16_t"] = "type", ["uint32_t"] = "type", ["uint64_t"] = "type",
	["int8_t"] = "type", ["int16_t"] = "type", ["int32_t"] = "type",
	["int64_t"] = "type", ["std"] = "type", ["string"] = "type",
	["vector"] = "type", ["map"] = "type", ["set"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["^"] = "operator", ["&"] = "operator", ["|"] = "operator",
	["~"] = "operator", ["!"] = "operator", ["="] = "operator", ["<"] = "operator",
	[">"] = "operator", ["+="] = "operator", ["-="] = "operator", ["*="] = "operator",
	["/="] = "operator", ["%="] = "operator", ["^="] = "operator", ["&="] = "operator",
	["|="] = "operator", ["<<"] = "operator", [">>"] = "operator", ["<<="] = "operator",
	[">>="] = "operator", ["=="] = "operator", ["!="] = "operator", ["<="] = "operator",
	[">="] = "operator", ["&&"] = "operator", ["||"] = "operator", ["++"] = "operator",
	["--"] = "operator", [","] = "operator", ["->*"] = "operator", ["->"] = "operator",
	["."] = "operator", ["::"] = "operator", ["?"] = "operator", [":"] = "operator",
}

lex.tokens = {
	{ "keyword", "^%s*#%s*[a-z]+" },

	{ "comment", "^//.*" },
	{ "comment", "^/%*.-%*/" },
	{ "comment", "^/%*.*" },

	{ "string",  '^R"%b()" ' }, 
	{ "string",  '^L?"[^"\n]*"' },
	{ "string",  "^'[^'\n]*'" },

	{ "number",  "^0x[%da-fA-F_]+" },
	{ "number",  "^0b[01_]+" },
	{ "number",  "^%d[%d_]*%.%d+[eE][%+%-]?%d*[fFlL]?" },
	{ "number",  "^%d[%d_]*[uUlLfF]*" },

	{ "operator", "^::" },
	{ "operator", "^%->%*" },
	{ "operator", "^%->" },
	{ "operator", "^<<=" },
	{ "operator", "^>>=" },
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