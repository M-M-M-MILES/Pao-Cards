include("User.jl")
include("Card.jl")

struct UserDeck
    User::User
    Deck::Deck[]
end