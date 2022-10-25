local IP = {text = ""}

local suit = require 'suit'

local Scene = {}

function Scene.load()
    
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("Input friends IP", {align = "center"}, suit.layout:row(200,50))

    suit.Input(IP, suit.layout:row(200,30))

    suit.layout:row(200,20)

    if suit.Button("Connect", suit.layout:row(200,50)).hit then
        --run julia script
    end

    suit.layout:row(200,20)

    if suit.Button("Return to Menu", suit.layout:row(200,50)).hit then
        SM.load("OpeningPage")
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(103/255, 153/255, 199/255, 1.0)
    suit.draw()
end

function love.textinput(t)
    suit.textinput(t)
end

function love.keypressed(key)
	suit.keypressed(key)
end

return Scene