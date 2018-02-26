mob
	var
		spacetravel=0
turf
	Space
		icon = 'Stars.dmi'
		name = ""
		Stars
			icon_state="stars"
		Stars1
			icon_state = "space"
		Stars2
			icon_state = "space2"
		PodWindow1
			icon_state = "window"
		PodWindow2
			icon_state = "window2"
		PlanetEarth
			icon='Earth.png'
		//	icon_state = "earth"
		PlanetNamek
			icon_state = "namek"
		PlanetVegeta
			icon_state = "vegeta"
		PlanetYardrat
			icon_state = "yardrat"
		SpaceLimitL
			Enter(mob/M)
				if(istype(M,/mob)||istype(M,/obj))
					M.x=390
		SpaceLimitR
			Enter(mob/M)
				if(istype(M,/mob)||istype(M,/obj))
					M.x=10
		SpaceLimitU
			Enter(mob/M)
				if(istype(M,/mob)||istype(M,/obj))
					M.y=10
		SpaceLimitD
			Enter(mob/M)
				if(istype(M,/mob)||istype(M,/obj))
					M.y=390
obj
	Spaceship
		SpacePod
			name="Space Pod"
			icon='Stars.dmi'
			icon_state="travelpod"
			density=1
			var
				travel=0
				podspeed=1
			Click()
				..()
				if(usr in src)
					return
				for(var/mob/M in src)
					usr<<"[M] is using this space pod."
					return
				var/PZ=usr.z
				usr.spacetravel=1
				usr.loc=src
				src.owner=usr
				src.StartTravel(PZ)
			proc
				StartTravel(var/Z)
					src.density=0
					src.icon_state="podgo"
					sleep(10)
					var/D=15
					spawn(1)
						while(D)
							D-=1
							step(src,NORTH)
							if(D<=0)
								for(var/mob/M in src)
									if(Z==1)
										src.loc=locate(54,rand(336,348),9)
										if(prob(33))
											src.dir=NORTH
										else
											if(prob(50))
												src.dir=SOUTH
											else
												src.dir=EAST
									if(Z==2)
										src.loc=locate(288,rand(278,288),9)
										if(prob(33))
											src.dir=NORTH
										else
											if(prob(50))
												src.dir=SOUTH
											else
												src.dir=WEST
									if(Z==3)
										src.loc=locate(105,rand(172,181),9)
										if(prob(33))
											src.dir=NORTH
										else
											if(prob(50))
												src.dir=SOUTH
											else
												src.dir=EAST
									if(Z==4)
										src.loc=locate(257,rand(61,181),9)
										if(prob(33))
											src.dir=NORTH
										else
											if(prob(50))
												src.dir=SOUTH
											else
												src.dir=WEST
									src.density=1
									src.travel=1
									spawn(10)src.TravelSpace()
							sleep(1)
				TravelSpace()
					step(src,src.dir)
					spawn(src.podspeed)src.TravelSpace()