--- @type lovePlus
local loveplus = relrequire(".loveplus.init")
local run = loveplus.schedulers.run
local window = loveplus.schedulers.window

--- @class loveUIClass
local manager = {
    built = {
        --- @type buttonClass
        button = relrequire("built.button", ...)
    },
    shapes = {
        --- @type rectClass
        rect = relrequire("shapes.rect", ...)
    }
}

manager.__index = manager

--- @class loveui : loveUIClass
--- Creates an instance of the loveui class.
function manager.new()
    local self = setmetatable({}, manager)

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
function manager:add(drawableElement)
    self.active[drawableElement] = true
end

--- Remove an UI element from the manager.
--- @param drawableElement drawableUIInterface
function manager:remove(drawableElement)
    self.active[drawableElement] = nil
end

return manager