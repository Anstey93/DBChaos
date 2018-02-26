obj/Props/Space_Pod
	icon = 'Space Pod.dmi'
	name = ""

	Space_Pod_1_1
		icon_state = "pod 1-1"
		density = 0
		layer = 12
	Space_Pod_1_2
		icon_state = "pod 1-2"
		density = 0
		layer = 12
	Space_Pod_1_3
		icon_state = "pod 1-3"
		density = 0
		layer = 12
	Space_Pod_1_4
		icon_state = "pod 1-4"
		density = 0
		layer = 12
	Space_Pod_1_5
		icon_state = "pod 1-5"
		density = 1
	Space_Pod_1_6
		icon_state = "pod 1-6"
		density = 1
	Space_Pod_1_7
		icon_state = "pod 1-7"
		density = 1
	Space_Pod_1_8
		icon_state = "pod 1-8"
		density = 1
	Space_Pod_1_9
		icon_state = "pod 1-9"
		density = 1
	Space_Pod_2_1
		icon_state = "pod 2-1"
		density = 1
	Space_Pod_2_2
		icon_state = "pod 2-2"
		density = 1
	Space_Pod_2_3
		icon_state = "pod 2-3"
		density = 1
	Space_Pod_2_4
		icon_state = "pod 2-4"
		density = 0
	Space_Pod_2_5
		icon_state = "pod 2-5"
		density = 0
	Space_Pod_2_6
		icon_state = "pod 2-6"
		density = 0
	Space_Pod_2_7
		icon_state = "pod 2-7"
		density = 0
	Pod1
		icon = 'Stars.dmi'
		icon_state = "travelpod"
		density = 1
	Pod2
		icon = 'Stars.dmi'
		icon_state = "travelpod"
		density = 1
	Pod3
		icon = 'Stars.dmi'
		icon_state = "podgo"
		density = 1

turf/Passages/SpacePod
	Travel_from_Earth
		density = 1
		Enter(mob/PC/M)
			if(!M.client)return
			for(var/obj/O in M)
				if(O.dball)
					M<<"You can't travel with the dragonballs."
					return
			switch(input("Where do you wish to Travel to?")in list("Namek","Planet Vegeta","Yardrat"))
				if("Namek")
					if(prob(50))
						M.loc=locate(192,265,2)
					else
						M.loc=locate(89,96,2)
				if("Planet Vegeta")
					M.loc=locate(rand(299,333),301,3)
				if("Yardrat")
					M.loc=locate(148,270,4)
	Travel_From_Namek
		density = 1
		Enter(mob/PC/M)
			if(!M.client)return
			for(var/obj/O in M)
				if(O.dball)
					M<<"You can't travel with the dragonballs."
					return
			switch(input("Where do you wish to Travel to?")in list("Earth","Planet Vegeta","Yardrat"))
				if("Earth")
					if(prob(50))
						M.loc=locate(215,106,1)
					else
						M.loc=locate(66,31,1)
				if("Planet Vegeta")
					M.loc=locate(rand(299,333),301,3)
				if("Yardrat")
					M.loc=locate(148,270,4)
	Travel_From_Vegita
		name = "Space Pod"
		density = 1
		Enter(mob/PC/M)
			if(!M.client)return
			for(var/obj/O in M)
				if(O.dball)
					M<<"You can't travel with the dragonballs."
					return
			switch(input("Where do you wish to Travel to?")in list("Earth","Namek","Yardrat"))
				if("Namek")
					if(prob(50))
						M.loc=locate(192,265,2)
					else
						M.loc=locate(89,96,2)
				if("Earth")
					if(prob(50))
						M.loc=locate(215,106,1)
					else
						M.loc=locate(66,31,1)
				if("Yardrat")
					M.loc=locate(148,270,4)
	Travel_From_Yardrat
		name = "Space Pod"
		density = 1
		Enter(mob/PC/M)
			if(!M.client)return
			for(var/obj/O in M)
				if(O.dball)
					M<<"You can't travel with the dragonballs."
					return
			switch(input("Where do you wish to Travel to?")in list("Earth","Namek","Planet Vegeta"))
				if("Namek")
					if(prob(50))
						M.loc=locate(192,265,2)
					else
						M.loc=locate(89,96,2)
				if("Earth")
					if(prob(50))
						M.loc=locate(215,106,1)
					else
						M.loc=locate(66,31,1)
				if("Planet Vegeta")
					M.loc=locate(148,270,4)