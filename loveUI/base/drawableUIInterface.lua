--- Base class for any drawable UI.
--- @class drawableUIBaseClassClass
local drawableUIBaseClassClass = relrequire("....class")

function drawableUIBaseClassClass:draw()
    error({"Draw function is not implemented!"})
end

function drawableUIBaseClassClass:update()
    error("Update function is not implemented!")
end

function drawableUIBaseClassClass:resize()
    error("Resize function is not implemented!")
end

return drawableUIBaseClassClass