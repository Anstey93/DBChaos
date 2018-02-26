obj/Technique/Fly
	verb/Fly()
		set category = "Techniques"
		if(usr.buku_lock)
			usr << "You cannot fly at the moment."
			return
		for(var/turf/Floors/Gravity_Floor/S in view(8))
			if(S in oview(8))
				usr << "You cannot fly here."
				return
		if(usr.buku)
			usr << "You land on the ground from the sky."
			usr.buku = 0
			usr.density = 1
			usr.doing = 0
			usr.icon_state = ""
			return
		else
			if(usr.doing)
				return
			usr.icon_state = "flight"
			usr << "You lift off the ground and take for the sky."
			usr.buku = 1
			usr.density = 0
			usr.doing = 1
			return