turf/Other/KingKai_Jump
	verb
		Jump()
			set src in oview(8)
			set category = null
			if(prob(99))
				usr << "You managed to jump to King Kai's Planet safely"
				usr.loc = locate(207,348,7)
			else
				usr << "You just miss King Kai's Planet and fall down to HFIL"
				usr.loc = locate(98,243,7)


turf/SnakeWay
	icon = 'Snake Way.dmi'

	Clouds
		name = "Clouds"
		density = 1
		icon_state = "clouds"
		Enter(var/mob/M)
			M << "You fall down through the clouds to HFIL"
			M.loc = locate(98,243,7)
			return

	Planet
		name = ""
		density = 1
		icon_state = "planet"

	SnakeWay1
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 1"
	SnakeWay2
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 2"
	SnakeWay3
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 3"
	SnakeWay4
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 4"
	SnakeWay5
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 5"
	SnakeWay6
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 6"
	SnakeWay7
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 7"
	SnakeWay8
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 8"
	SnakeWay9
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 9"