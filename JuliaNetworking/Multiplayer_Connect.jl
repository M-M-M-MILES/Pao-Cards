import Pkg; Pkg.add("Genie")
using Sockets
using Genie
using Genie.Router, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests

sock= 0
sock2= 0
function connectToServer()
    if sock == 0
        global sock = connect(ip"127.0.0.1",8003)
    else
        global sock2 = connect(ip"127.0.0.1",8003)
    end
end

route("/connectToServer", method = POST) do
    connectToServer()
    if checkNumberOfPlayers() ==true
        startGame()
    end
    return "POST OK"
end

function checkNumberOfPlayers()
    if sock != 0 && sock2!=0
        return true
    else
        return false
    end
end

function startGame()
    println("game start")
end



up(8003, async = false)