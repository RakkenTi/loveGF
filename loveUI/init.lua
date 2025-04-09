--- @type lovePlus
local loveplus = relrequire("..loveplus.init")
local run = loveplus.schedulers.run
local window = loveplus.schedulers.window

--- @class loveUIClass
local loveui = {
    built = {
        --- @type buttonClass
        button = relrequire("built.button")
    },
    shapes = {
        --- @type rectClass
        rect = relrequire("shapes.rect")
    },
    colours = {
        blue = {0, 0, 125},
        red = {125, 0, 0},
        white = {255, 255, 255},
        charcoal = {46, 64, 87},
        cerise = {218, 65, 103},
        asparagus = {127, 176, 105}
    }
}
loveui.__index = loveui

--- @class loveui : loveUIClass
--- Creates an instance of the loveui class.
function loveui.new()
    local self = setmetatable({}, loveui)

    self.active = {}

    run.onUpdate(function()
        --- @param activeElement drawableUIInterface
        for activeElement, _ in pairs(self.active) do
            activeElement:update()
        end
    end)

    run.onDraw(function()
        --- @param activeElement drawableUIInterface
        for activeElement, _ in pairs(self.active) do
            activeElement:draw()
        end
    end)

    window.onResize(function()
        --- @param activeElement drawableUIInterface
        for activeElement, _ in pairs(self.active) do
            activeElement:resize()
        end
    end)
    
    return self
end

--- Add an UI element to the manager.
--- @param drawableElement drawableUIInterface
function loveui:add(drawableElement)
    self.active[drawableElement] = true
end

--- Remove an UI element from the manager.
--- @param drawableElement drawableUIInterface
function loveui:remove(drawableElement)
    self.active[drawableElement] = nil
end

return loveui