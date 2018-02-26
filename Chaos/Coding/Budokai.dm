var
	list
		TourneyPeople = list()
	tourney_limit=15
	tourney_count=0
	tourney_on=1
	tourney_register=0
	tourney_type=""
	budofighter1=0
	budofighter2=0
	prize=0
mob
	var
		tmp
			ceye
		in_tourney=0
	PC/verb
		Watch_Budokai()
			set category = "Channels"
			if(!usr.tourny_watch)
				usr.ceye=client.eye
				usr.client.perspective=EYE_PERSPECTIVE
				client.eye=locate(86,57,7)
				usr.tourny_watch=1
				return
			else
				client.eye=usr.ceye
				usr.client.perspective=EDGE_PERSPECTIVE
				usr.tourny_watch=0
				return
	Tourney
		verb
			Budokai_Registration()
				set category = "Budokai"
				if(usr.dead)
					usr<<"You are dead"
					return
				if(usr.in_war)
					usr<<"You are in a War"
					return
				if(tourney_count>=tourney_limit)
					usr<<"There are no more open spots"
					return
				else
					if(!usr.in_tourney)
						switch(alert("Do you want to Join the Budokai?","Budokai Registration","Yes","No"))
							if("No")
								return
							else
								if(!tourney_register)
									usr<<"Registration isn't open at the time."
									return
								if(usr.in_tourney)
									return
								if(usr.dead)
									usr<<"You are dead."
									return
								if(usr.in_war)
									usr<<"You are in War."
									return
								if(tourney_count>=tourney_limit)
									usr<<"There are no more open spots."
									return
								if(!usr.pk)
									usr<<"You are not a Combatant!"
									return
								tourney_count+=1
								usr.in_tourney=1
								usr.it_blocked=1
								usr.it_lock=1
								TourneyPeople.Add(usr)
								usr.loc=locate(rand(76,96),rand(69,74),7)
								world << "<font color=red>Budokai:\white [usr] has \green <u>Registered</u> \white for the Budokai!"
								return
					else
						switch(alert("Do you want to Resign from the Budokai?","Budokai Registration","Yes","No"))
							if("No")
								return
							else
								if(!tourney_register)
									usr<<"Registration isn't open at the time."
									return
								if(!usr.in_tourney)
									return
								if(usr.dead)
									usr<<"You are dead."
									return
								if(usr.in_war)
									usr<<"You are in War."
									return
								tourney_count-=1
								usr.in_tourney=0
								usr.it_blocked=0
								usr.it_lock=0
								TourneyPeople.Remove(usr)
								usr.loc=locate(215,115,1)
								world << "<font color=red>Budokai:\white [usr] has \red <u>Resigned</u> \white from the Budokai!"
								return

	TourneyMaster
		verb
			Budokai_Handle()
				set category = "Budokai"
				switch(input("What do you want to do?","Budokai")in list("Start Registration","End Registration","Start Next Match","Budokai Boot","Cancel Budokai","Budokai Announce","Give Prize","Cancel"))
					if("Cancel")
						return
					if("Give Prize")
						if(!prize)
							src<<"No prize was set!"
							return
						var/mob/A = input("Give prize:")as null | anything in TourneyPeople
						A.zenni+=prize
					if("Budokai Announce")
						var/t=input("What do you wish to annouce?")as null | text
						if(!t||t=="")
							return
						else
							for(var/mob/M in world)
								if(M.in_tourney)
									M<<"<font color=#CC0000><center>Budokai:<br><br>[t]<br>"
							src<<"<font color=#CC0000><center>Budokai:<br><br>[t]<br>"
					if("Budokai Boot")
						var/mob/A = input("Budokai Boot who?")as null | anything in TourneyPeople
						switch(alert("Boot [A]?","","Yes","No"))
							if("Yes")
								var/reason=input("Type in the reason if wanted.")as null | text
								if(reason)
									world << "<FONT color = red>Budokai:<FONT color = White> [usr] \red Booted [A]([reason])"
								else
									world << "<FONT color = red>Budokai:<FONT color = White> [usr] \red Booted [A]"
								if(!A)
									return
								A.in_tourney=0
								TourneyPeople.Remove(A)
								A.loc=locate(215,115,1)
								tourney_count-=1
								return
					if("Cancel Budokai")
						for(var/mob/M in world)
							M.verbs -= new/mob/Tourney/verb/Budokai_Registration
							if(M.in_tourney)
								M.it_blocked=0
								M.it_lock=0
								M.loc=locate(rand(10,350),rand(10,350),1)
								M.in_tourney=0
						tourney_register=0
						tourney_count=0
						budofighter1=0
						budofighter2=0
						tourney_on=0
						prize=0
						TourneyPeople=new/list()
						world << "<font color=red>Budokai: \white [usr] Canceled the Budokai!"
						return
					if("End Registration")
						tourney_register=0
						for(var/mob/M in world)
							M.verbs-=new/mob/Tourney/verb/Budokai_Registration
						world << "<font color=red>Budokai: \white Registrations for the Budokai are closed!"
						return
					if("Start Registration")
						var/limit=input("Set the Budokai player limit.")as num
						if(!limit)
							return
						else
							tourney_limit=limit
						prize=input("Set the Zenni prize.")as num
						if(prize<0)
							prize=0
						if(prize>10000000)
							prize=10000000
						tourney_register=1
						tourney_on=1
						TourneyPeople=new/list()
						for(var/mob/PC/M in world)
							M.in_tourney=0
							M.verbs+=new/mob/Tourney/verb/Budokai_Registration
						world << "<font color=red>Budokai: \white Registrations for the Budokai are open! (Prize: [prize] Zenni)"
						return
					if("Start Next Match")
						var/mob/A = input("Select opponent #1")as null | anything in TourneyPeople
						switch(alert("Opponent #1: [A]","Budokai","Yes","No"))
							if("Yes")
								var/mob/B = input("Select opponent #2")as null | anything in TourneyPeople
								switch(alert("Opponent #2: [B]","Budokai","Yes","No"))
									if("Yes")
										if(!A||!B)
											usr<<"One of them logged out."
											return
										A.loc=locate(82,57,7)
										B.loc=locate(90,57,7)
										budofighter1=A
										budofighter2=B
										return
									else
										return
							else
								return

mob
	proc
		Budokai_Check()
			if(tourney_on&&tourney_register)
				src.verbs += new/mob/Tourney/verb/Budokai_Registration
				return
			else
				src.verbs -= new/mob/Tourney/verb/Budokai_Registration
				return
proc
	BudokaiResign(mob/N)
		if(!N.in_tourney)return
		for(var/mob/PC/M in world)
			if(M==N)continue
			if(M==budofighter1||M==budofighter2)
				M.loc=locate(rand(76,96),rand(69,74),7)
		budofighter1=0
		budofighter2=0
		N.in_tourney=0
		return
turf
	Floors
		BudokaiOutside
			density=1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				if(M==budofighter1||M==budofighter2)
					BudokaiResign(M)
					TourneyPeople.Remove(M)
					tourney_count--
					M.loc = locate(rand(27,54),rand(316,324),7)
					return
				else
					M.loc=locate(rand(76,96),rand(69,74),7)