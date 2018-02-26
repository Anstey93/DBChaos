mob/var/tmp/playing = 0
mob/var/tapionquest1=0
mob/var/tapionquest2=0
mob/NPC/Tapion
	icon_state = "Tapion"
	name = "{NPC}Tapion"
	density = 1
	safe = 1
	energy_code = 4625695
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.talking)
			return
		usr.talking=1
		if(usr.race!="Konat")
			if(usr.playing)
				usr << "<font color = white>Tapion:</font> ..."
				usr.talking=0
				return
			else
				usr.talking=0
				usr.playing = 1
				usr << "<font color = white>Tapion:</font> ..."
				sleep(15)
				if(!usr)return
				usr<<sound('Tapion.mid')
				usr << "<font color = white>Tapion's starts playing a soft melody..."
				if(usr.powerlevel<usr.powerlevel_max)
					usr.powerlevel=usr.powerlevel_max
				if(usr.staminaleft>0)
					usr.staminaleft=0
				spawn(3000)
					if(!usr)return
					usr.playing = 0
		else
			if(!usr.tapionquest1)
				switch(alert("Hello [usr]. I have something that might interest you. Long ago, me and my brother we're locked \
				away into a Magic Box. That box holds tremendous power inside that only the right person can set free. [usr], \
				do you think you have what it takes?","","Yes","Not yet"))
					if("Yes")
						usr.talking=0
						if(usr.inven_min<usr.inven_max)
							usr.tapionquest1=1
							usr.contents+=new/obj/Equipment/MagicBox
							usr << "<font color = white>Tapion:</font> I believe in you."
						else
							usr << "<font color = white>Tapion:</font> You have no space in your inventory."
							return
					else
						usr.talking=0
						return
			else
				if(!usr.tapionquest2)
					if(usr.level<800)
						usr << "<font color = white>Tapion:</font> Get to Level 800."
						usr.talking=0
						return
					switch(alert("Remember when I told you about the story of the Magic Box? I did not tell you about the reason \
					for us to be locked inside. But now the time is right. A wicked man created an evil creature wich feeds it's \
					neverending hunger on peoples fear. That creature could not be stopped. So me and my brother, had to lock \
					ourselfs into the Box, along with the creature. But now..the creature is free again, and it's terrorizing \
					everyone on this planet. [usr], as a last request, could you stop the monster, for everyones sake?","","Yes","No"))
						if("No")
							usr.talking=0
							return
						if("Yes")
							usr.talking=0
							if(usr.inven_min<usr.inven_max)
								usr.tapionquest2=1
								usr.contents+=new/obj/Equipment/LegendarySword
								usr << "<font color = white>Tapion:</font> Take this sword. It's a Legendary Sword made for only one reason: To slay the monster."
							else
								usr << "<font color = white>Tapion:</font> You have no space in your inventory."
								return
				else
					usr.talking=0
					usr << "<font color = white>Tapion:</font> Thank you [usr]."
					return