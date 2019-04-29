local Vector = require('src.vector2')

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

function Circle.circleCollision(c1, c2)
    local radiusSum = c1.radius + c2.radius
    local centreVector = c1.centre:subtract(c2.centre)
    return centreVector:length() <= radiusSum
end

return Circle