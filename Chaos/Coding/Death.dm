mob
	var
		witness_deaths = 0
		arena_lose = 0
		arena_win = 0
		enraged=0
		gone_ssj=0
		pvpkills=0
mob
	proc
		ResetSomeStats()
			src.thrown=0
			src.overlays-=icon('Techs.dmi',"galaticdonut")
			src.overlays-=icon('Techs.dmi',"demonshackle")
			src.overlays-=icon('Techs.dmi',"imprisonmentball")
			src.binded=0
			src.doing=0
			src.frozen=0
			src.boxing=0
			src.dualtrain=0
			src.finish_delay=0
			src.deflecting = 0
			src.dodging = 0
			src.blocking = 0
			src.countering = 0
			src.e_db_1 = 0
			src.e_db_2 = 0
			src.e_db_3 = 0
			src.e_db_4 = 0
			src.e_db_5 = 0
			src.e_db_6 = 0
			src.e_db_7 = 0
			src.n_db_1 = 0
			src.n_db_2 = 0
			src.n_db_3 = 0
			src.n_db_4 = 0
			src.n_db_5 = 0
			src.n_db_6 = 0
			src.n_db_7 = 0
			src.b_db_1 = 0
			src.b_db_2 = 0
			src.b_db_3 = 0
			src.b_db_4 = 0
			src.b_db_5 = 0
			src.b_db_6 = 0
			src.b_db_7 = 0
		Rage_Unleash()
			if(src.race == "Saiyan" && src.rage_chromosome && !src.gone_ssj)
				if(src.powerlevel_max >= 90000)
					if(src.witness_deaths >= 5)
						if(!src.gone_ssj)
							src.gone_ssj = 1
							for(var/mob/PC/M in oview(8))
								if(M != src)
									M << "\white <I>[src.name] Stands there, his face twisted with Rage..."
									spawn(10) M << "\white <I>[src.name] clentchs his fists, as tears well in his eyes. Veins protrude from [src.name]'s hands and forehead as the ground rumbles"
							src << "\white <I>You feel an uncontrollable rage burning in you as you remember the people who have died in front of you"
							sleep(10)
							src << "\white <I>You clentch your fists, as tears well in your eyes. Veins protrude from your hands and forehead as the ground rumbles"
							src.icon_state = "enrage"
							sleep(10)
							view(8) << "\white [src.name]: I WILL NOT LET IT HAPPEN ANYMORE!"
							src.powerlevel = src.powerlevel_max
							src.contents += new/obj/Transform/Transform
							src.contents += new/obj/Transform/Revert
							spawn() src.SaiyanTrans()
							Explode(new /Effect/BasicBoom(src.loc,1,4))
			if(src.race == "Half Saiyan" && !src.gone_ssj2)
				if(src.powerlevel_max >= 900000)
					if(src.witness_deaths >= 5)
						if(!src.gone_ssj2)
							src.gone_ssj2 = 1
							for(var/mob/PC/M in oview(8))
								if(M != src)
									M << "\white <I>[src.name] Stands there, his face twisted with Rage..."
									spawn(10) M << "\white <I>[src.name] clentchs his fists, as tears well in his eyes. Veins protrude from [src.name]'s hands and forehead as the ground rumbles"
							src << "\white <I>You feel an uncontrollable rage burning in you as you remember the people who have died infront of you"
							sleep(10)
							src << "\white <I>You clentch your fists, as tears well in your eyes. Veins protrude from your hands and forehead as the ground rumbles"
							src.icon_state = "enrage"
							sleep(10)
							view(8) << "\white [src.name]: I must let it all go...I musn't hold back...I may not be strong enough...but..."
							sleep(10)
							view(8) << "\white [src.name]: I can't...give...UP! I WON'T GIVE UP!!"
							src.powerlevel = src.powerlevel_max
							src.form_1 = 1
							src.form_2 = 1
							src.form_3 = 0
							src.gone_ssj2 = 1
							src.HalfSaiyanTrans()
							Explode(new/Effect/BasicBoom(src.loc,1,6))


mob/proc/DeathCheck()
	if(src.powerlevel <= 0)
		..()
