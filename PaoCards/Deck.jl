mutable struct Deck
    DeckId::Int
    UserId::Int
    CardList::Card[]
end
 
function initDeck(UsingDeck, Deck)
UsingDeck = Deck.CardList
end

