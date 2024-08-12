local _, addonTable = ...

local addon = addonTable.addon
local defaults = addonTable._Defaults

local text = addon:NewModule("Text");

-- TODO, convert to module

-- TODO, transform so that we get font defaults on the fonts object
local fonts = {
    -- zone, cd, mail, quest & error
    worldZone                               = _G.ZoneTextFont,
    worldSubZone                            = _G.SubZoneTextFont,
    pvpZone                                 = _G.PVPArenaTextString,
    pvpSubZone                              = _G.PVPInfoTextString,
    cooldown                                = _G.SystemFont_Shadow_Large_Outline,
    mailBody                                = _G.MailTextFontNormal,
    questTitle                              = _G.QuestTitleFont,
    quest                                   = _G.QuestFont,
    questSmall                              = _G.QuestFontNormalSmall,
    errorText                               = _G.ErrorFont,

    -- retail specific
    objective                               = _G.ObjectiveFont,
    talkingTitle                            = _G.TalkingHeadFrame.NameFrame.Name,
    talkingText                             = _G.TalkingHeadFrame.TextFrame.Text,

    -- combat, this should check if we have it selected (damageFont = true)
    damage                                  = _G.DAMAGE_TEXT_FONT,
    combat                                  = _G.CombatTextFont,

    -- unit
    name                                    = _G.UNIT_NAME_FONT,

    -- chat bubble
    chatBubble                              = _G.ChatBubbleFont,

    -- nameplates
    systemNamePlate                         = _G.SystemFont_NamePlate,
    systemNamePlateFixed                    = _G.SystemFont_NamePlateFixed,
    systemLargeNamePlate                    = _G.SystemFont_LargeNamePlate,
    systemLargeNamePlateFixed               = _G.SystemFont_LargeNamePlateFixed,

    -- standard
    standard                                = _G.STANDARD_TEXT_FONT,

    -- raid warning
    gameNormalhuge                          = _G.GameFontNormalHuge,

    -- number fonts
    number11                                = _G.Number11Font,
    number12                                = _G.Number12Font,
    number12_o1                             = _G.Number12Font_o1,
    numberOutlineThickMonoSmall             = _G.NumberFont_OutlineThick_Mono_Small,
    numberShadowSmall                       = _G.NumberFont_Shadow_Small,
    numberSmall                             = _G.NumberFont_Small,
    numberNormalSmall                       = _G.NumberFontNormalSmall, -- Calendar, EncounterJournal, ActionBar Hotkey
    number13                                = _G.Number13Font,
    number13Gray                            = _G.Number13FontGray,
    number13White                           = _G.Number13FontWhite,
    number13Yellow                          = _G.Number13FontYellow,
    number14Gray                            = _G.Number14FontGray,
    number14White                           = _G.Number14FontWhite,
    numberOutlineMed                        = _G.NumberFont_Outline_Med,
    numberShadowMed                         = _G.NumberFont_Shadow_Med, -- Chat EditBox
    numberNormal                            = _G.NumberFontNormal,
    number15                                = _G.Number15Font,
    numberOutlineLarge                      = _G.NumberFont_Outline_Large,
    number18                                = _G.Number18Font,
    number18White                           = _G.Number18FontWhite,
    numberOutlineHuge                       = _G.NumberFont_Outline_Huge,

    -- quest fonts, with shadow
    questShadowSmall                        = _G.QuestFont_Shadow_Small,
    questShadowHuge                         = _G.QuestFont_Shadow_Huge, -- Quest Title
    questShadowSuperHuge                    = _G.QuestFont_Shadow_Super_Huge,
    questShadowEnormous                     = _G.QuestFont_Shadow_Enormous,

    -- game fonts
    systemTiny                              = _G.SystemFont_Tiny,
    achievementSmall                        = _G.AchievementFont_Small, -- Achievement dates
    friendsSmall                            = _G.FriendsFont_Small,
    game10_o1                               = _G.Game10Font_o1,
    invoiceSmall                            = _G.InvoiceFont_Small,  -- Mail
    reputationDetail                        = _G.ReputationDetailFont, -- Reputation description
    spellSmall                              = _G.SpellFont_Small,
    subSpell                                = _G.SubSpellFont,  -- Spellbook subnames
    systemOutlineSmall                      = _G.SystemFont_Outline_Small,
    systemShadowSmall                       = _G.SystemFont_Shadow_Small,
    systemSmall                             = _G.SystemFont_Small,
    tooltipSmall                            = _G.Tooltip_Small,
    friends_11                              = _G.FriendsFont_11,
    friendsUser                             = _G.FriendsFont_UserText,
    gameHighlightSmall2                     = _G.GameFontHighlightSmall2,  -- Skill or Recipe description on tradeskill frame
    gameNormalSmall2                        = _G.GameFontNormalSmall2, -- MissionUI followers names
    fancy12                                 = _G.Fancy12Font,
    friendsNormal                           = _G.FriendsFont_Normal,
    game12                                  = _G.Game12Font, -- PvP font
    invoiceMed                              = _G.InvoiceFont_Med, -- Mail
    systemMed1                              = _G.SystemFont_Med1,
    systemShadowMed1                        = _G.SystemFont_Shadow_Med1,
    tooltipMed                              = _G.Tooltip_Med,
    game13Shadow                            = _G.Game13FontShadow, -- InspectPvpFrame
    gameNormalMed1                          = _G.GameFontNormalMed1, -- WoW token info
    systemMed2                              = _G.SystemFont_Med2,
    systemOutline                           = _G.SystemFont_Outline, -- WorldMap, Pet level
    destinyMed                              = _G.DestinyFontMed,
    fancy14                                 = _G.Fancy14Font,
    friendsLarge                            = _G.FriendsFont_Large,
    gameHighlightMedium                     = _G.GameFontHighlightMedium, -- QuestLog title mouseover
    gameNormalMed2                          = _G.GameFontNormalMed2, -- Quest tracker
    gameNormalMed3                          = _G.GameFontNormalMed3,
    gameTooltipHeader                       = _G.GameTooltipHeader,
    price                                   = _G.PriceFont,
    systemMed3                              = _G.SystemFont_Med3,
    systemShadowMed2                        = _G.SystemFont_Shadow_Med2, -- Order hall resoures, OrderHallTalentFrame
    systemShadowMed3                        = _G.SystemFont_Shadow_Med3,
    game15_o1                               = _G.Game15Font_o1, -- CharacterStatsPane, ItemLevelFrame
    mailLarge                               = _G.MailFont_Large, -- Mail
    questLarge                              = _G.QuestFont_Large,
    game16                                  = _G.Game16Font,
    gameNormalLarge                         = _G.GameFontNormalLarge,
    questLarger                             = _G.QuestFont_Larger,
    systemLarge                             = _G.SystemFont_Large,
    systemShadowLarge                       = _G.SystemFont_Shadow_Large,
    system16ShadowThickOutline              = _G.SystemFont16_Shadow_ThickOutline, -- Talent & Profession SpendText
    game18                                  = _G.Game18Font, -- MissionUI bonus chance
    gameNormalLarge2                        = _G.GameFontNormalLarge2, -- Garrison follow names
    questHuge                               = _G.QuestFont_Huge, -- Quest rewards title, Rewards
    systemShadowLarge2                      = _G.SystemFont_Shadow_Large2, -- AuctionHouse item display
    systemHuge1                             = _G.SystemFont_Huge1, -- Garrison Mission XP
    systemHuge1Outline                      = _G.SystemFont_Huge1_Outline, -- Garrison Mission Chance
    systemShadowHuge1                       = _G.SystemFont_Shadow_Huge1,
    fancy22                                 = _G.Fancy22Font, -- Talking frame title font
    systemOutlineThickHuge2                 = _G.SystemFont_OutlineThick_Huge2,
    fancy24                                 = _G.Fancy24Font, -- Artifact frame - weapon name
    game24                                  = _G.Game24Font, -- Garrison mission level, in detail frame
    gameHighlighHuge2                       = _G.GameFontHighlightHuge2,
    gameNormalHuge2                         = _G.GameFontNormalHuge2, -- Mythic weekly best dungeon name
    questSuperHuge                          = _G.QuestFont_Super_Huge,
    systemHuge2                             = _G.SystemFont_Huge2, -- Mythic+ score
    bossEmoteNormalHuge                     = _G.BossEmoteNormalHuge, -- Talent title
    systemShadowHuge3                       = _G.SystemFont_Shadow_Huge3, -- FlightMap
    subZoneText                             = _G.SubZoneTextFont, -- WorldMap, SubZone
    systemShadowHuge4                       = _G.SystemFont_Shadow_Huge4,
    game30                                  = _G.Game30Font, -- Mission Level
    questEnormous                           = _G.QuestFont_Enormous, -- Garrison titles
    coreAbility                             = _G.CoreAbilityFont, -- Core abilities, title
    destinyHuge                             = _G.DestinyFontHuge, -- Garrison mission report
    gameGigantic                            = _G.GameFont_Gigantic, -- Used at the install steps
    systemOutlineThickWTF                   = _G.SystemFont_OutlineThick_WTF, -- WorldMap

    -- big fonts
    quest39                                 = _G.QuestFont_39,
    game40                                  = _G.Game40Font,
    game42                                  = _G.Game42Font,
    game46                                  = _G.Game46Font,
    game48                                  = _G.Game48Font,
    game48Shadow                            = _G.Game48FontShadow,
    game60                                  = _G.Game60Font,
    game72                                  = _G.Game72Font,
    game120                                 = _G.Game120Font,

    -- extras, unknown reference
    systemNamePlateCastBar                  = _G.SystemFont_NamePlateCastBar,
    systemWorld                             = _G.SystemFont_World,
    systemWorldThickOutline                 = _G.SystemFont_World_ThickOutline,
    systemInverseShadowSmall                = _G.SystemFont_InverseShadow_Small,
    systemOutlineThickHuge4                 = _G.SystemFont_OutlineThick_Huge4,
    numberGameNormal                        = _G.NumberFont_GameNormal,
    numberNormalMed                         = _G.NumberFont_Normal_Med,
    questOutlineHuge                        = _G.QuestFont_Outline_Huge,
    questSuperHugeOutline                   = _G.QuestFont_Super_Huge_Outline,
    splashHeader                            = _G.SplashHeaderFont,
    game11                                  = _G.Game11Font,
    game13                                  = _G.Game13Font,
    game15                                  = _G.Game15Font,
    game20                                  = _G.Game20Font,
    game27                                  = _G.Game27Font,
    game32                                  = _G.Game32Font,
    game36                                  = _G.Game36Font,
    game11_o1                               = _G.Game11Font_o1,
    game12_o1                               = _G.Game12Font_o1,
    game13_o1                               = _G.Game13Font_o1,
    destinyLarge                            = _G.DestinyFontLarge,
    fancy16                                 = _G.Fancy16Font,
    fancy18                                 = _G.Fancy18Font,
    fancy20                                 = _G.Fancy20Font,
    fancy27                                 = _G.Fancy27Font,
    fancy30                                 = _G.Fancy30Font,
    fancy32                                 = _G.Fancy32Font,
    fancy48                                 = _G.Fancy48Font,

    -- shared xml
    systemTiny2                             = _G.SystemFont_Tiny2,
    systemSmall2                            = _G.SystemFont_Small2,
    systemShadowSmall2                      = _G.SystemFont_Shadow_Small2,
    systemShadowMed1Outline                 = _G.SystemFont_Shadow_Med1_Outline,
    systemShadowHuge2                       = _G.SystemFont_Shadow_Huge2,
    systemShadowOutlineHuge3                = _G.SystemFont_Shadow_Outline_Huge3,
    systemShadowOutlineHuge2                = _G.SystemFont_Shadow_Outline_Huge2,
    systemWTF2                              = _G.SystemFont_WTF2,
    systemOutlineWTF2                       = _G.SystemFont_Outline_WTF2,
    systemIME                               = _G.System_IME,
}

