mob/var/z_sword_quest = 0
mob/var/legendarysword = 0
obj/quests
	Z_Sword_Quest
		name = "The Legendary Z-Sword"
		density = 1
		icon = 'Z-sword.dmi'
		icon_state = "pull out"
		verb
			Pull_Out()
				set category = "Actions"
				set src in oview(1)
				if(usr.race == "Human" || usr.race == "Saiyan" || usr.race == "Half Saiyan" || usr.race == "Android")
					if(!usr.z_sword_quest)
						if(usr.karma == "Good")
							if(usr.powerlevel_max >= 1000000)
								if(usr.inven_min<usr.inven_max)
									world << "[usr] has managed to pull out <u>The Legendary Z-Sword</u>!"
									usr.contents += new/obj/Equipment/Z_Sword
									usr.z_sword_quest = 1
									return
								else
									usr<<"You have no space in your inventory."
									return
							else
								usr << "You need 1.000.000 powerlevel."
								return
						else
							usr << "Only those with a Pure Heart may take the Z-Sword."
							return
					else
						usr << "<font color = white>[usr]:</font> Wait, I already have one."
						return