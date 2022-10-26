local suit = require 'suit'
local http = require("socket.http")

local Scene = {}

function Scene.load()
    http.request {
        method = "POST",
        url = "http://127.0.0.1:8003/listen",
        headers = {
            ["content-type"] = "application/json",
        }
    }
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("Waiting to connect...", {align = "center"}, suit.layout:row(200,50))

    suit.layout:row(200,20)

    if suit.Button("Return to Menu", suit.layout:row(200,50)).hit then
        SM.load("OpeningPage")
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(103/255, 153/255, 199/255, 1.0)
    suit.draw()
end

return Scene