--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["and"] = "keyword", ["break"] = "keyword", ["continue"] = "keyword", ["do"] = "keyword",
	["else"] = "keyword", ["elseif"] = "keyword", ["end"] = "keyword", ["false"] = "keyword",
	["for"] = "keyword", ["function"] = "keyword", ["if"] = "keyword", ["in"] = "keyword",
	["local"] = "keyword", ["nil"] = "keyword", ["not"] = "keyword", ["or"] = "keyword",
	["repeat"] = "keyword", ["return"] = "keyword", ["then"] = "keyword", ["true"] = "keyword",
	["until"] = "keyword", ["while"] = "keyword", ["export"] = "keyword", ["type"] = "keyword",
	["typeof"] = "keyword", ["self"] = "keyword",

	["any"] = "type", ["boolean"] = "type", ["number"] = "type", ["string"] = "type",
	["thread"] = "type", ["userdata"] = "type", ["never"] = "type", ["unknown"] = "type",
	["table"] = "type", ["void"] = "type", ["Vector2"] = "type", ["Vector2int16"] = "type",
	["Vector3"] = "type", ["Vector3int16"] = "type", ["UDim"] = "type", ["UDim2"] = "type",
	["CFrame"] = "type", ["Color3"] = "type", ["ColorSequence"] = "type", ["ColorSequenceKeypoint"] = "type",
	["NumberRange"] = "type", ["NumberSequence"] = "type", ["NumberSequenceKeypoint"] = "type",
	["BrickColor"] = "type", ["Ray"] = "type", ["Rect"] = "type", ["Region3"] = "type",
	["Region3int16"] = "type", ["Faces"] = "type", ["Axes"] = "type", ["Enum"] = "type",
	["Instance"] = "type", ["DateTime"] = "type", ["Font"] = "type", ["PhysicalProperties"] = "type",
	["SharedTable"] = "type", ["task"] = "type", ["debug"] = "type", ["math"] = "type",
	["bit32"] = "type", ["utf8"] = "type", ["coroutine"] = "type", ["os"] = "type",
	["script"] = "type", ["game"] = "type", ["workspace"] = "type", ["require"] = "type",
	["warn"] = "type", ["error"] = "type", ["assert"] = "type", ["getmetatable"] = "type",
	["setmetatable"] = "type", ["_G"] = "type", ["_VERSION"] = "type",

	["+"] = "operator", ["-"] = "operator", ["*"] = "operator", ["/"] = "operator",
	["%"] = "operator", ["^"] = "operator", ["#"] = "operator", ["=="] = "operator",
	["~="] = "operator", ["<"] = "operator", [">"] = "operator", ["<="] = "operator",
	[">="] = "operator", ["="] = "operator", [".."] = "operator", ["?"] = "operator",
	[":"] = "operator", ["->"] = "operator", ["."] = "operator", ["::"] = "operator",
	["+="] = "operator", ["-="] = "operator", ["*="] = "operator", ["/="] = "operator",
	["%="] = "operator", ["^="] = "operator", ["..="] = "operator"
}

lex.tokens = {
	{ "comment", "^%s*%-%-" },
	{ "comment", "^%-%-%[=*%[.-%]=*%]" },
	{ "comment", "^%-%-.*" },
	{ "string", "^%[=*%[.-%]=*%]" },
	{ "string", '^"[^"\n]*"' },
	{ "string", "^'[^'\n]*'" },
	{ "number", "^0x[%da-fA-F]+" },
	{ "number", "^%d+%.%d+[eE][%+%-]?%d+" },
	{ "number", "^%d+[eE][%+%-]?%d+" },
	{ "number", "^%d+%.%d+" },
	{ "number", "^%d+" },
	{ "operator", "^%.%.%." },
	{ "operator", "^%.%." },
	{ "operator", "^[~<>!=]=" },
	{ "operator", "^[%+%-%*/%%%^#=<>~]+" },
	{ "word", "^[A-Za-z_][A-Za-z0-9_]*" },
	{ "operator", "^[%p]" }
}

lex.commentOptimize = "^%s*%-%-"

lex.colors = {
	keyword = "2469e9",
	string = "65d79d",
	number = "c59cf9",
	type = "8daef2",
	func = "fc9bc0",
	comment = "6a6f81",
	var = "abb2bf",
	operator = "fc9bc0"
}

return table.freeze(lex)