-- roman: Fonts\ARIALN.TFF
-- korean: Fonts\2002.TFF
-- simplifiedchinese: Fonts\ARHei.TFF
-- traditionalchinese: Fonts\arheiuhk.TFF
-- russian: Fonts\ARIALN.TFF

-- Sets the FontObject font, size and style
---@param obj FontInstance
---@param font string
---@param size number
---@param style string @ NONE, OUTLINE, MONOCHROME, THICKOUTLINE, MONOCHROME|OUTLINE, MONOCHROME|THICKOUTLINE 
---@param sR number @ shadow red value
---@param sG number @ shadow green value
---@param sB number @ shadow blue value
---@param sA number @ shadow alpha value
---@param sX number @ shadow X offset
---@param sY number @ shadow Y offset
---@param r number @ text red value
---@param g number @ text green value
---@param b number @ text blue value
---@param a number @ text alpha value
local function SetFont(obj, font, size, style, sR, sG, sB, sA, sX, sY, r, g, b, a)
    if not addon.db.profile.general.textEnabled then return end
	if not obj then return end

    if style == 'NONE' or not style then style = '' end

    local shadow = strsub(style, 0, 6) == 'SHADOW'
	if shadow then style = strsub(style, 7) end -- shadow isnt a real style

    local oldSize = select(2, obj:GetFont())
    local oldStyle = select(3, obj:GetFont())
    -- if (not size or size == nil) and not style then
    --     size = select(2, obj:GetFont())
    --     style = select(3, obj:GetFont())
    --     addon:Print('size: ', size, 'style: ', style)
    -- end

	obj:SetFont(font, size or oldSize, style or oldStyle)
	obj:SetShadowColor(sR or 0, sG or 0, sB or 0, sA or (shadow and (style == '' and 1 or 0.6)) or 0)
	obj:SetShadowOffset(sX or (shadow and 1) or 0, sY or (shadow and -1) or 0)

	if r and g and b then
		obj:SetTextColor(r, g, b)
	end

	if a then
		obj:SetAlpha(a)
	end
