mob/var/Oozaru = 0
mob/var/has_tail = 1
obj
	Tech
		FakeMoon
			icon='Techs.dmi'
			icon_state="fakemoon"
			layer=9999
			New()
				..()
				spawn(50)del(src)
				src.range=0
				spawn(1)
					while(src.range<7)
						step(src,NORTH)
						src.range+=1
						sleep(2)
obj/Technique/FakeMoon
	verb/Fake_Moon()
		set category = "Techniques"
		if(usr.doing)
			src << "You are already doing something!"
			return
		if(usr.fused)
			return
		if(!usr.has_tail)
			return
		else
			if(!usr.form_1)
				if(!usr.Oozaru)
					usr.doing = 1
					usr.icon_state = "attack"
					usr.overlays+=icon('Techs.dmi',"fakemoono")
					view(8) << "[usr.name] starts charging up a ball of energy..."
					usr.frozen = 1
					sleep(25)
					view(8) << "[usr.name] shoots the energy ball up at the sky..."
					usr.icon_state = ""
					usr.overlays-=icon('Techs.dmi',"fakemoono")
					var/obj/Tech/FakeMoon/F=new
					F.loc=usr
					F.power=1
					sleep(10)
					if(!F)
						usr.doing = 0
						usr.frozen=0
						usr.icon_state=""
						return
					usr.icon_state = "enrage"
					sleep(25)
					if(!F)
						usr.doing = 0
						usr.frozen=0
						usr.icon_state=""
						return
					usr.powerlevel = usr.powerlevel_max
					usr.ki = usr.ki_max
					usr.kidefense=usr.kidefense_max
					usr.strength = usr.strength_max
					usr.defence = usr.defence_max
					usr.critical = usr.critical_max
					usr.dodge = usr.dodge_max
					usr.reflect = usr.reflect_max
					usr.block = usr.block_max
					usr.powerlevel *= 3
					usr.ki *= 2.5
					usr.kidefense*=2.5
					usr.strength *= 2
					usr.defence *= 2
					usr.block += 2
					usr.dodge += 4
					usr.critical += 2
					usr.reflect += 4
					usr.counter += 3
					usr.speed-=1000
					if(usr.speed<1000)
						usr.speed=1000
					usr.overlays -= usr.overlays
					usr.overlays -= usr.aura
					view(8) << "<font color = #996600>[usr.name] screams out loud as fur sprouts out of his body and he turns Oozaru!"
					usr.icon = 'Oozaru.dmi'
					usr.icon_state = ""
					usr.overlays += new/obj/techs/Overlays/Oozaru_top
					usr.Oozaru = 1
					usr.frozen = 0
					usr.doing = 0
					return
				else
					if(usr.Oozaru)
						usr.Oozaru_Revert()
						return
			else
				if(usr.race == "Saiyan" && usr.form_4 && !usr.form_5 && usr.powerlevel_max >= 3500000)
					if(!usr.Oozaru)
						usr.doing = 1
						usr.icon_state = "enrage"
						view(8) << "[usr.name] shoots a blast up in the sky..."
						usr.frozen = 1
						sleep(35)
						usr.powerlevel = usr.powerlevel_max
						usr.ki = usr.ki_max
						usr.kidefense=usr.kidefense_max
						usr.strength = usr.strength_max
						usr.defence = usr.defence_max
						usr.critical = usr.critical_max
						usr.dodge = usr.dodge_max
						usr.reflect = usr.reflect_max
						usr.block = usr.block_max
						usr.powerlevel *= 33
						usr.ki *= 27
						usr.kidefense*=27
						usr.strength *= 32
						usr.defence *= 32
						usr.block += 8
						usr.dodge -= 10
						usr.critical += 13
						usr.reflect += 10
						usr.counter += 8
						usr.speed=usr.speed_max-3000
						if(usr.speed<1000)
							usr.speed=1000
						usr.overlays -= usr.overlays
						view(8) << "<font color = #FFFF00>[usr.name] screams out loud as golden fur sprouts out of his body and he turns Golden Oozaru!"
						usr.icon = 'GOozaru2.dmi'
						usr.icon_state = ""
						usr.overlays += new/obj/techs/Overlays/GOozaru_top
						usr.Oozaru = 1
						usr.frozen = 0
						usr.doing = 0
						return
					else
						if(usr.Oozaru)
							usr.Oozaru_Revert()
							return

