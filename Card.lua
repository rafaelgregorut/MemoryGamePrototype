module(..., package.seeall)
local ImageLibrary = require("ImageLibrary")
local Matcher = require("Matcher")

local card = {
  id = 1,
}

function card:setDimensions (width, height)

  self.width = width
  self.height = height

end

function card:loadImage (imageName, x, y)

  --the image of the card
  self.image = display.newImageRect(ImageLibrary.imagePaths[imageName],self.width,self.height)
  
end

function card:setPosition (x,y)
  
   self.image.x = x
   self.image.y = y
  
end

function card:new (o)

  o = o or {}
  
  setmetatable(o, self)
  self.__index = self
  return o

end

function card:initCard(backImage, width, height, x, y)

  self:setDimensions(width,height)
  self:loadImage(backImage)
  self.image.backImage = backImage
 
  self.image:addEventListener("touch",Matcher.touchListener)
 
  self.image.id = card.id
  card.id = card.id + 1
  
  local idMatchingImage = math.random(1,#Matcher.urna)
  self.image.frontImage = Matcher.urna[idMatchingImage]
  table.remove(Matcher.urna,idMatchingImage)
  
  self:setPosition(x,y)

end

return card