mob
	Monster
		Simulator_NPC

			name = "{NPC}Simulation Fighter"
			density = 1
			dead = 0
			safe = 0

			powerlevel = 750
			powerlevel_max = 750

			ki = 0
			ki_max = 0

			speed = 5000

			strength = 50
			defence = 15

			critical = 2

			race = "AI"

			level = 15

			KO = 0

			zenni = 20

			frozen = 0

			cooldown = 0

			pk = 1

			exp = 1
			tnl = 1
			New()
				..()
				spawn(10)
					Wander()
			Bump(mob/M)
				if(istype(M,/mob/PC))
					src.Attack2(M)

		Clone_Simulator_NPC
			name = "{NPC}Clone Simulation Fighter"
			powerlevel = 1250
			powerlevel_max = 1250
			speed = 5000
			strength = 100
			defence = 75
			critical = 22
			race = "AI"
			level = 15
			zenni = 1
			pk = 1
			exp = 0
			tnl = 0
			New()
				..()
				spawn(10)
					Wander()
			Bump(mob/M)
				if(istype(M,/mob/PC))
					src.Attack3(M)
			proc/Attack3(mob/M)
				var/attack_text = rand(1,3)
				var/text = ""
				if(attack_text)
					text = "\red [usr] Punches you in the Face!"
				if(attack_text == 2)
					text = "\red [usr] Kicks you in the Chest!"
				if(attack_text == 3)
					text = "\red [usr] Punches you in the Stomach!"
				if(!M)
					return
				if(M == src)
					src << "You cannot attack yourself!"
					return
				if(M.safe)
					src << "A force stops you from attacking [M]!"
					return
				if(M.dead && M.race != "Majin")
					src << "They are dead, you cannot attack them!"
					return
				var/attack_power = round(src.strength + (src.powerlevel / 100))
				var/defence_power = M.defence
				var/damage = attack_power - defence_power
				if(damage < 1)
					damage = 1
				if(M.type == /mob/PC)
					if(M.form_1 || M.form_2 || M.form_3 || M.form_4 || M.form_5)
						if(src.race == "Saiyan" && M.form_1)
							src.SaiyanTrans()
						if(src.race == "Half Saiyan" && M.form_1)
							src.HalfSaiyanTrans()
						if(src.race == "Changeling" && M.form_1)
							src.ChanglingTrans()
						if(src.race == "Human" && M.form_1)
							src.HumanTrans()
						if(src.race == "Tuffle" && M.form_2)
							src.TuffleTrans()
						if(src.race == "Bio-Android" && M.form_3)
							src.BioTrans()
					if(src.cooldown)
						return
					else
						if(prob(M.dodge))
							flick("IT",M)
							M.attacker = src.name
							usr << "\green [M] manages to Dodge your attack"
							usr.cooldown = 1
							spawn((usr.speed/1000) * 2) usr.cooldown = 0
							return
						else
							if(prob(M.block))
								usr << "\green [M] manage to Block some of your attack"
								M.attacker = src.name
								M.powerlevel -= damage / 4
								M.DeathCheck(src)
								usr.cooldown = 1
								spawn((usr.speed/1000) * 2) usr.cooldown = 0
								return
							else
								if(prob(M.counter))
									usr << "\green [M] manages to Counter your attack and attacks back"
									usr.powerlevel -= ((damage) + (damage *0.30))
									usr.DeathCheck(M)
									usr.cooldown = 1
									spawn((usr.speed/1000) * 2) usr.cooldown = 0
									return
								else
									if(prob(usr.critical))
										M << "[text]"
										usr << "\red You hit [M] with a Critical Hit"
										M.attacker = src.name
										M.powerlevel -= (damage * 2)
										M.DeathCheck(src)
										usr.cooldown = 1
										spawn((usr.speed/1000) * 2) usr.cooldown = 0
										return
									else
										M << "[text]"
										usr << "\red You hit [M]"
										M.attacker = src.name
										M.powerlevel -= damage
										M.DeathCheck(src)
										usr.cooldown = 1
										spawn((usr.speed/1000) * 2) usr.cooldown = 0
										return
