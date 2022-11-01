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
    #the player chooses to summon a monster or cast a spell
    # once the player summons a monster, the phase changes
    phaseCount = 3
end
while (phaseCount == 3)
    #player chooses which monsters are attacking and who to attack
end
while (phaseCount == 4)
    i = 0
    n = 0
    for i = 0:Dueler1.CurrentDeck
        if Dueler1.CurrentDeck[i].Location == 2
            n = n + 1
        end
    end
    # if n > 5 ask the player to change n - 5 card's locations to 3
    phaseCount = 1
end
end
end 
