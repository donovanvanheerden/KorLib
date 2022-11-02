local K = KorLib

function K:ApplyBarTextures()
	local customTextures = self.db.profile.unitFrames.customTextures;

	local alternatePowerTexture = self.Shared:Fetch("statusbar", "Blizzard")
	local powerTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana";
	local healthTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health"

	if customTextures then
		self.StatusBars.alternateManaPower:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.alternatePower))
		self.StatusBars.power:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.power))
		self.StatusBars.player:SetStatusBarTexture(self.Shared:Fetch("statusbar", self.db.profile.unitFrames.health))
	else
		self.StatusBars.alternateManaPower:SetStatusBarTexture(alternatePowerTexture)
		self.StatusBars.power:SetStatusBarTexture(powerTexture)
		self.StatusBars.player:SetStatusBarTexture(healthTexture)
	end

end

function K:SetBarTexture(info, value)
	local key = info[#info]

	self.db.profile.unitFrames[key] = value

	local texture = self.Shared:Fetch("statusbar", value);

	if key == "alternatePower" then
		self.StatusBars.alternateManaPower:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	elseif key == "power" then
		self.StatusBars.power:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	else
		self.StatusBars.player:SetStatusBarTexture(self.Shared:Fetch("statusbar", value))
	end

	self:RecolourUnitFrames()
end