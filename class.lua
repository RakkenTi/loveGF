--- Create a new class.
--- @param class table? The class to inherit. Providing no class creates a blank one.
--- @return baseClass
return function(class)

    class = class or {}
    class.__index = class

    --- @class baseClass
    --- @field extend fun(self: table):baseClass Extend the current class and create a subset class that references the old class. Returns a subset of the class calling the function.
    --- @field implement fun(self: table, classToImplement: table):self Implement the class passed in as a parameter. Copies methods from classToImplement to the current class.
    --- Does not overwrite already existing methods.
    local self = setmetatable({}, class)
    self.__index = self

    function class:extend()
        local subclass = {}
        subclass.__index = subclass
        setmetatable(subclass, self)
        return subclass
    end

    function class:implement(classToImplement)
        for k, v in pairs(classToImplement) do
            if not self[k] then
                self[k] = v
            end
        end
    end

    return self

end