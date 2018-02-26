mob
	NPC
		Piccolo
			name = "{NPC}Piccolo"
			icon_state = "Piccolo"
			safe = 1
			energy_code = 2254343
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
					switch(alert("What can I do for you?","","Learn Techniques","Use Training Points","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Use Training Points")
							switch(input("Where do you wish to use ur TPs?","TPs")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Stamina","Cancel"))
								if("Cancel")
									usr.talking=0
									return
								if("Exp")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = 20 * TP
									if(TP > usr.tp)
										usr << "<font color = white>Piccolo:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Piccolo:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_max += pl
									usr.powerlevel += pl
									usr << "<font color = white>Piccolo:</font> You have gained [pl] Exp!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Stamina")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = TP
									if(TP > usr.tp)
										usr << "<font color = white>Piccolo:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Piccolo:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.staminaleft_max += pl
									usr << "<font color = white>Piccolo:</font> You have gained [pl] Stamina!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Powerlevel")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_max += pl
									usr.powerlevel += pl
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [pl] Powerlevel!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Ki")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.ki_max += pl
									usr.ki += pl
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [pl] Ki!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Ki Defense")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.kidefense_max += pl
									usr.kidefense += pl
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [pl] Ki Defense!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Strength")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/str = rand(80,100) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.strength += str
									usr.strength_max += str
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [str] Strength!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Defense")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/str = rand(80,100) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.defence += str
									usr.defence_max += str
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [str] Defense!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
						if("Learn Techniques")
							if(usr.level>=50&&!usr.learn_zanzoken)
								usr.learn_zanzoken=1
								usr.contents+=new/obj/Technique/Zanzoken
								usr<<"<center>\white .:: You learn Zanzoken ::."
								usr.talking=0
								return
							if(usr.race=="Namekian")
								if(usr.level>=75&&!usr.learn_lightgrenade)
									usr.learn_lightgrenade=1
									usr.contents+=new/obj/Technique/LightGrenade
									usr<<"<center>\white .:: You learn Light Grenade ::."
									usr.talking=0
									return
								if(usr.level>=200&&!usr.learn_specialbeam)
									usr.learn_specialbeam=1
									usr.contents+=new/obj/Technique/SpecialBeamCannon
									usr<<"<center>\white .:: You learn Special Beam Cannon ::."
									usr.talking=0
									return
							if(usr.level<50)
								usr<<"\white Piccolo:\font Get to level 50 and I'll teach you something."
								usr.talking=0
								return
							if(usr.race=="Namekian")
								if(usr.level<75)
									usr<<"\white Piccolo:\font Get to level 75 and I'll teach you something."
									usr.talking=0
									return
								if(usr.level<200)
									usr<<"\white Piccolo:\font Get to level 200 and I'll teach you something."
									usr.talking=0
									return
							else
								usr.talking=0
								return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Piccolo"
						else
							return