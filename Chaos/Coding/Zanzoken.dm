mob/var/zanzoken = 0
mob/var/after_image = 0
obj/Technique/AfterImage
	verb/After_Image()
		set category = "Techniques"
		if(!usr.after_image)
			usr << "You start using your After Image Ability."
			usr.after_image = 1
			usr.zanzoken=0
			return
		if(usr.after_image)
			usr << "You stop using your After Image Ability."
			usr.after_image = 0
			return
obj/Technique/Zanzoken
	verb/Zanzoken()
		set category = "Techniques"
		if(!usr.zanzoken)
			usr << "You start using your Zanzoken Ability."
			usr.zanzoken = 1
			usr.after_image=0
			return

		if(usr.zanzoken)
			usr << "You stop using your Zanzoken Ability."
			usr.zanzoken = 0
			return
obj/After_Image_Mob
	name=""
	icon_state=""
	New()
		..()
		spawn(10)del(src)
client
	DblClick(var/X)
		if(istype(X,/turf))
			var/turf/O=X
			var/ki_cost = 7000
			if(usr.KO)
				return
			if(usr.binded)
				return
			if(usr.beaming)
				return
			if(usr.gravityfieldon)
				return
			if(usr.GMLocked)
				return
			if(usr.grav)
				return
			if(usr.tourny_watch)
				return
			if(usr.regen_dead)
				return
			if(usr.iting)
				return
			if(usr.boxing)
				return
			if(usr.zanzoken||usr.after_image)
				if(istype(O,/turf/Floors/No_Zanzo))
					if(!usr.in_arena)
						return
				if(istype(O,/mob))
					return
				if(istype(O,/area))
					return
				if(istype(O,/turf/Floors/No_Walking))
					return
				if(istype(O,/turf/Floors/No_Looking))
					return
				if(istype(O,/turf/SnakeWay/Clouds))
					return
				if(istype(O,/turf/SnakeWay))
					return
				if(istype(O,/turf/Buildings/Wall))
					return
				if(istype(O,/obj/Equipment))
					return
				if(istype(O,/obj/After_Image_Mob))
					return
				if(istype(O,/turf))
					if(!O.x||!O.y||!O.z)
						return
					if(O.ispassage)
						return
					if(istype(O,/turf/Floors/No_Walking))
						return
					if(usr.zanzoken)
						if(usr.ki >= ki_cost)
							flick("IT",usr)
							usr.ki -= ki_cost
							usr.loc=locate(O.x,O.y,O.z)
						else
							usr << "You don't have enough Ki!"
							return
					if(usr.after_image)
						if(usr.ki >= 100000)
							flick("IT",usr)
							var/obj/After_Image_Mob/C = new
							C.loc = usr.loc
							C.icon = usr.icon
							C.overlays += usr.overlays
							C.underlays += usr.underlays
							C.name = usr.name
							C.dir = usr.dir
							usr.ki -= ki_cost
							usr.loc=locate(O.x,O.y,O.z)
						else
							usr << "You don't have enough Ki!"
							return
		else
			if(istype(X,/mob))
				if(!istype(X,/mob/NPC))
					usr.target=X
					usr<<"Your are now targeting: <i><font color=white>[X]</i></font>"
					return