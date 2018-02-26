mob/var/absorb_kill = 0
obj/Technique/Absorb
	verb/Absorb(mob/M in get_step(usr,usr.dir))
		set category = "Techniques"
		if(!M)return
		if(usr.doing)
			usr << "You are doing something already!"
			return
		if(usr.dead || M.dead)
			usr << "A force stops you from attacking [M]"
			return
		if(usr.safe || M.safe)
			usr << "A force stops you from attacking [M]"
			return
		if(!M.pk)
			usr << "[M] is not a Combatant!"
			return
		if(M.FuseFollower)
			return
		if(!usr.pk)
			usr << "You are not a Combatant!"
			return
		if(!M.KO && M.powerlevel > 0)
			usr << "[M] must be knocked out first!"
			return
		else
			var/absorb = 0
			if(istype(M,/mob/PC))
				absorb = round(M.powerlevel_max/500)
				if(absorb>50000)
					absorb=50000
			usr.doing = 1
			usr.frozen = 1
			spawn(5)
				usr.doing = 0
				usr.frozen = 0
			usr.powerlevel_max += absorb
			M.powerlevel_max -= absorb
			M.powerlevel = 0
			usr.absorb_kill += 1
			M.DeathCheck(usr,"Absorb")