mob/var/gregory_hit = 0
mob
	NPC
		Gregory
			name = "{NPC} Gregory"
			icon = 'NPCs2.dmi'
			icon_state = "Gregory"
			density = 1
			safe = 1
			karma = "Good"
			race = "???"
			New()
				..()
				src.CreateName()
				spawn(10)
					Runaway()
			proc/Runaway()
				while(src)
					var/Found = FALSE
					for(var/mob/PC/P in oview(8)).
						step_away(src,P)
						Found = TRUE
						break
					if(Found != TRUE)
						sleep(9)
					sleep(9)
			verb/Hit()
				set src in oview(8)
				set category = "Actions"

				if(src in get_step(usr,usr.dir))
					if(usr.gregory_hit)
						usr << "You have already hit Gregory!"
						return
					else
						usr << "You hit Gregory!"
						usr.powerlevel_max += 2500
						usr.kk_quest_training ++
						usr.gregory_hit = 1
				else
					return