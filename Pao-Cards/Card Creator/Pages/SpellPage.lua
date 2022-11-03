local http = require("socket.http")
local ltn12 = require"ltn12"
local json = require "dkjson"
local body = {}

response = table.concat(body)

local suit = require 'suit'
local Scene = {}

local effectbox = {text = "effectbox"}

local name = {text = ""}
local effect = {text = ""}
local ctype = {text = ""}
local hpnum = 0
local dnum = 0
local rarity = {text = " "}
local image
local pic


local code1

function Scene.load()
    pic = love.graphics.newImage('Images/clonepic.jpg')
end

function Scene.update(dt)
    ctype = {text = "Spell"}
    suit.layout:reset(100,0)

    suit.Label("Spell card Creater", {align = "center"}, suit.layout:row(200,50))

    suit.layout:row(200,25)

    suit.Label("What is the name?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Input(name, suit.layout:row(200,30))

    suit.layout:reset(100,119)

    suit.layout:row(200,25)

    suit.Label("What is the effect?", {align = "left"}, suit.layout:row(200,14))

    suit.layout:row(200,0)

    suit.Checkbox(effectbox, {align='right'}, suit.layout:row(20,20))

   if effectbox.checked then
    rows = suit.layout:rows{pos = {130,170}, min_height = 300,
    {100, 30},
    {100, 30},
    {100, 30},
    {100, 30},
    {100, 30},
}
    effect1 = suit.Button("Damge", {align="left", font = smallerFont}, rows.cell(1))
    if effect1.hit then
        effect = {text = effect.text .. " Damage"}
    end 

    effect2 = suit.Button("Damage buff", {align="left", font = smallerFont}, rows.cell(2))
    if effect2.hit then

        effect = {text = effect.text .. " Damage buff"}
    end 

    effect3 = suit.Button("Defensive", {align="left", font = smallerFont}, rows.cell(3))
    if effect3.hit then
        effect = {text = effect.text .. " Defensive"}
    end 

    effect4 = suit.Button("Defense buff", {align="left", font = smallerFont}, rows.cell(4))
    if effect4.hit then
        effect = {text = effect.text .. " Defense buff"}
    end 

    effect5 = suit.Button("Healing", {align="left", font = smallerFont}, rows.cell(5))
    if effect5.hit then
        effect = {text = effect.text .. " Healing"}
    end 
   end
    
    suit.layout:reset(100,326)

    suit.layout:row(200,25)
   
    if suit.Button("Back", suit.layout:row(70,50)).hit then
        SM.load("MenuPage")
        SM.unload("SpellPage")
    end

    suit.layout:col(60,50)
    
    if suit.Button("Submit", suit.layout:col(70,50)).hit then
        print(name.text)
        print(effect.text)
        print(ctype.text)

        local request_body = { cardName = name.text, CardType = ctype.text, cardEffect = effect.text, cardHealth = hpnum, cardAttack = dnum, cardImage = image, cardRarity = rarity.text} --the json body
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
        code1 = code
    end

    local answer = {text = ""}

    if code1 == 200 then
        answer.text = "Your card has been made."
    end
   
    suit.layout:reset(100,450)
    suit.Label(answer.text, {align = "left"}, suit.layout:row(300,50))

    --left side of screen--
    suit.layout:reset(520,5)

    suit.Label(name.text, {align = "center"}, suit.layout:row(150,50))

    suit.layout:reset(440,280)
    
    suit.Label(effect.text, {align = "left"}, suit.layout:row(310, 30))

end

function Scene.draw()
    love.graphics.setBackgroundColor(0, 0.4, 1, 1.0)
    love.graphics.setColor(0.4,0.4,0.4)
    love.graphics.rectangle("fill", 420, 10, 350, 550) 
    love.graphics.setColor(1,1,1,.2)
    love.graphics.rectangle("fill", 440, 280, 310, 250)
    love.graphics.setColor(0.2,0.2,0.2)
    --love.graphics.rectangle("fill", 710, 520, 50, 20)
    love.graphics.setColor(1,1,1,1)
    love.graphics.scale(2.2,1.1)
    love.graphics.scale(.6,.7)
    love.graphics.draw(pic, 332, 60)
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

function love.filedropped(file)
	file:open("r")
	local data = file:read()
	print("Content of " .. file:getFilename() .. ' is')
	print(data)
	print("End of file")
    image = file:getFilename()
end
return Scene