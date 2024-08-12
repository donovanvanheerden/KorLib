local addonName, addonTable = ...
local addon = addonTable.addon

local betterBags = addon:NewModule("BetterBags")

---@param bag Bag
local function onBagRendered(_, bag, arg3)
	local font = addon:GetFont()
    local fontSize = 11
    local currencyPadding = 9

    local ilvlFontSize = 11
    local ilvlFontStyle = "THINOUTLINE"

    -- slots, views
    -- tried: bag.slots.content.cells
    for _, cell in pairs(bag.views) do

        if cell.itemFrames ~= nil then
            for _, item in pairs(cell.itemFrames) do
                -- for key, value in pairs(item.button.ItemContextOverlay) do
                --     print(key, value, type(value))
                -- end

                item.ilvlText:SetFont(font, ilvlFontSize, ilvlFontStyle)
                -- item.button:SetFont(font, ilvlFontSize, ilvlFontStyle)
                -- print(item.button:GetItemButtonCount())

            end
        end

        -- for key, value in pairs(cell) do
        --     print(key, value, type(value))
        -- end

        -- print('count', cell.frame.count)

        -- local item = cell.frame:GetItem()

        -- if (item ~= nil) then
        --     print(cell.frame:GetItem())
        -- end
    end

    if bag.moneyFrame ~= nil then
        for key, button in pairs(bag.moneyFrame) do
            if key == 'copperButton' or key == 'silverButton' or key == 'goldButton' then
                button:GetFontString():SetFont(font, fontSize)
            end
        end
    end

    if bag.currencyFrame ~= nil then
        local currencyIndex = 1
        local width = 0

        for _, item in pairs(bag.currencyFrame.iconGrid.cells) do
            item.count:SetFont(font, fontSize)

            width = width + item.count:GetStringWidth() + item.icon:GetWidth() + currencyPadding
        end

        repeat
            local info = C_CurrencyInfo.GetCurrencyListInfo(currencyIndex)

            local item = bag.currencyFrame:GetCurrencyItem(currencyIndex, info)

            if item then

                item.count:SetFont(font, 12)

                local fn = item.frame:GetScript("OnMouseDown");

                item.frame:SetScript('OnMouseDown', function()
                    fn()

                    local info = C_CurrencyInfo.GetCurrencyListInfo(item.index)

                    if (info.isShowInBackpack) then
                        for _, item in pairs(bag.currencyFrame.iconGrid.cells) do
                            item.count:SetFont(font, fontSize)

                            width = width + item.count:GetStringWidth() + item.icon:GetWidth() + currencyPadding
                        end
                    end
                end)
            end

            currencyIndex = currencyIndex + 1
        until currencyIndex > C_CurrencyInfo.GetCurrencyListSize()

        bag.currencyFrame.iconGrid:GetContainer():SetWidth(width)
    end
end

-- local function CategoriseGems()
--     for gemId in pairs(addonTable.timerunning.gems) do
--         for itemId in pairs(addonTable.timerunning.gems[gemId]) do
--             betterBags.categories:AddItemToCategory(itemId, "MoP Remix: "..titleCase(gemId.." gems"))
--         end
--     end
-- end

function titleCase(value)
    local function titleCaseWord(first, rest)
        return first:upper()..rest:lower()
    end

    return string.gsub(value, "(%a)([%w_']*)", titleCaseWord)
end

function betterBags:OnEnable()
    if not BetterBags_ToggleBags then return end

    local BetterBags = LibStub("AceAddon-3.0"):GetAddon("BetterBags")

    local events = BetterBags:GetModule('Events')
    local fonts = BetterBags:GetModule('Fonts')

    -- overide fonts
    fonts.UnitFrame12White:SetFont(addon:GetFont(), 12, "")
    fonts.UnitFrame12Yellow:SetFont(addon:GetFont(), 12, "")

    events:RegisterMessage('bag/Rendered', onBagRendered)

    -- CategoriseGems()

    addon:Print('BetterBags integration enabled.')
end