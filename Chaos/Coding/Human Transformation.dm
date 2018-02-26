mob
	proc
		HumanFuseForm()
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
			src.powerlevel *= 48
			src.ki *= 47
			src.strength *= 54
			src.defence *= 54
			src.kidefense*=47
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
			src.overlays += 'Elec Human Red.dmi'
			src.SHHair_Apply()
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.frozen = 0
			src.doing = 0
			src.safe = 0
			return
mob/proc/HumanTrans()
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
				src.powerlevel *= 48
				src.ki *= 47
				src.strength *= 54
				src.defence *= 54
				src.kidefense*=47
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
				src.overlays += 'Elec Human Red.dmi'
				src.SHHair_Apply()
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 850000)
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
					src.ki *= 8
					src.kidefense*=8
					src.strength *= 11
					src.defence *= 11
					src.block += 5
					src.dodge += 5
					src.critical += 5
					src.reflect += 5
					src.counter += 5
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.speed=src.speed_max-1000
					if(src.speed<1000)
						src.speed=1000
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					src.FORM1_EXP()
					return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 5500000)
					if(src.doing)
						return
					else
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
						src.ki *= 13
						src.kidefense*=13
						src.strength *= 17
						src.defence *= 17
						src.block += 5
						src.dodge += 5
						src.critical += 5
						src.reflect += 5
						src.counter += 5
						src.USSJ_Apply()
						src.speed=src.speed_max-2000
						if(src.speed<1000)
							src.speed=1000
						src.icon_state = ""
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.Big_Aura()
						src.overlays += "Elec Human Blue.dmi"
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 18000000 && src.level >= 25000)
						if(src.doing)
							return
						else
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
							src.powerlevel *= 26
							src.ki *= 24
							src.kidefense*=24
							src.strength *= 30
							src.defence *= 30
							src.block += 4
							src.dodge += 4
							src.critical += 4
							src.reflect += 4
							src.counter += 4
							src.speed=src.speed_max-3000
							if(src.speed<1000)
								src.speed=1000
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.Big_Aura()
							src.Skin_Apply()
							src.HHair_Apply()
							src.icon_state = ""
							src.form_3 = 1
							src.frozen = 0
							src.doing = 0
							return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 45000000)
							if(src.doing)
								return
							else
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
								src.powerlevel *= 32
								src.ki *= 31
								src.kidefense*=31
								src.strength *= 36
								src.defence *= 36
								src.block += 4
								src.dodge += 3
								src.critical += 4
								src.reflect += 3
								src.counter += 4
								src.overlays -= src.aura
								src.underlays -= src.underlays
								src.Big_Aura()
								src.SHHair_Apply()
								src.speed=src.speed_max-4000
								if(src.speed<1000)
									src.speed=1000
								src.icon_state = ""
								src.overlays += 'Elec Human Red.dmi'
								src.form_4 = 1
								src.frozen = 0
								src.doing = 0
								return