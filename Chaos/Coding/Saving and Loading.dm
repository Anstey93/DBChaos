client
	proc
		LoadChar(S)
			screen=null
			if(S==1)
				var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 1.sav")
				F["name"] >> src.mob.name
				F["mob"] >> src.mob
				F["x"] >> src.mob.x
				F["y"] >> src.mob.y
				F["z"] >> src.mob.z
			if(S==2)
				var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 2.sav")
				F["name"] >> src.mob.name
				F["mob"] >> src.mob
				F["x"] >> src.mob.x
				F["y"] >> src.mob.y
				F["z"] >> src.mob.z
			if(S==3)
				var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 3.sav")
				F["name"] >> src.mob.name
				F["mob"] >> src.mob
				F["x"] >> src.mob.x
				F["y"] >> src.mob.y
				F["z"] >> src.mob.z
		SaveChar()
			if(!src)return
			if(!src.mob)return
			if(!src.mob.loggedin)return
			if(cantsaveatall)return
			src.mob.UpdateDisplayIcon()
			if(src.mob.save_file_1)
				var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 1.sav")
				F["name"] << src.mob.name
				F["mob"] << src.mob
				F["x"] << src.mob.x
				F["y"] << src.mob.y
				F["z"] << src.mob.z
				F["PI"]<<src.mob.displayicon
			if(src.mob.save_file_2)
				var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 2.sav")
				F["name"] << src.mob.name
				F["mob"] << src.mob
				F["x"] << src.mob.x
				F["y"] << src.mob.y
				F["z"] << src.mob.z
				F["PI"]<<src.mob.displayicon
			if(src.mob.save_file_3)
				var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 3.sav")
				F["name"] << src.mob.name
				F["mob"] << src.mob
				F["x"] << src.mob.x
				F["y"] << src.mob.y
				F["z"] << src.mob.z
				F["PI"]<<src.mob.displayicon
mob/Logout()
	..()
	del(src)
mob/PC/Logout()
	TourneyPeople.Remove(src)
	src.GMLevel = 0
	src.LogOutGM()
	if(src.in_war)
		if(src.guild_name==guild_war_1)
			guildies1-=1
		if(src.guild_name==guild_war_2)
			guildies2-=1
		GuildWarCheck()
	for(var/obj/Earth_Dragonballs/O1 in src)
		O1.loc = src.loc
	for(var/obj/Namek_Dragonballs/O2 in src)
		O2.loc = src.loc
	for(var/obj/Black_Dragonballs/O3 in src)
		O3.loc = src.loc
	BudokaiResign(src)
	if(src.in_tourney)
		TourneyPeople.Remove(src)
		tourney_count--
	if(src.challenger)
		src.challenger:WinArena("[src.name]")
	for(var/obj/Tech/T in world)
		if(T.owner==src)
			del(T)
	src<<browse(null)
	del(src)
mob
	var
		tmp
			afktime=0
	proc
		WinArena(T)
			src.loc=locate(215,115,1)
			src.it_lock=0
			src.it_blocked=0
			src.arena_win++
			src.challenger=""
			arena_on=0
			src.in_arena=0
			world << "\yellow Arena Battle: \white [src] has won the challenge against [T]!"
client
	proc
		AutoSave()
			set background=1
			spawn while(1)
				if(cantsaveatall)break
				src.SaveChar()
				src.mob.afktime+=3
				sleep(1800)
world
	proc
		IdleBooter()
			set background=1
			spawn while(1)
				for(var/mob/PC/C in world)
					if(!C.loggedin)continue
					if(C.GMLevel)continue
					if(C.afktime>=18)
						world << "<font color = #00B211>Dragon AI:</font> \white [C.name]([C.key]) has been Booted for being Idle."
						for(var/obj/Earth_Dragonballs/O1 in C)
							O1.loc = C.loc
						for(var/obj/Namek_Dragonballs/O2 in C)
							O2.loc = C.loc
						for(var/obj/Black_Dragonballs/O3 in C)
							O3.loc = C.loc
						sleep(2)
						del(C.client)
					sleep(5)
				sleep(1800)