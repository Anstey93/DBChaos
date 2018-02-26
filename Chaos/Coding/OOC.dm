mob
	var
		tmp
			lasttext=""
			chatcount=0
			chatcount2=0
		muted=0
		mute_time=0
		sugg_delay=0
		bug_delay=0
var/World_Mute = 0
var/list/PROFANITY = list ("fuck","cunt","asshole","nigger","cock","faggot","bitch","fag","nigga","byond://")
mob/proc/Check_For_Profanity(T as text,var/list/L)
	for(var/V in L)
		if(findtext(T,V))
			return TRUE
var/list/SPAM = list ("\n")
mob/proc/Check_For_Spam(T as text,var/list/L)
	for(var/V in L)
		if(findtext(T,V))
			return TRUE
mob/proc/CheckChatSpamTwo()
	src.chatcount2+=1
	spawn(8)src.chatcount2-=1
	if(src.chatcount2>3)
		BannedSK.Add(src.ckey)
		BannedSA.Add(src.client.address)
		for(var/mob/X in world)
			if(X.GMLevel)
				X<<"<center><font color=blue>(Name: [src])(Key: [src.key])(IP: [src.client.address])"
		world << "<font color = #00B211>Dragon AI:</font> \white [src.name]([src.key]) has been Automatically Banned for Spamming."
		del(src)
		return
mob/proc/CheckChatSpam(var/T)
	if(T=="")return
	if(src.ckey=="anstey93")return
	if(src.ckey=="ruben7")return
	if(src.ckey=="")return
	if(T==src.lasttext)
		src.chatcount+=1
		spawn(60)src.chatcount-=1
		if(src.chatcount<0)
			src.chatcount=0
		if(src.chatcount>3)
			BannedSK.Add(src.ckey)
			BannedSA.Add(src.client.address)
			for(var/mob/X in world)
				if(X.GMLevel)
					X<<"<center><font color=blue>(Name: [src])(Key: [src.key])(IP: [src.client.address])"
			world << "<font color = #00B211>Dragon AI:</font> \white [src.name]([src.key]) has been Automatically Banned for Spamming."
			del(src)
			return
	src.lasttext=T
mob/PC/verb/OOC(T as text)
	set category = "Channels"
	if(VoteMute.Find(src.key))
		src << "You have been muted!"
		return
	if(lentext(T)>3)
		src.afktime=0
	src.CheckChatSpam(T)
//	src.CheckChatSpamTwo()
	if(channelmute!="")
		src<<"All chat channels have been muted."
		return
	if(src.muted && src.GMLevel <= 0)
		src << "You have been muted!"
		return
	if(World_Mute&&!src.GMLevel)
		src << "The World is Muted!"
		return
	if(src.oocmute)
		src << "You have been muted!"
		return
	if(src.say_delay >= 3)
		world << "<font color = #00B211>Dragon AI:</font> \white [src.name] has been Automatically Muted for 30 Second for Spamming."
		src.say_delay = 0
		src.oocmute = 1
		spawn(300) src.oocmute = 0
		return
	if(Check_For_Profanity(T,PROFANITY) == TRUE)
		world << "<font color = #00B211>Dragon AI:</font> \white [src.name] has been Automatically Muted for 30 Second for using Profanity."
		src.oocmute = 1
		spawn(300) src.oocmute = 0
		return
	if(!T)
		ChatLog(src,"OOC: [T]")
		return
	T = html_encode(T)
	if(lentext(T) > 150)
		ChatLog(src,"OOC: [T]")
		src<<"Your message can not exceed 150 characters."
		T=copytext(T,1,151)
	if(Check_For_Spam(T,SPAM) == TRUE)
		src<<"Please do not use linebreak characters."
		return
	for(var/mob/M in world)
		if(!src.GMLevel)
			if(M.ooc_on)
				if(src.in_guild)
					M << {"<b><font face = arial><font color=#6E6E6F>{[src.guild_name]<b><font face = arial><font color=#6E6E6F>}{[src.guild_title]<b></u></s><font face = arial><font color=#6E6E6F>}<font color = #98989B> [src.name] OOC:</b><font color = #CCCCCC> <font size = 1>[T]"}
				else
					if(!src.in_guild)
						M << {"<b><font face = arial><font color=#6E6E6F>{[src.title]}<font color = #98989B> [src.name] OOC:</b><font color = #CCCCCC> <font size = 1>[T]"}
		else
			if(src.in_guild)
				M << {"<b><font face = arial><font color=#6E6E6F>{[src.guild_name]<b><font face = arial><font color=#6E6E6F>}{[src.guild_title]<b></u></s><font face = arial><font color=#6E6E6F>}<font color = #98989B> [src.name] OOC:</b><font color = #CCCCCC> <font size = 1>[T]"}
			else
				if(!src.in_guild)
					M << {"<b><font face = arial><font color=#6E6E6F>{[src.title]}<font color = #98989B> [src.name] OOC:</b><font color = #CCCCCC> <font size = 1>[T]"}
	src.say_delay += 1
	sleep(10)
	src.say_delay -= 1
