mob/NPC/Hercule
	icon_state = "Hercule"
	name="{NPC}Hercule"
	density=1
	safe=1
	energy_code=5374986
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
			switch(alert("Hi [usr.name]. How can I help you?","","Use Skill Points","Nothing"))
				if("Use Skill Points")
					if(!usr.skill_points)
						usr << "<font color = white>Hercule:</font> You don't have any SPs!"
						usr.talking = 0
						return
					switch(input("Where do you wish to use ur SPs?","SPs")in list("Block","Counter","Deflect","Dodge","Critical"))
						if("Block")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.block_max < 100)
								usr.block_max += TP
								usr.block += TP
								usr << "<font color = white>Hercule:</font> Block +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.block_max > 100)
									usr.block_max = 100
								if(usr.block > 100)
									usr.block = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return
						if("Counter")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.counter_max < 100)
								usr.counter_max += TP
								usr.counter += TP
								usr << "<font color = white>Hercule:</font> Counter +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.counter_max > 100)
									usr.counter_max = 100
								if(usr.counter > 100)
									usr.counter = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return
						if("Deflect")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.reflect_max < 100)
								usr.reflect_max += TP
								usr.reflect += TP
								usr << "<font color = white>Hercule:</font> Deflect +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.reflect_max > 100)
									usr.reflect_max = 100
								if(usr.reflect > 100)
									usr.reflect = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return
						if("Dodge")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.dodge_max < 100)
								usr.dodge_max += TP
								usr.dodge += TP
								usr << "<font color = white>Hercule:</font> Dogde +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.dodge_max > 100)
									usr.dodge_max = 100
								if(usr.dodge > 100)
									usr.dodge = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return
						if("Critical")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.critical_max < 100)
								usr.critical_max += TP
								usr.critical += TP
								usr << "<font color = white>Hercule:</font> Critical +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.critical_max > 100)
									usr.critical_max = 100
								if(usr.critical > 100)
									usr.critical = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return
				else
					usr.talking = 0
					return
		Set_Spawn_Point()
			set src in oview(1)
			set category=null
			switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
				if("Yes")
					usr.spawn_point = "Hercule"
				else
					return