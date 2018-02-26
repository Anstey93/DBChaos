mob/proc/CheckInventory()
	var/count = 0
	for(var/obj/Equipment/E in src)
		count ++
	for(var/obj/Gym/G in src)
		count ++
	for(var/obj/Props/Furnature/GF in src)
		count ++
	for(var/obj/S in contents)
		if(S.value)
			src.sellable_items++
	src.inven_min = count
	if(src.inven_min>=src.inven_max)
		src<<"You have no more space in your inventory."
		return TRUE
obj/Earth_Dragonballs
	dball=1
	layer=MOB_LAYER-1
	Earth_Dragonball_1
		name = "Earth Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "1"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_1 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You cannot pick up this!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_1 = 0
				usr.inven_min -= 1
	Earth_Dragonball_2
		name = "Earth Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "2"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_2 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_2 = 0
				usr.inven_min -= 1
	Earth_Dragonball_3
		name = "Earth Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "3"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_3 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_3 = 0
				usr.inven_min -= 1
	Earth_Dragonball_4
		name = "Earth Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "4"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_4 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_4 = 0
				usr.inven_min -= 1
	Earth_Dragonball_5
		name = "Earth Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "5"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_5 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_5 = 0
				usr.inven_min -= 1
	Earth_Dragonball_6
		name = "Earth Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "6"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_6 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_6 = 0
				usr.inven_min -= 1
	Earth_Dragonball_7
		name = "Earth Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "7"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_7 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_7 = 0
				usr.inven_min -= 1

obj/Namek_Dragonballs
	dball=1
	layer=MOB_LAYER
	Namek_Dragonball_1
		name = "Namekian Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "n1"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_1 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_1 = 0
				usr.inven_min -= 1
	Namek_Dragonball_2
		name = "Namekian Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "n2"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_2 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_2 = 0
				usr.inven_min -= 1
	Namek_Dragonball_3
		name = "Namekian Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "n3"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_3 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_3 = 0
				usr.inven_min -= 1
	Namek_Dragonball_4
		name = "Namekian Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "n4"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_4 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_4 = 0
				usr.inven_min -= 1
	Namek_Dragonball_5
		name = "Namekian Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "n5"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_5 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_5 = 0
				usr.inven_min -= 1
	Namek_Dragonball_6
		name = "Namekian Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "n6"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_6 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_6 = 0
				usr.inven_min -= 1
	Namek_Dragonball_7
		name = "Namekian Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "n7"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_7 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_7 = 0
				usr.inven_min -= 1
obj/Black_Dragonballs
	dball=1
	layer=MOB_LAYER
	Black_Dragonball_1
		name = "Black Star Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "b1"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Black Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_1 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_1 = 0
				usr.inven_min -= 1
	Black_Dragonball_2
		name = "Black Star Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "b2"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Black Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_2 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_2 = 0
				usr.inven_min -= 1
	Black_Dragonball_3
		name = "Black Star Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "b3"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Black Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_3 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_3 = 0
				usr.inven_min -= 1
	Black_Dragonball_4
		name = "Black Star Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "b4"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Black Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_4 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_4 = 0
				usr.inven_min -= 1
	Black_Dragonball_5
		name = "Black Star Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "b5"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Black Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_5 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_5 = 0
				usr.inven_min -= 1
	Black_Dragonball_6
		name = "Black Star Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "b6"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Black Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_6 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_6 = 0
				usr.inven_min -= 1
	Black_Dragonball_7
		name = "Black Star Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "b7"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Black Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_7 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_7 = 0
				usr.inven_min -= 1
world
	proc
		Earth_Dragonball_Spawn(S=1)
			set background=1
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)
					if(istype(O,/obj/Earth_Dragonballs))
						return
				world<<"<center><font color=yellow>Earth Dragonballs have been scattered!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_7(T)
							db7=1
							break
		Namek_Dragonball_Spawn(S=1)
			set background=1
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)
					if(istype(O,/obj/Namek_Dragonballs))
						return
				world<<"<center><font color=yellow>Namekian Dragonballs have been scattered!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_7(T)
							db7=1
							break
		Black_Dragonball_Spawn(S=1)
			set background=1
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)
					if(istype(O,/obj/Black_Dragonballs))
						return
				world<<"<center><font color=yellow>The <font color =gray>Black Star Dragonballs</font> have been scattered!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,400),rand(1,400),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,400),rand(1,400),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,400),rand(1,400),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,400),rand(1,400),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,400),rand(1,400),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,400),rand(1,400),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,400),rand(1,400),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_7(T)
							db7=1
							break
