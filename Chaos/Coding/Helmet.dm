obj/Equipment/Head

	Helmet
		name = "Helmet"
		icon = 'Player Helmet.dmi'
		density = 0

		equiped = 0
		value = 500

		var
			helmet_icon = 'Player Helmet.dmi'

		Click()
			if(src in usr:contents)
				if(usr.race != "Changeling" || usr.race != "Majin" || usr.race != "Tuffle")
					if(!usr.helmet_eq)
						if(usr.head == "EMPTY")
							if(!usr.helmet)
								usr.overlays += helmet_icon
								usr << "You have equiped the: <u>[src]</u>."
								suffix = "(Worn)"
								usr.head = src.name
								usr.helmet = 1
								usr.helmet_eq = 1
								src.equiped = 1
						else
							usr << "Error: You already have somethign equipped on your Head!"
							return
					else
						if(usr.helmet)
							if(src.equiped)
								usr.overlays -= helmet_icon
								usr << "You have unequiped the: <u>[src]</u>."
								suffix = null
								usr.head = "EMPTY"
								usr.helmet = 0
								usr.helmet_eq = 0
								src.equiped = 0
							else
								usr << "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
								return
				else
					usr << "[usr.race]'s cannot wear Helmets!"
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
