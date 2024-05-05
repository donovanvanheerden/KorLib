local _, addonTable = ...

addonTable.units = {
	player = "player",
	focus = "focus",
	target = "target",
	targetOfTarget = "targetOfTarget"
}

addonTable.unitFrames = {
	player =
	{
		alternatePowerBar = _G.PlayerFrameAlternateManaBar,
		frame = _G.PlayerFrame,
		frameTexture = _G.PlayerFrame.PlayerFrameContainer.FrameTexture,
		healthBar =_G. PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar,
		powerBar = _G.PlayerFrameManaBar,
	},
	focus = {
		frame = _G.FocusFrame,
		healthBar = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
		reputationColour = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	},
	focusTarget = {},
	target = {
		frame = _G.TargetFrame,
		healthBar = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
		reputationColour = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	},
	targetOfTarget = {
		frame = _G.TargetFrameToT,
		healthBar = _G.TargetFrameToT.HealthBar,
	},
}

local statusBars = {
	player = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar,
	target = TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
	targetReputation = TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	focus = FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
	focusReputation = FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	playertargettarget = TargetFrameToT.HealthBar,
	alternateManaPower = PlayerFrameAlternateManaBar,
	power = PlayerFrameManaBar
}

addonTable.StatusBars = statusBars