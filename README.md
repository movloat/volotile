# volotile
Ultra-lightweight, high performance syntax highlighting for Roblox (RichText). Easy to embed and modify. Works without AST.

This lib was created for be a lightweight and extremely fast solution for **syntax highlighting** for programming languages without heavy AST overhead.
Works on native lua functions(string.sub/find/match/format and table.insert/concat) and have no dependencies.
Also it is **line-by-line highlighter**, **avoid** to use it for more than one line in one time.

# How to use?
Just call **highlight()** function and place raw text line as first arg and language dictionary name as second arg.
Example:
```Lua
local volatile = require(script.parent.volatile.volatilecore)
local highlighted = volatile.highlight("local num = 5", "Luau")
print(highlighted)
```
**You don't need to format the text in any way**. Volotile can consume any string.
It consume and return exactly same string but with well placed RichText <font color> tags

# How to add dictionary?

On first launch calling **init()** function for caching langs dictionaries in hash-table "langs" with using they file name as key.
So, to **add dictionaries** you just need to put they files in folder with **volotilecore** script.

You can create your own language dictionaries using this template:
```Lua
--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["local"] = "keyword", --keywords here

	["any"] = "type", --type or any language specific items here

	["+"] = "operator", --operators here
}

lex.tokens = {
	{ "comment", "" }, --(lua)pattern here
	{ "string", "" },
	{ "number", "" },
	{ "operator", "" },
	{ "word", "" },
}

lex.commentOptimize = "" --optimized pattern(if entire line is comment)

lex.colors = {
	keyword = "", --HEX code here
	string = "",
	number = "",
	type = "",
	func = "",
	comment = "",
	var = "",
	operator = ""
}

return table.freeze(lex)
```
