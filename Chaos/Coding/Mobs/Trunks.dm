mob
	NPC
		Trunks
			name = "{NPC}Trunks"
			icon_state="Trunks"
			density = 1
			safe = 1
			energy_code = 7854849
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.race=="Half Saiyan")
						if(usr.level>=250&&!usr.learn_finishbuster)
							usr.learn_finishbuster=1
							usr.contents+=new/obj/Technique/FinishBuster
							usr<<"<center>\white .:: You learn Finish Buster ::."
							return
						if(usr.level>=400&&!usr.learn_burningattack)
							usr.learn_burningattack=1
							usr.contents+=new/obj/Technique/BurningAttack
							usr<<"<center>\white .:: You learn Burning Attack ::."
							return
						if(usr.level<250)
							usr<<"\white Trunks:\font Get to level 250 and I'll teach you something."
							return
						if(usr.level<400)
							usr<<"\white Trunks:\font Get to level 400 and I'll teach you something."
							return
					else
						usr<<"\white Trunks:\font How are you doing?"
						return