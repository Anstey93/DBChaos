mob/proc/MajinTrans()

	if(src.doing)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 3500000 && src.eats >= 35)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.frozen = 1
				sleep(20)
				for(var/obj/Technique/InvertPower/T in src)
					del(T)
				src.powerlevel_max *= 5
				src.ki_max *= 4
				src.kidefense_max*=4
				src.strength_max *= 2
				src.defence_max *= 2
				src.critical_max += 6
				src.dodge_max += 7
				src.reflect_max += 6
				src.block_max += 6
				src.counter_max += 6
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
				src.icon = 'Majin - Form 2.dmi'
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.spam_delay=0
				src.trans_delay=0
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 40000000 && src.eats >= 50)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans2t!="")
						view(8)<<"\white[src]: \font [src.trans2t]"
					src.frozen = 1
					sleep(20)
					src.powerlevel_max *= 4
					src.ki_max *= 3
					src.kidefense_max*=3
					src.strength_max *= 3
					src.defence_max *= 2
					src.critical_max += 6
					src.dodge_max += 7
					src.reflect_max += 6
					src.block_max += 6
					src.counter_max += 6
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
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.Big_Aura()
					src.overlays += 'Elec Blue Small.dmi'
					src.icon_state = ""
					src.icon = 'Majin - Form 3.dmi'
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.spam_delay=0
					src.trans_delay=0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 180000000 && src.eats >= 75)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans3t!="")
							view(8)<<"\white[src]: \font [src.trans3t]"
						src.frozen = 1
						sleep(20)
						if(src.crater_on)
							new/obj/techs/Overlays/Crater_Center(src.loc)
						src.powerlevel_max *= 2
						src.ki_max *= 2
						src.kidefense_max*=2
						src.strength_max *= 4
						src.defence_max *= 4
						src.critical_max += 7
						src.dodge_max += 7
						src.reflect_max += 8
						src.block_max += 7
						src.counter_max += 7
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
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.icon_state = ""
						src.icon = 'Majin - Form 4.dmi'
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.trans_delay=0
						src.spam_delay=0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 600000000 && src.eats >= 100)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans4t!="")
								view(8)<<"\white[src]: \font [src.trans4t]"
							src.frozen = 1
							sleep(30)
							for(var/obj/Transform/Transform/T in src)
								del(T)
							if(src.crater_on)
								new/obj/techs/Overlays/Crater_Center(src.loc)
							src.powerlevel_max *= 3
							src.ki_max *= 2
							src.kidefense_max*=2
							src.strength_max *= 4
							src.defence_max *= 4
							src.critical_max += 7
							src.dodge_max += 7
							src.reflect_max += 7
							src.block_max += 7
							src.counter_max += 7
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
							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays += 'Elec Red Big.dmi'
							src.icon_state = ""
							src.icon = 'Majin - Form 5.dmi'
							src.form_4 = 1
							src.frozen = 0
							src.spam_delay=0
							src.doing = 0
							src.trans_delay=0
							return