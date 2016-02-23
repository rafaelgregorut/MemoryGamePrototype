-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------
module(..., package.seeall)
local composer = require( "composer" )
local scene = composer.newScene()
local Card = require("Card")
local Matcher = require("Matcher")
--local ImageLibrary = require("ImageLibrary")


--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

local level1Table = {}

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- create a grey rectangle as the backdrop
	local background = display.newRect( 0, 0, screenW, screenH )
	background.anchorX = 0
	background.anchorY = 0
	background:setFillColor( .5 )
	
	math.randomseed(os.time())
	
	Matcher.level1Table[1] = Card:new()
	Matcher.level1Table[1]:initCard("back",50,50,screenW*0.25,screenH*0.15)
	
	Matcher.level1Table[2] = Card:new()
	Matcher.level1Table[2]:initCard("back_2",50,50,screenW*0.75,screenH*0.15)
	
	Matcher.level1Table[3] = Card:new()
	Matcher.level1Table[3]:initCard("back_2",50,50,screenW*0.25,screenH*0.50)
	
	Matcher.level1Table[4] = Card:new()
	Matcher.level1Table[4]:initCard("back",50,50,screenW*0.75,screenH*0.50)
	
	Matcher.level1Table[5] = Card:new()
	Matcher.level1Table[5]:initCard("back",50,50,screenW*0.25,screenH*0.85)
	
	Matcher.level1Table[6] = Card:new()
	Matcher.level1Table[6]:initCard("back_2",50,50,screenW*0.75,screenH*0.85)
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	
	for i=1, #Matcher.level1Table do
	 sceneGroup:insert(Matcher.level1Table[i].image)
	end
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
		
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		--physics.start()
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		--physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	--package.loaded[physics] = nil
	--physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene