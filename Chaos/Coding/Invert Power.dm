obj/Technique/InvertPower
	verb/Invert_Power()
		set category = "Combat"
		if(usr.doing)
			return
		if(usr.kaioken)
			return
		if(usr.KO)
			return
		else
			if(!usr.form_1)
				if(!usr.inverted)
					if(usr.powerlevel_max >= 750000)
						if(usr.legendarysword)
							usr<<"You cannot transform while wielding the Legendary Sword."
							return
						usr.inverted = 1
						usr.safe = 1
						usr.doing = 1
						usr.icon_state = "enrage"
						if(usr.trans1t!="")
							view(8)<<"\white[usr]: \font [usr.trans1t]"
						usr.frozen = 1
						sleep(20)
						usr.critical = usr.critical_max
						usr.dodge = usr.dodge_max
						usr.reflect = usr.reflect_max
						usr.block = usr.block_max
						usr.powerlevel *= 18
						usr.ki *= 18
						usr.kidefense*=18
						usr.strength *= 18
						usr.defence *= 18
						usr.block += 9
						usr.dodge += 10
						usr.critical += 12
						usr.reflect += 9
						usr.counter += 8
						usr.speed=usr.speed_max-3000
						if(usr.speed<1000)
							usr.speed=1000
						usr.icon_state = ""
						if(usr.crater_on)
							new/obj/techs/Overlays/Crater_Center(usr.loc)
						usr.overlays += 'Elec White.dmi'
						usr.frozen = 0
						usr.doing = 0
						usr.safe = 0
						return
				else
					usr.doing=1
					usr.InvertRevert()
			else
				usr << "You cannot invert in a transformed state."
				return
mob/proc/InvertRevert()
	if(src.KO)
		return
	if(src.inverted)
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.inverted = 0
		src.aura_on = 0
		src.underlays -= aura
		src.overlays -= 'Elec White.dmi'
		src.Power_Redefine()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		src.doing = 0
		src.trans_delay = 0
		return
	else
		return