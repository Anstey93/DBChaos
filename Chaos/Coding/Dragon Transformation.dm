mob/proc/DragonTrans()
	if(src.doing)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 4000000  && src.level >= 1000)
				if(src.e_db_1 && src.e_db_2 && src.e_db_3 && src.e_db_4 && src.e_db_5 && src.e_db_6 && src.e_db_7)
					src.e_db_1=0
					src.e_db_2=0
					src.e_db_3=0
					src.e_db_4=0
					src.e_db_5=0
					src.e_db_6=0
					src.e_db_7=0
					for(var/obj/Earth_Dragonballs/O in src)
						del(O)
					for(var/obj/Technique/InvertPower/T in src)
						del(T)
					for(var/obj/Transform/Transform/T in src)
						del(T)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [trans1t]"
					src.frozen = 1
					sleep(35)
					src.powerlevel_max *= 110
					src.ki_max *= 100
					src.kidefense_max*=100
					src.strength_max *= 128
					src.defence_max *= 110
					src.critical_max += 40
					src.dodge_max += 45
					src.reflect_max += 42
					src.block_max += 39
					src.counter_max += 39
					src.speed = 1
					src.speed_max = 1
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.icon = 'Omega.dmi'
					src.overlays += 'Dragon Electric.dmi'
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.spam_delay=0
					src.doing = 0
					src.safe = 0
					return