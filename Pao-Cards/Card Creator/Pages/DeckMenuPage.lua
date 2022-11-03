local suit = require 'suit'

local Scene = {}

function Scene.load()
    
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("What is it you wish to do in decks?", {align = "center"}, suit.layout:row(200,50))

    suit.layout:row(200,25)

    if suit.Button("Create deck", suit.layout:row(200,50)).hit then
        SM.load("CreateDeckPage")
    end

    suit.layout:row(200,20)

    if suit.Button("Add to deck", suit.layout:row(200,50)).hit then
        SM.load("AddDeckPage")
    end

    -- suit.layout:row(200,20)

    -- if suit.Button("Get deck", suit.layout:row(200,50)).hit then
    --     SM.load("GetDeckPage")
    -- end

    suit.layout:row(200,20)

    if suit.Button("Back", suit.layout:row(200,50)).hit then
        SM.load("MasterPage")
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(0, 0.4, 0.4, 1.0)
    suit.draw()
end

return Scene