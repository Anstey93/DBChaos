mob/var/KO = 0
mob/proc
	KO()
		if(src.powerlevel <= 0)
			if(!src.KO)
				view() << "[src.name] has been knocked out!"
				src.KO = 1
				src.frozen = 1
				src.sight |= BLIND
				src.overlays -= 'Kaio Aura.dmi'
				src.kaioken = 0
				src.Power_Redefine()
				sleep(70)
				src.KO = 0
				src.frozen = 0
				src.sight &= ~BLIND
				src.powerlevel = 1+(src.powerlevel_max/100)
				src << "You wake up!"
				return
		else
			return
	Tired_KO()
		if(src.staminaleft >= src.staminaleft_max)
			src.staminaleft = src.staminaleft_max
			view(8)<<"[src.name] has been knocked out!"
			src.KO = 1
			src.frozen = 1
			src.overlays -= 'Kaio Aura.dmi'
			src.kaioken = 0
			src.Power_Redefine()
			src.sight |= BLIND
			sleep(70)
			src.KO = 0
			src.frozen = 0
			src.sight &= ~BLIND
			src << "You wake up!"
			return
		else
			return