mob/Monster/DeathCheck(mob/PC/M)
	if(src.powerlevel <= 0)
		var/bonus_exp = round(src.exp)
		if(istype(M,/mob/PC))
			M.exp += bonus_exp
			M.zenni += src.zenni
			src.killer = M.name
			M << "\white Zenni +[src.zenni]"
			M << "\white EXP +[bonus_exp]"
			M.Level_Up()
		if(src.race == "Saibaman")
			M.green_kills+=1
		if(src.race == "Henchman")
			M.thug_kills+=1
		if(src.race == "Namekian Warrior")
			M.namek_kills+=1
		del(src)
		..()

mob/Saga/DeathCheck(mob/PC/M)
	if(src.powerlevel <= 0)
		var/bonus_exp=src.exp
		if(M.expbuff)bonus_exp*=2
		if(istype(M,/mob/PC))
			if(M.in_party)
				var/count=0
				for(var/mob/M2 in world)
					if(M2.party_name==M.party_name)
						count++
						var/exp2=src.exp/count
						M2.exp+=exp2
						M2.zenni+=src.zenni
						M2 << "\white Zenni +[src.zenni]"
						M2 << "\white EXP +[exp2]"
						M2.Level_Up()
			else
				M.exp+=bonus_exp
				M.zenni+=src.zenni
				M << "\white Zenni +[src.zenni]"
				M << "\white EXP +[bonus_exp]"
				M.PK_LVLUP(src.CPS)
				M.Level_Up()
		if(istype(src,/mob/Saga))
			saga_episode ++
		world << "<FONT color = red>Saga Information:<FONT color = White> [M] defeated [src]!"
		del(src)
		..()
