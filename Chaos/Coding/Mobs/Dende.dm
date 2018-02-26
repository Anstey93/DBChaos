mob/NPC/Dende
	icon_state = "Dende"
	name = "{NPC}Dende"
	density = 1
	safe = 1
	energy_code = 6574567
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.powerlevel < usr.powerlevel_max)
			usr << "<font color = white>Dende:</font> Oh [usr.name], those wounds look bad, let me heal you!"
			sleep(10)
			usr << "<font color = #0066FF>Dende puts his hands on your head and you feel much better!"
			sleep(25)
			usr.powerlevel = usr.powerlevel_max
			usr << "<font color = white>Dende:</font> There, I hope that helps you [usr.name]!"
			src.icon_state = "Dende"
			return
		else
			usr << "<font color = white>Dende:</font> How are you today [usr.name]?"
			return

