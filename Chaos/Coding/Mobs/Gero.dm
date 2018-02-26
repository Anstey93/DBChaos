mob
	NPC
		Dr_Gero
			name = "{NPC}Dr. Gero"
			icon_state = "Dr. Gero"
			density = 1
			it_blocked=1
			race = "Android"
			karma = "Evil"
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.race == "Android")
						if(!usr.learn_ssdeadlybomber)
							switch(input("Dr Gero: What do you need [usr]?")in list("Download Skill","Nothing"))
								if("Download Skill")
									if(usr.level >= 300 && usr.chips >= 3)
										usr << "<font color = white>Downloading the new skill into your system..."
										usr.frozen = 1
										usr.sight |= BLIND
										sleep(50)
										usr.frozen = 0
										usr.sight &= ~BLIND
										usr.contents+=new/obj/Technique/SSDeadlyBomber
										sleep(1)
										usr <<"<font color = white>Skill Download successfull."
										usr.frozen = 0
										usr.learn_ssdeadlybomber=1
										return
									else
										usr << "<font color = white>Error:</font> Hardware not compatible..."
										return
								if("Nothing")
									return
					else
						usr << "<font color = white>Dr Gero:</font> Get out of here you filthy creature!"
						return