#This class should define what a general user is
#Properties of a user: Id, Username, Password, Profile Picture, Cards Owned, Deck, Wins, Loses, Rank, Level, User Settings, Friends list
include("Card.jl")

#import .Card_mod

#using Datetime

module User_mod

    mutable struct User
        userId::Int
        userName::String
        password::String
        email::String
        dateOfBirth::String
        level::Int
        rank::String
        userRole::String #changed
        deckOwned::String #changed
        cardOwned::String #changed
        previousMatches::String #changed
    end

    mutable struct Role
        Users::String #changed
    end

    mutable struct Roles
        Admin::String
        Player::String
    end 

    mutable struct UserRole
        User::String #changed
        Role::String #changed
    end

end