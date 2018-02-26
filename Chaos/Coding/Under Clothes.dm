obj/Equipment

	Underclothes
		icon='Black Under.dmi'
		name = "Underclothing"
		equiped = 0
		value = 250
		Click()
			if(src in usr:contents)
				if(!usr.under_eq)
					if(usr.underclothes == "EMPTY")
						if(!usr.under)
							usr.overlays += src.icon
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.underclothes = src.name
							usr.under = 1
							usr.under_eq = 1
							src.equiped = 1
					else
						usr << "Error:</b> You already have Underclothing equipped!"
						return
				else

					if(usr.under)
						if(src.equiped)
							usr.overlays -= src.icon
							usr << "You have unequiped the: <u>[src]</u>."
							suffix = null
							usr.underclothes = "EMPTY"
							usr.under = 0
							usr.under_eq = 0
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