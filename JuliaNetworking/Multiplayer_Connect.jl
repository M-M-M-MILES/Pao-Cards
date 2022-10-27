import Pkg; Pkg.add("Genie")
using Sockets
using Genie
using Genie.Router, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests


function listenForPlayer()
    errormonitor(@async begin
        server = listen(IPv4(0),80) 
        println(string("Your IP is: ", getipaddr(), "\n"))
        while true
            sock = accept(server)
            @async while isopen(sock)
                write(sock, readline(sock, keep=true))
                #this is where things will be sent back and forth 
            end
        end
    end)
end

route("/listen", method = POST) do
    listenForPlayer()
    return "POST OK"
end


function connectToPlayer(IPAddress)
    octals = split(IPAddress, '.')
    
    clientside = connect(IPv4(parse(Int, octals[1]), parse(Int, octals[2]), parse(Int, octals[3]), parse(Int, octals[4])),80) #doesn't work
    errormonitor(@async while isopen(clientside)
        write(stdout, readline(clientside, keep=true))
        #this is where things will be sent back and forth 
    end)
end

route("/connect", method = POST) do
    connectToPlayer(jsonpayload()["IPAddress"])
    return "POST OK"
end

up(8003, async = false)