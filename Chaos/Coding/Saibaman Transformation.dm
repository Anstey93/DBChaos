mob/proc/SaibamanFuseForm()
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
	src.powerlevel *= 45
	src.ki *= 39
	src.strength *= 47
	src.defence *= 45
	src.kidefense*=39
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
	src.icon = 'Saibaman - Form 5.dmi'
	src.overlays+='Elec Red Big.dmi'
	src.icon_state = ""
	src.form_1 = 1
	src.form_2 = 1
	src.form_3 = 1
	src.form_4 = 1
	src.frozen = 0
	src.doing = 0
	src.safe = 0
	return
mob/proc/SaibamanTrans()
	var/trans_time = src.upkeep/1.5
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
				src.powerlevel *= 45
				src.ki *= 39
				src.strength *= 47
				src.defence *= 45
				src.kidefense*=39
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
				src.icon = 'Saibaman - Form 5.dmi'
				src.overlays+='Elec Red Big.dmi'
				src.icon_state = ""
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 350000)
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
				src.ki *= 8
				src.kidefense*=8
				src.strength *= 10
				src.defence *= 8
				src.block += 3
				src.dodge += 7
				src.critical += 4
				src.reflect += 4
				src.counter += 6
				src.speed=src.speed_max-1000
				if(src.speed<1000)
					src.speed=1000
				src.icon = 'Saibaman - Form 2.dmi'
				src.icon_state=""
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				src.FORM1_EXP()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 1200000)
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
					src.ki *= 14
					src.kidefense*=14
					src.strength *= 14
					src.defence *= 16
					src.block += 2
					src.dodge += 3
					src.critical += 6
					src.reflect += 4
					src.counter += 4
					src.speed=src.speed_max-2000
					if(src.speed<1000)
						src.speed=1000
					src.overlays+='Elec Green Big.dmi'
					src.icon = 'Saibaman - Form 3.dmi'
					src.icon_state=""
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 4750000)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans3t!="")
							view(8)<<"\white[src]: \font [src.trans3t]"
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
						src.powerlevel *= 24
						src.ki *= 22
						src.kidefense*=22
						src.strength *= 22
						src.defence *= 20
						src.block += 3
						src.dodge += 3
						src.critical += 3
						src.reflect += 3
						src.counter += 3
						src.speed=src.speed_max-3000
						if(src.speed<1000)
							src.speed=1000
						src.icon = 'Saibaman - Form 4.dmi'
						src.overlays-='Elec Green Big.dmi'
						src.overlays+='Elec Black.dmi'
						src.icon_state=""
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.safe = 0
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 8750000)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans4t!="")
								view(8)<<"\white[src]: \font [src.trans4t]"
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
							src.powerlevel *= 30
							src.ki *= 26
							src.kidefense*=26
							src.strength *= 31
							src.defence *= 30
							src.block += 3
							src.dodge += 3
							src.critical += 3
							src.reflect += 3
							src.counter += 3
							src.speed=src.speed_max-4000
							if(src.speed<1000)
								src.speed=1000
							src.icon = 'Saibaman - Form 5.dmi'
							src.overlays-='Elec Black.dmi'
							src.overlays+='Elec Red Big.dmi'
							src.icon_state=""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0

mob/proc/SaibamanRevert()
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
		src.form_6 = 0
		src.overlays -= src.aura
		src.aura = 0
		src.overlays -= 'Elec Green Big.dmi'
		src.overlays -= 'Elec Black.dmi'
		src.overlays -= 'Elec Red Big.dmi'
		src.Power_Redefine()
		src.icon = 'Saibaman - Form 1.dmi'
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return