mob/PC/DeathCheck(mob/M,T)
	if(src.powerlevel <= 0)
		for(var/turf/Floors/Safe_Zone/S in oview(8,src))
			if(S in oview(8,src))
				if(src.powerlevel<1)
					src.powerlevel=1
				return
		for(var/turf/Floors/BudokaiZone/S in view(1,src))
			if(S in view(1,src))
				if(src.powerlevel<1)
					src.powerlevel=1
				return
		if(!T||T=="")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
		if(T=="Infect")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been Infected by [M]!"
			src.regen_dead=1
		if(T=="Absorb")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been Absorbed by [M]!"
			src.regen_dead=1
		if(T=="Candy")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been turned to Candy by [M]!"
			src.regen_dead=1
		M.attacker=""
		src.attacker=""
		if(M.type == /mob/Monster/Simulator_NPC)
			spawn(35) del(M)
		for(var/mob/PC/M2 in oview(8))
			if(M2!=M&&M2!=src)
				if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
					M2.witness_deaths ++
					if(!src.gone_ssj)
						spawn(1)M2.Rage_Unleash()
				M2 << "\red You feel your Rage Grow..."
				M2.rage += round(rand(15,25))
				if(M2.rage >= 100)
					M2.rage = 100
		src.ResetSomeStats()
		if(M.karma == src.karma)
			M.karma_rating -= 1
		else
			M.karma_rating += 1
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M << "<I>You feel an Evil inside of you begin to awaken..."
				M.karma = "Evil"
				M.karma_rating = 0
			else
				M << "<I>You feel the Good inside of you begin to awaken..."
				M.karma = "Good"
				M.karma_rating = 0
		for(var/obj/Earth_Dragonballs/O1 in src)
			O1.loc = src.loc
		for(var/obj/Namek_Dragonballs/O2 in src)
			O2.loc = src.loc
		for(var/obj/Black_Dragonballs/O3 in src)
			O3.loc = src.loc
		src.Power_Redefine()
		if(src.race == "Android")
			src.regen_dead=0
			if(M.name!=src.name)
				var/bonus_exp = round(src.add_exp/M.level*100)
				if(M.expbuff)bonus_exp*=2
				if(istype(M,/mob/PC))
					M.exp += bonus_exp
					M << "\white EXP +[bonus_exp]"
					if(src.zenni>10)
						if(M!=src)
							var/zn=src.zenni
							M.zenni+=zn/2
							M << "\white Zenni +[round(zn/2)]"
							src.zenni-=zn/2
					var/cpnumber=(1+round(src.level/100))
					M.PK_LVLUP(cpnumber)
					M.Level_Up()
					if(Bounty.Find("Name: [src.name]([src.headvalue] Zenni)"))
						M << "\white You have killed a wanted player: Zenni +[src.headvalue]"
						Bounty.Remove("Name: [src.name]([src.headvalue] Zenni)")
						M.zenni+=src.headvalue
						src.headvalue=0
						var/savefile/B=new("World Save Files/Bounty.sav")
						B["Bounty"]<<Bounty
			src.kiabsorb=0
			src.buku = 0
			src.rest = 0
			src.frozen = 0
			src.boxing = 0
			src.focus_boxing = 0
			src.doing = 0
			src.icon_state = ""
			src.density = 1
			src.it_lock=1
			M.pvpkills+=1
			spawn(100)src.it_lock=0
			src.loc=locate(rand(208,212),rand(146,156),7)
			spawn(10)src.loc = locate(rand(208,212),rand(146,156),7)
			if(M.challenger == src && src.challenger == M)
				world << "\yellow Arena Battle: \white [M] has won the challenge against [src]!"
				M.arena_win += 1
				src.arena_lose += 1
				M.loc=locate(215,115,1)
				spawn(10)if(M)M.loc=locate(215,115,1)
				arena_on=0
				M.it_lock=0
				M.it_blocked=0
				M.challenger = ""
				src.challenger = ""
				M.challenge = 0
				src.challenge = 0
			if(src.in_tourney)
				TourneyPeople.Remove(src)
				tourney_count--
			src.attack_lock = 0
			src.ki_lock = 0
			src.buku_lock = 0
			src.it_blocked = 1
			src.dead = 0
			src.powerlevel = 50
			src.KO = 0
			src.rage = 0
			src.sight &= ~BLIND
			src.overlays -= 'Halo.dmi'
			src.deaths += 1
			M.kills+=1
			BudokaiResign(src)
			Ranking(M)
			if(src==M)
				world << "<FONT color = red>Battle Information:<FONT color = White> [src] has comitted suicide!"
			else
				world << "[T]"
			src.GWUpdate()
		if(src.race == "Majin")
			if(!src.regen_dead)
				src.icon_state = "Dead"
				src.frozen = 1
				src.boxing = 0
				src.focus_boxing = 0
				src.doing = 1
				src.density = 1
				src.attack_lock = 1
				src.ki_lock = 1
				src.it_lock = 1
				src.regen_dead = 1
				src.powerlevel = 0
				src.KO = 0
				src.rage = 0
				src.sight &= ~BLIND
				return
			else
				if(M.name!=src.name)
					var/bonus_exp = round(src.add_exp/M.level*100)
					if(istype(M,/mob/PC))
						M.exp += bonus_exp
						M << "\white EXP +[bonus_exp]"
						if(src.zenni>10)
							if(M!=src)
								var/zn=src.zenni
								M.zenni+=zn/2
								M << "\white Zenni +[round(zn/2)]"
								src.zenni-=zn/2
						var/cpnumber=(1+round(src.level/100))
						M.PK_LVLUP(cpnumber)
						M.Level_Up()
						if(Bounty.Find("Name: [src.name]([src.headvalue] Zenni)"))
							M << "\white You have killed a wanted player: Zenni +[src.headvalue]"
							Bounty.Remove("Name: [src.name]([src.headvalue] Zenni)")
							M.zenni+=src.headvalue
							src.headvalue=0
							var/savefile/B=new("World Save Files/Bounty.sav")
							B["Bounty"]<<Bounty
				src.buku = 0
				src.rest = 0
				src.frozen = 0
				src.boxing = 0
				src.focus_boxing = 0
				src.doing = 0
				src.icon_state = ""
				src.density = 1
				src.regen_dead=0
				src.regen=0
				src.powerlevel=50
				src.loc = locate(rand(27,54),rand(316,324),7)
				spawn(10)src.loc = locate(rand(27,54),rand(316,324),7)
				if(M.challenger == src && src.challenger == M)
					world << "\yellow Arena Battle: \white [M] has won the challenge against [src]!"
					M.arena_win += 1
					src.arena_lose += 1
					M.loc=locate(215,115,1)
					spawn(10)if(M)M.loc=locate(215,115,1)
					arena_on=0
					M.it_lock=0
					M.it_blocked=0
					M.challenger = ""
					src.challenger = ""
					M.challenge = 0
					src.challenge = 0
				if(src.in_tourney)
					TourneyPeople.Remove(src)
					tourney_count--
				src.attack_lock = 0
				src.ki_lock = 0
				src.dead = 1
				src.it_lock = 0
				src.it_blocked = 0
				src.regen_dead = 0
				src.powerlevel = 50
				src.KO = 0
				src.rage = 0
				src.sight &= ~BLIND
				src.overlays += 'Halo.dmi'
				src.deaths += 1
				M.kills += 1
				BudokaiResign(src)
				Ranking(M)
				src << "Your body was completely Destroyed!"
				if(src==M)
					world << "<FONT color = red>Battle Information:<FONT color = White> [src] has comitted suicide!"
				else
					world << "[T]"
				src.GWUpdate()
		else
			if(src.race != "Android")
				src.regen_dead=0
				if(M.name!=src.name)
					var/bonus_exp = round(src.add_exp/M.level*100)
					if(istype(M,/mob/PC))
						M.exp += bonus_exp
						M << "\white EXP +[bonus_exp]"
						if(src.zenni>10)
							if(M!=src)
								var/zn=src.zenni
								M.zenni+=zn/2
								M << "\white Zenni +[round(zn/2)]"
								src.zenni-=zn/2
						var/cpnumber=(1+round(src.level/100))
						M.PK_LVLUP(cpnumber)
						M.Level_Up()
						if(Bounty.Find("Name: [src.name]([src.headvalue] Zenni)"))
							M << "\white You have killed a wanted player: Zenni +[src.headvalue]"
							Bounty.Remove("Name: [src.name]([src.headvalue] Zenni)")
							M.zenni+=src.headvalue
							src.headvalue=0
							var/savefile/B=new("World Save Files/Bounty.sav")
							B["Bounty"]<<Bounty
				src.buku = 0
				src.dead = 1
				src.rest = 0
				src.frozen = 0
				src.boxing = 0
				src.focus_boxing = 0
				src.doing = 0
				src.icon_state = ""
				src.density = 1
				if(src.GoToKingCold()!=TRUE)
					src.overlays += 'Halo.dmi'
					src.dead = 1
					src.it_lock = 0
					src.it_blocked = 0
					src.loc = locate(rand(27,54),rand(316,324),7)
					spawn(10)src.loc = locate(rand(27,54),rand(316,324),7)
				if(M.challenger == src && src.challenger == M)
					world << "\yellow Arena Battle: \white [M] has won the challenge against [src]!"
					M.arena_win += 1
					src.arena_lose += 1
					M.loc=locate(215,115,1)
					spawn(10)if(M)M.loc=locate(215,115,1)
					arena_on=0
					M.it_lock=0
					M.it_blocked=0
					M.challenger = ""
					src.challenger = ""
					M.challenge = 0
					src.challenge = 0
				if(src.in_tourney)
					TourneyPeople.Remove(src)
					tourney_count--
				src.attack_lock = 0
				src.ki_lock = 0
				src.powerlevel = 50
				src.KO = 0
				src.rage = 0
				src.sight &= ~BLIND
				src.deaths += 1
				M.kills += 1
				BudokaiResign(src)
				Ranking(M)
				if(src==M)
					world << "<FONT color = red>Battle Information:<FONT color = White> [src] has comitted suicide!"
				else
					world << "[T]"
				src.GWUpdate()
				spawn(1)
					if(usr.gravityfieldon)
						usr.gravityfieldon=0
						usr.GravityFieldCooldown()
