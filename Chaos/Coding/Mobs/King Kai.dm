mob/var/kk_quest_start = 0
mob/var/kk_quest_complete = 0
mob/var/kk_quest_training = 0
mob/var/spawn_point = "Yamcha"

mob/NPC
	King_Kai
		name = "{NPC}King Kai"
		icon_state = "King Kai"
		density = 1
		safe = 1
		energy_code = 2215368
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.talking)
				return
			usr.talking=1
			if(src in view(2,usr))
				if(usr.race=="Kai")
					var/talk = input("What do you need [usr.name]?")in list("I want to be revived","I want to go to Supreme Kais","More Training","Never Mind")
					switch(talk)
						if("Never Mind")
							usr.talking=0
							return
						if("I want to be revived")
							usr.talking=0
							usr << "<font color = white>King Kai:</white> I see you are ready to go, let me revive you."
							usr.powerlevel = usr.powerlevel_max
							usr.overlays -= 'Halo.dmi'
							usr.overlays -= 'Halo.dmi'
							usr.overlays -= 'Halo.dmi'
							switch(usr.spawn_point)
								if("Babidi")
									usr.loc = locate(376,245,1)
								if("Yamcha")
									usr.loc = locate(129,164,1)
								if("Frieza")
									usr.loc = locate(247,32,2)
								if("Goku")
									usr.loc = locate(125,50,1)
								if("Guru")
									usr.loc = locate(57,167,2)
								if("Hercule")
									usr.loc = locate(50,165,1)
								if("Roshi")
									usr.loc = locate(179,25,1)
								if("Piccolo")
									usr.loc = locate(304,182,2)
								if("Tien")
									usr.loc = locate(206,244,1)
								if("Vegeta")
									usr.loc = locate(215,144,1)
								if("Yardrat")
									usr.loc = locate(95,105,4)
							usr.safe = 1
							usr.dead = 0
							spawn(300)
								if(!usr)return
								usr.safe = 0
						if("I want to go to Supreme Kais")
							usr.talking=0
							usr << "<font color = white>King Kai:</white> Very well."
							usr.loc = locate(345,325,7)
							return
						if("More Training")
							if(usr.karma == "Good" && usr.karma_rating >= 30)
								usr.talking=0
								usr << "<font color = white>King Kai:</white> Very well, I shall teach you my most powerful technique."
								usr.contents += new/obj/Technique/SpiritBomb
								return
							else
								usr.talking=0
								usr << "<font color = white>King Kai:</white> You must be Pure of Heart so I can teach you."
								return
				else
					if(!usr.kk_quest_start)
						usr << "<font color = white>King Kai:</font> Greetings [usr.name]. I see your quiet a strong warrior. Would you like me to aid your training?"
						sleep(15)
						if(!usr)return
						switch(alert("Begin your Training?","Quest: Warrior's Worth","Yes","Not Yet"))
							if("Yes")
								usr.talking=0
								usr.kk_quest_start = 1
								usr.contents += new/obj/Quests/King_Kai/A_Warriors_Worth
								usr << "<font color = white>King Kai:</font> Good to Hear! I'll teach you a skill called the <font color = red>Kaio Ken</red>, but only if you can prove yourself!"
								usr << "<font color = white>King Kai:</font> If you can catch Bubbles and hit Gregory, then I will consider you worth enough."
							else
								usr.talking=0
								usr << "<font color = white>King Kai:</font> Oh, that's unfortunant to hear."
								return
					else
						if(!usr.kk_quest_complete)
							if(usr.gregory_hit && usr.bubbles_caught)
								usr.talking=0
								usr << "<font color = white>King Kai:</font> Great work! You truely are worthy of such a powerful Technique."
								usr.kk_quest_complete = 1
								usr.contents += new/obj/Technique/Kaioken
								for(var/obj/Quests/King_Kai/A_Warriors_Worth/Q)
									del(Q)
							else
								usr.talking=0
								usr << "<font color = white>King Kai:</font> You still aren't ready, keep Training!"
								return
						else
							var/talk = input("What do you need [usr.name]?")in list("I want to be revived","I want to go to Supreme Kais","More Training","Never Mind")
							switch(talk)
								if("Never Mind")
									usr.talking=0
									return
								if("I want to be revived")
									usr.talking=0
									usr << "<font color = white>King Kai:</white> I see you are ready to go, let me revive you."
									usr.powerlevel = usr.powerlevel_max
									usr.overlays -= 'Halo.dmi'
									usr.overlays -= 'Halo.dmi'
									usr.overlays -= 'Halo.dmi'
									switch(usr.spawn_point)
										if("Babidi")
											usr.loc = locate(376,245,1)
										if("Yamcha")
											usr.loc = locate(129,164,1)
										if("Frieza")
											usr.loc = locate(247,32,2)
										if("Goku")
											usr.loc = locate(125,50,1)
										if("Guru")
											usr.loc = locate(57,167,2)
										if("Hercule")
											usr.loc = locate(50,165,1)
										if("Roshi")
											usr.loc = locate(179,25,1)
										if("Piccolo")
											usr.loc = locate(304,182,2)
										if("Tien")
											usr.loc = locate(206,244,1)
										if("Vegeta")
											usr.loc = locate(215,144,1)
										if("Yardrat")
											usr.loc = locate(95,105,4)
									usr.safe = 1
									usr.dead = 0
									spawn(300)
										if(!usr)return
										usr.safe = 0
								if("I want to go to Supreme Kais")
									usr.talking=0
									usr << "<font color = white>King Kai:</white> Very well."
									usr.loc = locate(345,325,7)
									return
								if("More Training")
									if(usr.karma == "Good" && usr.karma_rating >= 30)
										usr.talking=0
										usr << "<font color = white>King Kai:</white> Very well, I shall teach you my most powerful technique."
										usr.contents += new/obj/Technique/SpiritBomb
										return
									else
										usr.talking=0
										usr << "<font color = white>King Kai:</white> You must be Pure of Heart so I can teach you."
										return
			else
				usr.talking=0
				return