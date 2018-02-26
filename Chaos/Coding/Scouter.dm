obj/Equipment
	Scouter
		icon='BkScouter.dmi'
		name = "Scouter"
		density = 0
		equiped = 0
		value = 5500
		condition = 500
		condition_max = 500
		Click()
			if(src in usr:contents)
				if(!usr.scouter_eq)
					if(usr.head == "EMPTY")
						if(!usr.scouter)
							usr.overlays += src.icon
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.head = src.name
							usr.scouter = 1
							usr.scouter_eq = 1
							src.equiped = 1
					else
						usr << "Error: You already have somethign equipped on your Head!"
						return
				else
					if(usr.scouter)
						if(src.equiped)
							usr.overlays -= src.icon
							usr << "You have unequiped the: <u>[src]</u>."
							suffix = null
							usr.head = "EMPTY"
							usr.scouter = 0
							usr.scouter_eq = 0
							src.equiped = 0
						else
							usr << "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
							return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."
			Scouter_Channel()
				set category = null
				if(src.equiped)
					var/scouter_chan = input("What channel do you want to tune you scouter to?","Scouter Channel") as num
					if(!scouter_chan)
						return
					if(scouter_chan < 0)
						scouter_chan = 0
					usr.scouter_channel = scouter_chan
					return
				else
					usr << "You must have the: <u>[src.name]</u> equiped before proceeding."
			Scouter(T as text)
				set category = null
				if(src.equiped)
					if(channelmute!="")
						usr<<"All chat channels have been muted."
						return
					if(usr.muted&&usr.GMLevel<=0)
						usr << "You have been muted!"
						return
					if(World_Mute&&!usr.GMLevel)
						usr << "The World is Muted!"
						return
					if(usr.oocmute)
						usr << "You have been muted!"
						return
					if(usr.say_delay >= 3)
						world << "<font color = #00B211>Dragon AI:</font> \white [usr.name] has been Automatically Muted for 30 Second for Spaming."
						usr.say_delay = 0
						usr.oocmute = 1
						spawn(300)usr.oocmute = 0
						return
					if(usr.Check_For_Profanity(T,PROFANITY) == TRUE)
						world << "<font color = #00B211>Dragon AI:</font> \white [usr.name] has been Automatically Muted for 30 Second for using Profanity."
						usr.oocmute = 1
						spawn(300)usr.oocmute = 0
						return
					if(!T)
						return
					T = html_encode(T)
					if(lentext(T) > 150)
						alert("Your message can not exceed 150 characters.")
						return
					usr.say_delay += 1
					sleep(10)
					usr.say_delay -= 1
					for(var/mob/PC/M in world)
						if(M.scouter_eq)
							if(M.scouter_channel==usr.scouter_channel)
								M << "<font color=#000066>{<font color=lime><font face = Tahoma>Scouter([usr.scouter_channel])<font color=#000066>} \white [usr]: \green [T]"
				else
					usr << "You must have your Scouter equiped."
					return
			Scan(mob/M in oview(8))
				set category = null
				if(!M)return
				if(src.equiped)
					usr << "---------------------"
					usr << "<font size = 4>[M]</size>"
					usr << "<font size = 2>Key: [M.key]</size>"
					usr << "Level: [M.level]"
					usr << "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]"
					usr << "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]"
					usr << "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]"
					usr << "Defence: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]"
					usr << ""
					usr << "Energy Code: [num2text(M.energy_code,1000000)]"
					usr << "---------------------"
				else
					usr << "You must have: <u>[src.name]</u> equiped."
					return