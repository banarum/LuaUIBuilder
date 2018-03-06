--UI rapid builder
module(..., package.seeall);

function new()
  local this = {c={tags={}}}

  function this:setRoot(grp)
    self.c.root = grp
    self.c.currObj = grp
    return self
  end

  function this:setTag(tag)
    self.c.tags[tag] = self.c.currObj
    return self
  end

  function this:setObj(tag)
    self.c.currObj = self.c.tags[tag]
    return self
  end

  function this:addGroup()
    local grp = display.newGroup()
    self.c.currObj:insert(grp)
    self.c.currObj = grp
    return self
  end

  function this:addImage(path)
    local img = display.newImage(path)
    self.c.currObj:insert(img)
    self.c.currObj = img
    return self
  end
  
  function this:addText(text, font, size)
	local txt = display.newText(text, 0, 0, font, size )
	self.c.currObj:insert(txt)
	self.c.currObj = txt
	return self
  end
  
  function this:add(obj)
	self.c.currObj:insert(obj)
	self.c.currObj = obj
	return self
  end
  
  function this:addRect(width, height)
	local rect = display.newRect(0,0,width, height)
	self.c.currObj:insert(rect)
	self.c.currObj = rect
	return self
  end
  
  function this:anchor(x, y)
	self.c.currObj.anchorX = x
	self.c.currObj.anchorY = y
	return self
  end
  
  function this:fillColor(r,g,b,a)
	self.c.currObj:setFillColor(r,g,b,a)
	return self
  end
  
  function this:gotoParent()
	self.c.currObj = self.c.currObj.parent
	return self
  end

  function this:position(x,y)
    self.c.currObj.x = x
    self.c.currObj.y = y
    return self
  end

  function this:scale(scale)
	self.c.currObj.xScale = scale
	self.c.currObj.yScale = scale
    return self
  end
  
  function this:getCurentObject()
	return self.c.currObj
  end
  
  function this:getObjectByTag(tag)
	return self.c.tags[tag]
  end

  return this
end
