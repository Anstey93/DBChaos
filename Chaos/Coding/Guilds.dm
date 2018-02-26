var/filesizemax=40000
var/list/BannedGuildText=list("marquee>","size>","td>","tr>","p>","<h","br>","<br","hr>","html>","body>","<!","table>","<table","big>","em>","strong>","sub>","sup>","ins>","del>","<a","frameset>","th>","caption>","<col","head>","ul>","il>","dl>","img>","map>","area>")
mob/proc/GuildBanText(list/L, T)
	for(var/X in L)
		if(findtext(T,X))
			return TRUE
mob/PC
	verb
		Create_Guild()
			set category = "Channels"
			if(src.in_guild)
				return
			if(src.level<5000)
				alert("You must be at least level 5000.")
				return
			switch(alert("Do you want to create a Guild?","Create Guild","Yes","No"))
				if("No")
					return
				if("Yes")
					var/gname1=input("Type in the Guild name with 'NO' HTML(20 characters max).")as text
					gname1 = html_encode(gname1)
					if(lentext(gname1) > 20)
						alert("Guild name cannot exceed 20 characters.")
						return
					if(Guilds.Find(gname1))
						alert("That Guild already exists.")
						return
					if(gname1 == " " || gname1 == 0 || gname1 == null || !gname1)
						return
					var/rc=ckey(gname1)
					if(Check_For_Spam(gname1,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					if(findtext(rc,"fontsize"))
						alert("You cannot change font size")
						return
					if(findtext(rc,"fontcolor"))
						alert("You cannot change font color")
						return
					if(findtext(rc,"colorsize"))
						alert("You cannot change font color or size")
						return
					var/gname2=input("Type in the Guild name with HTML if wanted.")as text
					var/rc2=lowertext(gname2)
					rc2=dd_replacetext(rc2," ","")
					if(src.GuildBanText(BannedGuildText,rc2)==TRUE)
						alert("Only <font color> html tags allowed")
						return
					if(Check_For_Spam(rc2,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					if(findtext(rc2,"fontcolor"))
						if(lentext(rc2)>500)
							alert("Guild name cannot exceed 500 characters.")
							return
					else
						if(lentext(rc2)>30)
							alert("Guild name cannot exceed 30 characters.")
							return
					if(Guilds.Find(gname2))
						alert("That Guild already exists.")
						return
					if(gname2 == " " || gname2 == 0 || gname2 == null || !gname2)
						return
					switch(alert("Create [gname1]?","Guild Create","Yes","No"))
						if("Yes")
							goto Finalise
						if("No")
							return
					Finalise
						src.guild_name = gname2
						src.guild=gname1
						src.guild_leader = 1
						src.guild_rank = "Leader"
						src.guild_title = "Leader"
						src.in_guild = 1
						src.has_title = 0
						src.guild_mute = 0
						src.verbs -= new/mob/PC/verb/Create_Guild()
						spawn(5)Guilds.Add(gname1)
						spawn(5)Guilds.Add(gname2)
						spawn(5)src.GiveGuildVerbs()
						spawn(10)BanSave()
						return

mob/GuildLeader
	verb
		Guild_Mute()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							if(!M.guild_leader)
								Menu.Add(M)
			var/mob/M = input("Mute Who?","Guild Mute") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert("Would you like to Guild Mute [M]?","Guild Mute","Yes","No"))
					if("Yes")
						var/time = input("How many seconds?(300 Max)")as num
						if(time <= 0)
							return
						if(time > 0 && time <= 300)
							M.guild_mute = 1
							for(var/mob/X in world)
								if(X.guild_name == M.guild_name)
									X << "[usr]<font color = red> Guild Muted</font> [M]([time] seconds)"
							M.GuildMemberMute(time*10)
							return
					else
						return
		Guild_UnMute()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							if(!M.guild_leader)
								Menu.Add(M)
			var/mob/M = input("UnMute Who?","Guild UnMute") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert("Would you like to Guild UnMute [M]?","Guild UnMute","Yes","No"))
					if("Yes")
						M.guild_mute = 0
						for(var/mob/X in world)
							if(X.guild_name == M.guild_name)
								X << "[usr]<font color = red> Guild UnMuted</font> [M]"
						return
					else
						return
		Guild_Invite()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/PC/M in world)
				if(!M.client)continue
				if(M==usr)continue
				if(M.in_guild)continue
				if(M.level<200)continue
				Menu.Add(M)
			var/mob/M = input("Invite Who?","Guild Invite") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(M,"Would you like to join [usr]'s Guild?","Guild Join","Yes","No"))
					if("Yes")
						if(!usr)return
						if(M.in_guild)
							return
						M.guild_name = usr.guild_name
						M.guild = usr.guild
						M.guild_member = 1
						M.guild_rank = "Member"
						M.guild_title = "Member"
						M.in_guild = 1
						M.has_title = 0
						M.GiveGuildVerbs()
						M.verbs -= new/mob/PC/verb/Create_Guild()
						for(var/mob/X in world)
							if(X.guild_name == usr.guild_name)
								X << "[usr.guild_name]<font color = white>: [M] \green Joined \font the Guild!"
						return
					if("No")
						if(!usr)return
						usr << "[M] doesn't want to join"
						return


		Guild_Boot()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)

			var/mob/M = input("Boot Who?","Guild Boot")as null|anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.guild_leader)
					alert("You cannot boot the Leader!")
					return


				switch(alert("Would you like to Boot [M] from the Guild?","Guild Boot","Yes","No"))

					if("Yes")
						M.RemoveGuildVerbs()
						for(var/mob/X in world)
							if(X.guild_name == M.guild_name)
								X << "[usr.guild_name]<font color = white>: [usr] \red Booted \font [M] from the Guild!"
						M.guild_name = ""
						M.guild = ""
						M.guild_leader = 0
						M.guild_co_leader = 0
						M.guild_member = 0
						M.guild_make_item = 0
						M.guild_change_rank = 0
						M.guild_invite = 0
						M.guild_announce = 0
						M.guild_boot = 0
						M.guild_change_rank = 0
						M.guild_title = ""
						M.guild_rank = ""
						M.in_guild = 0
						M.has_title = 0
						M.verbs += new/mob/PC/verb/Create_Guild()
					if("No")
						return

		Guild_Make_Item()
			set category = "Guild"
			if(usr.makingitem)
				return
			usr.makingitem = 1
			if(usr.zenni >= 750000)
				var/icon/I=input("Select your Guild Item's icon:")as null|icon
				if(!length(I))
					usr.makingitem=0
					return
				if(length(I) > filesizemax)
					usr << "File is too large. 50kb max."
					usr.makingitem=0
					return
				switch(alert("Make Guild Item?(750,000 zenni each)","Make Guild Item","Yes","No"))
					if("Yes")
						switch(alert(usr,"Overlay or Underlay?(Overlays show on top of your character's icon \
										and Underlays show under your character's icon","","Overlay","Underlay","Cancel"))
							if("Overlay")
								var/obj/Equipment/Guild_Item/O = new
								var/N = input("Whats the name?","","Guild Item") as text
								if(Check_For_Spam(N,SPAM) == TRUE)
									src<<"Please do not use linebreak characters."
									usr.makingitem = 0
									return
								if(!N)
									N = "Guild Item"
								if(lentext(N)>15)
									N=copytext(1,16)
								N=html_encode(N)
								O.name = N
								O.icon = I
								O.guild = usr.guild_name
								usr.zenni -= 750000
								usr.contents += O
								usr.inven_min += 1
								usr.makingitem = 0
								usr<<"[N] was created successfully!"
								return
							if("Underlay")
								var/obj/Equipment/Guild_Item2/O = new
								var/N = input("Whats the name?","","Guild Item") as text
								if(Check_For_Spam(N,SPAM) == TRUE)
									src<<"Please do not use linebreak characters."
									usr.makingitem = 0
									return
								if(!N)
									N = "Guild Item"
								if(lentext(N)>15)
									N=copytext(1,16)
								N=html_encode(N)
								O.name = N
								O.icon = I
								O.guild = usr.guild_name
								usr.zenni -= 750000
								usr.contents += O
								usr.inven_min += 1
								usr.makingitem = 0
								usr<<"[N] was created successfully!"
								return
							if("Cancel")
								usr.makingitem = 0
								return
					if("No")
						usr.makingitem = 0
						return
			else
				usr << "You need 750,000 zenni."
				usr.makingitem = 0
				return
		Guild_Change_Title()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/PC/M in world)
				if(M.in_guild)
					if(M.guild_name == usr.guild_name)
						Menu.Add(M)
			var/mob/M = input("Change who's title?","Guild Change Title") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert("Change [M]'s title?","Guild Change Title","Yes","No"))
					if("Yes")
						var/new_rank = input("Enter [M]'s new title","Guild Change Title") as text | null
						var/rc2=lowertext(new_rank)
						rc2=dd_replacetext(rc2," ","")
						if(src.GuildBanText(BannedGuildText,rc2)==TRUE)
							alert("Only <font color> html tags allowed")
							return
						if(Check_For_Spam(new_rank,SPAM) == TRUE)
							src<<"Please do not use linebreak characters."
							return
						if(findtext(rc2,"fontcolor"))
							if(lentext(rc2)>500)
								alert("New title cannot exceed 500 characters.")
								return
						else
							if(lentext(rc2)>30)
								alert("New title cannot exceed 30 characters.")
								return
						if(!M)return
						M.guild_title = new_rank
						for(var/mob/X in world)
							if(X.guild_name == src.guild_name)
								X << "[usr.guild_name]<font color = white>: [src] changed [M]'s title to: [new_rank]!"
						return
					else
						return

		Guild_Change_Rank()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/PC/M in world)
				if(M.in_guild)
					if(M.guild_name == usr.guild_name)
						Menu.Add(M)

			var/mob/M = input("Change Who's Rank?","Guild Change Rank") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(input("What rank do you wish to give [M]?")in list("Co-Leader","Member","Custom","Cancel"))
					if("Co-Leader")
						if(M==src)return
						for(var/mob/X in world)
							if(X.guild_name == src.guild_name)
								X << "[usr.guild_name]<font color = white>: [src] has made [M] a Co-Leader!"
						M.guild_co_leader = 1
						M.GiveGuildVerbs()
					if("Member")
						if(M==src)return
						for(var/mob/X in world)
							if(X.guild_name == src.guild_name)
								X << "[usr.guild_name]<font color = white>: [src] has made [M] a Member!"
						M.guild_member = 1
						M.RemoveGuildVerbs()
						M.GiveGuildVerbs()
					if("Custom")
						switch(alert("Change [M]'s Custom Rank?","Change Rank","Yes","No"))
							if("Yes")
								var/new_rank = input("Enter [M]'s new rank","Guild Change Rank") as text | null
								if(lentext(new_rank) > 300)
									usr << "New rank cannot exceed 300 characters(with html included)."
									return
								if(!M)return
								var/rc2=lowertext(new_rank)
								rc2=dd_replacetext(rc2," ","")
								if(src.GuildBanText(BannedGuildText,rc2)==TRUE)
									alert("Only <font color> html tags allowed")
									return
								if(Check_For_Spam(new_rank,SPAM) == TRUE)
									src<<"Please do not use linebreak characters."
									return
								new_rank = html_encode(new_rank)
								M.guild_rank = new_rank
								var/rc=ckey(new_rank)
								if(findtext(rc,"fontsize"))
									alert("You cannot change font size")
									return
								if(findtext(rc,"colorsize"))
									alert("You cannot change font size")
									return
								if(findtext(rc,"fontcolor"))
									if(lentext(rc)>500)
										alert("New rank cannot exceed 500 characters.")
										return
								else
									if(lentext(rc)>30)
										alert("New rank cannot exceed 30 characters.")
										return
								for(var/mob/X in world)
									if(X.guild_name == src.guild_name)
										X << "[usr.guild_name]<font color = white>: [src] changed [M]'s rank to: [new_rank]!"
								if(M!=src)
									switch(input("What permissions do you wish to give [M]?")in list("Boot","Invite","Announce","Change Rank","Change Title","Make Items","Cancel"))
										if("Boot")
											M.guild_boot = 1
											M.GiveGuildVerbs()
											return
										if("Invite")
											M.guild_invite = 1
											M.GiveGuildVerbs()
											return
										if("Announce")
											M.guild_announce = 1
											M.GiveGuildVerbs()
											return
										if("Change Rank")
											M.guild_change_rank = 1
											M.GiveGuildVerbs()
											return
										if("Change Title")
											M.guild_change_title = 1
											M.GiveGuildVerbs()
											return
										if("Make Items")
											M.guild_make_item = 1
											M.GiveGuildVerbs()
											return
										if("None")
											return
							if("No")
								if(M==src)return
								switch(input("What permissions do you wish to give [M]?")in list("Boot","Invite","Announce","Change Rank","Cancel"))
									if("Boot")
										M.guild_boot = 1
										M.GiveGuildVerbs()
										return
									if("Invite")
										M.guild_invite = 1
										M.GiveGuildVerbs()
										return
									if("Announce")
										M.guild_announce = 1
										M.GiveGuildVerbs()
										return
									if("Change Rank")
										M.guild_change_rank = 1
										M.GiveGuildVerbs()
										return
									if("Change Title")
										M.guild_change_title = 1
										M.GiveGuildVerbs()
										return
									if("Make Items")
										M.guild_make_item = 1
										M.GiveGuildVerbs()
										return
									if("None")
										return
					if("Cancel")
						return
		GuildAnnouncement()
			set category = "Guild"
			set name = "Guild Announcement"
			if(channelmute!="")
				src<<"All chat channels have been muted."
				return
			var/T=input("What do you wish to Announce?")as text
			var/list/L=list("font size")
			if(T==""||T==null||!T)
				return
			if(Check_For_Spam(T,SPAM) == TRUE)
				src<<"Please do not use linebreak characters."
				return
			if(lentext(T) > 150)
				alert("Message must be less than 150 Characters!")
				return
			if(!T)
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You cannot change font size")
					return
			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
					X << "<center>[usr.guild_name]<font color = white> Announcement from [usr]<br>[T]<br>"
