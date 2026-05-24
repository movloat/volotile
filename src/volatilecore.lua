--!optimize 2
--!strict

local langs = {}
local defcolor = "abb2bf" -- color for unassigned
local isInit = false

local string_sub = string.sub
local string_find = string.find
local string_match = string.match
local string_format = string.format
local table_insert = table.insert
local table_concat = table.concat

local function init()
	local folder = script.Parent
	for _, dict in ipairs(folder:GetChildren()) do
		if dict:IsA("ModuleScript") and dict ~= script then
			langs[dict.Name] = require(dict)
		end
	end
	isInit = true
end

local function escape(text: string): string
	return text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
end

local function highlight(line: string, lang: string): string
	if line == "" then
		return ""
	end

	if not isInit then
		init()
	end

	local currentLang = langs[lang]
	if not currentLang then 
		return escape(line) 
	end

	if string_match(line, currentLang.commentOptimize) then
		return string_format('<font color="#%s">%s</font>', currentLang.colors.comment, escape(line))
	end

	local resultBuffer = {}
	local pos = 1
	local length = #line

	while pos <= length do
		local substring = string_sub(line, pos)
		local matched = false

		for _, rule in ipairs(currentLang.tokens) do
			local tokenType, pattern = rule[1], rule[2]
			local s, e = string_find(substring, pattern)

			if s == 1 then
				local token = string_sub(substring, s, e)
				local color = defcolor
				local esctoken = escape(token)

				if tokenType == "word" then
					local wordType = currentLang.lexicon[token]

					if wordType then
						color = currentLang.colors[wordType] or defcolor
					else
						local nextChar = string_sub(line, pos + #token, pos + #token)
						if nextChar == "(" then
							color = currentLang.colors.func
						else
							color = currentLang.colors.var
						end
					end
				else
					color = currentLang.colors[tokenType] or defcolor
				end

				table_insert(resultBuffer, string_format('<font color="#%s">%s</font>', color, esctoken))
				pos = pos + #token
				matched = true
				break
			end
		end

		if not matched then
			local char = string_sub(line, pos, pos)
			table_insert(resultBuffer, escape(char))
			pos = pos + 1
		end
	end

	return table_concat(resultBuffer)
end

return { highlight = highlight }
