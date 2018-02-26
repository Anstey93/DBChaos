obj/Equipment

	Clothes
		name = "Clothing"
		density = 0

		equiped = 0
		value = 250

		var
			CLOTHES

		Click()
			if(src in usr:contents)
				if(!usr.clothes_eq)
					if(usr.clothes == "EMPTY")
						usr.overlays += src.icon
						usr << "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						usr.clothes = 1
						usr.clothes_eq = 1
						src.equiped = 1
						usr.clothes = src.name

					else
						usr << "Error: You already have clothes equipped!"
						return




				else
					if(usr.clothes)
						if(src.equiped)
							usr.overlays -= src.icon
							usr << "You have unequiped the: <u>[src]</u>."
							suffix = null
							usr.clothes = 0
							usr.clothes_eq = 0
							src.equiped = 0
							usr.clothes = "EMPTY"
						else
							usr << "Error: </b>You may only have one clothes equiped."
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