local _, addonTable = ...

local function Divider(width, order)
    local _width = width or 'full'

    return {
        type = "description",
        name = " ",
        order = order,
        width = _width,
    }
end

local function FontSelect(getter, setter, width, order)
    return {
        type = "select",
        name = "Font",
        values = _G.LibStub("LibSharedMedia-3.0"):HashTable("font"),
        dialogControl = "LSM30_Font",
        get = getter,
        set = setter,
        order = order,
        width = width
    }
end

local general = {
    type = "group",
    name = "General",
    args = {
        heading0 = {
            type = "header",
            name = "Text Options",
            order = 0,
        },
        textEnabled = {
            type = "toggle",
            name = "Enabled",
            desc = "Enabled Text Module",
            get = "GetGeneralOption",
            set = "SetGeneralOption",
            order = 1,
        },
        divider01 = {
            type = "description",
            name = " ",
            order = 2,
            width = 'full',
        },
        font = FontSelect("GetGeneralOption", "SetGeneralOption", nil, 3),
        -- font = {
        --     type = "select",
        --     name = "Font",
        --     values = _G.LibStub("LibSharedMedia-3.0"):HashTable("font"),
        --     dialogControl = "LSM30_Font",
        --     get = "GetGeneralOption",
        --     set = "SetGeneralOption",
        --     order = 3
        -- },
        separator02 = {
            type = "description",
            name = " ",
            order = 4,
            width = 0.1,
        },
        applyToAll = {
            type = "execute",
            name = "Apply to all",
            desc = "Applies the font to use for all interface elements. |cffff0000This will require a logout and login for damage numbers to change.",
            func = function()
                addonTable:ApplyFontToAll()
            end,
            order = 5
        },
        divider02 = {
            type = "description",
            name = " ",
            order = 6,
            width = 'full',
        },
        chatFont = {
            type = "toggle",
            name = "Chat Font",
            desc = "Applies font to chat",
            get = "GetGeneralOption",
            set = "SetGeneralOption",
            order = 7,
            width = 'full'
        },
        damageFont = {
            type = "toggle",
            name = "Damage Font",
            desc = "Applies font to damage numbers |cffff0000This will require a logout and login for damage fonts to change.",
            get = "GetGeneralOption",
            set = "SetGeneralOption",
            order = 8,
            width = 'full'
        },
        divider03 = {
            type = "description",
            name = " ",
            order = 9,
            width = 'full',
        },
        header = {
            type = "header",
            name = "Chat Options",
            order = 10,
        },
        fontSize = {
            type = "range",
            name = "Font Size",
            desc = "Set size for Chat",
            get = "GetGeneralOption",
            set = "SetGeneralOption",
            order = 11,
            min = 8,
            max = 24,
            step = 1,
        }
    }
}

local unitFrames = {
    type = "group",
    name = "Unit Frames",
    args = {
        characterPanel = {
            type = "group",
            name = "Character Panel",
            args = {
                heading0 = {
                    type = "header",
                    name = "Character Panel",
                    order = 0
                },
                enabled = {
                    type = "toggle",
                    name = "Show item level",
                    desc = "Displays the item level on the character panel",
                    get = "GetCharacterPanelOption",
                    set = "SetCharacterPanelOption",
                    order = 1
                },
                divider1 = Divider(_, 2),
                font = FontSelect("GetCharacterPanelOption", "SetCharacterPanelOption", nil, 3),
                -- font = {
                --     type = "select",
                --     name = "Font",
                --     values = addonTable.Shared:HashTable("font"),
                --     dialogControl = "LSM30_Font",
                --     get = "GetCharacterPanelOption",
                --     set = "SetCharacterPanelOption",
                --     order = 3,
                --     disabled = "CharacterPanelDisabled"
                -- },
                separator = Divider(0.1, 4),
                fontSize = {
                    type = "range",
                    name = "Font Size",
                    desc = "Set size for ilevel on character panel",
                    get = "GetCharacterPanelOption",
                    set = "SetCharacterPanelOption",
                    order = 5,
                    min = 8,
                    max = 24,
                    step = 1,
                    disabled = "CharacterPanelDisabled"
                },
                divider2 = Divider(_, 6),
                anchor = {
                    type = "select",
                    name = "Anchor",
                    values = {
                        TOP = "TOP",
                        RIGHT = "RIGHT",
                        BOTTOM = "BOTTOM",
                        LEFT = "LEFT",
                        TOPRIGHT = "TOPRIGHT",
                        TOPLEFT = "TOPLEFT",
                        BOTTOMRIGHT = "BOTTOMRIGHT",
                        BOTTOMLEFT = "BOTTOMLEFT",
                        CENTER = "CENTER",
                    },
                    get = "GetCharacterPanelOption",
                    set = "SetCharacterPanelOption",
                    order = 7,
                    disabled = "CharacterPanelDisabled"
                },
                divider3 = Divider(_, 8),
                anchorX = {
                    type = "range",
                    name = "X Offset",
                    desc = "Set X offset relative to anchor position",
                    get = "GetCharacterPanelOption",
                    set = "SetCharacterPanelOption",
                    order = 9,
                    min = 0,
                    max = 32,
                    step = 1,
                    disabled = "CharacterPanelDisabled"
                },
                anchorY = {
                    type = "range",
                    name = "Y Offset",
                    desc = "Set Y offset relative to anchor position",
                    get = "GetCharacterPanelOption",
                    set = "SetCharacterPanelOption",
                    order = 10,
                    min = 0,
                    max = 32,
                    step = 1,
                    disabled = "CharacterPanelDisabled"
                }
            }
        },
        heading0 = {
            type = "header",
            name = "Health Class Colors",
            order = 0
        },
        [addonTable.units.player] = {
            type = "toggle",
            name = "Player",
            desc = "Enables class colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 1
        },
        [addonTable.units.target] = {
            type = "toggle",
            name = "Target",
            desc = "Enables class / unit colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 2
        },
        [addonTable.units.targetOfTarget] = {
            type = "toggle",
            name = "Target of Target",
            desc = "Enables class / unit colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 5
        },
        [addonTable.units.focus] = {
            type = "toggle",
            name = "Focus",
            desc = "Enables class / unit colors on health bar",
            get = "GetUnitFrameOption",
            set = "SetUnitFrameOption",
            order = 4
        },
    }
}

addonTable.Options = {
    name = addonTable.name,
    handler = addonTable,
    type = "group",
    args = {
        general = general,
        unitFrames = unitFrames,
    }
}


