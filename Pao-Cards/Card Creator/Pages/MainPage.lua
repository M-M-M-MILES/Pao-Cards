local suit = require 'suit'

local Scene = {}

function Scene.load()

end
function Scene.update(dt)
    
    --Small bar to side of screen with options (chat, profile, etc)

    

    --Navigation/search bar



    --main section of screen 

end

function Scene.draw()
    love.graphics.setBackgroundColor(0, 0.6, 0, 1.0)
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
end

return Scene