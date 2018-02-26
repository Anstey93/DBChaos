mob
	proc
		DemonFuseForm()
			src.doing = 1
			src.icon_state = "enrage"
			src.frozen = 1
			if(src.trans1t!="")
				view(8)<<"\white[src]: \font [src.trans6t]"
			sleep(src.upkeep)
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
			src.powerlevel *= 47
			src.ki *= 50
			src.strength *= 48
			src.defence *= 55
			src.kidefense*=50
			src.block += 20
			src.dodge += 20
			src.critical += 20
			src.reflect += 20
			src.counter += 20
			src.speed=src.speed_max-4000
			if(src.speed<1000)
				src.speed=1000
			src.underlays -= src.underlays
			src.overlays -= src.aura
			src.Big_Aura()
			src.icon_state = ""
			src.icon = 'Demon - Form 5.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.form_5 = 1
			src.frozen = 0
			src.doing = 0
			src.safe = 0
			return
mob/proc/DemonTrans()
	var/trans_time = src.upkeep / 1.5
	if(src.upkeep == 5)
		trans_time = 5
	if(src.doing)
		return
	else
		if(src.finalformfuse)
			if(src.fused&&!src.form_1)
				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans6t]"
				sleep(trans_time)
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
				src.powerlevel *= 47
				src.ki *= 50
				src.strength *= 48
				src.defence *= 55
				src.kidefense*=50
				src.block += 20
				src.dodge += 20
				src.critical += 20
				src.reflect += 20
				src.counter += 20
				src.speed=src.speed_max-4000
				if(src.speed<1000)
					src.speed=1000
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Demon - Form 5.dmi'
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 150000)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.frozen = 1
				sleep(trans_time)
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
				src.powerlevel *= 12
				src.ki *= 9
				src.kidefense*=9
				src.strength *= 9
				src.defence *= 13
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.speed=src.speed_max-1000
				if(src.speed<1000)
					src.speed=1000
				src.icon_state = ""
				src.icon = 'Demon - Form 2.dmi'
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				src.FORM1_EXP()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 4500000)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans2t!="")
						view(8)<<"\white[src]: \font [src.trans2t]"
					src.frozen = 1
					sleep(trans_time)
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
					src.powerlevel *= 17
					src.ki *= 18
					src.kidefense*=18
					src.strength *= 16
					src.defence *= 19
					src.block += 8
					src.dodge += 8
					src.critical += 8
					src.reflect += 8
					src.counter += 8
					src.speed=src.speed_max-2000
					if(src.speed<1000)
						src.speed=1000
					src.icon_state = ""
					src.icon = 'Demon - Form 3.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.overlays += 'Elec Demon 1.dmi'
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 15000000)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans3t!="")
							view(8)<<"\white[src]: \font [src.trans3t]"
						src.frozen = 1
						sleep(trans_time)
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
						src.powerlevel *= 23
						src.ki *= 25
						src.kidefense*=25
						src.strength *= 21
						src.defence *= 23
						src.block += 5
						src.dodge += 6
						src.critical += 5
						src.reflect += 5
						src.counter += 5
						src.speed=src.speed_max-3000
						if(src.speed<1000)
							src.speed=1000
						src.icon_state = ""
						src.icon = 'Demon - Form 4.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.overlays -= 'Elec Demon 1.dmi'
						src.overlays += 'Elec Demon 2.dmi'
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 25000000)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans4t!="")
								view(8)<<"\white[src]: \font [src.trans4t]"
							src.frozen = 1
							sleep(trans_time)
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
							src.powerlevel *= 31
							src.ki *= 33
							src.kidefense*=33
							src.strength *= 32
							src.defence *= 36
							src.block += 5
							src.dodge += 7
							src.critical += 6
							src.reflect += 6
							src.counter += 5
							src.speed=src.speed_max-4000
							if(src.speed<1000)
								src.speed=1000
							src.icon_state = ""
							src.icon = 'Demon - Form 5.dmi'
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.overlays -= 'Elec Demon 2.dmi'
							src.overlays += 'Elec Demon 3.dmi'
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							return






