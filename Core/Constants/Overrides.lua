local K = KorLib

local powerColours = {
    MANA = {
		r = 0.0470588235294118,
		g = 0.4862745098039216,
		b = 0.9568627450980392
    }
}

K._Defaults.PowerColours = powerColours

function K:GetPowerOverride(power)
    return self._Defaults.PowerColours[power]
end