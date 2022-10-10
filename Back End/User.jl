#This class should define what a general user is
#Properties of a user: Id, Username, Password, Profile Picture, Cards Owned, Deck, Wins, Loses, Rank, Level, User Settings, Friends list

include("Card.jl")
include("Deck.jl")
include("UserRole.jl")


struct User
    userId::Int
    userName::String
    password::String
    email::String
    dateOfBirth::DateTime
    level::Int
    rank::String
    userRole::UserRole[]
    deckOwned::Deck[]
    cardOwned::Card[]
    #previousMatches::Match[]
end