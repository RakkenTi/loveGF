--- Base class for any drawable UI.
--- @class drawableUIInterface : baseClass
local drawableUIBaseClass = relrequire("...class"):extend()
--- @type drawableUIInterface[]
drawableUIBaseClass.children = {}

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
function drawableUIBaseClass:setAlpha()
    error(": setAlpha function is not implemented!")
end

--- @param child drawableUIInterface
function drawableUIBaseClass:addChild(child)
    table.insert(self.children, child)
end

return drawableUIBaseClass