mob
	var/form_7=0
	proc
		ChanglingTransMetal()
			if(src.form_7)return
			if(src.powerlevel_max >= 210000000)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans6t!="")
					view(8)<<"\white[src]: \font [src.trans6t]"
				src.frozen = 1
				sleep(15)
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
				src.powerlevel *= 1.7
				src.ki *= 2
				src.kidefense*=2
				src.strength *= 1.8
				src.defence *= 1.8
				src.block += 5
				src.dodge += 5
				src.critical += 7
				src.reflect += 5
				src.counter += 5
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.form_7 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				return
		ChanglingFuseForm()
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
			src.powerlevel *= 50
			src.ki *= 45
			src.strength *= 48
			src.defence *= 48
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
			src.icon = 'Changling - Form 5.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.form_5 = 1
			src.frozen = 0
			src.doing = 0
			src.safe = 0
			return
mob/proc/ChanglingTrans()
	var/trans_time = src.upkeep /1.5
	if(src.upkeep<=5)
		trans_time=5
	if(src.doing)
		return
	else
		if(src.gonemetal)
			return ChanglingTransMetal()
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
				src.powerlevel *= 50
				src.ki *= 45
				src.strength *= 48
				src.defence *= 48
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
				src.icon = 'Changling - Form 5.dmi'
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
			if(src.powerlevel_max >= 100000)
				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
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
				src.powerlevel *= 13
				src.ki *= 10
				src.strength *= 10
				src.defence *= 8
				src.kidefense*=10
				src.block += 6
				src.dodge += 5
				src.critical += 7
				src.reflect += 5
				src.counter += 7
				src.speed=src.speed_max-1000
				if(src.speed<1000)
					src.speed=1000
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Changling - Form 2.dmi'
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				src.FORM1_EXP()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 450000)
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
					src.powerlevel *= 18
					src.ki *= 15
					src.strength *= 15
					src.defence *= 16
					src.kidefense*=15
					src.block += 6
					src.dodge += 6
					src.critical += 6
					src.reflect += 6
					src.counter += 6
					src.speed=src.speed_max+1000
					if(src.speed<1000)
						src.speed=1000
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.overlays+='Elec Blue Small.dmi'
					src.Big_Aura()
					src.icon_state = ""
					src.icon = 'Changling - Form 3.dmi'
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 900000)
						src.doing = 1
						src.icon_state = "enrage"
						src.frozen = 1
						if(src.trans3t!="")
							view(8)<<"\white[src]: \font [src.trans3t]"
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
						src.powerlevel *= 23
						src.ki *= 20
						src.kidefense*=20
						src.strength *= 21
						src.defence *= 20
						src.block += 6
						src.dodge += 6
						src.critical += 6
						src.reflect += 6
						src.counter += 6
						src.speed=src.speed_max-2000
						if(src.speed<1000)
							src.speed=1000
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.overlays-='Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.icon_state = ""
						src.icon = 'Changling - Form 4.dmi'
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 2000000)
							src.doing = 1
							src.icon_state = "enrage"
							src.frozen = 1
							if(src.trans4t!="")
								view(8)<<"\white[src]: \font [src.trans4t]"
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
							src.powerlevel *= 28
							src.ki *= 25
							src.kidefense*=25
							src.strength *= 27
							src.defence *= 25
							src.block += 4
							src.dodge += 4
							src.critical += 4
							src.reflect += 4
							src.counter += 4
							src.speed=src.speed_max-3000
							if(src.speed<1000)
								src.speed=1000
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.icon_state = ""
							src.icon = 'Changling - Form 4 100.dmi'
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 6000000)
								src.doing = 1
								src.icon_state = "enrage"
								if(src.trans5t!="")
									view(8)<<"\white[src]: \font [src.trans5t]"
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
								src.powerlevel *= 33
								src.ki *= 30
								src.kidefense*=30
								src.strength *= 32
								src.defence *= 32
								src.block += 4
								src.dodge += 4
								src.critical += 6
								src.reflect += 4
								src.counter += 4
								src.speed=src.speed_max-4000
								if(src.speed<1000)
									src.speed=1000
								src.underlays -= src.underlays
								src.overlays -= src.aura
								src.overlays -= 'Elec Blue Big.dmi'
								src.overlays += 'Elec Red Big.dmi'
								src.Big_Aura()
								src.icon_state = ""
								src.icon = 'Changling - Form 5.dmi'
								src.form_5 = 1
								src.frozen = 0
								src.doing = 0
								src.safe = 0
								return