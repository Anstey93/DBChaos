var
	list
		Parties=list()
mob
	var
		tmp
			party_name=""
			in_party=0
			party_leader=0
			party_member=0
	PC
		verb
			Create_Party()
				set category="Channels"
				if(src.in_party)
					return
				if(src.spam_delay)
					src<<"You must wait a moment."
					return
					src.spam_delay=1
				else
					switch(alert("Do you want to create a party?","","Yes","No"))
						if("No")
							src.spam_delay=0
							return
						else
							var/partyname=input("Type in the Guild name with 'NO' HTML(20 characters max).")as text
							partyname = html_encode(partyname)
							if(lentext(partyname) > 20)
								alert("Party name cannot exceed 20 Characters.")
								return
							if(partyname == " "|| partyname == null || !partyname)
								return
							if(Parties.Find(partyname))
								alert("That name is already taken.")
								return
							if(Check_For_Spam(partyname,SPAM) == TRUE)
								src<<"Please do not use linebreak characters."
								return
							switch(alert("Create the party: [partyname]?","Party Create","Yes","No"))
								if("No")
									return
								if("Yes")
									if(Parties.Find(partyname))
										alert("That name is already taken.")
										return
									src.party_name = partyname
									src.party_leader = 1
									src.in_party = 1
									src.verbs -= new/mob/PC/verb/Create_Party()
									src.verbs += new/mob/PartyVerbs/verb/Party_Boot()
									src.verbs += new/mob/PartyVerbs/verb/Party_Chat()
									src.verbs += new/mob/PartyVerbs/verb/Party_Invite()
									src.verbs += new/mob/PartyVerbs/verb/Party_Members()
									src.verbs += new/mob/PartyVerbs/verb/Party_Leave()

									Parties.Add(partyname)
									return
	PartyVerbs
		verb
			Party_Boot()
				set category="Party"
				var/list/L=new/list()
				for(var/mob/M in world)
					if(M.in_party&&M.party_name==src.party_name&&M!=src)
						L.Add(M)
				L.Add("Cancel")
				var/mob/B=input("Who do you wish to Boot from: [src.party_name]?")in L
				if(B=="Cancel")
					return
				if(!B)
					return
				if(B.party_name!=src.party_name)
					return
				if(!src.in_party)
					return
				switch(alert("Do you want to Boot [B] from: [src.party_name]?","","Boot","Cancel"))
					if("Cancel")
						return
					else
						for(var/mob/N in world)
							if(N.party_name==src.party_name)
								N<<"<font color=lime>[src.party_name] Information:<font color=white> [src] Booted [B]!"
						B.in_party=0
						B.party_leader=0
						B.party_member=0
						B.party_name=B.name
						B.verbs += new/mob/PC/verb/Create_Party()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Members()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
						return
		verb
			Party_Chat(T as text)
				set category="Party"
				if(channelmute!="")
					src<<"All chat channels have been muted."
					return
				if(!T)
					alert("Your message may not be blank.")
					return
				T = html_encode(T)
				if(lentext(T) > 100)
					alert("Your message cannot exceed 100 characters.")
					return
				if(Check_For_Spam(T,SPAM) == TRUE)
					src<<"Please do not use linebreak characters."
					return
				for(var/mob/M in world)
					if(M.party_name==src.party_name)
						M<<"<font color=lime>{[src.party_name]}[src]:<font color=white><font size=-2> [T]"
				return
			Party_Invite()
				set category="Party"
				var/list/L=new/list()
				for(var/mob/PC/M in world)
					if(M.in_party)continue
					if(!M.loggedin)continue
					L.Add(M)
				L.Add("Cancel")
				var/mob/B=input("Who do you wish to Invite to: [src.party_name]?")in L
				if(B=="Cancel")
					return
				if(!B)
					return
				if(B.in_party)
					return
				if(!src.in_party)
					return
				switch(alert("Do you want to Invite [B] to: [src.party_name]?","","Invite","Cancel"))
					if("Cancel")
						return
					else
						switch(alert(B,"[src] is inviting you to join: [src.party_name]. Do you accept?","","Join","No"))
							if("No")
								return
							else
								if(!src)
									return
								if(!src.in_party)
									return
								B.in_party=1
								B.party_leader=0
								B.party_member=1
								B.party_name=src.party_name
								B.verbs -= new/mob/PC/verb/Create_Party()
								B.verbs += new/mob/PartyVerbs/verb/Party_Chat()
								B.verbs += new/mob/PartyVerbs/verb/Party_Members()
								B.verbs += new/mob/PartyVerbs/verb/Party_Leave()
								for(var/mob/N in world)
									if(N.party_name==src.party_name)
										N<<"<font color=lime>[src.party_name] Information:<font color=white> [src] Invited [B]!"
								return
			Party_Members()
				set category="Party"
				if(src.spam_delay)
					return
				src<<"<font color=lime>---------------<br><font color=white>[src.party_name] Members:"
				for(var/mob/C in world)
					if(C.party_name==src.party_name)
						src<<"<font color=lime>Name: [C.name]"
				src<<"<font color=lime>---------------<br>"
				spawn(40)src.spam_delay=0
			Party_Leave()
				set category="Party"
				if(!src.in_party)
					return
				switch(alert("Do you want to leave: [src.party_name]?","","Yes","No"))
					if("Cancel")
						return
					if("No")
						return
					if("Yes")
						if(!src.in_party)
							return
						if(!src.party_leader)
							for(var/mob/M in world)
								if(M.party_name==src.party_name)
									M<<"<font color=lime>[src.party_name] Information:<font color=white> [src] has left the party!"
							src.in_party=0
							src.party_leader=0
							src.party_member=0
							src.party_name=src.name
							src.verbs += new/mob/PC/verb/Create_Party()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Members()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
							return
						else
							Parties.Remove(src.party_name)
							for(var/mob/M in world)
								if(M.party_name==src.party_name)
									M<<"<font color=lime>[src.party_name] Information:<font color=white> [src], the leader, has left the party!"
									M.in_party=0
									M.party_leader=0
									M.party_member=0
									M.party_name=M.name
									M.verbs += new/mob/PC/verb/Create_Party()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Members()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
							src.in_party=0
							src.party_leader=0
							src.party_member=0
							src.party_name=src.name
							src.verbs += new/mob/PC/verb/Create_Party()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Members()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
							return