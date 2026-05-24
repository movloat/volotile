# volotile

Ultra-lightweight, high-performance syntax highlighter for Roblox (RichText). Easy to embed and modify. Works without AST.

This library was created to be a lightweight and extremely fast solution for **syntax highlighting** without heavy AST overhead. It runs entirely on native Luau functions (`string.sub`/`find`/`match`/`format` and `table.insert`/`concat`) and has zero external dependencies.

**Important Note:** This is a **line-by-line highlighter**. Avoid passing multiple lines at once.

---

## How to use?

Just call the `highlight()` function, passing the raw text line as the first argument and the language dictionary name as the second argument.

```lua
local volatile = require(script.Parent.volatile.volatilecore)
local highlighted = volatile.highlight("local num = 5", "Luau")
print(highlighted)
```

**You don't need to pre-format the text in any way.** Volotile can consume any raw string. It processes it and returns the exact same string, wrapped in properly formatted RichText `<font color="...">` tags.

---

## How to add a dictionary?

On the first execution, volotile calls an internal `init()` function to cache all available language dictionaries into a local hash table, using their file names as keys. 

To **add a new language**, simply drop its `ModuleScript` into the same folder where the `volatilecore` script is located.

### Dictionary Template

You can create your own language dictionaries using the following template:

```lua
--!strict
--!optimize 2
local lex = {}

lex.lexicon = {
	["local"] = "keyword", -- Keywords go here

	["any"] = "type",      -- Types or language-specific items

	["+"] = "operator",    -- Operators
}

lex.tokens = {
	{ "comment", "" },     -- Luau patterns here
	{ "string", "" },
	{ "number", "" },
	{ "operator", "" },
	{ "word", "" },
}

lex.commentOptimize = ""   -- Optimized pattern (triggers if the entire line is a comment)

lex.colors = {
	keyword = "",          -- HEX codes go here (without #)
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
