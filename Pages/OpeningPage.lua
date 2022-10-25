local suit = require 'suit'

local Scene = {}

function Scene.load()
    
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("What type of card do you wish to create?", {align = "center"}, suit.layout:row(200,50))

    suit.layout:row(200,25)

    if suit.Button("Monster", suit.layout:row(200,50)).hit then
        SM.load("MonsterPage")
    end

    suit.layout:row(200,20)

    if suit.Button("Spell", suit.layout:row(200,50)).hit then
        SM.load("SpellPage")
    end

    suit.layout:row(200,20)

   -- if suit.Button("Land", suit.layout:row(200,50)).hit then
   --     SM.load("LandPage")
    --end

    suit.layout:row(200,20)

    if suit.Button("Quit", suit.layout:row(200,50)).hit then
        love.event.quit(0)
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(0, 0.6, 0.6, 1.0)
    suit.draw()
end

return Scene