mob
	proc
		Wander()
			while(src)
				var/Found = FALSE
				for(var/mob/PC/P in oview(8))
					if(get_dist(src,P)>1)
						if(!src.thrown)
							step_towards(src,P)
					else
						if(get_dist(src,P)<=1)
							if(!src.thrown)
								src.Attack2(P)
					Found = TRUE
					break
				if(Found != TRUE)
					sleep(10)
				sleep(2)
		Attack2(mob/M)
			var/attack_text = rand(1,2)
			var/text
			if(attack_text == 1)
				text = "\red [usr] Punches you!"
			if(attack_text == 2)
				text = "\red [usr] Kicks you!"
			if(!M)
				return
			if(src.attack_lock)
				return
			if(src.buku)
				return
			if(src.cooldown)
				return
			if(M.buku)
				return
			if(M == src)
				return
			if(M.safe)
				return
			if(M.dead)
				return
			var/attackpower = src.strength+src.powerlevel*0.1
			var/defensepower=(M.defence+(M.powerlevel*0.1)+(1+M.unarmed_skill/1.5))
			var/damage = attackpower-defensepower
			var/cdamage = ((src.strength+src.powerlevel*0.1)*2)-defensepower
			if(damage < 1)
				damage = 1
			if(cdamage < 1)
				cdamage = 1
			if(istype(M,/mob/PC))
				if(src.cooldown)
					return
				else
					if(prob(M.dodge/5))
						flick("IT",M)
						M.attacker = src.name
						usr.cooldown = 1
						spawn((usr.speed/1000) * 2) usr.cooldown = 0
						return
					else
						if(prob(M.block/5))
							M.attacker = src.name
							M.powerlevel -= damage/4
							M.DeathCheck(src)
							usr.cooldown = 1
							spawn((usr.speed/1000) * 2) usr.cooldown = 0
							return
						else
							if(prob(M.counter/5))
								usr.powerlevel -= ((damage) + (damage *0.30))
								usr.DeathCheck(M)
								usr.cooldown = 1
								spawn((usr.speed/1000) * 2) usr.cooldown = 0
								return
							else
								if(prob(usr.critical))
									M << "[text]"
									M.attacker = src.name
									M.powerlevel-=cdamage
									M.DeathCheck(src)
									usr.cooldown = 1
									spawn((usr.speed/1000) * 2) usr.cooldown = 0
									return
								else
									M << "[text]"
									M.attacker = src.name
									M.powerlevel -= damage
									M.DeathCheck(src)
									usr.cooldown = 1
									spawn((usr.speed/1000) * 2) usr.cooldown = 0
									return

