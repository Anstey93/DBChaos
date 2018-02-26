mob
	Saga
		Brolly
			name="{Saga}Brolly"
			icon_state="brolly"
			level=870
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=1300
			zenni=500000
			exp=9000
			karma = "Evil"
			race = "Saiyan"
			CPS=12
			Del()
				if(!src.form_1)
					var/mob/Saga/Brolly/F=new
					F.loc=src.loc
					F.form_1=1
					F.level=950
					F.speed=1000
					F.icon_state="brolly1"
					CPS=13
				..()
		Babidi
			name="{Saga}Babidi"
			icon_state="babidi"
			level=300
			powerlevel=200000
			powerlevel_max=200000
			ki=20000000
			ki_max=20000000
			strength=1000
			strength_max=1000
			defence=900
			defence_max=900
			speed=5000
			zenni=5000
			exp=500
			karma = "Evil"
			race = "Majin"
			CPS=5
		Dabura
			name="{Saga}Dabura"
			icon_state="dabura"
			level=860
			powerlevel=180000000
			powerlevel_max=180000000
			ki=150000000
			ki_max=150000000
			strength=270000000
			strength_max=270000000
			defence=240000000
			defence_max=240000000
			speed=2000
			zenni=50000
			exp=3500
			karma = "Evil"
			race = "Majin"
			CPS=11
		MajinBuu
			name="{Saga}Majin Buu"
			icon_state="majinbuu"
			level=890
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=3000
			zenni=80000
			exp=5500
			karma = "Evil"
			race = "Majin"
			has_beam="Candy Ray"
			beam_txt="TURN TO CHOCOLATE"
			beamIS="candyray"
			beamIST="candyrayt"
			CPS=12
			Del()
				if(!src.form_1)
					var/mob/Saga/MajinBuu/F=new
					F.loc=locate(168,132,1)
					F.form_1=1
					F.level=900
					F.speed=3000
					F.icon_state="majinbuu1"
					F.CPS=12
				if(src.form_1&&!src.form_2)
					var/mob/Saga/MajinBuu/F=new
					F.loc=locate(14,160,7)
					F.form_1=1
					F.form_2=1
					F.level=950
					F.speed=2000
					F.icon_state="majinbuu2"
					F.CPS=13
				if(src.form_2&&!src.form_3)
					var/mob/Saga/MajinBuu/F=new
					F.loc=locate(365,330,7)
					F.form_1=1
					F.form_2=1
					F.form_3=1
					F.level=1000
					F.speed=1000
					F.icon_state="majinbuu3"
					F.CPS=14
				..()
		Trunks2
			name="{Saga}Trunks"
			icon_state="trunks2"
			level=860
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goten1
			name="{Saga}Goten"
			icon_state="goten1"
			level=860
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goku7
			name="{Saga}Goku"
			icon_state="goku7"
			level=910
			speed=2000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Vegeta5
			name="{Saga}Goku"
			icon_state="vegeta5"
			level=890
			speed=2000
			karma = "Good"
			race = "Saiyan"
			has_beam="Final Flash"
			beam_txt="FINAL FLASH"
			beamIS="finalflash"
			beamIST="finalflasht"
		Gotenks1
			name="{Saga}Gotenks"
			icon_state="gotenks1"
			level=950
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Gohan4
			name="{Saga}Gohan"
			icon_state="gohan5"
			level=960
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Vegito1
			name="{Saga}Vegito"
			icon_state="vegito1"
			level=1000
			speed=1000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"