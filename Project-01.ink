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
VAR gem = 0
VAR lantern = 0
VAR zappe_key = 0
VAR statue = 0
VAR box_key = 0
VAR coins = 0
VAR bottle = 0
VAR zappe_convo = 0
VAR squid_convo = 0

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
{not Cave_1: Well {player_name} there are many places to explore, but let's explore the cave first, it's just over there.}
{Cave_1 : Where would you like to go?}
+{Cave_1} [Go to the pirate ship wreck] -> Pirate_Ship_1
+[Go {Cave_1: back} to the cave] -> Cave_1
+{Cave_1}[Swim towards the open ocean] -> Ocean_1
+{Cave_1 and captains_open} [Check Inventory] -> Inventory

==Inventory==
You have...
{lantern} lantern
{coins} coins
{bottle} bottle 
+[Go back] -> Cross_roads

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
+[Return to the cross roads] -> Cross_roads

== below_deck ==
Below deck is somehow even darker, {box_key == 1 : there's not much to see now.} {box_key == 0 : sunken crates line the hull.}{squid_convo == 0: In the back most reaches a giant squid sits waiting. He doesn't see you for now.}
+{box_key == 0}[Search the boxes] -> box_search
+{not squid_talk} [Approach the squid] -> squid_talk_1st
+[Go back upstairs] -> Pirate_Ship_1
    
    
    
== box_search ==
The largest box, just out of sight of the squid, has a combination lock on it with 3 slots. Each Slot has the numbers 1, 2, and 3 available. 

+ [Attempt a combination] -> first_combo_attempt
+[Go back] -> below_deck

== squid_talk_combo1st ==
Trying to open the crates I see, says the squid, clearly you don't know the combination. What are you doing here? 

*[Tell him your story] -> squid_talk
-> DONE

== first_combo_attempt==
Select your first number...
+ [1] -> wrong_combo_path1
+ [2] -> wrong_combo_path1
+ [3] -> correct_combo_path1

==wrong_combo_path1==
Select your second number...
+ [1] -> wrong_combo_path2
+ [2] -> wrong_combo_path2
+ [3] -> wrong_combo_path2

==wrong_combo_path2==
Select your third number...
+ [1] -> wrong_combo_path3
+ [2] -> wrong_combo_path3
+ [3] -> wrong_combo_path3

==correct_combo_path1==
Select your second number...
+ [1] -> correct_combo_path2
+ [2] -> wrong_combo_path2
+ [3] -> wrong_combo_path2

==correct_combo_path2
Select your third number...
+ [1] -> wrong_combo_path3
+ [2] -> correct_combo_path3
+ [3] -> wrong_combo_path3

== correct_combo_path3 ==
You solved the combination lock, and acquired a key! It probably goes to something on the ship.
~box_key = box_key + 1
+[Go back] -> below_deck

== wrong_combo_path3 ==
Incorrect combo, the lock rattles loudly as you try and open it.  {not squid_talk : The squid hears your failed attempt and quickly moves to you... }{squid_talk : would you like to try again?}
{not squid_talk : -> squid_talk_combo1st}
+ {squid_talk} [Yes] -> first_combo_attempt
+ {squid_talk} [No] -> below_deck

== squid_talk_1st ==
~ squid_convo = squid_convo + 1
Hello traveler, what brings you to this wreckage?
*[Tell him your story] -> squid_talk

== squid_talk ==
I see, so you've been stranded here, have you explored the other areas?
*[Yes, I have] -> said_explored





== main_deck ==
The deck is barren after being under the sea for so long, however a closed door still remains. It's the captain's chamber.
+{box_key == 1} [Use the key from under the ship] -> captains_open
+{box_key ==0}[Try to open the door] -> captains_locked
+[Go back] -> Pirate_Ship_1

==captains_open==
Inside the room you see a treasure chest, and a bottle. 
*{coins ==0 } [Open the chest] -> chest_open
*{bottle == 0} [Take the bottle] -> check_bottle
+{bottle > 0} [Check bottle directions] -> check_bottle
+[Go back] -> main_deck

==chest_open==
{coins == 0 : The chest is filled with gold coins}
+{coins < 3} [Take a coin] -> take_coin
+[Go back] -> captains_open