mob
	proc
		OozaruTrans()
			if(src.fused)
				return
			if(!src.has_tail)
				return
			if(!src.form_1)
				if(!src.Oozaru)
					src.doing+=1
					src.icon_state = "enrage"
					view(8)<<"[src.name] starts to stare at the moon..."
					src.frozen+=1
					sleep(25)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.powerlevel *= 3
					src.ki *= 2.5
					src.kidefense*=2.5
					src.strength *= 2
					src.defence *= 2
					src.block += 2
					src.dodge += 4
					src.critical += 2
					src.reflect += 4
					src.counter += 3
					usr.speed-=1000
					if(usr.speed<1000)
						usr.speed=1000
					src.overlays -= src.overlays
					src.overlays -= src.aura
					view(8)<<"<font color = #996600>[src.name] screams out loud as fur sprouts out of his body and he turns Oozaru!"
					src.icon = 'Oozaru.dmi'
					src.icon_state = ""
					src.overlays += new/obj/techs/Overlays/Oozaru_top
					src.Oozaru=1
					src.frozen-=1
					src.doing-=1
					return
mob/proc/Oozaru_Revert()
	if(src.doing)
		src << "You are already doing something!"
		return
	if(src.Oozaru)
		src.doing = 1
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.Oozaru = 0
		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.doing  = 0
		src.frozen = 0
		src.overlays -= src.overlays
		src.underlays -= src.underlays
		if(src.race == "Saiyan" && src.has_tail)
			src.overlays += 'Tail.dmi'
		src.Power_Redefine()
		src.Skin_Apply()
		src.Hair_Apply()
		oview() << "[src.name] begins to shrink down to his normal size."
		src.boxing = 0
		src.dualtrain = 0
		src.rest = 0
		src.doing = 0
		src.icon_state = ""
		src.frozen = 0
		if(!src.skin)
			src.skin="tan"
			src.Skin_Apply()
			src<<"<font color=red>Your skin as been set to Tan. If this wasn't your characters skin ask a GM for help."
		return
mob/proc/Forced_Oozaru_Revert()
	if(src.Oozaru)
		src.doing=1
		src.frozen=1
		sleep(10)
		src.Oozaru = 0
		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.overlays -= src.overlays
		src.underlays -= src.underlays
		if(src.race == "Saiyan" && src.has_tail)
			src.overlays += 'Tail.dmi'
		src.Power_Redefine()
		src.Skin_Apply()
		src.Hair_Apply()
		oview() << "[src.name] begins to shrink down to his normal size."
		src.boxing = 0
		src.dualtrain = 0
		src.rest = 0
		src.doing=0
		src.icon_state = ""
		src.frozen=0
		return
	else
		if(src.form_1)
			src.frozen = 1
			src.doing = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.form_5 = 0
			src.overlays -= src.aura
			src.aura = 0
			src.overlays -= 'Elec Blue Small.dmi'
			src.overlays -= 'Elec Blue Big.dmi'
			src.overlays -= 'Elec Red Big.dmi'
			src.overlays -= 'Elec White.dmi'
			src.overlays -= 'Hair - SSJ3.dmi'
			src.overlays -= 'Hair - SSJ4.dmi'
			src.overlays -= 'Hair - SSJ4(fused).dmi'
			src.overlays -= 'ssj4tail.dmi'
			src.Power_Redefine()
			src.Skin_Apply()
			src.Hair_Apply()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.boxing = 0
			src.dualtrain = 0
			src.rest = 0
			src.doing = 0
			src.icon_state = ""
			src.frozen = 0
			return