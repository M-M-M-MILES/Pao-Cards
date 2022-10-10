#This class will define what cards are in a users deck. Users should be able to create multiple decks
#Number of cards in a deck should be limited
#Number of card copies should be limited 

import Database
import Cards

struct Deck
    deckId::Int
    deckName::String
    userId::Int
    card::Card[]
end