mob
	NPC
		New()
			density=1
			pk=0
			safe=1
			..()
	Monster
		New()
			..()
			density=1
			pk=1
			safe=0
			src.CreateName()
			if(istype(src,/mob/Monster/Split_Form)==FALSE)
				spawn(10)
					Wander()
		Green_Saiba_Man
			name = "{NPC}Green Saibaman"
			icon = 'Green Saibaman.dmi'
			powerlevel = 500000
			powerlevel_max = 500000
			ki = 600000
			ki_max = 600000
			speed = 5000
			strength = 45000
			defence = 45000
			karma = "Evil"
			race = "Saibaman"
			level = 1500
			zenni = 7500
			exp = 3000
			critical=1
		Black_Saiba_Man
			name = "{NPC}Black Saibaman"
			icon = 'Black Saibaman.dmi'
			powerlevel = 75000000000
			powerlevel_max = 75000000000
			ki = 6000000000
			ki_max = 6000000000
			speed = 10000
			strength = 1500000000
			defence = 1000000000
			karma = "Evil"
			race = "Saibaman"
			level = 17500
			zenni = 85000
			exp = 2500000
			critical=1
		White_Saiba_Man
			name = "{NPC}White Saibaman"
			icon = 'White Saibaman.dmi'
			icon_state = "White"
			powerlevel = 250000000
			powerlevel_max = 250000000
			ki = 65000000
			ki_max = 65000000
			speed = 6500
			strength = 12500000
			defence = 12500000
			karma = "Evil"
			race = "Saibaman"
			level = 5000
			zenni = 75000
			exp = 30000
			critical=1

		Bio_Android

			name = "{NPC} Bio Android"
			icon = 'Bio Android - Form 1.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 150000000
			powerlevel_max = 150000000
			ki = 0
			ki_max = 0
			speed = 40000
			strength = 15000000
			defence = 15000000
			critical = 5
			karma = "Evil"
			race = "Bio Android"
			level = 15000
			KO = 0
			zenni = 225000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 120000
			tnl = 2000
		Kai
			name = "{NPC}Kai"
			icon = 'Kai.dmi'
			powerlevel = 219995558976
			powerlevel_max = 219995558976
			ki = 3500000000
			ki_max = 3500000000
			speed = 10000
			strength = 650000000
			defence = 450000000
			karma = "Good"
			race = "Kai"
			level = 6000
			zenni = 225000
			exp = 120000
			critical=1
		Demon
			name = "{NPC}Demon"
			icon = 'Demon.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 17500000000
			powerlevel_max = 17500000000
			ki = 19000000000
			ki_max = 19000000000
			speed = 20000
			strength = 1850000000
			defence = 1750000000
			critical = 6
			karma = "Evil"
			race = "Demon"
			level = 18000
			KO = 0
			zenni = 155000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 15000
			tnl = 100
		Goon_1
			name = "{NPC}Frieza's Henchman"
			icon = 'Henchman 1.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 45000
			powerlevel_max = 45000
			ki = 0
			ki_max = 0
			speed = 5000
			strength = 14500
			defence = 14500
			critical = 8
			karma = "Evil"
			race = "Henchman"
			level = 35
			KO = 0
			zenni = 150
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 30
			critical=3
		Goon_2
			name = "{NPC}Frieza's Henchman"
			icon = 'Henchman 2.dmi'
			density = 1
			powerlevel = 55000
			powerlevel_max = 55000
			speed = 5000
			strength = 18500
			defence = 18500
			critical = 12
			karma = "Evil"
			race = "Henchman"
			level = 50
			zenni = 5000
			pk = 1
			exp = 35
			critical=3
		Goon_3
			name = "{NPC}Frieza's Henchman"
			icon = 'Henchman 3.dmi'
			density = 1
			powerlevel = 47000
			powerlevel_max = 47000
			speed = 5000
			strength = 12500
			defence = 12500
			critical = 3
			karma = "Evil"
			race = "Henchman"
			level = 25
			zenni = 5000
			pk = 1
			exp = 30
			critical=3
		TuffleVillager
			name = "{NPC}Tuffle"
			icon = 'Bebi - Form 1.dmi'
			density = 1
			powerlevel = 450000
			powerlevel_max = 450000
			speed = 4500
			strength = 270000
			defence = 265000
			critical = 6
			karma = "Evil"
			race = "Tuffle"
			level = 150
			zenni = 10000
			pk = 1
			exp = 75
			critical=4
		Ozzaru
			name = "{NPC}Oozaru"
			icon = 'Oozaru.dmi'
			density = 1
			powerlevel = 4000000000
			powerlevel_max = 4000000000
			ki = 18000000
			ki_max = 18000000
			speed = 3500
			strength = 450000000
			defence = 400000000
			critical = 80
			karma = "Evil"
			race = "Saiyan"
			level = 10000
			zenni = 3000
			pk = 1
			exp = 200
			critical=7
			New()
				..()
				src.overlays+=new/obj/techs/Overlays/Oozaru_top
				spawn(10)
					Wander()
	NPC
		Dead_Namek
			name = "{NPC}Dead Namek"
			icon = 'NPCs2.dmi'
			icon_state = "Dying Namek"
			density = 0
			dead = 1
			safe = 1
	NPC
		Dead_Henchman
			name = "{NPC}Dead Henchman"
			icon = 'NPCs2.dmi'
			icon_state = "Dying Hench"
			density = 0
			dead = 1
			safe = 1
	NPC
		Bodyguard
			name = "{NPC}Frieza's Bodyguard"
			icon = 'NPCs2.dmi'
			icon_state = "Henchman"
			density = 1
			dead = 1
			safe = 1