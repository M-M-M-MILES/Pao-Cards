import Pkg; Pkg.add("Genie")
#import Pkg; Pkg.add("DataFrames")
import Pkg; Pkg.add("JSONTables")

using Genie, DataFrames, JSONTables
using Genie.Router, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests

include("Models/User.jl")
include("Models/Card.jl")
include("database.jl")

function createDeck(deckName, userId)
   
   try
        try
            SQLite.execute(db, "INSERT INTO Decks (deckName) VALUES ('$deckName')")
            catch
                println("Error adding deck name")
        end

        deckId = DBInterface.execute(db, "SELECT deckID FROM Decks WHERE deckName = '$deckName'")

        try
            SQLite.execute(db, "INSERT INTO User_Decks (userId, deckID) VALUES ('$userId', '$deckId')")
            catch
                println("Error when adding deck to user")
        end

        catch
            println("Error creating Deck")
    end
end

route("/createDeck", method = POST) do
    createDeck(jsonpayload()["deckName"], jsonpayload()["userId"])
    return "POST OK"
end

function addToDeck(deckId, cardId)
    try
        SQLite.execute(db, "INSERT INTO Deck_Cards VALUES ('$deckId', '$cardId')")
        catch
            println("Error creating relationship")
    end
end

route("/addToDeck", method = POST) do
    addToDeck(jsonpayload()["deckId"], jsonpayload()["cardId"])
    return "POST OK"
end

function getUserDecks(userId)
    try
        cur = DBInterface.execute(db, "SELECT * FROM User_Deck WHERE userID = '$userId'")
        df = DataFrame(cur)
        stringJSON = arraytable(df)
        return stringJSON
        catch
            println("Error returning user decks")
     end
end

route("/getUserDecks", method = GET) do

    return getUserDecks(getpayload(:deckName))
     
end

function getUserDeck(deckId)

    try
        cur = DBInterface.execute(db, "SELECT * FROM Deck_Cards WHERE deckID = '$deckId'")
        df = DataFrame(cur)
        stringJSON = arraytable(df)
        return stringJSON
        catch
            println("Error returning deck")
     end
end

route("/getUserDeck", method = GET) do

    return getUserDeck(getpayload(:deckID))
     
end

function getDeckCards(deckId)
    try
        cur = DBInterface.execute(db, "SELECT * FROM Deck_Cards WHERE deckID = '$deckId'")
        df = DataFrame(cur)
        stringJSON = arraytable(df)
        return stringJSON
        catch
            println("Error returning deck cards")
     end
end

route("/getDeckCards", method = GET) do

    return getDeckCards(getpayload(:deckId))
     
end

function createCard(cardName, CardType, cardEffect, cardHealth, cardAttack, cardImage, cardRarity)
    
    try
        try 
            #"INSERT INTO 'Table Name' (column(s) being entered into separated by commas if multiple) VALUES (Values entered separated by commas if multiple)
            #'$Name' -> to call a value being passed through a function

        #= SQLite.execute(db, "INSERT INTO Cards (cardName, CardType, cardEffect) VALUES 
            ('$cardName', '$CardType', '$cardEffect')") =#

            SQLite.execute(db, "INSERT INTO Cards (cardName) VALUES ('$cardName')")

            catch
                println("Error when adding card name")
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
        
        catch
            println("Error creating card")
    end
end 

route("/createCard", method = POST) do
    createCard(jsonpayload()["cardName"], jsonpayload()["CardType"], jsonpayload()["cardEffect"], jsonpayload()["cardHealth"],
        jsonpayload()["cardAttack"], jsonpayload()["cardImage"], jsonpayload()["cardRarity"])
    return "POST OK"
end

function updateCard(cardId, cardName, CardType, cardEffect, cardHealth, cardAttack, cardImage, cardRarity)

    try
        SQLite.execute(db, "
            UPDATE Cards 
            SET CardType = '$CardType',
                cardName = '$cardName',
                cardEffect = '$cardEffect',
                cardHealth = '$cardHealth',
                cardAttack = '$cardAttack',
                cardImage = '$cardImage',
                cardRarity = '$cardRarity'
            WHERE cardId = '$cardId'
        ")
        catch
            println("Error when updating card")
    end
end 

route("/updateCard", method = PUT)do
    updateCard(jsonpayload()["cardId"],jsonpayload()["cardName"], jsonpayload()["CardType"], jsonpayload()["cardEffect"], jsonpayload()["cardHealth"],
        jsonpayload()["cardAttack"], jsonpayload()["cardImage"], jsonpayload()["cardRarity"])
        return "POST OK"
end

function getCard(cardName)
    try
        cur = DBInterface.execute(db, "SELECT * FROM Cards WHERE cardName = '$cardName'")
        df = DataFrame(cur)
        stringJSON = arraytable(df)
        return stringJSON
        catch
            println("Error returning card")
     end
end

route("/getCard", method = GET) do

    return getCard(getpayload(:cardName))
     
end

function deleteCard(cardName)
    try
        SQLite.execute(db, "DELETE FROM Cards WHERE cardName = '$cardName'")
        catch
            println("Error deleting card")
    end
end

route("/deleteCard", method = DELETE) do 
    deleteCard(getpayload(:cardName))
    return "DELETE OK"
end

# Launch the server on a specific port, 8002
# Run the task asynchronously
up(8002, async = false)