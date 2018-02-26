mob
	proc
		KaiFuseForm()
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
			src.powerlevel *= 34
			src.ki *= 45
			src.strength *= 42
			src.defence *= 53
			src.kidefense*=45
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
			src.overlays+='Elec Blue Dark.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.frozen = 0
			src.doing = 0
			src.safe = 0
			return
mob/proc/KaiTrans()
	var/trans_time = src.upkeep/1.5
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
				src.powerlevel *= 34
				src.ki *= 45
				src.strength *= 42
				src.defence *= 53
				src.kidefense*=45
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
				src.overlays+='Elec Blue Dark.dmi'
				src.form_1 = 1
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				return
		if(!src.form_1)
			if(src.powerlevel_max>=375000&&src.ki_max>=150000)
				if(src.doing)
					return
				else
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
					src.ki *= 20
					src.kidefense*=20
					src.strength *= 18
					src.defence *= 25
					src.block += 15
					src.dodge += 17
					src.critical += 15
					src.reflect += 19
					src.counter += 15
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.speed=1000
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					src.FORM1_EXP()
					return
		else
			if(!src.form_2)
				if(src.powerlevel_max>=3750000&&src.ki_max>=1500000)
					if(src.doing)
						return
					else
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")
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
						src.powerlevel *= 22
						src.ki *= 30
						src.kidefense*=30
						src.strength *= 28
						src.defence *= 35
						src.block += 22
						src.dodge += 26
						src.critical += 23
						src.reflect += 25
						src.counter += 25
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.speed=1000
						src.overlays+='Elec Blue Dark.dmi'
						src.icon_state = ""
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						return
mob/proc/KaiRevert()
	if(src.form_1)
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.doing = 0
		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.overlays -= 'Elec Blue Dark.dmi'
		src.Power_Redefine()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return