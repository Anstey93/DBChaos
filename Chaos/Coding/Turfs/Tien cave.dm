turf
	var
		ispassage=0
	Passages
		ispassage=1
		Caves
			Cave1_Entrance
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(242,157,7)
			Cave1_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc=locate(84,374,1)
			Cave2_Entrance
				Enter(var/mob/PC/M)
					if(M.client)
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(299,131,7)
			Cave2_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc=locate(99,352,1)
			Cave3_Entrance
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(371,112,7)
			Cave3_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc=locate(347,88,1)