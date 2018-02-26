mob/proc/AndroidTrans()
	if(src.doing)
		return
	if(src.cant_trans)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 6000000  && src.chips >= 30)
				src.cant_trans = 1
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.frozen = 1
				sleep(25)
				for(var/obj/Technique/InvertPower/T in src)
					del(T)
				src.powerlevel_max *= 7.5
				src.ki_max *= 8.5
				src.kidefense_max *= 8.5
				src.strength_max *= 8.5
				src.defence_max *= 8.5
				if(src.speed_max>2000)
					src.speed_max=2000
					src.speed=2000
				src.overlays += 'Elec Light Blue.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.critical_max += rand(6,10)
				src.dodge_max += rand(6,10)
				src.reflect_max += rand(6,10)
				src.block_max += rand(6,10)
				src.counter_max += rand(6,10)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.kidefense=src.kidefense_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.icon_state = ""
				src.form_1 = 1
				src.icon = 'AndroidForm2.dmi'
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				src.trans_delay=0
				src.spam_delay=0
				spawn(40) src.cant_trans = 0
				return
		else
			if(!src.form_2)
				if(!src.doing)
					if(!src.cant_trans)
						if(src.powerlevel_max >= 70000000  && src.chips >= 50)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans2t!="")
								view(8)<<"\white[src]: \font [src.trans2t]"
							src.frozen = 1
							sleep(30)
							for(var/obj/Transform/Transform/T in src)
								del(T)
							if(src.crater_on)
								new/obj/techs/Overlays/Crater_Center(src.loc)
							src.powerlevel_max *= 6
							src.ki_max *= 8
							src.kidefense_max*=8
							src.strength_max *= 10
							src.defence_max *= 7
							if(src.speed_max>1000)
								src.speed_max=1000
							src.speed=1000
							src.critical_max += rand(8,10)
							src.dodge_max += rand(8,10)
							src.reflect_max += rand(8,10)
							src.block_max += rand(8,10)
							src.counter_max += rand(8,10)
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.overlays -= 'Elec Light Blue.dmi'
							src.powerlevel = src.powerlevel_max
							src.ki = src.ki_max
							src.kidefense=src.kidefense_max
							src.strength = src.strength_max
							src.defence = src.defence_max
							src.overlays += 'androidelec.dmi'
							src.overlays -= src.hair
							src.overlays -= src.hair
							src.overlays -= src.hair
							src.overlays -= src.hair
							src.overlays -= src.hair_icon
							src.overlays -= src.hair_icon
							src.overlays -= src.hair_icon
							src.overlays += 'Hair - Android.dmi'
							src.icon_state = ""
							src.form_2 = 1
							src.icon = 'AndroidForm3.dmi'
							src.frozen = 0
							src.doing = 0
							src.spam_delay=0
							src.trans_delay=0
							src.safe = 0
							return