#!../luaimg -F 
local sz = vector2(335, 18)

make(sz, 3, function(pos) return HSVtoRGB(vector3(pos.x/(sz.x-1),1,1)) end):save("slider_hue.png")

make(sz, 3, function(pos) return pos.x/(sz.x-1) * vector3(1,1,1) end):save("slider_sat.png")

local tick_colour = vector3(1,0,0)
local bg_colour = vector3(0,0,0)
local fg_colour = vector3(1,1,1)

make(sz, 3, function(pos)
    local val = pos.x / (sz.x)
    val = pow(val, 2.2)
    val = val * 10
    local val_last = (pos.x-1) / (sz.x)
    val_last = pow(val_last, 2.2)
    val_last = val_last * 10
    if floor(val) > floor(val_last) then return tick_colour end
    local decade
    if pos.y < 3 then
        decade = 0
    else
        decade = floor((pos.y - 3) / (sz.y-3) * 10)
    end
    if val < decade then return bg_colour end
    if val >= decade + 1 then return fg_colour end
    return (val - decade) * vector3(1,1,1)
end):save("slider_val1.png")

make(sz, 3, function(pos)
    local val = pos.x / sz.x
    val = pow(val, 2.2)
    val = val * 10
    return (val % 1) * vector3(1,1,1)
end):save("slider_val2.png")

make(sz, 3, function(pos)
    local val = pos.x / sz.x
    val = pow(val, 2.2)
    val = val * 10
    if pos.y < sz.y/2 then
        return (val % 1) * vector3(1,1,1)
    else
        return (val / 10) * vector3(1,1,1)
    end
end):save("slider_val3.png")