mob
	Monster
		Cell_Jr
			name = "{NPC}Cell Jr."
			icon = 'Cell Jr.dmi'
			density = 1
			powerlevel = 600000000
			powerlevel_max = 600000000
			ki = 250000000
			ki_max = 250000000
			speed = 6000
			strength = 45000000
			defence = 50000000
			critical = 20
			karma = "Evil"
			race = "Bio-Android"
			level = 8000
			zenni = 8000
			pk = 1
			exp = 4300
			Bump(mob/M)
				if(istype(M,/mob/PC))
					src.Attack2(M)
