mob
	proc
		HalfSaiyanFuseForm()
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
			src.powerlevel *= 52
			src.ki *= 45
			src.strength *= 52
			src.defence *= 51
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
			src.HHair_Apply()
			src.Big_Aura()
			src.icon_state = ""
			src.overlays += 'Elec White.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.form_5 = 1
			src.form_6 = 1
			src.frozen = 0
			src.doing = 0
			src.safe = 0
			return
mob/proc/HalfSaiyanTrans()
	var/trans_time = src.upkeep / 1.5
	if(src.upkeep == 5)
		trans_time = 5
	if(src.doing)
		return
	if(src.Oozaru)
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
				src.powerlevel *= 52
				src.ki *= 45
				src.strength *= 52
				src.defence *= 51
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
				src.HHair_Apply()
				src.Big_Aura()
				src.icon_state = ""
				src.overlays += 'Elec White.dmi'
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.form_5 = 1
				src.form_6 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 700000)
				if(!src.ascended_ssj)
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
					src.defence *= 10
					src.block += 5
					src.dodge += 5
					src.critical += 5
					src.reflect += 5
					src.counter += 5
					src.speed=src.speed_max-1000
					if(src.speed<1000)
						src.speed=1000
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.SSJ_EXP()
					src.SSJHair_Apply()
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 5000000)
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
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.overlays += 'Elec Blue Small.dmi'
					src.powerlevel *= 19
					src.ki *= 14
					src.kidefense*=14
					src.strength *= 17
					src.defence *= 14
					src.block -= 2
					src.dodge -= 4
					src.critical += 7
					src.reflect -= 3
					src.counter -= 3
					src.speed=src.speed_max+1000
					if(src.speed<1000)
						src.speed=1000
					src.icon_state = ""
					src.USSJ_Apply()
					src.USSJHair_Apply()
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					return
			else
				if(!src.form_3 && src.gone_ssj2)
					if(src.powerlevel_max >= 9000000)
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
						src.critical = src.critical_max
						src.dodge = src.dodge_max
						src.reflect = src.reflect_max
						src.block = src.block_max
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.powerlevel *= 23
						src.ki *= 18
						src.kidefense*=18
						src.strength *= 21
						src.defence *= 22
						src.block += 8
						src.dodge += 8
						src.critical += 2
						src.reflect += 8
						src.counter += 8
						src.speed=src.speed_max-2000
						if(src.speed<1000)
							src.speed=1000
						src.icon_state = ""
						src.SSJHair_Apply()
						src.Skin_Apply()
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						return
				else
					if(!src.form_4 && src.gone_ssj2)
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
							src.critical = src.critical_max
							src.dodge = src.dodge_max
							src.reflect = src.reflect_max
							src.block = src.block_max
							src.USSJHair_Apply()
							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays -= src.aura
							src.overlays += 'Elec Red Big.dmi'
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.powerlevel *= 30
							src.ki *= 29
							src.kidefense*=29
							src.strength *= 29
							src.defence *= 30
							src.block += 6
							src.dodge += 6
							src.critical += 6
							src.reflect += 6
							src.counter += 6
							src.speed=src.speed_max-3000
							if(src.speed<1000)
								src.speed=1000
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							return
					else
						if(!src.form_5 && src.form_4)
							if(src.powerlevel_max >= 50000000)
								if(src.fused)
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
									src.overlays -= 'Hair - Goku SSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
									src.overlays -= 'Hair - Future Gohan SSJ.dmi'
									src.overlays -= 'Hair - Vegeta SSJ.dmi'
									src.overlays -= 'Hair - Trunks Long SSJ.dmi'
									src.overlays -= 'Hair - Raditz SSJ.dmi'
									src.overlays -= 'Hair - Goku USSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
									src.overlays -= 'Hair - Future Gohan USSJ.dmi'
									src.overlays -= 'Hair - Vegeta USSJ.dmi'
									src.overlays -= 'Hair - Trunks Long USSJ.dmi'
									src.overlays -= 'Hair - Raditz USSJ.dmi'
									if(src.hair != "Bald")
										src.overlays += 'Hair - SSJ3.dmi'
									src.underlays -= src.underlays
									src.overlays -= src.aura
									src.Big_Aura()
									src.powerlevel *= 33
									src.ki *= 28
									src.kidefense*=28
									src.strength *= 32
									src.defence *= 33
									src.block += 7
									src.dodge += 7
									src.critical += 7
									src.reflect += 7
									src.counter += 7
									src.speed=src.speed_max-4000
									if(src.speed<1000)
										src.speed=1000
									src.icon_state = ""
									src.form_5 = 1
									src.frozen = 0
									src.doing = 0
									src.safe = 0
									return
						if(!src.form_6 && src.form_4)
							if(src.powerlevel_max >= 45000000)
								if(src.mystic && !src.fused)
									src.doing = 1
									src.icon_state = "enrage"
									if(src.trans6t!="")
										view(8)<<"\white[src]: \font [src.trans6t]"
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
									src.overlays -= 'Hair - Goku SSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
									src.overlays -= 'Hair - Future Gohan SSJ.dmi'
									src.overlays -= 'Hair - Vegeta SSJ.dmi'
									src.overlays -= 'Hair - Trunks Long SSJ.dmi'
									src.overlays -= 'Hair - Raditz SSJ.dmi'
									src.overlays -= 'Hair - Goku USSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
									src.overlays -= 'Hair - Future Gohan USSJ.dmi'
									src.overlays -= 'Hair - Vegeta USSJ.dmi'
									src.overlays -= 'Hair - Trunks Long USSJ.dmi'
									src.overlays -= 'Hair - Raditz USSJ.dmi'
									src.HHair_Apply()
									src.underlays -= src.underlays
									src.overlays -= src.aura
									src.Big_Aura()
									src.overlays -= 'Elec Red Big.dmi'
									src.overlays += 'Elec White.dmi'
									src.powerlevel *= 35
									src.ki *= 30
									src.kidefense*=30
									src.strength *= 34
									src.defence *= 35
									src.block += 7
									src.dodge += 7
									src.critical += 7
									src.reflect += 7
									src.counter += 7
									src.speed=src.speed_max-5000
									if(src.speed<1000)
										src.speed=1000
									src.icon_state = ""
									src.form_6 = 1
									src.frozen = 0
									src.doing = 0
									src.safe = 0
									return