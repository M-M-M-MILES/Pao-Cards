#General Class for cards. Type specific attributes will be defined elsewhere 
using("User.jl")

#import .User_mod

module Card_mod

    mutable struct CardType
        Monster::String
        Spell::String
    end

    mutable struct Card
        cardId::Int
        cardName::String
        cardType::CardType
        #cardEffect::CardEffect 
    end

    mutable struct Deck
        deckId::Int
        deckName::String
        userId::Int
    end

    mutable struct CardDeck
        deck::Deck 
        card::Card
    end

    mutable struct UserCard
        User::User
        Card::Card
    end

    mutable struct UserDeck
        User::User
        Deck::Deck
    end

end