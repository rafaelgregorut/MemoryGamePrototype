module(..., package.seeall)
local ImageLibrary = require("ImageLibrary")

local matcher = {

    urna = {"ball","fish","fruit","ball","fish","fruit"},

    card1 = nil,
    
    card2 = nil,
    
    level1Table = {}
    
}

function matcher:matched()

  return (matcher.level1Table[matcher.card1].image.frontImage == matcher.level1Table[matcher.card2].image.frontImage)
end

local listener = {}
function listener:timer( event )

    ImageLibrary:flipBack(matcher.level1Table[matcher.card1].image,matcher.level1Table[matcher.card1].image.backImage,
                        matcher.level1Table[matcher.card1].image.x,matcher.level1Table[matcher.card1].image.y,
                        matcher.level1Table[matcher.card1].image.width,matcher.level1Table[matcher.card1].image.height)
    
    ImageLibrary:flipBack(matcher.level1Table[matcher.card2].image,matcher.level1Table[matcher.card2].image.backImage,
                        matcher.level1Table[matcher.card2].image.x,matcher.level1Table[matcher.card2].image.y,
                        matcher.level1Table[matcher.card2].image.width,matcher.level1Table[matcher.card2].image.height)
    
     matcher.card1 = nil
     matcher.card2 = nil
end


function matcher.touchListener(event)

    if (event.phase == "began") then
        display.getCurrentStage():setFocus(event.target)  --'event.target' is the touched object

        if (matcher.card1 == nil) then
          
          print(event.target.id)
          print(event.target.frontImage)
          
          matcher.card1 = event.target.id
          
          ImageLibrary:flip(matcher.level1Table[matcher.card1].image,matcher.level1Table[matcher.card1].image.frontImage,
                        matcher.level1Table[matcher.card1].image.x,matcher.level1Table[matcher.card1].image.y,
                        matcher.level1Table[matcher.card1].image.width,matcher.level1Table[matcher.card1].image.height)
            
        elseif (matcher.card2 == nil) then
        
          print(event.target.id)
          print(event.target.frontImage)
        
          matcher.card2 = event.target.id
          
          ImageLibrary:flip(matcher.level1Table[matcher.card2].image,matcher.level1Table[matcher.card2].image.frontImage,
                        matcher.level1Table[matcher.card2].image.x,matcher.level1Table[matcher.card2].image.y,
                        matcher.level1Table[matcher.card2].image.width,matcher.level1Table[matcher.card2].image.height)
          
          
          if (matcher.matched()) then
            print("we have a match")  
            
            matcher.card1 = nil
            matcher.card2 = nil
                
          else
            print("round over")  
            timer.performWithDelay(1000, listener)                  
          end  
          
                  
        end

    elseif (event.phase == "ended" or event.phase == "cancelled") then
        display.getCurrentStage():setFocus(nil)  --setting focus to 'nil' removes the focus

    end
    return true
end


return matcher