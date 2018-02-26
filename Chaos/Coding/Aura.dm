mob
	var
		aura = 'Aura.dmi'
obj/Technique/Aura
	verb
		Aura()
			set category = "Techniques"
			if(usr.FuseFollower)
				return
			switch(alert("Switch your aura:","","On","Off"))
				if("On")
					usr.aura_on=0
					if(usr.form_1)
						usr.overlays -= usr.aura
						usr.overlays -= 'Kaio Aura.dmi'
						usr.underlays -= usr.underlays
						usr.Put_Aura()
					else
						if(usr.kaioken)
							usr.underlays -= usr.underlays
							usr.overlays -= usr.aura
							usr.overlays += 'Kaio Aura.dmi'
						else
							usr.underlays -= usr.underlays
							usr.overlays -= 'Kaio Aura.dmi'
							usr.overlays += usr.aura
				else
					usr.underlays -= usr.underlays
					usr.overlays -= usr.aura
					usr.overlays -= 'Kaio Aura.dmi'
					usr.aura_on = 0
//******Saiyan*******
obj/Aura/SSJ_Aura
	icon = 'Big Aura.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/SSJ_Aura2

obj/Aura/SSJ_Aura2
	icon = 'Big Aura.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Changlings*****
obj/Aura/Chang_Aura
	icon = 'Big Aura 3.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Chang_Aura2

obj/Aura/Chang_Aura2
	icon = 'Big Aura 3.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Majins*****
obj/Aura/Maj_Aura
	icon = 'Big Aura 2.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Maj_Aura2

obj/Aura/Maj_Aura2
	icon = 'Big Aura 2.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Human*****
obj/Aura/Hum_Aura
	icon = 'Big Aura 4.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Hum_Aura2

obj/Aura/Hum_Aura2
	icon = 'Big Aura 4.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Saibas/Nameks/Bios*****
obj/Aura/Nam_Aura
	icon = 'Big Aura 5.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Nam_Aura2

obj/Aura/Nam_Aura2
	icon = 'Big Aura 5.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Normal Aura******
obj/Aura/Nor_Aura
	icon = 'Big Aura 6.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Nor_Aura2

obj/Aura/Nor_Aura2
	icon = 'Big Aura 6.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Androids Aura1******
obj/Aura/And_Aura
	icon = 'Big Aura 7.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/And_Aura2

obj/Aura/And_Aura2
	icon = 'Big Aura 7.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999

//****Androids Aura2******
obj/Aura/And_Aura1
	icon = 'AndroA.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/And_Aura11

obj/Aura/And_Aura11
	icon = 'AndroA.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//******Legendary Saiyan*******
obj/Aura/LSSJ_Aura
	icon = 'Big Aura 10.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/LSSJ_Aura2

obj/Aura/LSSJ_Aura2
	icon = 'Big Aura 10.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

//*******Dmn 2 **********
obj/Aura/Demon_Aura1
	icon = 'DemonA.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Demon_Aura11

obj/Aura/Demon_Aura11
	icon = 'DemonA.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

//*******Dmn 3 **********
obj/Aura/Demon_Aura2
	icon = 'DemonA2.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Demon_Aura22

obj/Aura/Demon_Aura22
	icon = 'DemonA2.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

//*******Dmn 4 **********
obj/Aura/Demon_Aura3
	icon = 'DemonA3.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Demon_Aura33

obj/Aura/Demon_Aura33
	icon = 'DemonA3.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0


mob
	proc
		Big_Aura()
			if(src.trans_aura_on)
				src.overlays-=src.aura
				src.underlays-=src.underlays
				src.aura_on = 1
				if(src.race == "Saiyan" || src.race == "Half Saiyan")
					src.underlays += new/obj/Aura/SSJ_Aura
				if(src.race == "Changeling")
					src.underlays += new/obj/Aura/Chang_Aura
				if(src.race == "Majin" || src.race == "Half Majin")
					src.underlays += new/obj/Aura/Maj_Aura
				if(src.race == "Namekian" || src.race == "Saibaman" || src.race == "Bio-Android")
					src.underlays += new/obj/Aura/Nam_Aura
				if(src.race=="Kai")
					src.underlays += new/obj/Aura/And_Aura1
				if(src.race == "Android")
					if(!src.form_1)
						src.underlays += new/obj/Aura/And_Aura
					if(src.form_1)
						src.underlays += new/obj/Aura/And_Aura1
				if(src.race=="Tuffle"||src.race=="Dragon"||src.race=="Konat")
					src.underlays += new/obj/Aura/Nor_Aura
				if(src.race == "Saiyan" && src.legendary_chromosome)
					src.underlays += new/obj/Aura/LSSJ_Aura
				if(src.race == "Demon")
					if(!src.form_1)
						src.underlays += new/obj/Aura/Chang_Aura
					if(src.form_1 && !src.form_2)
						src.underlays += new/obj/Aura/Demon_Aura1
					if(src.form_2 && !src.form_3)
						src.underlays += new/obj/Aura/Demon_Aura2
					if(src.form_3 && !src.form_4)
						src.underlays += new/obj/Aura/Demon_Aura3
				return

mob
	proc
		Put_Aura()
			src.aura_on = 1
			if(src.race == "Saiyan" || src.race == "Half Saiyan")
				src.underlays += new/obj/Aura/SSJ_Aura
			if(src.race == "Changeling")
				src.underlays += new/obj/Aura/Chang_Aura
			if(src.race == "Majin" || src.race == "Half Majin")
				src.underlays += new/obj/Aura/Maj_Aura
			if(src.race == "Namekian" || src.race == "Saibaman" || src.race == "Bio-Android")
				src.underlays += new/obj/Aura/Nam_Aura
			if(src.race == "Android")
				if(src.form_1)
					src.underlays += new/obj/Aura/And_Aura
				if(src.form_2)
					src.underlays += new/obj/Aura/And_Aura1
			if(src.race == "Kai")
				if(src.form_1)
					src.underlays += new/obj/Aura/And_Aura1
			if(src.race == "Tuffle" || src.race == "Dragon"|| src.race == "Konat")
				src.underlays += new/obj/Aura/Nor_Aura
			if(src.race == "Saiyan" && src.legendary_chromosome)
				src.underlays += new/obj/Aura/LSSJ_Aura
			if(src.race == "Demon")
				if(src.form_1 && !src.form_2)
					src.underlays += new/obj/Aura/Chang_Aura
				if(src.form_2 && !src.form_3)
					src.underlays += new/obj/Aura/Demon_Aura1
				if(src.form_3 && !src.form_4)
					src.underlays += new/obj/Aura/Demon_Aura2
				if(src.form_4 && !src.form_5)
					src.underlays += new/obj/Aura/Demon_Aura3
			return