local T = TMT

local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

function T:RegisterEvents()
	T:RegisterEvent("PLAYER_TARGET_CHANGED")
	T:RegisterEvent("PLAYER_FOCUS_CHANGED")
	T:RegisterEvent("PLAYER_LOGIN")
	T:RegisterEvent("ADDON_LOADED")
end

function T:RegisterCommands()
    T:RegisterChatCommand("k", "SlashCommand")
	T:RegisterChatCommand("kl", "SlashCommand")
end

function T:SlashCommand(input)
	if InCombatLockdown() then
		T:Print("Cannot access options during combat.")
		return
	end

	if input == "debug" then
		T.db.debug = not T.db.debug
		T:Print("debug: " .. (T.db.debug and "on" or "off"))
	elseif input:trim() == "" then
		AceConfigDialog:Open(T.name)
	end
end

function T:PLAYER_LOGIN()
    T:ApplyFont()
    T:ApplyStatusBarColors()

    T:SecureHook("FCF_SetChatWindowFontSize", "FontSizeChanged")
end

function T:ADDON_LOADED()
    T:ApplyFont()
end