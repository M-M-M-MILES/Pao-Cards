local suit = require 'suit'
local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"

local body = {}
response = table.concat(body)

local Scene = {}
local username = {text = ""}
local password = {text = ""}
local code1

function Scene.load()
    
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("Please Login or create an account", {align = "center" }, suit.layout:row(200,50))

    suit.layout:row(200,25)

    suit.Label("Username", {align = "left" }, suit.layout:row(200,14))
    
    suit.Input(username, suit.layout:row(200,30))

    suit.layout:row(200,25)

    suit.Label("Password", {align = "left" }, suit.layout:row(200,14))

    suit.Input(password, suit.layout:row(200,30))

    suit.layout:row(200,25)

    if suit.Button("Login", suit.layout:row(200,50)).hit then
        local request_body = { userName = username.text, password = password.text} --the json body
        request_body = json.encode(request_body)
        local res, code, headers, status = http.request {
            method = "POST",
            url = "http://127.0.0.1:8002/createCard", --NEED TO CHANGE
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

    if code1 == 200 then
        SM.load("OpeningPage")
        SM.unload("LoginPage")
    end

    suit.layout:row(200,25)

    if suit.Button("Create account", suit.layout:row(200,50)).hit then
        SM.load("SignupPage")
    end


    suit.layout:row(200,20)

    if suit.Button("Quit", suit.layout:row(200,50)).hit then
        love.event.quit(0)
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(103/255, 153/255, 199/255, 1.0)
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