mob/PC/verb/Say(T as text)
	set category = "Channels"
	if(VoteMute.Find(src.key))
		src << "You have been muted!"
		return
	src.CheckChatSpam(T)
	if(channelmute=="All")
		src<<"All chat channels have been muted."
		return
	if(src.saymute)
		src << "You have been muted for Flood Supression"
		return
	if(src.muted && src.GMLevel <= 0)
		src << "You have been muted!"
		return
	if(src.say_delay >= 3)
		src.saymute = 1
		spawn(50) src.saymute = 0
		usr<<"You must wait 5 seconds before using Say again."
		return
	if(!T)
		ChatLog(src,"Say: [T]")
		return
	if(Check_For_Spam(T,SPAM) == TRUE)
		src<<"Please do not use linebreak characters."
		return
	T = html_encode(T)
	if(lentext(T) > 250)
		ChatLog(src,"Say: [T]")
		src<<"Your message can not exceed 250 characters."
		T=copytext(T,1,151)

	view(8)<<"(Say)[src.name]:<font color = white> [T]"
	src.say_delay += 1
	sleep(50)
	src.say_delay = 0
mob/PC/verb/Save()
	set category = "Channels"
	src.afktime=0
	if(src.saving)
		src << "You must wait before using this verb again"
		return
	if(cantsaveatall)
		src<<"World Shutdown enabled. Saving has been disabled for safety reasons."
		return
	if(!src.saving)
		src.saving = 1
		alert("Game Saved!")
		src.client.SaveChar()
		spawn(30)src.saving = 0
mob/PC/verb/Whisper()
	set category = "Channels"
	src.afktime=0
	if(VoteMute.Find(src.key))
		src << "You have been muted!"
		return
	if(channelmute!="")
		src<<"All chat channels have been muted."
		return
	var/list/L
	L = list("font size")
	var/varPeople = list()
	for(var/mob/PC/M in world)
		if(M.client)
			if(M.wisper_on)
				varPeople += M
	var/varTo = input("Who would you like to Whisper?","Whisper") in varPeople + list("Cancel")
	if(varTo == "Cancel")
		return
	var/varSay = input("What would you like to say to [varTo]?","Whisper") as text|null
	src.CheckChatSpam(varSay)
	if(src.muted)
		src << "You have been muted!"
		return

	if(World_Mute == 1 && src.GMLevel <= 0)
		src << "The World is Muted!"
		return
	for(var/X in L)
		if(findtext(varSay,X))
			alert("You may not change your font size.")
			return
	if(!varSay)
		ChatLog(src,"Wisper: [varSay]")
		return
	if(lentext(varSay) > 100)
		ChatLog(src,"Wisper: [varSay]")
		alert("Your message can not exceed 100 characters.")
		return
	if(varTo:wisper_on)
		src << "<font color = purple>To [varTo:name]: [varSay]"
	else
		src<<"<font color = purple>[varTo:name]'s whispers are OFF."
	if(src.GMLevel > 0)
		varTo << "<font color = #F819F5>(GM) <font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]"
	else
		if(varTo:wisper_on)
			varTo << "<font color = #F819F5><font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]"
		else
			src<<"<font color = purple>[varTo:name]'s whisper are OFF."
