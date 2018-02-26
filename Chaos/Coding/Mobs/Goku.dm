mob
	NPC
		Goku
			name = "{NPC}Goku"
			icon_state="Goku"
			density = 1
			safe = 1
			energy_code = 2290876
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.level>=600&&!usr.learn_afterimage)
						usr.learn_afterimage=1
						usr.contents+=new/obj/Technique/AfterImage
						usr<<"<center>\white .:: You learn After Image ::."
						usr.talking=0
						return
					if(usr.race=="Saiyan")
						if(usr.level>=1200&&!usr.learn_dragonfist)
							usr.learn_dragonfist=1
							usr.contents+=new/obj/Technique/DragonFist
							usr<<"<center>\white .:: You learn Dragon Fist ::."
							usr.talking=0
							return
					if(usr.level<600)
						usr<<"\white Goku:\font Get to level 600 and I'll teach you something."
						return
					if(usr.race=="Saiyan")
						if(usr.level<1200)
							usr<<"\white Goku:\font Get to level 1200 and I'll teach you something."
							return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Goku"
						else
							return