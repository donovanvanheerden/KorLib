local K = KorLib

local unitFrames = {
    type = "group",
    name = "Unit Frames",
    args = {
        heading0 = {
            type = "header",
            name = "Health Class Colors",
            order = 0
        },
        player = {
            type = "toggle",
            name = "Player",
            desc = "Enables class colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 1
        },
        target = {
            type = "toggle",
            name = "Target",
            desc = "Enables class / unit colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 2
        },
        targetReputation = {
            type = "toggle",
            name = "Target Name Background",
            desc = "Enables class / unit colors on name background",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 3
        },
        playertargettarget = {
            type = "toggle",
            name = "Target of Target",
            desc = "Enables class / unit colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 4
        },
        focus = {
            type = "toggle",
            name = "Focus",
            desc = "Enables class / unit colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 5
        },
        focusReputation = {
            type = "toggle",
            name = "Focus Name Background",
            desc = "Enables class / unit colors on name background",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 6
        },
        -- heading1 = {
        --     type = "header",
        --     name = "Power Colors",
        --     order = 7
        -- },
        -- alternateManaPower = {
        --     type = "toggle",
        --     name = "Fix alternate power bar",
        --     desc = "Use the same mana color as primary (Eg. see Priest mana compared mana in Shadowform)",
        --     get = "GetUnitFrameOption",
        --     set = "SetUnitFrameOption",
        --     order = 8
        -- },
        -- heading2 = {
        --     type = "header",
        --     name = "Bar Textures",
        --     order = 9
        -- },
        -- customTextures = {
        --     type = "toggle",
        --     name = "Use custom texture",
        --     desc = "Enables selection of custom textures for health, power and alternate power",
        --     get = "GetUnitFrameOption",
        --     set = "SetUnitFrameOption",
        --     order = 10
        -- },
        -- health = {
        --     type = "select",
        --     dialogControl = "LSM30_Statusbar",
        --     name = "Health Texture",
        --     values = K.Shared:HashTable("statusbar"),
        --     get = "GetUnitFrameOption",
        --     set = "SetBarTexture",
        --     order = 11,
        --     disabled = function() return not K.db.profile.unitFrames.customTextures end
        -- },
        -- power = {
        --     type = "select",
        --     dialogControl = "LSM30_Statusbar",
        --     name = "Power Texture",
        --     values = K.Shared:HashTable("statusbar"),
        --     get = "GetUnitFrameOption",
        --     set = "SetBarTexture",
        --     order = 12,
        --     disabled = function() return not K.db.profile.unitFrames.customTextures end
        -- },
        -- alternatePower = {
        --     type = "select",
        --     dialogControl = "LSM30_Statusbar",
        --     name = "Alternate Power Texture",
        --     values = K.Shared:HashTable("statusbar"),
        --     get = "GetUnitFrameOption",
        --     set = "SetBarTexture",
        --     order = 13,
        --     disabled = function() return not K.db.profile.unitFrames.customTextures end
        -- }
    }
}

local addonOptions = {
    name = K.name,
    handler = K,
    type = "group",
    args = {
        unitFrames = unitFrames,
    }
}

K.Options = addonOptions