mob
	Monster
		Droid
			name = "{NPC}Droid."
			icon = 'Droid.dmi'
			density = 1
			powerlevel = 25000000
			powerlevel_max = 25000000
			ki = 35000000
			ki_max = 35000000
			speed = 50000
			strength = 6500000
			defence = 4000000
			critical = 25
			karma = "Evil"
			race = "Android"
			level = 3500
			zenni = 48000
			pk = 1
			exp = 25000
			Bump(mob/M)
				if(istype(M,/mob/PC))
					src.Attack2(M)
			Del()
				var/obj/O = new/obj/Equipment/Consumable/Chip
				O.loc = src.loc
				..()