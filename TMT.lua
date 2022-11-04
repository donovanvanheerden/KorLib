--- Name of the AddOn
---@type string
local AddOnName = ...

local AceAddon, AceAddonMinor = _G.LibStub("AceAddon-3.0")
local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

K = AceAddon:NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

K.name = AddOnName;
K.version = GetAddOnMetadata(AddOnName, 'Version')
K.dbName = GetAddOnMetadata(AddOnName, 'X-Database')
K.wowpatch, K.wowbuild, K.wowdate, K.wowtoc = GetBuildInfo()
K.locale = GetLocale()
K._Defaults = {}
K.db = {}

K.Shared = LibStub("LibSharedMedia-3.0")

K.Shared:Register("font", "Expressway", [[Interface\AddOns\TMT\Fonts\Expressway.ttf]])

_G.KorLib = K

function K:OnEnable()
	self:Print("v" .. self.version)
	self:Print("Enabled")

    if self.db.debug then
        self:Print("debug mode enabled")
    end
end

function K:OnInitialize()
    self.db = _G.LibStub("AceDB-3.0"):New(self.dbName, self._Defaults.InitialDb, true)

    AceConfig:RegisterOptionsTable(self.name, self.Options)

    self.optionsFrame = AceConfigDialog:AddToBlizOptions(self.name, self.name)

    local profiles = AceDbOptions:GetOptionsTable(self.db)

	AceConfig:RegisterOptionsTable("KorLib_Profiles", profiles)
	AceConfigDialog:AddToBlizOptions("KorLib_Profiles", "Profiles", self.name)

    self:ApplyFont()

    self:RegisterEvents()
    self:RegisterCommands()
end

function K:OnDisable()
    print('E - OnDisable')
end