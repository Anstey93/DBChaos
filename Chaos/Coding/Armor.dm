mob/var/armorblock=0
obj/Equipment/Armor
	Armor1
		name = "Hench Armor"
		icon = 'Hench Armor.dmi'
		density = 0
		equiped = 0
		value = 2000000
		condition = 200000000
		Click()
			if(src in usr:contents)
				if(!src.equiped)
					if(!usr.armor)
						usr.overlays += icon
						usr << "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						usr.armor = 1
						usr.armor_eq = 1
						src.equiped = 1
						usr.armorblock+=4
					else
						usr << "You may only have one armor equiped."

				else
					if(src.equiped)
						usr.overlays -= icon
						usr.armorblock-=4
						usr << "You have unequiped the <u>[src]</u>."
						suffix = null
						usr.armor = 0
						usr.armor_eq = 0
						src.equiped = 0

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the <u>[src]</u>."
					usr.inven_min += 1

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."
	Armor2
		name = "Saiyan Armor"
		icon = 'Saiyan Armor.dmi'
		equiped = 0
		value = 5000000
		condition = 600000000
		Click()
			if(src in usr:contents)
				if(!src.equiped)
					if(!usr.armor)
						usr.overlays += src.icon
						usr << "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						usr.armor = 1
						usr.armor_eq = 1
						src.equiped = 1
						usr.armorblock+=6
					else
						usr << "You may only have one armor equiped."
				else
					if(src.equiped)
						usr.overlays -= src.icon
						usr << "You have unequiped the <u>[src]</u>."
						suffix = null
						usr.armor = 0
						usr.armor_eq = 0
						src.equiped = 0
						usr.armorblock-=6
					else
						usr << "Error: </b>You may only have one armor equiped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the <u>[src]</u>."
					usr.inven_min += 1

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."
