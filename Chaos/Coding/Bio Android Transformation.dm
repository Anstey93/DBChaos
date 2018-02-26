mob/proc/BioTrans()
	if(src.doing)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 500000  && src.absorb_kill >= 10 && src.level >= 300)
				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				sleep(20)
				for(var/obj/Technique/InvertPower/T in src)
					del(T)
				src.powerlevel_max *= 3.5
				src.ki_max *= 2.5
				src.strength_max *= 3.5
				src.defence_max *= 3.5
				src.kidefense_max*=2.5
				src.critical_max += 9
				src.dodge_max += 9
				src.reflect_max += 9
				src.block_max += 9
				src.counter_max += 9
				src.speed_max-=1000
				if(src.speed_max<1000)
					src.speed_max=1000
				src.speed=src.speed_max
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.kidefense=src.kidefense_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.icon_state = ""
				src.icon = 'Bio Android - Form 2.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 5000000  && src.absorb_kill >= 30 && src.level >= 800)
					for(var/obj/Technique/Absorb/T in src)
						del(T)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans2t!="")
						view(8)<<"\white[src]: \font [src.trans2t]"
					src.frozen = 1
					sleep(20)
					src.powerlevel_max *= 4
					src.ki_max *= 2
					src.kidefense_max*=2
					src.strength_max *= 5
					src.defence_max *= 4
					src.critical_max += 8
					src.dodge_max += 8
					src.reflect_max += 8
					src.block_max += 8
					src.counter_max += 8
					src.speed_max-=1000
					if(src.speed_max<1000)
						src.speed_max=1000
					usr.speed=src.speed_max
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
					src.icon_state = ""
					src.icon = 'Bio Android - Form 3.dmi'
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 50000000  && src.level >= 1300)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans3t!="")
							view(8)<<"\white[src]: \font [src.trans3t]"
						src.frozen = 1
						sleep(8)
						if(src.crater_on)
							new/obj/techs/Overlays/Crater_Center(src.loc)
						if(src.powerlevel>src.powerlevel_max)
							src.powerlevel = src.powerlevel_max
						if(src.ki>src.ki_max)
							src.ki = src.ki_max
						if(src.kidefense>src.kidefense_max)
							src.kidefense=src.kidefense_max
						if(src.strength>src.strength_max)
							src.strength = src.strength_max
						if(src.defence>src.defence_max)
							src.defence = src.defence_max
						src.powerlevel *= 7
						src.ki *= 10
						src.strength *= 6
						src.defence *= 5
						src.kidefense*=10
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.overlays -= 'Elec Blue Big.dmi'
						src.overlays += 'Elec Red Big.dmi'
						src.Big_Aura()
						src.speed=src.speed_max-1000
						if(src.speed<1000)
							src.speed=1000
						src.block += 8
						src.dodge += 9
						src.critical += 9
						src.reflect += 8
						src.counter += 9
						src.icon_state = ""
						src.icon = 'Bio Android - Form 4.dmi'
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						return