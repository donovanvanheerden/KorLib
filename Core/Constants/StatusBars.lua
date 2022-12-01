local T = TMT

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

T.StatusBars = statusBars