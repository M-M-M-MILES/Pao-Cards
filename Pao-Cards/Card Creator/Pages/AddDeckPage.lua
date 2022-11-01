local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local body = {}

response = table.concat(body)

local suit = require 'suit'
local Scene = {}

local deckId = {text = ""}
local cardId = {text = ""}
local cardIdnum
local Idnum

local code1

function Scene.load()
end

function Scene.update(dt)
    suit.layout:reset(100,0)

    suit.Label("Deck adder", {align = "center"}, suit.layout:row(200,50))

    suit.layout:row(200,25)

    suit.Label("What is the Id of the deck?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Input(deckId, suit.layout:row(200,30))

    suit.layout:row(200, 10)

    suit.Label("What is the Id of the card?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Input(cardId, suit.layout:row(200,30))
    
    suit.layout:reset(100,326)

    suit.layout:row(200,25)
   
    if suit.Button("Back", suit.layout:row(70,50)).hit then
        SM.load("DeckMenuPage")
        SM.unload("AddDeckPage")
    end

    suit.layout:col(60,50)
    
    if suit.Button("Submit", suit.layout:col(70,50)).hit then
        cardIdnum = tonumber(cardId.text)
        Idnum = tonumber(Id.text)

        local request_body = { deckId = Idnum, cardId = cardIdnum} --the json body
        request_body = json.encode(request_body)
        local res, code, headers, status = http.request {
            method = "POST",
            url = "http://127.0.0.1:8002/addToDeck",
            source = ltn12.source.string(request_body),
            headers = {
                ["content-type"] = "application/json",
                ["content-length"] = string.len(request_body)
            },
            sink = ltn12.sink.table(response_body)
        }
        response = table.concat(body)
        code1 = code
    end

    local answer = {text = ""}

    if code1 == 200 then
        answer.text = "Your card has been added."
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