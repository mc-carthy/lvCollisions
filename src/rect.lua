local Rect = {}

Rect.__index = Rect

local function overlapping(minA, maxA, minB, maxB)
    return minB <= maxA and minA <= maxB
end

-- NOTE: Origin is top-left corner of rectangle by default, 
-- consider overloaded constructor to set origin as center

-- Params
--  Vector2 centre
--  Vector2 size
function Rect.new(origin, size)
    local r = setmetatable({}, Rect)
    r.origin = origin
    r.size = size
    return r
end

function Rect.rectCollision(r1, r2)
    return overlapping(r1.origin.x, r1.origin.x + r1.size.x, r2.origin.x, r2.origin.x + r2.size.x)
        and overlapping(r1.origin.y, r1.origin.y + r1.size.y, r2.origin.y, r2.origin.y + r2.size.y)
end

return Rect