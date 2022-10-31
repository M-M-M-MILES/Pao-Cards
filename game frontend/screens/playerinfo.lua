local suit = require 'suit'

local Scene = {}
local text = "This is it what the hello nice job dictionary through"
local rank = "Rank#"
local wl = "Win/Losses#"
local name = "Name"
local pic

function Scene.load()
    pic = love.graphics.newImage("picstarwars.PNG")
end

function Scene.update()
    suit.layout:reset(450,10)

    suit.Label(rank, {align = "left"}, suit.layout:row(100,50))

    suit.layout:reset(955,10)

    suit.Label(wl, {align = "left"}, suit.layout:row(150,50))

    suit.layout:reset(735,300)

    suit.Label(name, {align = "left"}, suit.layout:row(150,50))

    suit.layout:reset(200,410)

        if suit.Button("Back", suit.layout:row(100,50)).hit then
            SM.load("playtable")
        end

    suit.layout:reset(520,320)

    suit.Label(text, {align = "left"}, suit.layout:row(500, 100))
end

function Scene.draw()
    love.graphics.setColor(0.4,0.4,0.4)
    love.graphics.rectangle("fill", 420, 0, 700, 900)
    love.graphics.setColor(1,1,1,.2)
    love.graphics.rectangle("fill", 520, 350, 500, 500)
    love.graphics.setColor(1,1,1,1)
    love.graphics.scale(.555,.555)
    love.graphics.draw(pic,1115,10)
    love.graphics.reset()
    --love.graphics.circle("line", 765, 150, 150)
    suit.draw()
end

return Scene