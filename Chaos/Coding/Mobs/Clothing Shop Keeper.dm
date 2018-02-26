mob
	NPC
		Clothing_Shop_Keeper
			name = "{NPC}Clothing Shop Keeper"
			icon_state="ShopKeeper2"
			density = 1
			safe = 1
			energy_code=9453671
			New()
				..()
				if(src.z==2)
					src.energy_code=9453672
				if(src.z==3)
					src.energy_code=9453673
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