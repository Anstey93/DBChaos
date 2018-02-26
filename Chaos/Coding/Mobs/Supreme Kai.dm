mob/NPC
	Supreme_Kai
		name = "{NPC}Supreme Kai"
		icon_state = "Supreme Kai"
		density = 1
		safe = 1
		energy_code = 3317954
		New()
			src.CreateName()
		verb/Talk()
			set src in oview(3)
			set category = null
			switch(input("What do you need [usr.name]?","")in list("I want to go to King Kai's","Never Mind"))
				if("Never Mind")
					return
				if("I want to go to King Kai's")
					usr.loc = locate(rand(197,205),rand(354,368),7)