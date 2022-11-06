include("database.jl")
include("Card_Connect.jl")

route("/getCard2", method = GET) do

   test = getCard(getpayload(:cardName))
     createCard(test)
     print(test)
end


#This block of code will be the main while loop that happens while a duel is happening.


#initMatchmaking(dueler1) This function will take in a player and calls the initDuel function once the other player is found

function intiDuel(Dueler1, Dueler2) #draw 5 cards at start, phase changes, errything else
    phaseCount = 1
    winner = 0
    drawCard(Dueler1.CurrentDeck, 5)
    drawCard(Dueler2.CurrentDeck, 5)
while (winner != 1 || winner != 2)
#prompts the user to cast a spell or summon a monster
while (phaseCount == 1 )
    drawCard(Dueler1.CurrentDeck, 1)
    phaseCount = 2
end
while (phaseCount == 2 )
  
   s[]
   for i = 1:Dueler1.CurrentDeck
    if (Dueler1.CurrentDeck[i].Location == 2)
        push(s, Dueler1.CurrentDeck[i])
    end
end
print("Choose a card to cast or 0 to skip main phase")
print(s)
cardToCast = readline()
if (cardToCast != 0)
    Summon(s[cardToCast])
end


    phaseCount = 3
end
while (phaseCount == 3)
    #player chooses which monsters are attacking and who to attack
end
while (phaseCount == 4)
    i = 0
    n[]
    for i = 0:Dueler1.CurrentDeck
        if Dueler1.CurrentDeck[i].Location == 2
            push(n,Dueler1.CurrentDeck[i])
        end
    end
    if (length(n) > 5)
        i = length(n)
       while (i > 5)
        print("Choose a card to discard")
        print(n)
        cardToDiscard = readline()
        n[cardToDiscard].Location = 3
        n[cardToDiscard] = 0
       end


    phaseCount = 1
end
end
end 
