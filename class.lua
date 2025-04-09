--- Create a new class.
--- @param class table? The class to inherit. Providing no class creates a blank one.
return function(class)

    class = class or {}
    class.__index = class

    local self = setmetatable({}, class)

    function class:extend()
        local subclass = {}
        subclass.__index = subclass
        setmetatable(subclass, self)
    end

    --- Implement the class passed in. Basically copies all methods from said class into the current class.
    --- Does not overwrite already existing methods.
    --- @param classToImplement table? The class to implement.
    function class:implement(classToImplement)
        for k, v in pairs(classToImplement) do
            if not self[k] then
                self[k] = v
            end
        end
    end

    return self

end