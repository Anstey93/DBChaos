turf/Earth
	icon = 'Island Edge.dmi'
	Island_Edge_001
		icon_state = "001"
		density = 1
	Island_Edge_002
		icon_state = "002"
		density = 1
	Island_Edge_003
		icon_state = "003"
		density = 1
	Island_Edge_004
		icon_state = "004"
		density = 1
	Island_Edge_005
		icon_state = "005"
		dbable=1
	Island_Edge_006
		icon_state = "006"
		density = 1
	Island_Edge_007
		icon_state = "007"
		density = 1
	Island_Edge_008
		icon_state = "008"
		density = 1
	Island_Edge_009
		icon_state = "009"
		density = 1
	Island_Edge_010
		icon_state = "010"
		density = 1
	Island_Edge_011
		icon_state = "011"
		density = 1
	Island_Edge_012
		icon_state = "012"
		density = 1
	Island_Edge_013
		icon_state = "013"
		density = 1
	Island_Edge_014
		icon_state = "014"
		density = 1
	Island_Edge_015
		icon_state = "015"
		density = 1
	Island_Edge_016
		icon_state = "016"
		density = 1
	Island_Edge_017
		icon_state = "017"
		density = 1
	Island_Edge_018
		icon_state = "018"
		density = 1
	Island_Edge_019
		icon_state = "019"
		density = 1
	Grass_Edge_1
		name = ""
		icon_state = "grass edge 1"
	Grass_Edge_2
		name = ""
		icon_state = "grass edge 2"
	Grass_Edge_3
		name = ""
		icon_state = "grass edge 3"
	Grass_Edge_4
		name = ""
		icon_state = "grass edge 4"
	Spike
		name = "spike"
		icon_state = "spike"
		density = 1
	Rock
		name = ""
		icon_state = "rock"
	Dead_Grass
		name = ""
		icon_state = "dead"
		dbable=1
	Water_Fall
		name = ""
		layer = 50
		icon_state = "wover"

turf/Trees
	icon = 'Trees.dmi'
	PalmTree1
		icon_state = "palm tree 1"
		layer = 5
	PalmTree2
		icon_state = "palm tree 2"
		layer = 5
	PalmTree3
		icon_state = "palm tree 3"
		layer = 5
	PalmTree4
		icon_state = "palm tree 4"
		layer = 5
	PalmTree5
		icon_state = "palm tree 5"
		layer = 5
	PalmTree6
		icon_state = "palm tree 6"
		layer = 5
	PalmTree7
		icon_state = "palm tree 7"
	PalmTree8
		icon_state = "palm tree 8"
	Tree1
		icon='Tree.dmi'
		icon_state="1"
		density=1
		New()
			..()
			src.overlays+=new/obj/Tree/Tree2
			src.overlays+=new/obj/Tree/Tree3
			src.overlays+=new/obj/Tree/Tree4
			src.overlays+=new/obj/Tree/Tree5
			src.overlays+=new/obj/Tree/Tree6
	OakTree1
		name = "Oak Tree"
		icon_state = "oak tree 1"
		density = 0
		layer = 5

	OakTree2
		name = "Oak Tree"
		icon_state = "oak tree 2"
		density = 0
		layer = 5

	OakTree3
		name = "Oak Tree"
		icon_state = "oak tree 3"
		density = 0
		layer = 5

	OakTree4
		name = "Oak Tree"
		icon_state = "oak tree 4"
		density = 0
		layer = 5

	OakTree5
		name = "Oak Tree"
		icon_state = "oak tree 5"
		density = 1

	OakTree6
		name = "Oak Tree"
		icon_state = "oak tree 6"
		density = 1

	LightOakTree1
		name = "Light Oak Tree 1"
		icon_state = "1"
		density = 0
		layer = 5

	LightOakTree2
		name = "Light Oak Tree 2"
		icon_state = "2"
		density = 0
		layer = 5

	LightOakTree3
		name = "Light Oak Tree 3"
		icon_state = "3"
		density = 0
		layer = 5

	LightOakTree4
		name = "Light Oak Tree 4"
		icon_state = "4"
		density = 0
		layer = 5

	LightOakTree5
		name = "Light Oak Tree 5"
		icon_state = "5"
		density = 1

	LightOakTree6
		name = "Light Oak Tree 6"
		icon_state = "6"
		density = 1




	Bush
		name = "Bush"
		icon_state = "bush"
		density = 1

	Flower
		name = "Flower"
		icon_state = "flower"
		density = 0

	Sky_1_1
		name = "Sky"
		icon_state = "sky 1-1"
		density = 1

	Sky_1_2
		name = "Sky"
		icon_state = "sky 1-2"
		density = 1

	Sky_1_3
		name = "Sky"
		icon_state = "sky 1-3"
		density = 1

	Sky_1_4
		name = "Sky"
		icon_state = "sky 1-4"
		density = 1

	Sky_1_5
		name = "Sky"
		icon_state = "sky 1-5"
		density = 1

	Sky_1_6
		name = "Sky"
		icon_state = "sky 1-6"
		density = 1

	Sky_2_1
		name = "Sky"
		icon_state = "sky 2-1"
		density = 1

	Sky_2_2
		name = "Sky"
		icon_state = "sky 2-2"
		density = 1

	Sky_2_3
		name = "Sky"
		icon_state = "sky 2-3"
		density = 1

	Sky_2_4
		name = "Sky"
		icon_state = "sky 2-4"
		density = 1

	Sky_2_5
		name = "Sky"
		icon_state = "sky 2-5"
		density = 1

	Sky_2_6
		name = "Sky"
		icon_state = "sky 2-6"
		density = 1

	Sky_2_7
		name = "Sky"
		icon_state = "sky 2-7"
		density = 1
