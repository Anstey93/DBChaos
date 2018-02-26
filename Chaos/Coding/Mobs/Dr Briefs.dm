/*var
	brief_quest1="A few days ago, an android broke into my laboratory and stole a very valuable device. \
				Some people say they saw it fly north west, into the northern islands. I need you to locate \
				the android and retrieve the stolen device. If you get it back, I'll let you use my \
				spaceship whenever you want. Good luck!"
mob
	var
		can_use_ship=0
		briefs_quest=0
mob
	NPC
		icon='NPCs.dmi'
		Dr_Briefs
			name = "{NPC}Dr. Briefs"
			icon_state="Dr. Briefs"
			density = 1
			safe = 1
			energy_code = 1242351
			New()
				..()
				spawn(1)
					src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category=null
					usr << "<font color = white>Dr. Briefs:</font> Hello there."
					return
		/*			if(usr.talking)
						return
					if(!usr.briefs_quest)
						usr.talking = 1
						switch(alert("Hi there [usr]. I'm in some sort of trouble and perhaps you might be able to help me out. \
							Will you lend me a hand?","","Yes","No"))
							if("No")
								usr.talking=0
								return
							else
								alert("A few days ago, an android broke into my laboratory and stole a very valuable device. \
									Some people say they saw it fly north west, into the northern islands. I need you to locate \
									the android and retrieve the stolen device. If you get it back, I'll let you use my \
									spaceship whenever you want. Good luck!")
								usr.briefs_quest=1
								usr.talking=0
								return
					else
						if(usr.briefs_quest<2)
							for(var/obj/O in usr.contents)
								if(istype(O,/obj/KeyItem/BriefsDevice))
									usr.talking = 1
									alert("Thank you so much for getting this back to me. If the androids had managed to \
										install this into their hardware, we would be in serious trouble. You may now use my \
										spaceship to travel to other planets. And take this for your trouble.")
									for(var/obj/KeyItem/BriefsDevice/X in usr.contents)
										del(X)
									usr.talking=0
									usr.briefs_quest=2*/



obj
	KeyItem
		icon='Key Items.dmi'
		BriefsDevice
			icon_state="device"
			name="Dr. Briefs's Device"*/

mob/var/bulma_quest_complete = 0

mob
	NPC
		icon='NPCs.dmi'
		Dr_Briefs
			name = "{NPC}Dr. Briefs"
			icon_state = "Dr. Briefs"
			density = 1
			safe = 1
			energy_code = 1242351
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category=null
					if(usr.talking)
						return
					usr.talking = 1
					if(usr.bulma_quest_start && !usr.bulma_quest_complete)
						usr << "<font color = white>Dr Briefs:</font> Greetings [usr.name]. I see you've brought the part I requested from Bulma!"
						sleep(15)
						if(usr.inven_min < usr.inven_max)
							for(var/obj/Quests/Bulma/Malfunction/Q)
								del(Q)
							for(var/obj/Equipment/Spanner/O)
								del(O)
							usr << "<font color = white>Dr Briefs:</font> Thanks for your help [usr.name]! Here's a little something for your trouble."
							usr.bulma_quest_complete = 1
							usr.contents += new/obj/Equipment/Capsule
							usr.talking = 0
							return
						else
							usr << "<font color = white>Dr Briefs:</font> Your Inventory is Full!"
							usr.talking = 0
							return
					else
						usr.talking = 0
						return
			/*		else
						switch(alert("What can I do for you today [usr]?","","Buy","Cancel"))
							if("Cancel")
								usr.talking=0
								return
							else
								switch(input("What do you wish to buy?")in list("Pod Capsule","Cancel"))
									if("Cancel")
										usr.talking=0
										return
									if("Pod Capsule")
										var/obj/Equipment/PodCapsule/O = new
										if(usr.zenni >= O.value)
											usr.zenni -= O.value
											usr.contents += O
											O.value*=0.5
											O.weight=0
											usr.talking=0
											O.name = "Pod Capsule"
											usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
											return
										else
											usr << "<font color = white>Shop Keeper:</font> You need [O.value] zenni!"
											usr.talking=0
											return*/