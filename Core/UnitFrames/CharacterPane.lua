local _, addonTable = ...
local addon = addonTable.addon
local defaults = addonTable._Defaults

local ITEM_SLOT_FRAMES = {
	CharacterHeadSlot,CharacterNeckSlot,CharacterShoulderSlot,CharacterBackSlot,CharacterChestSlot,CharacterWristSlot,
	CharacterHandsSlot,CharacterWaistSlot,CharacterLegsSlot,CharacterFeetSlot,
	CharacterFinger0Slot,CharacterFinger1Slot,CharacterTrinket0Slot,CharacterTrinket1Slot,
	CharacterMainHandSlot,CharacterSecondaryHandSlot,
}

function addon:CharacterPanelDisabled()
	return self:GetCharacterPanelOption({'enabled'}) == false
end

function addon:GetCharacterPanelOption(info)
	local key = info[#info]

	return self.db.profile.unitFrames.characterPanel[key]
end

function addon:SetCharacterPanelOption(info, value)
	local key = info[#info] -- #info = gets index for value

	self.db.profile.unitFrames.characterPanel[key] = value

	if (key == 'enabled') then
		self:SetItemLevelValues()
	else
		self:PositionILevelSlots()
	end
end

for _, slot in ipairs(ITEM_SLOT_FRAMES) do
    slot.ilevel = slot:CreateFontString("FontString", "OVERLAY", "GameTooltipText")
    slot.ilevel:SetFormattedText("")
end

function addon:ClearAll()
	for _, slot in ipairs(ITEM_SLOT_FRAMES) do
        slot.ilevel:SetFormattedText("")
    end
end

function addon:PositionILevelSlots()
	local anchor = self:GetCharacterPanelOption({'anchor'})
	local x = self:GetCharacterPanelOption({'anchorX'})
	local y = self:GetCharacterPanelOption({'anchorY'})
	local font = self:GetFont(self:GetCharacterPanelOption({'font'}))
	local fontSize = self:GetCharacterPanelOption({'fontSize'}) or defaults.InitialDb.characterPanel.fontSize

    for _, slot in ipairs(ITEM_SLOT_FRAMES) do
        slot.ilevel:ClearAllPoints()

        slot.ilevel:SetFont(font, fontSize, "THINOUTLINE");
        slot.ilevel:SetPoint(anchor, x, y)
    end
end



local function attempt_ilvl(slot, attempts)
	if attempts > 0 then
		local nItem = Item:CreateFromEquipmentSlot(slot:GetID())
		local value = nItem:GetCurrentItemLevel()

		if value then --ilvl of nil probably indicates that there's no item in that slot
			if value > 0 then --ilvl of 0 probably indicates that item is not fully loaded
				local r, g, b = GetItemQualityColor(nItem:GetItemQuality());
				slot.ilevel:SetTextColor(r, g, b, 1) --upvalue call
				slot.ilevel:SetText(value)
			else
				C_Timer.After(0.2, function() attempt_ilvl(slot, attempts - 1) end)
			end
		else
			slot.ilevel:SetText("")
		end
	end
end

function addon:SetItemLevelValues()
	if (self:CharacterPanelDisabled()) then
		self:ClearAll()
	else
		for _, v in ipairs(ITEM_SLOT_FRAMES) do
			attempt_ilvl(v, 20)
		end
	end
end

-- THIS IS FOR TOGGLING ON / OFF
local ShowItemLevelCheck = CreateFrame("Frame", "ShowItemLevelCheck", UIParent)
	ShowItemLevelCheck:RegisterEvent("PLAYER_LOGIN")
-- 	DCS_ShowItemLevelCheck:ClearAllPoints()
-- 	DCS_ShowItemLevelCheck:SetPoint("TOPLEFT", "dcsItemsPanelCategoryFS", 7, -15)
-- 	DCS_ShowItemLevelCheck:SetScale(1)
-- 	DCS_ShowItemLevelCheck.tooltipText = L["Displays the item level of each equipped item."] --Creates a tooltip on mouseover.
-- 	_G[DCS_ShowItemLevelCheck:GetName() .. "Text"]:SetText(L["Item Level"])
	
ShowItemLevelCheck:SetScript("OnEvent", function(self, ...)
	-- showitemlevel = gdbprivate.gdb.gdbdefaults.dejacharacterstatsShowItemLevelChecked.ShowItemLevelSetChecked
	-- self:SetChecked(showitemlevel)
	addon:PositionILevelSlots()
end)

-- ShowItemLevelCheck:SetScript("OnClick", function(self)
-- 	-- showitemlevel = not showitemlevel
-- 	-- gdbprivate.gdb.gdbdefaults.dejacharacterstatsShowItemLevelChecked.ShowItemLevelSetChecked = showitemlevel
-- 	T:PositionILevelSlots() --is this call needed? (Yes, it is -Deja)
-- 	-- if showitemlevel then --TODO: rewrite of DCS_Item_Level_Center because in 3 places the same code
-- 		SetItemLevelValues()
-- 	-- else
-- 	-- 	for _, v in ipairs(DCSITEM_SLOT_FRAMES) do
-- 	-- 		v.ilevel:SetFormattedText("")
-- 	-- 	end
-- 	-- end
-- end)

local ShowItemLevelChange = CreateFrame("Frame", "ShowItemLevelChange", UIParent)
	ShowItemLevelChange:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	ShowItemLevelChange:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")

ShowItemLevelChange:SetScript("OnEvent", function(self, ...)
	if PaperDollFrame:IsVisible() then
		-- if showitemlevel then
			C_Timer.After(0.25, function() addon:SetItemLevelValues() end) --Event fires before Artifact changes so we have to wait a fraction of a second.
		-- else
			for _, slot in ipairs(ITEM_SLOT_FRAMES) do
				slot.ilevel:SetFormattedText("")
			end
		-- end
	end
end)

PaperDollFrame:HookScript("OnShow", function(self)
	-- if showitemlevel then
		addon:SetItemLevelValues()
	-- else
	-- 	for _, v in ipairs(DCSITEM_SLOT_FRAMES) do
	-- 		v.ilevel:SetFormattedText("")
	-- 	end
	-- end
	-- if showrepair then
	-- 	DCS_Item_RepairCostBottom()
	-- else
	-- 	for _, v in ipairs(DCSITEM_SLOT_FRAMES) do
	-- 		v.itemrepair:SetFormattedText("")
	-- 	end
	-- end
	-- if showavgdur then
	-- 	DCS_Mean_Durability()
	-- 	if addon.duraMean == 100 then --check after calculation
	-- 		duraMeanFS:SetFormattedText("")
	-- 	else
	-- 		duraMeanFS:SetFormattedText("%.0f%%", addon.duraMean)
	-- 	end
	-- else
	-- 	duraMeanFS:SetFormattedText("")
	-- 	duraDurabilityFrameFS:Hide()
	-- end
	-- if showdura then
	-- 	DCS_Item_DurabilityTop()
	-- else
	-- 	for _, v in ipairs(DCSITEM_SLOT_FRAMES) do
	-- 		v.durability:SetFormattedText("")
	-- 	end
	-- end
	-- if showtextures then
	-- 	DCS_Durability_Bar_Textures()
	-- 	duraMeanTexture:Show()
	-- else
	-- 	for _, v in ipairs(DCSITEM_SLOT_FRAMES) do
	-- 		v.duratexture:Hide()
	-- 	end
	-- 	duraMeanTexture:Hide()
	-- end
end)