mob/var/kaioken = 0
obj/Technique/Kaioken
	verb/Kaioken()
		set category = "Techniques"
		if(usr.dead)
			usr << "You are dead."
			return
		if(usr.doing)
			usr << "You are already doing something."
			return
		if(usr.rest)
			usr<<"You must stop resting."
			return
		if(usr.form_1)
			usr << "Your body cannot handle the stress of Kaioken!"
			return
		if(usr.inverted)
			usr << "Your body cannot handle the stress of Kaioken!"
			return
		var/kaioken_limit = 50
		if(usr.race == "Half Majin" || usr.race == "Bio-Android" || usr.race == "Namekian" || usr.race == "Majin" || usr.race == "Tuffle")
			kaioken_limit = 100
		if(usr.race == "Dragon")
			kaioken_limit = 150
		var/kaioken_bonus = input("What is the level of your Kaioken? ([kaioken_limit] is Max)") as num | null
		if(usr.doing)
			usr << "You are busy doing something!"
			return
		usr.doing = 1
		if(!kaioken_bonus)
			usr << "You relax your Kaioken state"
			usr.kaioken = 0
			usr.overlays -= 'Kaio Aura.dmi'
			usr.doing = 0
			usr.Power_Redefine()
			return
		if(usr.kaioken)
			usr << "You are already using Kaioken. Reset it by Entering 0"
			usr.doing = 0
			return
		if(kaioken_bonus < 0)
			usr << "You cannot enter a negative value!"
			usr.doing = 0
			return
		if(kaioken_bonus > kaioken_limit)
			view(8) << "<font color = red>[src] collapses from the strain of Kaioken!"
			usr.kaioken = 0
			usr.overlays -= 'Kaio Aura.dmi'
			usr.doing = 0
			usr.sight |= BLIND
			usr.Power_Redefine()
			sleep(90)
			usr.sight &= ~BLIND
			return
		else
			if(usr.form_1)
				usr << "Your body cannot handle the stress of Kaioken!"
				return
			if(usr.inverted)
				usr << "Your body cannot handle the stress of Kaioken!"
				return
			if(kaioken_bonus == kaioken_limit)
				usr.icon_state = "enrage"
				usr.frozen = 1
				usr.doing = 1
				usr.kaioken = 1
				view(8) << "<B><font color = white>[usr]:</font> \red Super Kaioken!"
				sleep(20)
				usr.icon_state = ""
				usr.frozen = 0
				usr.doing = 0
				usr.powerlevel += (rand(300,600)+(usr.powerlevel_max * (kaioken_bonus / 32)))
				usr.ki += (rand(300,600)+(usr.ki_max * (kaioken_bonus / 32)))
				usr.overlays += 'Kaio Aura.dmi'
				usr.speed=usr.speed_max-1000
				if(usr.speed<1000)
					usr.speed=1000
				usr.strength += (rand(300,600)+(usr.strength_max * (kaioken_bonus / 32)))
				usr.defence += (rand(300,600)+(usr.defence_max * (kaioken_bonus / 32)))
				usr.Kaio_Strain()
			else
				if(kaioken_bonus >= 1)
					usr.icon_state = "enrage"
					usr.frozen = 1
					usr.doing = 1
					usr.kaioken = 1
					view(8) << "<B><font color = white>[usr]:</font> \red Kaioken times [kaioken_bonus]!"
					sleep(15)
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.powerlevel += (rand(300,600)+(usr.powerlevel_max * (kaioken_bonus / 32)))
					usr.ki += (rand(300,600)+(usr.ki_max * (kaioken_bonus / 32)))
					usr.overlays += 'Kaio Aura.dmi'
					usr.speed=usr.speed_max-1000
					if(usr.speed<1000)
						usr.speed=1000
					usr.strength += (rand(300,600)+(usr.strength_max * (kaioken_bonus / 32)))
					usr.defence += (rand(300,600)+(usr.defence_max * (kaioken_bonus / 32)))
					usr.Kaio_Strain()
		return
mob/proc/Kaio_Strain()
	if(src.staminaleft > src.staminaleft_max)
		src.staminaleft = src.staminaleft_max
	if(!src.kaioken)
		src.kaioken = 0
		return
	else
		src.staminaleft += 2.3
		if(src.staminaleft >= src.staminaleft_max)
			view(8) << "<font size = -1><B><font color = red>[src]'s collapses from the strain of Kaioken!"
			src.overlays -= 'Kaio Aura.dmi'
			src.kaioken = 0
			src.KO=1
			src.frozen=1
			src.doing=1
			src.sight |= BLIND
			src.Power_Redefine()
			sleep(100)
			src.KO=0
			src.frozen=0
			src.doing=0
			src.sight &= ~BLIND
		else
			spawn(40)src.Kaio_Strain()