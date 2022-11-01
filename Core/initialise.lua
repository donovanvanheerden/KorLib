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

--- Name of the AddOn
---@type string
local AddOnName = ...

local K = AceAddon:NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0")

K.name = AddOnName;
K.version = GetAddOnMetadata(AddOnName, 'X-Version')

--- Tries to dump variable
---@param table table
---@param depth number
local function dumpTable(table, depth)
	local padding = ""

	if depth > 0 then
		padding = string.strrep(" ", depth)
	end

	--print("TYPE: ",type(table))

	if type(table) ~= "table" then
		print(padding, table)
	else
		for key, value in pairs(table) do
			if type(value) == "table" then
				dumpTable(value, depth + 1)
			else
				print(padding, key, ": ", value)
			end
		end
	end
end

K.wowpatch, K.wowbuild, K.wowdate, K.wowtoc = GetBuildInfo()

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

do
	K.Libs = {}
	K.LibsMinor = {}

	function K:AddLib(name, major, minor)
		if not name then
			return
		end

		-- in this case: `major` is the lib table and `minor` is the minor version
		if type(major) == "table" and type(minor) == "number" then
			K.Libs[name], K.LibsMinor[name] = major, minor
		else -- in this case: `major` is the lib name and `minor` is the silent switch
			K.Libs[name], K.LibsMinor[name] = _G.LibStub(major, minor)
		end
	end

-- 	K:AddLib("AceAddon", AceAddon, AceAddonMinor)
-- 	K:AddLib("AceDB", "AceDB-3.0")
	K:AddLib("Shared", "LibSharedMedia-3.0")

	K.Shared = K.Libs.Shared

-- 	print(K.Shared)
end


local options = {
	name = AddOnName,
	handler = K,
	type = "group",
	args = {
		-- general = {
		-- 	type = "group",
		-- 	name = "General",
		-- 	args = {
		-- 		msg = {
		-- 			type = "input",
		-- 			name = "Echo",
		-- 			desc = "The echo output format",
		-- 			usage = "Make sure to include a [message] block where you want the echo to appear.",
		-- 			get = "GetEcho",
		-- 			set = "SetEcho",
		-- 			width = "full"
		-- 		},
		-- 		showOnScreen = {
		-- 			type = "toggle",
		-- 			name = "Show on screen",
		-- 			desc = "Toggles if the message should open a message box",
		-- 			get = "IsShowOnScreen",
		-- 			set = "SetShowOnScreen"
		-- 		},
		-- 	}
		-- },
		unitFrames = {
			type = "group",
			name = "Unit Frames",
			args = {
				heading0 = {
					type = "header",
					name = "Health Class Colors",
					order = 0
				},
				player = {
					type = "toggle",
					name = "Player",
					desc = "Enables class colors on health bar",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 1
				},
				target = {
					type = "toggle",
					name = "Target",
					desc = "Enables class / unit colors on health bar",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 2
				},
				targetReputation = {
					type = "toggle",
					name = "Target Name Background",
					desc = "Enables class / unit colors on name background",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 3
				},
				playertargettarget = {
					type = "toggle",
					name = "Target of Target",
					desc = "Enables class / unit colors on health bar",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 4
				},
				focus = {
					type = "toggle",
					name = "Focus",
					desc = "Enables class / unit colors on health bar",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 5
				},
				focusReputation = {
					type = "toggle",
					name = "Focus Name Background",
					desc = "Enables class / unit colors on name background",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 6
				},
				heading1 = {
					type = "header",
					name = "Power Colors",
					order = 7
				},
				alternateManaPower = {
					type = "toggle",
					name = "Fix alternate power bar",
					desc = "Use the same mana color as primary (Eg. see Priest mana compared mana in Shadowform)",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 8
				},
				heading2 = {
					type = "header",
					name = "Bar Textures",
					order = 9
				},
				customTextures = {
					type = "toggle",
					name = "Use custom texture",
					desc = "Enables selection of custom textures for health, power and alternate power",
					get = "GetUnitFrameOption",
					set = "SetUnitFrameOption",
					order = 10
				},
				health = {
					type = "select",
					dialogControl = "LSM30_Statusbar",
					name = "Health Texture",
					values = K.Shared:HashTable("statusbar"),
					get = "GetUnitFrameOption",
					set = "SetBarTexture",
					order = 11,
					disabled = function() return not K.db.profile.unitFrames.customTextures end
				},
				power = {
					type = "select",
					dialogControl = "LSM30_Statusbar",
					name = "Power Texture",
					values = K.Shared:HashTable("statusbar"),
					get = "GetUnitFrameOption",
					set = "SetBarTexture",
					order = 12,
					disabled = function() return not K.db.profile.unitFrames.customTextures end
				},
				alternatePower = {
					type = "select",
					dialogControl = "LSM30_Statusbar",
					name = "Alternate Power Texture",
					values = K.Shared:HashTable("statusbar"),
					get = "GetUnitFrameOption",
					set = "SetBarTexture",
					order = 13,
					disabled = function() return not K.db.profile.unitFrames.customTextures end
				}
			}
		}
	}
}

local defaults = {
	profile = {
		echoFormat = "You typed '[message]', good for you!",
		showOnScreen = false,
		unitFrames = {
			player = false,
			target = false,
			targetReputation = false, -- none, class, unit
			focus = false,
			focusReputation = false,
			playertargettarget = false,
			alternateManaPower = false,
			customTextures = false
		}
	}
}

