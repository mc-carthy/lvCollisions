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

return Line