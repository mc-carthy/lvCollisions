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

function Vector.length(v1)
    return math.sqrt(math.pow(v1.x, 2) + math.pow(v1.y, 2))
end

function Vector.unit(v1)
    local length = v1:length()
    if length > 0 then
        return v1:divide(length)
    end
    return v1
end

function Vector.rotate(v1, rad)
    local v = {}
    v.x = v1.x * math.cos(rad) - v1.y * math.sin(rad)
    v.y = v1.x * math.sin(rad) + v1.y * math.cos(rad)
    return v
end

return Vector