var
	channelmute=""
	players=0
	sub_version=5
	grass_damage=1
	MK = 0
	cantsaveatall=0
	cache_lifespan=0
	LRAllow[0]
world
	view = 8
	version = 2
	loop_checks = 0
	mob = /mob/Guest
	name = "DragonBall Z "
	map_format=TILED_ICON_MAP
	status = "<font size = -2><b><font color = black>Dragonball Z {v3.1}</font>"
	hub = "anstey93.DragonballZ"
	hub_password = "roflpikachu"
	New()
		..()
		spawn(300)IdleBooter()
		spawn(800)SPAWN()
		spawn(100)Earth_Dragonball_Spawn(18000)
		spawn(100)Namek_Dragonball_Spawn(18000)
		spawn(1000)AutoStartTourney()

client
	script = "<STYLE>BODY {background: black; color: #999999;font-size: -2;font-weight: bold;font-family:Tahoma}</STYLE>"
	perspective = EDGE_PERSPECTIVE
	Del()
		if(istype(src.mob, /mob/Guest))
			return ..()
		if(istype(src.mob, /mob/PC))
			players--
			world.UpdatePlayers()
			src.SaveChar()
			world << "<font color = #1E90FF>Server Information: <font color = white>[src.mob]([src]) has logged out."
		for(var/mob/P in world)
			if(P.name=="PC-[src.key]-PC")
				del(P)
		world.AutoRelogDelay(src.ckey)
		..()
	New()
		..()
		if(RelogDelay.Find(src.ckey))
			src<<"You must wait 10 seconds before logging in again."
			del(src)
		winset(src,"mapwindow.map","icon-size=32")
mob/var/canMK = 0
mob/proc/MK()
	if(!MK)
		for(var/mob/M in world)
			if(M != src)
				if(M.client)
					if(!M.canMK)
						if(M.client.address == src.client.address)
							src << "<font color=red>Multi Key is Disabled!"
							del(src)
world
	proc
		AutoRelogDelay(K)
			if(!RelogDelay.Find(K))
				RelogDelay.Add(K)
				spawn(100)RelogDelay.Remove(K)
		SPAWN()
			set background=1
			spawn while(1)
				world.Repop()
				players=0
				var/warcount=0
				var/chlger
				var/arenacount=0
				for(var/obj/techs/O in world)
					if(O.owner==null||!O.owner||O.owner=="")
						del(O)
				for(var/mob/M in world)
					if(M.challenger!=""||M.challenger!=null)
						chlger=M.challenger
						for(var/mob/M2 in world)
							if(M2==chlger)
								arenacount++
					if(M.in_war)
						warcount++
					if(M.client)
						players++
				if(!warcount)
					gwar_on=0
				if(!arenacount)
					arena_on=0
				UpdatePlayers()
				sleep(5)
				_month = time2text(world.realtime,"MM")
				_day = time2text(world.realtime,"DD")
				_hour = time2text(world.realtime,"hh")
				_year = time2text(world.realtime,"YYYY")
				world.AutoUnbanTimer()

				sleep(3000)
		UpdatePlayers()
			world.status="<font size = -2><B>Dragonball Z</b><br><b>Host:</b> [host]<br><b>Players:</b> [players]<br><b>Saga:</b> [saga]<br>"
var/list/BannedTK=list("")
var/_day=""
var/_hour=""
var/_month=""
var/_year="2008"
world
	proc
		AutoUnbanTimer()
			for(var/X in BannedTK)
				var/unbankey=copytext(X,15)
				var/unbanmonth=copytext(X,1,3)
				var/unbanday=copytext(X,4,6)
				var/unbanyear=copytext(X,7,11)
				var/unbanhour=copytext(X,12,14)
				if(unbanyear<=_year)
					if(unbanmonth<=_month)
						if(unbanday<=_day)
							if(unbanhour<=_hour)
								BannedTK.Remove(X)
								var/savefile/S=new("World Save Files/Timed Bans.sav")
								S["BannedTK"]<<BannedTK
								AdminMessage("Auto Unban Timer: [unbankey] has been unbanned.")
proc
	dd_replacetext(text, search_string, replacement_string)
		var/list/textList = dd_text2list(text, search_string)
		return dd_list2text(textList, replacement_string)
	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if (total == 0)
			return
		var/newText = "[the_list[1]]"
		var/count
		for (count = 2, count <= total, count++)
			if (separator) newText += separator
			newText += "[the_list[count]]"
		return newText
	dd_text2list(text, separator)
		var/textlength      = lentext(text)
		var/separatorlength = lentext(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)
			findPosition = findtext(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)
			textList += "[buggyText]"
			searchPosition = findPosition + separatorlength
			if (findPosition == 0)
				return textList
			else
				if (searchPosition > textlength)
					textList += ""
					return textList