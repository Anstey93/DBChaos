mob
	NPC
		Training_Shop_Keeper
			name = "{NPC}Training Shop Keeper"
			icon_state = "ShopKeeper1"
			density = 1
			safe = 1
			energy_code=5131581
			New()
				..()
				if(src.z==2)
					src.energy_code=5131582
				if(src.z==3)
					src.energy_code=5131583
				if(src.z==7)
					src.energy_code=0
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
							switch(input("What do you want to browse?")in list("Weighted Clothing","Never Mind"))
								if("Weighted Clothing")
									switch(input("What do you want to buy?")in list("Ankle Weights","Wrist Weights","Weighted Cape","Weighted Gi","Weighted Turben","Never Mind"))
										if("Never Mind")
											usr.talking=0
											return
										if("Ankle Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*5)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*5
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Ankle Weight"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
												usr.talking=0
												return
										if("Wrist Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*5)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*5
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Wrist Weight"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
												usr.talking=0
												return
										if("Weighted Cape")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*5)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*5
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Weighted Cape"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
												usr.talking=0
												return
										if("Weighted Gi")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*5)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*5
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Weighted Gi"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
												usr.talking=0
												return
										if("Weighted Turben")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*5)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*5
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Weighted Turben"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
												usr.talking=0
												return
								if("Never Mind")
									usr.talking=0
									return

mob
	NPC
		Advanced_Training_Shop_Keeper
			name = "{NPC}Shop Keeper"
			icon_state = "ShopKeeper5"
			density = 1
			safe = 1
			energy_code=6938201
			New()
				..()
				if(src.z==2)
					src.energy_code=6938202
				if(src.z==3)
					src.energy_code=6938203
				if(src.z==7)
					src.energy_code=0
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
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What do you want to browse?")in list("Weighted Clothing","Never Mind"))
								if("Weighted Clothing")
									switch(input("What do you want to buy?")in list("Advanced Ankle Weights","Advanced Wrist Weights","Advanced Weighted Cape","Advanced Weighted Gi","Advanced Weighted Turben","Advanced Arm Weights","Advanced Leg Weights","Never Mind"))
										if("Never Mind")
											usr.talking=0
											return
										if("Advanced Ankle Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*7)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*7
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Ankle Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*7] zenni!"
												usr.talking=0
												return
										if("Advanced Wrist Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*7)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*7
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Wrist Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*7] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Cape")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*7)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*7
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Weighted Cape"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*7] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Gi")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*7)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*7
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Weighted Gi"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*7] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Turben")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*7)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*7
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Weighted Turben"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*7] zenni!"
												usr.talking=0
												return
										if("Advanced Arm Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*7)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*7
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Arm Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*7] zenni!"
												usr.talking=0
												return
										if("Advanced Leg Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*7)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*7
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Leg Weights"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*7] zenni!"
												usr.talking=0
												return
								if("Never Mind")
									usr.talking=0
									return