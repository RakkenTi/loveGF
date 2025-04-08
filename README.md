# loveGF
General Purpose Framework built for Love2D.

## Setup
- Uses git submodules, so please initialize the submodules and update them with:
```
git submodule update --init --recursive --remote
```

## RelRequire
- The module depends on this specific relrequire implementation:
```lua
--- Allows to require relative to the current directory the .lua file is calling the function in.
--- @param targetPath string The path of the .lua file to require.
--- @param scriptPath string Always pass "..." in the top scope.
_G.relrequire = function(targetPath, scriptPath)
    local goBack = #targetPath:match("^[%.]*")
    local match = targetPath:sub(goBack + 1, #targetPath)

    local scriptPathSplice = {}

    for text in scriptPath:gmatch("(.-)%.+") do
        table.insert(scriptPathSplice, text)
    end

    local maxIndex = #scriptPathSplice - goBack

    for i = #scriptPathSplice, 1, -1 do
        if (i >= maxIndex + 2) then
            table.remove(scriptPathSplice, i)
        end
    end

    local resultPath = ""

    for _, v in ipairs(scriptPathSplice) do
        resultPath = resultPath .. v .. "."
    end

    resultPath = resultPath .. match

    return require(resultPath)
end
```

## Contents
- **Component Based UI System:** simplify the creation of complex-ui's using a collection of small UI-building blocks.
- **Utility Classes:** Focus more on game logic by utilizing utility classes that provides several datastructures such as 2D vectors and etc.
