import Pkg; Pkg.add("Genie")
using Sockets
using Genie
using Genie.Router, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests


function listenForPlayer()
    errormonitor(@async begin
        server = listen(IPv4(0),80) #maybe doesn't work 
        #println(string("Your IP is: ", getipaddr(), "\n"))
        while true
            sock = accept(server)
            @async while isopen(sock)
                write(sock, readline(sock, keep=true))
            end
        end
    end)
end

route("/listen", method = POST) do
    listenForPlayer()
    return "POST OK"
end


function connectToPlayer(IPAddress)
    clientside = connect(IPAddress,80) #doesn't work
    errormonitor(@async while isopen(clientside)
        write(stdout, readline(clientside, keep=true))
    end)
    println(clientside,"Hello World from the Echo Server")
end

route("/connect", method = POST) do
    connectToPlayer(jsonpayload()["IPAddress"])
    return "POST OK"
end