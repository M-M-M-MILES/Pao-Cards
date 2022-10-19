using Sockets

errormonitor(@async begin
    server = listen(IPv4(0),443) # or 80
    while true
        sock = accept(server)
        @async while isopen(sock)
            write(sock, readline(sock, keep=true))
        end
    end
end)