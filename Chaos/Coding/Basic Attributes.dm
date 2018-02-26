mob
	var
		tmp
			finalformfuse=0
			target=0
			owner = ""
			asking_fuse=0
			waiting=0
			firing_bomb=0
			regen_dead=0
			tourny_watch=0
			blocking=0
			countering=0
			deflecting=0
			dodging=0
			regen_delay=0
			talking=0
			grav_delay=0
			candy_zapped=0
			hiting=0
			grav=0
			makingitem=0
			saving=0
			dt_delay=0
			challenge=0
			challenger=""
			kienzan_target=""
			oocmute=0
			saymute=0
			spam_delay=0
			cant_trans=0
			GMLocked=0
			tp_delay=0
			power_delay=0
			boxing_delay=0
			focus_boxing_delay=0
			rest_delay=0
			finish_delay=0
			cooldown=0
			doing=0
			safe=0
			say_delay=0
			adminsay_delay=0
			admin_muted=0
			buku=0
			boxing=0
			focus_boxing=0
			trans_delay=0
			rest=0
			ki_lock=0
			attack_lock=0
			charging=0
			galing=0
			buku_lock=0
			it_lock=0
			aura_on=0
			speeding=0
			frozen=0
			splits=0
			e_db_1=0
			e_db_2=0
			e_db_3=0
			e_db_4=0
			e_db_5=0
			e_db_6=0
			e_db_7=0
			n_db_1=0
			n_db_2=0
			n_db_3=0
			n_db_4=0
			n_db_5=0
			n_db_6=0
			n_db_7=0
			b_db_1=0
			b_db_2=0
			b_db_3=0
			b_db_4=0
			b_db_5=0
			b_db_6=0
			b_db_7=0
		weightgi = 0
		weightcape = 0
		weightarmor = 0
		weightarm = 0
		weightleg = 0
		weightankle = 0
		weightwrist = 0
		weighthead = 0
		splits_max=0
		title="Player"
		race=""
		karma="Good"
		karma_rating=0
		skin=""
		level=1
		exp=0
		tnl=100
		staminaleft_exp=0
		staminaleft_tnl=100
		tp=0
		usedtp=0
		custom_points=0
		powerlevel=500
		powerlevel_max=5000
		ki=250
		ki_max=2500
		strength=50
		strength_max=500
		defence=50
		defence_max=500
		speed=5000
		speed_max=5000
		staminaleft=0
		staminaleft_max=500
		rage=0
		rage_max=100
		zenni=5000
		eats=0
		kills=0
		deaths=0
		dead=0
		inven_min=0
		inven_max=25
		energy_code=0
		random=0
		rage_chromosome=0
		train_chromosome=0
		legendary_chromosome=0
		pk=0
		chips=0
		chips_max=0
		in_arena=0
		kidefense=100
		kidefense_max=1000
		weight=0
		add_exp=0
		wishes=0
		nwishes=0
		bwishes=0
		in_war = 0
		fused = 0
		follow = ""
		FuseFollower = 0
		followmob = 0
		it_taken = 0
		challenge_on = 1
		trans_aura_on = 1
		crater_on = 1
		inverted=0
		dodge=1
		block=1
		reflect=1
		critical=1
		counter=1
		dodge_max=1
		block_max=1
		reflect_max=1
		critical_max=1
		counter_max=1
		ki_skill=1
		unarmed_skill=1

		head			= "EMPTY"
		back			= "EMPTY"
		chest			= "EMPTY"
		legs			= "EMPTY"
		feet			= "EMPTY"
		arms 			= "EMPTY"
		hands			= "EMPTY"
		waist 			= "EMPTY"
		underclothes 	= "EMPTY"
		clothes			= "EMPTY"
		clothes_eq		= 0
		GItem_eq		= 0
		scouter 		= 0
		scouter_eq 		= 0
		scouter_channel = 1
		armor 			= 0
		armor_eq 		= 0
		under 			= 0
		under_eq 		= 0
		helmet 			= 0
		helmet_eq 		= 0

		gloves 			= 0
		gloves_eq 		= 0
		z_sword 		= 0
		radar 			= 0
		hench_equiped 	= 0
		saiyan_equiped 	= 0
		sellable_items	= 0

	PC
		verb
			View_Map()
				set category="Channels"
				if(src.spam_delay)
					return
				src.spam_delay=1
				switch(input("What do you want to do?")in list("View Location","View Earth's Map","View Namek's Map","View Planet Vegeta's Map","View Planet Yardrat's Map","Cancel"))
					if("Cancel")
						src.spam_delay=0
						return
					if("View Location")
						src<<browse(null)
						if(src.z==1)
							var/tmp/icon/M = icon('Map Earth.png')
							var/xx=src.x
							var/yy=src.y
							M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
							M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
							src<<browse(M)
							spawn(25)src.spam_delay=0
						else
							if(src.z==2)
								var/tmp/icon/M = icon('Map Namek.png')
								var/xx=src.x
								var/yy=src.y
								M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
								M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
								src<<browse(M)
								spawn(25)src.spam_delay=0
							else
								if(src.z==3)
									var/tmp/icon/M = icon('Map Vegeta.png')
									var/xx=src.x
									var/yy=src.y
									M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
									M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
									src<<browse(M)
									spawn(25)src.spam_delay=0
								else
									if(src.z==4)
										var/tmp/icon/M = icon('Map Yardrat.png')
										var/xx=src.x
										var/yy=src.y
										M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
										M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
										src<<browse(M)
										spawn(25)src.spam_delay=0
									else
										src<<"You cannot check your location here."
										spawn(25)src.spam_delay=0
					if("View Earth's Map")
						src<<browse(null)
						var/tmp/icon/M = icon('Map Earth.png')
						src<<browse(M)
						spawn(25)src.spam_delay=0
					if("View Namek's Map")
						src<<browse(null)
						var/tmp/icon/M = icon('Map Namek.png')
						src<<browse(M)
						spawn(25)src.spam_delay=0
					if("View Planet Vegeta's Map")
						src<<browse(null)
						var/tmp/icon/M = icon('Map Vegeta.png')
						src<<browse(M)
						spawn(25)src.spam_delay=0
					if("View Planet Yardrat's Map")
						src<<browse(null)
						var/tmp/icon/M = icon('Map Yardrat.png')
						src<<browse(M)
						spawn(25)src.spam_delay=0
