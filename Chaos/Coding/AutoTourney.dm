/var
	tournytime=0
	tournament = 0
	match = 0
	tnum = 0
	type = ""
	started=0
	list/Entries = list()
	list/Contestants = list()
	list/Winners = list()
mob/var/tourny = 0
mob/Tournament
	verb
		Enter_Tournament()
			set category = "Channels"
			set name = "Enter Tournament"
			if(usr.dead)
				usr<<"\red You are dead!"
				return
			if(usr.fused)
				usr<<"\red You are fused!"
				return
			if(!usr.pk)
				usr<<"You are not a combatant, train more!"
				return
			if(started)
				usr<<"<font color=white>The tournament has already started</font></b></u>"
				return
			if(!tournament)
				usr<<"<font color=white>Tournament isn't open yet."
				return
			if(usr.tourny)
				usr<<"<font color=white><b><u>You're already in the tournament!</font></b></u>"
				return
//junior
			if(tnum == 1||tnum==9||tnum==17||tnum==25||tnum==33)
				if(usr.level >= 18000)
					usr << "You must be below level 18 000 to join this tournament."
					return
				else
					usr.loc=locate(rand(76,96),rand(85,72),7)
					Entries.Add(usr)
					Contestants.Add(usr)
					usr.tourny=1
					usr.safe=1
					world<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"
//world
			if(tnum == 3||tnum==11||tnum==19||tnum==27||tnum==35)
				usr.loc=locate(rand(76,96),rand(85,74),7)
				Entries.Add(usr)
				Contestants.Add(usr)
				usr.tourny=1
				usr.safe=1
				world<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"
//galactic
			if(tnum == 5||tnum==13||tnum==21||tnum==29)
				if(usr.level < 36000)
					usr << "You must be level  36 000 or higher to join this tournament."
					return
				else
					usr.loc=locate(rand(76,96),rand(85,74),7)
					Entries.Add(usr)
					Contestants.Add(usr)
					usr.tourny=1
					usr.safe=1
					world<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"
//universal
			if(tnum == 7||tnum==15||tnum==23||tnum==31)
				if(usr.level <= 50000)
					usr << "You must be level 50 000 or higher to join this tournament."
					return
				else
					usr.loc=locate(rand(76,96),rand(85,74),7)
					Entries.Add(usr)
					Contestants.Add(usr)
					usr.tourny=1
					usr.safe=1
					world<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"

		Leave_Tournament()
			set category = "Channels"
			set name = "Leave Tournament"
			if(!tournament)
				usr<<"<font color=white>Tournament isn't open yet."
				return
			if(started)
				usr<<"<font color=white>You cannot leave the tournament!</font>"
				return
			if(!usr.tourny)
				usr<<"<font color=white><b><u>You're not in the tournament!</font></b></u>"
				return
			else
				usr.loc = locate(154,165,1)
				usr.tourny=0
				usr.safe=0
				usr.ki_lock=0
				usr.attack_lock=0
				usr.it_lock=0
				Entries.Remove(usr)
				Contestants.Remove(usr)
				world<<"<font color=white><b><u>[usr] left the tournament!</font></b></u>"


proc
	Prize(var/mob/M in Winners)
		if(tnum == 1||tnum==9||tnum==17||tnum==25||tnum==33)
			world<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the junior tournament and will recieve 250 levels!</font>"
			started=0
			var/amount=250
			while(amount>0)
				M.exp = M.tnl
				M.Level_Up()
				amount -= 1
				sleep(1)

		if(tnum==2||tnum==4||tnum==6||tnum==8||tnum==10||tnum==12||tnum==14||tnum==16||tnum==18||tnum==20||tnum==22||tnum==24||tnum==26||tnum==28||tnum==30||tnum==32||tnum==34)
			world<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the race tournament and will recieve 250 levels!</font>"
			started=0
			var/amount=250
			while(amount>0)
				M.exp = M.tnl
				M.Level_Up()
				amount -= 1
				sleep(1)


		if(tnum == 3||tnum==11||tnum==19||tnum==27||tnum==35)
			world<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the world tournament and will recieve 250 levels!</font>"
			started=0
			var/amount=250
			while(amount>0)
				M.exp = M.tnl
				M.Level_Up()
				amount -= 1
				sleep(1)

		if(tnum == 5||tnum==13||tnum==21||tnum==29)
			world<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the galactic tournament and will recieve 250 levels!</font>"
			started=0
			var/amount=250
			while(amount>0)
				M.exp = M.tnl
				M.Level_Up()
				amount -= 1
				sleep(1)

		if(tnum == 7||tnum==15||tnum==23||tnum==31)
			world<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the universal tournament and will recieve 250 levels!</font>"
			started=0
			var/amount=250
			while(amount>0)
				M.exp = M.tnl
				M.Level_Up()
				amount -= 1
				sleep(1)

		M.loc = locate(154,165,1)


