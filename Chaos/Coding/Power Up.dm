mob/var/powering = 0
mob/var/crater_power = 0
obj/Technique/PowerUp
	verb/Power_Up()
		set category = "Techniques"
		if(usr.FuseFollower)
			return
		if(usr.powering)
			usr << "You stop Powering Up."
			usr.frozen = 0
			usr.powering = 0
			usr.doing = 0
			usr.crater_power=0
			usr.buku_lock = 0
			usr.icon_state=""
			sleep(25)
			usr.power_delay = 0
			return
		if(usr.doing)
			usr << "You are already doing something!"
			return
		if(usr.kaioken)
			usr << "Revert from kaioken form."
			return
		if(usr.KO)
			return
		if(usr.power_delay)
			usr << "You must wait a moment before using Power Up again!"
			return
		if(!usr.powering)
			if(usr.powerlevel>=usr.powerlevel_max&&usr.ki>=usr.ki_max)
				usr << "Theres no reason to Power Up!"
				return
			else
				usr.power_delay=1
				usr.frozen = 0
				usr.powering = 1
				usr.doing = 1
				usr.buku_lock = 1
				usr.icon_state = "enrage"
				usr << "You have begun powering up."
				spawn(1)
					usr.Powering_PL()
					usr.Powering_KI()
				sleep(25)
				usr.power_delay = 0
	verb/Power_Down()
		set category = "Techniques"
		if(usr.FuseFollower)
			return
		if(usr.doing)
			src << "You are already doing something!"
			return
		if(usr.KO)
			return
		switch(alert("What do you wish to Power Down?","Power Down","Powerlevel","Ki"))
			if("Powerlevel")
				if(usr.powerlevel<=1)
					usr << "You are too weak to Power Down!"
					return
				var/pdown = input("What do you wish to Power Down to?")as num | null
				if(pdown <= 0)
					usr << "You cannot Power Down that much!"
					return
				if(pdown>=usr.powerlevel)
					return
				if(pdown<usr.powerlevel)
					usr << "You lower your Powerlevel to \white[num2text(pdown,10000000)]"
					usr.icon_state = "enrage"
					oview(50) << "\white A Powerlevel drops in the Distance."
					usr.frozen=1
					sleep(15)
					usr.frozen=0
					usr.powerlevel=pdown
					usr.icon_state=""
			if("Ki")
				if(usr.ki<=1)
					usr << "You are too weak to Power Down!"
					return
				var/pdown = input("What do you wish to Power Down to?")as num | null
				if(pdown <= 0)
					usr << "You cannot Power Down that much!"
					return
				if(pdown>=usr.ki)
					return
				if(pdown<usr.ki)
					usr << "You lower your Ki to \white[num2text(pdown,10000000)]"
					usr.icon_state = "enrage"
					usr.frozen=1
					sleep(15)
					usr.frozen=0
					usr.ki=pdown
					usr.icon_state=""
mob
	proc
		Powering_PL()
			if(!src.powering)
				src.icon_state = ""
				src.frozen = 0
				sleep(50)
				src.power_delay = 0
				return
			else
				if(src.powerlevel>=src.powerlevel_max)
					src << "You are fully powered up!"
					src.powerlevel=src.powerlevel_max
					src.frozen = 0
					src.powering = 0
					src.doing = 0
					src.buku_lock = 0
					src.icon_state = ""
					src.crater_power = 0
					sleep(25)
					src.power_delay = 0
					src.overlays -= aura
					return
				else
					src.powerlevel+=src.powerlevel_max*0.1
					src.crater_power+=src.powerlevel_max*0.1
					if(src.crater_power > 100000000)
						for(var/obj/Buildings/DE in oview(8,src))
							DE.hp-=src.powerlevel/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						if(src.crater_on)
							new/obj/techs/Overlays/Crater_Center(src.loc)
							src.crater_power -= 99999999999
					for(var/mob/PC/M in oview(8))
						if(src.powerlevel_max >= (M.powerlevel_max * 1.5))
							var/FallDir = get_dir(src,M)
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir = SOUTH
								if(NORTHWEST)M.dir = SOUTHEAST
								if(WEST)M.dir = EAST
								if(SOUTHWEST)M.dir = NORTHEAST
								if(SOUTH)M.dir = NORTH
								if(SOUTHEAST)M.dir = NORTHWEST
								if(EAST)M.dir = WEST
								if(NORTHEAST)M.dir = SOUTHWEST
					spawn(20)src.Powering_PL()
					return
		Powering_KI()
			if(!src.powering)
				src.icon_state = ""
				src.frozen = 0
				sleep(50)
				src.power_delay = 0
				return
			else
				if(src.ki>=src.ki_max)
					src << "You are fully powered up!"
					src.ki=src.ki_max
					src.frozen = 0
					src.powering = 0
					src.doing = 0
					src.buku_lock = 0
					src.icon_state = ""
					src.crater_power = 0
					sleep(25)
					src.power_delay = 0
					src.overlays -= aura
					return
				else
					src.ki+=src.ki_max*0.1
					src.crater_power+=src.ki_max*0.1
					if(src.crater_power > 100000000)
						for(var/obj/Buildings/DE in oview(8,src))
							DE.hp-=src.powerlevel/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						if(src.crater_on)
							new/obj/techs/Overlays/Crater_Center(src.loc)
							src.crater_power -= 99999999999
					for(var/mob/PC/M in oview(8))
						if(src.powerlevel_max >= (M.powerlevel_max * 1.5))
							var/FallDir = get_dir(src,M)
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir = SOUTH
								if(NORTHWEST)M.dir = SOUTHEAST
								if(WEST)M.dir = EAST
								if(SOUTHWEST)M.dir = NORTHEAST
								if(SOUTH)M.dir = NORTH
								if(SOUTHEAST)M.dir = NORTHWEST
								if(EAST)M.dir = WEST
								if(NORTHEAST)M.dir = SOUTHWEST
					spawn(20)src.Powering_KI()
					return