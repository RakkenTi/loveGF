--- A module to simulate an OOP structure with classes.
--- @class baseClass
local baseClass = {}
baseClass.__index = baseClass

--- Extend the current class and create a subset class that references the old class.
--- @return self Returns a subset of the class.
function baseClass:extend()
    local subclass = {}
    subclass.__index = subclass
    setmetatable(subclass, self)
    return subclass
end

--- Implement the class passed in. Basically copies all methods from said class into the current class.
--- Functions in self are not overwritten.
--- @generic T
--- @param classToImplement T The class to implement
--- @return self | T Combination of self and T
function baseClass:implement(classToImplement)
    for k, v in pairs(classToImplement) do
        if not self[k] then
            self[k] = v
        end
    end
    return self  -- Return the merged class
end

return baseClass