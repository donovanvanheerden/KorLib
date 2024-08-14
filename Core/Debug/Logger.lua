local _, addonTable = ...
local addon = addonTable.addon

DEVTOOLS_MAX_ENTRY_CUTOFF = 100;    -- Maximum table entries shown
DEVTOOLS_LONG_STRING_CUTOFF = 200;  -- Maximum string size shown
DEVTOOLS_DEPTH_CUTOFF = 10;         -- Maximum table depth
DEVTOOLS_USE_TABLE_CACHE = true;    -- Look up table names
DEVTOOLS_USE_FUNCTION_CACHE = true; -- Look up function names
DEVTOOLS_USE_USERDATA_CACHE = true; -- Look up userdata names
DEVTOOLS_INDENT='  ';               -- Indentation string

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