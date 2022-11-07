local suit = require 'suit'
local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local body = {}

local Scene = {}
local image
local name = "name"
local rank = "rarity"
local id = 12
local description = "text"
local effect = "effectD"
local attack = "attack = " 
local hp = "HP = "

function Scene.load()
    pic = love.graphics.newImage("clonepic.jpg")
end

function Scene.update()
    suit.layout:reset(735,5)

    suit.Label(name, {align = "left"}, suit.layout:row(150,50))

    suit.layout:reset(450,10)

    suit.Label(rank, {align = "left"}, suit.layout:row(100,50))

    suit.layout:reset(1050,10)

    suit.Label(id, {align = "left"}, suit.layout:row(150,50))

    suit.layout:reset(200,410)

        if suit.Button("Back", suit.layout:row(100,50)).hit then
            SM.load("playtable")
        end

    suit.layout:reset(520,280)

    suit.Label("Description/Effect", {align = "left"}, suit.layout:row(500, 100))

    suit.layout:reset(520,320)

    suit.Label(description, {align = "left"}, suit.layout:row(500, 100))

    suit.layout:reset(520,720)

    suit.Label(attack, {align = "left"}, suit.layout:row(500, 100))

    suit.layout:reset(940,720)

    suit.Label(hp, {align = "left"}, suit.layout:row(500, 100))
end

function Scene.draw()
    love.graphics.setColor(0.4,0.4,0.4)
    love.graphics.rectangle("fill", 420, 0, 700, 900)
    love.graphics.setColor(1,1,1,.2)
    love.graphics.rectangle("fill", 520, 350, 500, 400)
    --love.graphics.rectangle("fill", 520, 650, 500, 200)
    love.graphics.setColor(1,1,1,1)
    --love.graphics.rectangle("line", 520, 50, 500, 250)
    love.graphics.scale(2.2,1.1)
    love.graphics.draw(pic, 232, 39)
    love.graphics.reset()
    suit.draw()
end

return Scene