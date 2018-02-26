obj/Gravity_Room_Gen_II
	icon = 'Gravity Well.dmi'
	density = 1
	Gravity_Well_1
		icon_state = "1"
	Gravity_Well_2
		icon_state = "2"
	Gravity_Well_3
		icon_state = "3"
	Gravity_Well_4
		icon_state = "4"
	Gravity_Well_5
		icon_state = "5"
	Gravity_Well_6
		icon_state = "6"
	Gravity_Well_7
		icon_state = "7"
	Gravity_Well_8
		icon_state = "8"
	Gravity_Well_9
		icon_state = "9"
	Gravity_Well_10
		icon_state = "10"
		density = 0
		layer = 8
	Gravity_Well_11
		icon_state = "11"
		density = 0
		layer = 8
	Gravity_Well_12
		icon_state = "12"
		density = 0
		layer = 8
	Gravity_Control_Gen_II
		verb/Log_On_Computer()
			set category = "Gravity Well"
			set name = "Gravity Control"
			set src in oview(8)
			if(usr.grav_delay)
				usr << "You must wait a moment"
				return
			usr.grav_delay = 1
			var/grav_input = input("What amount of Gravity do you Wish to Train under?","Gravity Training") as num

			if(src in oview(8))
				if(grav_input < 1)
					if(usr.grav >= 1)
						usr << "You turn the Gravity Off"
						usr.grav = 0
						spawn(40)usr.grav_delay = 0
					else
						usr.grav_delay = 1
						usr.grav = 0
						spawn(40)usr.grav_delay = 0
				else
					if(usr.grav >= 1)
						usr << "Gravity is already on. You must turn it off by entering 0"
						return
					else
						if(grav_input > 1200)
							usr << "Gravity cannot exceed x1200"
							spawn(40)usr.grav_delay = 0
						else
							if(grav_input < 0)
								usr << "Gravity cannot be below x0"
								spawn(40)usr.grav_delay = 0
							else
								usr.grav_delay = 1
								usr.grav = grav_input
								usr << "Gravity switched onto x[round(grav_input)]"
								spawn(5)usr.Gravity_Strain()
								spawn(40)usr.grav_delay = 0