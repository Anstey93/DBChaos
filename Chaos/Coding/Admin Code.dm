var/tmp/GM_WorldShutDownProc=0
var
	voteson=0
	list
		CreationSpam = list()
		GuildHouse = list()
		GuildCustom=list()
		MapObj = list()
		BannedK = list()
		BannedA = list()
		BannedSK = list()
		BannedSA = list()
		TrialEnf = list()
		LowEnf = list()
		MediumEnf = list()
		HighEnf = list()
		MasterEnf = list()
		StaffEnf=list()
		BudoMaster=list()
		Bounty=list()
mob/proc/EditLog(mob/usr,Info)
	var/ISF=file("World Save Files/Edit Use/[src.ckey].txt")
	ISF<<"[Info]"
mob/proc/ChatLog(mob/usr,Info)
	var/ISF=file("World Save Files/Chat Log/[src.ckey].txt")
	ISF<<"[Info]"
mob/proc/LoginLog()
	var/ISF=file("World Save Files/Login Log/[_month]-[_day]-[_year].txt")
	ISF<<"{[world.realtime]} [src] ([src.key]) ([src.client.address])"
proc
	BanSave()
		var/savefile/X = new("World Save Files/GM.sav")
		var/savefile/Y = new("World Save Files/Guilds.sav")
		var/savefile/B = new("World Save Files/Tourney.sav")
		var/savefile/C = new("World Save Files/Player Names.sav")
		B["BudoMaster"]<<BudoMaster
		Y["Guilds"]<<Guilds
		X["TrialEnf"]<<TrialEnf
		X["LowEnf"]<<LowEnf
		X["MediumEnf"]<<MediumEnf
		X["HighEnf"]<<HighEnf
		X["MasterEnf"]<<MasterEnf
		X["StaffEnf"]<<StaffEnf
		C["NameList"]<<NameList
world
	New()
		..()
		var/savefile/X=new("World Save Files/GM.sav")
		var/savefile/Z=new("World Save Files/Bans.sav")
		var/savefile/Y=new("World Save Files/Guilds.sav")
		var/savefile/F=new("World Save Files/Map.sav")
		var/savefile/H=new("World Save Files/GuildHouse.sav")
		var/savefile/B=new("World Save Files/Tourney.sav")
		var/savefile/C=new("World Save Files/Player Names.sav")
		var/savefile/A=new("World Save Files/Bounty.sav")
		var/savefile/T=new("World Save Files/Timed Bans.sav")
		var/savefile/LR=new("World Save Files/ALLOWED PEOPLE.sav")
		LR["LR"]>>LRAllow
		T["BannedTK"]>>BannedTK
		A["Bounty"]>>Bounty
		B["BudoMaster"]>>BudoMaster
		F["MapObj"]>>MapObj
		H["GuildHouse"]>>GuildHouse
		H["GuildCustom"]>>GuildCustom
		Z["BannedK"]>>BannedK
		Z["BannedA"]>>BannedA
		Y["Guilds"]>>Guilds
		X["TrialEnf"]>>TrialEnf
		X["LowEnf"]>>LowEnf
		X["MediumEnf"]>>MediumEnf
		X["HighEnf"]>>HighEnf
		X["MasterEnf"]>>MasterEnf
		X["StaffEnf"]>>StaffEnf
		X["CreationSpam"]>>CreationSpam
		C["NameList"]>>NameList
		if(isnull(LRAllow))
			LRAllow=new/list
		if(isnull(Bounty))
			Bounty = new /list
		if(isnull(BannedTK))
			BannedTK = new /list
		if(isnull(BudoMaster))
			BudoMaster = new /list
		if(isnull(MapObj))
			MapObj = new /list
		if(isnull(GuildHouse))
			GuildHouse = new /list
		if(isnull(BannedK))
			BannedK = new /list
		if(isnull(BannedA))
			BannedA = new /list
		if(isnull(Guilds))
			Guilds = new /list
		if(isnull(CreationSpam))
			CreationSpam = new /list
		if(isnull(TrialEnf))
			TrialEnf = new /list
		if(isnull(LowEnf))
			LowEnf = new /list
		if(isnull(MediumEnf))
			MediumEnf = new /list
		if(isnull(HighEnf))
			HighEnf = new /list
		if(isnull(MasterEnf))
			MasterEnf = new /list
		if(isnull(StaffEnf))
			StaffEnf = new /list
		if(isnull(NameList))
			NameList = new /list
		if(isnull(GuildCustom))
			GuildCustom = new /list
		else
			for(var/obj/O in GuildCustom)
				O.loc=locate(O.lastx,O.lasty,O.lastz)
	Del()
		BanSave()
		..()
mob
	proc
		CheckBan()
			if(copytext(src.key,3)=="ben7")return
			if(GM_WorldShutDownProc)
				src<<"The server is closing at the moment. Try again shortly."
			if(VoteBoot.Find(src.key))
				src<<"You were forced out of the game. Try again in 5 minutes."
				sleep(2)
				del(src.client)
			for(var/X in BannedTK)
				var/XX=copytext(X,15)
				if(src.ckey==XX)
					var/TX=copytext(X,1,11)
					var/HX=copytext(X,12,14)
					src<<"<font color=red>You are banned from [world.name]. Your ban is due to expire on: [TX]. You will be automatically unbanned at around [HX]:00 (EST)"
					sleep(2)
					del(src.client)
			if(BannedSK.Find(src.ckey))
				BannedSA.Add(src.client.address)
				var/savefile/Z = new("World Save Files/Bans.sav")
				Z["BannedSA"]<<BannedSA
				usr<<"<font color=red>You are banned from [world.name]. Your ban is due to expire on: N/A"
				sleep(2)
				del(src.client)
			if(BannedSA.Find(src.client.address))
				BannedSK.Add(src.ckey)
				var/savefile/Z = new("World Save Files/Bans.sav")
				Z["BannedSK"]<<BannedSK
				src<<"<font color=red>You are banned from [world.name]. Your ban is due to expire on: N/A"
				sleep(2)
				del(src.client)
			if(BannedK.Find(src.ckey))
				src<<"<font color=red>You are banned from [world.name]. Your ban is due to expire on: N/A"
				sleep(2)
				del(src.client)
			if(BannedA.Find(src.client.address))
				src<<"<font color=red>You are banned from [world.name]. Your ban is due to expire on: N/A"
				sleep(2)
				del(src.client)
mob/proc/AdminLoad()
	src.GMLevel = 0
	if(BudoMaster.Find(src.ckey))
		for(var/X in typesof(/mob/TourneyMaster/verb))
			src.verbs+=X
	if(src.ckey == "anstey93"||src.ckey=="drkidvictor"||src.ckey=="gintokisempai")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
			src.verbs+=X
		src.GMLevel = 7
		return
	if(StaffEnf.Find(src.ckey))
		src.GMLevel = 6
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
			src.verbs+=X
		return
	if(MasterEnf.Find(src.ckey))
		src.GMLevel = 5
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
			src.verbs+=X
		return
	if(HighEnf.Find(src.ckey))
		src.GMLevel = 4
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		return
	if(MediumEnf.Find(src.ckey))
		src.GMLevel = 3
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		return
	if(LowEnf.Find(src.ckey))
		src.GMLevel = 2
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		return
	if(TrialEnf.Find(src.ckey))
		src.GMLevel = 1
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		return
/*	if(src.client.address==null||!src.client.address)
		host=src.key
		world.status = "<font size = -2><br><B>Dragonball Z </b><br><b>Players:</b>[players]<br><b>Version:</b> [world.version].[sub_version]<br><b>Host:</b> [hst]<br>"
		if(src.client)
			alert("You have been given Host Powers")
			src.GMLevel=5
			for(var/X in typesof(/mob/System/Admin/Verbs/Monitor/verb))
				src.verbs+=X
			for(var/X in typesof(/mob/System/Admin/Verbs/High_Monitor/verb))
				src.verbs+=X
			for(var/X in typesof(/mob/System/Admin/Verbs/Game_Admin/verb))
				src.verbs+=X
			for(var/X in typesof(/mob/Host/verb))
				src.verbs+=X
			return*/

mob/proc/GMLockCheck()
	if(usr.GMLock==1)
		return 1
	return 0
proc/AdminMessage(MSG)
	for(var/mob/X in world)
		if(X.GMLevel>=1)
			X<<"<b><font color=#FFCC00><font color=red>Admin Message:</font> [MSG]"
proc/AdminChat(MSG)
	for(var/mob/X in world)
		if(X.GMLevel>=1)
			X<<"<b><font color=#FFCC00><font color=red>Admin Chat: <font color=#FFFFFF>[usr]:</font></font> [MSG]"