end

-- ELVUI SetFont: function E:SetFont(obj, font, size, style, sR, sG, sB, sA, sX, sY, r, g, b, a)

-- function addon:FontSizeChanged(dropDown, chatFrame, fontSize)
--     if not chatFrame then chatFrame = _G.FCF_GetCurrentChatFrame() end
--     if not fontSize then fontSize = dropDown.value end

--     local _, oldSize, oldStyle = chatFrame:GetFont()

--     local font = self.Shared:Fetch('font', addon.db.profile.general.font);

--     self.db.profile.general.fontSize = fontSize

--     for i = 1, 50 do
--         if _G["ChatFrame" .. i] then
--             local oldFont, oldSize, oldStyle  = _G["ChatFrame" .. i]:GetFont()

--             SetFont(_G["ChatFrame" .. i], font, fontSize, oldStyle)
--         end
--     end
-- end

function addon:GetGeneralOption(info)
    local key = info[#info]

    return self.db.profile.general[key]
end

function addon:SetGeneralOption(info, value)
    local key = info[#info]

    self.db.profile.general[key] = value

    if (key == 'font' and self.db.profile.general.appliedToAll) then
        self.db.profile.general.appliedToAll = false
    end

    if (key == "chatFont" or key == "damageFont") then
        self:ApplyFont()
    elseif key == "font" and (self.db.profile.general.chatFont or self.db.profile.general.damageFont) then
        self:ApplyFont()
    elseif key == 'fontSize' then
        self:FontSizeChanged(nil, nil, value)
    end
end

local function GetChatFont()
    ---@type string
    local _defaultFont = addon.Shared:Fetch('font', defaults.InitialDb.profile.general.font);

    local selectedFont, chatFont = addon.Shared:Fetch('font', addon.db.profile.general.font)

    if self.db.profile.general.chatFont then chatFont = selectedFont else chatFont = _defaultFont end

    return chatFont;
end

function addon:GetFont(arg)
    local selectedFont = arg or self.db.profile.general.font or defaults.InitialDb.profile.general.font

    return addon.Shared:Fetch('font', selectedFont)
end

function addon:ApplyFontToAll()
    self.db.profile.general.appliedToAll = true
    self.db.profile.general.chatFont = true;
    self.db.profile.general.damageFont = true
    self.db.profile.unitFrames.characterPanel.font = self.db.profile.general.font

    self:ApplyFont()
end

function addon:ApplyFont()
    ---@type string
    local _defaultFont = addon.Shared:Fetch('font', defaults.InitialDb.profile.general.font);

    local profileFont, font, chatFont, damageFont = addon.Shared:Fetch('font', self.db.profile.general.font)

    if self.db.profile.general.appliedToAll then font = profileFont else font = _defaultFont end
    if self.db.profile.general.chatFont then chatFont = profileFont else chatFont = _defaultFont end
    if self.db.profile.general.damageFont then damageFont = profileFont else damageFont = _defaultFont end


    -- adjust text options to be more specific, instead would be nicer to have boolean conditions to trigger assignments
    -- instead of always assigning...

    if self.db.profile.general.damageFont then
        fonts.damage = damageFont;
        fonts.combat = damageFont;
    end


    local default = 12;
    local scaleFont = true;

    -- big fonts
	local yourmom	= default * 4.5 -- 54
	local titanic	= default * 4.0 -- 48
	local monstrous	= default * 3.5 -- 42
	local colossal	= default * 3.0 -- 36
	local massive	= default * 2.5 -- 30
	local gigantic	= default * 2.0 -- 24

	-- normal fonts
	local enormous	= default * 1.9 -- 22.8
	local mega		= default * 1.7 -- 20.4
	local huge		= default * 1.5 -- 18
	local large		= default * 1.3 -- 15.6
	local big		= default * 1.2 -- 14.4
	local medium	= default * 1.1 -- 13.2
	local unscale	= scaleFont and default -- 12

	-- small fonts
	local small		= default * 0.9 -- 10.8
	local tiny		= default * 0.8 -- 9.6

    if self.db.profile.general.appliedToAll then

        UNIT_NAME_FONT     = font
        NAMEPLATE_FONT     = font
        DAMAGE_TEXT_FONT   = font
        STANDARD_TEXT_FONT = font

        -- not sure if these are actually working...
        fonts.name = font;
        fonts.standard = font

        -- fonts not found
        SetFont(_G.GameFontNormal, font)
        SetFont(_G.GameFontNormalSmall, font)
        SetFont(_G.OptionsFontSmall, font)
        SetFont(_G.GameFontHighlightSmall, font)
        SetFont(_G.GameFontHighlight, font)
        SetFont(_G.CommentatorTeamScoreFont, font)
        SetFont(_G.AchievementDescriptionFont, font)
        SetFont(_G.DialogButtonNormalText, font)
        SetFont(_G.GameFontNormalLeft, font)
        SetFont(_G.GameFontBlack, font)
        SetFont(_G.NumberFontNormalLarge, font)
        SetFont(_G.NumberFontNormalRight, font)
        SetFont(_G.GameFontNormalLargeLeft, font)
        SetFont(_G.GameFontHighlightSmallLeft, font)
        SetFont(_G.GameFontHighlightExtraSmall, font)
        SetFont(_G.GameFontHighlightExtraSmallLeft, font)
        SetFont(_G.GameFontBlackSmall, font)
        -- end of not found fonts --


        SetFont(fonts.chatBubble, font, default, "OUTLINE")

        SetFont(fonts.systemNamePlate,              font, tiny,     "OUTLINE")
        SetFont(fonts.systemNamePlateFixed,         font, tiny,     "OUTLINE")
        SetFont(fonts.systemLargeNamePlate,         font, default,  "OUTLINE")
        SetFont(fonts.systemLargeNamePlateFixed,    font, default,  "OUTLINE")

        SetFont(fonts.questSmall,       font, medium,   "NONE")
        SetFont(fonts.quest,            font, medium,   "NONE")
        SetFont(fonts.mailBody,         font, big,      "NONE")
        SetFont(fonts.cooldown,         font, big,      "SHADOW")
        SetFont(fonts.errorText,        font, big,      "SHADOW")
        SetFont(fonts.questTitle,       font, big,      "NONE")
        SetFont(fonts.pvpSubZone,       font, large,    "OUTLINE")
        SetFont(fonts.pvpZone,          font, large,    "OUTLINE")
        SetFont(fonts.worldSubZone,     font, huge,     "OUTLINE")
        SetFont(fonts.worldZone,        font, mega,     "OUTLINE")

        SetFont(fonts.objective,        font, default,   "SHADOW")
        SetFont(fonts.talkingText,      font, large,    "SHADOW")
        SetFont(fonts.talkingTitle,     font, enormous, "OUTLINE")

        -- override all fonts
        SetFont(fonts.gameNormalhuge,   font, mega,     "OUTLINE")

        -- numbers
        SetFont(fonts.number11,                     font, small)
        SetFont(fonts.number12,                     font, small)
        SetFont(fonts.number12_o1,                  font, default,  "OUTLINE")
        SetFont(fonts.numberOutlineThickMonoSmall,  font, default,  "OUTLINE")
        SetFont(fonts.numberShadowSmall,            font, default,  "SHADOW")
        SetFont(fonts.numberSmall,                  font, default)
        SetFont(fonts.numberNormalSmall,            font, default,  "OUTLINE")
        SetFont(fonts.number13,                     font, default)
        SetFont(fonts.number13Gray,                 font, medium,   "SHADOW")
        SetFont(fonts.number13White,                font, medium,   "SHADOW")
        SetFont(fonts.number13Yellow,               font, medium,   "SHADOW")
        SetFont(fonts.number14Gray,                 font, medium,   "SHADOW")
        SetFont(fonts.number14White,                font, medium,   "SHADOW")
        SetFont(fonts.numberOutlineMed,             font, medium,   "OUTLINE")
        SetFont(fonts.numberShadowMed,              font, medium,   "SHADOW")
        SetFont(fonts.numberNormal,                 font, medium,   "OUTLINE")
        SetFont(fonts.number15,                     font, medium)
        SetFont(fonts.numberOutlineLarge,           font, big,      "OUTLINE")
        SetFont(fonts.number18,                     font, big)
        SetFont(fonts.number18White,                font, big,      "SHADOW")
        SetFont(fonts.numberOutlineHuge,            font, enormous, "THICKOUTLINE")

        -- quest fonts
        SetFont(fonts.questShadowSmall,             font,   medium, "SHADOW", 0.49, 0.35, 0.05, 1)
        SetFont(fonts.questShadowHuge,              font,   large,  "SHADOW", 0.49, 0.35, 0.05, 1)
        SetFont(fonts.questShadowSuperHuge,         font,   large,  "SHADOW", 0.49, 0.35, 0.05, 1)
        SetFont(fonts.questShadowEnormous,          font,   mega,   "SHADOW", 0.49, 0.35, 0.05, 1)

        -- game fonts
        SetFont(fonts.systemTiny,                   font, tiny)
        SetFont(fonts.achievementSmall,             font, small)
        SetFont(fonts.friendsSmall,                 font, small, "SHADOW")
        SetFont(fonts.game10_o1,                    font, small, "OUTLINE")
        SetFont(fonts.invoiceSmall,                 font, small)
        SetFont(fonts.reputationDetail,             font, small, "SHADOW")
        SetFont(fonts.spellSmall,                   font, small)
        SetFont(fonts.subSpell,                     font, small)
        SetFont(fonts.systemOutlineSmall,           font, small, "OUTLINE")
        SetFont(fonts.systemShadowSmall,            font, small, "SHADOW")
        SetFont(fonts.systemSmall,                  font, small)
        SetFont(fonts.tooltipSmall,                 font, small)
        SetFont(fonts.friends_11,                   font, small, "SHADOW")
        SetFont(fonts.friendsUser,                  font, small, "SHADOW")
        SetFont(fonts.gameHighlightSmall2,          font, small, "SHADOW")
        SetFont(fonts.gameNormalSmall2,             font, small, "SHADOW")
        SetFont(fonts.fancy12,                      font, default)
        SetFont(fonts.friendsNormal,                font, default, "SHADOW")
        SetFont(fonts.game12,                       font, default)
        SetFont(fonts.invoiceMed,                   font, default)
        SetFont(fonts.systemMed1,                   font, default)
        SetFont(fonts.systemShadowMed1,             font, default, "SHADOW")
        SetFont(fonts.tooltipMed,                   font, default)
        SetFont(fonts.game13Shadow,                 font, medium, "SHADOW")
        SetFont(fonts.gameNormalMed1,               font, medium, "SHADOW")
        SetFont(fonts.systemMed2,                   font, medium)
        SetFont(fonts.systemOutline,                font, medium, "OUTLINE")
        SetFont(fonts.destinyMed,                   font, medium)
        SetFont(fonts.fancy14,                      font, medium)
        SetFont(fonts.friendsLarge,                 font, medium, "SHADOW")
        SetFont(fonts.gameHighlightMedium,          font, medium, "SHADOW")
        SetFont(fonts.gameNormalMed2,               font, medium, "SHADOW")
        SetFont(fonts.gameNormalMed3,               font, medium, "SHADOW")
        SetFont(fonts.gameTooltipHeader,            font, medium)
        SetFont(fonts.price,                        font, medium)
        SetFont(fonts.systemMed3,                   font, medium)
        SetFont(fonts.systemShadowMed2,             font, medium, "SHADOW")
        SetFont(fonts.systemShadowMed3,             font, medium, "SHADOW")
        SetFont(fonts.game15_o1,                    font, medium)
        SetFont(fonts.mailLarge,                    font, medium)
        SetFont(fonts.questLarge,                   font, medium)
        SetFont(fonts.game16,                       font, big)
        SetFont(fonts.gameNormalLarge,              font, big, "SHADOW")
        SetFont(fonts.questLarger,                  font, big)
        SetFont(fonts.systemLarge,                  font, big)
        SetFont(fonts.systemShadowLarge,            font, big, "SHADOW")
        SetFont(fonts.system16ShadowThickOutline,   font, big, "OUTLINE")
        SetFont(fonts.game18,                       font, big)
        SetFont(fonts.gameNormalLarge2,             font, big, "SHADOW")
        SetFont(fonts.questHuge,                    font, big)
        SetFont(fonts.systemShadowLarge2,           font, big, "SHADOW")
        SetFont(fonts.systemHuge1,                  font, large)
        SetFont(fonts.systemHuge1Outline,           font, large, "OUTLINE")
        SetFont(fonts.systemShadowHuge1,            font, large, "OUTLINE")
        SetFont(fonts.fancy22,                      font, large)
        SetFont(fonts.systemOutlineThickHuge2,      font, large, "THINKOUTLINE")
        SetFont(fonts.fancy24,                      font, huge)
        SetFont(fonts.game24,                       font, huge)
        SetFont(fonts.gameHighlighHuge2,            font, huge, "SHADOW")
        SetFont(fonts.gameNormalHuge2,              font, huge, "SHADOW")
        SetFont(fonts.questSuperHuge,               font, huge)
        SetFont(fonts.systemHuge2,                  font, huge)
        SetFont(fonts.bossEmoteNormalHuge,          font, mega, "SHADOW")
        SetFont(fonts.systemShadowHuge3,            font, mega, "SHADOW")
        SetFont(fonts.subZoneText,                  font, mega, "OUTLINE")
        SetFont(fonts.systemShadowHuge4,            font, mega, "SHADOW")
        SetFont(fonts.game30,                       font, enormous)
        SetFont(fonts.questEnormous,                font, enormous)
        SetFont(fonts.coreAbility,                  font, enormous)
        SetFont(fonts.destinyHuge,                  font, enormous)
        SetFont(fonts.gameGigantic,                 font, enormous, "SHADOW")
        SetFont(fonts.systemOutlineThickWTF,        font, enormous, "OUTLINE")

        -- big fonts
        SetFont(fonts.quest39,                      font, gigantic)
        SetFont(fonts.game40,                       font, gigantic)
        SetFont(fonts.game42,                       font, gigantic)
        SetFont(fonts.game46,                       font, massive)
        SetFont(fonts.game48,                       font, massive)
        SetFont(fonts.game48Shadow,                 font, massive, "SHADOW")
        SetFont(fonts.game60,                       font, colossal)
        SetFont(fonts.game72,                       font, monstrous)
        SetFont(fonts.game120,                      font, titanic)

        -- only set font, try get value from original font object
        SetFont(fonts.systemNamePlateCastBar,        font, 10, "OUTLINE")
        SetFont(fonts.systemWorld,                   font, 64, "OUTLINE")
        SetFont(fonts.systemWorldThickOutline,       font, 64, "THICKOUTLINE")
        SetFont(fonts.systemInverseShadowSmall,      font)
        SetFont(fonts.systemOutlineThickHuge4,       font)
        SetFont(fonts.numberGameNormal,              font)
        SetFont(fonts.numberNormalMed,               font)
        SetFont(fonts.questOutlineHuge,              font)
        SetFont(fonts.questSuperHugeOutline,         font)
        SetFont(fonts.splashHeader,                  font)
        SetFont(fonts.game11,                        font)
        SetFont(fonts.game13,                        font)
        SetFont(fonts.game15,                        font)
        SetFont(fonts.game20,                        font)
        SetFont(fonts.game27,                        font)
        SetFont(fonts.game32,                        font)
        SetFont(fonts.game36,                        font)
        SetFont(fonts.game11_o1,                     font)
        SetFont(fonts.game12_o1,                     font)
        SetFont(fonts.game13_o1,                     font)
        SetFont(fonts.destinyLarge,                  font)
        SetFont(fonts.fancy16,                       font)
        SetFont(fonts.fancy18,                       font)
        SetFont(fonts.fancy20,                       font)
        SetFont(fonts.fancy27,                       font)
        SetFont(fonts.fancy30,                       font)
        SetFont(fonts.fancy32,                       font)
        SetFont(fonts.fancy48,                       font)

        -- shared xml
        SetFont(fonts.systemTiny2,                   font)
        SetFont(fonts.systemSmall2,                  font)
        SetFont(fonts.systemShadowSmall2,            font)
        SetFont(fonts.systemShadowMed1Outline,       font)
        SetFont(fonts.systemShadowHuge2,             font)
        SetFont(fonts.systemShadowOutlineHuge3,      font)
        SetFont(fonts.systemShadowOutlineHuge2,      font)
        SetFont(fonts.systemWTF2,                    font)
        SetFont(fonts.systemOutlineWTF2,             font)
        SetFont(fonts.systemIME,                     font)
    end

    -- override chat frames
    local _, oldSize = ChatFrame1:GetFont()
    _G.FCF_SetChatWindowFontSize(nil, _G.ChatFrame1, oldSize);

end

-- Overrides the chat frames to the selected font override
---@param dropDown ChatFontDropdown
---@param chatFrame ChatFrame
---@param fontSize number
function addon:OverrideChatFrames(dropDown, chatFrame, fontSize)
    if not chatFrame then chatFrame = FCF_GetCurrentChatFrame(); end
    if not fontSize then fontSize = dropDown.value end

    local font = GetChatFont()

    for id, frameName in pairs(_G.CHAT_FRAMES) do
        local frame = _G[frameName];

        addon:SetFont(_G["ChatFrame" .. i], font, fontSize)
        _G.SetChatWindowSize(id, fontSize)
    end

    -- override language specific fonts
    for _, fontString in pairs ({ _G.ChatFontNormalKO, _G.ChatFontNormalRU, _G.ChatFontNormalZH }) do
        local font, _, outline = fontString:GetFont()
        fontString:SetFont(font, fontSize, outline)
    end
end


function text:OnEnable()
    addon:ApplyFont();

    addon:SecureHook("FCF_SetChatWindowFontSize", "OverrideChatFrames");

    -- override map navbar
    -- addon:Dump(WorldMapFrameHomeButton)
    -- for fontString in pairs() do
        -- addon:Print(a,b)
        -- for x, y in pairs(b) do
        --     addon:Print('text: ', x, y)
        -- end
        
        -- addon:SetFont(WorldMapFrameHomeButton.text, addon:GetFont())
    -- end
end



-- hooksecurefunc("FCF_SetChatWindowFontSize", addon:OverrideChatFrames)


do -- scoped precaching for fonts
    local assetLoader = CreateFrame('Frame')

    local preloadFont = function(font)
        local fontString = assetLoader:CreateFontString()
        fontString:SetAllPoints()

        if pcall(fontString.SetFont, fontString, 14) then
            pcall(fontString.SetText, fontString, 'cache')
        end
    end

	local sharedFonts = addon.Shared:HashTable('font')

	for _, fontPath in next, sharedFonts do
		preloadFont(fontPath)
	end

	local applyFonts = function() addon:ApplyFont() end

	hooksecurefunc(addon.Shared, 'Register', function(_, mediaType, _, data)
		if not mediaType or type(mediaType) ~= 'string' then return else mediaType = mediaType:lower() end

		if mediaType == 'font' then
			preloadFont(data)
			applyFonts()
		end
	end)
end