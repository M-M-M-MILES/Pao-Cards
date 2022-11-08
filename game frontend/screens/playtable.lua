local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local body = {}
local suit = require 'suit'
local Deck1 = 1
local Deck2 = 3
local Scene = {}
local Names1 = {name1 = "",
                name2 = "",
                name3 = "",
                name4 = "",
                name5 = "",}

local Names2 = {name1 = "",
                name2 = "",
                name3 = "",
                name4 = "",
                name5 = "",}
local HP = "HP"
local rank = "Rank#"
local wl = "W/L#"


function Scene.load()
    
    pic = love.graphics.newImage("picstarwars.PNG")
end

function Scene.update(dt)
    
    --quit
    suit.layout:reset(50,410)

        if suit.Button("Quit", suit.layout:row(100,50)).hit then
            love.event.quit(0)
        end

    --top player
    suit.layout:reset(1300,50)

        if suit.Button("l", suit.layout:row(200,200)).hit then
            SM.load("playerinfo")
        end

    --Hand
    suit.layout:reset(50,0)
        
        if suit.Button("", suit.layout:row(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
    --end
    suit.layout:reset(360,50)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:row(100,20)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(480,50)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(600,50)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("",suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(720,50)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(840,50)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(960,50)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(1080,50)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(1430,240)

        suit.Label(rank, {align = "left"}, suit.layout:row(100,50))

    suit.layout:reset(1300,240)
        
        suit.Label(wl, {align = "left"}, suit.layout:row(100,50))

    suit.layout:reset(1250,150)
        
        suit.Label(HP, {align = "left"}, suit.layout:row(100,50))
        
        
    --Phase bar
    suit.layout:reset(360,410)

        if suit.Button("Draw", suit.layout:row(164,50)).hit then
            local body = gameLogic()          
            
        end
        if suit.Button("Play cards", suit.layout:col(164,50)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("Attack ", suit.layout:col(164,50)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("Play cards", suit.layout:col(164,50)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("End", suit.layout:col(164,50)).hit then
            SM.load("cardzoom")
        end

    --bottom player
    suit.layout:reset(30,625)

        if suit.Button("l", suit.layout:row(200,200)).hit then
            SM.load("playerinfo")
        end

    --deck
    suit.layout:reset(1250,715)

        if suit.Button("", suit.layout:row(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
        if suit.Button("", suit.layout:col(50,150)).hit then
            SM.load("cardzoom")
        end
    --end

    suit.layout:reset(360,500)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

        suit.layout:row(100,20)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(480,500)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(600,500)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(720,500)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(840,500)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(960,500)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(1080,500)

        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end
    
        suit.layout:row(100,20)
    
        if suit.Button("", suit.layout:row(100,150)).hit then
            SM.load("cardzoom")
        end

    suit.layout:reset(35,590)

        suit.Label(rank, {align = "left"}, suit.layout:row(100,50))

    suit.layout:reset(170,590)
        
        suit.Label(wl, {align = "left"}, suit.layout:row(100,50))

    suit.layout:reset(250,700)
        
        suit.Label(HP, {align = "left"}, suit.layout:row(100,50))
end

function Scene.draw()
    suit.draw()
    --love.graphics.circle("line", 1400, 150, 85)
    love.graphics.scale(.3,.3)
    love.graphics.draw(pic,4405,240)
    love.graphics.draw(pic,170,2155)
    love.graphics.reset()
    --love.graphics.circle("line", 130, 725, 85)

    love.graphics.rectangle("line", 50, 0, 50, 150)
    love.graphics.rectangle("line", 100, 0, 50, 150)    
    love.graphics.rectangle("line", 150, 0, 50, 150)
    love.graphics.rectangle("line", 200, 0, 50, 150)
    love.graphics.rectangle("line", 250, 0, 50, 150)

    love.graphics.rectangle("line", 1250, 716, 50, 150)
    love.graphics.rectangle("line", 1300, 716, 50, 150)
    love.graphics.rectangle("line", 1350, 716, 50, 150)
    love.graphics.rectangle("line", 1400, 716, 50, 150)
    love.graphics.rectangle("line", 1450, 716, 50, 150)
end

function gameLogic()
local body = http.request ("http://127.0.0.1:8002/getDeckCards?deckId=" ..Deck1)
    local body1 = json.decode(body)
    local body2 = http.request ("http://127.0.0.1:8002/getDeckCards?deckId=" ..Deck2)
    local body2s = json.decode(body2)
    for k,v in ipairs(body1) do
    Card = v.location
    local request_body = { Deck = Deck1, drawAmount = 5} --the json body
        request_body = json.encode(request_body)
        local res, code, headers, status = http.request {
            method = "POST",
            url = "http://127.0.0.1:8003/drawCard",
            source = ltn12.source.string(request_body),
            headers = {
                ["content-type"] = "application/json",
                ["content-length"] = string.len(request_body)
            },
            sink = ltn12.sink.table(response_body)
        }
        names1.name[k] = v.name
        --response = table.concat(body3)
    --local body = http.request ("http://127.0.0.1:8003/drawCard")
    end
    local body1 = json.decode(body)
    for k,v in ipairs(body2s) do 
        Card = v.location
        local request_body = { Deck = Deck2, drawAmount = 5} --the json body
            request_body = json.encode(request_body)
            local res, code, headers, status = http.request {
                method = "POST",
                url = "http://127.0.0.1:8003/drawCard",
                source = ltn12.source.string(request_body),
                headers = {
                    ["content-type"] = "application/json",
                    ["content-length"] = string.len(request_body)
                },
                sink = ltn12.sink.table(response_body)
            }
            --response = table.concat(body3)
        --local body = http.request ("http://127.0.0.1:8003/drawCard")
        local body2 = json.decode(body)
    end
end

return Scene