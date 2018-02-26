mob/var/beans = 1
mob/NPC/Korin
	icon_state = "Korin"
	name = "{NPC}Korin"
	density = 1
	safe = 1
	it_blocked=0
	energy_code = 5564321
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.talking)
			return
		usr.talking = 1
		if(usr.CheckInventory()==TRUE)
			usr.talking=0
			return
		if(usr.beans > 0)
			usr << "<font color = white>Korin:</white> Hey [usr.name], I think this may help you in your training!"
			sleep(25)
			usr << "<font color = #0066FF>Korin puts a Senzu Bean in your hand."
			sleep(25)
			usr << "<font color = white>Korin:</white> Come back later, I may have more for you."
			usr.contents += new/obj/Equipment/Consumable/Senzu
			usr.inven_min ++
			usr.beans --
			usr.talking = 0
			sleep(1200)
			if(!usr)return
			usr.beans = 1
			return
		else
			usr << "<font color = white>Korin:</white> Hey [usr.name], how is your training going?"
			usr.talking = 0
			return
	verb/Buy_Bean()
		set category = null
		set src in oview(1)
		if(usr.CheckInventory()==TRUE)
			usr.talking=0
			return
		var/bcost = 2500
		if(usr.talking)
			return
		usr.talking = 1
		if(usr.zenni >= bcost)
			if(usr.inven_min < usr.inven_max)
				usr << "<font color = #0066FF>Korin puts a Senzu Bean in your hand."
				sleep(15)
				if(usr.zenni < bcost)return
				if(!usr)return
				usr << "<font color = white>Korin:</white> Come back later, I may have more for you."
				usr.contents += new/obj/Equipment/Consumable/Senzu
				usr.zenni -= bcost
				usr.talking = 0
				return
			else
				usr << "<font color = white>Korin:</white> You dont have enough room."
				usr.talking = 0
				return
		else
			usr << "<font color = white>Korin:</white> You need 2500 zenni."
			usr.talking = 0
			return