proc
	KILLTOURNY()
		for(var/mob/PC/M in world)
			M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
			M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			if(M.tourny)
				if(tnum == 1||tnum==9||tnum==17||tnum==25||tnum==33)
					M<<"For participating in the tournament you are rewarded with 50 levels."
					var/amount=50
					while(amount>0)
						M.exp = M.tnl
						M.Level_Up()
						amount -= 1
						sleep(1)
				else
					M<<"For participating in the tournament you are rewarded with 50 levels."
					var/amount=50
					while(amount>0)
						M.exp = M.tnl
						M.Level_Up()
						amount -= 1
						sleep(1)
				M.tourny = 0
				M.safe=0
				M.ki_lock=0
				M.attack_lock=0
				M.it_lock=0

				Entries.Remove(M)
				Contestants.Remove(usr)
				M.loc = locate(154,165,1)
		tournament=0
		started=0
proc
	AutoStartTourney()
		tnum ++
		if(tnum >= 18)
			tnum = 1
		if(tournament == 1)
			return
		else
			if(tnum == 1||tnum==5||tnum==9||tnum==13||tnum==17)
				world << "<center><font size=2><font color = white><b><center>The Junior Martial Arts Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Tournament tab and select Enter Tournament."
			if(tnum == 2||tnum==6||tnum==10||tnum==14||tnum==18)
				world << "<center><font size=2><font color = red><b><center>The World Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Tournament tab and select Enter Tournament."
			if(tnum == 3||tnum==7||tnum==11||tnum==15)
				world << "<center><font size=2><font color = cyan><b><center>The Intermediate Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Tournament tab and select Enter Tournament."
			if(tnum == 4||tnum==8||tnum==12||tnum==16)
				world << "<center><font size=2><font color = Gray><b><center>The All-Pro Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Tournament tab and select Enter Tournament."

			tournament = 1
			for(var/mob/M in world)
				M.verbs += new/mob/Tournament/verb/Enter_Tournament()
				M.verbs += new/mob/Tournament/verb/Leave_Tournament()
				for(var/mob/Q in Entries)
					Entries.Remove(Q)
				for(var/mob/S in Winners)
					Winners.Remove(S)
				for(var/mob/C in Contestants)
					Contestants.Remove(C)
			spawn(1000) AutoStopTourney()
	AutoStopTourney()
		if(tournament == 1)
			for(var/mob/M in world)
				M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
				M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			if(Entries.len<=1 && Winners.len<1)
				started=0
				for(var/mob/PC/M in world)
					M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
					M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
				tournament=0
				KILLTOURNY()
			Tournament_AI()

	AutoTournyRevive()
		for(var/mob/D in world)
			if(D.dead)
				D.overlays -= 'Halo.dmi'
				D.dead = 0
				D.safe = 0

				D.loc=locate(154,165,1)
				spawn(300)
					if(!D)return
					D.safe = 0

proc
	Tournament_AI()
		started=1
		if(Entries.len<1 && Winners.len<1)
			for(var/mob/C in world)
				if(C.client)
					if(C.tourny==1)
						C.tourny=0
						C.safe=0

			KILLTOURNY()
			started=0
			return
		if(Entries.len<1 && Winners.len==1)
			tournament=0
			world<<"<center><font size=2><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/M in Winners)
				world<<M
				Prize(M)
				Entries=list()
				Winners=list()
			for(var/mob/C in world)
				if(C.client)
					C.tourny=0
					C.safe=0

			for(var/mob/M in world)
				M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
				M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			started=0
			spawn(50)AutoTournyRevive()
			return
		if(Entries.len < 2)
			NextRound()
		else
			FixEntries()
			if(match)
				return
			if(!Entries||Entries.len<2)
				Tournament_AI()
				return
			world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: Are you ready for battle?"
			world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: Next up is..."
			sleep(15)
			Matches()

	FixEntries()
		var/list/Cop=list()
		for(var/mob/A in Entries)
			var/good=1
			if(A&&ismob(A)&&A.client&&A.z==7)
				for(var/mob/B in Cop)
					if(A==B)
						good=0
				if(good)
					Cop+=A
				else
		Entries=Cop

	Matches()
		FixEntries()
		if(!Entries||Entries.len<2)
			Tournament_AI()
			return
		var/mob/A=Entries[1]
		var/mob/B=Entries[2]
		if(!A||!B||A==B||A.z!=7||B.z!=7)
			Matches()
			return
		match=1
		if(!(A && B))
			match=0
			Tournament_AI()
			return
		world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: [A] V.S. [B]!"
		world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: You have 15 seconds to prepare yourselves!"
		sleep(150)
		world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: 3!"
		sleep(10)
		world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: 2!"
		sleep(10)
		world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: 1!"
		sleep(10)
		if(!A||!B||A==B)
			match=0
			world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: Match Cancelled..."
			Tournament_AI()
			return
		world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: FIGHT!"
		sleep(1)
		if(!A||!B||A==B)
			match=0
			world<<"<center><font size=2><font color=#5f9ea0>Tournament Announcer: Match Cancelled..."
			Tournament_AI()
			return
		if(A)A.loc=locate(82,57,7)
		if(B)B.loc=locate(90,57,7)
		A.safe=0
		B.safe=0
		Fight(A,B)
		FixEntries()
		match=0
		Tournament_AI()