mob/System/Admin/Verbs
	TrialGM/verb
		Change_Skin(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/nskin=input("Don't abuse this verb. Use it only for people whom's icon got bugged. (f at the end means female)")in list("white","tan","dark","whitef","tanf","darkf")
			M.skin=nskin
			M.Skin_Apply()
		Admin_Online()
			set category="Admin"
			for(var/mob/PC/M in world)
				if(M.GMLevel)
					src<<"<font color=red>[M]([M.key])"
		Votes_Toggle()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Enable or Disable player's votes? Only enable if there are no GMs on to enforce.","","Enable","Disable"))
				if("Disable")
					voteson=0
					AdminMessage("[usr]([usr.key]) has Disabled Player Votes")
				else
					voteson=1
					AdminMessage("[usr]([usr.key]) has Enabled Player Votes")
		Teleport()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/mob/WH
			var/YN
			Start
			var/XT=alert("Teleport Someone Else or Yourself","Teleport","Self","Other")
			var/mob/Targ
			if(XT=="Other")
				WH=input("Whom Do You Wish To Teleport?")as mob in world
				Targ=input("Whom do you wish to teleport [WH] to?")as mob in world
				YN=alert({"Is This Correct?
 Teleport: [WH]
 Target: [Targ]"},"Correct?","Yes","No")
			if(XT=="Self")
				Targ=input("Whom do you wish to teleport to?")as mob in world
				WH=usr
				YN=alert({"Is This Correct?
 Teleport: [XT]
 Target [Targ]"},"Correct?","Yes","No","Cancel")
			if(YN=="No")
				goto Start
			if(YN=="Cancel")
				return
			AdminMessage("[usr]([usr.key]) has Teleported: [WH] to [Targ]")
			WH.loc=Targ.loc
			return

		Announce()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/msg = input("Announce")as message
			if(!msg)return
			world << "<p align=center><font color = red>[src] would like to Announce:<br></p><hr align=center><div align=center><font color = red>[msg]<br></div><hr align=center>"
			return

		Admin_Chat(T as text)
			set category="Admin"
			AdminChat(T)
			return

		Boot(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to boot [M]?","Boot [M]","Yes","No"))
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried Booting [M].")
						return
					else
						var/Reason=input("Input a reason if wanted.")as null|text
						if(Reason)
							world<<"<b>[M] has been <font color = red>Booted</font> by [src].([Reason])"
							for(var/obj/Earth_Dragonballs/O1 in M)
								O1.loc = M.loc
							for(var/obj/Namek_Dragonballs/O2 in M)
								O2.loc = M.loc
							for(var/obj/Black_Dragonballs/O3 in M)
								O3.loc = M.loc
							del(M)
							return
						else
							world<<"<b>[M] has been <font color = red>Booted</font> by [src]."
							for(var/obj/Earth_Dragonballs/O1 in M)
								O1.loc = M.loc
							for(var/obj/Namek_Dragonballs/O2 in M)
								O2.loc = M.loc
							for(var/obj/Black_Dragonballs/O3 in M)
								O3.loc = M.loc
							del(M)
							return
					if("No")
						return
		World_Mute()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Do you want to Mute or UnMute the world?","","Mute","UnMute"))
				if("Mute")
					World_Mute=1
					world<<"\red [src] has Muted the World"
					return
				if("UnMute")
					World_Mute=0
					world<<"\red [src] has Unmuted the World"
					return
		Mute(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!M.client)return
			if(!M.loggedin)return
			switch(alert("Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			if(M.GMLevel>=GMLevel)
				AdminMessage("[usr] tried Muting [M]")
				return
			else
				var/Reason=input("Input a reason if wanted.")as null|text
				var/Time=input({"For How Long? (In Seconds)
(Max of 600 Seconds (10 Minutes))
(Input 0 or below 0 for target to remiain muted until
unmuted. Any time past 10 minutes will be lowered
to 10 minutes.)"})as num
				if(!M)return
				if(Time>=600)
					Time=600
				if(Time>=1)
					Time*=10
				if(Reason)
					if(Time)
						world<<"<b>[M] has been <font color=red>Muted</font> by [src]. ([Reason])([Time/10] Seconds)"
					else
						world<<"<b>[M] has been <font color=red>Muted</font> by [src]. ([Reason])"
				else
					if(Time)
						world<<"<b>[M] has been <font color=red>Muted</font> by [src]. ([Time/10] Seconds)"
					else
						world<<"<b>[M] has been <font color=red>Muted</font> by [src]."
				if(Time<=0)
					return
				if(!M)return
				M.muted = 1
				M.UnmuteTimer(Time)
		Unmute(mob/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!M.muted)
				usr<<alert("[M] is not muted!")
				return
			switch(alert("Are you sure you want to unmute [M]?","UnMute [M]","Yes","No"))
				if("Yes")
					world<<"<b>[M] has been <font color=red>UnMuted</font> by [src]."
					M.oocmute = 0
					M.saymute = 0
					M.spam_delay = 0
					M.muted = 0
					return
				if("No")
					return
		Warn(mob/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to warn [M]?","Warn [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			var/Warn=input("Include What In The Warning? (Admin Warning: \[Warning\])")as text
			var/Type=input("Alert (Popup) or send in chat bar?")in list(/*"Alert"*/,"Text")
			if(Type=="Alert")
				M<<alert("Admin Warning: [Warn] ~ [usr]")
			if(Type=="Text")
				M<<"<font color =#105090><font color=red>Admin Warning: </font>[Warn] ~ [usr]"
			AdminMessage("[usr] Warned [M]: [Warn].")
			return
	LowGM/verb
		View_Player_Stats(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			src << "---------------------"
			src << "<font size = 4>[M]</size>"
			src << "<font size = 2>Key: [M.key]</size>"
			src << "Level: [M.level]"
			src << "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]"
			src << "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]"
			src << "Ki Def: [num2text(M.kidefense,10000000)] / [num2text(M.kidefense_max,10000000)]"
			src << "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]"
			src << "Defence: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]"
			src << ""
			src << "TP: [M.tp]"
			src << "CP: [M.custom_points]"
			src << "SP: [M.skill_points]"
			src << ""
			src << "Block Skill: [M.block] %"
			src << "Counter Skill: [M.counter] %"
			src << "Reflect Skill: [M.reflect] %"
			src << "Dodge Skill: [M.dodge] %"
			src << "Critical Skill: [M.critical] %"
			src << ""
			src << "Karma: [M.karma]"
			src << "Karma%: [M.karma_rating]"
			src << "Race: [M.race]"
			src << "Energy Code: [num2text(M.energy_code,1000000)]"
			src << "---------------------"
			return
		Mute_Channels()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("What do you want to do?","","Mute Channels","UnMute Channels","Cancel"))
				if("Cancel")
					return
				if("UnMute Channels")
					channelmute=""
					world<<"\red [src] has UnMuted all chat channels!"
					return
				if("Mute Channels")
					switch(alert("Do you want to include the Say channel?","Yes","No"))
						if("No")
							channelmute="On"
							world<<"\red [src] has Muted all chat channels(Say is available)!"
							return
						if("Yes")
							channelmute="All"
							world<<"\red [src] has Muted all chat channels!"
							return
		Saga_Difficulty()
			set category = "Admin"
			switch(alert({"What Difficulty do you wish to set the Sagas to?
Easy(50%)
Medium(100%)
Hard(200%)"},"Saga Difficulty","Easy","Medium","Hard"))
				if("Easy")
					saga_difficulty = "Easy"
					world << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
				if("Medium")
					saga_difficulty = "Medium"
					world << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
				if("Hard")
					saga_difficulty = "Hard"
					world << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
		Revive(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!M.client)return
			if(!M.loggedin)return
			if(M.dead==1)
				M.Power_Redefine()
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
				switch(M.spawn_point)
					if("Babidi")
						M.loc = locate(376,245,1)
					if("Yamcha")
						M.loc = locate(129,164,1)
					if("Frieza")
						M.loc = locate(247,32,2)
					if("Goku")
						M.loc = locate(125,50,1)
					if("Guru")
						M.loc = locate(57,167,2)
					if("Hercule")
						M.loc = locate(50,165,1)
					if("Roshi")
						M.loc = locate(179,25,1)
					if("Piccolo")
						M.loc = locate(304,182,2)
					if("Tien")
						M.loc = locate(206,244,1)
					if("Vegeta")
						M.loc = locate(215,144,1)
					if("Yardrat")
						M.loc = locate(95,105,4)
				M.safe = 0
				M.dead = 0
				world<<"<b>[M] has been revived by [usr]</b>"
				return
			else
				usr<<" [M] isn't dead."
				return
		Environmental_Damage()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Turn Environmental Damage On or Off?","","On","Off"))
				if("On")
					AdminMessage("[usr]([usr.key]) turned Environmental Damage On")
					grass_damage=1
					return
				if("Off")
					AdminMessage("[usr]([usr.key]) turned Environmental Damage Off")
					grass_damage=0
					return
		Summon(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Summon [M]?","Summon","Yes","No"))
				if("Yes")
					AdminMessage("[usr]([usr.key]) has Summoned [M]")
					if(!usr)return
					if(!M)return
					M.loc = locate(src.x,src.y-1,src.z)
					return
				else
					return
		HTML_Announce(message as message)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			for(var/mob/M in world)
				var/html_doc = "<head><title>Announcment</title></head><body bgcolor=#000000 text=#FFFFFF><center><B><U><font color = red><font size=1><font face=Verdana>Announcement</U><BR>From: [usr]</font><BR><BR><font face=Verdana><font color=COCOCO>[message]"
				M << browse(html_doc,"window=Announce")
			return
		BanList()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Select List: KeyBan. IPBan.") in list("Key Ban","IP Ban","Timer Ban"))
				if("Key Ban")
					input("Banned List:","Banned List(Key)")as null|anything in BannedK
					input("Banned List:","Banned List(Key Spider)")as null|anything in BannedSK
					return
				if("IP Ban")
					input("Banned List:","Banned List(IP)")as null|anything in BannedA
					input("Banned List:","Banned List(IP Spider)")as null|anything in BannedSA
					return
				if("Timer Ban")
					input("Banned List:","Banned List(Timer)")as null|anything in BannedTK
					return
			return
		UnBan()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/ListB=input("Unban what?")in list("Key","IP","Cancel")
			if(ListB=="Cancel")
				return
			var/Utype=input("Unban from a list or type it in?")in list("List Unban","Specific Unban","Timer Ban List")
			if(ListB=="IP")
				if(Utype=="Specific Unban")
					var/ipunban = input("Unban wich IP?") as null|text
					if(!ipunban)return
					if(BannedA.Find(ipunban))
						BannedA.Remove(ipunban)
						var/savefile/Z = new("World Save Files/Bans.sav")
						Z["BannedA"]<<BannedA
						AdminMessage("[src] Unbanned: [ipunban]")
					else
						src<<"IP not found."
					if(BannedSA.Find(ipunban))
						BannedSA.Remove(ipunban)
						var/savefile/Z = new("World Save Files/Bans.sav")
						Z["BannedSA"]<<BannedSA
						AdminMessage("[src] Unbanned: [ipunban]")
					else
						src<<"IP not found."
				if(Utype=="List Unban")
					var/selected=input("Wich IP do you wish to unban?")as null|anything in BannedA
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							if(BannedA.Find(selected))
								BannedA.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								var/savefile/Z = new("World Save Files/Bans.sav")
								Z["BannedA"]<<BannedA
				if(Utype=="Timer Ban List")
					var/selected=input("Who do you wish to unban?")as null|anything in BannedTK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							if(BannedTK.Find(selected))
								BannedTK.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								var/savefile/Z = new("World Save Files/Timer Bans.sav")
								Z["BannedTK"]<<BannedTK
			else
				if(Utype=="Timer Ban List")
					var/selected=input("Who do you wish to unban?")as null|anything in BannedTK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							if(BannedTK.Find(selected))
								BannedTK.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								var/savefile/Z = new("World Save Files/Timer Bans.sav")
								Z["BannedTK"]<<BannedTK
				if(Utype=="Specific Unban")
					var/keyunban = input("Unban wich Key?") as null|text
					if(!keyunban)return
					var/ckeyunban=ckey(keyunban)
					for(var/X in BannedTK)
						var/XX=copytext(X,15)
						if(XX==keyunban)
							BannedTK.Remove(X)
							AdminMessage("[src] Unbanned: [ckeyunban]")
							var/savefile/Z = new("World Save Files/Timer Bans.sav")
							Z["BannedTK"]<<BannedTK
					if(BannedK.Find(ckeyunban))
						BannedK.Remove(ckeyunban)
						AdminMessage("[src] Unbanned: [ckeyunban]")
					else
						src<<"Key not found."
					if(BannedSK.Find(ckeyunban))
						BannedSK.Remove(ckeyunban)
						AdminMessage("[src] Unbanned: [ckeyunban]")
					else
						src<<"Key not found."
					if(CreationSpam.Find("1[ckeyunban]"))
						CreationSpam.Remove("1[ckeyunban]")
					if(CreationSpam.Find("2[ckeyunban]"))
						CreationSpam.Remove("2[ckeyunban]")
					if(CreationSpam.Find("3[ckeyunban]"))
						CreationSpam.Remove("3[ckeyunban]")
					var/savefile/Z = new("World Save Files/Bans.sav")
					Z["BannedK"]<<BannedK
					Z["BannedSK"]<<BannedSK
					var/savefile/S = new("World Save Files/GM.sav")
					S["CreationSpam"]<<CreationSpam
					return
				if(Utype=="List Unban")
					var/selected=input("Wich Key do you wish to unban?")as null|anything in BannedK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							for(var/X in BannedTK)
								var/XX=copytext(X,15)
								if(XX==selected)
									BannedTK.Remove(X)
									var/savefile/Z = new("World Save Files/Timer Bans.sav")
									Z["BannedTK"]<<BannedTK
							if(BannedK.Find(selected))
								BannedK.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								if(CreationSpam.Find("1[selected]"))
									CreationSpam.Remove("1[selected]")
								if(CreationSpam.Find("2[selected]"))
									CreationSpam.Remove("2[selected]")
								if(CreationSpam.Find("3[selected]"))
									CreationSpam.Remove("3[selected]")
								var/savefile/Z = new("World Save Files/Bans.sav")
								Z["BannedK"]<<BannedK
								var/savefile/S = new("World Save Files/GM.sav")
								S["CreationSpam"]<<CreationSpam
								return



		WorldReboot()
			set category="Admin"
			set name = "World Reboot"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to reboot the world?","Reboot World","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			Yes
			var/TTime=input("Enter a number 5-15.")as num
			if(TTime<5||TTime>15)
				return
			AdminMessage("[usr] has innitiated the world reboot.")
			GM_WorldShutDownProc=1
			world<<"<font color=red>Server Reboot enabled. Saving Characters."
			for(var/mob/PC/M in world)
				if(!M.loggedin)continue
				M.client.SaveChar()
				sleep(1)
			sleep(20)
			world<<"<font color=red>Characters Saved!"
			while(TTime>=1)
				if(TTime<=5)
					cantsaveatall=1
				world<<"<center>Server Reboot in [TTime] Seconds."
				TTime-=1
				sleep(10)
			world<<"Rebooting...Safely logging out players."
			for(var/mob/PC/M in world)
				if(!M.client)continue
				if(M==src)continue
				del(M)
				sleep(1)
			sleep(5)
			world.Reboot()
	MedGM/verb
		Ban_Manually()
			set category = "Admin"
			if(usr.GMLock==1)
				usr<<"Your GM Powers were locked!"
				return
			var/ipkey=input("Ban a Key or IP?")in list("Key","IP","Cancel")
			if(ipkey=="Cancel")
				return
			var/k = input("Type in the key or IP you wish to Ban:")as text
			if(k == src.ckey)
				usr << "You sure you want to Ban yourself? NoOb"
				return
			if(k==src.client.address)
				usr << "You sure you want to Ban yourself? NoOb"
				return
			if(!k)
				return
			if(StaffEnf.Find(k)&&src.GMLevel<7)
				src<<"You can only ban people with lower GM level than you."
			if(MasterEnf.Find(k)&&src.GMLevel<6)
				src<<"You can only ban people with lower GM level than you."
			if(HighEnf.Find(k)&&src.GMLevel<5)
				src<<"You can only ban people with lower GM level than you."
			if(MediumEnf.Find(k)&&src.GMLevel<4)
				src<<"You can only ban people with lower GM level than you."
			if(LowEnf.Find(k)&&src.GMLevel<3)
				src<<"You can only ban people with lower GM level than you."
			if(TrialEnf.Find(k)&&src.GMLevel<2)
				src<<"You can only ban people with lower GM level than you."
			if(k == "anstey93")
				switch(alert("Are you 100% sure you want to ban [k]?","","Ban","Cancel"))
					if("Ban")
						if(src.ckey != "anstey93")
							world << "[src] was <font color = red>Auto Smited</font> for trying to Ban Maciek."
							BannedA.Add(src.client.address)
							BannedK.Add(src.ckey)
							BanSave()
							del(src)
						else
							return
					else
						return
			if(k!="anstey93")
				switch(alert("Spider or Timer?","","Spider","Timer","Cancel"))
					if("Cancel")return
					if("Spider")
						if(ipkey=="Key")
							var/ck=ckey(k)
							BannedSK.Add(ck)
						if(ipkey=="IP")
							BannedSA.Add(k)
						BanSave()
					if("Timer")
						var/list/banyy=list("2008","2009")
						var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
						var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
						var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
						var/monthban=input("Select the month of the unban:")in banmm
						var/dayban=input("Select the day of the unban:")in bandd
						var/yearban=input("Select the year of the unban:")in banyy
						var/hourban=input("Select the hour of the unban:")in banhh
						var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
						if(ipkey=="Key")
							var/ck=ckey(k)
							BannedTK.Add("[bantime] [ck]")
						if(ipkey=="IP")
							BannedTK.Add("[bantime] [k]")
						var/savefile/Z = new("World Save Files/Timed Bans.sav")
						Z["BannedTK"]<<BannedTK
				AdminMessage("[usr]([usr.key]) has \red Banned</font> [k]")
				return
			else
				return
		AFKCheck()
			set category = "Admin"
			set name = "AFK Check"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/tmp/lstafk
			if(!lastafk)
				lstafk="Not performed yet"
			else
				lstafk="[round(((world.time/10)/60)-((lastafk/10)/60))] minutes ago"
			switch(alert("Last AFK Check: [lstafk]. AFK Check? It's best you don't use this verb more than once every hours.","","AFK Check","No"))
				if("No")
					return
				else
					AdminMessage("[src] has started the AFK Checker.")
					world.AFKCHECKSTART()
		AFKCheck_Specific(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("AFK Check [M]?","","Yes","No"))
				if("Yes")
					switch(alert("Boot or Ban?","","Boot","Ban","Cancel"))
						if("Cancel")return
						if("Boot")
							if(!M)return
							if(!M.client)return
							if(M.loggedin!=1)return
							if(M.GMLevel)
								AdminMessage("[src] tried to AFK Checked [M] (Boot).")
								return
							var/textafk=input("What do you wish the check text to be? Leave blank for default 2 letters.")as text
							if(!M)return
							if(lentext(textafk)>5)
								textafk=copytext(textafk,1,6)
							AdminMessage("[src] has AFK Checked [M] (Boot)(Check Text: [textafk]).")
							spawn(1)M.AFKPOPTIME("BOOT")
							spawn(1)M.AFKPOPSPECIF(textafk)
						if("Ban")
							if(!M)return
							if(!M.client)return
							if(M.loggedin!=1)return
							if(M.GMLevel)
								AdminMessage("[src] tried to AFK Checked [M] (Ban).")
								return
							var/textafk=input("What do you wish the check text to be? Leave blank for default 2 letters.")as text
							if(!M)return
							if(lentext(textafk)>5)
								textafk=copytext(textafk,1,6)
							AdminMessage("[src] has AFK Checked [M] (Ban)(Check Text: [textafk]).")
							spawn(1)M.AFKPOPTIME("BAN")
							spawn(1)M.AFKPOPSPECIF(textafk)
				else
					return
		SpeedGearCheck()
			set hidden =1
			set category = "Admin"
			set name = "SpeedGear Check"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			alert("** This doesn't determine if the person does have SpeedGear on, but it checks to see if he/she is gaining more stats than usual. \
			This is how it works. The target must be either self training or lifting weights/punching machines. \
			You will get time shown while the target is under check. All you have to do is subtract two times and compare them \
			with these average delay times: Self Train - 1.1 seconds; Weight Lift 2.7 seconds; Machine Punch: 2.7 seconds. *This \
			is not 100% acurate, specially if there is alot of lag. Always double check before making a decision.*")
			for(var/mob/M in world)
				M.undercheck=0
				M.checker=""
			var/mob/SGC = input("Who do you want to check?")as mob in world
			switch(alert("Check or Stop checking [SGC]?","","Check","Stop"))
				if("Check")
					src<<" In 10 seconds [SGC] will automatically be stopped checking."
					spawn(100)
						if(!SGC)return
						SGC.undercheck=0
						SGC.checker=""
					SGC.undercheck=1
					SGC.checker=src
				else
					SGC.undercheck=0
					SGC.checker=""
					return
		Multi_Key()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("What do you want to do?","Multy key")in list("MuliKey Check","Toggle MultiKey","Give Permission","Cancel"))
				if("Give Permission")
					var/mob/who = input("Allow who to MultiKey?")as mob in world
					if(who.client)
						switch(alert("Allow [who] to MK or disallow","","Allow","Disallow","Cancel"))
							if("Allow")
								if(!who)return
								who.canMK = 1
								AdminMessage("[usr] allowed [who] to MultiKey")
								return
							if("Disallow")
								if(!who)return
								who.canMK = 0
								AdminMessage("[usr] disallowed [who] to MultiKey")
								return
							if("Cancel")
								return
				if("MuliKey Check")
					var/Found[0]
					for(var/mob/M in world)
						if(Found.Find(M))continue
						if(M.client)
							for(var/mob/M2 in world)
								if(!M2.client)continue
								if(!M2)continue
								if(M == M2)continue
								if(M.client.address == M2.client.address)
									Found += M
									Found += M2
									usr << "<B>\red Match Found!"
									usr << "<B><font color = #999999>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- Address:</font> [M.client.address]."
									usr << "<B><font color = #999999>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- Address:</font> [M2.client.address]."
				if("Toggle MultiKey")
					if(!MK)
						MK = 1
						AdminMessage("[usr] turned MultiKey <font color = green>On")
						return
					if(MK==1)
						MK = 0
						AdminMessage("[usr] turned MultiKey <font color = red>Off")
						return
				if("Cancel")
					return
		Revive_World()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Revive the world?","","Yes","No"))
				if("Yes")
					for(var/mob/PC/M in world)
						if(!M.client)continue
						if(!M.loggedin)continue
						if(M.dead)
							M.overlays -= 'Halo.dmi'
							M.x = rand(10,390)
							M.y = rand(10,390)
							M.z = rand(1,4)
							M.safe = 0
							M.dead = 0
							M.it_lock=0
							M.it_blocked=0
					world<<"<b><font color=red>[usr] has revived the world!</b>"
				else
					return
		Rename(mob/M as mob in world, ID as text)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!ID)return
			if(!M)return
			for(var/mob/N in world)
				if(N.name==""||N.name==null||N.name==0)
					N.name="NameLess"
					usr<<"<font color=red>Found Nameless. Renamed to NameLess. Key: [N.key]"
			var/namecheck=ID
			if(NameList.Find(namecheck))
				alert("For file safety reasons you may not rename using an already taken name. [ID] is taken, please pick another name.")
				return
			AdminMessage("[usr]([usr.key]) has Renamed [M] to [ID]")
			var/savefile/S=new("World Save Files/Player Names.sav")
			NameList.Remove(M.name)
			M.name=ID
			NameList.Add(namecheck)
			S["NameList"]<<NameList
			usr << "You <font color = green>Changed</font> [M]'s name."
			return
		Sagas_Management()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Start or Stop sagas?","","Start","Stop","Cancel"))
				if("Start")
					switch(alert("Good or Evil Sagas?","","Good","Evil","Cancel"))
						if("Cancel")
							return
						if("Evil")
							for(var/mob/Saga/M in world)
								del(M)
							world << "<font color = lime>Saga Information:</font> Sagas have been Activated!"
							sagas_on=1
							sagas_evil=1
							sagas_good=0
							saga="Not On"
							part="Not On"
							saga_difficulty="Easy"
							saga_episode=0
							saga_spawned=0
							spawn(10)world.SAGA_CHECK()
						if("Good")
							src<<"This is under progress."
							return
						/*	for(var/mob/Saga/M in world)
								del(M)
							world << "<font color = lime>Saga Information:</font> Sagas have been Activated!"
							sagas_on=1
							sagas_evil=0
							sagas_good=1
							saga="Not On"
							part="Not On"
							saga_difficulty="Easy"
							saga_episode=0
							SAGA_CHECK()
							return*/
				if("Stop")
					world << "<font color = lime>Saga Information:</font> Sagas have been De-Activated!"
					sagas_on=0
					sagas_evil=0
					sagas_good=0
					saga_spawned=0
					saga="Not On"
					part="Not On"
					saga_difficulty="Easy"
					saga_episode=0
					for(var/mob/Saga/M in world)
						del(M)
					return
				if("Cancel")
					return
		Ban()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/BP=new/list()
			for(var/mob/PC/C in world)
				BP.Add(C)
			BP.Add("Cancel")
			var/mob/M=input("Who do you wish to Ban?")in BP
			if(M=="Cancel")
				return
			if(!M)
				src<<"Target has logged out."
				return
			var/bankey=M.ckey
			var/banip=M.client.address
			switch(alert("Are you sure you want to ban [M]([bankey])?","Ban [M]","Yes","No"))
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried Banning [bankey].")
						return
					else
						var/Reason=input("Input a reason.")as text
						var/Type=input("Ban Key or Address?")in list("Key","Address","Both")
						var/timer=input("Do you want to include an auto unban timer?")in list("No","Yes")
						if(timer=="Yes")
							goto skipage
						var/spider=input("Do you wish to Spider Ban(Auto bans new keys and ips that the player may use)?")in list("Normal Ban","Spider Ban")
						skipage
						world<<"<b>[M]([M.key]) has been <font color = red>Banned</font> by [src]. ([Type])([Reason])"
						if(Type=="Key")
							if(timer=="Yes")
								var/list/banyy=list("2008","2009")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the year of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
								BannedTK.Add("[bantime] [bankey]")
								var/savefile/Z = new("World Save Files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
							else
								if(spider=="Normal Ban")
									BannedK.Add(bankey)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedK"]<<BannedK
								if(spider=="Spider Ban")
									BannedSK.Add(bankey)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedSK"]<<BannedSK
						if(Type=="Address")
							if(timer=="Yes")
								var/list/banyy=list("2008","2009")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the day of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
								BannedTK.Add("[bantime] [banip]")
								var/savefile/Z = new("World Save Files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
							if(timer=="No")
								if(spider=="Normal Ban")
									BannedA.Add(banip)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedA"]<<BannedA
								else
									BannedSA.Add(banip)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedSA"]<<BannedSA
						if(Type=="Both")
							if(timer=="Yes")
								var/list/banyy=list("2008","2009")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the day of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]/[hourban]"
								BannedTK.Add("[bantime] [bankey]")
								BannedTK.Add("[bantime] [banip]")
								var/savefile/Z = new("World Save Files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
							if(timer=="No")
								if(spider=="Normal Ban")
									BannedK.Add(bankey)
									BannedA.Add(banip)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedA"]<<BannedA
									Z["BannedK"]<<BannedK
								if(spider=="Spider Ban")
									BannedSK.Add(M.ckey)
									BannedSA.Add(M.client.address)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedSA"]<<BannedSA
									Z["BannedSK"]<<BannedSK
						if(M)
							for(var/obj/Earth_Dragonballs/O1 in M)
								O1.loc = M.loc
							for(var/obj/Namek_Dragonballs/O2 in M)
								O2.loc = M.loc
							for(var/obj/Black_Dragonballs/O3 in M)
								O3.loc = M.loc
							del(M)
						return
				if("No")
					return
		Player_Check()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			usr<<"<font color=#105090>Player Information:"
			for(var/mob/M in world)
				if(M.client)
					usr<<"<font color=#105090>  Name: [M.name]. Key: [M.key]. Address: [M.client.address]."
			return
		World_Movement_Lock()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/GoGo=alert("Are you sure you want to lock everyone's movement?","World Movement Lock","Yes","No")
			if(GoGo=="No")
				return
			for(var/mob/M in world)
				if(usr==M) continue
				if(M.GMLevel>=GMLevel)
					M<<"You were not locked because you are an admin equal to or above [usr]'s rank."
					continue
				M.GMLocked=1
			world<<"[usr] has locked everyone's movement!"
			return
		World_Movement_UnLock()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/GoGo=alert("Are you sure you want to unlock everyone's movement?","World Movement UnLock","Yes","No")
			if(GoGo=="No")
				return
			for(var/mob/M in world)
				if(usr==M) continue
				if(M.GMLevel>=GMLevel)
					M<<"You were not unlocked because you are an admin equal to or above [usr]'s rank."
					continue
				M.GMLocked=0
			world<<"[usr] has unlocked everyone's movement!"
			return
		Invisibility()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/icon/Z=new(usr.icon)
	//		Z.DrawBox(rgb(1,1,1),1,32,11,15)
	//		Z.DrawBox(rgb(255,255,255),5,29,7,19)
	//		Z.DrawBox(rgb(255,255,255),3,29,9,27)
	//		Z.DrawBox(rgb(255,255,255),3,19,9,21)
			if(invisibility==0)
				usr.overlays+=Z
				invisibility=7
				src.density=0
				return
			else
				usr.overlays-=Z
				invisibility=0
				density = 1
				return
	HighGM/verb
		Start_Daycycle()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("What do you want to do?")in list("Start Daycycle","Stop Daycycle","Toggle Time","Cancel"))
				if("Start Daycycle")
					if(daycycleon)
						usr<<"Day cycle is already on."
						return
					daycycleon=1
					day=1
					night=0
					dawn=0
					daytime=120
					nighttime=90
					dawntime=30
					dayon=0
					nighton=0
					dawnon=0
					AdminMessage("[usr]([usr.key]) has Started the Daycycle.")
					spawn(10)world.Daycycle()
				if("Stop Daycycle")
					for(var/area/outside/A in world)
						A.overlays=null
					for(var/obj/Buildings/Roof/B in world)
						B.overlays=null
					for(var/obj/Buildings/Roof2/C in world)
						C.overlays=null
					for(var/obj/Buildings/Roof3/D in world)
						D.overlays=null
					daycycleon=0
					day=0
					night=0
					dawn=0
					dayon=0
					nighton=0
					dawnon=0
					daytime=120
					nighttime=90
					dawntime=30
					AdminMessage("[usr]([usr.key]) has Stopped the Daycycle.")
					return
				if("Toggle Time")
					if(!daycycleon)
						usr<<"Day cycle is off."
						return
					switch(alert("Select time of day","","Dawn","Day","Night"))
						if("Dawn")
							night=0
							day=0
							dawn=1
							dawntime=30
							nighton=0
							dayon=0
							dawnon=0
							daycycleon=1
						if("Day")
							night=0
							day=1
							daytime=120
							dawn=0
							nighton=0
							dayon=0
							dawnon=0
							daycycleon=1
						if("Night")
							night=1
							nighttime=90
							day=0
							dawn=0
							nighton=0
							dayon=0
							dawnon=0
							daycycleon=1
					AdminMessage("[usr]([usr.key]) has changed the time of day.")
					alert(usr,"Please allow up to 60 seconds for changes to take effect.")
				if("Cancel")
					return
		Admin_Lock(mob/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLevel==0)
				usr<<"<font color=red>[M] has no admin powers!"
				return
			if(M.GMLock==1)
				usr<<"<font color=red>[M]'s powers are locked!"
				return
			switch(alert("Are you sure you want to lock [M]'s admin powers?","Lock [M]","Yes","No"))
				if("No")
					return
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried Locking [M]'s Admin Powers")
						return
					var/Reason=input("What's the Reason?")as text
					M.GMLock=1
					AdminMessage("[usr] \red Locked \font [M]'s Admin Powers. (Reason: [Reason])")
					return
		Admin_UnLock(mob/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLevel==0)
				usr<<"<font color=red>[M] has no admin powers!"
				return
			if(M.GMLock==0)
				usr<<"<font color=red>[M]'s powers aren't locked!"
				return
			switch(alert("Are you sure you want to unlock [M]'s admin powers?","UnLock [M]","Yes","No"))
				if("No")
					return
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried UnLocking [M]'s Admin Powers")
						return
					var/Reason=input("What's the Reason?")as text
					M.GMLock=0
					AdminMessage("[usr] \red UnLocked \font [M]'s Admin Powers. (Reason: [Reason])")
					return
		Force_Start_Auto()
			set category="Server"
			AutoStartTourney()
		Movement_Lock(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Lock or UnLock [M]'s movement?","","Lock","UnLock"))
				if("Lock")
					switch(alert("Are you sure you want to lock [M]'s movement?","","Yes","No"))
						if("Yes")
							if(M.GMLevel>=GMLevel&&M!=usr)
								AdminMessage("[usr] tried locking [M]'s movement.")
								return
							else
								var/Reason=input("Input a reason.")as text
								if(Reason)
									world<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>Locked </font>by [src]. ([Reason])"
								else
									world<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>Locked </font> by [src]."
								M.GMLocked=1
								return
						if("No")
							return
				if("UnLock")
					switch(alert("Are you sure you want to UnLock [M]'s movement?","Movement UnLock [M]","Yes","No"))
						if("Yes")
							if(M.GMLevel>=GMLevel&&M!=usr)
								if(!GMLevel==7)
									AdminMessage("[usr] tried UnLocking [M]'s movement.")
							var/Reason=input("Input a reason.")as text
							if(Reason)
								world<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>UnLocked </font>by [src]. ([Reason])"
							else
								world<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>UnLocked </font> by [src]."
							M.GMLocked=0
							return
						if("No")
							return
		Delete(M as obj|turf)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Delete?","","Yes","No"))
				if("Yes")
					del(M)
					return
				else
					return
		Fix_Layers(mob/PC/M in world)
			set category = "Admin"
			switch(alert("Fix Overlays or Underlays?","","Overlays","Underlays","Cancel"))
				if("Cancel")
					return
				if("Overlays")
					M.overlays -= M.overlays
					return
				if("Underlays")
					M.underlays -= M.underlays
					if(M.aura_on == 1)
						M.aura_on = 0
					return
	MasterGM/verb
		World_ShutDown()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/YN=alert("Shutdown the world?","World ShutDown","No","Yes","Disable World Shutdown")
			if(YN=="No")
				return
			if(YN=="Disable World Shutdown")
				var/Stop=alert("Stop World Shutdown?","Stop World ShutDown.","Yes","No")
				if(Stop=="Yes")
					GM_WorldShutDownProc=0
					AdminMessage("[usr] stopped the world shutdown.")
					return
				else
					return
			if(YN=="Yes")
				GM_WorldShutDownProc=1
				world<<"<font color=red>World Shutdown enabled. Saving Characters."
				for(var/mob/PC/M in world)
					if(!M.loggedin)continue
					M.client.SaveChar()
					sleep(1)
				world<<"<font color=red>Characters Saved! World Shutdown in 30 seconds."
				AdminMessage("[usr] has innitiated the world shutdown.")
				sleep(100)
				if(!GM_WorldShutDownProc)
					world<<"<font color=red>World Shutdown disabled."
					return
				world<<"<font color=red>World Shutdown in 20 seconds."
				sleep(100)
				if(!GM_WorldShutDownProc)
					world<<"<font color=red>World Shutdown disabled."
					return
				world<<"<font color=red>World Shutdown in 10 seconds."
				cantsaveatall=1
				sleep(100)
				if(!GM_WorldShutDownProc)
					world<<"<font color=red>World Shutdown disabled."
					return
				world<<"<font color=red>Shutdown."
				sleep(1)
				del(world)
	StaffGM/verb
		InstaKill(mob/PC/M in world)
			set name = "Instant Kill"
			set category = "Admin"
			if(alert("Are You Sure You Want To Use The Insta Kill Verb On [M]?","Kill","Yes","No") == "Yes")
				M.powerlevel = 0
				M.DeathCheck(usr)
				if(M)
					usr<<"You Have Successfully Killed [M]."
		Spectate(mob/PC/M in world)
			set category = "Admin"
			client.eye = M
			usr<< "You Begin Spectating [M]."
			client.perspective = 255

		Stop_Spectate()
			set category = "Admin"
			set name = "Stop Spectating"
			client.eye = usr
		Give_Levels(mob/PC/M in world)
			set category = "Admin"
			switch(input("Give [M] Level's?") in list("Yes","No"))
				if("Yes")
					var/GiveL=input({"Enter The Amount Of Level's You Wish To Give To Them."})as num
					usr << "<font color=white>You Have Given [M]: [GiveL] Level's."
					while(GiveL>0)
						if(!M)return
						M.exp = M.tnl
						M.Level_Up()
						GiveL -= 1
						sleep(1)
				if("No")
					return
		Coords(varX as num, varY as num, varZ as num)
			set name = "Go To Coords"
			set category = "Admin"
			set desc = "X,Y,Z"
			if(varX > world.maxx)
				src.x = world.maxx
			else
				if(varX < 1)
					src.x = 1
			if(varY > world.maxy)
				src.y = world.maxy
			else
				if(varY < 1)
					src.y = 1
			if(varZ > world.maxz)
				src.z = world.maxz
			else
				if(varZ < 1)
					src.z = 1
			src.loc = locate(varX,varY,varZ)
		Dragonball_Manage()
			set category = "Admin"
			switch(input("Revive, Destroy or Summon?")in list("Revive","Destroy","Summon","Cancel"))
				if("Destroy")
					switch(alert("Destroy the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Destroy wich?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									for(var/obj/Earth_Dragonballs/O in world)
										del(O)
									return
								if("Namek")
									for(var/obj/Namek_Dragonballs/O in world)
										del(O)
									return
								if("Black Star")
									for(var/obj/Black_Dragonballs/O in world)
										del(O)
									return
								if("Cancel")
									return
						else
							return
				if("Revive")
					alert("The games has an implanted Auto Dragonball Spawner. You might create a chain dragonball spawn. Don't use this verb unless you know what your doing.")
					switch(alert("Revive the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Revive wich?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									var/lastdb
									if(!lastdbe)
										lastdb="Not performed yet"
									else
										lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Earth Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbe=world.time
										world.Earth_Dragonball_Spawn(1)
								if("Namek")
									var/lastdb
									if(!lastdbn)
										lastdb="Not performed yet"
									else
										lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Namekian Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbn=world.time
										world.Namek_Dragonball_Spawn(1)
								if("Black Star")
									var/lastdb
									if(!lastdbb)
										lastdb="Not performed yet"
									else
										lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Black Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbb=world.time
										world.Black_Dragonball_Spawn(1)
								if("Cancel")
									return
				if("Summon")
					switch(alert("Summon the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Summon wich?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									for(var/obj/Earth_Dragonballs/O in world)
										O.loc = locate(usr.x,usr.y,usr.z)
									return
								if("Namek")
									for(var/obj/Namek_Dragonballs/O in world)
										O.loc = locate(usr.x,usr.y,usr.z)
									return
								if("Black Star")
									for(var/obj/Black_Dragonballs/O in world)
										O.loc = locate(usr.x,usr.y,usr.z)
									return
								if("Cancel")
									return
						else
							return
		Demote_Manually()
			set category = "Admin"
			var/L = input("Demote a wich level GM")in list("Trial","Low","Medium","High","Master","Staff","Cancel")
			switch(L)
				if("Cancel")
					return
				if("Trial")
					var/M = input("Demote who?(Trial)")as null|anything in TrialEnf
					switch(alert("Demote [M]?(Trial)","","Yes","No"))
						if("Yes")
							TrialEnf.Remove(M)
						else
							return
				if("Low")
					var/M = input("Demote who?(Low)")as null|anything in LowEnf
					switch(alert("Demote [M]?(Low)","","Yes","No"))
						if("Yes")
							LowEnf.Remove(M)
						else
							return
				if("Medium")
					var/M = input("Demote who?(Medium)")as null|anything in MediumEnf
					switch(alert("Demote [M]?Medium)","","Yes","No"))
						if("Yes")
							MediumEnf.Remove(M)
						else
							return
				if("High")
					var/M = input("Demote who?(High)")as null|anything in HighEnf
					switch(alert("Demote [M]?(High)","","Yes","No"))
						if("Yes")
							HighEnf.Remove(M)
						else
							return
				if("Master")
					var/M = input("Demote who?(Master)")as null|anything in MasterEnf
					switch(alert("Demote [M]?(Master)","","Yes","No"))
						if("Yes")
							MasterEnf.Remove(M)
						else
							return
				if("Staff")
					var/M = input("Demote who?(Staff)")as null|anything in StaffEnf
					switch(alert("Demote [M]?(Staff)","","Yes","No"))
						if("Yes")
							StaffEnf.Remove(M)
						else
							return
		Promote_Admin(mob/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLock==1)
				usr<<"<font color=red>[M]'s Powers Are Locked!"
				return
			if(M.GMLevel>=src.GMLevel)
				usr<<"<font color=red>You can't promote people with higher or equal level as you."
				return
			switch(alert("Are you sure you want to Promote [M]?","Promote [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			var/GLevel=input("What level of admin do you want to give [M]?")as num
			var/GRank
			if(src.ckey!="anstey93")
				if(GLevel<=0||GLevel>4)
					usr<<alert("Enter a valid number between 1 and 4!")
					return
			else
				if(GLevel<=0||GLevel>6)
					usr<<alert("Enter a valid number between 1 and 6!")
					return
			switch(GLevel)
				if(1) GRank="Trial Enforcer"
				if(2) GRank="Low Enforcer"
				if(3) GRank="Med Enforcer"
				if(4) GRank="High Admin"
				if(5) GRank="Master Admin"
				if(6) GRank="Staff Member"
			switch(alert({"Is This Correct?
Target: [M] ([M.key])
Selected Rank: [GLevel], [GRank]"},"Promoting Admin","Yes","No"))
				if("Yes")
					goto Next
				if("No")
					return
			Next
			if(GLevel<=M.GMLevel)
				usr<<"They are already above or equal to that rank."
				return
			M.RemoveGM()
			AdminMessage("[usr] ([usr.key]) has made [M] ([M.key]) a [GRank]. [M] old level: [M.GMLevel]")
			sleep(1)
			switch(GLevel)
				if(1)
					TrialEnf.Add(M.ckey)
				if(2)
					LowEnf.Add(M.ckey)
				if(3)
					MediumEnf.Add(M.ckey)
				if(4)
					HighEnf.Add(M.ckey)
				if(5)
					MasterEnf.Add(M.ckey)
				if(6)
					StaffEnf.Add(M.ckey)
			M.GMLevel = GLevel
			spawn(1)M.AdminLoad()
			spawn(5)BanSave()
			spawn(8)M.client.SaveChar()
			sleep(10)
			alert(M,"[usr] has given you GM powers. Rank: [GRank]")
			return

		Demote_Admin(mob/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLevel==0)
				usr<<"<font color=red>[M] has no admin powers."
				return
			if(M.GMLevel>=src.GMLevel)
				usr<<"<font color=red>You can't demote people with higher or equal level as you."
				return
			switch(alert("Are you sure you want to Demote [M]?","Demote [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			var/GLevel=input("What level of admin do you want to demote [M] to?")as num
			var/GRank
			if(src.ckey!="anstey93")
				if(GLevel<=-1||GLevel>3)
					usr<<alert("Enter a valid number between 0 and 3!")
					return
			else
				if(GLevel<=-1||GLevel>5)
					usr<<alert("Enter a valid number between 0 and 5!")
					return
			switch(GLevel)
				if(0) GRank="Player"
				if(1) GRank="Trial Enforcer"
				if(2) GRank="Low Enforcer"
				if(3) GRank="Med Enforcer"
				if(4) GRank="High Admin"
				if(5) GRank="Master Admin"
			switch(alert({"Is This Correct?
Target: [M] ([M.key])
Selected Rank: [GLevel], [GRank]"},"Demoting Admin","Yes","No"))
				if("Yes")
					goto Next
				if("No")
					return
			Next
			if(M.ckey=="anstey93")
				alert("You can't demote teh uberness.")
				return
			if(GLevel>=M.GMLevel)
				usr<<"They are already below or equal to that rank."
				return
			M.RemoveGM()
			AdminMessage("[usr] ([usr.key]) has demoted [M] ([M.key]) to [GRank]. [M] old level: [M.GMLevel]")
			sleep(1)
			switch(GLevel)
				if(1)
					TrialEnf.Add(M.ckey)
				if(2)
					LowEnf.Add(M.ckey)
				if(3)
					MediumEnf.Add(M.ckey)
				if(4)
					HighEnf.Add(M.ckey)
				if(5)
					MasterEnf.Add(M.ckey)
				if(6)
					StaffEnf.Add(M.ckey)
			M.GMLevel = GLevel
			spawn(1)M.AdminLoad()
			spawn(5)BanSave()
			spawn(8)M.client.SaveChar()
		Give_Budokai_Master()
			set category = "Admin"
			switch(input("What do you want to do?")in list("Give Budokai Master","Remove Budokai Master","Cancel"))
				if("Cancel")
					return
				if("Give Budokai Master")
					var/list/L=new/list()
					for(var/mob/PC/M in world)
						L.Add(M)
					L.Add("Cancel")
					var/mob/B=input("Give who Budokai Master?")in L
					if(B=="Cancel")
						return
					switch(alert("Give [B] Budokai Master?","","Yes","No"))
						if("Yes")
							BudoMaster.Add(B.ckey)
							for(var/vx in typesof(/mob/TourneyMaster/verb))
								B.verbs+=vx
							AdminMessage("[usr] Gave [B] Budokai Master.")
							spawn(5)BanSave()
						else
							return
				if("Remove Budokai Master")
					var/B=input("Remove who's Budokai Master?")in BudoMaster
					switch(alert("Remove [B]'s Budokai Master?","","Yes","No"))
						if("Yes")
							for(var/mob/PC/M in world)
								if(M.ckey==B)
									for(var/vx in typesof(/mob/TourneyMaster/verb))
										M.verbs-=vx
							BudoMaster.Remove(B)
							AdminMessage("[usr] Gave [B] Budokai Master.")
							spawn(5)BanSave()
						else
							return
		Edit(mob/O as obj|mob|turf in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(ismob(O))
				if(O.GMLevel>=GMLevel)
					if(!GMLevel==7)
						alert("You can only Edit Admins of a rank lower than your own.")
						return
			switch(alert("Do you wish to edit a set variable or do you want to specify the var?","","Normal Edit","Specify Edit","Cancel"))
				if("Cancel")
					return
				if("Specify Edit")
					var/pw=input("This option is password protected so noobs don't mess up someone <.<")as text
					if(pw!="lolwtfbbq")
						return
					else
						var/list/Choices = list()
						var/newvar=input("Whats the name of the var you wich to edit?")as text
						for(var/V in O.vars)
							if(V==newvar)
								Choices.Add(newvar)
						Choices.Add("Cancel")
						var/variable = input("Which var?","Var") in Choices
						if(variable=="Cancel")
							return
						var/default
						var/typeof = O.vars[variable]
						var/dir
						if(isnull(typeof))
							usr << "Unable to determine variable type."
						else if(isnum(typeof))
							usr << "Variable appears to be <b>NUM</b>."
							default = "num"
							dir = 1
						else if(istext(typeof))
							usr << "Variable appears to be <b>TEXT</b>."
							default = "text"
						else if(isloc(typeof))
							usr << "Variable appears to be <b>REFERENCE</b>."
							default = "reference"
						else if(isicon(typeof))
							usr << "Variable appears to be <b>ICON</b>."
							typeof = "\icon[typeof]"
							default = "icon"
						else if(istype(typeof,/atom) || istype(typeof,/datum))
							usr << "Variable appears to be <b>TYPE</b>."
							default = "type"
						else if(istype(typeof,/list))
							usr << "Variable appears to be <b>LIST</b>."
							default = "cancel"
						else if(istype(typeof,/client))
							usr << "Variable appears to be <b>CLIENT</b>."
							default = "cancel"
						else
							usr << "Variable appears to be <b>FILE</b>."
							default = "file"
						usr << "Variable contains: [typeof]"
						if(dir)
							switch(typeof)
								if(1)
									dir = "NORTH"
								if(2)
									dir = "SOUTH"
								if(4)
									dir = "EAST"
								if(8)
									dir = "WEST"
								if(5)
									dir = "NORTHEAST"
								if(6)
									dir = "SOUTHEAST"
								if(9)
									dir = "NORTHWEST"
								if(10)
									dir = "SOUTHWEST"
								else
									dir = null
							if(dir)
								usr << "If a direction, direction is: [dir]"
						var/class = input("What kind of variable?","Variable Type",default) in list("text",
							"num","type","reference","icon","file","restore to default","cancel")
						switch(class)
							if("cancel")
								return
							if("restore to default")
								O.vars[variable] = initial(O.vars[variable])
							if("text")
								O.vars[variable] = input("Enter new text:","Text",\
									O.vars[variable]) as text
							if("num")
								O.vars[variable] = input("Enter new number:","Num",\
									O.vars[variable]) as num
							if("type")
								O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
									in typesof(/obj,/mob,/turf)
							if("reference")
								O.vars[variable] = input("Select reference:","Reference",\
									O.vars[variable]) as mob|obj|turf in world
							if("file")
								O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
									as file
							if("icon")
								O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
									as icon
				if("Normal Edit")
					var/list/Choices = list("level","exp","powerlevel","powerlevel_max","ki","ki_max","strength","strength_max","defence","defence_max","staminaleft","staminaleft_max","karma","karma_rating","rage","wishes","tp","skill_points","custom_points","zenni")
					for(var/V in O.vars) Choices.Add(V)
					Choices-="key"
					Choices-="ckey"
					Choices-="contents"
					Choices-="verbs"
					Choices-="overlays"
					Choices-="underlays"
					Choices-="GMLevel"
					Choices-="GMLock"
					Choices-="GMLocked"
					Choices-="GM_ChatMute"
					Choices-="vars"
					Choices-="group"
					Choices-="type"
					Choices-="parent_type"
					Choices-="client"
					var/variable = input("Which var?","Var") in Choices
					var/default
					var/typeof = O.vars[variable]
					var/dir
					if(isnull(typeof))
						usr << "Unable to determine variable type."
					else if(isnum(typeof))
						usr << "Variable appears to be <b>NUM</b>."
						default = "num"
						dir = 1
					else if(istext(typeof))
						usr << "Variable appears to be <b>TEXT</b>."
						default = "text"
					else if(isloc(typeof))
						usr << "Variable appears to be <b>REFERENCE</b>."
						default = "reference"
					else if(isicon(typeof))
						usr << "Variable appears to be <b>ICON</b>."
						typeof = "\icon[typeof]"
						default = "icon"
					else if(istype(typeof,/atom) || istype(typeof,/datum))
						usr << "Variable appears to be <b>TYPE</b>."
						default = "type"
					else if(istype(typeof,/list))
						usr << "Variable appears to be <b>LIST</b>."
						default = "cancel"
					else if(istype(typeof,/client))
						usr << "Variable appears to be <b>CLIENT</b>."
						default = "cancel"
					else
						usr << "Variable appears to be <b>FILE</b>."
						default = "file"
					usr << "Variable contains: [typeof]"
					if(dir)
						switch(typeof)
							if(1)
								dir = "NORTH"
							if(2)
								dir = "SOUTH"
							if(4)
								dir = "EAST"
							if(8)
								dir = "WEST"
							if(5)
								dir = "NORTHEAST"
							if(6)
								dir = "SOUTHEAST"
							if(9)
								dir = "NORTHWEST"
							if(10)
								dir = "SOUTHWEST"
							else
								dir = null
						if(dir)
							usr << "If a direction, direction is: [dir]"
					var/class = input("What kind of variable?","Variable Type",default) in list("text",
						"num","type","reference","icon","file","restore to default","cancel")
					var/b4
					switch(class)
						if("cancel")
							return
						if("restore to default")
							b4=O.vars[variable]
							O.vars[variable] = initial(O.vars[variable])
						if("text")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter new text:","Text",\
								O.vars[variable]) as text
						if("num")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter new number:","Num",\
								O.vars[variable]) as num
						if("type")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
								in typesof(/obj,/mob,/turf)
						if("reference")
							b4=O.vars[variable]
							O.vars[variable] = input("Select reference:","Reference",\
								O.vars[variable]) as mob|obj|turf in world
						if("file")
							b4=O.vars[variable]
							O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
								as file
						if("icon")
							b4=O.vars[variable]
							O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
								as icon
					EditLog(src,"Edit: Target: [O] - Variable: [variable] - Before edit: [b4] - After edit: [O.vars[variable]]")
					return
		Create()
			set category="Admin"
			var/CCX
			var/CanMake[]
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/Type1=input("Select Creation Type")in list("Object","Turf","Mob","Cancel")
			if(Type1=="Object") goto Object
			if(Type1=="Turf")goto Turf
			if(Type1=="Mob")goto Mobile
			return
			Object
			CanMake+=typesof(/obj)
			CanMake+="Cancel"
			var/NOBJ=input("Create what object?")in CanMake
			if(NOBJ=="Cancel") return
			CCX=NOBJ
			new CCX(locate(x,y-1,z))
			return
			Turf
			CanMake+=typesof(/turf)
			CanMake+="Cancel"
			var/NTRF=input("Create what turf?")in CanMake
			if(NTRF=="Cancel") return
			CCX=NTRF
			new CCX(locate(x,y-1,z))
			return
			Mobile
			CanMake+=typesof(/mob/NPC)
			CanMake+=typesof(/mob/Saga)
			CanMake+="Cancel"
			var/NMOB=input("Create what Mob?")in CanMake
			if(NMOB=="Cancel") return
			CCX=NMOB
			new CCX(locate(x,y-1,z))
			return
		Reset_SpamList()
			set category="Admin"
			switch(alert("Do it?","","Yes","No"))
				if("No")
					return
				else
					CreationSpam=new/list()
					var/savefile/X = new("World Save Files/GM.sav")
					X["CreationSpam"]<<CreationSpam
		BanSenzuAbusers()
			set category="Admin"
			switch(alert("Do it?","","Yes","No"))
				if("No")
					return
				else
					for(var/mob/PC/M in world)
						var/beancount=0
						for(var/obj/Equipment/Consumable/Senzu/S in M.contents)
							beancount++
						if(beancount>60)
							world<<"\red [M] is abusing glitches."
							var/savfl=0
							var/ck=M.client.ckey
							if(M.save_file_1)
								savfl=1
							if(M.save_file_2)
								savfl=2
							if(M.save_file_3)
								savfl=3
							sleep(3)
							M<<"Your save file has been wiped."
							del(M.client)
							sleep(10)
							fdel("World Save Files/Player Saves/[ck]/Save File [savfl].sav")

mob/proc/RemoveGM()
	src.GMLevel = 0
	TrialEnf.Remove(src.ckey)
	LowEnf.Remove(src.ckey)
	MediumEnf.Remove(src.ckey)
	HighEnf.Remove(src.ckey)
	MasterEnf.Remove(src.ckey)
	StaffEnf.Remove(src.ckey)
	for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
		src.verbs-=X

		src.verbs-=X
mob/proc/LogOutGM()
	src.GMLevel = 0
	for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
		src.verbs-=X

		src.verbs-=X
mob/proc/BudokaiMasterCheck()
	if(BudoMaster.Find(src.ckey))
		usr<<"<center>\red You are a Budokai Master."
		for(var/vx in typesof(/mob/TourneyMaster/verb))
			src.verbs+=vx
mob/var/GMLevel=0
mob/var/GMLock=0
mob/var/GM_ChatMute=0
mob/var/tmp/afkchk=0
var/lastafk=0
var/lastdbe=0
var/lastdbn=0
var/lastdbb=0
mob
	proc
		UnmuteTimer(T)
			src.muted=1
			sleep(T)
			if(!src.muted)return
			world<<"<b>[src] has been <font color=red>Unmuted."
			src.muted = 0
world
	proc
		AFKCHECKSTART()
			lastafk=world.time
			for(var/mob/PC/M in world)
				if(M.GMLevel)continue
				if(!M.loggedin)continue
				spawn(1)M.AFKPOP()
			world << "<font color = #00B211>Dragon AI:</font> \white AFK checker has been <font color=green>Initiated</font>."
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>20 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>19 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>18 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>17 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>16 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>15 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>14 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>13 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>12 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>11 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>10 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>9 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>8 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>7 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>6 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>5 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>4 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>3 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>2 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: <font color=gray>1 seconds"
			sleep(10)
			world << "<font color = #00B211>Dragon AI:</font> \white AFK checker has <font color=red>Ended</font>."
			world.AFKBOOT()
mob/proc/AFKPOP()
	src.afkchk=1
	var/afkt1=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	var/afkt2=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	afkt1=uppertext(afkt1)
	afkt2=uppertext(afkt2)
	var/warn=input(src,"Type in the following box: [afkt1][afkt2]","AFK Check")as text
	if(!warn||warn==""||warn==null||uppertext(warn)!="[afkt1][afkt2]")
		var/warn2=input(src,"Type in the following box: [afkt1][afkt2]","AFK Check")as text
		if(!warn2||warn2==""||warn2==null||uppertext(warn2)!="[afkt1][afkt2]")
			world << "<font color=#00B211>Dragon AI:</font> \white [src] has been Booted for being Idle."
			del(src.client)
		else
			src.afkchk=0
	else
		src.afkchk=0
mob/proc/AFKPOPSPECIF(X)
	src.afkchk=1
	var/afkt1
	var/afkt2
	if(!X)
		afkt1=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
		afkt2=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	else
		afkt1=X
		afkt2=""
	afkt1=uppertext(afkt1)
	afkt2=uppertext(afkt2)
	var/warn=input(src,"Type in the following box: [afkt1][afkt2] (if you can't answer it in time logout.)","AFK Check")as text
	if(!warn||warn==""||warn==null||uppertext(warn)!="[afkt1][afkt2]")
		var/warn2=input(src,"Type in the following box: [afkt1][afkt2] (if you can't answer it in time logout.)","AFK Check")as text
		if(!warn2||warn2==""||warn2==null||uppertext(warn2)!="[afkt1][afkt2]")
			world << "<font color=#00B211>Dragon AI:</font> \white [src] has been Booted for being Idle."
			del(src.client)
		else
			src.afkchk=0
			AdminMessage("[src] has answered to the AFK check.")
	else
		src.afkchk=0
		AdminMessage("[src] has answered to the AFK check.")
mob/proc/AFKPOPTIME(X)
	world << "<font color = #00B211>Dragon AI:</font> \white [src] you are under AFK check."
	src<<"\white AFK Boot In: <font color=gray>10 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>10 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>9 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>9 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>8 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>8 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>7 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>7 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>6 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>6 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>5 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>5 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>4 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>4 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>3 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>3 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>2 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>2 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>1 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>1 seconds")
	sleep(10)
	if(!src.afkchk)return
	if(X=="BAN")
		if(!src.afkchk)return
		world << "<font color=#00B211>Dragon AI:</font> \white [src] has been <font color=red>Banned</font>."
		BannedK.Add(src.ckey)
		var/savefile/Z = new("World Save Files/Bans.sav")
		Z["BannedK"]<<BannedK
		sleep(2)
		del(src)
	else
		if(!src.afkchk)return
		world << "<font color=#00B211>Dragon AI:</font> \white [src] has been Booted for being Idle."
		del(src.client)
world/proc/AFKBOOT()
	for(var/mob/PC/N in world)
		if(!N.loggedin)continue
		if(N.GMLevel)continue
		if(!N.afkchk)continue
		world << "<font color=#00B211>Dragon AI:</font> \white [N] has been Booted for being Idle."
		del(N.client)
		sleep(1)