local Vector = require('src.vector2')

local Line = {}

Line.__index = Line

-- Params
--  Vector2 base
--  Vector2 direction
function Line.new(base, direction)
    local l = setmetatable({}, Line)
    l.base = base
    l.direction = direction
    return l
end

local function rotateRightAngle(v)
    local x = -v.y
    local y = v.x
    return Vector.new(x, y)
end

local function parallelVectors(v1, v2)
    local rightAngle = rotateRightAngle(v1)
    return rightAngle:dotProduct(v2) == 0
end

local function equalVectors(v1, v2)
    return v1.x == v2.x and v1.y == v2.y
end

local function equivalentLines(l1, l2)
    if not parallelVectors(l1.direction, l2.direction) then
        return false
    end
    local diff = l1.base:subtract(l2.base)
    return parallelVectors(diff, l1.direction)
end

function Line.linesCollide(l1, l2)
    if parallelVectors(l1.direction, l2.direction) then
        return equivalentLines(l1, l2)
    else
        return true
    end
end

return Line