proc
	Fight(mob/A,mob/B)
		set background = 1
		while(1)
			if(!B || B.dead || !B.tourny)
				if(!B)
					world<<"<center><font size=2><font color=#5f9ea0>[A] has won his round because his opponent has left!"
				else
			//		var/lprize = 300 + round(B.level/20)
					world<<"<center><font size=2><font color=#5f9ea0>[A] has eliminated [B]!"
					Entries.Remove(B)
					B.tourny=0
					if(tnum == 1||tnum==9||tnum==17||tnum==25||tnum==33)
						B<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							B.exp = B.tnl
							B.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum==2||tnum==4||tnum==6||tnum==8||tnum==10||tnum==12||tnum==14||tnum==16||tnum==18||tnum==20||tnum==22||tnum==24||tnum==26||tnum==28||tnum==30||tnum==32||tnum==34)
						B<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							B.exp = B.tnl
							B.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum == 3||tnum==11||tnum==19||tnum==27||tnum==35)
						B<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							B.exp = B.tnl
							B.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum == 5||tnum==13||tnum==21||tnum==29)
						B<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							B.exp = B.tnl
							B.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum == 7||tnum==15||tnum==23||tnum==31)
						B<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							B.exp = B.tnl
							B.Level_Up()
							amount -= 1
							sleep(1)
				Winners.Add(A)
				Entries.Remove(A)
				A.loc=locate(rand(76,96),rand(69,74),7)
				A.Power_Redefine()
				return
			if(!A || A.dead || !A.tourny)
				if(!A)
					world<<"<center><font size=2><font color=#5f9ea0>[B] has won his round because his opponent has left!"
				else
			//		var/lprize = 300 + round(A.level/20)
					world<<"<center><font size=2><font color=#5f9ea0>[B] has eliminated [A]!"
					Entries.Remove(A)
					A.tourny=0
					if(tnum == 1||tnum==9||tnum==17||tnum==25||tnum==33)
						A<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							A.exp = A.tnl
							A.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum==2||tnum==4||tnum==6||tnum==8||tnum==10||tnum==12||tnum==14||tnum==16||tnum==18||tnum==20||tnum==22||tnum==24||tnum==26||tnum==28||tnum==30||tnum==32||tnum==34)
						A<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							A.exp = A.tnl
							A.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum == 3||tnum==11||tnum==19||tnum==27||tnum==35)
						A<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							A.exp = A.tnl
							A.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum == 5||tnum==13||tnum==21||tnum==29)
						A<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							A.exp = A.tnl
							A.Level_Up()
							amount -= 1
							sleep(1)
					if(tnum == 7||tnum==15||tnum==23||tnum==31)
						A<<"For participating in the tournament you are rewarded with 50 levels."
						var/amount=50
						while(amount>0)
							A.exp = A.tnl
							A.Level_Up()
							amount -= 1
							sleep(1)
				Winners.Add(B)
				Entries.Remove(B)
				B.loc=locate(rand(76,96),rand(69,74),7)
				B.Power_Redefine()
				return
			else
				sleep(10)
				continue

	NextRound()
		for(var/mob/M in Winners)
			Entries.Add(M)
			M.loc=locate(rand(76,96),rand(69,74),7)
			sleep(10)
			Winners.Remove(M)
		if(Entries.len<2)
			KILLTOURNY()
			return
		world<<"<center><font size=2><font color=#5f9ea0>Tournament News: The next round will now begin!"
		Tournament_AI()
