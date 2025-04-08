--- @class loveGF
--- @field public loveplus lovePlus
local loveGF = {}

-- Setup relrequire if not already defined.
if (not _G["relrequire"]) then
    error("Missing relrequire implementation(). See github repo for more info.")
end

loveGF.loveplus = relrequire("loveplus.init", ...)

return loveGF