using Sockets

clientside = connect(IPv4(0),443)#or 80
errormonitor(@async while isopen(clientside)
    write(stdout, readline(clientside, keep=true))
end)
println(clientside,"Hello World from the Echo Server")
