mutable struct Card
    cardName::String
    cardType::CardType
    cardEffect::String
    Location::Int
    Health::Int
    Attack::Int
    Acted::Int
end

function createCardIG() #Copy function in cardConnect and map the values where they need to be on the ingame card model