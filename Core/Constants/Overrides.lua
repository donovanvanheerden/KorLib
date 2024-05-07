local _, addonTable = ...
local addon = addonTable.addon

local powerColours = {
    MANA = {
		r = 0.0470588235294118,
		g = 0.4862745098039216,
		b = 0.9568627450980392
    }
}

addonTable._Defaults.PowerColours = powerColours

function addon:GetPowerOverride(power)
    return addonTable._Defaults.PowerColours[power]
end