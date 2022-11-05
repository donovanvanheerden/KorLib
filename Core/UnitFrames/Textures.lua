local T = TMT

function T:ApplyBarTextures()
	local customTextures = T.db.profile.unitFrames.customTextures;

	local alternatePowerTexture = T.Shared:Fetch("statusbar", "Blizzard")
	local powerTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana";
	local healthTexture = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health"

	if customTextures then
		T.StatusBars.alternateManaPower:SetStatusBarTexture(T.Shared:Fetch("statusbar", T.db.profile.unitFrames.alternatePower))
		T.StatusBars.power:SetStatusBarTexture(T.Shared:Fetch("statusbar", T.db.profile.unitFrames.power))
		T.StatusBars.player:SetStatusBarTexture(T.Shared:Fetch("statusbar", T.db.profile.unitFrames.health))
	else
		T.StatusBars.alternateManaPower:SetStatusBarTexture(alternatePowerTexture)
		T.StatusBars.power:SetStatusBarTexture(powerTexture)
		T.StatusBars.player:SetStatusBarTexture(healthTexture)
	end

end

function T:SetBarTexture(info, value)
	local key = info[#info]

	T.db.profile.unitFrames[key] = value

	local texture = T.Shared:Fetch("statusbar", value);

	if key == "alternatePower" then
		T.StatusBars.alternateManaPower:SetStatusBarTexture(T.Shared:Fetch("statusbar", value))
	elseif key == "power" then
		T.StatusBars.power:SetStatusBarTexture(T.Shared:Fetch("statusbar", value))
	else
		T.StatusBars.player:SetStatusBarTexture(T.Shared:Fetch("statusbar", value))
	end

	T:RecolourUnitFrames()
end