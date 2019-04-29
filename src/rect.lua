local Rect = {}

Rect.__index = Rect

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

return Rect