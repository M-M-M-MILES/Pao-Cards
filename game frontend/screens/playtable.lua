local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local cardzoom = require("screens/cardzoom")
local body = {}
local suit = require 'suit'
local Deck1 = 1
local Deck2 = 2
local Scene = {}
local Names1 = {"","","","",""}
local Names2 = {"","","","",""}
local HP = "HP"
local rank = "Rank#"
local wl = "W/L#"


function Scene.load()
    
    pic = love.graphics.newImage("picstarwars.PNG")
end

function Scene.update(dt)
    
    --quit
    suit.layout:reset(50,525)

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
        
        if suit.Button(Names2[1], suit.layout:row(250,100)).hit then
            cardzoom.test(Names2[1])
            SM.load("cardzoom")
        end
        if suit.Button(Names2[2], suit.layout:row(250,100)).hit then
            cardzoom.test(Names2[2])
            SM.load("cardzoom")
        end
        if suit.Button(Names2[3], suit.layout:row(250,100)).hit then
            cardzoom.test(Names2[3])
            SM.load("cardzoom")
        end
        if suit.Button(Names2[4], suit.layout:row(250,100)).hit then
            cardzoom.test(Names2[4])
            SM.load("cardzoom")
        end
        if suit.Button(Names2[5], suit.layout:row(250,100)).hit then
            cardzoom.test(Names2[5])
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

    --hand
    suit.layout:reset(1250,364)

        if suit.Button(Names1[1], suit.layout:row(250,100)).hit then
            cardzoom.test(Names1[1])
            SM.load("cardzoom")
        end
        if suit.Button(Names1[2], suit.layout:row(250,100)).hit then
            cardzoom.test(Names1[2])
            SM.load("cardzoom")
        end
        if suit.Button(Names1[3], suit.layout:row(250,100)).hit then
            cardzoom.test(Names1[3])
            SM.load("cardzoom")
        end
        if suit.Button(Names1[4], suit.layout:row(250,100)).hit then
            cardzoom.test(Names1[4])
            SM.load("cardzoom")
        end
        if suit.Button(Names1[5], suit.layout:row(250,100)).hit then
            cardzoom.test(Names1[5])
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

    love.graphics.scale(.3,.3)
    love.graphics.draw(pic,4405,240)
    love.graphics.draw(pic,170,2155)
    love.graphics.reset()

    love.graphics.rectangle("line", 50, 0, 250, 100)
    love.graphics.rectangle("line", 50, 100, 250, 100)    
    love.graphics.rectangle("line", 50, 200, 250, 100)
    love.graphics.rectangle("line", 50, 300, 250, 100)
    love.graphics.rectangle("line", 50, 400, 250, 100)

    love.graphics.rectangle("line", 1250, 365, 250, 100)
    love.graphics.rectangle("line", 1250, 465, 250, 100)
    love.graphics.rectangle("line", 1250, 565, 250, 100)
    love.graphics.rectangle("line", 1250, 665, 250, 100)
    love.graphics.rectangle("line", 1250, 765, 250, 100)
end

function gameLogic()
    local player1D = http.request ("http://127.0.0.1:8002/getDeckCards?deckId=" ..Deck1)
    local body1 = json.decode(player1D)
    local player2D = http.request ("http://127.0.0.1:8002/getDeckCards?deckId=" ..Deck2)
    local body2s = json.decode(player2D)
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
        local body = http.request ("http://127.0.0.1:8002/getCardId?cardId=" .. v.cardId)
        local body2 = json.decode(body) --> changes to table
        for j,v in ipairs(body2) do
            name = v.cardName
        end    
        Names1[k] = name
    end
    print(Names1[1])
    
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
            local body = http.request ("http://127.0.0.1:8002/getCardId?cardId=" .. v.cardId)
            local body2 = json.decode(body)
            for j,v in ipairs(body2) do
                name = v.cardName
            end    
            Names2[k] = name
    end
    print(Names2[1])
end

return Scene