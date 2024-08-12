local _, addonTable = ...

local gemManager = addonTable.addon:NewModule("GemManager")

local GEM_DATA = {
    --[itemID] = {type, spellID, role, uiOrder}
    --role: bits 000 (Tank/Healer/DPS): Tank 100(4), DPS 001(1), H/D 011(3), H 010(2)


    --Total: 11
    meta = {
        [221982] = {1, 447598, 4, 00},  --Bulwark of the Black Ox: Charge, Taunt, Ward
        [221977] = {1, 447566, 1, 20},  --Funeral Pyre: Stat, Self Harm
        [220211] = {1, 444954, 2, 60},  --Precipice of Madness: Ward
        [220120] = {1, 444677, 4, 70},  --Soul Tether: Redirect Damage
        [220117] = {1, 444622, 2, 90},  --Ward of Salvation: Restore HP, Overhealing to Ward, AoE
        [219878] = {1, 444128, 7, 85},  --Tireless Spirit: Reduce Resouce Cost
        [219386] = {1, 443389, 7, 35},  --Locus of Power: Stats
        --[216974] = {1, 437495, 1, 40},  --Morphing Elements: Summon Portal, AoE
        [216711] = {1, 426268, 3, 10},  --Chi-ji, the Red Crane --426268, 437018
        [216695] = {1, 437011, 3, 30},  --Lifestorm: Damage then Restore HP and Haste
        [216671] = {1, 426748, 7, 80},  --Thundering Orb: Transform, DR, Movement
        [216663] = {1, 435313, 1, 50},  --Oblivion Sphere: Crit Damage Taken, AoE, Control
    },

    --Total：17
    cogwheel = {
        [218110] = {2, 441759, 7, 45},  --Soulshape
        [218109] = {2, 441749, 7, 10},  --Death's Advance
        [218108] = {2, 441741, 7, 05},  --Dark Pack
        [218082] = {2, 441617, 7, 55},  --Spiritwalker's Grace (Cast while Moving)
        [218046] = {2, 441576, 7, 50},  --Spirit Walk
        [218045] = {2, 441569, 7, 20},  --Door of Shadows
        [218044] = {2, 441564, 7, 35},  --Pursuit of Justice (Passive)
        [218043] = {2, 441559, 7, 80},  --Wild Charge
        [218005] = {2, 441493, 7, 65},  --Stampeding Roar
        [218004] = {2, 441479, 7, 75},  --Vanish
        [218003] = {2, 441467, 7, 30},  --Leap of Faith
        [217989] = {2, 441348, 7, 70},  --Trailblazer
        [217983] = {2, 441299, 7, 15},  --Disengage
        [216632] = {2, 427030, 7, 60},  --Sprint
        [216631] = {2, 427026, 7, 40},  --Roll
        [216630] = {2, 427033, 7, 25},  --Heroic Leap
        [216629] = {2, 427053, 7, 05},  --Blink
    },

    --Total: 36
    tinker = {
        [219801] = {3, 427064, 7, 00},  --Ankh of Reincarnation: Self-rez
        [212366] = {3, 429270, 3, 28},  --Arcanist's Edge: Consume shield to deal damage *
        [219944] = {3, 444455, 2, 03},  --Bloodthirsty Coral: Damage taken to Healing
        [219818] = {3, 429007, 7, 06},  --Brilliance: Party Resouce Regen
        [216649] = {3, 436578, 1, 09},  --Brittle: Store Damage Done, Death Trigger AoE
        [216648] = {3, 436577, 7, 12},  --Cold Front: Allies Ward, Enemies Debuff
        [217957] = {3, 441165, 2, 15},  --Deliverance: Store Healing. Healing when Low HP
        [212694] = {3, 433362, 3, 29},  --Enkindle: Grant shield, Damage attackers, Increase haste *
        [212749] = {3, 433361, 1, 102},  --Explosive Barrage: AoE
        [212365] = {3, 429389, 1, 103},  --Fervor: Consume HP to deal holy damage
        [219817] = {3, 429026, 7, 18},  --Freedom: Ckear Loss of Control
        [212916] = {3, 436461, 5, 104},  --Frost Armor: Damage and slow attackers
        [219777] = {3, 428854, 4, 21},  --Grounding: Redirect Harmful Spell
        [217964] = {3, 441209, 2, 27},  --Holy Martyr: Damage Taken to Party Healing
        [216647] = {3, 436571, 1, 24},  --Hailstorm: AoE and Debuff
        [212758] = {3, 433360, 1, 105},  --Incendiary Terror: Damage and Horrify
        [219389] = {3, 443498, 3, 30},  --Lightning Rod: Crit on Ally or Dot on Enemy
        [216624] = {3, 436461, 5, 33},  --Mark of Arrogance: Dot on Attackers
        [216650] = {3, 436583, 7, 36},  --Memory of Vegeance: For every 10s, gain primary stat for every 5% missing HP
        [212759] = {3, 433358, 1, 106},  --Metero Storm: AoE and stun
        [212361] = {3, 427054, 1, 107},  --Opportunist: Grant crit when damaging stunned enemey
        [216625] = {3, 429373, 1, 39},  --Quick Strike: Melee Ability Triggers Additional Autoattacks
        [217961] = {3, 441198, 2, 42},  --Righteous Frenzy: Healing Proc Haste on Ally
        [217927] = {3, 441150, 2, 45},  --Savior: Healing Low HP Ally Grants Ward
        [216651] = {3, 436586, 3, 48},  --Searing Light: Healing to Heal and AoE Damage
        [216626] = {3, 429378, 1, 51},  --Slay: Extra Damage to Low Health Enemy
        [219452] = {3, 443670, 3, 54},  --Static Charge: Heal or Damage
        [219523] = {3, 443834, 1, 57},  --Storm Overload: AoE, Control
        [212362] = {3, 436465, 1, 108},  --Sunstrider's Flourish: Crit cause AoE
        [216627] = {3, 429230, 2, 60},  --Tinkmaster's Shield: Ward after not being damaged for 5s
        [219527] = {3, 443855, 7, 63},  --Vampiric Aura: +Leech, Party Leech
        [216628] = {3, 436467, 3, 66},  --Victory Fire: Enemy Death trigger AoE Damage and Healing
        [217903] = {3, 441092, 3, 69},  --Vindication: Damage Done Heals Allies
        [217907] = {3, 441115, 4, 72},  --Warmth: +Healing Taken, Redistribute Overhealing
        [212760] = {3, 433356, 1, 109},  --Wildfire: Dot, Spreading
        [219516] = {3, 443787, 7, 110},  --Windweaver: +Movement Speed, Falling damage immunity, chance to increase party haste
    },

    prismatic = {
        [210714] = {4, nil, 1, 30},  --Crit +
        [216644] = {4, nil, 1, 20},  --Crit ++
        [211123] = {4, nil, 1, 10},  --Crit +++
        [211102] = {4, nil, 1, 00},  --Crit +++, STAM
        [210681] = {4, nil, 2, 31},  --Haste +
        [216643] = {4, nil, 2, 21},  --Haste ++
        [211107] = {4, nil, 2, 11},  --Haste +++
        [211110] = {4, nil, 2, 01},  --Haste +++, STAM
        [210715] = {4, nil, 3, 32},  --Mastery +
        [216640] = {4, nil, 3, 22},  --Mastery ++
        [211106] = {4, nil, 3, 12},  --Mastery +++
        [211108] = {4, nil, 3, 02},  --Mastery +++, STAM
        [220371] = {4, nil, 4, 33},  --Vers +
        [220372] = {4, nil, 4, 23},  --Vers ++
        [220374] = {4, nil, 4, 13},  --Vers +++
        [220373] = {4, nil, 4, 03},  --Vers +++, STAM
        [220367] = {4, nil, 5, 35},  --Armor +
        [220368] = {4, nil, 5, 25},  --Armor ++
        [220370] = {4, nil, 5, 15},  --Armor +++
        [220369] = {4, nil, 5, 05},  --Armor +++, STAM
        [211109] = {4, nil, 6, 36},  --Regen +
        [216642] = {4, nil, 6, 26},  --Regen ++
        [211125] = {4, nil, 6, 16},  --Regen +++
        [211105] = {4, nil, 6, 06},  --Regen +++, STAM
        [210717] = {4, nil, 7, 37},  --Leech +
        [216641] = {4, nil, 7, 27},  --Leech ++
        [210718] = {4, nil, 7, 17},  --Leech +++
        [211103] = {4, nil, 7, 07},  --Leech +++, STAM
        [210716] = {4, nil, 8, 38},  --Speed +
        [216639] = {4, nil, 8, 28},  --Speed ++
        [211124] = {4, nil, 8, 18},  --Speed +++
        [211101] = {4, nil, 8, 08},  --Speed +++, STAM
    }
};

