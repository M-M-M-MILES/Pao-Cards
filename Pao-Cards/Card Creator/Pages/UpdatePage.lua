local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"

local suit = require 'suit'

local Scene = {}
local bodySent = {}

local typebox = {text = "typebox"}
local effectbox = {text = "effectbox"}
local rarebox = {text = "rarebox"}
local classbox = {text = "classbox"}

local name = {text = ""}
local name2 = {text = ""}
local hp = {text = ""}
local hpnum = 0
local damage = {text = ""}
local dnum = 0
local class = {text = ""}
local effect = {text = "", text2 = ""}
local rarity = {text = ""}
local ctype = {text = ""}
local image = "testimage"
local code1

function Scene.load()
end

function Scene.update(dt)
    suit.layout:reset(100,10)

    suit.Label("Update card menu", {align = "center"}, suit.layout:row(200,50))

    suit.Label("What is the name of the card you wish to see?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,15)

    suit.Input(name2, suit.layout:row(200,30))

    suit.layout:row(200,25)

    if suit.Button("Get", suit.layout:row(200,50)).hit then
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
            Id = v.cardId
        end       
    end

    suit.layout:reset(100,210)

    --update--

    suit.Label("Update:", {align = "center"}, suit.layout:row(200,50))

    suit.layout:reset(100,250)

    suit.Label("What is the name?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Input(name, suit.layout:row(200,30))

    suit.layout:reset(100,270)

    suit.layout:row(200,25)


  suit.Label("What is the health?", {align = "left"}, suit.layout:row(200,14))

   suit.layout:row(200,0)

   suit.Input(hp, suit.layout:row(200,30))
    
    suit.layout:reset(100,315)

   suit.layout:row(200,25)

    suit.Label("What is the attack damage?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Input(damage, suit.layout:row(200,30))

    suit.layout:reset(300,310)

    if suit.Button("Enter Hp and damage", suit.layout:row(90,80)).hit then
       dnum = tonumber(damage.text)
       hpnum = tonumber(hp.text) 
    end

    suit.layout:reset(100,360)

    suit.layout:row(200,25)

    suit.Label("What is the card class?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Checkbox(classbox, {align='right'}, suit.layout:row(20,20))

   if classbox.checked then
    rows = suit.layout:rows{pos = {310,400}, min_height = 300,
    {100, 30},
    {100, 30},
    {100, 30},
    {100,30},
}
    option1 = suit.Button("Tank", {align="left", font = smallerFont}, rows.cell(1))

    if option1.hit then
        class = {text = "Tank"}
    end    
    option2 = suit.Button("Support", {align="left", font = smallerFont}, rows.cell(2))

    if option2.hit then
        class = {text = "Support"}
    end 
    option3 = suit.Button("Damage", {align="left", font = smallerFont}, rows.cell(3))

    if option3.hit then
        class = {text = "Damage"}
    end    
    option4 = suit.Button("Healer", {align="left", font = smallerFont}, rows.cell(4))

    if option4.hit then
        class = {text = "Healer"}
    end 
   end
    suit.layout:reset(100,390)

    suit.layout:row(200,25)

    suit.Label("What is the effect?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Checkbox(effectbox, {align='right'}, suit.layout:row(20,20))

   if effectbox.checked then
    rows = suit.layout:rows{pos = {310,400}, min_height = 300,
    {100, 30},
    {100, 30},
    {100, 30},
    {100, 30},
    {100, 30},
}
    effect1 = suit.Button("Damge", {align="left", font = smallerFont}, rows.cell(1))
    if effect1.hit then
        effect = {text = "", text2 = effect.text2 .. " Damage"}
    end 

    effect2 = suit.Button("Damage buff", {align="left", font = smallerFont}, rows.cell(2))
    if effect2.hit then

        effect = {text = "", text2 = effect.text2 .. " Damage buff"}
    end 

    effect3 = suit.Button("Defensive", {align="left", font = smallerFont}, rows.cell(3))
    if effect3.hit then
        effect = {text = "", text2 = effect.text2 .. " Defensive"}
    end 

    effect4 = suit.Button("Defense buff", {align="left", font = smallerFont}, rows.cell(4))
    if effect4.hit then
        effect = {text = "", text2 = effect.text2 .. " Defense buff"}
    end 

    effect5 = suit.Button("Healing", {align="left", font = smallerFont}, rows.cell(5))
    if effect5.hit then
        effect = {text = "", text2 = effect.text2 .. " Healing"}
    end 
   end

    suit.layout:reset(100,420)

    suit.layout:row(200,25)

    suit.Label("What is the rarity?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Checkbox(rarebox, {align='right'}, suit.layout:row(20,20))

   if rarebox.checked then
    rows = suit.layout:rows{pos = {310,400}, min_height = 300,
    {100, 30},
    {100, 30},
    {100, 30},
    {100, 30},
}
    rare1 = suit.Button("Normal", {align="left", font = smallerFont}, rows.cell(1))
    if rare1.hit then
        rarity = {text = "Normal"}
    end 

    rare2 = suit.Button("Lengendary", {align="left", font = smallerFont}, rows.cell(2))
    if rare2.hit then
        rarity = {text = "Lengendary"}
    end 

    rare3 = suit.Button("Rare", {align="left", font = smallerFont}, rows.cell(3))
    if rare3.hit then
        rarity = {text = "Rare"}
    end 

    rare4 = suit.Button("Special", {align="left", font = smallerFont}, rows.cell(4))
    if rare4.hit then
        rarity = {text = "Special"}
    end 
   end

    suit.layout:reset(100,460)

    suit.layout:row(200,25)

    if suit.Button("Back", suit.layout:row(70,50)).hit then
        SM.load("MasterPage")
        SM.unload("UpdatePage")
    end

    suit.layout:col(60,50)
    
    if suit.Button("Submit", suit.layout:col(70,50)).hit then
        print(hpnum)
        print(dnum)
        print(name.text)
        print(hpnum)
        print(dnum)
        print(class.text)
        print(effect.text2)
        print(rarity.text)
        print(ctype.text)

        local request_body = { cardId = Id, cardName = name.text, CardType = class.text, cardClass = class.text, cardEffect = effect.text2, cardHealth = hpnum, cardAttack = dnum, cardImage = image, cardRarity = rarity.text} --the json body
        request_body = json.encode(request_body)
        local res, code, headers, status = http.request {
            method = "PUT",
            url = "http://127.0.0.1:8002/updateCard",
            source = ltn12.source.string(request_body),
            headers = {
                ["content-type"] = "application/json",
                ["content-length"] = string.len(request_body)
            },
            sink = ltn12.sink.table(response_body)
        }
        response = table.concat(bodySent)
        code1 = code
    end

    local answer = {text = ""}

    if code1 == 200 then
        answer.text = "Your card has been made."
    end

   
    suit.layout:reset(100,550)
    suit.Label(answer.text, {align = "left"}, suit.layout:row(300,50))

    --left side of screen--
    suit.layout:reset(520,5)

    suit.Label(name.text, {align = "center"}, suit.layout:row(150,50))

    suit.layout:reset(440,280)
    
    suit.Label(effect.text .. effect.text2, {align = "left"}, suit.layout:row(310, 30))

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
    --love.graphics.draw(pic, 332, 60)
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