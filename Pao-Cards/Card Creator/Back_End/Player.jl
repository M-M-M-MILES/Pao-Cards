mutable struct Player
    PlayerId::Int
    Deck::Deck[]
    Rank::Int
    Currency::Int
    
end
mutable struct Dueler
    PlayerId::Int
    CurrentDeck::CurrentDeck
    Rank::Int
    Health::Int
end


