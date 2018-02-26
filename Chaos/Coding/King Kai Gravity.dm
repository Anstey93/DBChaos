turf/Planet_Gravitys
	King_Kai
		Entered(mob/M)
			if(istype(M,/mob/PC))
				if(M.staminaleft<M.staminaleft_max)
					M.exp += rand(1,2)
					M.staminaleft+=rand(0.5,1.5)
					if(M.staminaleft>M.staminaleft_max)
						M.staminaleft=M.staminaleft_max
					M.Level_Up()