
include("Card_Connect.jl")
include("Player.jl")
include("CardIG.jl")
include("Deck.jl")
include("CardType.jl")



#This block of code will be the main while loop that happens while a duel is happening.


#initMatchmaking(dueler1) This function will take in a player and calls the initDuel function once the other player is found
print("this is a test")
function initDuel() #draw 5 cards at start, phase changes, errything else
    
    CurrentDeck1 = getDeckCards(1)
    CurrentDeck2 = getDeckCards(2)
    for i = i:length(CurrentDeck1)
        tempCard = getCardId(CurrentDeck1)
        CurrentDeck1[i] = Card(tempCard.cardName, tempCard.cardType, tempCard.cardEffect, 1, tempCard.cardHealth, tempCard.cardAttack, 0 )

    end
    for i = i:length(CurrentDeck2)
        tempCard = getCardId(CurrentDeck2)
        CurrentDeck2[i] = Card(tempCard.cardName, tempCard.cardType, tempCard.cardEffect, 1, tempCard.cardHealth, tempCard.cardAttack, 0 )

    end
print("Deck 1", CurrentDeck1)
print("Deck 2", CurrentDeck2)
    phaseCount = 1
    winner = 0
    drawCard(CurrentDeck1, 5)
    drawCard(CurrentDeck2, 5)
    print("Deck 1", CurrentDeck1)
    print("Deck 2", CurrentDeck2)
    Dueler1 = Dueler(1, CurrentDeck1, 1, 100)
    Dueler2 = Dueler(2, CurrentDeck2, 1, 100)
while (winner != 1 || winner != 2)
#prompts the user to cast a spell or summon a monster
while (phaseCount == 1 )
    drawCard(CurrentDeck1, 1)
    phaseCount = 2
end
while (phaseCount == 2 )
  
   s[]
   for i = 1:CurrentDeck1
    if (CurrentDeck1[i].Location == 2)
        push(s, CurrentDeck1[i])
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
   #Attacking Phase
   complete = 0
    while complete == 0
    en = []
    for i = i:length(CurrentDeck2)
        if CurrentDeck2[i].Location == 3 
            push(en, CurrentDeck2[i])
        end
    end
    you = []
    for i = i:length(CurrentDeck1)
        if CurrentDeck1[i].Location == 3
            push(you, CurrentDeck1[i])
        end
    end
    if isempty(you) == true
        complete = 1
    else
        print("Enemy LineUp", en)
        print("Your Lineup", you)
        print("Choose a card to attack with")
        Attacker = readline()
        if isempty(en) == true
            dealDamage(Dueler2, 0, you[Attacker].Attack)
        else
        print("Choose an enemy card to attack")
        Victim = readline()
        dealDamage(Dueler2, en[Victim], you[Attacker].Attack)
        end
        end
end
end

   



while (phaseCount == 4)
    i = 0
    n[]
    for i = 0:CurrentDeck1
        if CurrentDeck1[i].Location == 2
            push(n,CurrentDeck1[i])
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


       #player 2 phases

       while (phaseCount == 5 )
        drawCard(CurrentDeck2, 1)
        phaseCount = 6
    end
    while (phaseCount == 6 )
      
       s[]
       for i = 1:CurrentDeck2
        if (CurrentDeck2[i].Location == 2)
            push(s, CurrentDeck2[i])
        end
    end
    print("Choose a card to cast or 0 to skip main phase")
    print(s)
    cardToCast = readline()
    if (cardToCast != 0)
        Summon(s[cardToCast])
    end
    
    
        phaseCount = 7
    end
    while (phaseCount == 7)
       #Attacking Phase
       complete = 0
        while complete == 0
        en = []
        for i = i:length(CurrentDeck1)
            if CurrentDeck1[i].Location == 3 
                push(en, CurrentDeck1[i])
            end
        end
        you = []
        for i = i:length(CurrentDeck2)
            if CurrentDeck2[i].Location == 3
                push(you, CurrentDeck2[i])
            end
        end
        if isempty(you) == true
            complete = 1
        else
            print("Enemy LineUp", en)
            print("Your Lineup", you)
            print("Choose a card to attack with")
            Attacker = readline()
            if isempty(en) == true
                dealDamage(Dueler1, 0, you[Attacker].Attack)
            else
            print("Choose an enemy card to attack")
            Victim = readline()
            dealDamage(Dueler1, en[Victim], you[Attacker].Attack)
            end
            end
    end
    end
    
       
    
    
    
    while (phaseCount == 8)
        i = 0
        n[]
        for i = 0:CurrentDeck2
            if CurrentDeck2[i].Location == 2
                push(n,CurrentDeck2[i])
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
end


initDuel()