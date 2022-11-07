mutable struct CardEFfect
    cardEffectId::Int
    Description::String
end

#Deal Damage Effect Function
function dealDamage(TargetPlayer, card, damageAmount)
    if card == 0
        TargetPlayer.Health = TargetPlayer.Health - damageAmount
    end
end


#These two draw and mill functions loop through the cardStack and checks if for the first instances of a card's location being 1. If a card's location is = to 1, that means it is located in the Deck. 
#The draw function changes the location of the card to 2 while the mill function changes the location of the card to 3. 2 Means the card is located in the player's hand, while 3 means it's located in the graveyard
function drawCard(Deck, drawAmount)

j = 1
for i = 1:drawAmount
    while(Deck.CardList[j].Location != 1)
        j = j+1
    end
    Deck.CardList[j].Location = 2
end
end

route("/drawCard", method = POST) do
    drawCard(jsonpayload()["Deck"], jsonpayload()["drawAmount"])
    return "POST OK"
end


function millCard(Deck, millAmount)
j = 1
for i = 1:millAmount
    while(Deck.CardList[j].Location != 1)
        j = j+1
    end
    Deck.CardList[j].Location = 3
end
end 
#Summoning changes the location of the card to 4, meaning its on the board, and the revealed value of the card to 2, meaning its now revealed to opposing players
function Summon(targetCard)
    targetCard.Location = 4
    targetCard.Revealed = 2
end

function spellCard(spellCard)
    #prompt the user the cast a card.
    if spellCard.cardEffectId == 1
        drawCard(CasterDeck, spellCard.Attack)
    elseif spellCard.cardEffectId == 2
        millCard(CasterDeck, spellCard.Attack)
    elseif spellCard.cardEffectIf == 3
        dealDamage(TargetPlayer, card, damageAmount)
        


up(8003, async = false)