local Vector = require('src.vector2')
local Circle = require('src.circle')

describe("Circle tests", function()
    it("should identify overlapping circles", function()
        local circ1 = Circle.new(Vector.new(0, 0), 5)
        local circ2 = Circle.new(Vector.new(7, 0), 2)
        local circ3 = Circle.new(Vector.new(0, -7), 2)
        local circ4 = Circle.new(Vector.new(-7, 0), 1)
        local circ5 = Circle.new(Vector.new(-5, -5), 1)

        assert.is_true(circ1:circleCollision(circ2))
        assert.is_true(circ1:circleCollision(circ3))
        assert.is_not_true(circ1:circleCollision(circ4))
        assert.is_not_true(circ1:circleCollision(circ5))
    end)
end)