mob/GuildVerbs
	verb
		Guild_Chat(T as text)
			set category = "Guild"
			if(channelmute!="")
				src<<"All chat channels have been muted."
				return
			var/list/L
			L = list("font size")
			if(usr.guild_mute)
				alert("You are Guild Muted!")
				return
			while(T==""||T==null||!T)
				return
			if(!T)
				return
			T = html_encode(T)
			if(lentext(T) > 100)
				src << "Your message can not exceed 100 characters"
				return
			for(var/X in L)
				if(findtext(T,X))
					usr << "You cannot change your font size"
					return
			if(Check_For_Spam(T,SPAM) == TRUE)
				src<<"Please do not use linebreak characters."
				return
			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
					if(X.in_guild && X.gooc_on)
						X << "{[src.guild_name]<font color = yellow><font face=Tahoma>}{[src.guild_rank]<font color = yellow><font face=Tahoma>}[src.name]:<font color = yellow><font size = 1> [T]"
			return

		Guild_Members()
			set category = "Guild"
			if(usr.spam_delay)
				return
			usr.spam_delay = 1
			spawn(30)usr.spam_delay = 0
			var/count = 0
			usr << "---------------<br><font color = white>[usr.guild_name] Members:"
			for(var/mob/X in world)
				if(X.in_guild)
					if(X.guild == usr.guild)
						count += 1
						usr << "<font color = red>[X.name]{[X.guild_rank]}"
			usr << "<font color = red>Guild Members Online: [count]<br>---------------<br>"
			return

		Guild_Leave()
			set category = "Guild"
			if(!src.guild_leader)
				switch(alert("Leave the Guild?","Guild Leave","Yes","No"))
					if("Yes")
						if(src.in_guild)
							src.in_guild = 0
							src.RemoveGuildVerbs()
							for(var/mob/X in world)
								if(X.guild_name == src.guild_name)
									X << "[src.guild_name]<font color=white>: [src] has left the Guild!"
							src.guild_name = ""
							src.guild = ""
							src.guild_leader = 0
							src.guild_co_leader = 0
							src.guild_member = 0
							src.guild_mute = 0
							src.guild_make_item = 0
							src.guild_invite = 0
							src.guild_announce = 0
							src.guild_boot = 0
							src.guild_change_rank = 0
							src.guild_rank = ""
							src.guild_title=""
							src.verbs += new/mob/PC/verb/Create_Guild()
							return
					if("No")
						return
			else
				if(src.guild_leader)
					switch(alert("Leave the Guild?","Guild Leave","Yes","No"))
						if("Yes")
							src.RemoveGuildVerbs()
							Guilds.Remove(src.guild_name)
							Guilds.Remove(src.guild)
							for(var/turf/X in world)
								if(istype(X, /turf/Guild_Houses))
									if(X.guild_name == src.guild_name)
										if(istype(X,/turf/Guild_Houses/Guild_House1))
											for(var/obj/Flag/Flag1/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House2))
											for(var/obj/Flag/Flag2/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House3))
											for(var/obj/Flag/Flag3/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House4))
											for(var/obj/Flag/Flag4/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House5))
											for(var/obj/Flag/Flag5/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House6))
											for(var/obj/Flag/Flag6/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House7))
											for(var/obj/Flag/Flag7/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House8))
											for(var/obj/Flag/Flag8/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House9))
											for(var/obj/Flag/Flag9/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House10))
											for(var/obj/Flag/Flag10/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House11))
											for(var/obj/Flag/Flag11/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House12))
											for(var/obj/Flag/Flag12/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House13))
											for(var/obj/Flag/Flag13/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House14))
											for(var/obj/Flag/Flag14/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House15))
											for(var/obj/Flag/Flag15/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House16))
											for(var/obj/Flag/Flag16/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										X.guild_name=""
										GuildHouse.Remove(X)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
							src.guild_leader = 0
							src.guild_co_leader = 0
							src.guild_member = 0
							src.guild_mute = 0
							src.guild_make_item = 0
							src.guild_change_title = 0
							src.guild_invite = 0
							src.guild_announce = 0
							src.guild_boot = 0
							src.guild_change_rank = 0
							src.guild_rank = ""
							src.guild_name = ""
							src.guild = ""
							src.guild_title=""
							src.in_guild = 0
							src.verbs += new/mob/PC/verb/Create_Guild()
							spawn(1)BanSave()
						if("No")
							return

mob
	proc
		GiveGuildVerbs()
			src.verbs -= typesof(/mob/GuildLeader/verb)
			src.verbs -= typesof(/mob/GuildVerbs/verb)
			if(src.guild_leader)
				src.verbs += typesof(/mob/GuildLeader/verb)
				src.verbs += typesof(/mob/GuildVerbs/verb)
			if(src.guild_co_leader)
				src.verbs += typesof(/mob/GuildLeader/verb)
				src.verbs += typesof(/mob/GuildVerbs/verb)
			if(src.guild_member)
				src.verbs += typesof(/mob/GuildVerbs/verb)
			if(src.guild_invite)
				src.verbs += new/mob/GuildLeader/verb/Guild_Invite()
			if(src.guild_boot)
				src.verbs += new/mob/GuildLeader/verb/Guild_Boot()
			if(src.guild_announce)
				src.verbs += new/mob/GuildLeader/verb/GuildAnnouncement()
			if(src.guild_change_rank)
				src.verbs += new/mob/GuildLeader/verb/Guild_Change_Rank()
			if(src.guild_change_title)
				src.verbs += new/mob/GuildLeader/verb/Guild_Change_Title()
			if(src.guild_make_item)
				src.verbs += new/mob/GuildLeader/verb/Guild_Make_Item()
			return

		RemoveGuildVerbs()
			src.verbs -= typesof(/mob/GuildLeader/verb)
			src.verbs -= typesof(/mob/GuildVerbs/verb)
			return

		CheckGuildVerbs()
			if(src.in_guild)
				if(Guilds.Find(src.guild_name))
					if(src.guild_leader)
						src.verbs += typesof(/mob/GuildLeader/verb)
						src.verbs += typesof(/mob/GuildVerbs/verb)
					if(src.guild_co_leader)
						src.verbs += typesof(/mob/GuildLeader/verb)
						src.verbs += typesof(/mob/GuildVerbs/verb)
					if(src.guild_member)
						src.verbs += typesof(/mob/GuildVerbs/verb)
					if(src.guild_invite)
						src.verbs += new/mob/GuildLeader/verb/Guild_Invite()
					if(src.guild_boot)
						src.verbs += new/mob/GuildLeader/verb/Guild_Boot()
					if(src.guild_announce)
						src.verbs += new/mob/GuildLeader/verb/GuildAnnouncement()
					if(src.guild_change_rank)
						src.verbs += new/mob/GuildLeader/verb/Guild_Change_Rank()
					if(src.guild_change_title)
						src.verbs += new/mob/GuildLeader/verb/Guild_Change_Title()
					if(src.guild_make_item)
						src.verbs += new/mob/GuildLeader/verb/Guild_Make_Item()
					src.verbs -= new/mob/PC/verb/Create_Guild()
					return
				else
					src << "\white <center>The leader of [src.guild_name] disbanded the guild!"
					src.guild_name = ""
					src.guild_name = ""
					src.guild_leader = 0
					src.guild_co_leader = 0
					src.guild_member = 0
					src.guild_mute = 0
					src.guild_make_item = 0
					src.guild_change_title = 0
					src.guild_invite = 0
					src.guild_announce = 0
					src.guild_boot = 0
					src.guild_change_rank = 0
					src.guild_change_title = 0
					src.guild_title = ""
					src.guild_rank = ""
					src.in_guild = 0
					src.has_title = 0
					src.RemoveGuildVerbs()
					src.verbs += new/mob/PC/verb/Create_Guild()
					return
			else
				src.RemoveGuildVerbs()
				return

		GuildMemberMute(T)
			sleep(T)
			if(!src)return
			if(!src.guild_mute)return
			for(var/mob/M in world)
				if(M.guild_name == usr.guild_name)
					M << "[src] has been<font color = green> Guild UnMuted</font>!"
			src.guild_mute = 0
			return