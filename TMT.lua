--- Name of the AddOn
---@type string
local AddOnName = ...

local AceAddon, AceAddonMinor = _G.LibStub("AceAddon-3.0")
local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

T = AceAddon:NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

T.name = AddOnName;
T.version = GetAddOnMetadata(AddOnName, 'Version')
T.dbName = GetAddOnMetadata(AddOnName, 'X-Database')
T.wowpatch, T.wowbuild, T.wowdate, T.wowtoc = GetBuildInfo()
T.locale = GetLocale()
T._Defaults = {}
T.db = {}

T.Shared = LibStub("LibSharedMedia-3.0")

T.Shared:Register("font", "Expressway", [[Interface\AddOns\TMT\Fonts\Expressway.ttf]])

_G.TMT = T

function T:OnEnable()
	T:Print("v" .. T.version)
	T:Print("Enabled")

    if T.db.debug then
        T:Print("debug mode enabled")
    end
end

function T:OnInitialize()
    T.db = _G.LibStub("AceDB-3.0"):New(T.dbName, T._Defaults.InitialDb, true)

    AceConfig:RegisterOptionsTable(T.name, T.Options)

    T.optionsFrame = AceConfigDialog:AddToBlizOptions(T.name, T.name)

    local profiles = AceDbOptions:GetOptionsTable(T.db)

	AceConfig:RegisterOptionsTable("KorLib_Profiles", profiles)
	AceConfigDialog:AddToBlizOptions("KorLib_Profiles", "Profiles", T.name)

    T:ApplyFont()

    T:RegisterEvents()
    T:RegisterCommands()
end

function T:OnDisable()
    print('E - OnDisable')
end