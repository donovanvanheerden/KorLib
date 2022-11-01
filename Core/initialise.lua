local RegisterCVar = C_CVar.RegisterCVar
local GetAddOnEnableState = GetAddOnEnableState
local GetAddOnMetadata = GetAddOnMetadata
local GetBuildInfo = GetBuildInfo
local GetTime = GetTime
local CreateFrame = CreateFrame
local DisableAddOn = DisableAddOn
local IsAddOnLoaded = IsAddOnLoaded
local ReloadUI = ReloadUI

local AceAddon, AceAddonMinor = _G.LibStub("AceAddon-3.0")

local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

local AddOnName, Engine = ...

local K = AceAddon:NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0")



K.wowpatch, K.wowbuild, K.wowdate, K.wowtoc = GetBuildInfo()

local options = {
	name = AddOnName,
	handler = K,
	type = "group",
	args = {
		msg = {
			type = "input",
			name = "Echo",
			desc = "The echo output format",
			usage = "Make sure to include a [message] block where you want the echo to appear.",
			get = "GetEcho",
			set = "SetEcho",
			width = "full"
		},
		showOnScreen = {
			type = "toggle",
			name = "Show on screen",
			desc = "Toggles if the message should open a message box",
			get = "IsShowOnScreen",
			set = "SetShowOnScreen"
		}
	}
}

local defaults = {
	profile = {
		echoFormat = "You typed '[message]', good for you!",
		showOnScreen = false
	}
};

do

	K.db = _G.LibStub("AceDB-3.0"):New(AddOnName, defaults, false)
end

function K:GetEcho()
	return self.db.profile.echoFormat
end

function K:SetEcho(_, value)
	self.db.profile.echoFormat = value
end

function K:IsShowOnScreen()
	return self.db.profile.showOnScreen
end

function K:SetShowOnScreen(_, value)
	self.db.profile.showOnScreen = value
end

-- for key, value in pairs(C_CVar) do
-- 	print(key, ": ", value)
-- end

-- do
-- 	K.Libs = {}
-- 	K.LibsMinor = {}

-- 	function K:AddLib(name, major, minor)
-- 		if not name then
-- 			return
-- 		end

-- 		-- in this case: `major` is the lib table and `minor` is the minor version
-- 		if type(major) == "table" and type(minor) == "number" then
-- 			K.Libs[name], K.LibsMinor[name] = major, minor
-- 		else -- in this case: `major` is the lib name and `minor` is the silent switch
-- 			K.Libs[name], K.LibsMinor[name] = _G.LibStub(major, minor)
-- 		end
-- 	end

-- 	K:AddLib("AceAddon", AceAddon, AceAddonMinor)
-- 	K:AddLib("AceDB", "AceDB-3.0")
-- 	K:AddLib("Shared", "LibSharedMedia-3.0")

-- 	K.Shared = K.Libs.Shared

-- 	print(K.Shared)
-- end

function K:OnInitialize()
	self.db = _G.LibStub("AceDB-3.0"):New("KorDB", defaults, false)

	AceConfig:RegisterOptionsTable(AddOnName, options)

	self.optionsFrame = AceConfigDialog:AddToBlizOptions(AddOnName, AddOnName)

	local profiles = AceDbOptions:GetOptionsTable(self.db)

	AceConfig:RegisterOptionsTable("KorLib_Profiles", profiles)
	AceConfigDialog:AddToBlizOptions("KorLib_Profiles", "Profiles", AddOnName)

	self:RegisterChatCommand("k", "SlashCommand");
	self:RegisterChatCommand("kl", "SlashCommand");
end

function K:OnEnable()
	self:Print("Enabled")
end

function K:OnDisable()
	self:Print("Disabled")
end

function K:SlashCommand(message)
	if message == "" then return end

	local output = ""

	if message == "ping" then
		output = "pong"
	else
		output = string.gsub(self.db.profile.echoFormat, "%[message%]", message)
	end

	if self.db.profile.showOnScreen then
		UIErrorsFrame:AddMessage(output, 1, 1, 1)
	else
		self:Print(output)
	end
end

-- function K:OnEnable()
-- 	K:Initialize()
-- end

-- function K:OnInitialize()
	-- local frame = CreateFrame()

	-- frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
	-- frame:SetTitle("AceGUI-3.0 Example")
	-- frame:SetStatusText("Status Bar")
	-- frame:SetLayout("Flow")

	-- -- Create a button
	-- local btn = AceGUI:Create("Button")
	-- btn:SetWidth(170)
	-- btn:SetText("Button !")
	-- btn:SetCallback("OnClick", function() print("Click!") end)

	-- -- Add the button to the container
	-- frame:AddChild(btn)
-- end
