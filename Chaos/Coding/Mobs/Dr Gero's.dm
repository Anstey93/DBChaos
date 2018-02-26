turf
	Passages
		Dr_Geros
			CaveEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(93,102,7)
			CaveExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc = locate(290,48,1)
			CaveEnter2
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(172,110,7)
			CaveExit2
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc = locate(210,232,1)
			LabEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						if(M.race == "Android")
							M.it_blocked=1
							M.it_lock=1
							M.loc = locate(203,143,7)
						else
							M << "You have no business in here."
			LabExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.it_blocked=0
						M.loc = locate(156,159,7)
						M.it_lock=0