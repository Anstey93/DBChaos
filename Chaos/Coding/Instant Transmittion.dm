mob/var/it_blocked = 0
mob/var/tmp/iting=0
obj/Technique/InstantTransmission
	verb/Instant_Transmission()
		set category = "Techniques"
		var/ki_cost=50000
		if(usr.doing)
			usr << "You are already doing something."
			return
		if(usr.buku)
			return
		if(usr.grav > 0)
			return
		if(usr.dead)
			return
		if(usr.it_lock)
			usr << "Cannot use this Technique at his time."
			return
		if(usr.ki_lock)
			usr << "Cannot use this Technique at his time."
			return
		if(usr.race != "Android")
			if(usr.ki > ki_cost)
				var/code = input("Which Energy Code do you wish to IT to?")as num
				if(lentext(code) > 7)
					usr << "EC too Long!"
					return
				if(code == usr.energy_code)
					usr << "Thats your EC!"
					return
				if(!code)
					return
				else
					usr.NormalIT(code)
			else
				usr << "You do not have enough Ki!"
				return
		else
			if(usr.race == "Android")
				if(usr.it_lock)
					usr << "Cannot use this Technique right now."
					return
				var/list/Menu = list()
				for(var/mob/M in world)
					if(istype(M,/mob/PC))
						if(!M.it_blocked&&M.loggedin)
							if(M.name != "PC--PC")
								Menu.Add(M)
					if(istype(M,/mob/NPC) || istype(M,/mob/Monster))
						if(!M.it_blocked)
							Menu.Add(M)
				var/mob/M = input("IT to who?","Instant Transmission")in Menu
				if(M=="Cancel")
					return
				usr.AndroidIT(M)

mob
	proc
		AndroidIT(mob/M)
			for(var/obj/O in src)
				if(O.dball)
					if(M.z!=1&&M.z!=2&&M.z!=3&&M.z!=4)
						src<<"You can't IT there with the Dragonballs."
			//		src<<"The Dragonballs are interfering with your ability to seek energy signals."
						return
			if(src.ki<50000)
				src << "You do not have enough Ki!"
				src.it_lock=0
				return
			if(!M)
				src.it_lock=0
				return
			if(M.name == "PC")
				src.it_lock=0
				return
			if(M.it_blocked)
				src << "You cannot seem to get a clear lock on [M]'s energy signal..."
				src.it_lock=0
				return
			if(src.doing)
				src << "You are already doing something."
				src.it_lock=0
				return
			if(M == src)
				src << "You Cannot IT to yourself!"
				src.it_lock=0
				return
			if(src.ki_lock||src.it_lock)
				src << "Cannot use this Technique right now."
				src.it_lock=0
				return
			else
				if(src.grav <= 0)
					if(!M.it_blocked)
						src.it_lock=1
						src << "<B>Locating [M]'s energy signal..."
						src.ki -= 50000
						sleep(15)
						src << "<B>[M] Found!"
						src.icon_state = "IT"
						sleep(6)
						src.icon_state = ""
						if(!M)return
						if(M.it_blocked)
							src.it_lock=0
							return
						if(src.it_blocked)
							src.it_lock=0
							return
						if(src.dead)
							src.it_lock=0
							return
						src.grav = 0
						usr.iting=1
						src.x=M.x
						src.y=M.y
						src.z=M.z
						usr.iting=0
						spawn(60)src.it_lock=0
						src.it_blocked=0
						src.grav = 0
						src.grav_delay = 0
						oview(8) << "<B>[src] appears from nowhere!"
						src.icon_state = "IT"
						sleep(6)
						src.icon_state = ""
					else
						src << "You can't get a clear lock on [M]'s energy signal..."
						return
		NormalIT(ec)
			if(src.dead)
				return
			if(src.ki<50000)
				usr << "You do not have enough Ki!"
				return
			if(src.doing)
				usr << "You are already doing something."
				return
			if(src.buku)
				return
			if(src.grav > 0)
				return
			if(src.dead)
				return
			if(src.it_lock)
				usr << "Cannot use this Technique at his time."
				return
			if(src.ki_lock)
				usr << "Cannot use this Technique at his time."
				return
			else
				for(var/mob/M in world)
					if(M.energy_code==ec)
						for(var/obj/O in src)
							if(O.dball)
								if(M.z!=1&&M.z!=2&&M.z!=3&&M.z!=4)
									src<<"You can't IT there with the Dragonballs."
						//		src<<"The Dragonballs are interfering with your ability to seek energy signals."
									return
						if(M.it_blocked!=1)
							if(src.dead)
								return
							src.ki -= 50000
							src << "<B>Locking onto [M]'s energy signal..."
							sleep(15)
							if(!M)return
							if(M.it_blocked)return
							if(src.it_blocked)return
							if(src.dead)return
							src << "<B>[M] Found!"
							src.icon_state = "IT"
							for(var/mob/PC/I in oview(1))
								if(I.it_taken && !I.dead && I.grav <= 0)
									for(var/obj/O in I)
										if(O.dball)
											continue
										else
											I.icon_state = "IT"
											I.grav = 0
											spawn(4)I.loc = src.loc
											spawn(4)I.icon_state = ""
							sleep(3)
							src.icon_state = ""
							if(!M)return
							if(M.it_blocked)return
							if(src.it_blocked)return
							if(src.dead)return
							src.grav = 0
							src.iting=1
							src.x=M.x
							src.y=M.y
							src.z=M.z
							src.iting=0
							src.it_blocked=0
							src.grav = 0
							src.grav_delay = 0
							oview(8) << "<B>[src] appears from nowhere!"
							src.icon_state = "IT"
							sleep(6)
							src.icon_state = ""
						else
							src << "You cannot seem to get a clear lock on [M]'s energy signal..."
							return