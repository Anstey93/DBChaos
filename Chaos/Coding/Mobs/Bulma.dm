mob/var/bulma_quest_start = 0
mob
	NPC
		Bulma
			name = "{NPC}Bulma"
			icon_state = "Bulma"
			density = 1
			safe = 1
			energy_code = 5534561
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category=null
					if(usr.talking)
						return
					usr.talking=1
					if(!usr.bulma_quest_start)
						usr << "<font color = white>Bulma:</font> Greetings [usr.name]. I've got an important job for you if your not busy."
						sleep(15)
						switch(alert("Will you help me out?","Quest","Yes","Can't right now"))
							if("Yes")
								if(usr.inven_min < usr.inven_max)
									usr.bulma_quest_start = 1
									usr.contents += new/obj/Quests/Bulma/Malfunction
									usr.contents += new/obj/Equipment/Spanner
									usr << "<font color = white>Bulma:</font> Good to hear! I'll need you to run this part over to my father, Dr Briefs at Capsule Corp."
									usr.talking=0
									return
								else
									usr << "<font color = white>Bulma:</font> You don't have any room in your Inventory!"
									usr.talking=0
									return
							else
								usr << "<font color = white>Bulma:</font> Oh, that's unfortunant to hear."
								usr.talking=0
								return
					else
						switch(alert("How are you doing [usr]. If you want I can upgrade one of your dragonball radar. It will cost you some zenni though!","","Upgrade Radar","Cancel"))
							if("Cancel")
								usr.talking=0
								return
							else
								var/list/L=list()
								for(var/obj/O in usr.contents)
									if(istype(O,/obj/Equipment/DragonRadar))
										L.Add(O)
								L.Add("Cancel")
								var/obj/A=input("Wich radar do you want to upgrade?")in L
								if(A=="Cancel")
									usr.talking=0
									return
								else
									if(istype(A,/obj/Equipment/DragonRadar))
										var/cost=50000
										var/txt=""
										if(A.radarlvl==1)
											cost=50000
											txt="Do you want to upgrade your Level 1 radar into a Level 2 radar? This will \
											allow your radar to locate Namekian Dragonballs.(Cost: 50,000z)"
										if(A.radarlvl==2)
											cost=300000
											txt="Do you want to upgrade your Level 2 radar into a Level 3 radar? This will \
											allow your radar to locate Black Star Dragonballs.(Cost: 300,000z)"
										if(A.radarlvl==3)
											usr << "<font color = white>Bulma:</font> This radar cannot be upgraded any further."
											usr.talking=0
											return
										switch(alert("[txt]","","Upgrade","Cancel"))
											if("Cancel")
												usr.talking=0
												return
											else
												for(var/obj/dragonradar/hud/H in usr.client.screen)
													del(H)
												usr.dbrad = 0
												if(!A)
													usr.talking=0
													return
												if(A.radarlvl>=3)
													usr.talking=0
													return
												if(usr.zenni>=cost)
													usr.zenni-=cost
													A.radarlvl+=1
													A.name="Dragon Radar {Level: [A.radarlvl]}"
													A.icon_state="DBRadar[A.radarlvl]"
													A.value+=cost*0.5
													usr.talking=0
													usr << "<font color = white>Bulma:</font> There you go! All set up!"
													return
												else
													usr << "<font color = white>Bulma:</font> You don't have enough zenni!"
													usr.talking=0
													return
									else
										usr.talking=0
										return