mutable struct CardType
    CardTypeId::Int
    Name::String
    Passive::CardEFfect
end
#John Said how he wanted 4 base types, tanks dps, and healers
#I propse we change it to 3 base classes with 3 base types each.

#DPS
#1 - Warriors- Basic DPS type with standard single target Damage. Offensive attacks deals damage to 1 enemy at a time. Gets normal bonuses from buffs
#2 - Mages - Can attack multiple enemies at a time with a single attack but deals slightly lower damage than the warrior with those attacks. For example, a warrior might deal 90 damage to a single card with 1 attack. A mage with an equal attack stat to the warrior with deal a sun total of 90 damage spread across every card of the field. Meaning Mages thrive the less enemies they are facing as more enemies force mages to split damage. The get a small % multiplier bonus from buffs, meaning a 45% attack buff is a 50% attack buff to a mage 
#3 - Assassins - High single target damage and destroy potential. Rather than % bonuses from buffs, Assassins get flat stat increases. For example, an assassin with 100 attack getting a 50% attack buff will instead keep the 100 attack and get a flat damage bonus to their attacks. The % to flat bonus conversion will be worked out later

#Tanks 
#1 - Paladin - General Tanks type. High Hp stat and gets double % bonuses from defensive buffs/debuffs. Yes defense debuffs and buffs are twice as effective on paladins. Forces aggro from enemy attacks, meaning as long as this card is on the field during battle phase, the enemey can only attack this card. IF there are multiple paladins on the field, the enemy can attack either one. Mages do break through paladin aggro forcing though. And assassins have the power to deal heavy damage to them with enough buffs/debuffs
#2 - Dragoons - The dueler type . Doesn't force aggro, but can shield other cards from damage. The gimmick of this card is it's counter ability. Similar to Yang from RWBY, dragoons convert missing health into a % attack bonus. Essentially this card is for big damage reversals. Decent Hp stat and attack stat. Base Attack stat is generally smaller than warrior's though
#3 - NecroKnights - Converts damage into health and health into damage. Not a lot of hp, decent attack. 

#Supports
#1 - Medics - Heals people. Counter to NecroKnights as you can "heal" any card on the field. The heal ability can be used to damage necroknights as well as heal allies, or enemies if you want. Medics cannot heal themselves and they cannot be healed by other medics.
#2 - Synergist - The buffer class. Gives buffs to allies. Attack buffs, Resistances(whether physical or elemental), and the big one, regen. Regen can also be used on necroknights, and its the only way for mages to recover health. Synergist can buff themselves as well.
#3 - Sabatouers - The debuff class. Gives debuffs to enemeies. Rather than regen, sabatouers have poison. Also some sabatouers might have access to disable, which disables passive skills of cards. For example, it can disable the aggro forcing of paladins, or change it to where assassins get buffs normally for x amount of turns.

#This can all be implemented later once we actually get to creating cards.