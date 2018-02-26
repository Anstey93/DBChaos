mob
	Monster
		Dragon
			name = "{NPC}Dragon."
			icon = 'Dragon.dmi'
			icon_state = "Dragon"
			density = 1
			powerlevel = 70000001941504
			powerlevel_max = 10
			ki = 3599999959040
			ki_max = 3599999959040
			speed = 65000000716
			strength = 130000003072
			defence = 160000000000
			critical = 25
			karma = "Evil"
			race = "Dragon"
			level = 70000
			zenni = 2500000
			pk = 1
			exp = 1000000
			Bump(mob/M)
				if(istype(M,/mob/PC))
					src.Attack2(M)
