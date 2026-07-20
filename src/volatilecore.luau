--!optimize 2
--!strict

const langs = {}

local isInit = false

const sub = string.sub
const find = string.find
const match = string.match
const format = string.format
const insert = table.insert
const concat = table.concat

const function init()
	const folder = script.Parent
	for _, dict: ModuleScript in folder:GetChildren() do
		if dict:IsA("ModuleScript") and dict ~= script then
			langs[dict.Name] = require(dict) --ignore linter here
		end
	end
	isInit = true
	table.freeze(langs)
end

const function escape(text: string): string
	return text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
end

const function highlight(line: string, lang: string): string
	if line == "" then
		return ""
	end

	if not isInit then
		init()
	end

	const currentLang = langs[lang]
    const defcolor = currentLang.colors.var --color for unassigned, changeable

	if not currentLang then 
		return escape(line) 
	end

	if match(line, currentLang.commentOptimize) then
		return format(`<font color="{currentLang.colors.comment}">{escape(line)}</font>`)
	end

	const resultBuffer = {}
	local pos = 1
	const length = #line

	while pos <= length do
		local matched = false

		for _, rule in currentLang.tokens do
			const tokenType, rawPattern = rule[1], rule[2]
			
			const pattern = if sub(rawPattern, 1, 1) == "^" then rawPattern else `^{rawPattern}`
			
			const s, e = find(line, pattern, pos)

			if s then
				const token = sub(line, s, e)
				local color = defcolor
				const esctoken = escape(token)

				if tokenType == "word" then
					const wordType = currentLang.lexicon[token]

					if wordType then
						color = currentLang.colors[wordType] or defcolor
					else
						const nextCharPos = pos + #token
						const nextChar = sub(line, nextCharPos, nextCharPos)
						if nextChar == "(" then
							color = currentLang.colors.func
						else
							color = currentLang.colors.var
						end
					end
				else
					color = currentLang.colors[tokenType] or defcolor
				end

				insert(resultBuffer, format('<font color="#%s">%s</font>', color, esctoken))
				pos = e + 1 --here too
				matched = true
				break
			end
		end

		if not matched then
			const char = sub(line, pos, pos)
			resultBuffer[#resultBuffer + 1] = escape(char)
			pos += 1
		end
	end

	return concat(resultBuffer)
end

return { highlight = highlight }
