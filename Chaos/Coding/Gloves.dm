obj/Equipment

	Gloves
		icon='Custom Gloves.dmi'
		name = "Gloves"
		density = 0
		equiped = 0
		value = 250
		Click()
			if(src in usr:contents)
				if(!usr.gloves_eq)
					if(usr.hands == "EMPTY")
						if(!usr.gloves)
							usr.overlays += src.icon
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.hands = src.name
							usr.gloves = 1
							usr.gloves_eq = 1
							src.equiped = 1
					else
						usr << "Error:</b> You already have Gloves equipped!"
						return
				else
					if(usr.gloves)
						if(src.equiped)
							usr.overlays -= src.icon
							usr << "You have unequiped the: <u>[src]</u>."
							suffix = null
							usr.hands = "EMPTY"
							usr.gloves = 0
							usr.gloves_eq = 0
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
					usr.inven_min -= 1
					usr << "You have dropped the: <u>[src]</u>."
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."