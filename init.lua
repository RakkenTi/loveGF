local loveGF = {}

-- Setup relrequire if not already defined.
if (not _G["relrequire"]) then
    _G.relrequire = function(targetPath, scriptPath)
        local pattern = "^(.*)%."
        local match = scriptPath:match(pattern) or ""
        return require(match.."."..targetPath)
    end
end

loveGF.loveplus = relrequire("loveplus", ...)

return loveGF