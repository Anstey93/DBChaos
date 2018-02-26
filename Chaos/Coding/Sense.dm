obj/Technique/Sense
	verb
		Sense()
			set category = "Techniques"
			if(usr.spam_delay)
				return
			usr.spam_delay=1
			var/huge = 0
			var/strong = 0
			var/weak = 0
			var/ext = 0
			var/tot=0
			usr << "\cyan You sense:"
			for(var/mob/PC/M in world)
				if(M!=usr)
					tot++
					if(M.powerlevel>=usr.powerlevel*100)
						ext++
					if(M.powerlevel>=usr.powerlevel*50&&M.powerlevel<usr.powerlevel*100)
						huge++
					if(M.powerlevel>=usr.powerlevel*10&&M.powerlevel<usr.powerlevel*50)
						strong++
					if(M.powerlevel<usr.powerlevel)
						weak++
			sleep(10)
			usr<<"\cyan [ext] <font color = red>Extremely Huge Power(s)!"
			usr<<"\cyan [huge] <font color = yellow>Huge Power(s)!"
			usr<<"\cyan [strong] <font color = green>Strong Power(s)!"
			usr<<"\cyan [weak] <font color = white>Weak Power(s)!"
			if(tot)
				usr<<"\cyan You are more powerful than [round((weak/tot)*100)]% of the players online.</font>"
				usr<<""
			spawn(25)usr.spam_delay=0
			return