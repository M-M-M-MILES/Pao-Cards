local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local body = {}

response = table.concat(body)

local suit = require 'suit'

local Scene = {}

local name = {text = ""}
local code1

function Scene.load()
end

function Scene.update(dt)
    suit.layout:reset(100,50)

    suit.Label("Delete card menu", {align = "center"}, suit.layout:row(200,50))

    suit.Label("What is the name of the card you want deleted?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,15)

    if suit.Input(name, suit.layout:row(200,30)).hovered then

        suit.Label(name.text, {align = "left"}, suit.layout:row())

    end

    suit.layout:reset(100,250)
    suit.layout:row(200,25)

    if suit.Button("Submit", suit.layout:row(200,50)).hit then
        print(name.text)
        local body, code = http.request {
            method = "DELETE",
            url = "http://127.0.0.1:8002/deleteCard?cardName=" .. name.text
        }
        code1 = code
    end

    suit.layout:row(200,20)

    if suit.Button("Back", suit.layout:row(200,50)).hit then
        SM.load("MasterPage")
        SM.unload("DelPage")
    end

    local answer = {text = ""}

    if code1 == 200 then
        answer.text = "Your card has been deleted."
    end

   
    suit.layout:reset(100,450)
    suit.Label(answer.text, {align = "left"}, suit.layout:row(300,50))
end

function Scene.draw()
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