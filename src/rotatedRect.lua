local Rect = {}

Rect.__index = Rect
-- NOTE: Origin is centre of rectangle by default, consider 
-- overloaded constructor to set origin as top-left corner

-- Params
--  Vector2 centre
--  Vector2 halfExtents
--  float rotation
function Rect.new(centre, halfExtents, rotation)
    local r = setmetatable({}, Rect)
    r.centre = centre
    r.halfExtents = halfExtents
    r.rotation = rotation
    return r
end

return Rect