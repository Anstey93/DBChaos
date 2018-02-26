mob/proc/GoToKingCold()
	if(src.race!="Changeling")return
	if(!src.gonemetal)
		var/luck=rand(1,1000)
		if(luck==1000)
			src.talking=0
			src.dead=0
			src.overlays-='Halo.dmi'
			src.it_blocked=1
			src.it_lock=1
			src.loc=locate(165,35,7)
			return TRUE
		else
			return FALSE
	else
		src.talking=0
		src.dead=0
		src.overlays-='Halo.dmi'
		src.it_blocked=1
		src.it_lock=1
		src.loc=locate(165,35,7)
		return TRUE
mob/proc/GiveMetalBoost(T)
	src.icon_state="enrage"
	src<<"\white King Cold: \font Yes... That's it..."
	src.doing=1
	src.frozen=1
	sleep(40)
	src.powerlevel_max*=35
	src.ki_max*=32
	src.kidefense_max*=32
	src.strength_max*=34
	src.defence_max*=34
	src.powerlevel=src.powerlevel_max
	src.ki=src.ki_max
	src.kidefense=src.kidefense_max
	src.strength=src.strength_max
	src.defence=src.defence_max
	src.speed_max=1000
	src.speed=1000
	src<<"\white King Cold: \font Perfect! A complete success!"
	src.gonemetal=1
	src.overlays -= 'Elec Blue Small.dmi'
	src.overlays -= 'Elec Blue Big.dmi'
	src.overlays -= 'Elec Red Big.dmi'
	if(T=="Mecha")
		src.icon='Changling - Mecha.dmi'
	else
		src.icon='Changling - Metal.dmi'
	src.form_6=1
	for(var/obj/Technique/FusionDance/F in src)
		del(F)
	src.learn_fusiondance=2
	src.dead=0
	src.doing=0
	src.boxing=0
	src.dualtrain=0
	src.overlays-='Halo.dmi'
	src.talking=0
	src.dead=0
	src.it_blocked=0
	src.it_lock=0
	src.frozen=0
	src.loc=locate(132,163,1)
	spawn(20)src.RegenerateAndro()
mob
	var
		gonemetal=0
	NPC
		King_Cold
			name="{NPC}King Cold"
			icon_state="King Cold"
			density=1
			it_blocked=1
			verb
				Talk()
					set category=null
					set src in oview(1)
					if(usr.race!="Changeling")
						usr.talking=0
						usr.dead=0
						usr.it_blocked=0
						usr.it_lock=0
						usr.overlays-='Halo.dmi'
						usr.loc=locate(132,163,1)
						return
					if(usr.talking)return
					usr.talking=1
					if(!usr.gonemetal)
						alert("Hello [usr]. Welcome to my humble space ship. Let's go straight to the point. You were dispatched here \
for a reason. I've been working on a few experiments of my own, and I've come up with something that could immensively increase our powers! \
I call it: 'Metal Fusion'. All I need now to complete my tests, is a volunteer.")
						switch(alert(usr,"[usr] what do you say? Want to give it a shot?","","Yes","No"))
							if("No")
								usr<<"\white King Cold: \font Very well..."
								usr.talking=0
								usr.dead=0
								usr.it_blocked=0
								usr.it_lock=0
								usr.loc=locate(132,163,1)
								usr.powerlevel=1
								usr.ki=1
								usr.staminaleft=usr.staminaleft_max
								usr.safe=1
							if("Yes")
								switch(alert(usr,"Select wich type you want:","","Mecha","Metal"))
									if("Mecha")
										usr.GiveMetalBoost("Mecha")
									if("Metal")
										usr.GiveMetalBoost("Metal")
							else
								usr.talking=0
					else
						usr.talking=0
						usr.dead=0
						usr.it_blocked=0
						usr.it_lock=0
						usr.overlays-='Halo.dmi'
						usr.loc=locate(132,163,1)