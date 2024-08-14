local addonName, addonTable = ...

local AceAddon, AceAddonMinor = _G.LibStub("AceAddon-3.0")
local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

addonTable.addon = AceAddon:NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

local addon = addonTable.addon

addon.name = addonName;
addon.version = C_AddOns.GetAddOnMetadata(addonName, 'Version')
addon.dbName = C_AddOns.GetAddOnMetadata(addonName, 'X-Database')
addon.wowpatch, addon.wowbuild, addon.wowdate, addon.wowtoc = GetBuildInfo()
addon.locale = GetLocale()
addonTable._Defaults = {}
addon.db = {}

addon.Shared = LibStub("LibSharedMedia-3.0")

addon.Shared:Register("font", "Expressway", [[Interface\AddOns\]]..addonName..[[\Fonts\Expressway.ttf]])

_G[addonName] = addonTable

function addon:OnEnable()
	addon:Print("v" .. addon.version)
	addon:Print("Enabled")

    if addon.db.debug then
        addon:Print("debug mode enabled")
    end

    -- Register Addon Integrations
	addon:RegisterIntegrations()
end

function addon:OnInitialize()
    addon.db = _G.LibStub("AceDB-3.0"):New(addon.dbName, addonTable._Defaults.InitialDb, true)

    local options = addon:GetOptions()

    AceConfig:RegisterOptionsTable(addon.name, options)

    addon.optionsFrame = AceConfigDialog:AddToBlizOptions(addon.name, addon.name)

    local profiles = AceDbOptions:GetOptionsTable(addon.db)

	AceConfig:RegisterOptionsTable(addon.name.."_Profiles", profiles)
	AceConfigDialog:AddToBlizOptions(addon.name.."_Profiles", "Profiles", addon.name)

    -- addon:ApplyFont()

    addon:RegisterEvents()
    addon:RegisterCommands()
end

function addon:OnDisable()
    print('E - OnDisable')
end