addonTable.timerunning = {
    isTimerunner =PlayerGetTimerunningSeasonID() == 1,
    -- gems = GEM_DATA
}

local GemFrame = {}

function GemFrame:Show()
  PlaySound(SOUNDKIT.GUILD_BANK_OPEN_BAG)
  self.fadeIn:Play()
end

function GemFrame:Hide()
  PlaySound(SOUNDKIT.GUILD_BANK_OPEN_BAG)
  self.fadeOut:Play()
end

function GemFrame:IsShown()
  return self.frame:IsShown()
end

--@param parent Frame
--@return GemFrame
function gemManager:Create(parent)
  --@class GemFrame
  local gemFrame = {}
  setmetatable(gemFrame, {__index = GemFrame})
  
  gemFrame.loaded = false

  local frame = CreateFrame("Frame", "ExtendedUIGemFrame", UIParent, "DefaultPanelTemplate")

  local _,_,_, height = parent:GetBoundsRect()
  
  frame:Hide()
  frame:SetParent(parent)
  frame:SetPoint('BOTTOMLEFT', parent, 'BOTTOMRIGHT', 10, 0)
  frame:SetPoint('TOPLEFT', parent, 'TOPRIGHT', 10, 0)
  frame:SetSize(260, height)
  frame:SetTitle("Gem Manager")

  gemFrame.fadeIn, gemFrame.fadeOut = animations:AttachFadeAndSlideLeft(frame)
  gemFrame.frame = frame

  local content = grid:Create(gemFrame.frame)
  content:GetContainer():SetPoint("TOPLEFT", gemFrame.frame, "TOPLEFT", const.OFFSETS.BAG_LEFT_INSET+4, const.OFFSETS.BAG_TOP_INSET)
  content:GetContainer():SetPoint("BOTTOMRIGHT", gemFrame.frame, "BOTTOMRIGHT", const.OFFSETS.BAG_RIGHT_INSET, const.OFFSETS.BAG_BOTTOM_INSET)
  content.maxCellWidth = 1
  content.spacing = 0

  gemFrame.content = content

  --gemFrame.iconGrid = self:CreateIconGrid(parent)

  return gemFrame
