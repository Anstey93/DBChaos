mob/var/banked_zenni = 0
mob
	NPC
		Banker
			name = "{NPC}Banker"
			icon_state="Banker"
			density = 1
			safe = 1
			energy_code = 5432211
			New()
				..()
				if(src.z==2)
					src.energy_code=5432212
				if(src.z==3)
					src.energy_code=5432213
				if(src.z==4)
					src.energy_code=5432214
				if(src.z==7)
					src.energy_code=0
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)
						return
					usr.talking = 1
					switch(input("Hello [usr.name]. What can I do for you today?")in list("Deposit","Withdrawl","Transfer Funds","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Deposit")
							if(usr.zenni<1)
								usr << "<font color = white>Banker:</font> You don't have any zenni!"
								usr.talking=0
								return
							var/deposit = input("How much do you wish to Deposit?")as num
							if(deposit>usr.zenni)
								deposit=usr.zenni
							if(deposit <= 0)
								usr.talking = 0
								return
							else
								usr.zenni -= round(deposit)
								usr.banked_zenni += round(deposit)
								usr.talking = 0
								usr << "<font color = white>Banker:</font> [deposit] has been successfully transfered into your Account!"
								return
						if("Withdrawl")
							if(usr.banked_zenni<1)
								usr << "<font color = white>Banker:</font> You don't have any zenni in your account!"
								usr.talking=0
								return
							var/withdrawl = input("How much do you wish to Withdraw?")as num
							if(withdrawl > usr.banked_zenni)
								withdrawl=usr.banked_zenni
							if(withdrawl<=0)
								usr.talking=0
								return
							else
								usr.banked_zenni -= round(withdrawl)
								usr.zenni += round(withdrawl)
								usr.talking = 0
								usr << "<font color = white>Banker:</font> [withdrawl] has been successfully withdrawn from your Account!"
								return
						if("Transfer Funds")
							var/transfer = input("How much do you wish to Transfer?")as num
							if(transfer > usr.banked_zenni)
								transfer=usr.banked_zenni
							if(transfer <= 0)
								usr.talking = 0
								return
							else
								var/varPeople = list()
								for(var/mob/PC/M in world)
									varPeople += M
								var/varTo = input("Who would you like to Transfer [transfer] Zenni to whom?","Transfer Funds") in varPeople + list("Cancel")
								if(varTo == "Cancel" || varTo == "[usr]")
									usr.talking = 0
									return
								else
									usr.banked_zenni -= round(transfer)
									varTo:banked_zenni += round(transfer)
									usr.talking = 0
									usr << "<font color = white>Banker:</font> [transfer] Zenni has been successfully transferred to [varTo]'s account."
									varTo << "<font color = white>Banker:</font> [transfer] Zenni has been successfully transferred to your account from [usr]."
									return
		BankerGH
			name = "{NPC}Banker"
			icon_state="Banker"
			density = 1
			safe=1
			energy_code=0
			it_blocked=1
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)
						return
					usr.talking = 1
					switch(input("Hello [usr.name]. What can I do for you today?")in list("Deposit","Withdrawl","Transfer Funds","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Deposit")
							if(usr.zenni<1)
								usr << "<font color = white>Banker:</font> You don't have any zenni!"
								usr.talking=0
								return
							var/deposit = input("How much do you wish to Deposit?")as num
							if(deposit>usr.zenni)
								deposit=usr.zenni
							if(deposit <= 0)
								usr.talking = 0
								return
							else
								usr.zenni -= round(deposit)
								usr.banked_zenni += round(deposit)
								usr.talking = 0
								usr << "<font color = white>Banker:</font> [deposit] has been successfully transfered into your Account!"
								return
						if("Withdrawl")
							if(usr.banked_zenni<1)
								usr << "<font color = white>Banker:</font> You don't have any zenni in your account!"
								usr.talking=0
								return
							var/withdrawl = input("How much do you wish to Withdraw?")as num
							if(withdrawl > usr.banked_zenni)
								withdrawl=usr.banked_zenni
							if(withdrawl<=0)
								usr.talking=0
								return
							else
								usr.banked_zenni -= round(withdrawl)
								usr.zenni += round(withdrawl)
								usr.talking = 0
								usr << "<font color = white>Banker:</font> [withdrawl] has been successfully withdrawn from your Account!"
								return
						if("Transfer Funds")
							var/transfer = input("How much do you wish to Transfer?")as num
							if(transfer > usr.banked_zenni)
								transfer=usr.banked_zenni
							if(transfer <= 0)
								usr.talking = 0
								return
							else
								var/varPeople = list()
								for(var/mob/PC/M in world)
									varPeople += M
								var/varTo = input("Who would you like to Transfer [transfer] Zenni to whom?","Transfer Funds") in varPeople + list("Cancel")
								if(varTo == "Cancel" || varTo == "[usr]")
									usr.talking = 0
									return
								else
									usr.banked_zenni -= round(transfer)
									varTo:banked_zenni += round(transfer)
									usr.talking = 0
									usr << "<font color = white>Banker:</font> [transfer] Zenni has been successfully transferred to [varTo]'s account."
									varTo << "<font color = white>Banker:</font> [transfer] Zenni has been successfully transferred to your account from [usr]."
									return