--local http = require("socket.http")
--local tempVar = http.request("http://127.0.0.1:8002/")

local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local body = {}



response = table.concat(body)

local suit = require 'suit'
--local suit = require 'Back_End'
local Scene = {}

local input1 = {text = ""}
local input2 = {text = ""}
local input3 = {text = ""}
local input4 = {text = ""}
local input5 = {text = ""}
local input6 = {text = ""}
local input7 = {text = ""}

local image
function Scene.load()
end

function Scene.update(dt)
    suit.layout:reset(295,0)

    suit.Label("Monster card Creater", {align = "center"}, suit.layout:row(200,50))

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

    suit.Label("What is the health?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    if suit.Input(input3, suit.layout:row(200,30)).hovered then

        suit.Label(input3.text, {align = "left"}, suit.layout:col())

    end
    suit.layout:reset(295,257)

    suit.layout:row(200,25)

    suit.Label("What is the effect?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    if suit.Input(input4, suit.layout:row(200,30)).hovered then

        suit.Label(input4.text, {align = "left"}, suit.layout:col())

    end
    suit.layout:reset(295,326)

    suit.layout:row(200,25)

    suit.Label("What is the rarity?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    if suit.Input(input5, suit.layout:row(200,30)).hovered then

        suit.Label(input5.text, {align = "left"}, suit.layout:col())

    end
    suit.layout:reset(295,395)

    suit.layout:row(200,25)

    --suit.Label("What is the card ID?", {align = "left"}, suit.layout:row(200,14))

    --suit.layout:row(200,0)

    --if suit.Input(input6, suit.layout:row(200,30)).hovered then

    --    suit.Label(input6.text, {align = "left"}, suit.layout:col())

   -- end
   -- suit.layout:reset(295,464)

    --suit.layout:row(200,25)

    if suit.Button("Back", suit.layout:row(70,50)).hit then
        SM.load("MenuPage")
        SM.unload("MonsterPage")
    end

    suit.layout:col(60,50)
    
    if suit.Button("Submit", suit.layout:col(70,50)).hit then
        print(input1.text)
        print(input2.text)
        print(input3.text)
        print(input4.text)
        print(input5.text)
        print(input6.text)

        local request_body = { cardName = input1.text, CardType = input2.text, cardEffect = input3.text} --the json body
        request_body = json.encode(request_body)
        local res, code, headers, status = http.request {
            method = "POST",
            url = "http://127.0.0.1:8002/createCard",
            source = ltn12.source.string(request_body),
            headers = {
                ["content-type"] = "application/json",
                ["content-length"] = string.len(request_body)
            },
            sink = ltn12.sink.table(response_body)
        }
        response = table.concat(body)
       -- print(tempVar)
        
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(0.8, 0, 0, 0)
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