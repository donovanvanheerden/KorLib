local _, addonTable = ...
local addon = addonTable.addon

function addon:Log(...)
    if (self.db == nil or not self.db.debug) then return end

    self:Print(...)
end

--- Uses the DevTools_Dump internally, only outputs if in debug mode
function addon:Dump(value)
    if (not self.db.debug) then return end

    DevTools_Dump(value)
end

--- Tries to dump variable
---@param table table
---@param depth number
function addon:DumpTable(table, depth)
    if (not self.db.debug) then return end

	local padding = ""

	if depth > 0 then
		padding = strrep(" ", depth)
	end

	if type(table) ~= "table" then
		print(padding, table)
	else
		for key, value in pairs(table) do
			if type(value) == "table" then
				self:DumpTable(value, depth + 1)
			else
				print(padding, key, ": ", value)
			end
		end
	end
end