--- Name of the AddOn
---@type string
local AddOnName = ...

local AceAddon, AceAddonMinor = _G.LibStub("AceAddon-3.0")
local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

K = AceAddon:NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0")

K.name = AddOnName;
K.version = GetAddOnMetadata(AddOnName, 'Version')
K.wowpatch, K.wowbuild, K.wowdate, K.wowtoc = GetBuildInfo()
K.locale = GetLocale()
K._Defaults = {}


_G.KorLib = K

function K:OnEnable()
	self:Print("v" .. self.version)
	self:Print("Enabled")
end

function K:OnInitialize()
    self.db = _G.LibStub("AceDB-3.0"):New("KorDB", self._Defaults.InitialDb, false)

    AceConfig:RegisterOptionsTable(self.name, self.Options)

    self.optionsFrame = AceConfigDialog:AddToBlizOptions(self.name, self.name)

    local profiles = AceDbOptions:GetOptionsTable(self.db)

	AceConfig:RegisterOptionsTable("KorLib_Profiles", profiles)
	AceConfigDialog:AddToBlizOptions("KorLib_Profiles", "Profiles", self.name)

    self:RegisterEvents()
    self:RegisterCommands()

    self:ApplyStatusBarColors()
end