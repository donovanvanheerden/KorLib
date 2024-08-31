local _, addonTable = ...
local addon = addonTable.addon



function addon:UpdateTarget()
	local healthKey , nameKey, targetOfTarget = "target", "targetReputation", "playertargettarget"

	self:ApplyStatusBarColor(healthKey, self.db.profile.unitFrames[healthKey])
	self:ApplyStatusBarColor(nameKey, self.db.profile.unitFrames[nameKey])
	self:ApplyStatusBarColor(targetOfTarget, self.db.profile.unitFrames[targetOfTarget])
end

function addon:UpdateFocus()
	local healthKey , nameKey = "focus", "focusReputation"

	self:ApplyStatusBarColor(healthKey, self.db.profile.unitFrames[healthKey])
	self:ApplyStatusBarColor(nameKey, self.db.profile.unitFrames[nameKey])
end

function addon:GetUnitFrameOption(info)
	local key = info[#info]

	return self.db.profile.unitFrames[key]
end

function addon:SetUnitFrameOption(info, value)
	local key = info[#info] -- #info = gets index for value

	self.db.profile.unitFrames[key] = value

	if key == "playerHitIndicator" then
    self:ToggleHitIndicator()
	else
		self:ApplyStatusBarColor(key, value)
	end
end

function addon:ToggleHitIndicator()
  -- TODO: abstract out
  local hitIndicator = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator

	if self.db.profile.unitFrames.playerHitIndicator ~= true then
		-- hides player indicator text
		hitIndicator:Hide()
		hooksecurefunc(PetHitIndicator, "Show", PetHitIndicator.Hide)
  else
    hitIndicator:Show()
    hooksecurefunc(PetHitIndicator, "Show", PetHitIndicator.Show)
	end
end

--- Applies class color or unit color to selected status bar / unit frame element
---@param unitFrame string @ player, target, targetReputation, focus, focusReputation, playertargettarget, alternateManaPower
---@param enabled boolean
function addon:ApplyStatusBarColor(unitFrame, enabled)
    self:Log('Frame: ' .. unitFrame .. ' ' .. tostring(enabled))

    local isTextureOption = unitFrame == "power" or unitFrame == "health" or unitFrame == "alternatePower"

	enabled = isTextureOption and true or enabled


	if addonTable.StatusBars == nil then return end
	if addonTable.StatusBars[unitFrame] == nil then return end

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

			if unitFrame == "alternateManaPower" and addonTable.StatusBars[unitFrame].powerName == "MANA" then
                local override = self:GetPowerOverride(addonTable.StatusBars[unitFrame].powerName)

				r, g, b = override.r, override.g, override.b
			else
				r, g, b = UnitSelectionColor(target)
			end
		end
	elseif unitFrame == "power" then
		r, g, b = UnitSelectionColor(target)

        self:Log(r, g, b)
	end

	if unitFrame == "targetReputation" or unitFrame == "focusReputation" then
		if enabled then a = 1 end

		addonTable.StatusBars[unitFrame]:SetVertexColor(r, g, b, a)
	else
		addonTable.StatusBars[unitFrame]:SetStatusBarDesaturated(enabled)
		addonTable.StatusBars[unitFrame]:SetStatusBarColor(r, g, b)
	end

end

function addon:ApplyStatusBarColors()
	for key, value in pairs(self.db.profile.unitFrames) do
		self:ApplyStatusBarColor(key, value)
	end

	self:SecureHook(_G.TargetFrame, "Update", function()
		self:UpdateTarget()
	end)

	self:SecureHook(_G.FocusFrame, "Update", function()
		self:UpdateFocus()
	end)
end