local IP = {text = ""}

local suit = require 'suit'
local json = require "dkjson"
local http = require("socket.http")


local Scene = {}

function Scene.load()
    
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("Input friends IP", {align = "center"}, suit.layout:row(200,50))

    suit.Input(IP, suit.layout:row(200,30)) 

    suit.layout:row(200,20)

    if suit.Button("Connect", suit.layout:row(200,50)).hit then
        local request_body = { IPAddress = IP.text} --the json body
        request_body = json.encode(request_body)
        http.request {
            method = "POST",
            url = "http://127.0.0.1:8002/connect",
            source = ltn12.source.string(request_body),
            headers = {
                ["content-type"] = "application/json",
                ["content-length"] = string.len(request_body)
            },
            sink = ltn12.sink.table(response_body)
        }
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