obj/Equipment
	Z_Sword
		name = "Z-Sword"
		icon = 'Z-Sword.dmi'
		icon_state = "drop"
		var/sword = 'Z-sword.dmi'
		value = 1000000
		density = 0
		weight=2.6
		Click()
			if(src in usr:contents)
				if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key
				if(usr.level < 500)
					usr << "<font color=blue>You need to be level 500 or higher to be able to pick up this Sword."
					return
				else
					if(!usr.z_sword)
						if(usr.back == "EMPTY")
							if(src.item_owner!=usr.key&&src.item_owner)
								usr<<"Error: This item is Bio-Linked to someone."
								return
							usr.overlays += sword
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "{Worn}"
							usr.z_sword = 1
							src.equiped = 1
							usr.back = "Z-Sword"
						else
							usr << "Error: You already have something equipped on your Shoulders!"
							return
					else
						usr.overlays -= sword
						usr << "You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.z_sword = 0
						src.equiped = 0
						usr.back = "EMPTY"

		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.level < 500)
					usr << "<font color=blue>You need to be level 500 or higher to be able to pick up this Sword."
					return
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
			Summon_Elder_Kai()
				set category = null
				if(usr.race == "Half Saiyan")
					if(usr.karma == "Good" && usr.karma_rating >= 30)
						if(usr.powerlevel_max >= 5000000)
							if(!usr.mystic)
								for(var/mob/NPC/N in oview(15))
									if(N.name == "{NPC}Supreme Kai")
										var/mob/NPC/Elder_Kai/M = new
										M.owner=usr
										M.loc = usr.loc
									else
										usr << "You must be on Supreme Kai's planet to summon Elder Kai."
										return
						else
							usr<<"You need 5,000,000 powerlevel."
							return
					else
						usr<<"You need 30% Good Karma."
						return
				else
					usr << "You can't summon Elder Kai."
					return

obj/Equipment
	LegendarySword
		name = "Legendary Sword"
		icon = 'Legendary Sword.dmi'
		icon_state = "drop"
		value = 1000000
		density = 0
		Click()
			if(usr.doing)
				return
			if(src in usr:contents)
				if(!usr.legendarysword)
					if(usr.powerlevel<usr.powerlevel_max*0.05)
						usr<<"You are too weak to wield your Sword."
						return
					usr.overlays+=src.icon
					usr<<"You have equiped the: <u>[src]</u>."
					suffix="{Worn}"
					usr.strength+=75000*usr.level
					usr.contents += new/obj/Technique/SwordSlash
					usr.contents += new/obj/Technique/ThousandSwordSlash
					usr.legendarysword=1
					src.equiped=1
					usr.speed-=1000
					if(usr.speed<1000)
						usr.speed=1000
					usr.LSwordDrain(usr.powerlevel*0.05)
				else
					usr.overlays-=src.icon
					usr<<"You have unequiped the: <u>[src]</u>."
					usr.speed=usr.speed_max
					for(var/obj/Technique/SwordSlash/S in usr.contents)
						del(S)
					for(var/obj/Technique/ThousandSwordSlash/S in usr.contents)
						del(S)
					suffix=null
					usr.legendarysword=0
					src.equiped=0
					usr.strength=usr.strength_max
mob
	proc
		LSwordDrain(drain)
			if(src.legendarysword)
				src.powerlevel-=drain
				if(src.powerlevel<1)
					src.powerlevel=1
					src.overlays-='Legendary Sword.dmi'
					src.legendarysword=0
					src.strength=src.strength_max
					for(var/obj/Technique/SwordSlash/S in src.contents)
						del(S)
					for(var/obj/Equipment/LegendarySword/L in src.contents)
						L.suffix=null
					src<<"You are too weak to wield your Sword."
					src.speed=usr.speed_max
					return
				else
					spawn(15)src.LSwordDrain(drain)