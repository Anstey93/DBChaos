mob/var/form_1 = 0
mob/var/form_2 = 0
mob/var/form_3 = 0
mob/var/form_4 = 0
mob/var/form_5 = 0
mob/var/ascended_ssj = 0
mob/var/gone_ssj2 = 0
mob/proc/SaiyanFuseForm()
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
	src.icon = 'Male - SSJ4(fused).dmi'
	src.overlays += 'Hair - SSJ4(fused).dmi'
	src.overlays += 'ssj4tail.dmi'
	src.icon_state = ""
	src.overlays+='Elec Blue Dark.dmi'
	src.form_1 = 1
	src.form_2 = 1
	src.form_3 = 1
	src.form_4 = 1
	src.form_5 = 1
	src.frozen = 0
	src.doing = 0
	src.safe = 0
	return
mob/proc/SaiyanTrans()
	var/trans_time = src.upkeep / 1.5
	if(src.upkeep == 5)
		trans_time = 5
	if(src.Oozaru)
		return
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
				src.icon = 'Male - SSJ4(fused).dmi'
				src.overlays += 'Hair - SSJ4(fused).dmi'
				src.overlays += 'ssj4tail.dmi'
				src.icon_state = ""
				src.overlays+='Elec Blue Dark.dmi'
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
			if(src.powerlevel_max >= 90000)
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
					src.powerlevel *= 13
					src.ki *= 8
					src.kidefense*=8
					src.strength *= 10
					src.defence *= 9
					src.block += 5
					src.dodge += 5
					src.critical += 5
					src.reflect += 5
					src.counter += 5
					src.speed=src.speed_max-1000
					if(src.speed<1000)
						src.speed=1000
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.Big_Aura()
					src.SSJHair_Apply()
					src.SSJ_EXP()
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 400000)
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
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.Big_Aura()
					src.overlays += 'Elec Blue Small.dmi'
					src.powerlevel *= 18
					src.ki *= 13
					src.kidefense*=13
					src.strength *= 17
					src.defence *= 14
					src.block -= 1
					src.dodge -= 3
					src.critical += 6
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
				if(!src.form_3)
					if(src.powerlevel_max >= 900000)
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
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.Big_Aura()
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.powerlevel *= 24
						src.ki *= 18
						src.kidefense*=18
						src.strength *= 22
						src.defence *= 19
						src.block += 7
						src.dodge += 7
						src.critical += 2
						src.reflect += 7
						src.counter += 7
						src.speed=src.speed_max-2000
						if(src.speed<1000)
							src.speed=1000
						src.icon_state = ""
						src.Skin_Apply()
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 2300000)
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
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.Big_Aura()
							src.powerlevel *= 29
							src.ki *= 26
							src.kidefense*=26
							src.strength *= 30
							src.defence *= 28
							src.block += 7
							src.dodge += 7
							src.critical += 7
							src.reflect += 7
							src.counter += 7
							src.speed=src.speed_max-3000
							if(src.speed<1000)
								src.speed=1000
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 6000000)
								if(!src.has_tail)
									src << "Your tail was cut off and you can't transform!"
									return
								else
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
									src.overlays -= 'Hair - SSJ3.dmi'
									src.overlays += 'Hair - SSJ4.dmi'
									src.overlays -= src.aura
									src.underlays -= src.underlays
									src.Big_Aura()
									src.overlays -= 'Elec Blue Small.dmi'
									src.overlays += 'Elec Red Big.dmi'
									src.powerlevel *= 36
									src.ki *= 29
									src.kidefense*=29
									src.strength *= 35
									src.defence *= 34
									src.block += 4
									src.dodge += 4
									src.critical += 4
									src.reflect += 4
									src.counter += 4
									src.speed=src.speed_max-4000
									if(src.speed<1000)
										src.speed=1000
									if(src.skin=="dark")
										src.icon = 'Male - SSJ 4 Dark.dmi'
									else
										src.icon = 'Male - SSJ 4.dmi'
									src.icon_state = ""
									src.form_5 = 1
									src.frozen = 0
									src.doing = 0
									return

mob/proc/SSJ_EXP()
	spawn while(1)
		if(src.upkeep>5)
			if(src.race=="Half Saiyan"&&src.form_6)
				goto Skip
			if(src.form_1)
				src.ssj_exp += rand(0.5,1)
				if(src.ssj_exp >= src.ssj_tnl)
					src.ssj_level ++
					src << "\white You feel your body become used to the Super Saiyan form."
					src.ssj_exp = 0
					src.upkeep -= 3
					if(src.upkeep<5)
						src.upkeep=5
						break
			if(src.ki<=src.ki*0.05&&src.form_1)
				src<<"\white Your ki is too low for you to sustain your Super Saiyan Form."
				if(src.race=="Half Saiyan")
					src.HalfSaiyanRevert()
				if(src.race=="Saiyan")
					src.SaiyanRevert()
		Skip
		sleep(100)
