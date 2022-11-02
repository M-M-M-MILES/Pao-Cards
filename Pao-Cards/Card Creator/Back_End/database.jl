import Pkg; Pkg.add("SQLite")

using SQLite

db = SQLite.DB("Pao-CardData.db")

#user table
SQLite.execute(db, "CREATE TABLE IF NOT EXISTS Users 
    (userId INTEGER PRIMARY KEY, userName TEXT, password TEXT, email TEXT, dateOfBirth DATETIME,
    level INTEGER, rank TEXT, userRole TEXT)")
    101

SQLite.execute(db, "CREATE TABLE IF NOT EXISTS Cards
    (cardId INTEGER PRIMARY KEY, cardName TEXT, CardType TEXT, cardEffect TEXT, cardHealth INTEGER,
    cardAttack INTEGER, cardImage BLOB, cardRarity TEXT)") 
    101    

#Relating users to cards
SQLite.execute(db, "CREATE TABLE IF NOT EXISTS User_Cards
    (userId INTEGER, cardId INTEGER)") 
    101    

SQLite.execute(db, "CREATE TABLE IF NOT EXISTS Decks
    (deckID INTEGER PRIMARY KEY, deckName TEXT)") 
    101

#Relating Users to decks
SQLite.execute(db, "CREATE TABLE IF NOT EXISTS User_Decks
    (userID INTEGER, deckId INTEGER)") 
    101

#Relating Decks to cards
SQLite.execute(db, "CREATE TABLE IF NOT EXISTS Deck_Cards
    (deckId INTEGER, cardId INTEGER)") 
    101

SQLite.execute(db, "CREATE TABLE IF NOT EXISTS Matches 
    (matchId INTEGER PRIMARY KEY, hostId INTEGER, challengerId INTEGER, winnerName TEXT,
    loserName TEXT)")
    101

#Relating Users to Matches
SQLite.execute(db, "CREATE TABLE IF NOT EXISTS User_Matches
    (userId INTEGER, matchId INTEGER)")
    101
