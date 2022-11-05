local T = TMT

local powerColours = {
    MANA = {
		r = 0.0470588235294118,
		g = 0.4862745098039216,
		b = 0.9568627450980392
    }
}

T._Defaults.PowerColours = powerColours

function T:GetPowerOverride(power)
    return T._Defaults.PowerColours[power]
end