mob/proc/FORM1_EXP()
	spawn while(1)
		if(src.upkeep>5)
			if(src.form_1)
				src.form_1_exp += rand(0.5,1)
				if(src.form_1_exp >= src.form_1_tnl)
					src.form_1_level ++
					src << "\white You feel your body become used to your new form."
					src.form_1_exp = 0
					src.upkeep -= 3
					if(src.upkeep<5)
						src.upkeep=5
						break
			if(src.ki<=src.ki*0.05&&src.form_1)
				src<<"\white Your ki is too low for you to sustain your Tranformed state."
				if(src.race=="Human")
					src.HumanRevert()
				if(src.race=="Changeling")
					src.ChanglingRevert()
				if(src.race=="Demon")
					src.DemonRevert()
				if(src.race=="Kai")
					src.KaiRevert()
				if(src.race=="Saibaman")
					src.SaibamanRevert()
		sleep(100)
mob/proc/LSaiyanTrans()
	var/trans_time = src.upkeep / 1.5
	if(src.upkeep == 5)
		trans_time = 5
	if(src.Oozaru)
		return
	if(src.doing)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 100000)
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
				src.powerlevel *= 39
				src.ki *= 24
				src.kidefense*=24
				src.strength *= 30
				src.defence *= 27
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				src.speed=src.speed_max-1000
				if(src.speed<1000)
					src.speed=1000
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.icon_state = ""
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.HHair_Apply()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 500000)
					if(!src.has_tail)
						src << "Your tail was cut off and you can't transform!"
						return
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
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.Big_Aura()
					src.overlays += 'Elec Blue Small.dmi'
					src.powerlevel *= 54
					src.ki *= 39
					src.kidefense*=39
					src.strength *= 51
					src.defence *= 42
					src.block += 3
					src.dodge += 3
					src.critical += 6
					src.reflect += 3
					src.counter += 3
					src.speed=src.speed_max-2000
					if(src.speed<1000)
						src.speed=1000
					src.icon_state = ""
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.overlays -= 'Hair - Goku H.dmi'
					src.overlays -= 'Hair - Gohan H.dmi'
					src.overlays -= 'Hair - Teen Gohan H.dmi'
					src.overlays -= 'Hair - Gohan H.dmi'
					src.overlays -= 'Hair - Vegeta H.dmi'
					src.overlays -= 'Hair - Trunks H.dmi'
					src.overlays -= 'Hair - Raditz H.dmi'
					src.LSSJHair_Apply()
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 1000000)
						if(!src.has_tail)
							src << "Your tail was cut off and you can't transform!"
							return
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
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.Big_Aura()
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.powerlevel *= 72
						src.ki *= 54
						src.kidefense*=54
						src.strength *= 66
						src.defence *= 57
						src.block += 7
						src.dodge += 7
						src.critical += 4
						src.reflect += 7
						src.counter += 7
						src.speed=src.speed_max-3000
						if(src.speed<1000)
							src.speed=1000
						src.icon_state = ""
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.LSSJHair_Apply()
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 2500000)
							if(!src.has_tail)
								src << "Your tail was cut off and you can't transform!"
								return
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
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.Big_Aura()
							src.powerlevel *= 87
							src.ki *= 78
							src.kidefense*=78
							src.strength *= 90
							src.defence *= 84
							src.block += 7
							src.dodge += 7
							src.critical += 7
							src.reflect += 7
							src.counter += 7
							src.speed=src.speed_max-4000
							if(src.speed<1000)
								src.speed=1000
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays += 'Elec Red Big.dmi'
							src.LSSJHair_Apply()
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 6500000)
								if(!src.has_tail)
									src << "Your tail was cut off and you can't transform!"
									return
								else
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
									src.overlays -= src.aura
									src.underlays -= src.underlays
									src.Big_Aura()
									src.overlays -= 'Elec Red Big.dmi'
									src.overlays += 'Elec LSSJ.dmi'
									src.powerlevel *= 108
									src.ki *= 87
									src.kidefense*=87
									src.strength *= 105
									src.defence *= 102
									src.block += 4
									src.dodge += 4
									src.critical += 4
									src.reflect += 4
									src.counter += 4
									src.speed=src.speed_max-4000
									if(src.speed<1000)
										src.speed=1000
									src.icon_state = ""
									src.form_5 = 1
									src.frozen = 0
									src.doing = 0
									src.LSSJHair_Apply()
									return