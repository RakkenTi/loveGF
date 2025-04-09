--- Base class for any drawable UI.
--- @class drawableUIInterface : baseClass
--- @field children table
local drawableUIBaseClass = relrequire("...class", ...):extend()

-- Schedulers
function drawableUIBaseClass:draw()
    error(self.__name .. ": Draw function is not implemented!")
end

function drawableUIBaseClass:update()
    error(self.__name ..  ": Update function is not implemented!")
end

function drawableUIBaseClass:resize()
    error(self.__name .. ": Resize function is not implemented!")
end

-- Base
function drawableUIBaseClass:setAlpha()
    error(self.__name ..  ": setAlpha function is not implemented!")
end

return drawableUIBaseClass