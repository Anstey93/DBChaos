mob/var/tmp/loggedin=0
mob/PC/Login()
	spawn(0)src.CheckBan()
	spawn(1)src.LoginLog()
	var/icount = 0
	for(var/obj/Equipment/E in src)
		icount ++
	for(var/obj/Gym/G in src)
		icount ++
	for(var/obj/Props/Furnature/GF in src)
		icount ++
	if(icount>src.inven_max)
		src<<"You have more items in your inventory than the allowed ammount. Take this into attention or you will lose your save file."
	spawn(5)src.mainfile()
	src.loc = locate(rand(112,128),rand(119,128),1)
	players++
	spawn(20)src.client.AutoSave()
	spawn(10)src.AdminLoad()
	spawn(50)BudokaiMasterCheck()
	spawn(1)src.DBDelete()
	src.icon_state = ""
	src.sight &= ~BLIND
	src.density=1
	src.loggedin=1
	src.overlays-='Music Box.dmi'
	src.overlays-=icon('Techs.dmi',"whirlwindspin")
	src.overlays-=icon('Techs.dmi',"distructodisko")
	src.overlays-=icon('Techs.dmi',"kienzandisko")
	src.overlays-=icon('Techs.dmi',"spiritballo")
	src.overlays-=icon('Techs.dmi',"imprisonmentball")
	src.overlays-=icon('Techs.dmi',"demonshackle")
	src.overlays-=icon('Techs.dmi',"fatwrap")
	src.overlays-=icon('Techs.dmi',"galaticdonut")
	src.overlays-=icon('Techs.dmi',"kamehamehaki")
	src.overlays-=icon('Techs.dmi',"kamehameha10ki")
	src.overlays-=icon('Techs.dmi',"finishbusterki")
	src.overlays-=icon('Techs.dmi',"galickgunki")
	src.overlays-=icon('Techs.dmi',"finalflashki")
	src.overlays-=icon('Techs.dmi',"finalshineki")
	src.overlays-=icon('Techs.dmi',"masenkoki")
	src.overlays-=icon('Techs.dmi',"hellblazeki")
	src.overlays-=icon('Techs.dmi',"tribeamki")
	src.overlays-=icon('Techs.dmi',"specialbeamcannonki")
	src.overlays-=icon('Techs.dmi',"fakemoono")
	src.overlays-='Charge Black.dmi'
	src.overlays-='Charge Blue.dmi'
	src.overlays-='Charge Yellow.dmi'
	src.overlays-='Charge Red.dmi'
	src.overlays-='Charge Orange.dmi'
	src.overlays-='Charge Green.dmi'
	src.overlays-='Charge Pink.dmi'
	src.overlays-='Spirit Bomb.dmi'
	src.overlays-='Death Ball.dmi'
	src.overlays-='Super Nova.dmi'
	src.overlays -= new/obj/techs/small_spirit_bomb
	src.overlays -= new/obj/techs/small_death_ball
	src.underlays -= src.underlays
	src.overlays -= src.aura
	src.overlays -= 'Aura.dmi'
	src.add_exp = src.level
	spawn(1)
		if(src.GMLevel > 0)
			switch(alert("Do You Wish To Announce Your Arrival To The World?","Welcome to Dragonball Z: Super","Yes","No"))
				if("Yes")
					world << "<font color = #1E90FF>Server Information: <font color = white>[src.name] the [src.race] has joined the server."
		else
			world << "<font color = #1E90FF>Server Information: <font color = white>[src.name] the [src.race] has joined the server."
	spawn(1)src.CHECK()
	..()
mob
	var
		tail_grow_delay=30
	proc
		CHECK()
			spawn(10)world.UpdatePlayers()
			if(!src.x)
				src.loc=locate(rand(27,54),rand(316,324),7)
			if(src.powerlevel<=0)
				src.powerlevel=50
			if(src.ki<=0)
				src.ki=50
			if(src.enraged)
				src.enraged=0
				src.Power_Redefine()
			if(src.trans_delay)
				src.trans_delay = 0
			if(src.KO)
				src.powerlevel = 50
				src.KO = 0
				src.frozen = 0
			if(src.kaioken)
				spawn(10)src.Kaio_Strain()
			if(src.race=="Human"||src.race=="Changeling"||src.race=="Demon")
				spawn(30)src.FORM1_EXP()
			if(src.race=="Saiyan"||src.race=="Half Saiyan")
				spawn(30)src.SSJ_EXP()
			if(src.race=="Kai")
				spawn(40)src.GravityFieldCooldown()
				spawn(5)src.BuffCooldown1()
				spawn(10)src.BuffCooldown2()
				spawn(15)src.BuffCooldown3()
				spawn(20)src.BuffCooldown4()
				spawn(25)src.BuffCooldown5()
				spawn(30)src.BuffCooldown6()
			spawn(1)
				src.CheckGuildVerbs()
				Budokai_Check()
			spawn(10)
				if(src.legendarysword)
					src.overlays-='Legendary Sword.dmi'
					src.legendarysword=0
					src.strength=src.strength_max
					for(var/obj/Technique/SwordSlash/S in src.contents)
						del(S)
					for(var/obj/Equipment/LegendarySword/L in src.contents)
						L.suffix=null
					src.speed=src.speed_max
				src.HBTC_Countdown()
			spawn(2)
				if(src.fused)
					src.UnFuse()
				if(src.buff1||src.buff2||src.buff3||src.buff4)
					src.buff1=0
					src.buff2=0
					src.buff3=0
					src.buff4=0
					src.Power_Redefine()
				src.Tail_Grow()
			spawn(5)
				src.party_name=src.name
			if(src.in_war)
				src.in_war=0
				src.loc=locate(33,327,7)
				src.it_lock=0
				src.it_blocked=0
			if(src.challenge)
				src.loc=locate(33,327,7)
				src.it_lock=0
				src.it_blocked=0
				src.arena_lose++
			if(src.in_tourney)
				src.loc=locate(38,327,7)
				src.it_lock=0
				src.it_blocked=0
				src.in_tourney=0
			spawn(15)
				if(night)
					if(src.race=="Saiyan"||src.race=="Half Saiyan")
						if(src.level<75)
							src.OozaruTrans()
				if(!night)
					if(src.race=="Saiyan"||src.race=="Half Saiyan")
						if(src.Oozaru)
							src.Forced_Oozaru_Revert()
			spawn(40)
				for(var/obj/Technique/CustomAttack/A in src)
					del(A)
				src.contents+=new/obj/Technique/CustomAttack
				if(src.race=="Android"||src.gonemetal)
					spawn(5)src.RegenerateAndro()
			for(var/obj/Props/Furnature/FUR in src)
				if(!FUR.invenable)
					del(FUR)
			for(var/obj/Gym/GY in src)
				if(!GY.invenable)
					del(GY)
	proc
		Tail_Grow()
			if(src.race=="Saiyan")
				if(!src.has_tail)
					if(src.tail_grow_delay>0)
						src.tail_grow_delay-=1
					else
						if(src.tail_grow_delay<=0)
							if(!src.has_tail)
								src << "<center><font color = white> .:: Your Tail Grew Back ::.</font></center></center>"
								src.overlays+='Tail.dmi'
								src.has_tail=1
					spawn(600)src.Tail_Grow()
				else
					return
	proc
		DBDelete()
			for(var/obj/Earth_Dragonballs/O1 in src)
				del(O1)
			for(var/obj/Namek_Dragonballs/O2 in src)
				del(O2)
			for(var/obj/Black_Dragonballs/O3 in src)
				del(O3)
			return