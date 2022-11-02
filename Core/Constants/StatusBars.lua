local K = KorLib

local statusBars = {
	player = PlayerFrameHealthBar,
	target = TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
	targetReputation = TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	focus = FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
	focusReputation = FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
	playertargettarget = TargetFrameToT.HealthBar,
	alternateManaPower = PlayerFrameAlternateManaBar,
	power = PlayerFrameManaBar
}

K.StatusBars = statusBars