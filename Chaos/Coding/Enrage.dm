obj/Technique/UnleashRage
	verb
		Unleash_Rage()
			set category = "Techniques"
			if(usr.FuseFollower)
				return
			if(usr.kaioken)
				usr << "Your body is under too much stress!"
				return
			if(usr.form_2)
				usr << "Your body is enraged from Transforming!"
				return
			if(usr.rage >= 15)
				if(usr.enraged)
					usr << "You are already enraged!"
					return
				else
					usr.enraged = 1
					usr << "You feel an Uncontrollable Rage burn through your body!"
					usr.icon_state = "enrage"
					sleep(25)
					var/bonus = usr.powerlevel_max*(usr.rage / 10)
					usr.powerlevel += bonus
					usr.icon_state = ""
					sleep(300)
					usr.enraged = 0
					usr.rage = 0
					usr.powerlevel -= bonus
					usr << "You calm down..."
			else
				usr << "You don't have enough Rage..."
				return