mob/var/frieza_quest_start = 0
mob/var/frieza_quest_complete = 0
mob/var/namek_kills = 0

mob/NPC
	Frieza
		name = "{NPC}Frieza"
		icon_state = "Frieza(armor)"
		density = 1
		safe = 1
		energy_code = 9980776
		New()
			..()
			src.CreateName()
		verb
			Talk()
				set src in oview(1)
				set category = null
				if(usr.talking)
					return
				usr.talking=1
				if(usr.karma == "Evil")
					if(!usr.frieza_quest_start)
						switch(alert("I have a small task for you. Are you interested?","Quest: Wraith of Frieza","Yes","Not"))
							if("Yes")
								usr.talking=0
								usr.frieza_quest_start = 1
								usr.contents += new/obj/Quests/Frieza/Wraith_of_Frieza
								usr << "<font color = white>Frieza:</font> There's been pesky Namekian's harrasing my troops. Take care of them and i'll see to your reward."
							else
								usr.talking=0
								return
					else
						if(!usr.frieza_quest_complete)
							if(usr.namek_kills >= 3)
								usr.talking=0
								usr << "<font color = white>Frieza:</font> Perfect, now Namek will be mine! Hahahaha!"
								usr.powerlevel_max += 20000
								usr.ki_max += 15000
								usr.strength_max += 8000
								usr.zenni += 6000
								if(usr.race == "Changeling"&&!usr.learn_deathbeam)
									usr.learn_deathbeam=1
									usr.contents+=new/obj/Technique/DeathBeam
									usr<<"<center>\white .:: You learn Death Beam ::."
								usr.frieza_quest_complete = 1
								for(var/obj/Quests/Frieza/Wraith_of_Frieza/Q)
									del(Q)
							else
								usr.talking=0
								usr << "<font color = white>Frieza:</font> Don't come back until you have fixed the problem!"
								return
						else
							usr.talking=0
							usr << "<font color = white>Frieza:</font> I have nothing else for you right now so get lost!"
							return
				else
					usr << "<font color = white>Frieza:</font> Get out of here!"
					usr.talking=0
					return
			Set_Spawn_Point()
				set src in oview(1)
				set category=null
				switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
					if("Yes")
						usr.spawn_point = "Frieza"
					else
						return