#import Pkg; Pkg.add("Genie")

using Genie
using Genie.Router, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests

include("Models/User.jl")
include("Models/Card.jl")

#import .User_mod
#import .Card_mod

function getCard(x)
    card = SQLite.execute(db, "SELECT * FROM Cards WHERE cardId = ('$x')")
    return card
end

function getUserDecks(x)
    user_decks = SQLite.execute(db, "SELECT deckId FROM User_Decks WHERE userId = ('$x')")
    #deck = SQLite.execute(db, "SELECT deckName FROM Decks WHERE deckId = user_decks")
    return user_decks
end

function getDeckCards(x)
    deckCards = SQLite.execute(db, "SELECT cardId FROM Deck_Cards WHERE deckId = ('$x')")
    return deckCards
end

function createCard(cardName, CardType, cardEffect)
    #need to add troubleshooting (checking if names match, etc)
    println(cardName)
    println(CardType)
    println(cardEffect)
    # SQLite.execute(db, "INSTER INTO Cards (cardName) VALUES ('$cardName')")
    # SQLite.execute(db, "INSTER INTO Cards (CardType) VALUES ('$CardType')")
    # SQLite.execute(db, "INSTER INTO Cards (cardEffect) VALUES ('$cardEffect')")
    #will need to add rarity at some point. Probably whenever we have the 'gacha' system done 
end

route("/createCard", method = POST) do
    createCard(jsonpayload()["cardName"], jsonpayload()["CardType"], jsonpayload()["cardEffect"])
    return "POST OK"
end

# Launch the server on a specific port, 8002
# Run the task asynchronously
up(8002, async = false)