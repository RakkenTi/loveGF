--- @class loveUIClass
local loveuiClass = {
    built = {
        --- @type buttonClass
        button = relrequire("built.button", ...)
    },
    shapes = {
        --- @type rectClass
        rect = relrequire("shapes.rect", ...)
    }
}

loveuiClass.__index = loveuiClass

--- @class loveui : loveUIClass
--- Creates an instance of the loveui class.
function loveuiClass.new()
    local self = setmetatable({}, loveuiClass)
    
    return self
end

return loveuiClass