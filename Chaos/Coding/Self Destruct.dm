obj/Technique/SelfDestruct
	verb
		Self_Destruct()
			set category = "Techniques"
			if(usr.powerlevel_max < 10000)
				src << "Your body isn't strong enough to sustain anymore damage!"
				return
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
			switch(alert("Do you want to Self Destruct? This would cause damage to your Circuitry(5% Powerlevel)","","Self Destruct","No"))
				if("No")
					return
				else
					usr.doing=1
					usr.tech_cooldown=1
					view(8)<<"\white [usr]: \font Self Destruct activated. Countdown Started:"
					view(8)<<"\white [usr]: \font 5..."
					sleep(10)
					view(8)<<"\white [usr]: \font 4..."
					sleep(10)
					view(8)<<"\white [usr]: \font 3..."
					sleep(10)
					view(8)<<"\white [usr]: \font 2..."
					sleep(10)
					view(8)<<"\white [usr]: \font 1..."
					sleep(10)
					new/obj/techs/Overlays/Crater_Center(usr.loc)
					for(var/obj/Earth_Dragonballs/O in usr)
						O.loc = usr.loc
					for(var/obj/Namek_Dragonballs/O in usr)
						O.loc = usr.loc
					for(var/obj/Black_Dragonballs/O in usr)
						O.loc = usr.loc
					usr.e_db_1 = 0
					usr.e_db_2 = 0
					usr.e_db_3 = 0
					usr.e_db_4 = 0
					usr.e_db_5 = 0
					usr.e_db_6 = 0
					usr.e_db_7 = 0
					usr.n_db_1 = 0
					usr.n_db_2 = 0
					usr.n_db_3 = 0
					usr.n_db_4 = 0
					usr.n_db_5 = 0
					usr.n_db_6 = 0
					usr.n_db_7 = 0
					usr.b_db_1 = 0
					usr.b_db_2 = 0
					usr.b_db_3 = 0
					usr.b_db_4 = 0
					usr.b_db_5 = 0
					usr.b_db_6 = 0
					usr.b_db_7 = 0
					for(var/mob/M in oview(20,usr))
						var/damage = usr.ki*2
						if(!M.dead&&!M.safe&&M.pk)
							var/damage2=(damage-M.kidefense)/(((2+get_dist(usr,M))/2))
							if(damage2<0)
								damage2=0
							M.powerlevel-=damage2
							M.DeathCheck(usr)
					usr.SELFDESTRUCTDEATH()
					return

mob
	proc
		SELFDESTRUCTDEATH()
			world << "<FONT color = red>Battle Information:<FONT color = White> [src] has Self Destructed!"
			src.rest = 0
			src.frozen = 0
			src.boxing = 0
			src.doing = 0
			src.icon_state = ""
			src.density = 1
			src.loc = locate(162,7,3)
			src.attack_lock = 0
			src.ki_lock = 0
			src.dead = 0
			src.powerlevel = 50
			src.powerlevel_max -= src.powerlevel_max * 0.05
			src.KO = 0
			src.rage = 0
			src.overlays -= 'Halo.dmi'
			src.sight &= ~BLIND
			src.deaths += 1
			src << "You feel minor damage to your Circuitry."