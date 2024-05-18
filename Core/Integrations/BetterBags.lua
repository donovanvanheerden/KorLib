local addonName, addonTable = ...
local addon = addonTable.addon

---@class BetterBags: AceAddon
local BetterBags = LibStub("AceAddon-3.0"):GetAddon("BetterBags")
assert(BetterBags, "The Missing Tidbits requires BetterBags")

---@class BagFrame: AceModule
local BagFrame = BetterBags:GetModule('BagFrame')

---@class Events: AceModule
local events = BetterBags:GetModule('Events')

---@class MoneyFrame: AceModule
local money = BetterBags:GetModule('MoneyFrame')

---@class Categories: AceModule
local categories = BetterBags:GetModule("Categories")

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

            currencyIndex = currencyIndex + 1
        until currencyIndex > C_CurrencyInfo.GetCurrencyListSize()

        bag.currencyFrame.iconGrid:GetContainer():SetWidth(width)
    end
end

local function CategoriseGems()
    for gemId in pairs(addonTable.gemData) do
        for itemId in pairs(addonTable.gemData[gemId]) do

            categories:AddItemToCategory(itemId, "MoP Remix: "..titleCase(gemId.." gems"))
        end
    end
end

function addon:BetterBags()
    events:RegisterMessage('bag/Rendered', onBagRendered)

    CategoriseGems()

    print('BetterBags: '.. addonName .. ' integration enabled.')
end

function titleCase(value)
    local function titleCaseWord(first, rest)
        return first:upper()..rest:lower()
    end

    return string.gsub(value, "(%a)([%w_']*)", titleCaseWord)
end