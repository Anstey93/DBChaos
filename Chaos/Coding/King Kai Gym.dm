turf
	Passages
		KKGym
			Entrance
				density = 1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						if(M.level <= 400)
							M.loc = locate(339,224,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							M<<"Only level 400 and lower may enter."
							return
			Exit
				density = 1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						M.loc = locate(212,355,7)
						M.density = 1
						M.it_blocked = 0
						M.it_lock = 0
		The_Lookout
			Entrance
				density = 1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc = locate(19,5,7)
			Exit
				density = 1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						M.loc = locate(348,295,1)