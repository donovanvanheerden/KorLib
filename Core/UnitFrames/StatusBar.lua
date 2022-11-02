local K = KorLib

function K:PLAYER_TARGET_CHANGED()
	local healthKey , nameKey, targetOfTarget = "target", "targetReputation", "playertargettarget"

	self:ApplyStatusBarColor(healthKey, self.db.profile.unitFrames[healthKey])
	self:ApplyStatusBarColor(nameKey, self.db.profile.unitFrames[nameKey])
	self:ApplyStatusBarColor(targetOfTarget, self.db.profile.unitFrames[targetOfTarget])
end

function K:PLAYER_FOCUS_CHANGED()
	local healthKey , nameKey = "focus", "focusReputation"

	self:ApplyStatusBarColor(healthKey, self.db.profile.unitFrames[healthKey])
	self:ApplyStatusBarColor(nameKey, self.db.profile.unitFrames[nameKey])
end

function K:ApplyStatusBarColor(unitFrame, enabled)
    K:Log('Frame: ' .. unitFrame .. ' ' .. tostring(enabled))

    local isTextureOption = unitFrame == "power" or unitFrame == "health" or "unitFrame" == "alternatePower"

	enabled = isTextureOption and true or enabled


	if self.StatusBars[unitFrame] == nil then return end

	local target = string.gsub(unitFrame, "Reputation", "")

	local r, g, b, a

	if unitFrame == "targetReputation" or unitFrame == "focusReputation" then
		r, g, b, a = 0, 0, 0, 0.2
	else
		r, g, b = 1, 1, 1 --UnitReaction(target) TODO: figure out better way to deal with colours
	end

	if unitFrame == "alternateManaPower" then
		r, g, b = 0, 0, 1
	end

	local isPlayer = UnitIsPlayer(target)

	if enabled then
		if isPlayer then
			local _, class = UnitClass(target)
			r, g, b = GetClassColor(class)
		else

			if unitFrame == "alternateManaPower" and self.StatusBars[unitFrame].powerName == "MANA" then
                local override = self:GetPowerOverride(self.StatusBars[unitFrame].powerName)

				r, g, b = override.r, override.g, override.b
			else
				r, g, b = UnitSelectionColor(target)
			end
		end
	elseif unitFrame == "power" then
		r, g, b = UnitSelectionColor(target)

        K:Log(r, g, b)
	end

	if unitFrame == "targetReputation" or unitFrame == "focusReputation" then
		if enabled then a = 1 end

		self.StatusBars[unitFrame]:SetVertexColor(r, g, b, a)
	else
		self.StatusBars[unitFrame]:SetStatusBarDesaturated(enabled)
		self.StatusBars[unitFrame]:SetStatusBarColor(r, g, b)
	end

end

function K:ApplyStatusBarColors()
	for key, value in pairs(self.db.profile.unitFrames) do
		self:ApplyStatusBarColor(key, value)
	end
end