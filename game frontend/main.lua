SM = require "SceneMgr"

function love.load()
    SM.setPath("screens/")
    SM.load("playtable")
    --love.window.setFullscreen(true, "desktop")
    background = love.graphics.newImage("background.jpg")
end

function love.update(dt)
    SM.update(dt)
end

function love.draw()
    for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end
    SM.draw()
end