mob
	proc
		DeathSacrifice()
			src.attacker=""
			for(var/mob/PC/M2 in oview(8))
				if(M2!=src)
					if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
						M2.witness_deaths ++
						if(!src.gone_ssj)
							spawn(1)M2.Rage_Unleash()
					M2 << "\red You feel your Rage Grow..."
					M2.rage += round(rand(15,25))
					if(M2.rage >= 100)
						M2.rage = 100
			src.deflecting = 0
			src.dodging = 0
			src.blocking = 0
			src.countering = 0
			src.e_db_1 = 0
			src.e_db_2 = 0
			src.e_db_3 = 0
			src.e_db_4 = 0
			src.e_db_5 = 0
			src.e_db_6 = 0
			src.e_db_7 = 0
			src.n_db_1 = 0
			src.n_db_2 = 0
			src.n_db_3 = 0
			src.n_db_4 = 0
			src.n_db_5 = 0
			src.n_db_6 = 0
			src.n_db_7 = 0
			src.b_db_1 = 0
			src.b_db_2 = 0
			src.b_db_3 = 0
			src.b_db_4 = 0
			src.b_db_5 = 0
			src.b_db_6 = 0
			src.b_db_7 = 0
			for(var/obj/Earth_Dragonballs/O1 in src)
				O1.loc = src.loc
			for(var/obj/Namek_Dragonballs/O2 in src)
				O2.loc = src.loc
			for(var/obj/Black_Dragonballs/O3 in src)
				O3.loc = src.loc
			src.Power_Redefine()
			src.buku = 0
			src.dead = 1
			src.rest = 0
			src.frozen = 0
			src.boxing = 0
			src.focus_boxing = 0
			src.doing = 0
			src.icon_state = ""
			src.density = 1
			src.loc = locate(rand(27,54),rand(316,324),7)
			spawn(10)src.loc = locate(rand(27,54),rand(316,324),7)
			if(src.in_tourney)
				TourneyPeople.Remove(src)
				tourney_count--
			src.attack_lock = 0
			src.ki_lock = 0
			src.it_lock = 0
			src.it_blocked = 0
			src.powerlevel = 50
			src.KO = 0
			src.rage = 0
			src.sight &= ~BLIND
			src.overlays += 'Halo.dmi'
			src.deaths += 1
			src.GWUpdate()
			BudokaiResign(src)
