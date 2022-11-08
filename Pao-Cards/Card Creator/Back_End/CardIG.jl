mutable struct Card
    cardName::String
    cardType::CardType
    cardEffect::String
    Location::Int
    Health::Int
    Attack::Int
    Acted::Int
end

function getCardsbyLocation(CardArray)
    inHand = []
    inDeck = []
    inGraveyard = []
    inPlay = []
    for i = 1:eachindex(CardArray)
        if CardArray[i].Location == 1
            push(inDeck, CardArray[i])
        elseif CardArray[i].Location == 2
            push(inHand, CardArray[i])
        elseif CardArray[i].Location == 3
            push(inPlay, CardArray[i])
        else
            push(inGraveyard, CardArray[i])

    end
end
return ([inHand, inDeck, inGraveyard, inPlay])
end