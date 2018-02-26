mob
	NPC
		GokuSSJ3
			name = "{NPC}Goku SSJ3"
			icon_state="GokuSSJ3"
			density = 1
			safe = 1
			energy_code = 3944826
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null

					if(usr.race=="Saiyan")
						if(usr.level>=18000&&!usr.learn_dragonfist)
							usr.learn_dragonfist=1
							usr.contents+=new/obj/Technique/DragonFist
							usr<<"<center>\white .:: You learn Dragon Fist ::."
							usr.talking=0
							return
					if(usr.race=="Saiyan")
						if(usr.level<18000)
							usr<<"\white Goku SSJ3:\font Get to level 1200 and I'll teach you something."
							return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Goku"
						else
							return