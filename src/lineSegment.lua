local LineSegment = {}

LineSegment.__index = LineSegment

-- Params
--  Vector2 p1
--  Vector2 p2
function LineSegment.new(p1, p2)
    local ls = setmetatable({}, LineSegment)
    ls.p1 = p1
    ls.p2 = p2
    return ls
end

return LineSegment