obj
	var
		guild=""
		weight=0
		dball=0
		equiped
		value=0
		condition
		condition_max
		armour_protection
		hench_armour
		saiyan_armour
		item_owner
		lastx
		lasty
		lastz
		cooldown
		owner
		power = 0
		target = ""
		owners = ""
		range=20
client
	North()
		for(var/obj/Spaceship/S in world)
			if(S.owner==usr)
				S.dir=NORTH
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=NORTH
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=NORTH
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==NORTH)
						usr.clasharrow=SOUTH
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()
	South()
		for(var/obj/Spaceship/S in world)
			if(S.owner==usr)
				S.dir=SOUTH
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=SOUTH
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=SOUTH
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==SOUTH)
						usr.clasharrow=NORTH
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()
	East()
		for(var/obj/Spaceship/S in world)
			if(S.owner==usr)
				S.dir=EAST
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=EAST
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=EAST
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==EAST)
						usr.clasharrow=WEST
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()
	West()
		for(var/obj/Spaceship/S in world)
			if(S.owner==usr)
				S.dir=WEST
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=WEST
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=WEST
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==usr.dir)
						usr.clasharrow=EAST
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()
mob/Move()
	if(src.frozen)
		return 0
	if(src.regen_dead)
		return
	if(src.gravityfieldon)
		return 0
	if(src.binded)
		return 0
	if(src.GMLocked)
		return 0
	var/walkdelay=src.speed/1000
	if(src.buku)
		walkdelay-=1
	if(walkdelay<1)
		walkdelay=1
	if(src.speeding<=0)
		.=..()
		if(.)
			src.speeding = 1
			if(src.thrown)
				src.speeding=0
			if(usr.weight>0&&!src.buku)
				var/xp=usr.weight
				if(xp>16)
					xp=16
				usr.exp+=xp
				if(src.expbuff)usr.exp+=xp
				if(!usr.staminabuff)usr.staminaleft+=xp*0.4
				usr.staminaleft_exp+=xp*0.07
				spawn(1)
					usr.Fatigue_Level_Up()
					usr.Level_Up()
					usr.Tired_KO()
			sleep(walkdelay)
			src.speeding = 0
