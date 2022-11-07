local suit = require 'suit'
local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local body = {}

local Scene = {}

local username = {text = ""}
local password = {text = ""}
local email = {text = ""}
local DOB = {text = ""}
local code1

function Scene.load()
    
end

function Scene.update(dt)
    suit.layout:reset(295,50)

    suit.Label("A new test subject.. I mean player.", {align = "center" }, suit.layout:row(200,50))

    suit.layout:row(200,25)

    suit.Label("Username", {align = "left" }, suit.layout:row(200,14))
    
    suit.Input(username, suit.layout:row(200,30))

    suit.layout:row(200,25)

    suit.Label("Password", {align = "left" }, suit.layout:row(200,14))

    suit.Input(password, suit.layout:row(200,30))

    suit.layout:row(200,25)

    suit.Label("Email", {align = "left" }, suit.layout:row(200,14))
    
    suit.Input(email, suit.layout:row(200,30))

    suit.layout:row(200,25)

    suit.Label("Date of birth (MM/DD/YYYY)", {align = "left" }, suit.layout:row(200,14))

    suit.Input(DOB, suit.layout:row(200,30))

    suit.layout:row(200,25)

    if suit.Button("Submit", suit.layout:row(200,50)).hit then
        local request_body = { userName = username.text, password = password.text, email = email.text, dateOfBirth = DOB.text} --the json body
        request_body = json.encode(request_body)
        local res, code, headers, status = http.request {
            method = "POST",
            url = "http://127.0.0.1:8004/createUser", 
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
        SM.unload("SignupPage")
    end

    suit.layout:row(200,20)

    if suit.Button("Back", suit.layout:row(200,50)).hit then
        SM.load("LoginPage")
        SM.unload("SignupPage")
    end
end

function Scene.draw()
    love.graphics.setBackgroundColor(103/255, 153/255, 199/255, 1.0)
    suit.draw()
end

return Scene