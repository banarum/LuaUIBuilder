# UI builder for Corona SDK
This library will allow you to optimize your UI code in more precise and readable way.

## Getting Started

#### Step 1
Add UIBuilder to your project folder and 'require' it in the script where you going to build UI
```lua
local UIBuilder = require("UIBuilder").new()
```
#### Step 2
Next, create Display Group and attach UIBuilder to it 
```lua
local group = display.newGroup()
UIBuilder:setRoot(group)
```
#### Step 3
Now you can make UI 'chains'
```lua
UIBuilder:add([obj])
  :[commands](...)
  :gotoParent()
```
You can add your own objects
```lua
local obj = display.newImage("img.png")

UIBuilder:add(obj)
```
or create basic objects such as groups, images, geometry figures, etc
```lua
UIBuilder:addImage("img")
```

UIBuilder works with one object at the time. When You write
```lua
UIBuiler:add(myObj)
```
it will insert ```myObj``` into his 'current object', and make ```myObj``` his 'current object'.

All ```:[commands](...)``` edit parameters of 'current object'
```lua
UIBuilder:add(myObj)
  :scale(1.2)
  :position(100, 100)
  :alpha(0.5)
```
After you executed all commands, you should call ```:gotoParent()``` to complete this chain and go back to parent group
```lua
UIBuilder:add(myObj)
  :scale(1.5)
  :position(20, 30)
  :gotoParent()
```

You can also make nested UI

```lua
UIBuilder:addGroup()
  :position(200, 300)
  :alpha(0.5)
  
  UIBuilder:addImage("img.png")
    :scale(0.5)
    :gotoParent()
    
  :gotoParent()
```

### UI chain navigation
If you need to get UI object from chain, you should add tag to this object
```lua
UIBuilder:add(myObj)
  :setTag("my_tag")
  ...
```
and then call
```lua
local myObj = UIBuilder:getObjectByTag("my_tag")
```
Also you can set current chain entry point
```lua
UIBuilder:gotoObject("my_tag")
  ...
```
### Features
if you need 'if' statement in UI chain, you can
```lua
UIBuilder:add(myObj)
  :iftrue(flag)
  ...
  :endif()
  ...
```
## Examples
### Lets have a look on how standart CoronaSDK UI code looks like
```lua
local group = display.newGroup()

local rect = display.newRect(0, 0, 500, 400)
rect:setFillColor(0, 0.5, 0.5)

local cir1 = display.newCircle(-230,-180, 30)
local cir2 = display.newCircle(-230,180, 30)
local cir3 = display.newCircle(230,-180, 30)
local cir4 = display.newCircle(230,180, 30)

group:insert(rect)
group:insert(cir1)
group:insert(cir2)
group:insert(cir3)
group:insert(cir4)

group.x, group.y = 320, 320
```
![alt text](http://banarum.com/7aa93d91dba597265e11c44914f17d90.png)

### Now lets make it using UIBuilder
```lua
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
```
