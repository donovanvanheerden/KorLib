local K = KorLib

local defaultDb = {
    profile = {
        general = {
            font = "Friz Quadrata TT",
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

K._Defaults.InitialDb = defaultDb