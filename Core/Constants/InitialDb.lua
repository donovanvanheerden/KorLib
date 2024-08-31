local _, addonTable = ...

local defaultDb = {
    profile = {
        general = {
            font = "Expressway",
            fontSize = 12,
			uiScale = 1,
        },
        unitFrames = {
			player = false,
			playerHitIndicator = true,
			target = false,
			targetReputation = false, -- none, class, unit
			focus = false,
			focusReputation = false,
			playertargettarget = false,
			alternateManaPower = true,
			customTextures = false,
			health = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health",
			power = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana",
			characterPanel = {
				anchor = "BOTTOM",
				anchorX = 1,
				anchorY = 3,
				enabled = true,
				font = "Expressway",
				fontSize = 10
			}
        },
    },
	-- unitFrames = {
	-- 	player = {
	-- 		classColour = false,
	-- 		hitIndicator = true,
	-- 	}
	-- }
}

addonTable._Defaults.InitialDb = defaultDb