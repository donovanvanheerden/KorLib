local T = TMT

function T:PLAYER_TARGET_CHANGED()
	local healthKey , nameKey, targetOfTarget = "target", "targetReputation", "playertargettarget"

	T:ApplyStatusBarColor(healthKey, T.db.profile.unitFrames[healthKey])
	T:ApplyStatusBarColor(nameKey, T.db.profile.unitFrames[nameKey])
	T:ApplyStatusBarColor(targetOfTarget, T.db.profile.unitFrames[targetOfTarget])
end

function T:PLAYER_FOCUS_CHANGED()
	local healthKey , nameKey = "focus", "focusReputation"

	T:ApplyStatusBarColor(healthKey, T.db.profile.unitFrames[healthKey])
	T:ApplyStatusBarColor(nameKey, T.db.profile.unitFrames[nameKey])
end

function T:GetUnitFrameOption(info)
	local key = info[#info]

	return T.db.profile.unitFrames[key]
end

function T:SetUnitFrameOption(info, value)
	local key = info[#info] -- #info = gets index for value

	T.db.profile.unitFrames[key] = value

	T:ApplyStatusBarColor(key, value)
end

--- Applies class color or unit color to selected status bar / unit frame element
---@param unitFrame string @ player, target, targetReputation, focus, focusReputation, playertargettarget, alternateManaPower
---@param enabled boolean
function T:ApplyStatusBarColor(unitFrame, enabled)
    T:Log('Frame: ' .. unitFrame .. ' ' .. tostring(enabled))

    local isTextureOption = unitFrame == "power" or unitFrame == "health" or "unitFrame" == "alternatePower"

	enabled = isTextureOption and true or enabled


	if T.StatusBars[unitFrame] == nil then return end

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

			if unitFrame == "alternateManaPower" and T.StatusBars[unitFrame].powerName == "MANA" then
                local override = T:GetPowerOverride(T.StatusBars[unitFrame].powerName)

				r, g, b = override.r, override.g, override.b
			else
				r, g, b = UnitSelectionColor(target)
			end
		end
	elseif unitFrame == "power" then
		r, g, b = UnitSelectionColor(target)

        T:Log(r, g, b)
	end

	if unitFrame == "targetReputation" or unitFrame == "focusReputation" then
		if enabled then a = 1 end

		T.StatusBars[unitFrame]:SetVertexColor(r, g, b, a)
	else
		T.StatusBars[unitFrame]:SetStatusBarDesaturated(enabled)
		T.StatusBars[unitFrame]:SetStatusBarColor(r, g, b)
	end

end

function T:ApplyStatusBarColors()
	for key, value in pairs(T.db.profile.unitFrames) do
		T:ApplyStatusBarColor(key, value)
	end
end