==take_coin==
~ coins = coins + 1
You have {coins == 1 : 1 coin!} {coins > 1 : {coins} coins!} {coins == 3 : You can't carry any more!}
+{coins < 3} [Take another coin] -> take_coin
+[Go back] -> captains_open

==check_bottle==
~ bottle = bottle + 1
Inside the sealed bottle, directions are written on a small piece of paper. It reads...
Left, right, forward, forward, left. 
What could it mean?
+[Go back] -> captains_open

==captains_locked==
It won't budge.
+[Go back] -> main_deck

== Cave_1 ==
Approaching the cave, you are faced with two directions...
+[Go left] -> left_cave
+[Go Right] -> right_cave
+{cave_door} [Explore the other areas] -> Cross_roads

== left_cave ==
You are now in the left tunnel,{lantern == 1 : and you can see more clearly.} {gem == 1 and squid_convo == 0: Do you want to replace the gem?} {lantern == 0 : on the ground lies a lantern.} {squid_convo > 0 : The gem no longer seems to to fit where you took it from.}
*[Pick up the lantern and turn it on] -> lantern_on
+ {lantern == 1 and squid_convo == 0 and gem == 0} [Open the newly found door] -> cave_door
+{gem == 1 and squid_convo == 0} [Replace the gem] -> gem_replace
+[Go back to cave entrance] -> Cave_1

== gem_replace==
~ gem = gem - 1
You have put the gem back in its place.
+[Go back] -> left_cave

== lantern_on ==
~ lantern  = lantern + 1
You now have a lantern!
*[Go back] -> left_cave

== cave_door ==
In this room lies a large red gem, it shimmers against the light of your lantern. Do you take it?
+[Yes] -> gem_pickup
+[No] -> gem_leave

== gem_pickup ==
~ gem = gem + 1
You have picked up the gem! 
+[Go back] -> left_cave

== gem_leave ==
You leave the gem behind.
+[Go back] -> left_cave

== right_cave ==
You are now in the right side of the cave. {lantern == 1 : You see a door at the end of the tunnel.} {lantern == 0 : It's too dark to see.}
+ {lantern == 1} [Attempt to open the door] -> zappe_door
+ [Go back] -> Cave_1

== zappe_door ==
*{zappe_key == 1} [Use Zappe's key] -> zappe_door_open
+[Try and open the door] -> zappe_door_locked

==zappe_door_locked==
It appears to be locked... you wonder where the key could be.
+[Go back] -> right_cave

==zappe_door_open==
~ statue = statue + 1
You found the Golden Shrimp Statue! The ultimate treasure!
*[Eat it and gain it's powers] -> ate
*[Return to the cave] -> right_cave

== ate ==
Oh no! You're allergic to eating statues! You died :(
-> END

== Ocean_1 ==

The darkness surrounds you, {bottle == 1 : luckily you have some directions that may help you.} {bottle == 0 : and you only have your wits to guide you.}
Which direction do you take?
+[Left] -> ocean_correct_1
+{zappe_convo == 1} [Right] -> zappe_eat
+{zappe_convo == 1} [Forward] -> zappe_eat
+{zappe_convo == 0}[Right] -> pre_zappe
+{zappe_convo == 0}[Forward] -> pre_zappe
+[Go back] -> Cross_roads

== ocean_correct_1 ==
Next, where do you go?
+{zappe_convo == 1} [Left] -> zappe_eat
+{zappe_convo == 0} [Left] -> pre_zappe
+[Right] -> ocean_correct_2
+{zappe_convo == 0} [Forward] -> pre_zappe
+{zappe_convo == 1} [Forward] -> zappe_eat


==ocean_correct_2==
Next, where do you go?
+{zappe_convo == 1} [Left] -> zappe_eat
+{zappe_convo == 0} [Left] -> pre_zappe
+{zappe_convo == 0}[Right] -> pre_zappe
+{zappe_convo == 1} [Right] -> zappe_eat
+[Forward] -> ocean_correct_3



==ocean_correct_3==
Next, where do you go?
+{zappe_convo == 0} [Left] -> pre_zappe
+{zappe_convo == 1} [Left] -> zappe_eat
+{zappe_convo == 0}[Right] -> pre_zappe
+{zappe_convo == 1} [Right] -> zappe_eat
+[Forward] -> ocean_correct_4




==ocean_correct_4==
Next, where do you go?
+{squid_convo == 1} [Left] -> correct_squid_path
+{squid_convo == 0} [Left] -> home
+{squid_convo == 2} [Left] -> home
+{squid_convo == 0 and zappe_convo == 0} [Right] -> pre_zappe
+{squid_convo == 1 and zappe_convo == 0} [Right] -> pre_zappe
+{squid_convo == 2 and zappe_convo == 0} [Right] -> pre_zappe
+{squid_convo == 0 and zappe_convo == 1} [Right] -> zappe_eat  
+{squid_convo == 1 and zappe_convo == 1} [Right] -> incorrect_squid_path
+{squid_convo == 2 and zappe_convo == 1} [Right] -> zappe_eat
+{squid_convo == 0 and zappe_convo == 0} [Forward] -> pre_zappe
+{squid_convo == 1 and zappe_convo == 0} [Forward] -> pre_zappe
+{squid_convo == 2 and zappe_convo == 0} [Forward] -> pre_zappe
+{squid_convo == 0 and zappe_convo == 1} [Forward] -> zappe_eat  
+{squid_convo == 1 and zappe_convo == 1} [Forward] -> incorrect_squid_path
+{squid_convo == 2 and zappe_convo == 1} [Forward] -> zappe_eat


== squid_truth_took ==
Well, I'll be sure to check later, let's hope you told the truth. 
*[Go back] -> below_deck

== squid_truth_left ==
Well, I'll be sure to check later, let's hope you told the truth. 
*[Go back] -> below_deck

== squid_lie_took ==
*[Go back] -> below_deck
Well, I'll be sure to check later, let's hope you told the truth. 

==squid_lie_left ==
*[Go back] -> below_deck
Well, I'll be sure to check later, let's hope you told the truth. 

== said_explored ==
I see, so you've most likely been to my cave home nearby, did you find the gem hidden inside? Did you take it?
* {gem == 1} [Tell the truth and say you took it.] -> squid_truth_took
* {gem == 1} [Lie and say you didn't take it.] -> squid_lie_took
* {gem == 0} [Tell the truth and say you didn't take it.] -> squid_truth_left
* {gem == 0} [Lie and say you took it.] -> squid_lie_left

== correct_squid_path ==
~ squid_convo = squid_convo + 1
Hello again, says the giant squid, I told you I'd check to see if my gem remained where I left it.
+ {squid_truth_took} -> squid_truth_took2
+ {squid_truth_left} -> squid_truth_left2
{squid_lie_took} -> squid_eat
{squid_lie_left} -> squid_lie_left2

== squid_truth_took2 ==
Thank you for telling the truth, if you return the gem to me, I won't bother you again.
*[Return the gem] -> home
*[Keep the gem] -> squid_eat


== squid_truth_left2 ==
Thank you for telling the truth and leaving the gem in its place, you are free to continue.
-> home

== squid_lie_left2 ==
 Why would you tell me you took it when you hadn't? I don't appreciate your dishonesty, but I suppose you may continue.
-> home

== squid_eat ==
You have {squid_lie_took:lied to me and} taken my gem, for that there is no excuse....
The squid quickly devours you.
-> END


== incorrect_squid_path ==
~ squid_convo = squid_convo + 1
Hello again, says the giant squid, I told you I'd check to see if my gem remained where I left it. 
+ {squid_truth_took} -> squid_truth_took3
+ {squid_truth_left} -> squid_truth_left3
{squid_lie_took} -> squid_eat
{squid_lie_left} -> squid_lie_left3

== squid_truth_took3 == 
Thank you for telling the truth, if you return the gem to me, I won't bother you again. However, you've fallen off the path, don't let zappe catch you. You're lucky it was me this time. 
*[Return the gem] -> Ocean_1
*[Keep the gem] -> squid_eat

== squid_truth_left3 ==
Thank you for telling the truth and leaving the gem in its place, you are free to continue. However, you've taken the wrong way home, don't let Zappe catch you next time. 
-> Ocean_1

== squid_lie_left3 ==
Why would you tell me you took it when you hadn't? I don't appreciate your dishonesty, but I suppose you may continue. You've taken the wrong path home, don't let Zappe catch you. 
-> Ocean_1


=== zappe_eat ==
You did not heed Zappe's warning, she swallows you instantly, ending your quest home. 
-> END

==home==
You've made it back to the colony! {statue ==1 : with the statue!} Congradulations {player_name}!
-> END

== pre_zappe ==
~ zappe_convo = zappe_convo + 1
It seems you've taken the wrong path, and come face to face with Zappe the massive whale!
+[Speak to the whale] -> zappe_talk1

== zappe_talk1 == 
Hello there little shrimp, it seems you've taken the wrong way home. I'll choose to spare you this one time, return to me again and I won't be so kind. 
*{coins == 3} [Give Zappe your 3 gold coins] -> gave_coins
+[Go back] -> Ocean_1

==gave_coins==
~ zappe_key = zappe_key + 1
I accept this offering, in exchange I shall give you a key, it's up to you to find what it goes to. 
+[Go back] -> Ocean_1




