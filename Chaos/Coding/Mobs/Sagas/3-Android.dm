mob
	Saga
		Android16
			name="{Saga}Android 16"
			icon_state="android16"
			level=550
			powerlevel=40000000
			powerlevel_max=40000000
			ki=200000000
			ki_max=200000000
			strength=65000000
			strength_max=65000000
			defence=67000000
			defence_max=67000000
			speed=2700
			zenni=20000
			exp=1800
			karma = "Evil"
			race = "Android"
			Del()
				var/obj/O = new/obj/Equipment/Consumable/Chip
				O.loc = src.loc
				..()
		Android17
			name="{Saga}Android 17"
			icon_state="android17"
			level=500
			powerlevel=39000000
			powerlevel_max=39000000
			ki=200000000
			ki_max=200000000
			strength=60000000
			strength_max=60000000
			defence=63000000
			defence_max=63000000
			speed=2700
			zenni=19000
			exp=1800
			karma = "Evil"
			race = "Android"
			Del()
				var/obj/O = new/obj/Equipment/Consumable/Chip
				O.loc = src.loc
				..()
		Android18
			name="{Saga}Android 18"
			icon_state="android18"
			level=500
			powerlevel=39000000
			powerlevel_max=39000000
			ki=200000000
			ki_max=200000000
			strength=60000000
			strength_max=60000000
			defence=63000000
			defence_max=63000000
			speed=2700
			zenni=19000
			exp=1800
			karma = "Evil"
			race = "Android"
			Del()
				var/obj/O = new/obj/Equipment/Consumable/Chip
				O.loc = src.loc
				..()
		Android19
			name="{Saga}Android 19"
			icon_state="android19"
			level=480
			powerlevel=39000000
			powerlevel_max=39000000
			ki=200000000
			ki_max=200000000
			strength=60000000
			strength_max=60000000
			defence=63000000
			defence_max=63000000
			speed=2700
			zenni=19000
			exp=1700
			karma = "Evil"
			race = "Android"
			Del()
				var/obj/O = new/obj/Equipment/Consumable/Chip
				O.loc = src.loc
				..()
		Android20
			name="{Saga}Dr. Gero"
			icon_state="android20"
			level=450
			powerlevel=30000000
			powerlevel_max=30000000
			ki=180000000
			ki_max=180000000
			strength=50000000
			strength_max=50000000
			defence=51000000
			defence_max=51000000
			speed=3000
			zenni=17000
			exp=1600
			karma = "Evil"
			race = "Android"
			Del()
				var/obj/O = new/obj/Equipment/Consumable/Chip
				O.loc = src.loc
				..()
		Cell
			name="{Saga}Cell"
			icon_state="cell"
			level=600
			powerlevel=40000000
			powerlevel_max=40000000
			ki=200000000
			ki_max=200000000
			strength=65000000
			strength_max=65000000
			defence=67000000
			defence_max=67000000
			speed=2700
			zenni=25000
			exp=2400
			karma = "Evil"
			race = "Bio-Android"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			Del()
				if(!src.form_1)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.level=700
					F.form_1=1
					F.speed=4000
					F.icon_state="cell1"
				if(src.form_1&&!src.form_2)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.level=750
					F.form_1=1
					F.form_2=1
					F.speed=3000
					F.icon_state="cell2"
				if(src.form_2&&!src.form_3)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.level=800
					F.form_1=1
					F.form_2=1
					F.form_3=1
					F.speed=2000
					F.icon_state="cell2"
					F.overlays+='Elec Blue Big.dmi'
				if(src.form_3&&!src.form_4)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.form_1=1
					F.form_2=1
					F.form_3=1
					F.form_4=1
					F.level=850
					F.speed=1000
					F.icon_state="cell2"
					F.overlays+='Elec Red Big.dmi'
				..()
		Goku6
			name="{Saga}Goku"
			icon_state="goku4"
			level=750
			speed=3000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Vegeta4
			name="{Saga}Vegeta"
			icon_state="vegeta4"
			level=700
			speed=3000
			karma = "Good"
			race = "Saiyan"
			has_beam="Final Flash"
			beam_txt="FINAL FLASH"
			beamIS="finalflash"
			beamIST="finalflasht"
		Gohan3
			name="{Saga}Gohan"
			icon_state="gohan3"
			level=800
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			Del()
				if(!src.form_1)
					var/mob/Saga/Gohan3/F=new
					F.loc=src.loc
					F.level=850
					F.form_1=1
					F.speed=1000
					F.icon_state="gohan4"
				..()