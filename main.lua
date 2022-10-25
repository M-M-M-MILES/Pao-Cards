SM = require "SceneMgr"

function love.load()
    SM.setPath("Pages/")
    SM.load("OpeningPage")
end

function love.update(dt)
    SM.update(dt)
end

function love.draw()
    SM.draw()
end
