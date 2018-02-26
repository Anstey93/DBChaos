obj/Props/Plants
	icon = 'Plants.dmi'
	name = ""

	Tree_1_1
		icon_state = "tree 1-1"
		density = 0
		layer = 12
	Tree_1_2
		icon_state = "tree 1-2"
		density = 0
		layer = 12
	Tree_1_3
		icon_state = "tree 1-3"
		density = 1
	Tree_1_4
		icon_state = "tree 1-4"
		density = 1

	Tree_2_1
		icon_state = "tree 2-1"
		density = 0
		layer = 12
	Tree_2_2
		icon_state = "tree 2-2"
		density = 0
		layer = 12
	Tree_2_3
		icon_state = "tree 2-3"
		density = 1
	Tree_2_4
		icon_state = "tree 2-4"
		density = 1

	Potted_Plant_1_1
		icon_state = "potted plant 1-1"
		density = 0
		layer = 12
	Potted_Plant_1_2
		icon_state = "potted plant 1-2"
		density = 1

	Flowers_1
		icon_state = "flowers 1"
		density = 0
	Flowers_2
		icon_state = "flowers 2"
		density = 0

	Rose_Bush
		icon_state = "rose bush"
		density = 1
	Bush
		icon_state = "bush"
		density = 1

	Rock
		icon_state = "rock"
		density = 1

	Rock2
		icon_state = "rock 2"
		density = 1

	Roshi_Rock
		icon_state = "roshi rock"
		density = 1

turf/Props
	Roshi_Rock_Verb
		verb
			Grab_Rock()
				set src in oview(2)
				set category = "Actions"

				if(!usr.got_rock)
					usr << "You pickup the Rock thrown by Master Roshi"
					usr.got_rock = 1
				else
					return