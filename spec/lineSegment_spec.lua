local Vector = require('src.vector2')
local LineSegment = require('src.lineSegment')

describe("Line segment tests", function()
    it("should identify crossing line segments", function()
        local lineSeg1 = LineSegment.new(Vector.new(20, 0), Vector.new(10, 0))
        local lineSeg2 = LineSegment.new(Vector.new(10, 0), Vector.new(20, 0))
        local lineSeg3 = LineSegment.new(Vector.new(9, -1), Vector.new(9, 1))


        assert.is_true(lineSeg1:lineSegmentCollision(lineSeg2))
        assert.is_not_true(lineSeg1:lineSegmentCollision(lineSeg3))
    end)
end)