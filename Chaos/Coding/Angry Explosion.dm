obj/Technique/AngryExplosion
	verb
		Angry_Explosion()
			set category = "Techniques"
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are doing something."
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<50000)
				usr<<"Your ki is too low."
				return
			if(usr.ki_lock)
				src << "You can't use ki right now."
				return
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(!usr.pk)
				usr << "Reach level 75 to be able to use battle techniques."
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "Safe Zone!"
					return
			if(usr.race == "Majin")
				usr.icon_state = "enrage"
				usr.frozen = 1
				usr.doing=1
				usr.tech_cooldown=1
				sleep(30)
				for(var/turf/Floors/Safe_Zone/S in view(8))
					if(S in oview(8))
						usr << "Safe Zone!"
						usr.ANGRY()
						return
				for(var/mob/M in oview(8,usr))
					var/damage = usr.ki*2
					new/obj/techs/Overlays/Crater_Center(src.loc)
					if(!M.dead&&!M.safe&&M.pk)
						var/turf/CL=M.loc
						for(var/turf/Floors/Safe_Zone/SZ in CL)
							continue
						var/damage2=(damage-M.kidefense)/(((2+get_dist(usr,M))/2))
						if(damage2<0)
							damage2=0
						M.powerlevel-=damage2
						M.DeathCheck(usr)
				usr.ANGRY()
				return

mob
	proc
		ANGRY()
			src.powerlevel=50
			src.ki = 0
			src.rest = 0
			src.frozen = 1
			src.boxing = 0
			src.doing = 0
			src.icon_state = "Dead"
			src.regen_dead=1
			src.doing = 0
			src.frozen = 0
			spawn(70)src.tech_cooldown=0