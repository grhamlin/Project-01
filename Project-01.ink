/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

Somewhere just off the coast of California, a shrimp catastrophe is about to take place. What started as your local shrimp colony, is about to be torn apart. A massive current (on shrimp scale that is) is pulling shrimp hundreds of feet away into the darkness of the ocean....



You awake at what almost seems like an ocean intersection. In front of you, a massive pirate ship wreck. To your left, an eerie cave. To the right, a coral reef full of bustling fungus and life. And behind you, the open ocean, which appears to be where you came from, although there's no other shrimp in sight. 

Speaking of the other shrimp, what did they call you?

VAR player_name = ""

-> set_name

=== set_name ===
* [Brayden]
    ~ player_name = "Brayden"
    -> Cross_roads

What is your name?
* [Josh]
    ~ player_name = "Josh"
    -> Cross_roads
    
What is your name?
* [Ava]
    ~ player_name = "Ava"
    -> Cross_roads
    

== Cross_roads ==
Well {player_name} where would you like to go?

+[Pirate Ship Wreck] -> Pirate_Ship_1
+[Coral Reef] -> Coral_Reef_1
+[Dark Cave] -> Cave_1
+[The Ocean] -> Ocean_1


== Pirate_Ship_1 ==
You approach the massive ship, unsure what lies inside. There are a few places to explore...
+[Main Deck] -> main_deck
    /*  
    contains the captains quarters
    The captains quarters contains the treasure chest, compass, and map.
    The compass will change the directions back from left's, right's and straights, to NSEW, and help you start the correct direction. 
    */
+[Below Deck] -> below_deck
    /* 
    contains the giant squid, which has substantial interactions
    and the 3 chest game where you can get the key, which opens the captains quarters
    */
== main_deck ==
-> DONE


== below_deck ==
-> DONE

== Coral_Reef_1 ==
-> DONE

== Cave_1 ==
-> DONE

== Ocean_1 ==
-> DONE


