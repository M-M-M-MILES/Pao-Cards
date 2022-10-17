#This class should define what a general user is
#Properties of a user: Id, Username, Password, Profile Picture, Cards Owned, Deck, Wins, Loses, Rank, Level, User Settings, Friends list
using("Card.jl")

#import .Card_mod

module User_mod

    mutable struct User
        userId::Int
        userName::String
        password::String
        email::String
        dateOfBirth::DateTime
        level::Int
        rank::String
        userRole::UserRole
        deckOwned::Deck
        cardOwned::Card
        previousMatches::Match
    end

    mutable struct Role
        Users::UserRole
    end

    mutable struct Roles
        Admin::String
        Player::String
    end 

    mutable struct UserRole
        User::User
        Role::Role
    end

end