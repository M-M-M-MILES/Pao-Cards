mutable struct Card
    cardId::Int
    cardName::String
    cardType::CardType
    cardEffectId::Int
    Location::Int
    Health::Int
    Attack::Int
    Action::String
    Revealed::Int
end

function createCardIG() #Copy function in cardConnect and map the values where they need to be on the ingame card model