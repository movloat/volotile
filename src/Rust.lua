--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["as"] = "keyword", ["async"] = "keyword", ["await"] = "keyword",
	["break"] = "keyword", ["const"] = "keyword", ["continue"] = "keyword",
	["crate"] = "keyword", ["dyn"] = "keyword", ["else"] = "keyword",
	["enum"] = "keyword", ["extern"] = "keyword", ["false"] = "keyword",
	["fn"] = "keyword", ["for"] = "keyword", ["if"] = "keyword",
	["impl"] = "keyword", ["in"] = "keyword", ["let"] = "keyword",
	["loop"] = "keyword", ["match"] = "keyword", ["mod"] = "keyword",
	["move"] = "keyword", ["mut"] = "keyword", ["pub"] = "keyword",
	["ref"] = "keyword", ["return"] = "keyword", ["self"] = "keyword",
	["Self"] = "keyword", ["static"] = "keyword", ["struct"] = "keyword",
	["super"] = "keyword", ["trait"] = "keyword", ["true"] = "keyword",
	["type"] = "keyword", ["union"] = "keyword", ["unsafe"] = "keyword",
	["use"] = "keyword", ["where"] = "keyword", ["while"] = "keyword",

	["bool"] = "type", ["char"] = "type", ["str"] = "type",
	["i8"] = "type", ["i16"] = "type", ["i32"] = "type", ["i64"] = "type", ["i128"] = "type", ["isize"] = "type",
	["u8"] = "type", ["u16"] = "type", ["u32"] = "type", ["u64"] = "type", ["u128"] = "type", ["usize"] = "type",
	["f32"] = "type", ["f64"] = "type", ["Option"] = "type", ["Result"] = "type",
	["String"] = "type", ["Vec"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["^"] = "operator", ["&"] = "operator", ["|"] = "operator",
	["!"] = "operator", ["="] = "operator", ["<"] = "operator", [">"] = "operator",
	["=="] = "operator", ["!="] = "operator", ["<="] = "operator", [">="] = "operator",
	["&&"] = "operator", ["||"] = "operator", ["+="] = "operator", ["-="] = "operator",
	["*="] = "operator", ["/="] = "operator", ["%="] = "operator", ["^="] = "operator",
	["&="] = "operator", ["|="] = "operator", ["<<"] = "operator", [">>"] = "operator",
	["<<="] = "operator", [">>="] = "operator", ["=>"] = "operator", ["->"] = "operator",
	[".."] = "operator", ["..="] = "operator", ["@"] = "operator", ["?"] = "operator",
	["."] = "operator", [":"] = "operator", ["::"] = "operator", [";"] = "operator",
}

lex.tokens = {
	{ "comment", "^//.*" },
	{ "comment", "^/%*.-%*/" },
	{ "comment", "^/%*.*" },

	{ "string",  '^r#?"[^"]*"#?' },
	{ "string",  '^"[^"\n]*"' },

	{ "type",    "^'[%a_][%w_]*" }, 
	{ "string",  "^'[^'\n]*'" },

	{ "number",  "^0x[%da-fA-F_]+" },
	{ "number",  "^0b[01_]+" },
	{ "number",  "^0o[0-7_]+" },
	{ "number",  "^%d[%d_]*%.%d+[eE][%+%-]?%d*[f%d]*" },
	{ "number",  "^%d[%d_]*[iu]%d*" },
	{ "number",  "^%d[%d_]*" },

	{ "func",    "^[A-Za-z_][%w_]*!" },

	{ "operator", "^::" },
	{ "operator", "^=>" },
	{ "operator", "^%->" },
	{ "operator", "^%.%.=" },
	{ "operator", "^%.%." },
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