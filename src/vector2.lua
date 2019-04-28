local Vector = {}

function Vector.new(x, y)
    local v = {}
    v.x = x
    v.y = y
    return v
end

return Vector