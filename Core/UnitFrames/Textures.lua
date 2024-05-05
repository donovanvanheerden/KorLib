local _, addonTable = ...
local addon = addonTable.addon

function addon:ApplyBarTextures()
	local customTextures = self.db.profile.unitFrames.customTextures;

	local alternatePowerTexture = self.Shared:Fetch("statusbar", "Blizzard")
	local powerTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana";
	local healthTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health"

	if customTextures then
		addonTable.StatusBars.alternateManaPower:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.alternatePower))
		addonTable.StatusBars.power:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.power))
		addonTable.StatusBars.player:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.health))
	else
		addonTable.StatusBars.alternateManaPower:SetStatusBarTexture(alternatePowerTexture)
		addonTable.StatusBars.power:SetStatusBarTexture(powerTexture)
		addonTable.StatusBars.player:SetStatusBarTexture(healthTexture)
	end

end

function addon:SetBarTexture(info, value)
	local key = info[#info]

	self.db.profile.unitFrames[key] = value

	local texture = self.Shared:Fetch("statusbar", value);

	if key == "alternatePower" then
		addonTable.StatusBars.alternateManaPower:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	elseif key == "power" then
		addonTable.StatusBars.power:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	else
		addonTable.StatusBars.player:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	end

	self:RecolourUnitFrames()
end