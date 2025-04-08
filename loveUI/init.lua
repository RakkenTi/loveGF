--- @class loveUIClass
local loveuiClass = {}
loveuiClass.__index = loveuiClass

--- @class loveui : loveUIClass
--- Creates an instance of the loveui class.
function loveuiClass.new()
    local self = setmetatable({}, loveuiClass)
    
    return self
end

return loveuiClass