mob/PC/Stat()
	if(src.tab_vitals&&statpanel("Vitals"))
		stat("Karma:","[src.karma]: [src.karma_rating]%")
		if(src.race == "Saiyan")
			if(src.rage_chromosome)
				stat("Gene :","Honour")
			if(src.train_chromosome)
				stat("Gene :","Pride")
			if(src.legendary_chromosome)
				stat("Gene :","Legendary")
		stat("--------","")
		stat("Level:",level)
		stat("EXP:","[round((src.exp / src.tnl) * 100)]%")
		if(src.tp > 0)
			stat("Training Points:",src.tp)
			if(src.usedtp > 0)
				stat("Used Training Points:",src.usedtp)
		if(src.custom_points > 0)
			stat("Custom Points:",src.custom_points)
		if(src.skill_points > 0)
			stat("Skill Points:",src.skill_points)
		stat("--------","")
		stat("Powerlevel:","[num2text(round(src.powerlevel),10)] / [num2text(round(src.powerlevel_max),10)]")
		stat("Ki:","[num2text(round(src.ki),10)] / [num2text(round(src.ki_max),10)]")
		stat("Strength:","[num2text(round(src.strength),10)]")
		stat("Defense:","[num2text(round(src.defence),10)]")
		stat("Ki Defense:","[num2text(round(src.kidefense),10)]")
		stat("Speed:","[2+round(((5002-src.speed)/500),0.5)] Steps per second")
		stat("--------","")
		stat("Fatigue:","[round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%")
		stat("Rage:","[src.rage] %")
		stat("Energy Code:","[num2text(src.energy_code,10)]")//i
		//pvpkills
		//
		if(src.race == "Android")
			stat("Chips:","[src.chips]/10")
		sleep(5)
	if(src.tab_skills&&statpanel("Overall"))
		stat("Unarmed Skill:","[src.unarmed_skill]")
		stat("Ki Skill:","[src.ki_skill]")
		stat("----PVP----","")
		stat("Kills:","[src.kills]")
		stat("Deaths:","[src.deaths]")
		stat                          ("----Transformations----","")
		if(src.race == "Bio-Android")
			stat("Absorbs:","[src.absorb_kill]")
		if(src.race == "Tuffle")
			stat("Infections:","[src.absorb_kill]")
		if(src.race == "Majin" || src.race == "Half Majin")
			stat("Candy Eats:","[src.eats]")
		if(src.race == "Saiyan" || src.race == "Half Saiyan")
			stat("Transformation Skill:","[round(src.ssj_level)]")
			stat("Transformation Speed:","[round(src.upkeep / 1.5)/10] sec")
			stat("--------","")
		if(src.race == "Human" || src.race == "Changeling" || src.race == "Demon" || src.race == "Saibaman" || src.race == "Devil"|| src.race == "Kai")
			stat                          ("----Transformations----","")
			stat("Transformation Skill:","[round(src.form_1_level)]")
			stat("Transformation Speed:","[round(src.upkeep / 1.5)/10] sec")
			stat("----Physical Skills----","")
		stat("Block:","[src.block] %")
		stat("Counter:","[src.counter] %")
		stat("Dodge:","[src.dodge] %")
		stat("Deflect:","[src.reflect] %")
		stat("Critical:","[src.critical] %")
		stat("--------","")
		stat("Arena Win/Loss:","[src.arena_win]/[src.arena_lose]")
		stat("----Wishes----","")
		stat("Earth Wishes:","[src.wishes]/7")
		stat("Namek Wishes:","[src.nwishes]/3")
		stat("Black Wishes:","[src.bwishes]/1")
		if(scouter_eq)
			stat("--------","")
			stat("Location:","[x], [y], [z]")
		sleep(25)
	if(src.tab_quests)
		for(var/obj/Quests/O in contents)
			if(statpanel("Quests"))
				stat(O)
				sleep(40)
	if(src.tab_inventory&&statpanel("Inventory"))
		stat("Head:",src.head)
		stat("Back:",src.back)
		stat("Chest:",src.chest)
		stat("Clothes:",src.clothes)
		stat("Underclothing:",src.underclothes)
		stat("Arms:",src.arms)
		stat("Hands:",src.hands)
		stat("Legs:",src.legs)
		stat("Feet:",src.feet)
		if(src.inven_min > 0)
			stat("--------","")
			for(var/obj/Equipment/O1 in src)
				stat(O1)
			for(var/obj/Gym/GI in src)
				stat(GI)
			for(var/obj/Props/Furnature/GF in src)
				stat(GF)
			for(var/obj/Earth_Dragonballs/O2 in src)
				stat(O2)
			for(var/obj/Namek_Dragonballs/O3 in src)
				stat(O3)
			for(var/obj/Black_Dragonballs/O4 in src)
				stat(O4)
		stat("--------","")
		stat("Zenni:","[src.zenni]")
		stat("Banked Zenni:","[src.banked_zenni]")
		stat("Space:","[src.inven_min] / [src.inven_max]")
		sleep(10)
	if(src.in_guild&&src.tab_guild&&statpanel("Guild Members"))
		for(var/mob/PC/M in world)
			if(M.guild_name == src.guild_name)
				stat(M.name)
				stat("Energy Code:","[num2text(M.energy_code,10)]")
				stat("","")
				sleep(30)
	if(src.tab_saga&&statpanel("Saga"))
		stat("Current Saga:","[saga]")
		stat("Saga Part:","[part]")
		stat("Saga Difficulty:","[saga_difficulty]")
		for(var/mob/Saga/M in world)
			stat(M)
			var/planet
			if(M.z == 1)planet = "Earth"
			if(M.z == 2)planet = "Namek"
			if(M.z == 3)planet = "Planet Vegeta"
			if(M.z == 7)planet = "Other World"
			stat("Location:","[planet]")
			stat("","")
			sleep(35)
	for(var/obj/Vote/V in world)
		if(statpanel("Vote"))
			stat(V)
			stat("Vote starter:","[V.VoterN]{[V.Voter]}")
			stat("Vote target:","[V.VotedN]{[V.Voted]}")
			stat("Vote reason:","[V.reason]")
			stat("Votes (Y/N):","[V.yes]/[V.no]")
			stat("Time left:","[V.time] seconds")
			stat("----------")
			sleep(1)