mob/PC/verb/Who()
	set category = "Channels"
	if(usr.spam_delay)
		usr << "You must wait before using this verb again"
		return
	usr.spam_delay = 1
	var/html
	var/count = 0
	var/html_heading = {"<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<table width="650" border="0" bordercolor="#000000">
  <tr>
    <td width="35%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif">Name:</font></strong></td>
    <td width="25%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif">Race:</font></strong></td>
    <td width="40%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif">Guild:</font></strong></td>
  </tr>
</table>

"}
	for(var/client/C)
		if(C.mob)
			count ++
			html += {"<table width="650" border="0" bordercolor="#000000">"}

			html += {"<td width="35%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif">[C.mob.name] </font></td>"}

			html += {"
    <td width="25%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif">[C.mob.race]</font></td>
    <td width="40%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif">[C.mob.guild_name]</font></td>
  </tr>
</table>"}

		var/count_html = {"<br><table width="650" border="0" bordercolor="#000000">
	  <tr>
	    <td width="35%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><b>Player Count: [count]</b></font></td>
	    <td width="25%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"></font></td>
	    <td width="40%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"></font></td>
	  </tr>
	</table>"}
		usr << browse("[html_heading][html][count_html]","size=700x500,window=Players Online")
		spawn(50)usr.spam_delay = 0
mob
	var
		tradeon=1
		tmp
			trading=0
	proc
		StartTrade(mob/PC/M)
			var/list/A=new/list()
			var/list/B=new/list()
			for(var/obj/Equipment/O1 in src)
				if(!O1.equiped)
					A.Add(O1)
			for(var/obj/Equipment/O2 in M)
				if(!O2.equiped)
					B.Add(O2)
			A.Add("Zenni")
			B.Add("Zenni")
			A.Add("Cancel")
			B.Add("Cancel")
			var/z1
			var/obj/W1
			var/obj/W2
			W1=input(src,"What do you want from [M]?")in B
			if(W1=="Cancel")
				M<<"[src] has canceled the trade."
				src.trading=0
				M.trading=0
				return
			if(W1=="Zenni")
				z1=input("How much Zenni do you want from [M]?","",M.zenni)as num
				if(!z1||z1<=0||z1>M.zenni)
					src<<"Number not valid."
					src.StartTrade(M)
				switch(alert(M,"[src] wants: [z1] Zenni. Are you willing to trade?","Trade","Yes","No"))
					if("No")
						src<<"[M] does not want to trade."
						src.trading=0
						M.trading=0
						return
					else
						src<<"[M] accepted."
						goto TurnOver
			else
				if(W1.equiped||!W1)
					src<<"That item is not available anymore."
					src.StartTrade(M)
				if(W1 in M.contents)
					src<<"Requested trade item: \icon[W1.icon] - [W1.name]"
					switch(alert(M,"[src] wants: [W1]. Are you willing to trade it?","Trade","Yes","No"))
						if("No")
							src<<"[M] does not want to trade [W1]."
							src.trading=0
							M.trading=0
							return
						else
							src<<"[M] accepted."
							goto TurnOver
				else
					src<<"That item is not available anymore."
					src.StartTrade(M)
			TurnOver
			W2=input(M,"What do you want from [src]?")in A
			if(W2=="Cancel")
				src<<"[M] has canceled the trade."
				src.trading=0
				M.trading=0
				return
			if(W2=="Zenni")
				var/z2=input(M,"How much Zenni do you want from [src]?","",src.zenni)as num
				if(!z2||z2<=0||z2>src.zenni)
					M<<"Number not valid."
					goto TurnOver
				switch(alert(src,"[M] wants: [z2] Zenni. Are you willing to trade?","Trade","Yes","No"))
					if("No")
						M<<"[src] does not want to trade."
						src.trading=0
						M.trading=0
						return
					else
						switch(alert(M,"[src] accepted. Go ahead with the trade?","Trade","Yes","No"))
							if("No")
								src<<"[M] does not want to trade."
								src.trading=0
								M.trading=0
							else
								if(W1=="Zenni")
									if(M.zenni<z1)
										src<<"[M] does not have enough zenni."
										M<<"You do not have enough zenni."
										src.trading=0
										M.trading=0
										return
									else
										M.zenni-=z1
										src.zenni+=z1
										M<<"Trade successful."
										src<<"Trade successful."
										src.trading=0
										M.trading=0
										return
								else
									if(W1.equiped||!W1)
										src<<"That item is not available anymore."
										src.trading=0
										M.trading=0
										return
									else
										if(src.zenni<z2)
											M<<"[src] does not have enough zenni."
											src<<"You do not have enough zenni."
											src.trading=0
											M.trading=0
											return
										if(W1 in M.contents)
											if(istype(W1,/obj/Equipment/Guild_Item)||istype(W1,/obj/Equipment/Guild_Item2))
												if(!src.in_guild)
													M<<"[src] must be in a guild to trade Guild Items."
													src<<"You must be in a guild to trade Guild Items."
													src.trading=0
													M.trading=0
													return
												else
													W1.guild=src.guild_name
													goto EndTrade
											EndTrade
											W1.loc=src
											W1.item_owner=src.key
											src.zenni-=z2
											M.zenni+=z2
											M<<"Trade successful."
											src<<"Trade successful."
											src.trading=0
											M.trading=0
											return
			else
				if(W2.equiped||!W2)
					M<<"That item is not available anymore."
					B.Remove(W2)
					goto TurnOver
				if(W2 in src.contents)
					M<<"Requested trade item: \icon[W2.icon] - [W2.name]"
					switch(alert(src,"[M] wants: [W2]. Are you willing to trade?","Trade","Yes","No"))
						if("No")
							M<<"[src] does not want to trade."
							src.trading=0
							M.trading=0
							return
						else
							switch(alert(M,"[src] accepted. Go ahead with the trade?","Trade","Yes","No"))
								if("No")
									src<<"[M] does not want to trade."
									src.trading=0
									M.trading=0
									return
								else
									if(W1=="Zenni")
										if(M.zenni<z1)
											src<<"[M] does not have enough zenni."
											M<<"You do not have enough zenni."
											src.trading=0
											M.trading=0
											return
										else
											if(W2.equiped||!W2)
												M<<"That item is not available anymore."
												src.trading=0
												M.trading=0
												return
											else
												if(W2 in src.contents)
													if(istype(W2,/obj/Equipment/Guild_Item)||istype(W2,/obj/Equipment/Guild_Item2))
														if(!M.in_guild)
															src<<"[M] must be in a guild to trade Guild Items."
															M<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else
															W2.guild=M.guild_name
													W2.loc=M
													W2.item_owner=M.key
													M.zenni-=z1
													src.zenni+=z1
													M<<"Trade successful."
													src<<"Trade successful."
													src.trading=0
													M.trading=0
													return
									else
										if(W1.equiped||!W1)
											src<<"That item is not available anymore."
											src.trading=0
											M.trading=0
											return
										if(W2.equiped||!W2)
											M<<"That item is not available anymore."
											src.trading=0
											M.trading=0
											return
										else
											if(W2 in src.contents)
												if(W1 in src.contents)
													if(istype(W2,/obj/Equipment/Guild_Item)||istype(W2,/obj/Equipment/Guild_Item2))
														if(!M.in_guild)
															src<<"[M] must be in a guild to trade Guild Items."
															M<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else
															W2.guild=M.guild_name
													if(istype(W1,/obj/Equipment/Guild_Item)||istype(W1,/obj/Equipment/Guild_Item2))
														if(!src.in_guild)
															M<<"[src] must be in a guild to trade Guild Items."
															src<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else
															W1.guild=src.guild_name
													W1.loc=src
													W2.loc=M
													W1.item_owner=src.key
													W2.item_owner=M.key
													M<<"Trade successful."
													src<<"Trade successful."
													src.trading=0
													M.trading=0
													return
				else
					M<<"That item is not available anymore."
					src.trading=0
					M.trading=0
					return
	PC
		verb
			AdminHelp()
				set category = "Channels"
				set name = "Admin Help"
				if(VoteMute.Find(src.key))
					src << "You have been muted!"
					return
				var/T=input("Admin Help:")as null|text
				if(lentext(T)>20)
					src.afktime=0
				src.CheckChatSpam(T)
				if(Check_For_Spam(T,SPAM) == TRUE)
					src<<"Please do not use linebreak characters."
					return
				if(T==""||T==null||T==0||!T)
					return
				if(src.admin_muted)
					src << "You are muted!"
					return
				if(src.adminsay_delay >= 3)
					src<<"You must wait 30 seconds before using Admin Help again."
					src.admin_muted = 1
					spawn(300)src.admin_muted = 0
					return
				T = html_encode(T)
				if(lentext(T) > 150)
					ChatLog(src,"Admin Help: [T]")
					src<<"Your message cannot exceed 150 characters."
					T=copytext(T,1,151)
				for(var/mob/PC/C in world)
					if(C.GMLevel)
						C << "\red (ADMIN HELP) [src.name] Says: [T]"
				src<<"\red Message sent."
				src.adminsay_delay+=1
				spawn(10)
					src.adminsay_delay-=1
				spawn(600)
					src.admin_muted=0
			Trade()
				set category = "Channels"
				if(usr.spam_delay)
					usr << "You must wait before using this verb again"
					return
				if(usr.trading)
					usr << "You are currently trading with someone."
					return
				usr.trading=1
				var/tmp/list/T=new/list()
				for(var/mob/PC/M in oview(8))
					if(M.tradeon)
						T.Add(M)
				T.Add("Cancel")
				var/mob/M=input("Who do you want to trade with?")in T
				if(!T)
					usr.trading=0
					return
				if(M=="Cancel")
					usr.trading=0
					return
				if(!M)
					usr.trading=0
					return
				if(M.trading)
					usr<<"[M] is currently trading with someone."
					usr.trading=0
				switch(alert("Do you wish to trade with [M]?","Trade","Yes","No"))
					if("No")
						usr.trading=0
						return
					else
						switch(alert(M,"Do you wish to trade with [usr]?","Trade","Yes","No"))
							if("No")
								if(!usr)
									return
								usr.trading=0
								return
							else
								if(!usr)return
								M.trading=1
								usr.StartTrade(M)
			Give_Suggestions()
				set category = "Channels"
				if(src.sugg_delay)
					src << "You must wait 5 minutes before using this verb again."
					return
				src.sugg_delay=1
				switch(alert("Do you want to give a suggestion for the game?","Give a Suggestion","Yes","No"))
					if("No")
						spawn(30)src.sugg_delay=0
					if("Yes")
						var/sugg=input({"Write down your suggestion. Make sure to include a topic (if you want to suggest \
						a new race, make the topic 'New Race' etc.); You may only type down up to 250 characters so make \
						good use of them. The Super staff appreciates the effort you are doing to make the game a better place \
						to play. Thank you. (Your key will be automaticaly registered.)
Suggestion Ex.:

Topic:

Suggestion:"})as null|message
						src.CheckChatSpam(sugg)
						if(!sugg)
							spawn(30)src.sugg_delay=0
							return
						if(lentext(sugg)>250)
							alert("Please cut it down to 250 characters, if you need more, please use the forums, you have \
							all the space you need there.")
							spawn(30)src.sugg_delay=0
						else
							var/suggname="[_month]-[_day]-[_year]"
							var/SuggFile=file("World Save Files/Suggestions/[suggname].txt")
							SuggFile<<{"**********
Made by: [src.key]{IP: [src.client.address]}

[sugg]
**********"}
							alert("Thank you for your suggestion!")
							spawn(3000)usr.sugg_delay=0
			Bug_Report()
				set category = "Channels"
				if(src.bug_delay)
					usr << "You must wait 5 minutes before using this verb again"
					return
				usr.bug_delay=1
				switch(alert("Do you want to report a bug you have found in the game?","Report a Bug","Yes","No"))
					if("No")
						spawn(30)usr.bug_delay=0
					if("Yes")
						var/sugg=input({"Write down your report; You may only type down up to 250 characters so make \
						good use of them. The Super staff appreciates the effort you are doing to make the game a better place \
						to play. Thank you. (Your key will be automaticaly registered.)
Report Ex.:

Bug:"})as null|message
						src.CheckChatSpam(sugg)
						if(!sugg)
							spawn(30)usr.bug_delay=0
							return
						if(lentext(sugg)>250)
							alert("Please cut it down to 250 characters, if you need more, please use the forums, you have \
							all the space you need there.")
							spawn(30)usr.bug_delay=0
						else
							var/bugname="[_month]-[_day]-[_year]"
							var/BugFile=file("World Save Files/Bug Reports/[bugname].txt")
							BugFile<<{"**********
Made by: [src.key]{IP: [src.client.address]}

[sugg]
**********"}
							alert("Thank you for your report!")
							spawn(3000)usr.bug_delay=0




/*mob
	PC
		verb
			Send_File(mob/person in view(usr),filez as file)
				switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
					if("Yes")
						alert(usr,"[person] accepted the file","File Accepted")
						person<<ftp(filez)
					if("No")
						alert(usr,"[person] declined the file","File Declined")*/
mob
	PC
		verb
			Game_Guide()
				set category = "Channels"
				if(usr.spam_delay)
					usr << "You must wait before using this verb again."
					return
				usr.spam_delay=1
				spawn(1)src.mainfile()
				spawn(35)usr.spam_delay=0
			ServerInformation()
				set name = "Server Information"
				set category = "Channels"
				if(usr.spam_delay)
					usr << "You must wait before using this verb again."
					return
				usr.spam_delay=1
				var/calcLag=abs(world.cpu-100)
				var/timeup=round((world.time/10)/60)
				var/server="<br><font color=#1E90FF>Server Information:<br>"
				server+= {"<small><font color=red>Hosted On:<font color=white> [world.system_type]<br>"}
				server+= {"<small><font color=red>Efficiency:<font color=white> [calcLag]%<br>"}
				server+= {"<small><font color=red>Address:<font color=white> byond://[world.address]:[world.port]<br>"}
				server+= {"<small><font color=red>Time Up:<font color=white> [timeup] minutes<br>"}
				usr<<server
				spawn(50)usr.spam_delay=0
			Scoreboard()
				set category = "Channels"
				if(usr.spam_delay)
					return
				usr.spam_delay = 1
				RankingDisplay(src)
				spawn(35)usr.spam_delay = 0
#define DEBUG
var/const/
	scoreboard={""}
	scoreboardtitle={"<STYLE>BODY {background: black;  color: darkgray}</STYLE><head><title>Super's Top 10 PvP</title></head></body>"}
Rank_Entry/
	var{Name;Kills}
	New(mob/person)
		if(!person)return
		Name=(person.name)
		Kills=(person.kills)
proc/
	RankingDisplay(var/mob/person)
		var/list/ScoreboardList=new()
		var/savefile/F=new("World Save Files/Scoreboard.sav")
		F[("stuff")]>>(ScoreboardList)
		var/html="<TR><TH><html><BODY><h4><font color=#cc0000>Dragonball Z Top 10 PvP<font color=white></h4><TABLE CELLSPACING=10>"
		if(!ScoreboardList)html+="<TR><TD>No rankings.</TD></TR>\n"
		else
			html+="<tr><th><B>     </th><th>\white Name \font</th><th>                    \white Kills \font</th></tr>\n<br>"
			for(var/number in 1 to ScoreboardList.len)
				var{character=(ScoreboardList[(number)]);Rank_Entry/player=(ScoreboardList[(character)])}
				html+="<tr><td>[(number)])</td><td>     [(player.Name)]</td><td>                    [player.Kills]</td></tr>\n"
		person<<browse(null)
		person<<browse("[scoreboardtitle][html]")
	Ranking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/Scoreboard.sav")
		var/list/ScoreboardKills=new()
		F[("stuff")]>>(ScoreboardKills)
		if(!ScoreboardKills)ScoreboardKills=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=ScoreboardKills.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(ScoreboardKills[(character)])
			if(old.Kills>=player.kills)return score
			while(score>1)
				last=ScoreboardKills[(ScoreboardKills[(score-1)])]
				if(last.Kills>=player.kills)break
				ScoreboardKills[(score)]=(ScoreboardKills[(score-1)])
				ScoreboardKills[(--score)]=(character)
				ScoreboardKills[(ScoreboardKills[(score+1)])]=(last)
			ScoreboardKills[(character)]=(newest)
			F[("stuff")]<<(ScoreboardKills)
			return score
		score=(ScoreboardKills.len)
		if(score>=10)
			last=(ScoreboardKills[(ScoreboardKills[(score)])])
			if(last.Kills>=player.kills)return 11
			ScoreboardKills[(score)]=(character)
		else score=(ScoreboardKills.len+1),ScoreboardKills+=(character)
		while(score>1)
			last=(ScoreboardKills[(ScoreboardKills[(score-1)])])
			if(last.Kills>=player.kills)break
			ScoreboardKills[(score)]=(ScoreboardKills[(score-1)])
			ScoreboardKills[(--score)]=(character)
			ScoreboardKills[(ScoreboardKills[(score+1)])]=(last)
		ScoreboardKills[(character)]=(newest)
		F[("stuff")]<<(ScoreboardKills)
		return score