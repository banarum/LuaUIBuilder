
local UIBuilder = require("UIBuilder").new()

local group = display.newGroup()

UIBuilder:setRoot(group)
UIBuilder:addGroup()
	:position(320, 320)
	
	UIBuilder:addRect(500, 400)
		:fillColor(0, 0.5, 0.5, 1)
		:gotoParent()
		
	UIBuilder:addCircle(30)
		:position(-230,-180)
		:gotoParent()
		
	UIBuilder:addCircle(30)
		:position(-230,180)
		:gotoParent()
		
	UIBuilder:addCircle(30)
		:position(230,-180)
		:gotoParent()
		
	UIBuilder:addCircle(30)
		:position(230,180)
		:gotoParent()
		
	:gotoParent()