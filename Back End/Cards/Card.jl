#General Class for cards. Type specific attributes will be defined elsewhere 
include(raw"\Pao-Cards\Pao-Cards\Back End\Cards")

struct Card
    cardId::Int
    cardName::String
    cardType::CardType
    cardEffect::CardEffect 
end