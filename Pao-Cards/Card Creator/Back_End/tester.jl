using Genie, Genie.Router
using Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests
#using Card_Connect.jl


route("/createCard", method = POST) do
  createCard(jsonpayload()["cardName"], jsonpayload()["CardType"], jsonpayload()["cardEffect"])
  return "POST OK"
end

route("/") do
    html("Hey freeCodeCamp")
end

route("/hello.html") do
  html("Hello freeCodeCamp (in html)")
end

route("/hello.json") do
  json("Hi freeCodeCamp (in json)")
end

route("/hello.txt") do
   respond("Hiya freeCodeCamp (in txt format)", :text)
end

# Launch the server on a specific port, 8002
# Run the task asynchronously
up(8002, async = false)