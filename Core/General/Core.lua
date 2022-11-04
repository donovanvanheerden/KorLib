local K = KorLib

local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

function K:RegisterEvents()
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_FOCUS_CHANGED")
	self:RegisterEvent("PLAYER_LOGIN")
	self:RegisterEvent("ADDON_LOADED")
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
		self.db.debug = not self.db.debug
		self:Print("debug: " .. (self.db.debug and "on" or "off"))
	elseif input:trim() == "" then
		AceConfigDialog:Open(self.name)
	end
end

function K:PLAYER_LOGIN()
	print('E - PLAYER_LOGIN')
    self:ApplyFont()
    self:ApplyStatusBarColors()

    self:SecureHook("FCF_SetChatWindowFontSize", "FontSizeChanged")
end

function K:ADDON_LOADED()
	print('E - ADDON_LOADED')

    self:ApplyFont()
end

function K:OnEvent(event)
	print('E - '..event)
end