mob
	var
		combolimit=2
		combospeed=20000
		tmp
			combocount=0
			lastkick="1"
			lastpunch="1"
			lastpk=""
			incombo=0
			thrown=0
			throwing=0
			attacking=0
			attacker=""
			spar=0
	proc
		RemoveArmor(var/mob/M,var/D)
			if(prob(src.armorblock))
				src << "\blue Your armor absorbs some of [M]'s attack!"
				M << "\blue [src]'s armor absorbs some of your attack!"
				src.powerlevel -= D
				for(var/obj/Equipment/Armor/A in src)
					A.condition -= D
					if(A.condition <= 0)
						src << "\blue Your armor has been destroyed!"
						src.overlays -= A
						src.armor_eq = 0
						src.armor = 0
						src.armorblock=0
						del(A)
		Thrown(var/mob/T)
			if(!src)return
			if(!T)return
			var/fail=70
			if(usr.unarmed_skill>3000)
				fail=60
			if(usr.unarmed_skill>5000)
				fail=50
			if(usr.unarmed_skill>7000)
				fail=40
			if(usr.unarmed_skill>9000)
				fail=30
			if(usr.unarmed_skill>10000)
				fail=20
			if(usr.unarmed_skill>12000)
				fail=10
			if(usr.unarmed_skill>14000)
				fail=5
			if(prob(fail))
				T<<"\blue You failed to throw [src]!"
				return
			var/atk=T.strength+T.powerlevel*0.05+src.unarmed_skill
			var/def=src.defence+src.powerlevel*0.05+src.ki*0.05+src.unarmed_skill*0.8
			if(atk<def)
				T<<"\blue [src] overpowers your throw!"
				return
			T<<"\blue You Threw [src]!"
			src<<"\blue [T] Threw you!"
			var/D=1
			if(atk>def*2)
				D=2
			if(atk>def*3)
				D=3
			if(atk>def*4)
				D=4
			if(atk>def*5)
				D=5
			if(atk>def*6)
				D=6
			if(atk>def*7)
				D=7
			if(atk>def*8)
				D=8
			if(atk>def*9)
				D=9
			if(atk>def*10)
				D=10
			src.icon_state="thrown"
			src.thrown=1
			src.density=0
			src.boxing=0
			src.dualtrain=0
			src.rest=0
			var/DT=T.dir
			var/PT=atk-def
			while(D)
				D-=1
				for(var/atom/A in get_step(src,DT))
					if(istype(A,/obj/Buildings/Door1))
						var/obj/Buildings/Door1/DO=A
						DO.OpenDoor()
					if(istype(A,/obj/Buildings/Door2))
						var/obj/Buildings/Door2/DO=A
						DO.OpenDoor()
					if(A.density)
						src.powerlevel-=PT*(D/10)
						spawn(0)src.KO()
						if(istype(A,/mob))
							var/mob/M=A
							if(M.pk&&!M.safe)
								M.powerlevel-=PT*(D/10)
								spawn(0)M.KO()
						if(istype(A,/obj/Buildings))
							var/obj/O=A
							O.hp-=PT*(D/10)
							spawn(0)O.DestroyIt()
					sleep(0)
					if(A.density)
						src.thrown=0
						src.density=1
						src.icon_state=""
						src.boxing=0
						src.dualtrain=0
						D=0
						break
				step(src,DT)
				if(D<=0)
					switch(DT)
						if(NORTH)
							src.dir=SOUTH
						if(SOUTH)
							src.dir=NORTH
						if(EAST)
							src.dir=WEST
						if(WEST)
							src.dir=EAST
						if(NORTHEAST)
							src.dir=SOUTHWEST
						if(NORTHWEST)
							src.dir=SOUTHEAST
						if(SOUTHEAST)
							src.dir=NORTHWEST
						if(SOUTHWEST)
							src.dir=NORTHEAST
					src.thrown=0
					src.density=1
					src.icon_state=""
					src.boxing=0
					src.dualtrain=0
					break
				sleep(1)
	PC
		verb
			Throw()
				set category = "Combat"
				if(!src.pk)
					src << "You are not a Combatant!"
					return
				if(src.doing)
					return
				if(src.throwing)
					return
				if(src.dead)
					src << "You are dead."
					return
				if(src.FuseFollower)
					return
				if(src.cooldown)
					return
				if(src.KO)
					return
				if(src.attack_lock)
					return
				spawn(5+(src.speed/1000))
					src.throwing=0
				for(var/mob/M in get_step(src,src.dir))
					if(istype(M,/mob/PC))
						for(var/turf/Floors/Safe_Zone/S in view(8))
							if(S in view(8))
								src << "[M] is in a Safe Zone!"
								return
					if(!M)
						return
					if(!M in get_step(src,src.dir))
						return
					if(M.FuseFollower)
						continue
					if(M.safe)
						src << "[M] is safe and cannot be attacked."
						continue
					if(M.dead)
						src << "[M] is dead."
						continue
					if(!M.pk)
						src << "[M] is not a Combatant!"
						continue
					return M.Thrown(src)
			Punch()
				set category = "Combat"
				if(!src.pk)
					src << "You are not a Combatant!"
					return
				if(src.KO)
					return
				if(src.doing)
					return
				if(src.dead)
					src << "You are dead."
					return
				if(src.FuseFollower)
					return
				if(src.cooldown)
					return
				if(src.attack_lock)
					return
				src.cooldown=1
				spawn((src.speed/1000)+2)
					src.cooldown=0
				flick("attack",src)
				for(var/mob/M in get_step(src,src.dir))
					if(istype(M,/mob/PC))
						for(var/turf/Floors/Safe_Zone/S in view(8))
							if(S in view(8))
								src << "[M] is in a Safe Zone!"
								return
					if(!M)
						return
					if(!M in get_step(src,src.dir))
						return
					if(M.FuseFollower)
						continue
					if(M.safe)
						src << "[M] is safe and cannot be attacked."
						continue
					if(M.dead)
						src << "[M] is dead."
						continue
					if(M.KO)
						src << "[M] is already K.O!"
						continue
					if(!M.pk)
						src << "[M] is not a Combatant!"
						continue
					var/attackpower=(src.strength+((src.powerlevel+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
					var/defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
					var/damage=attackpower-defensepower
					if(src.spar)
						attackpower=(src.strength/500+((src.powerlevel/500+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
						defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
						damage=attackpower-defensepower
					if(damage<=0)
						damage=1
					src.attacking=1
					spawn(4)src.attacking=0
					if(src.attacker==M&&M.spar)
						src.exp+=7
					M.attacker=src
					spawn(20)
						if(M)
							M.attacker=""
					if(M.armorblock)
						if(prob(M.armorblock))
							if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
								return
							else
								if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
									return
							M.RemoveArmor(src,damage/5)
							M.KO()
					if(prob(1+(src.critical/5)))
						M << "\red [src] Punches you!"
						src << "\red You Punch [M]!"
						M.powerlevel -= round(damage * 2)
						M.KO()
						spawn(0)M.Thrown(src)
					else
						if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
							return
						else
							if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
								return
						M << "\red [src] Punches you!"
						src << "\red You Punch [M]!"
						M.powerlevel -= round(damage)
						M.KO()
	/*		Kick()
				set category = "Combat"
				if(!src.pk)
					src << "You are not a Combatant!"
					return
				if(src.doing)
					return
				if(src.dead)
					src << "You are dead."
					return
				if(src.FuseFollower)
					return
				if(src.cooldown)
					return
				if(src.attack_lock)
					return
				src.cooldown=1
				spawn(3)
					src.incombo-=1
					if(src.incombo<0)
						src.incombo=0
						src.combocount=0
				if(src.lastpunch=="2")
					flick("kick1",src)
					src.lastpunch="1"
				else
					flick("kick2",src)
					src.lastpunch="2"
				src.incombo+=1
				if(src.incombo>src.combolimit)
					src.incombo=src.combolimit
				if(!src.lastpk)
					src.lastpk="p"
				if(src.lastpk=="p")
					if(src.combocount<src.combolimit)
						src.combocount+=1
						spawn(src.combospeed/10000)
							src.cooldown=0
					else
						spawn(10+(src.speed/1000))
							src.cooldown=0
				else
					spawn(10+(src.speed/1000))
						src.cooldown=0
				src.lastpk="k"
				for(var/mob/M in get_step(src,src.dir))
					if(M.type == /mob/PC)
						var/turf/T=M.loc
						for(var/turf/Floors/Safe_Zone/S in T)
							src << "Safe Zone!"
							return
					if(!M)
						continue
					if(M.FuseFollower)
						continue
					if(M.safe)
						src << "[M] is safe and cannot be attacked."
						continue
					if(M.dead)
						src << "[M] is dead."
						continue
					if(M.KO)
						src << "[M] is already K.O!"
						continue
					if(!M.pk)
						src << "[M] is not a Combatant!"
						continue
					var/attackpower=(src.strength+((src.powerlevel+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
					var/defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
					var/damage=attackpower-defensepower
					if(src.spar)
						attackpower=(src.strength/500+((src.powerlevel/500+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
						defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
						damage=attackpower-defensepower
					if(damage<=0)
						damage=1
					if(damage>M.powerlevel_max*5)
						damage=M.powerlevel_max*5
					src.attacking=1
					spawn(4)src.attacking=0
					if(src.attacker==M&&M.spar)
						src.exp+=7
					M.attacker=src
					spawn(20)
						if(M)
							M.attacker=""
					if(M.armorblock)
						if(prob(M.armorblock))
							if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
								return
							else
								if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
									return
							M.RemoveArmor(src,damage/5)
							M.KO()
					if(prob(1+(src.critical/5)))
						M << "\red [src] Kicks you!"
						src << "\red You Kick [M]!"
						M.powerlevel -= round(damage * 2)
						M.KO()
						spawn(0)M.Thrown(src)
					else
						if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
							return
						else
							if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
								return
						M << "\red [src] Kicks you!"
						src << "\red You Kick [M]!"
						M.powerlevel -= round(damage)
						M.KO()*/



























	/*



			PunchLOL()
				set category = "Combat"
				if(!src.pk)
					src << "You are not a Combatant!"
					return
				if(src.doing)
					return
				if(src.dead)
					src << "You are dead."
					return
				if(src.FuseFollower)
					return
				if(src.cooldown)
					return
				if(src.attack_lock)
					return
				src.cooldown=1
				spawn(4)
					src.incombo-=1
					if(src.incombo<0)
						src.incombo=0
				if(src.lastpunch=="2")
					flick("punch1",src)
					src.lastpunch="1"
				else
					flick("punch2",src)
					src.lastpunch="2"
				src.punchcount+=1
				src.incombo+=1
				if(src.incombo>3)
					src.incombo=3
				if(src.punchcount<3)
					if(src.incombo)
						if(src.kickcount+src.punchcount<src.combolimit)
							spawn(src.combospeed/10000)
								src.punchcount-=1
								if(src.punchcount<1)
									src.punchcount=1
								src.cooldown=0
								src.icon_state=""
						else
							src.cooldown=1
							spawn(15)
								src.punchcount-=1
								if(src.punchcount<1)
									src.punchcount=1
								src.cooldown=0
								src.icon_state=""
					else
						src.cooldown=1
						spawn(15)
							src.punchcount-=1
							if(src.punchcount<1)
								src.punchcount=1
							src.cooldown=0
							src.icon_state=""
				else
					src.cooldown=1
					spawn(15)
						src.punchcount-=1
						if(src.punchcount<1)
							src.punchcount=1
						src.icon_state=""
						src.cooldown=0
				for(var/mob/M in get_step(src,src.dir))
					if(M.type == /mob/PC)
						var/turf/T=M.loc
						for(var/turf/Floors/Safe_Zone/S in T)
							src << "Safe Zone!"
							return
					if(!M)
						continue
					if(M.FuseFollower)
						continue
					if(M.safe)
						src << "[M] is safe and cannot be attacked."
						continue
					if(M.dead)
						src << "[M] is dead."
						continue
					if(M.KO)
						src << "[M] is already K.O!"
						continue
					if(!M.pk)
						src << "[M] is not a Combatant!"
						continue
					var/attackpower=(src.strength+((src.powerlevel+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
					var/defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
					var/damage=attackpower-defensepower
					if(src.spar)
						attackpower=(src.strength/500+((src.powerlevel/500+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
						defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
						damage=attackpower-defensepower
					if(damage<=0)
						damage=1
					if(damage>=M.powerlevel*0.2&&damage<M.powerlevel*0.4)
						damage*=0.2
					if(damage>=M.powerlevel*0.4&&damage<M.powerlevel*0.6)
						damage*=0.4
					if(damage>=M.powerlevel*0.6&&damage<M.powerlevel*0.8)
						damage*=0.5
					if(damage>=M.powerlevel*0.8&&damage<M.powerlevel)
						damage*=0.7
					if(damage>=M.powerlevel)
						damage*=0.9
					src.attacking=1
					spawn(4)src.attacking=0
					if(src.attacker==M&&M.spar)
						src.exp+=7
					M.attacker=src
					spawn(20)
						if(M)
							M.attacker=""
					if(M.armorblock)
						if(prob(M.armorblock))
							flick("attack",src)
							if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
								return
							else
								if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
									return
							M << "\blue Your armor absorbs some of [src]'s attack!"
							src << "\blue [M]'s armor absorbs some of your attack!"
							M.powerlevel -= damage/5
							for(var/obj/Equipment/Armor/A in M.contents)
								A.condition -= damage/5
								if(A.condition <= 0)
									M << "\blue Your armor has been destroyed!"
									M.overlays -= A
									M.armor_eq = 0
									M.armor = 0
									M.armorblock=0
									del(A)
							M.KO()
							src.cooldown = 1
							spawn((src.speed/1000)*2)src.cooldown = 0
					if(prob(1+(src.critical/5)))
						flick("attack",src)
						M << "\red [src] Attacks you and sends you flying back!"
						src << "\red You Attack [M] with a Critical Hit!"
						var/FallDir = get_dir(src,M)
						src.dir = FallDir
						step(M,FallDir)
						switch(FallDir)
							if(NORTH)M.dir = SOUTH
							if(NORTHWEST)M.dir = SOUTHEAST
							if(WEST)M.dir = EAST
							if(SOUTHWEST)M.dir = NORTHEAST
							if(SOUTH)M.dir = NORTH
							if(SOUTHEAST)M.dir = NORTHWEST
							if(EAST)M.dir = WEST
							if(NORTHEAST)M.dir = SOUTHWEST
						M.frozen-=1
						spawn(10)
							M.frozen+=1
						M.powerlevel -= round(damage * 2)
						M.KO()
						src.cooldown = 1
						spawn((src.speed/1000)*2)src.cooldown = 0
					else
						flick("attack",src)
						if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
							return
						else
							if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
								return
						M << "\red [src] Attacks you!"
						src << "\red You Attack [M]!"
						M.powerlevel -= round(damage)
						M.KO()
						src.cooldown = 1
						spawn((src.speed/1000)*2)src.cooldown = 0
			Kick()
				set category = "Combat"
				if(!src.pk)
					src << "You are not a Combatant!"
					return
				if(src.doing)
					return
				if(src.dead)
					src << "You are dead."
					return
				if(src.FuseFollower)
					return
				if(src.cooldown)
					return
				if(src.attack_lock)
					return
				src.cooldown=1
				spawn(4)
					src.incombo-=1
					if(src.incombo<0)
						src.incombo=0
				if(src.lastkick=="2")
					src.icon_state="kick1"
					src.lastkick="1"
				else
					src.icon_state="kick2"
					src.lastkick="2"
				src.kickcount+=1
				src.incombo+=1
				if(src.incombo>3)
					src.incombo=3
				if(src.kickcount<3)
					if(src.incombo)
						if(src.kickcount+src.punchcount<src.combolimit)
							src.cooldown=1
							spawn(src.combospeed/10000)
								src.kickcount-=1
								if(src.kickcount<1)
									src.kickcount=1
								src.cooldown=0
								src.icon_state=""
						else
							src.cooldown=1
							spawn(15)
								src.kickcount-=1
								if(src.kickcount<1)
									src.kickcount=1
								src.cooldown=0
								src.icon_state=""
					else
						src.cooldown=1
						spawn(15)
							src.kickcount-=1
							if(src.kickcount<1)
								src.kickcount=1
							src.cooldown=0
							src.icon_state=""
				else
					src.cooldown=1
					spawn(15)
						src.kickcount-=1
						if(src.kickcount<1)
							src.kickcount=1
						src.icon_state=""
						src.cooldown=0
				for(var/mob/M in get_step(src,src.dir))
					if(M.type == /mob/PC)
						var/turf/T=M.loc
						for(var/turf/Floors/Safe_Zone/S in T)
							src << "Safe Zone!"
							return
					if(!M)
						continue
					if(M.FuseFollower)
						continue
					if(M.safe)
						src << "[M] is safe and cannot be attacked."
						continue
					if(M.dead)
						src << "[M] is dead."
						continue
					if(M.KO)
						src << "[M] is already K.O!"
						continue
					if(!M.pk)
						src << "[M] is not a Combatant!"
						continue
					var/attackpower=(src.strength+((src.powerlevel+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
					var/defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
					var/damage=attackpower-defensepower
					if(src.spar)
						attackpower=(src.strength/500+((src.powerlevel/500+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
						defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
						damage=attackpower-defensepower
					if(damage<=0)
						damage=1
					if(damage>=M.powerlevel*0.2&&damage<M.powerlevel*0.4)
						damage*=0.2
					if(damage>=M.powerlevel*0.4&&damage<M.powerlevel*0.6)
						damage*=0.4
					if(damage>=M.powerlevel*0.6&&damage<M.powerlevel*0.8)
						damage*=0.5
					if(damage>=M.powerlevel*0.8&&damage<M.powerlevel)
						damage*=0.7
					if(damage>=M.powerlevel)
						damage*=0.9
					src.attacking=1
					spawn(4)src.attacking=0
					if(src.attacker==M&&M.spar)
						src.exp+=7
					M.attacker=src
					spawn(20)
						if(M)
							M.attacker=""
					if(M.armorblock)
						if(prob(M.armorblock))
							flick("attack",src)
							if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
								return
							else
								if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
									return
							M << "\blue Your armor absorbs some of [src]'s attack!"
							src << "\blue [M]'s armor absorbs some of your attack!"
							M.powerlevel -= damage/5
							for(var/obj/Equipment/Armor/A in M.contents)
								A.condition -= damage/5
								if(A.condition <= 0)
									M << "\blue Your armor has been destroyed!"
									M.overlays -= A
									M.armor_eq = 0
									M.armor = 0
									M.armorblock=0
									del(A)
							M.KO()
							src.cooldown = 1
							spawn((src.speed/1000)*2)src.cooldown = 0
					if(prob(1+(src.critical/5)))
						flick("attack",src)
						M << "\red [src] Attacks you and sends you flying back!"
						src << "\red You Attack [M] with a Critical Hit!"
						var/FallDir = get_dir(src,M)
						src.dir = FallDir
						step(M,FallDir)
						switch(FallDir)
							if(NORTH)M.dir = SOUTH
							if(NORTHWEST)M.dir = SOUTHEAST
							if(WEST)M.dir = EAST
							if(SOUTHWEST)M.dir = NORTHEAST
							if(SOUTH)M.dir = NORTH
							if(SOUTHEAST)M.dir = NORTHWEST
							if(EAST)M.dir = WEST
							if(NORTHEAST)M.dir = SOUTHWEST
						M.frozen-=1
						spawn(10)
							M.frozen+=1
						M.powerlevel -= round(damage * 2)
						M.KO()
						src.cooldown = 1
						spawn((src.speed/1000)*2)src.cooldown = 0
					else
						flick("attack",src)
						if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
							return
						else
							if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
								return
						M << "\red [src] Attacks you!"
						src << "\red You Attack [M]!"
						M.powerlevel -= round(damage)
						M.KO()
						src.cooldown = 1
						spawn((src.speed/1000)*2)src.cooldown = 0








*/
















			Spar()
				set category = "Combat"
				if(src.spam_delay)
					src<<"You must wait a moment."
					return
				src.spam_delay=1
				if(src.spar)
					src.spar=0
					view(8)<<"\white [src] is no longer in a sparring stance."
					spawn(25)src.spam_delay=0
				else
					src.spar=1
					view(8)<<"\white [src] is now in a sparring stance."
					spawn(25)src.spam_delay=0
	/*		AttackNormal(mob/M in get_step(src,src.dir))
				set category = "Combat"
				set name = "Punch"
				if(istype(M,/mob))
					if(M in get_step(src,src.dir))
						if(!M)
							return
						if(src.doing || src.KO)
							return
						if(src.dead)
							src << "You are dead"
							return
						if(M.FuseFollower)
							return
						if(src.FuseFollower)
							return
						if(M.safe)
							src << "[M] is safe and cannot be attacked"
							return
						if(M.KO)
							src << "[M] is already K.O!"
							return
						if(src.cooldown)
							return
						if(src.attack_lock)
							return
						var/attackpower=(src.strength+((src.powerlevel+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
						var/defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
						var/damage=attackpower-defensepower
						if(src.spar)
							attackpower=(src.strength/500+((src.powerlevel/500+(src.unarmed_skill*10))*0.1))+(src.unarmed_skill/1.5)
							defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
							damage=attackpower-defensepower
						if(damage<=0)
							damage=1
						if(damage>=M.powerlevel*0.2&&damage<M.powerlevel*0.4)
							damage*=0.2
						if(damage>=M.powerlevel*0.4&&damage<M.powerlevel*0.6)
							damage*=0.4
						if(damage>=M.powerlevel*0.6&&damage<M.powerlevel*0.8)
							damage*=0.5
						if(damage>=M.powerlevel*0.8&&damage<M.powerlevel)
							damage*=0.7
						if(damage>=M.powerlevel)
							damage*=0.9
						if(M.type == /mob/PC)
							for(var/turf/Floors/Safe_Zone/S in view(8))
								if(S in view(8))
									src << "[M] is in a Safe Zone!"
									return
							if(src.safe)
								src << "You cannot attack at the moment."
								return
							if(!src.pk)
								src << "You are not a Combatant!"
								return
							if(!M.pk)
								src << "[M] is not a Combatant!"
								return
							if(M.dead)
								src << "[M] is Dead!"
								return
							if(!M)return
							src.attacking=1
							spawn(4)src.attacking=0
						/*	if(src.SuperSonicCheck(M)==TRUE)
								src.SuperSonicStart(M)
								return*/
							if(src.attacker==M&&M.spar)
								src.exp+=7
							M.attacker=src
							spawn(20)
								if(M)
									M.attacker=""
							if(M.armorblock)
								if(prob(M.armorblock))
									flick("attack",src)
									if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
										return
									else
										if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
											return
									M << "\blue Your armor absorbs some of [src]'s attack!"
									src << "\blue [M]'s armor absorbs some of your attack!"
									M.powerlevel -= damage/5
									for(var/obj/Equipment/Armor/A in M.contents)
										A.condition -= damage/5
										if(A.condition <= 0)
											M << "\blue Your armor has been destroyed!"
											M.overlays -= A
											M.armor_eq = 0
											M.armor = 0
											M.armorblock=0
											del(A)
									M.KO()
									src.cooldown = 1
									spawn((src.speed/1000)*2)src.cooldown = 0
							if(prob(1+(src.critical/5)))
								flick("attack",src)
								M << "\red [src] Attacks you and sends you flying back!"
								src << "\red You Attack [M] with a Critical Hit!"
								var/FallDir = get_dir(src,M)
								src.dir = FallDir
								step(M,FallDir)
								switch(FallDir)
									if(NORTH)M.dir = SOUTH
									if(NORTHWEST)M.dir = SOUTHEAST
									if(WEST)M.dir = EAST
									if(SOUTHWEST)M.dir = NORTHEAST
									if(SOUTH)M.dir = NORTH
									if(SOUTHEAST)M.dir = NORTHWEST
									if(EAST)M.dir = WEST
									if(NORTHEAST)M.dir = SOUTHWEST
								M.frozen-=1
								spawn(10)
									M.frozen+=1
								M.powerlevel -= round(damage * 2)
								M.KO()
								src.cooldown = 1
								spawn((src.speed/1000)*2)src.cooldown = 0
							else
								flick("attack",src)
								if(M.Counter_Attack(src,M.strength,src.defence)==TRUE)
									return
								else
									if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
										return
								M << "\red [src] Attacks you!"
								src << "\red You Attack [M]!"
								M.powerlevel -= round(damage)
								M.KO()
								src.cooldown = 1
								spawn((src.speed/1000)*2)src.cooldown = 0
						else
							flick("attack",src)
							M << "\red [src] Attacks [M]!"
							src << "\red You Attack [M]!"
							M.powerlevel -= round(damage)
							M.KO()
							src.cooldown = 1
							spawn((src.speed/1000)*2)src.cooldown = 0*/
	proc
		SuperSonicCheck(mob/M)
			if(src.attacking&&M.attacking)
				if(src.dir==NORTH&&M.dir==SOUTH)
					return TRUE
				if(src.dir==SOUTH&&M.dir==NORTH)
					return TRUE
				if(src.dir==EAST&&M.dir==WEST)
					return TRUE
				if(src.dir==WEST&&M.dir==EAST)
					return TRUE
				if(src.dir==NORTHEAST&&M.dir==SOUTHWEST)
					return TRUE
				if(src.dir==SOUTHWEST&&M.dir==NORTHEAST)
					return TRUE
				if(src.dir==NORTHWEST&&M.dir==SOUTHEAST)
					return TRUE
				if(src.dir==SOUTHEAST&&M.dir==NORTHWEST)
					return TRUE
			else
				return FALSE
		SuperSonicStart(mob/M,Times=2)
			var/turf/L1=src.loc
			var/turf/L2=M.loc
			src.doing=1
			M.doing=1
			src.frozen=1
			M.frozen=1
			var/t=Times
			Repeat
			if(t)
				t-=1
				sleep(7)
				if(prob(50))
					spawn(1)
						flick("attack",src)
						flick("attack2",M)
						flick("attack2",src)
						flick("attack",M)
					if(src.x+5&&M.x+5<world.maxx)
						src.loc=locate(src.x+4,src.y,src.z)
						M.loc=locate(M.x+4,M.y,M.z)
					else
						if(src.y+5&&M.y+5<world.maxy)
							src.loc=locate(src.x,src.y+4,src.z)
							M.loc=locate(M.x,M.y+4,M.z)
				else
					spawn(1)
						flick("attack",src)
						flick("attack2",M)
						flick("attack2",src)
						flick("attack",M)
					if(src.y+5&&M.y+5<world.maxy)
						src.loc=locate(src.x,src.y+4,src.z)
						M.loc=locate(M.x,M.y+4,M.z)
					else
						if(src.x+5&&M.x+5<world.maxx)
							src.loc=locate(src.x+4,src.y,src.z)
							M.loc=locate(M.x+4,M.y,M.z)
				sleep(12)
				src.loc=L1
				M.loc=L2
				sleep(12)
				if(prob(50))
					spawn(1)
						flick("attack",src)
						flick("attack2",M)
						flick("attack2",src)
						flick("attack",M)
					if(src.x+5&&M.x+5<world.maxx)
						src.loc=locate(src.x+4,src.y,src.z)
						M.loc=locate(M.x+4,M.y,M.z)
					else
						if(src.y+5&&M.y+5<world.maxy)
							src.loc=locate(src.x,src.y+4,src.z)
							M.loc=locate(M.x,M.y+4,M.z)
				else
					spawn(1)
						flick("attack",src)
						flick("attack2",M)
						flick("attack2",src)
						flick("attack",M)
					if(src.y+5&&M.y+5<world.maxy)
						src.loc=locate(src.x,src.y+4,src.z)
						M.loc=locate(M.x,M.y+4,M.z)
					else
						if(src.x+5&&M.x+5<world.maxx)
							src.loc=locate(src.x+4,src.y,src.z)
							M.loc=locate(M.x+4,M.y,M.z)
				sleep(12)
				src.loc=L1
				M.loc=L2
				src.doing=0
				M.doing=0
				src.frozen=0
				M.frozen=0
				if(t)
					goto Repeat
				else
					src.doing=0
					M.doing=0
					src.frozen=0
					M.frozen=0
			else
				src.doing=0
				M.doing=0
				src.frozen=0
				M.frozen=0
mob/PC/verb/Finish(mob/M in get_step(src,src.dir))
	set category = "Combat"
	if(!M)
		return
	if(src.dead)
		src<<"You are dead."
		return
	if(M.FuseFollower)
		return
	if(src.FuseFollower)
		return
	if(M.safe)
		src << "[M] can't be attacked right now."
		return
	if(src.finish_delay)
		src << "You must wait a moment."
		return
	if(M.KO)
		src.finish_delay = 1
		spawn(15)src.finish_delay = 0
		M.DeathCheck(src)
		src.Level_Up()
	else
		src.finish_delay = 1
		spawn(15)src.finish_delay = 0
		src << "[M] is not KO yet!"
		return