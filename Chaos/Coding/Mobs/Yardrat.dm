mob
	NPC
		Yardrat_Barber
			name = "{NPC}Barber"
			icon_state = "Yardrat"
			density = 1
			doing = 0
			safe = 1
			energy_code=6733404
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.race == "Saibaman")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Changeling")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Tuffle")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Namekian")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Bio-Android")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Majin")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					if(usr.race == "Demon")
						usr<<"\white Barber:\font I can only help people with hair."
						return
					switch(input("Do you want to get your hair cut?")in list("Yes","No"))
						if("Yes")
							usr.overlays -= usr.hair_icon
							usr.overlays -= usr.hair_icon
							usr.overlays -= usr.hair_icon
							usr.overlays -= 'Hair - Goku SSJ.dmi'
							usr.overlays -= 'Hair - Goku USSJ.dmi'
							usr.overlays -= 'Hair - Goku H.dmi'
							usr.overlays -= 'Hair - Goku SH.dmi'
							usr.overlays -= 'Hair - Future Gohan SSJ.dmi'
							usr.overlays -= 'Hair - Future Gohan USSJ.dmi'
							usr.overlays -= 'Hair - Adult Gohan SSJ.dmi'
							usr.overlays -= 'Hair - Adult Gohan USSJ.dmi'
							usr.overlays -= 'Hair - Gohan H.dmi'
							usr.overlays -= 'Hair - Gohan SH.dmi'
							usr.overlays -= 'Hair - Vegeta SSJ.dmi'
							usr.overlays -= 'Hair - Vegeta USSJ.dmi'
							usr.overlays -= 'Hair - Vegeta H.dmi'
							usr.overlays -= 'Hair - Vegeta SH.dmi'
							usr.overlays -= 'Hair - Teen Gohan SSJ.dmi'
							usr.overlays -= 'Hair - Teen Gohan USSJ.dmi'
							usr.overlays -= 'Hair - Teen Gohan H.dmi'
							usr.overlays -= 'Hair - Teen Gohan SH.dmi'
							usr.overlays -= 'Hair - Raditz SSJ.dmi'
							usr.overlays -= 'Hair - Raditz USSJ.dmi'
							usr.overlays -= 'Hair - Raditz H.dmi'
							usr.overlays -= 'Hair - Raditz SH.dmi'
							usr.overlays -= 'Hair - Android.dmi'
							usr.overlays -= 'Majin.dmi'
							usr.hair="Bald"
							usr.HairCut()
						if("No")
							return
		Yardrat_ClothingShopKeeper
			name = "{NPC}Shop Keeper"
			icon_state="Yardrat"
			density = 1
			safe = 1
			energy_code=9453674
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)
						return
					usr.talking=1
					switch(input("Hello. How can I help you today?")in list("Buy","Sell","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
							var/list/Sellable=list()
							for(var/obj/I in usr.contents)
								if(!I.equiped && I.value)
									Sellable.Add(I)
							Sellable.Add("Cancel")
							var/obj/sell=input("What do you want to sell?")as anything in Sellable
							if(sell=="Cancel")
								usr.talking=0
								return
							var/confirm=input("Do you want to sell [sell.name] for [sell.value] zenni?")in list("Yes","No")
							if(!sell in usr.contents)
								usr.talking=0
								return
							if(confirm=="No")
								usr.talking=0
								return
							else
								if(sell.equiped)
									usr.talking=0
									usr<<"Unequip the item first."
									return
								else
									usr.zenni+=sell.value
									usr << "<font color = white>Shop Keeper:</font> Thank you. Have a nice day."
									usr.talking=0
									del(sell)
							if(usr.CheckInventory()==TRUE)return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What do you want to buy?")in list("Gi","Cape","Underclothing","Gloves","Never Mind"))
								if("Gi")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Gi/O = new
									if(usr.zenni >= O.value)
										var/r=input("How much Red do you want?")as num
										var/g=input("How much Green do you want?")as num
										var/b=input("How much Blue do you want?")as num
										O.icon += rgb(r,g,b)
										usr.zenni -= O.value
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										O.name = "Gi"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [O.value] zenni!"
										usr.talking=0
										return
								if("Cape")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Cape/O = new
									if(usr.zenni >= O.value)
										var/r=input("How much Red do you want?")as num
										var/g=input("How much Green do you want?")as num
										var/b=input("How much Blue do you want?")as num
										O.icon += rgb(r,g,b)
										usr.zenni -= O.value
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										O.name = "Cape"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [O.value] zenni!"
										usr.talking=0
										return
								if("Underclothing")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Underclothes/O = new
									if(usr.zenni >= O.value)
										var/r=input("How much Red do you want?")as num
										var/g=input("How much Green do you want?")as num
										var/b=input("How much Blue do you want?")as num
										O.icon += rgb(r,g,b)
										usr.zenni -= O.value
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										O.name = "Underclothes"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [O.value] zenni!"
										usr.talking=0
										return
								if("Gloves")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Gloves/O = new
									if(usr.zenni >= O.value)
										var/r=input("How much Red do you want?")as num
										var/g=input("How much Green do you want?")as num
										var/b=input("How much Blue do you want?")as num
										O.icon += rgb(r,g,b)
										usr.zenni -= O.value
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										O.name = "Gloves"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [O.value] zenni!"
										usr.talking=0
										return
								if("Never Mind")
									usr.talking=0
									return
		Yardrat_ArmorShopKeeper
			name = "{NPC}Shop Keeper"
			icon_state="Yardrat"
			density = 1
			safe = 1
			energy_code=9984364
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)
						return
					usr.talking=1
					switch(input("Hello. How can I help you today?")in list("Buy","Sell","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
							var/list/Sellable=list()
							for(var/obj/I in usr.contents)
								if(!I.equiped && I.value)
									Sellable.Add(I)
							Sellable.Add("Cancel")
							var/obj/sell=input("What do you want to sell?")as anything in Sellable
							if(sell=="Cancel")
								usr.talking=0
								return
							var/confirm=input("Do you want to sell [sell.name] for [sell.value] zenni?")in list("Yes","No")
							if(!sell in usr.contents)
								usr.talking=0
								return
							if(confirm=="No")
								usr.talking=0
								return
							else
								if(sell.equiped)
									usr.talking=0
									usr<<"Unequip the item first"
									return
								else
									usr.zenni+=sell.value
									usr << "<font color = white>Shop Keeper:</font> Thank you. Have a nice day."
									usr.talking=0
									del(sell)
							if(usr.CheckInventory()==TRUE)return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What kind of armor do you want?")in list("Hench Armor","Saiyan Armor","Never Mind"))
								if("Hench Armor")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Armor/Armor1/O = new
									if(usr.zenni >= O.value)
										var/r=input("How much Red do you want?")as num
										var/g=input("How much Green do you want?")as num
										var/b=input("How much Blue do you want?")as num
										O.icon += rgb(r,g,b)
										usr.zenni -= O.value
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										O.name = "Hench Armor"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [O.value] zenni!"
										usr.talking=0
										return
								if("Saiyan Armor")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Armor/Armor2/O = new
									if(usr.zenni >= O.value)
										var/r=input("How much Red do you want?")as num
										var/g=input("How much Green do you want?")as num
										var/b=input("How much Blue do you want?")as num
										O.icon += rgb(r,g,b)
										usr.zenni -= O.value
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										O.name = "Saiyan Armor"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [O.value] zenni!"
										usr.talking=0
										return
								if("Never Mind")
									usr.talking=0
									return
		Yardrat_ShopKeeper
			name="{NPC}Shop Keeper"
			icon_state="Yardrat"
			density = 1
			safe = 1
			energy_code = 6938204
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)
						return
					usr.talking=1
					switch(input("Hello. How can I help you today?")in list("Buy","Sell","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
							if(!usr.sellable_items)
								usr.talking=0
								return
							var/list/Sellable=list()
							for(var/obj/I in usr.contents)
								if(!I.equiped && I.value)
									Sellable.Add(I)
							Sellable.Add("Cancel")
							var/obj/sell=input("What do you want to sell?")as anything in Sellable
							if(sell=="Cancel")
								usr.talking=0
								return
							var/confirm=input("Do you want to sell [sell.name] for [sell.value] zenni?")in list("Yes","No")
							if(!sell in usr.contents)
								usr.talking=0
								return
							if(confirm=="No")
								usr.talking=0
								return
							else
								if(sell.equiped)
									usr.talking=0
									usr<<"Unequip the item first."
									return
								else
									usr.zenni+=sell.value
									usr.talking=0
									usr << "<font color = white>Shop Keeper:</font> Thank you. Have a nice day."
									del(sell)
							if(usr.CheckInventory()==TRUE)return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What do you want to browse?")in list("Weighted Clothing","Never Mind"))
								if("Weighted Clothing")
									switch(input("What do you want to buy?")in list("Yardrat Ankle Weights","Yardrat Wrist Weights","Yardrat Weighted Cape","Yardrat Weighted Gi","Yardrat Weighted Turben","Yardrat Arm Weights","Yardrat Leg Weights","Never Mind"))
										if("Never Mind")
											usr.talking=0
											return
										if("Yardrat Ankle Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*15)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*15
												usr.contents += O
												O.value*=7.5
												O.weight=2.7
												usr.talking=0
												O.name = "Yardrat Ankle Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*15] zenni!"
												usr.talking=0
												return
										if("Yardrat Wrist Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*15)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*15
												usr.contents += O
												O.value*=7.5
												O.weight=2.7
												usr.talking=0
												O.name = "Yardrat Wrist Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*15] zenni!"
												usr.talking=0
												return
										if("Yardrat Weighted Cape")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*15)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*15
												usr.contents += O
												O.value*=7.5
												O.weight=2.7
												usr.talking=0
												O.name = "Yardrat Weighted Cape"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*15] zenni!"
												usr.talking=0
												return
										if("Yardrat Weighted Gi")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*15)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*15
												usr.contents += O
												O.value*=7.5
												O.weight=2.7
												usr.talking=0
												O.name = "Yardrat Weighted Gi"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*15] zenni!"
												usr.talking=0
												return
										if("Yardrat Weighted Turben")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*15)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*15
												usr.contents += O
												O.value*=7.5
												O.weight=2.7
												usr.talking=0
												O.name = "Yardrat Weighted Turben"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*15] zenni!"
												usr.talking=0
												return
										if("Yardrat Arm Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*15)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*15
												usr.contents += O
												O.value*=7.5
												O.weight=2.7
												usr.talking=0
												O.name = "Yardrat Arm Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*15] zenni!"
												usr.talking=0
												return
										if("Yardrat Leg Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*15)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*15
												usr.contents += O
												O.value*=7.5
												O.weight=2.7
												usr.talking=0
												O.name = "Yardrat Leg Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*15] zenni!"
												usr.talking=0
												return
								if("Never Mind")
									usr.talking=0
									return
		Yardrat_Banker
			name = "{NPC}Banker"
			icon_state="Yardrat"
			density = 1
			safe = 1
			energy_code = 5432214
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
		Yardrat_Sensei
			icon_state="Yardrat"
			name = "{NPC}Yardrat Sensei"
			density = 1
			safe = 1
			energy_code = 4239989
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set category = null
					set src in oview(8)
					if(usr.talking)
						return
					if(usr.fused)
						return
					usr.talking = 1
					if(!usr.learn_it)
						switch(alert("Hi [usr.name]. We Yardratians are specialists in teleporting. \
							Do you wish to learn Instant Transmission?","","Yes","No"))
							if("Yes")
								if(usr.level<75)
									usr.talking=0
									usr << "<font color = white>Yardrat Sensei:</font> Get to Level 75 and I shall teach you!"
								else
									usr.contents += new/obj/Technique/InstantTransmission
									usr << "<font color = white>.:: You learn Instant transmission ::."
									usr.talking=0
							else
								usr.talking=0
					switch(alert("Hello [usr]. Do you want to use your Training Points?","","Yes","No"))
						if("Yes")
							switch(input("Where do you wish to use ur TPs?","TPs")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Stamina","Cancel"))
								if("Cancel")
									usr.talking=0
									return
								if("Exp")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = 20 * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_max += pl
									usr.powerlevel += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Exp!"
									usr.tp -= TP
									usr.talking = 0
									return
								if("Stamina")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.staminaleft_max += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Stamina!"
									usr.tp -= TP
									usr.talking = 0
									return
								if("Powerlevel")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_max += pl
									usr.powerlevel += pl
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [pl] Powerlevel!"
									usr.tp -= TP
									usr.talking = 0
									return
								if("Ki")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.ki_max += pl
									usr.ki += pl
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [pl] Ki!"
									usr.tp -= TP
									usr.talking = 0
									return
								if("Ki Defense")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/pl = rand(400,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.kidefense_max += pl
									usr.kidefense += pl
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [pl] Ki Defense!"
									usr.tp -= TP
									usr.talking = 0
									return
								if("Strength")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/str = rand(80,100) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.strength += str
									usr.strength_max += str
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [str] Strength!"
									usr.tp -= TP
									usr.talking = 0
									return
								if("Defense")
									var/TP = input ("How many TPs do u wish to use?") as num
									var/str = rand(80,100) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yardrat Sensei:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									while(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yardrat Sensei:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.defence += str
									usr.defence_max += str
									usr << "<font color = white>Yardrat Sensei:</font> You have gained [str] Defense!"
									usr.tp -= TP
									usr.talking = 0
									return
						if("No")
							usr.talking = 0
							return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Yardrat"
						else
							return