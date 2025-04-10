--// Parent Class
--- @type drawableUIBaseClass
local drawableUIBaseClass = relrequire("..base.drawableUIBaseClass")

--// Modules
--- @type vector2Class
local vector2 = relrequire("...loveplus.vector2")
--- @type collisionClass
local collision = relrequire("...loveplus.collision")

--// Rectangle
--- @class rectangle : drawableUIBaseClass
local rectangle = drawableUIBaseClass:extend()