obj/Tree
	Tree2
		icon='Tree.dmi'
		icon_state="2"
		density=1
		pixel_x=32
	Tree3
		icon='Tree.dmi'
		icon_state="3"
		layer=50
		pixel_y=32
	Tree4
		icon='Tree.dmi'
		icon_state="4"
		layer=50
		pixel_x=32
		pixel_y=32
	Tree5
		icon='Tree.dmi'
		icon_state="5"
		layer=50
		pixel_y=64
	Tree6
		icon='Tree.dmi'
		icon_state="6"
		layer=50
		pixel_x=32
		pixel_y=64
turf/Namek
	icon = 'Namek Island Edge.dmi'
	Island_Edge_001
		icon_state = "001"
		density = 1
	Island_Edge_002
		icon_state = "002"
		density = 1
	Island_Edge_003
		icon_state = "003"
		density = 1
	Island_Edge_004
		icon_state = "004"
		density = 1
	Island_Edge_005
		icon_state = "005"
		dbable=1
	Island_Edge_006
		icon_state = "006"
		density = 1
	Island_Edge_007
		icon_state = "007"
		density = 1
	Island_Edge_008
		icon_state = "008"
		density = 1
	Island_Edge_009
		icon_state = "009"
		density = 1
	Island_Edge_010
		icon_state = "010"
		density = 1
	Island_Edge_011
		icon_state = "011"
		density = 1
	Island_Edge_012
		icon_state = "012"
		density = 1
	Island_Edge_013
		icon_state = "013"
		density = 1
	Island_Edge_014
		icon_state = "014"
		density = 1
	Island_Edge_015
		icon_state = "015"
		density = 1
	Island_Edge_016
		icon_state = "016"
		density = 1
	Island_Edge_017
		icon_state = "017"
		density = 1
	Island_Edge_018
		icon_state = "018"
		density = 1
	Island_Edge_019
		icon_state = "019"
		density = 1
	Grass_Edge_1
		icon_state = "grass edge 1"
	Grass_Edge_2
		icon_state = "grass edge 2"
	Grass_Edge_3
		icon_state = "grass edge 3"
	Grass_Edge_4
		icon_state = "grass edge 4"
	Namek_Tree_1
		icon_state = "namek tree 1"
		layer = 10
	Namek_Tree_2
		icon_state = "namek tree 2"
		layer = 10
	Namek_Tree_3
		icon_state = "namek tree 3"
		layer = 10
	Namek_Tree_4
		icon_state = "namek tree 4"
		density = 1
turf/Yardrat
	icon = 'Yardrat Turfs.dmi'
	Island_Edge_000
		icon_state = "grass"
		dbable=1
	Island_Edge_001
		icon_state = "1"
		density = 1
	Island_Edge_002
		icon_state = "2"
		density = 1
	Island_Edge_003
		icon_state = "3"
		density = 1
	Island_Edge_004
		icon_state = "4"
		density = 1
	Island_Edge_005
		icon_state = "5"
		density = 1
	Island_Edge_006
		icon_state = "6"
		density = 1
	Island_Edge_007
		icon_state = "7"
		density = 1
	Island_Edge_008
		icon_state = "8"
		density = 1
	Island_Edge_009
		icon_state = "9"
		density = 1
	Island_Edge_010
		icon_state = "10"
		density = 1
	Island_Edge_011
		icon_state = "11"
		density = 1
	Island_Edge_012
		icon_state = "12"
		density = 1
	Island_Edge_013
		icon_state = "13"
		density = 1
	Island_Edge_014
		icon_state = "14"
		density = 1
	Island_Edge_015
		icon_state = "15"
		density = 1
	Island_Edge_016
		icon_state = "16"
		density = 1
	Island_Edge_017
		icon_state = "17"
		density = 1
	Island_Edge_018
		icon_state = "18"
		density = 1
	Island_Edge_019
		icon_state = "water"
		density = 1