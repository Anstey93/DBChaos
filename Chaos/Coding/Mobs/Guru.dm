mob/var/guru_quest_start = 0
mob/var/guru_quest_complete = 0
mob/var/thug_kills = 0

mob/NPC
	Guru
		name = "{NPC} Guru"
		icon = 'Guru.dmi'
		density = 1
		safe = 1
		energy_code = 6678554
		New()
			..()
			src.CreateName()
		verb
			Talk()
				set src in oview(1)
				set category = null
				if(usr.karma == "Good")
					if(!usr.guru_quest_start)
						usr << "<font color = white>Guru:</font> Greetings [usr.name]. My time is near, but I have one last request. Will you help me?"
						sleep(15)
						switch(alert("Begin your Training?","Quest: Dying Namek","Yes","Not Yet"))
							if("Yes")
								usr.guru_quest_start = 1
								usr.contents += new/obj/Quests/Guru/Dying_Namek
								usr << "<font color = white>Guru:</font> Thank you. There's a village nearby that is being attacked by Frieza's Thugs. Please, help them."
							else
								return
					else
						if(!usr.guru_quest_complete)
							if(usr.thug_kills >= 3)
								usr << "<font color = white>Guru:</font> All of Namek thanks you, [usr.name]"
								usr << "<font color = white><I>Guru smiles softly at you, as he takes his last breath, then his body lies motionless..."
								usr.powerlevel_max += 20000
								usr.ki_max += 10000
								usr.strength_max += 7000
								usr.defence_max += 7000
								usr.strength += 7000
								usr.defence += 7000
								usr.guru_quest_complete = 1
								for(var/obj/Quests/Guru/Dying_Namek/Q)
									del(Q)
							else
								usr << "<font color = white>Guru:</font> You must stop Frieza's Thugs..."
								return
						else
							usr << "\white <I>You look at the body of the once Leader of the Namekians as it lays there, lifelessly..."
				else
					usr<<"<font color = white>Guru:</font> Please leave..."
					return
			Set_Spawn_Point()
				set src in oview(1)
				set category=null
				switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
					if("Yes")
						usr.spawn_point = "Guru"
					else
						return