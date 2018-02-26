obj/Equipment/Consumable/PodCapsule
	name =  "Pod Capsule"
	icon = 'Capsule.dmi'
	icon_state = "2"
	Click()
		if(usr.z!=1&&usr.z!=2&&usr.z!=3&&usr.z!=4)
			usr<<"You cannot use this here."
			return
		else
			new/obj/Spaceship/SpacePod(usr.loc)
obj/Equipment/Consumable/Candy
	name =  ""
	icon = 'Candy.dmi'
	icon_state = ""
	var/candy_pl

	Click()
		if(src in usr:contents)
			if(usr.race == "Majin" || usr.race == "Half Majin")
				usr << "<font color = red>You put [src.name] in your mouth and crunch it down."
				usr.eats += 1
				if(src.candy_pl>50000)
					src.candy_pl=50000
				usr.powerlevel_max+=src.candy_pl
				del(src)
			else
				del(src)
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."
				usr.inven_min += 1
			else
				usr << "You are unable to pick up [src.name]."

obj/Equipment/Guild_Item
	var/eq = 0
	name =  ""
	icon
	icon_state = ""
	Click()
		if(src in usr:contents)
			if(!src.eq && src.guild == usr.guild_name)
				if(usr.gitems <= 2)
					usr << "You wear the [src.name]."
					suffix = "(Worn)"
					usr.overlays += icon
					usr.gitems+=1
					src.eq = 1
				else
					usr << "You can only have 3 guild items equipped."
					return
			else
				usr << "You remove the [src.name]."
				suffix = null
				usr.overlays -= icon
				src.eq = 0
				usr.gitems -= 1
				if(usr.gitems < 0)
					usr.gitems = 0
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(src.guild == usr.guild_name)
				if(Move(usr))
					usr << "You have picked up [src.name]."
					usr.inven_min += 1


				else
					usr << "You are unable to pick up [src.name]."


			else
				usr << "You are not in the guild: [src.guild]."
				return



		Drop()
			set category = null
			if(!src.eq)
				usr.inven_min -= 1
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."

			else
				usr << "Cannot drop it while it is equiped."
				return



		Destroy()
			set category = null
			if(src in usr:contents)
				if(!src.eq)
					usr.inven_min -= 1
					del(src)

				else
					usr << "Cannot do that while it is equiped."
					return

			else
				return

mob/var/gitems = 0
obj/Equipment/Guild_Item2
	var/eq = 0
	name =  ""
	icon
	icon_state = ""
	Click()
		if(src in usr:contents)
			if(!src.eq && src.guild == usr.guild_name)
				if(usr.gitems <= 2)
					usr << "You wear the [src.name]."
					suffix = "(Worn)"
					usr.underlays += icon
					src.eq = 1
					usr.gitems += 1
				else
					usr << "You can only have 3 guild items equipped."
					return

			else
				usr << "You remove the [src.name]."
				suffix = null
				usr.underlays -= icon
				src.eq = 0
				usr.gitems -= 1
				if(usr.gitems < 0)
					usr.gitems = 0
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(src.guild == usr.guild_name)
				if(Move(usr))
					usr << "You have picked up [src.name]."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up [src.name]."
			else
				usr << "You are not in the guild: [src.guild]."
				return
		Drop()
			set category = null
			if(!src.eq)
				usr.inven_min -= 1
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."
			else
				usr << "Cannot drop it while it is equiped."
				return
		Destroy()
			set category = null
			if(src in usr:contents)
				if(!src.eq)
					usr.inven_min -= 1
					del(src)
				else
					usr << "Cannot do that while it is equiped."
					return
			else
				return
obj/Equipment/Consumable/Chip
	name =  "Chip"
	icon = 'Chip.dmi'
	Click()
		if(src in usr:contents)
			if(usr.race == "Android" && usr.chips < 10)
				usr << "<font color = red>You absorb the chip into your system!"
				usr.chips ++
				usr.powerlevel_max += 1000000
				del(src)
				return
			else
				usr << "I have to use for this..might as well just drop it."
				return
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."
				usr.inven_min += 1
			else
				usr << "You are unable to pick up [src.name]."
		Drop()
			set category = null
			usr.inven_min -= 1
			src.loc = usr.loc
			usr << "You have dropped the <u>[src.name]</u>."