local suit = require 'suit'

local Scene = {}

function Scene.load()
    
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("What is it you would like to do?", {align = "center"}, suit.layout:row(200,50))

    suit.layout:row(200,25)

    if suit.Button("Make card", suit.layout:row(200,50)).hit then
        SM.load("MenuPage")
    end

    suit.layout:row(200,20)

    if suit.Button("Get card", suit.layout:row(200,50)).hit then
        SM.load("GetPage")
    end

    suit.layout:row(200,20)

    if suit.Button("Delete card", suit.layout:row(200,50)).hit then
        SM.load("DelPage")
    end

    suit.layout:row(200,20)

    if suit.Button("Update card", suit.layout:row(200,50)).hit then
        SM.load("UpdatePage")
    end

    suit.layout:row(200,20)

    if suit.Button("Deck Menu", suit.layout:row(200,50)).hit then
        SM.load("DeckMenuPage")
    end

    suit.layout:row(200,20)

    if suit.Button("Quit", suit.layout:row(200,50)).hit then
        love.event.quit(0)
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(0, .4, .4, 1.0)
    suit.draw()
end

return Scene