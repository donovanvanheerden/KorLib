local T = TMT

local defaultDb = {
    profile = {
        general = {
            font = "2002",
            fontSize = 12
        },
        unitFrames = {
			player = false,
			target = false,
			targetReputation = false, -- none, class, unit
			focus = false,
			focusReputation = false,
			playertargettarget = false,
			alternateManaPower = true,
			customTextures = false,
			health = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health",
			power = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana"
        }
    }
}

T._Defaults.InitialDb = defaultDb