local _powerOverrides = {
	MANA = {
		r = 0.0470588235294118,
		g = 0.4862745098039216,
		b = 0.9568627450980392
	}
}

local frames = {
	player = PlayerFrameHealthBar,
	target = TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
	targetReputation = TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	focus = FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
	focusReputation = FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	playertargettarget = TargetFrameToT.HealthBar,
	alternateManaPower = PlayerFrameAlternateManaBar
}

function K:OnInitialize()
	self.db = _G.LibStub("AceDB-3.0"):New("KorDB", defaults, false)

	AceConfig:RegisterOptionsTable(AddOnName, options)

	self.optionsFrame = AceConfigDialog:AddToBlizOptions(AddOnName, AddOnName)

	local profiles = AceDbOptions:GetOptionsTable(self.db)

	AceConfig:RegisterOptionsTable("KorLib_Profiles", profiles)
	AceConfigDialog:AddToBlizOptions("KorLib_Profiles", "Profiles", AddOnName)

	self:RegisterChatCommand("k", "SlashCommand")
	self:RegisterChatCommand("kl", "SlashCommand")
end

function K:OnEnable()
	self:Print("v"..self.version)
	self:Print("Enabled")

	--self:ApplyBarTextures()
	self:RecolourUnitFrames()

	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_FOCUS_CHANGED")
end

function K:GetUnitFrameOption(info)
	local key = info[#info]

	return self.db.profile.unitFrames[key]
end

function K:SetUnitFrameOption(info, value)
	local key = info[#info] -- #info = gets index for value

	self.db.profile.unitFrames[key] = value

	if key == "customTextures" then
		self:ApplyBarTextures()
		self:RecolourUnitFrames()
	else
		self:RecolourUnitFrame(key, value)
	end
end

function K:ApplyBarTextures()
	local customTextures = self.db.profile.unitFrames.customTextures;

	local alternatePowerTexture = self.Shared:Fetch("statusbar", "Blizzard")
	local powerTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana";
	local healthTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health"

	if customTextures then
		frames.alternateManaPower:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.alternatePower))
		PlayerFrameManaBar:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.power))
		frames.player:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.health))
	else
		frames.alternateManaPower:SetStatusBarTexture(alternatePowerTexture)
		PlayerFrameManaBar:SetStatusBarTexture(powerTexture)
		frames.player:SetStatusBarTexture(healthTexture)
	end

end

function K:SetBarTexture(info, value)
	local key = info[#info]

	self.db.profile.unitFrames[key] = value

	local texture = self.Shared:Fetch("statusbar", value);

	if key == "alternatePower" then
		frames.alternateManaPower:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	elseif key == "power" then
		PlayerFrameManaBar:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	else
		frames.player:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	end

	self:RecolourUnitFrames()
end

function K:PLAYER_TARGET_CHANGED()
	local healthKey , nameKey, targetOfTarget = "target", "targetReputation", "playertargettarget"

	self:RecolourUnitFrame(healthKey, self.db.profile.unitFrames[healthKey])
	self:RecolourUnitFrame(nameKey, self.db.profile.unitFrames[nameKey])
	self:RecolourUnitFrame(targetOfTarget, self.db.profile.unitFrames[targetOfTarget])
end

function K:PLAYER_FOCUS_CHANGED()
	local healthKey , nameKey = "focus", "focusReputation"

	self:RecolourUnitFrame(healthKey, self.db.profile.unitFrames[healthKey])
	self:RecolourUnitFrame(nameKey, self.db.profile.unitFrames[nameKey])
end

function K:RecolourUnitFrame(unitFrame, enabled)
	if frames[unitFrame] == nil then return end

	local target = string.gsub(unitFrame, "Reputation", "")

	local r, g, b, a

	if unitFrame == "targetReputation" or unitFrame == "focusReputation" then
		r, g, b, a = 0, 0, 0, 0.2
	else
		r, g, b = 1, 1, 1 --UnitReaction(target) TODO: figure out better way to deal with colours
	end

	if unitFrame == "alternateManaPower" then
		r, g, b = 0, 0, 1
	end

	local isPlayer = UnitIsPlayer(target)

	if enabled then
		if isPlayer then
			local _, class = UnitClass(target)
			r, g, b = GetClassColor(class)
		else

			if unitFrame == "alternateManaPower" and frames[unitFrame].powerName == "MANA" then
				r, g, b = _powerOverrides["MANA"].r, _powerOverrides["MANA"].g, _powerOverrides["MANA"].b
			else
				r, g, b = UnitSelectionColor(target)
			end
		end
	end

	if unitFrame == "targetReputation" or unitFrame == "focusReputation" then
		if enabled then a = 1 end

		frames[unitFrame]:SetVertexColor(r, g, b, a)
	else

		--print(unitFrame, ' ', r, g, b)

		frames[unitFrame]:SetStatusBarDesaturated(enabled)
		frames[unitFrame]:SetStatusBarColor(r, g, b)
	end
end

function K:RecolourUnitFrames()
	for key, value in pairs(self.db.profile.unitFrames) do
		self:RecolourUnitFrame(key, value)
	end
end

function K:OnDisable()
	self:Print("Disabled")
end

function K:SlashCommand(input)
	if InCombatLockdown() then
		self:Print("Cannot access options during combat.")
		return
	end

	AceConfigDialog:Open(self.name)
end