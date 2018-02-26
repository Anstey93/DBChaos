mob
	var
		headvalue=0
	NPC
		Officer
			name = "{NPC}Officer"
			icon_state = "Officer"
			density = 1
			safe = 1
			energy_code=3542341
			New()
				..()
				if(src.z==2)
					src.energy_code=3542342
				if(src.z==3)
					src.energy_code=3542343
				if(src.z==4)
					src.energy_code=3542344
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.talking)return
					usr.talking=1
					switch(alert("Good day [usr]. What can I help you with today?","","Set Bounty","View Bounty","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("View Bounty")
							input(usr,"Bounty list:")as null|anything in Bounty
							usr.talking=0
							return
						if("Set Bounty")
							var/list/A = new/list()
							for(var/mob/PC/M in world)
								if(M.client)
									A.Add(M)
							A.Add("Cancel")
							var/mob/criminal=input("Set a bounty on who?")in A
							if(criminal=="Cancel")
								usr.talking=0
								return
							var/value=input("Set the Zenni reward:")as num
							if(value<1)
								usr.talking=0
								return
							if(value>usr.zenni)
								value=usr.zenni
							if(!criminal)
								usr.talking=0
								usr<<"[criminal] has logged out!"
								return
							if(Bounty.Find("Name: [criminal.name]([criminal.headvalue] Zenni)"))
								Bounty.Remove("Name: [criminal.name]([criminal.headvalue] Zenni)")
							criminal.headvalue+=round(value)
							usr.zenni-=round(value)
							usr<<"Bounty set!"
							Bounty.Add("Name: [criminal.name]([criminal.headvalue] Zenni)")
							usr.talking=0
							var/savefile/B=new("World Save Files/Bounty.sav")
							B["Bounty"]<<Bounty
							return