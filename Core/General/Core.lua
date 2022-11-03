local K = KorLib

local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

function K:RegisterEvents()
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_FOCUS_CHANGED")
	self:RegisterEvent("PLAYER_LOGIN")
end

function K:RegisterCommands()
    self:RegisterChatCommand("k", "SlashCommand")
	self:RegisterChatCommand("kl", "SlashCommand")
end

function K:SlashCommand(input)
	if InCombatLockdown() then
		self:Print("Cannot access options during combat.")
		return
	end

	if input == "debug" then
		self.debug = not self.debug
		self:Print("Debug: " .. (self.debug and "on" or "off"))
	elseif input:trim() == "" then
		AceConfigDialog:Open(self.name)
	end
end
