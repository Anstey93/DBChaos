
mob
	NPC
		Tien
			icon_state = "Tien"
			name = "{NPC}Tien"
			density = 1
			safe = 1
			energy_code = 8876976
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(3)
					set category = null
					if(usr.level>=50&&!usr.learn_splitform)
						usr.learn_splitform=1
						usr.contents+=new/obj/Technique/SplitForm
						usr<<"<center>\white .: You learn Split Form :."
						usr.talking=0
						return
					if(usr.level>=150&&!usr.learn_solarflare)
						usr.learn_solarflare=1
						usr.contents+=new/obj/Technique/SolarFlare
						usr<<"<center>\white .: You learn Solar Flare :."
						usr.talking=0
						return
					if(usr.race=="Human")
						if(usr.level>=500&&!usr.learn_tribeam)
							usr.learn_tribeam=1
							usr.contents+=new/obj/Technique/TriBeam
							usr<<"<center>\white .: You learn Tri Beam :."
							usr.talking=0
							return
					if(usr.level<50)
						usr<<"\white Tien:\font Get to level 150 and I'll teach you something."
						return
					if(usr.level<150)
						usr<<"\white Tien:\font Get to level 750 and I'll teach you something."
						return
					if(usr.race=="Human")
						if(usr.level<500)
							usr<<"\white Tien:\font Get to level 1200 and I'll teach you something."
							return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Tien"
						else
							return