--- @class coreClass
local coreClass = {}
coreClass.__index = coreClass

--- @class core : coreClass
--- Creates an instance of the core class.
function coreClass.new()
    local self = setmetatable({}, coreClass)

    self.active = {}
    self.inactive = {}

    return self
end

return core