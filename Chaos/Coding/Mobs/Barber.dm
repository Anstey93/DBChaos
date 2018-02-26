mob
	NPC
		Barber
			name = "{NPC}Barber"
			icon_state = "Barber"
			density = 1
			doing = 0
			safe = 1
			energy_code=6733401
			New()
				..()
				if(src.z==2)
					src.energy_code=6733402
				if(src.z==3)
					src.energy_code=6733403
				if(src.z==4)
					src.energy_code=6733404
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.race == "Saibaman")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Changeling")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Tuffle")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Namekian")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Bio-Android")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Majin")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Demon")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					switch(input("Do you want to get your hair cut?")in list("Yes","No"))
						if("Yes")
							usr.overlays -= usr.hair_icon
							usr.overlays -= usr.hair_icon
							usr.overlays -= usr.hair_icon
							usr.overlays -= 'Hair - Goku SSJ.dmi'
							usr.overlays -= 'Hair - Goku USSJ.dmi'
							usr.overlays -= 'Hair - Goku H.dmi'
							usr.overlays -= 'Hair - Goku SH.dmi'
							usr.overlays -= 'Hair - Future Gohan SSJ.dmi'
							usr.overlays -= 'Hair - Future Gohan USSJ.dmi'
							usr.overlays -= 'Hair - Adult Gohan SSJ.dmi'
							usr.overlays -= 'Hair - Adult Gohan USSJ.dmi'
							usr.overlays -= 'Hair - Gohan H.dmi'
							usr.overlays -= 'Hair - Gohan SH.dmi'
							usr.overlays -= 'Hair - Vegeta SSJ.dmi'
							usr.overlays -= 'Hair - Vegeta USSJ.dmi'
							usr.overlays -= 'Hair - Vegeta H.dmi'
							usr.overlays -= 'Hair - Vegeta SH.dmi'
							usr.overlays -= 'Hair - Teen Gohan SSJ.dmi'
							usr.overlays -= 'Hair - Teen Gohan USSJ.dmi'
							usr.overlays -= 'Hair - Teen Gohan H.dmi'
							usr.overlays -= 'Hair - Teen Gohan SH.dmi'
							usr.overlays -= 'Hair - Raditz SSJ.dmi'
							usr.overlays -= 'Hair - Raditz USSJ.dmi'
							usr.overlays -= 'Hair - Raditz H.dmi'
							usr.overlays -= 'Hair - Raditz SH.dmi'
							usr.overlays -= 'Hair - Android.dmi'
							usr.overlays -= 'Majin.dmi'
							usr.hair="Bald"
							usr.HairCut()
						if("No")
							return
mob/proc/HairCut()
	var/newhair=input("Choose your hair style.","Hair Styles")in list("Goku","Vegeta","Adult Gohan","Teen Gohan","Future Gohan","Trunks Long","Raditz","Hercule","Bald")
	var/hr=input("How much Red do you want to put?")as num
	var/hg=input("How much Green do you want to put?")as num
	var/hb=input("How much Blue do you want to put?")as num
	switch(newhair)
		if("Goku")
			src.hair_icon = 'Hair - Goku.dmi'
			src.hair = "Goku"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Hercule")
			src.hair_icon = 'Hair - Hercule.dmi'
			src.hair = "Hercule"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Vegeta")
			src.hair_icon = 'Hair - Vegeta.dmi'
			src.hair = "Vegeta"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Adult Gohan")
			src.hair_icon = 'Hair - Adult Gohan.dmi'
			src.hair = "Adult Gohan"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Teen Gohan")
			src.hair_icon = 'Hair - Teen Gohan.dmi'
			src.hair = "Teen Gohan"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Future Gohan")
			src.hair_icon = 'Hair - Future Gohan.dmi'
			src.hair = "Future Gohan"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Trunks Long")
			src.hair_icon = 'Hair - Trunks Long.dmi'
			src.hair = "Trunks Long"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Raditz")
			src.hair_icon = 'Hair - Raditz.dmi'
			src.hair = "Raditz"
			src.hair_icon += rgb(hr,hg,hb)
			src.overlays += src.hair_icon
			if(src.majin)
				src.overlays += 'Majin.dmi'
		if("Bald")
			src.hair = "Bald"
			if(src.majin)
				src.overlays += 'Majin.dmi'
			return