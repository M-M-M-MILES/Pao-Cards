import Pkg; Pkg.add("Genie")

using Genie
using Genie.Router, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests

include("Models/User.jl")
include("Models/Card.jl")
include("database.jl")

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

function createCard(cardName, CardType, cardEffect, cardHealth, cardAttack, cardImage, cardRarity)

    try 
        #"INSERT INTO 'Table Name' (column(s) being entered into separated by commas if multiple) VALUES (Values entered separated by commas if multiple)
        #'$Name' -> to call a value being passed through a function

       #= SQLite.execute(db, "INSERT INTO Cards (cardName, CardType, cardEffect) VALUES 
        ('$cardName', '$CardType', '$cardEffect')") =#

        SQLite.execute(db, "INSERT INTO Cards (cardName) VALUES ('$cardName')")

        catch
            println("Error when creating card")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET CardType = '$CardType' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card type")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardEffect = '$cardEffect' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card effect")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardHealth = '$cardHealth' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card health")
    end
    
    try
        SQLite.execute(db, "UPDATE Cards SET cardAttack = '$cardAttack' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card attack")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardImage = '$cardImage' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card image")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardRarity = '$cardRarity' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card rarity")
    end

end 

route("/createCard", method = POST) do
    createCard(jsonpayload()["cardName"], jsonpayload()["CardType"], jsonpayload()["cardEffect"], jsonpayload()["cardHealth"],
    jsonpayload()["cardAttack"], jsonpayload()["cardImage"], jsonpayload()["cardRarity"])
    return "POST OK"
end

function updateCard(cardName, CardType, cardEffect, cardHealth, cardAttack, cardImage, cardRarity)

    try
        SQLite.execute(db, "UPDATE Cards SET CardType = '$CardType' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card type")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardEffect = '$cardEffect' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card effect")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardHealth = '$cardHealth' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card health")
    end
    
    try
        SQLite.execute(db, "UPDATE Cards SET cardAttack = '$cardAttack' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card attack")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardImage = '$cardImage' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card image")
    end

    try
        SQLite.execute(db, "UPDATE Cards SET cardRarity = '$cardRarity' WHERE cardName = '$cardName'")
        catch
            println("Error when adding card rarity")
    end

end 

route("/updateCard", method = PATCH) do
    updateCard(jsonpayload()["cardName"], jsonpayload()["CardType"], jsonpayload()["cardEffect"], jsonpayload()["cardHealth"],
    jsonpayload()["cardAttack"], jsonpayload()["cardImage"], jsonpayload()["cardRarity"])
    return "PATCH OK"
end

function getCard(cardName)
    try
        SQLite.execute(db, "SELECT * FROM Cards WHERE cardName = '$cardName'")
        catch
            println("Error returning card")
    end
end

route("/getCard", method = GET) do
    getCard(jsonpayload()["cardName"])
    return "GET OK"
end

function deleteCard(cardName)
    try
        SQLite.execute(db, "DELETE FROM Cards WHERE cardName = '$cardName'")
        catch
            println("Error deleting card")
    end
end

route("/deleteCard", method = DELETE) do 
    deleteCard(jsonpayload()["cardName"])
    return "DELETE OK"
end

# Launch the server on a specific port, 8002
# Run the task asynchronously
up(8002, async = false)