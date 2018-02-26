mob
	NPC
		Videl
			name = "{NPC}Videl"
			icon_state = "Videl"
			density = 1
			safe = 1
			energy_code = 2245332

			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category=null
					usr.underlays -= usr.aura
					switch(input("Videl: What do you need?")in list("Change my Aura color","Never Mind"))
						if("Never Mind")
							return
						if("Change my Aura color")
							if(usr.learn_aura)
								usr.underlays-=usr.underlays
								usr.overlays -= usr.aura
								usr.aura_on = 0
								var/hr = input("How much Red do you want to put?") as num
								var/hg = input("How much Green do you want to put?") as num
								var/hb = input("How much Blue do you want to put?") as num
								usr.aura = 'Aura.dmi'
								usr.aura += rgb(hr,hg,hb)
							else
								usr << "<vont color = white>Videl:</font> You must first master your Aura before you can change it's colors!"
								return