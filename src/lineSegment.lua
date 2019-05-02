local Vector = require('src.vector2')

local LineSegment = {}

LineSegment.__index = LineSegment

local function rotateRightAngle(v)
    local x = -v.y
    local y = v.x
    return Vector.new(x, y)
end

local function onOneSide(axis, segment)
    local d1 = segment.p1:subtract(axis.base)
    local d2 = segment.p2:subtract(axis.base)
    local normal = rotateRightAngle(axis.direction)
    return normal:dotProduct(d1) * normal:dotProduct(d2) > 0
end

local function sortRange(range)
    local sorted = range
    if range.minimum > range.maximum then
        sorted.minimum = range.maximum
        sorted.maximum = range.minimum
    end
    return sorted
end

local function projectSegment(segment, onto)
    local ontoUnit = onto:unit()
    local range = {}
    range.minimum = ontoUnit:dotProduct(segment.p1)
    range.maximum = ontoUnit:dotProduct(segment.p2)
    range = sortRange(range)
    return range
end

local function overlapping(minA, maxA, minB, maxB)
    return minB <= maxA and minA <= maxB
end

local function overlappingRanges(r1, r2)
    return overlapping(r1.minumum, r1.maximum, r2.minimum, r2.maximum)
end

local function parallelVectors(v1, v2)
    local rightAngle = rotateRightAngle(v1)
    return rightAngle:dotProduct(v2) == 0
end

-- Params
--  Vector2 p1
--  Vector2 p2
function LineSegment.new(p1, p2)
    local ls = setmetatable({}, LineSegment)
    ls.p1 = p1
    ls.p2 = p2
    return ls
end

function LineSegment.lineSegmentCollision(l1, l2)
    local axisA, axisB = {}, {}
    axisA.base = l1.p1
    axisA.direction = l1.p2:subtract(l1.p1)
    
    if onOneSide(axisA, l2) then
        return false
    end

    axisB.base = l2.p1
    axisB.direction = l2.p2:subtract(l2.p1)

    if onOneSide(axisB, l1) then
        return false
    end

    if parallelVectors(axisA.direction, axisB.direction) then
        rangeA = projectSegment(l1, axisA.direction)
        rangeB = projectSegment(l2, axisA.direction)
        return overlappingRanges(rangeA, rangeB)
    else
        return true
    end
end

return LineSegment