mob
	proc
		GRAVITYDeath()
			if(src.powerlevel <= 0)
				world << "<FONT color = red>Training Information:<FONT color = White> [src] died while Training!"
				src.grav = 0
				src.deflecting = 0
				src.dodging = 0
				src.blocking = 0
				src.countering = 0
				src << "Your body was crushed by the gravity."
				spawn(1) src.Power_Redefine()
				for(var/obj/Earth_Dragonballs/O1 in src)
					O1.loc = src.loc
				for(var/obj/Namek_Dragonballs/O2 in src)
					O2.loc = src.loc
				for(var/obj/Black_Dragonballs/O3 in src)
					O3.loc = src.loc
				if(src.race == "Android")
					src.kiabsorb=0
					src.buku = 0
					src.rest = 0
					src.frozen = 0
					src.boxing = 0
					src.focus_boxing = 0
					src.doing = 0
					src.icon_state = ""
					src.density = 1
					src.loc = locate(rand(208,212),rand(146,156),7)
					spawn(10)src.loc = locate(rand(208,212),rand(146,156),7)
					src.attack_lock = 0
					src.ki_lock = 0
					src.it_lock=1
					spawn(100)src.it_lock=0
					src.buku_lock = 0
					src.it_blocked=1
					src.dead = 0
					src.powerlevel = 50
					src.KO = 0
					src.rage = 0
					src.deaths+=1
				else
					src.regen_dead=0
					src.regen=0
					src.buku = 0
					src.rest = 0
					src.frozen = 0
					src.boxing = 0
					src.focus_boxing = 0
					src.doing = 0
					src.icon_state = ""
					src.density = 1
					if(src.GoToKingCold()!=TRUE)
						src.overlays += 'Halo.dmi'
						src.dead = 1
						src.it_lock = 0
						src.it_blocked = 0
						src.loc = locate(rand(27,54),rand(316,324),7)
						spawn(10)src.loc = locate(rand(27,54),rand(316,324),7)
					src.attack_lock = 0
					src.ki_lock = 0
					src.buku_lock = 0
					src.powerlevel = 50
					src.KO = 0
					src.rage = 0
					src.sight &= ~BLIND
					src.deaths+=1
				return