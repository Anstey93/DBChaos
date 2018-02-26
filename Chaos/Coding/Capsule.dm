obj/Equipment
	Capsule
		name = "Storage Capsule"
		icon = 'Capsule.dmi'
		density = 0
		Click()
			if(src in usr:contents)
				switch(alert("Do you wish to use the Storage Capsule?","Item","Yes","No"))
					if("Yes")
						usr.inven_max += 25
						usr << "Your Maximum Item Storage has increased to \white 50!"
						del(src)
						return
					else
						return