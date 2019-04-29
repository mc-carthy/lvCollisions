local RotatedRect = {}

RotatedRect.__index = RotatedRect
-- NOTE: Origin is centre of rectangle by default, consider 
-- overloaded constructor to set origin as top-left corner

-- Params
--  Vector2 centre
--  Vector2 halfExtents
--  float rotation
function RotatedRect.new(centre, halfExtents, rotation)
    local r = setmetatable({}, RotatedRect)
    r.centre = centre
    r.halfExtents = halfExtents
    r.rotation = rotation
    return r
end

return RotatedRect