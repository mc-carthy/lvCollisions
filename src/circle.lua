local Circle = {}

Circle.__index = Circle

-- Params
--  Vector2 centre
--  float radius
function Circle.new(centre, radius)
    local c = setmetatable({}, Circle)
    c.centre = centre
    c.radius = radius
    return c
end

return Circle