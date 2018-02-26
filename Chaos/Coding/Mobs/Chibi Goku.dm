mob/var/warrior_quest_start = 0
mob/var/warrior_quest_complete = 0
mob/var/strength_test_start = 0
mob/var/strength_test_complete = 0
mob/var/green_kills = 0

mob/NPC/Chibi_Goku
	icon = 'Chibi Goku.dmi'
	name = "{NPC}Yamcha"
	density = 1
	safe = 1
	energy_code = 1256433
	New()
		..()
		src.CreateName()
	verb
		Talk()
			set category = null
			set src in oview(8)
			if(usr.talking)
				return
			if(usr.fused)
				return
			usr.talking = 1
			if(!usr.warrior_quest_start)
				usr << "<font color = white>Yamcha:</font> Hi [usr.name]. I see you've decided to start down the path of Martial Arts?"
				sleep(15)
				if(!usr)return
				switch(alert("Begin your Training?","Quest: Warrior's Path","Yes","Not Yet"))
					if("Yes")
						usr.warrior_quest_start = 1
						usr.talking = 0
						usr.contents += new/obj/Quests/Yamcha/A_Warriors_Path
						usr << "<font color = white>Yamcha:</font> Great! Get to Training!"
					else
						usr << "<font color = white>Yamcha:</font> Oh, ok."
						usr.talking = 0
						return
			else
				if(!usr.warrior_quest_complete)
					if(usr.level >= 5)
						usr << "<font color = white>Yamcha:</font> Great, your learning fast!"
						usr.warrior_quest_complete = 1
						usr.exp+=100
						usr.talking = 0
						for(var/obj/Quests/Yamcha/A_Warriors_Path/Q)
							del(Q)
					else
						usr << "<font color = white>Yamcha:</font> You still aren't ready, keep Training!"
						usr.talking = 0
						return
				else
					switch(alert("Hi [usr.name]. What can I do for you today?","Yamcha","Do you have a Task?","Use Training Points","Nothing"))
						if("Do you have a Task?")
							if(!usr.strength_test_start)
								usr << "<font color = white>Yamcha:</font> Hi again [usr.name]. I have another Task for you if your are Interested?"
								sleep(15)
								if(!usr)return
								switch(alert("Begin your Training?","Quest: A Test of Strength","Yes","Not Yet"))
									if("Yes")
										usr.strength_test_start = 1
										usr.green_kills=0
										usr.contents += new/obj/Quests/Yamcha/A_Test_of_Strength
										usr.talking = 0
										usr << "<font color = white>Yamcha:</font> Good to Hear! What I want you to do is <font color = red>Kill 5 Saibamen</font>"
										return
									else
										usr << "<font color = white>Yamcha:</font> Oh, ok."
										usr.talking = 0
										return
							else
								if(usr.green_kills >= 5)
									usr << "<font color = white>Yamcha:</font> Great work, your proving to be a Strong Warrior!"
									usr.green_kills = 0
									usr.exp += 400
									usr << "\white EXP +400"
									usr.strength_test_start = 0
									for(var/obj/Quests/Yamcha/A_Test_of_Strength/Q)
										del(Q)
									if(usr.race=="Human"&&usr.level>=500)
										if(!usr.learn_spiritball)
											usr.learn_spiritball=1
											usr.contents+=new/obj/Technique/SpiritBall
											usr<<"\white <center>.:: You learn Spirit Ball ::."
									usr.talking = 0
									return
								else
									usr << "<font color = white>Yamcha:</font> Go kill 5 saibamen!"
									usr.talking = 0
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
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_max += pl
									usr.powerlevel += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Exp!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Stamina")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.staminaleft_max += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Stamina!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Powerlevel")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_max += pl
									usr.powerlevel += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Powerlevel!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Ki")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.ki_max += pl
									usr.ki += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Ki!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Ki Defense")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.kidefense_max += pl
									usr.kidefense += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Ki Defense!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Strength")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/str = rand(80,100) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.strength += str
									usr.strength_max += str
									usr << "<font color = white>Yamcha:</font> You have gained [str] Strength!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
								if("Defense")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/str = rand(80,100) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.defence += str
									usr.defence_max += str
									usr << "<font color = white>Yamcha:</font> You have gained [str] Defense!"
									usr.tp -= TP
									usr.usedtp += TP
									usr.talking = 0
									return
						if("Nothing")
							usr.talking = 0
							return
		Set_Spawn_Point()
			set src in oview(1)
			set category=null
			switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
				if("Yes")
					usr.spawn_point = "Yamcha"
				else
					return