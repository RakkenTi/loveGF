--// Parent Class
--- @type drawableUIInterface
local drawableUIInterface = relrequire("..base.drawableUIInterface")
--- @type vector2Class
local vector2 = relrequire("...loveplus.vector2")
--- @type collisionClass
local collision = relrequire("...loveplus.collision")

--- @class rectangle
local rectangle = drawableUIInterface:extend()

function rectangle.new(pos, size)

    --- @type rect
    local self = setmetatable({}, rect)

    self.isScaled = false
    self.pos = pos or vector2.new()
    self.size = size or vector2.new()
    self.pixelSize = vector2.new()
    self.anchor = vector2.new(0.5, 0.5)
    self.offset = vector2.new()
    self.scalePos = vector2.new()
    self.colour = {255, 255, 255}
    self.cornerRadius = 0
    self.alpha = 1
    self.outline = {
        false,
        1,
        {1, 1, 1}
    }
    self.enabled = true

    return self

end

--// Setters
function rectangle:setAlpha(newAlpha)
    self.alpha = newAlpha
end

function rectangle:setOutline(state, thickness, colour)
    self.outline = {
        state,
        thickness,
        colour,
    }
end

function rectangle:setColour(colour)
    self.colour = colour
end

--- Set the corner radius to a number
--- A corner radius greater than 0 will create a rounded rectangle.
--- @param radius number
function rectangle:setCornerRadius(radius)
    self.cornerRadius = radius
end

--- Set a vector2 that will be added to to the position in the draw call.
--- Note: Offset must be empty to set one. Or else it will be rejected
--- @param offset Vector2
function rectangle:setOffset(offset)
    if self.offset ~= vector2.new() then return end
    self.offset = offset
    self:resize()
end

--- Clears the offset, allowing a new one to be set.
function rect:clearOffset()
    self.offset = vector2.new()
    self:resize()
end

--- Set the anchor of the rectangle. This affects position.
--- Only has an effect when using scaled mode.
--- @param newAnchor Vector2
function rectangle:setAnchor(newAnchor)
    self.anchor = newAnchor
    self:resize()
end

function rectangle:setPos(pos)
    -- micro optimization
    if (pos == self.pos) then return end
    self.pos = pos - self.offset
    self:resize()
end

function rectangle:setSize(size)
    self.size = size
    self:resize()
end

--// Getters
--- Returns the raw position of the rectangle. Scaled or pixels.
--- @return Vector2
function rectangle:getPos()
    return self.pos
end

--- Returns the pixel size of the rectangle in pixels.
--- @return Vector2
function rectangle:getPixelSize()
    return self.pixelSize
end

--- Returns the raw position of the rectangle strictly in pixels.
--- @return Vector2
function rectangle:getRawPos()
    local screenSize = vector2.new(love.window.getMode())
    return vector2.new(self:getPos().x * screenSize.x, self:getPos().y * screenSize.y)
end

--- Returns the center position of the rectangle in pixels.
--- @return Vector2
function rectangle:getCenteredPos()
    local screenSize = vector2.new(love.window.getMode())
    return vector2.new(
            self.pos.x * screenSize.x - (self.anchor.x * self.pixelSize.x) + self.pixelSize.x / 2,
            self.pos.y * screenSize.y - (self.anchor.y * self.pixelSize.y) + self.pixelSize.y / 2
    )
end

--- Returns true if the given position is inside the rectangle. Else false.
--- @param pos Vector2
--- @return boolean
function rectangle:isInside(pos)
    if (not self.enabled) then return false end
    return collision.checkRect(
            pos.x,
            pos.y,
            self:getCenteredPos().x - self.pixelSize.x / 2,
            self:getCenteredPos().y - self.pixelSize.y / 2,
            self.pixelSize.x,
            self.pixelSize.y
    )
end

--// Methods
function rectangle:draw()
    love.graphics.setColor({self.colour[1], self.colour[2], self.colour[3], self.alpha})
    love.graphics.rectangle("fill", self.scalePos.x, self.scalePos.y, self.pixelSize.x, self.pixelSize.y, self.cornerRadius, self.cornerRadius)
    -- Outlines
    if (self.outline[1]) then
        local currentLineWidth = love.graphics.getLineWidth()
        love.graphics.setLineWidth(self.outline[2])
        love.graphics.setColor({self.outline[3][1], self.outline[3][2], self.outline[3][3], self.alpha})
        love.graphics.rectangle("line", self.scalePos.x, self.scalePos.y, self.pixelSize.x, self.pixelSize.y, self.cornerRadius, self.cornerRadius)
        love.graphics.setLineWidth(currentLineWidth)
    end
end

function rectangle:update()

end

function rectangle:resize()
    local screenSize = vector2.new(love.window.getMode())
    self.pixelSize = vector2.new((self.size.x * screenSize.x), (self.size.y * screenSize.y))
    self.scalePos = vector2.new(
            (self.pos.x * screenSize.x - (self.anchor.x * self.pixelSize.x)),
            (self.pos.y * screenSize.y - (self.anchor.y * self.pixelSize.y))
    )
end

function rectangle:onHover()

end

return rectangle