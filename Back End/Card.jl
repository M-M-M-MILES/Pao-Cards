#General Class for cards. Type specific attributes will be defined elsewhere 
include("CardEffect.jl")
include("CardType.jl")

struct Card
    cardId::Int
    cardName::String
    cardType::CardType
    cardEffect::CardEffect 
end