using Sockets

errormonitor(@async begin
    server = listen(IPv4(0),80) # or 80
    println(string("Your IP is: ", getipaddr(), "\n"))
    while true
        sock = accept(server)
        @async while isopen(sock)
            write(sock, readline(sock, keep=true))
        end
    end
end)