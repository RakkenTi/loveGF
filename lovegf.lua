local loveGF = {}

-- Setup relrequire if not already defined.
if (not _G["relrequire"]) then
    print("_G.relrequire() is missing! See repo for more information.")
end

loveGF.loveplus = relrequire("loveplus", ...)

return loveGF