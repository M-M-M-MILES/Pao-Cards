local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"

local suit = require 'suit'

local Scene = {}

local name = {text = ""}
local name2 = {text = ""}
local hp = {text = ""}
local hpnum = 0
local damage = {text = ""}
local dnum = 0
local class = {text = ""}
local effect = {text = ""}
local rarity = {text = ""}
local ctype = {text = ""}
local image

function Scene.load()
    pic = love.graphics.newImage('Images/clonepic.jpg')
end

function Scene.update(dt)
    suit.layout:reset(100,50)

    suit.Label("Get card menu", {align = "center"}, suit.layout:row(200,50))

    suit.Label("What is the name of the card you wish to see?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,15)

    if suit.Input(name2, suit.layout:row(200,30)).hovered then

        suit.Label(name2.text, {align = "left"}, suit.layout:row())

    end

    suit.layout:reset(100,250)
    suit.layout:row(200,25)

    if suit.Button("Submit", suit.layout:row(200,50)).hit then
        print(name2.text)

        local body = http.request ("http://127.0.0.1:8002/getCard?cardName=" .. name2.text)
        local body2 = json.decode(body) --> changes to table
        print(body)
        print(body2)
        for k,v in ipairs(body2) do
            name.text = v.cardName
            effect.text = v.cardEffect
            hpnum = v.cardHealth
            dnum = v.cardAttack
            image = v.cardImage
            rarity.text = v.cardRarity
            class.text = v.CardType
        end    
    end
    --suit.Label(body, {align = "left"}, suit.layout:row(200,200))

    suit.layout:row(200,20)

    if suit.Button("Back", suit.layout:row(200,50)).hit then
        SM.load("MasterPage")
        SM.unload("GetPage")
    end


    --right side of screen--
    suit.layout:reset(520,5)

    suit.Label(name.text, {align = "center"}, suit.layout:row(150,50))

    suit.layout:reset(440,280)
    
    suit.Label(effect.text, {align = "left"}, suit.layout:row(310, 30))

    suit.layout:reset(515,230)

    suit.Label(rarity.text .. "/" .. class.text, {align = "center"}, suit.layout:row(150,50))

    suit.layout:reset(485,480)

    suit.Label(hpnum .. "/" .. dnum, {align = "center"}, suit.layout:row(500, 100))
end

function Scene.draw()
    love.graphics.setBackgroundColor(0, 0.6, 0.6, 1.0)
    love.graphics.setColor(0.4,0.4,0.4)
    love.graphics.rectangle("fill", 420, 10, 350, 550) 
    love.graphics.setColor(1,1,1,.2)
    love.graphics.rectangle("fill", 440, 280, 310, 250)
    love.graphics.setColor(0.2,0.2,0.2)
    love.graphics.rectangle("fill", 710, 520, 50, 20)
    love.graphics.setColor(1,1,1,1)
    love.graphics.scale(2.2,1.1)
    love.graphics.scale(.6,.7)
    love.graphics.draw(pic, 332, 60)
    love.graphics.reset()
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

return Scene