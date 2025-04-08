--// Modules
local vector2 = relrequire("vector2", ...)
local rect = relrequire("..shapes.rect", ...)
local mouse =  relrequire("mouseUtils", ...)
local run = relrequire("run", ...)

--- A class for creating buttons
--- A button is a rect wrapped with special events.
--- @class buttonClass
local button = {}
button.__index = button

--- @class button : buttonClass
--- @param RECT Rect
--- Wraps a rectangle with special button behaviour.
function button.new(RECT)
    local self = setmetatable({}, button)

    self.callback = function() end
    self.hoverCallback = function()  end
    self.isHover = false
    self.rect = RECT
    mouse.onRelease(function()
        if (self.rect:isInside(vector2.new(love.mouse.getPosition()))) then
            if (self.callback) then
                self.callback()
                -- Disable hover
                self.isHover = false
                self.hoverCallback(false)
            end
        end
    end)

    run.onUpdatew(function()
        self.rect:update()
        local mousePos = vector2.new(love.mouse.getPosition())
        if (self.rect:isInside(mousePos) and not self.isHover) then
            self.isHover = true
            self.hoverCallback(true)
        elseif (not self.rect:isInside(mousePos)) then
            if (self.isHover == true) then
                self.hoverCallback(false)
                self.isHover = false
            end
        end
    end)

    run.onDraw(function()
        self.rect:draw()
    end)

    return self
end

--- Set the callback for the button-press action
--- Note that a button press only accounts for a mouse being released within the buttons boundaries.
--- @param callback function
function button:setClickCallback(callback)
    self.callback = callback
end

--- Set the callback of the button. Passes in a boolean state reprenting if its onHover or offHover
--- @param callback fun(state: boolean)
function button:setHoverCallback(callback)
    self.hoverCallback = callback
end

return button