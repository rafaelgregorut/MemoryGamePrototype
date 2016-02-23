module(..., package.seeall)

local imageLibrary = {}

imageLibrary.imagePaths = {
  back = "crate.png",
  back_2 = "crate_2.png",
  ball = "ball_8.png",
  fish = "fish.small.blue.png",
  fruit = "fruit.png"
}

imageLibrary.images = {
  back = {type = "image", filename = imageLibrary.imagePaths["back"]},
  back_2 = {type = "image", filename = imageLibrary.imagePaths["back_2"]},
  ball = {type = "image", filename = imageLibrary.imagePaths["ball"]},
  fish = {type = "image", filename = imageLibrary.imagePaths["fish"]},
  fruit = {type = "image", filename = imageLibrary.imagePaths["fruit"]}
}

function imageLibrary:flip(originalImage, nextImage, x, y, width, height)
  local Matcher = require("Matcher")

  originalImage.isVisible = false
  local parent = originalImage.parent
  local newImage = display.newImageRect(imageLibrary.imagePaths[nextImage],width,height)
  newImage.isVisible = false
  newImage.x = x
  newImage.y = y
  newImage.frontImage = originalImage.frontImage
  newImage.backImage = originalImage.backImage
  newImage.id = originalImage.id
  parent:insert(newImage)
  newImage.isVisible = true
  
  Matcher.level1Table[originalImage.id].image = newImage
  
end

function imageLibrary:flipBack(originalImage, nextImage, x, y, width, height)
  local Matcher = require("Matcher")

  originalImage.isVisible = false
  local parent = originalImage.parent
  local newImage = display.newImageRect(imageLibrary.imagePaths[nextImage],width,height)
  newImage.isVisible = false
  newImage.x = x
  newImage.y = y
  newImage.frontImage = originalImage.frontImage
  newImage.backImage = originalImage.backImage
  newImage.id = originalImage.id
  parent:insert(newImage)
  newImage.isVisible = true
  newImage:addEventListener("touch",Matcher.touchListener)
  
  Matcher.level1Table[originalImage.id].image = newImage
  

end

return imageLibrary