mob/var/saiyaman_quest_start = 0
mob/var/saiyaman_quest_complete = 0
mob
	NPC
		Saiyaman
			name = "{NPC} Saiyaman"
			icon = 'Saiyaman.dmi'
			icon_state = ""
			density = 1
			safe = 1
			energy_code=2537587
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					if(!usr.saiyaman_quest_start)
						usr << "<font color = white>Saiyaman:</font> Hello citizen [usr.name]! I require your assistance, can you lend it?"
						sleep(15)
						switch(alert("You able to help me out?","Quest: Lost Identity","Yes","Not at the Moment"))
							if("Yes")
								usr.saiyaman_quest_start = 1
								usr.contents += new/obj/Quests/Saiyaman/Lost_Identity
								usr << "<font color = white>Saiyaman:</font> Awesome! As you see, i've lost my helmet. I think <font colour = red>Goten</font> was running around somewhere with it"
								usr << "<font color = white>Saiyaman:</font> If you could grab it off him, that would be great!"
							else
								usr << "<font color = white>Saiyaman:</font> Ohh, ok. I will have to find another person then."
								return
					else
						if(!usr.saiyaman_quest_complete)
							if(usr.obtained_helmet)
								usr << "<font color = white>Saiyaman:</font> Thanks for that [usr.name]! Now I can get back to fighting crime!"
								usr.saiyaman_quest_complete = 1
								usr.contents += new/obj/Equipment/Head/Helmet
								src.icon_state = "helmet"
								spawn(150) src.icon_state = ""