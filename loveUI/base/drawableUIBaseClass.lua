--- @type vector2Class
local vector2 = relrequire("...loveplus.vector2")

--- Base class for any drawable UI.
--- @class drawableUIBaseClass : baseClass
local drawableUIBaseClass = relrequire("...class"):extend()

-- Default Variables

--- @type drawableUIBaseClass[]
drawableUIBaseClass.children = {}

--- @type number
drawableUIBaseClass.scale = 1
--- @type number
drawableUIBaseClass.rotation = 0
--- @type number
drawableUIBaseClass.alpha = 0
--- @type number
drawableUIBaseClass.zIndex = 0
--- @type vector2Class[]
drawableUIBaseClass.position = {vector2.new(), vector2.new()}
--- @type vector2Class
drawableUIBaseClass.size = vector2.new()
--- @type vector2Class
drawableUIBaseClass.anchor = vector2.new(0.5, 0.5)
--- @type table
drawableUIBaseClass.colour = {255, 255, 255}
--- @type number
drawableUIBaseClass.outlineThickness = 0
--- @type table
drawableUIBaseClass.outlineColour = {255, 255, 255}

-- Schedulers
function drawableUIBaseClass:draw()
    error(": Draw function is not implemented!")
end

function drawableUIBaseClass:update()
    error(": Update function is not implemented!")
end

function drawableUIBaseClass:resize()
    error(": Resize function is not implemented!")
end

-- Base

--// Constructor
function drawableUIBaseClass.new(...)
    error("drawableUIBaseClass Constructor has not been made!")
end

--// Setters
--- Set the alpha of the element.
--- Alpha of 0 will make the element completely transparent.
--- An alpha of 1 will make the element completely opaque.
--- @param newAlpha number
function drawableUIBaseClass:setAlpha(newAlpha)
    self.alpha = newAlpha
end

--- Set the Z-Index of the element.
--- Z-Index determines the order in which elements are drawn at.
--- Elements with higher Z-Indexes are drawn on top of other's with lower Z-Index values.
--- @param newZIndex number
function drawableUIBaseClass:setZIndex(newZIndex)
    self.zIndex = newZIndex
end

--- Set the position of the element.
--- The position inputted into this function is affect by the anchor vector.
--- The position can be any combination of an offscale and scale.
--- @param newPosition vector2Class[]
function drawableUIBaseClass:setPos(newPosition)
    self.position = newPosition
end

--- Set the size of the element.
--- @param newSize vector2Class
function drawableUIBaseClass:setSize(newSize)
    self.size = newSize
end

--- Set the anchor of the rectangle. This affects position.
--- Only has an effect when using scaled mode.
--- @param newAnchor Vector2
function drawableUIBaseClass:setAnchor(newAnchor)
    self.anchor = newAnchor
end

--- Set the thickness of the outline.
--- @param newOutlineThickness number
function drawableUIBaseClass:setOutlineThickness(newOutlineThickness)
    self.outlineThickness = newOutlineThickness
end

--- Set the colour of the outline.
--- @param newOutlineColour number[]
function drawableUIBaseClass:setOutlineColour(newOutlineColour)
    self.outlineColour = newOutlineColour
end

--- Set the rotation of the element.
--- @param newRotation number
function drawableUIBaseClass:setRotation(newRotation)
    self.rotation = newRotation
end

--- Set the scale of the element.
--- Scale applies uniformly to all dimensions.
--- @param newScale number
function drawableUIBaseClass:setScale(newScale)
    self.scale = newScale
end

--// Getters

--- Get the scale of the element.
--- @return number
function drawableUIBaseClass:getScale()
    return self.scale
end

--- Get the rotation of the element.
--- @return number
function drawableUIBaseClass:getRotation()
    return self.rotation
end

--- Set the Z-Index of the element.
--- Z-Index determines the order in which elements are drawn at.
--- Elements with higher Z-Indexes are drawn on top of other's with lower Z-Index values.
--- @param newZIndex number
function drawableUIBaseClass:getZIndex(newZIndex)
    return self.zIndex
end

--- Get the position of the element
--- @return vector2Class
function drawableUIBaseClass:getPos()
    return self.position
end

--- Get the position of the element.
--- @return vector2Class
function drawableUIBaseClass:getSize()
    return self.size
end

--- Get the anchor vector.
--- @return vector2Class
function drawableUIBaseClass:getAnchor()
    return self.anchor
end

--- Get the outline thickess.
--- @return number
function drawableUIBaseClass:getOutlineThickness()
    return self.outlineThickness
end

--- Get the outline colour.
--- @return number[]
function drawableUIBaseClass:getOutlineColour()
    return self.outlineColour
end

-- Misc
--- Clone the selected class.
function drawableUIBaseClass:clone()
    error("Clone function is not implemented!")
end

return drawableUIBaseClass