end

local _gm = nil

local function onBagRendered()
  for gemId in pairs(GEM_DATA) do
    for itemId in pairs(GEM_DATA[gemId]) do
       gemManager.bagCategories:AddItemToCategory(itemId, "MoP Remix: "..titleCase(gemId.." gems"))
    end
  end
end

function gemManager:OnEnable()
  if not BetterBags_ToggleBags then return end

  local BetterBags = LibStub("AceAddon-3.0"):GetAddon("BetterBags")

  local events = BetterBags:GetModule('Events')

  ---@class Animations: AceModule
  gemManager.animations = BetterBags:GetModule('Animations')
  ---@class Categories: AceModule
  gemManager.bagCategories = BetterBags:GetModule("Categories")
  ---@class Constants: AceModule
  gemManager.const = BetterBags:GetModule('Constants')
  ---@class GridFrame: AceModule
  gemManager.grid = BetterBags:GetModule('Grid')

  events:RegisterMessage('bag/Rendered', onBagRendered)
  
  addonTable.addon:Print("Timerunning gem categories enabled")
end

-- PaperDollFrame:HookScript("OnShow", function(self)
--   if (_gm == nil) then
--     _gm = gemManager:Create(PaperDollFrame)
--   end

--   _gm:Show()
-- end)

-- PaperDollFrame:HookScript("OnHide", function(self)
--   _gm:Hide()
-- end)