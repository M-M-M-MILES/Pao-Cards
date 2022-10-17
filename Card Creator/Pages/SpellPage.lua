local cardCreator = require 'Card_Connect.jl'

local suit = require 'suit'

local Scene = {}

local input1 = {text = ""}
local input2 = {text = ""}
local input3 = {text = ""}
local input4 = {text = ""}
local input5 = {text = ""}

function Scene.load()

end

function Scene.update(dt)
    suit.layout:reset(295,0)

    suit.Label("Spell card Creater", {align = "center"}, suit.layout:row(200,50))

    suit.layout:row(200,25)

    suit.Label("What is the name?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    if suit.Input(input1, suit.layout:row(200,30)).hovered then

        suit.Label(input1.text, {align = "left"}, suit.layout:col())

    end
    suit.layout:reset(295,119)

    suit.layout:row(200,25)

    suit.Label("What is the description?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    if suit.Input(input2, suit.layout:row(200,30)).hovered then

        suit.Label(input2.text, {align = "left"}, suit.layout:col())
    
    end
    suit.layout:reset(295,188)

    suit.layout:row(200,25)

    suit.Label("What is the effect?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    if suit.Input(input3, suit.layout:row(200,30)).hovered then

        suit.Label(input3.text, {align = "left"}, suit.layout:col())

    end
    suit.layout:reset(295,257)

    suit.layout:row(200,25)

    suit.Label("What is the rarity?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    if suit.Input(input4, suit.layout:row(200,30)).hovered then

        suit.Label(input4.text, {align = "left"}, suit.layout:col())

    end
    suit.layout:reset(295,326)

    suit.layout:row(200,25)

    --suit.Label("What is the card ID?", {align = "left"}, suit.layout:row(200,14))

   -- suit.layout:row(200,0)

   -- if suit.Input(input5, suit.layout:row(200,30)).hovered then

   --     suit.Label(input5.text, {align = "left"}, suit.layout:col())

   -- end
  --  suit.layout:reset(295,395)

  --  suit.layout:row(200,25)

  --  if suit.Button("Back", suit.layout:row(70,50)).hit then
   --     SM.load("MenuPage")
  --      SM.unload("SpellPage")
   -- end

   -- suit.layout:col(60,50)
    
    if suit.Button("Submit", suit.layout:col(70,50)).hit then
        print(input1.text)
        print(input2.text)
        print(input3.text)
        print(input4.text)
        print(input5.text)

        cardCreator.createCard(input1, "Spell", input4)

    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(0, 0.4, 1, 1.0)
    suit.draw()
end

function love.textinput(t)
	-- forward text input to SUIT
	suit.textinput(t)
end

function love.keypressed(key)
	-- forward keypresses to SUIT
	suit.keypressed(key)
end

function love.filedropped(file)
	file:open("r")
	local data = file:read()
	print("Content of " .. file:getFilename() .. ' is')
	print(data)
	print("End of file")
end

return Scene