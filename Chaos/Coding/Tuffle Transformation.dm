mob/var/obtain_super = 0
mob/var/obtain_super_2 = 0
mob/proc/TuffleTrans()
	if(src.doing)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 3500000  && src.level >= 3000)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.frozen = 1
				sleep(20)
				for(var/obj/Technique/InvertPower/T in src)
					del(T)
				src.powerlevel_max *= 2.5
				src.ki_max *= 2.5
				src.kidefense_max*=2.5
				src.strength_max *= 3.5
				src.defence_max *= 3.5
				src.speed_max-=2000
				if(src.speed_max<1000)
					src.speed_max=1000
				src.speed=src.speed_max
				src.critical_max += rand(6,9)
				src.dodge_max += rand(6,9)
				src.reflect_max += rand(6,9)
				src.block_max += rand(6,9)
				src.counter_max += rand(6,9)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.kidefense=src.kidefense_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.icon='Bebi - Form 2.dmi'
				src.icon_state = ""
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.form_1 = 1
				src.frozen = 0
				src.spam_delay=0
				src.trans_delay=0
				src.doing = 0
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 60000000  && src.level >= 8000)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans2t!="")
						view(8)<<"\white[src]: \font [src.trans2t]"
					src.frozen = 1
					sleep(19)
					src.contents+=new/obj/Transform/Revert
					src.powerlevel_max *= 3
					src.ki_max *= 2
					src.kidefense_max*=2
					src.strength_max *= 5
					src.defence_max *= 5
					src.speed_max-=1000
					if(src.speed_max<1000)
						src.speed_max=1000
					src.speed=src.speed_max
					src.critical_max += rand(2,8)
					src.dodge_max += rand(2,8)
					src.reflect_max += rand(2,8)
					src.block_max += rand(2,8)
					src.counter_max += rand(2,8)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.overlays += 'Elec Blue Big.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.icon='Bebi - Form 3.dmi'
					src.icon_state = ""
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.trans_delay=0
					src.spam_delay=0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 60000000 && src.level >= 9000)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans3t!="")
							view(8)<<"\white[src]: \font [src.trans3t]"
						src.frozen = 1
						sleep(19)
						if(src.crater_on)
							new/obj/techs/Overlays/Crater_Center(src.loc)
						src.powerlevel *= 7
						src.ki *= 10
						src.kidefense*=10
						src.strength *= 6
						src.defence *= 5
						src.speed-=1000
						if(src.speed<1000)
							src.speed=1000
						src.critical += rand(2,6)
						src.dodge += rand(2,6)
						src.reflect += rand(2,6)
						src.block += rand(2,6)
						src.counter += rand(2,6)
						src.overlays -= 'Elec Blue Big.dmi'
						src.overlays += 'Elec Red Big.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon_state = ""
						src.form_3 = 1
						src.frozen = 0
						src.spam_delay=0
						src.trans_delay=0
						src.doing = 0
						return