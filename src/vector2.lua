local Vector = {}

function Vector.new(x, y)
    local v = {}
    v.x = x
    v.y = y
    return v
end

function Vector.add(v1, v2)
    local v = {}
    v.x = v1.x + v2.x
    v.y = v1.y + v2.y
    return v
end

function Vector.subtract(v1, v2)
    local v = {}
    v.x = v1.x - v2.x
    v.y = v1.y - v2.y
    return v
end

function Vector.negate(v1)
    local v = {}
    v.x = -v1.x
    v.y = -v1.y
    return v
end

function Vector.multiply(v1, s1)
    local v = {}
    v.x = v1.x * s1
    v.y = v1.y * s1
    return v
end

function Vector.divide(v1, s1)
    local v = {}
    v.x = v1.x / s1
    v.y = v1.y / s1
    return v
end

return Vector