mob/proc/Summon_Dragon(D)
	world.ShutDownRadar()
	if(D=="Shenron")
		if(src.wishes < 7)
			if(src.e_db_1 && src.e_db_2 && src.e_db_3 && src.e_db_4 && src.e_db_5 && src.e_db_6 && src.e_db_7)
				for(var/obj/Earth_Dragonballs/O in world)
					del(O)
				src.e_db_1 = 0
				src.e_db_2 = 0
				src.e_db_3 = 0
				src.e_db_4 = 0
				src.e_db_5 = 0
				src.e_db_6 = 0
				src.e_db_7 = 0
				world << "<font color = green>The Sky Darkens as [D] is summoned!</font>"
				src << browse('Shenron.BMP',"display=0")
				src << browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You Have Summoned [D]! </center>")
				spawn(1)world.Earth_Dragonball_Spawn(72000)
				sleep(15)
				switch(input("What is your wish?")in list("Change Stat Points","Level","Power","Ki","Karma","Training Points","Custom Skill Points","Change Energy Code","Zenni"))
					if("Change Stat Points")
						src.wishes +=1
						alert(src,"Very well. You have 5 stat points left. Distribute them amongst the 5 stats:")
						repeat
						src.statpl=0
						src.statki=0
						src.statstr=0
						src.statdef=0
						src.stattrain=0
						var/pleft=5
						var/spl=input(src,"Let's start with Powerlevel: How many points do you wish to use? (0-[pleft])")as num
						if(spl<0)
							spl=0
						if(spl>pleft)
							alert(src,"Enter a number between 0 and 5.")
							goto repeat
						pleft-=spl
						src.statpl=spl
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/ski=input(src,"You have [pleft] stat points left. Ki: How many points do you wish to use? (0-[pleft])")as num
						if(ski<0)
							ski=0
						if(ski>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=ski
						src.statki=ski
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/sstr=input(src,"You have [pleft] stat points left. Strength: How many points do you wish to use? (0-[pleft])")as num
						if(sstr<0)
							sstr=0
						if(sstr>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=sstr
						src.statstr=sstr
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/sdef=input(src,"You have [pleft] stat points left. Defense: How many points do you wish to use? (0-[pleft])")as num
						if(sdef<0)
							sdef=0
						if(sdef>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=sdef
						src.statdef=sdef
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/strain=input(src,"You have [pleft] stat points left. Training Ease: How many points do you wish to use? (0-[pleft])")as num
						if(strain<0)
							strain=0
						if(strain>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=strain
						src.stattrain=strain
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
					if("Change Energy Code")
						src.energy_code=rand(0000001,9999999)
						src.wishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Custom Skill Points")
						src.custom_points += 100
						src.wishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Training Points")
						src.tp += 1000
						src.wishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Zenni")
						src.zenni += 3000000
						src.wishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Level")
						var/amount=1000
						src.wishes +=1
						while(amount>0)
							usr.exp = usr.tnl
							usr.Level_Up()
							amount -= 1
							sleep(1)
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Power")
						src.powerlevel_max += 150000
						src.wishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Ki")
						src.ki_max += 150000
						src.kidefense_max += 150000
						src.wishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Karma")
						switch(alert("Do you wish to be Pure or Evil?","","Pure","Evil"))
							if("Pure")
								src.karma = "Good"
								src.karma_rating = 50
							else
								src.karma = "Evil"
								src.karma_rating = 50
						src.wishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
		else
			alert("You have used all your wishes up!")
			return
	if(D=="Porunga")
		if(src.nwishes < 3)
			if(src.n_db_1 && src.n_db_2 && src.n_db_3 && src.n_db_4 && src.n_db_5 && src.n_db_6 && src.n_db_7)
				for(var/obj/Namek_Dragonballs/O in world)
					del(O)
				src.n_db_1 = 0
				src.n_db_2 = 0
				src.n_db_3 = 0
				src.n_db_4 = 0
				src.n_db_5 = 0
				src.n_db_6 = 0
				src.n_db_7 = 0
				world << "<font color = green>The Sky Darkens as [D] is summoned!</font>"
				src << browse('Shenron.BMP',"display=0")
				src << browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You Have Summoned [D]! </center>")
				spawn(1)world.Namek_Dragonball_Spawn(72000)
				sleep(15)
				switch(input("What is your wish?") in list ("Change Stat Points","Level","Power","Ki","Karma","Training Points","Change Energy Code","Zenni"))
					if("Change Stat Points")
						src.nwishes +=1
						alert(src,"Very well. You have 5 stat points left. Distribute them amongst the 5 stats:")
						repeat
						src.statpl=0
						src.statki=0
						src.statstr=0
						src.statdef=0
						src.stattrain=0
						var/pleft=5
						var/spl=input(src,"Let's start with Powerlevel: How many points do you wish to use? (0-[pleft])")as num
						if(spl<0)
							spl=0
						if(spl>pleft)
							alert(src,"Enter a number between 0 and 5.")
							goto repeat
						pleft-=spl
						src.statpl=spl
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/ski=input(src,"You have [pleft] stat points left. Ki: How many points do you wish to use? (0-[pleft])")as num
						if(ski<0)
							ski=0
						if(ski>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=ski
						src.statki=ski
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/sstr=input(src,"You have [pleft] stat points left. Strength: How many points do you wish to use? (0-[pleft])")as num
						if(sstr<0)
							sstr=0
						if(sstr>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=sstr
						src.statstr=sstr
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/sdef=input(src,"You have [pleft] stat points left. Defense: How many points do you wish to use? (0-[pleft])")as num
						if(sdef<0)
							sdef=0
						if(sdef>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=sdef
						src.statdef=sdef
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/strain=input(src,"You have [pleft] stat points left. Training Ease: How many points do you wish to use? (0-[pleft])")as num
						if(strain<0)
							strain=0
						if(strain>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=strain
						src.stattrain=strain
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
					if("Change Energy Code")
						src.energy_code=rand(0000001,9999999)
						src.nwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Training Points")
						src.tp += 5000
						src.nwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Zenni")
						src.zenni += 5000000
						src.nwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Level")
						var/amount=2000
						src.nwishes +=1
						while(amount>0)
							usr.exp = usr.tnl
							usr.Level_Up()
							amount -= 1
							sleep(1)
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Power")
						src.powerlevel_max += 250000
						src.nwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Ki")
						src.ki_max += 250000
						src.kidefense_max += 250000
						src.nwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Karma")
						switch(alert("Do you wish to be Pure or Evil?","","Pure","Evil"))
							if("Pure")
								src.karma = "Good"
								src.karma_rating = 50
							else
								src.karma = "Evil"
								src.karma_rating = 50
						src.nwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
		else
			alert("You have used all your wishes up!")
			return
	if(D=="Black Shenron")
		if(!src.bwishes)
			if(src.b_db_1 && src.b_db_2 && src.b_db_3 && src.b_db_4 && src.b_db_5 && src.b_db_6 && src.b_db_7)
				for(var/obj/Black_Dragonballs/O in world)
					del(O)
				src.b_db_1 = 0
				src.b_db_2 = 0
				src.b_db_3 = 0
				src.b_db_4 = 0
				src.b_db_5 = 0
				src.b_db_6 = 0
				src.b_db_7 = 0
				world << "<font color = green>The Sky Darkens as <font color=gray>[D]</font> is summoned!</font>"
				src << browse('Shenron.BMP',"display=0")
				src << browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You Have Summoned [D]! </center>")
		//		spawn(1)Black_Dragonball_Spawn(144000)
				sleep(15)
				switch(input("What is your wish?") in list ("Change Stat Points","Level","Power","Ki","Training Points","Zenni"))
					if("Change Stat Points")
						src.bwishes +=1
						alert(src,"Very well. You have 10 stat points left. Distribute them amongst the 5 stats:")
						repeat
						src.statpl=0
						src.statki=0
						src.statstr=0
						src.statdef=0
						src.stattrain=0
						var/pleft=10
						var/spl=input(src,"Let's start with Powerlevel: How many points do you wish to use? (0-[pleft])")as num
						if(spl<0)
							spl=0
						if(spl>pleft)
							alert(src,"Enter a number between 0 and 10.")
							goto repeat
						pleft-=spl
						src.statpl=spl
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/ski=input(src,"You have [pleft] stat points left. Ki: How many points do you wish to use? (0-[pleft])")as num
						if(ski<0)
							ski=0
						if(ski>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=ski
						src.statki=ski
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/sstr=input(src,"You have [pleft] stat points left. Strength: How many points do you wish to use? (0-[pleft])")as num
						if(sstr<0)
							sstr=0
						if(sstr>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=sstr
						src.statstr=sstr
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/sdef=input(src,"You have [pleft] stat points left. Defense: How many points do you wish to use? (0-[pleft])")as num
						if(sdef<0)
							sdef=0
						if(sdef>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=sdef
						src.statdef=sdef
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
						var/strain=input(src,"You have [pleft] stat points left. Training Ease: How many points do you wish to use? (0-[pleft])")as num
						if(strain<0)
							strain=0
						if(strain>pleft)
							alert(src,"Enter a number between 0 and [pleft].")
							goto repeat
						pleft-=strain
						src.stattrain=strain
						if(!pleft)
							src << browse(null)
							world << "<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
							alert("Your wish has been granted!")
							return
					if("Training Points")
						src.tp += 10000
						src.bwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Zenni")
						src.zenni += 20000000
						src.bwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Level")
						var/amount=3000
						src.bwishes +=1
						while(amount>0)
							usr.exp = usr.tnl
							usr.Level_Up()
							amount -= 1
							sleep(1)
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Power")
						src.powerlevel_max += 3000000
						src.bwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
					if("Ki")
						src.ki_max += 3000000
						src.kidefense_max += 3000000
						src.bwishes +=1
						src << browse(null)
						world << "<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return
		else
			alert("You have already used your wish!")
			return