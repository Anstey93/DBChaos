obj/Gym
	GWeight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		value=500000
		invenable=1
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=8)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.lift)
					return
				if(usr.hiting)
					return
				else
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)
						src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					usr.exp += 10.5
					if(usr.expbuff)usr.exp += 10.5
					if(!usr.staminabuff)usr.staminaleft += 2.7
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statstr)
						var/strbonus=((usr.level*usr.statstr)/4)
						usr.strength_max += strbonus
						usr.strength += strbonus
					var/str_gain = rand(usr.level/2,usr.level)+rand(1,5)
					usr.strength_max += str_gain
					usr.strength += str_gain
					if(prob(10))
						usr << "\white You feel your Muscles bulge slightly..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	GTreadmill
		icon = 'Gym.dmi'
		name="Treadmill"
		icon_state = "treadmill"
		value=550000
		invenable=1
		var
			run = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=8)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.run)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.dir=EAST
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					usr.exp += 16.5
					if(usr.expbuff)usr.exp += 16.5
					if(!usr.staminabuff)usr.staminaleft += 3.3
					usr.staminaleft_exp += rand(30,40)
					usr.speed-=1
					usr.speed_max-=1
					if(usr.speed<1000)
						usr.speed=1000
					if(usr.speed_max<1000)
						usr.speed_max=1000
					usr.Level_Up()
					usr.Fatigue_Level_Up()
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
					usr.dir = EAST
					if(!usr)return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
	GTraining_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Dummy"
		density = 1
		value=250000
		invenable=1
		var
			hit = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=8)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					usr.unarmed_skill += 1
					usr.exp += 4.2
					if(usr.expbuff)usr.exp += 4.2
					if(!usr.staminabuff)usr.staminaleft += 1.7
					usr<<"<font color = blue>Unarmed Skill has increased to [usr.unarmed_skill]</font>"
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(5)usr.hiting=0
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr << "Your ki is too low."
					return
				if(usr.staminaleft >= usr.staminaleft_max)
					usr << "You are too tired."
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					usr.ki_skill += 1
					usr.exp += 4.2
					if(usr.expbuff)usr.exp += 4.2
					if(!usr.staminabuff)usr.staminaleft += 1.7
					usr.ki -= rand(20,50)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
					usr<<"<font color = blue>Ki Skill has increased to [usr.ki_skill]</font>"
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(5)usr.hiting=0
					if(usr.staminaleft>=usr.staminaleft_max)
						usr.staminaleft=usr.staminaleft_max
	GMachine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		invenable=1
		var
			punch = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=8)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			PunchIt()
				set category = "Training"
				set name="Punch Machine"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.punch)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)
						src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp+=10.5
					if(usr.expbuff)usr.exp+=10.5
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.staminaleft+=2.7
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*usr.statdef)/4)
						usr.defence_max += strbonus
						usr.defence += strbonus
					var/def_gain = rand(usr.level/2,usr.level)+rand(1,5)
					usr.defence_max += def_gain
					usr.defence += def_gain
					if(prob(10))
						usr << "\white The machine counters your attack and your defence rises..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	GKiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Ki Machine"
		density = 1
		invenable=1
		value=600000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				if(src.shots<50)
					spawn(20)src.ShootBlast()
				else
					src.shooting=0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=8)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is already turned on."
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.ki<1000)
					usr<<"Your ki is too low."
					return
				if(usr.ki>=5000&&usr.staminaleft<=usr.staminaleft_max-5)
					usr.ki-=1000
					if(!usr.staminabuff)usr.staminaleft+=3.2
					usr.doing=1
					spawn(3)
						usr.doing=0
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							if(usr.statki)
								var/strbonus=((usr.level*usr.statki)/13)
								usr.kidefense_max += strbonus
								usr.kidefense += strbonus
								usr.ki+=strbonus*0.45
								usr.ki_max+=strbonus*0.45
							var/boost=(2*usr.level+rand(50,80))/10
							usr.kidefense+=boost
							usr.kidefense_max+=boost
							usr.ki+=boost*0.45
							usr.ki_max+=boost*0.45
							usr.exp+=7.2
							if(usr.expbuff)usr.exp+=7.2
							usr.Level_Up()
	AdvancedWeight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		value=500000
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.lift)
					return
				if(usr.hiting)
					return
				else
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)
						src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					usr.exp += 10.5
					if(usr.expbuff)usr.exp += 10.5
					if(!usr.staminabuff)usr.staminaleft += 2.7
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statstr)
						var/strbonus=((usr.level*usr.statstr)/4)
						usr.strength_max += strbonus
						usr.strength += strbonus
					var/str_gain = rand(usr.level/2,usr.level)+rand(1,5)
					usr.strength_max += str_gain
					usr.strength += str_gain
					if(prob(10))
						usr << "\white You feel your Muscles bulge slightly..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	AdvancedMachine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Punch Machine"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.punch)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)
						src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp += 10.5
					if(usr.expbuff)usr.exp += 10.5
					if(!usr.staminabuff)usr.staminaleft += 2.7
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*usr.statdef)/4)
						usr.defence_max += strbonus
						usr.defence += strbonus
					var/def_gain = rand(usr.level/2,usr.level)+rand(1,5)
					usr.defence_max += def_gain
					usr.defence += def_gain
					if(prob(10))
						usr << "\white The machine counters your attack and your defence rises..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	Weight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		value=500000
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.lift)
					return
				if(usr.hiting)
					return
				else
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)
						src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					usr.exp += 10.5
					if(usr.expbuff)usr.exp += 10.5
					if(!usr.staminabuff)usr.staminaleft += 2.7
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statstr)
						var/strbonus=((usr.level*usr.statstr)/4)
						usr.strength_max += strbonus
						usr.strength += strbonus
					var/str_gain = rand(usr.level/2,usr.level)+rand(1,5)
					usr.strength_max += str_gain
					usr.strength += str_gain
					if(prob(10))
						usr << "\white You feel your Muscles bulge slightly..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	Treadmill
		icon = 'Gym.dmi'
		name="Treadmill"
		icon_state = "treadmill"
		value=550000
		var
			run = 0
		verb
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					usr << "You are too tired."
					return
				if(usr.doing)
					return
				if(src.run)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.dir=EAST
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					usr.exp += 16.5
					if(usr.expbuff)usr.exp += 16.5
					if(!usr.staminabuff)usr.staminaleft += 3.3
					usr.staminaleft_exp += rand(30,40)
					usr.speed-=1
					usr.speed_max-=1
					if(usr.speed<1000)
						usr.speed=1000
					if(usr.speed_max<1000)
						usr.speed_max=1000
					usr.Level_Up()
					usr.Fatigue_Level_Up()
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
					usr.dir = EAST
					if(!usr)return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
	Training_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Dummy"
		density = 1
		value=250000
		var
			hit = 0
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					usr.unarmed_skill += 1
					usr.exp += 4.2
					if(usr.expbuff)usr.exp += 4.2
					if(!usr.staminabuff)usr.staminaleft += 1.7
					usr<<"<font color = blue>Unarmed Skill has increased to [usr.unarmed_skill]</font>"
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(5)usr.hiting=0
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr << "Your ki is too low."
					return
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					usr.ki_skill += 1
					usr.exp += 4.2
					if(usr.expbuff)usr.exp += 4.2
					if(!usr.staminabuff)usr.staminaleft += 1.7
					usr.ki -= rand(20,50)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
					usr<<"<font color = blue>Ki Skill has increased to [usr.ki_skill]</font>"
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(5)usr.hiting=0
					if(usr.staminaleft>=usr.staminaleft_max)
						usr.staminaleft=usr.staminaleft_max
	Machine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Punch Machine"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.punch)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)
						src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp+=10.5
					if(usr.expbuff)usr.exp+=10.5
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.staminaleft+=2.7
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*usr.statdef)/4)
						usr.defence_max += strbonus
						usr.defence += strbonus
					var/def_gain = rand(usr.level/2,usr.level)+rand(1,5)
					usr.defence_max += def_gain
					usr.defence += def_gain
					if(prob(10))
						usr << "\white The machine counters your attack and your defence rises..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	Computer
		icon = 'Generator.dmi'
		density = 1
		verb
			Start_Simulation()
				set category = "Training"
				set src in oview(1)
				if(usr.waiting)
					usr << "There is a 15 second delay."
					return
				usr.waiting = 1
				switch(alert("What do you wish to do?","","Clone Fighter","Simulator Fighter","Cancel"))
					if("Cancel")
						usr.waiting=0
						return
					if("Simulator Fighter")
						var/npc_level = input("What Level do you wish to make the Simulation Fighter?")as num
						if(npc_level > usr.level*1.5)
							usr << "\red Level cannot be higher than [round(usr.level*1.5)]."
							usr.waiting = 0
							return
						if(npc_level <= 0)
							usr.waiting = 0
							return
						var/mob/Monster/Simulator_NPC/N = new
						var/pl=(npc_level*npc_level)+rand(50,80)
						var/str=npc_level*(npc_level*50)+rand(50,80)
						var/sp=5-(npc_level/900)
						N.level = npc_level
						N.powerlevel = pl
						N.powerlevel_max = pl
						N.ki = pl*0.95
						N.ki_max = pl*0.95
						N.kidefense=pl*0.7
						N.kidefense_max=pl*0.7
						N.strength = str
						N.strength_max = str
						N.defence = str
						N.defence_max = str
						N.exp = npc_level*0.2
						N.zenni = (npc_level*7)+500
						N.speed = sp
						var/race = rand(1,6)
						var/skin = rand(1,3)
						var/hair = rand(1,6)
						if(race == 1)
							N.icon = 'Bebi - Form 1.dmi'
						if(race == 2)
							N.icon = 'Bio Android - Form 1.dmi'
						if(race == 3)
							N.icon = 'Changling - Form 1.dmi'
						if(race == 4)
							N.icon = 'Namek - Normal.dmi'
						if(race == 5)
							N.icon = 'Buu Evil.dmi'
						if(race == 6)
							if(skin == 1)
								N.icon = 'Male - White.dmi'
							if(skin == 2)
								N.icon = 'Male - Tan.dmi'
							if(skin == 2)
								N.icon = 'Male - Dark.dmi'
							if(hair == 1)
								N.hair_icon='Hair - Goku.dmi'
								N.overlays += N.hair_icon
								N.hair="Goku"
							if(hair == 2)
								N.hair_icon='Hair - Vegeta.dmi'
								N.overlays += N.hair_icon
								N.hair="Vegeta"
							if(hair == 3)
								N.hair_icon='Hair - Teen Gohan.dmi'
								N.hair="Teen Gohan"
								N.overlays += N.hair_icon
							if(hair == 4)
								N.hair_icon='Hair - Adult Gohan.dmi'
								N.hair="Adult Gohan"
								N.overlays += N.hair_icon
							if(hair == 5)
								N.hair_icon='Hair - Future Gohan.dmi'
								N.hair="Future Gohan"
								N.overlays += N.hair_icon
							if(hair == 6)
								N.hair_icon='Hair - Trunks Long.dmi'
								N.hair="Trunks Long"
								N.overlays += N.hair_icon
						N.loc = locate(usr.x,usr.y-1,usr.z)
						spawn(150)
							if(!usr)return
							usr.waiting = 0
					if("Clone Fighter")
						var/mob/Monster/Simulator_NPC/N = new
						N.level = usr.level
						N.powerlevel = usr.powerlevel
						N.powerlevel_max = usr.powerlevel_max
						N.ki = usr.ki
						N.ki_max = usr.ki_max
						N.kidefense=usr.kidefense
						N.kidefense_max=usr.kidefense_max
						N.strength = usr.strength
						N.strength_max = usr.strength_max
						N.defence = usr.defence
						N.defence_max = usr.defence_max
						N.exp = N.level*0.2
						N.zenni = (usr.level*7)+500
						N.speed = usr.speed_max
						N.loc = locate(usr.x,usr.y-1,usr.z)
						spawn(150)
							if(!usr)return
							usr.waiting = 0
	KiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Ki Machine"
		density = 1
		value=600000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				if(src.shots<50)
					spawn(20)src.ShootBlast()
				else
					src.shooting=0
		verb
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=8)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is already turned on."
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.ki<1000)
					usr<<"Your ki is too low."
					return
				if(usr.ki>=5000&&usr.staminaleft<=usr.staminaleft_max-5)
					usr.ki-=1000
					if(!usr.staminabuff)usr.staminaleft+=3.2
					usr.doing=1
					spawn(3)
						usr.doing=0
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							if(usr.statki)
								var/strbonus=((usr.level*usr.statki)/13)
								usr.kidefense_max += strbonus
								usr.kidefense += strbonus
								usr.ki+=strbonus*0.45
								usr.ki_max+=strbonus*0.45
							var/boost=(2*usr.level+rand(50,80))/10
							usr.kidefense+=boost
							usr.kidefense_max+=boost
							usr.ki+=boost*0.45
							usr.ki_max+=boost*0.45
							usr.exp+=7.2
							if(usr.expbuff)usr.exp+=7.2
							usr.Level_Up()
obj
	KiTrainingBlast
		icon='Techs.dmi'
		icon_state="blast"
		layer=100
		range=0
		New()
			..()
			spawn(1)
				while(src)
					var/turf/T=src.loc
					for(var/obj/Gym/G in T)
						del(src)
						break
					if(T.density)
						del(src)
						break
					for(var/mob/M in T)
						del(src)
						break
					step(src,src.dir)
					src.range++
					if(src.range>=20)
						del(src)
						break
					sleep(2)
		Bump()
			del(src)

obj/GymNoob
	Weight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.lift)
					return
				if(usr.hiting)
					return
				else
					src.lift = 1
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)
						src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					usr.exp += 8.5
					if(usr.expbuff)usr.exp += 8.5
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					if(!usr.staminabuff)usr.staminaleft += 2.6
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*usr.statdef)/5)
						usr.defence_max += strbonus
						usr.defence += strbonus
					var/str_gain = rand(usr.level/3,usr.level)+rand(1,5)
					usr.strength_max += str_gain
					usr.strength += str_gain
					if(prob(10))
						usr << "\white You feel your Muscles bulge slightly..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
					sleep(5)
					src.lift = 0
	Treadmill
		icon = 'Gym.dmi'
		name="Treadmill"
		icon_state = "treadmill"
		var
			run = 0
		verb
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.run)
					return
				if(usr.hiting)
					return
				else
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					usr.exp += 13.3
					if(usr.expbuff)usr.exp += 13.3
					if(!usr.staminabuff)usr.staminaleft += 3.1
					usr.staminaleft_exp += rand(23,33)
					usr.speed-=1
					usr.speed_max-=1
					if(usr.speed<1000)
						usr.speed=1000
					if(usr.speed_max<1000)
						usr.speed_max=1000
					usr.Level_Up()
					usr.Fatigue_Level_Up()
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
					usr.dir = EAST
					if(!usr)return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
	Training_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Dummy"
		density = 1
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					usr.unarmed_skill += 1
					usr.exp += 3.5
					if(usr.expbuff)usr.exp += 3.5
					if(!usr.staminabuff)usr.staminaleft += 1.5
					usr<<"<font color = blue>Unarmed Skill has increased to [usr.unarmed_skill]</font>"
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(5)usr.hiting=0
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr << "Your ki is too low."
					return
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					usr.ki_skill += 1
					usr.exp += 3.5
					if(usr.expbuff)usr.exp += 3.5
					if(!usr.staminabuff)usr.staminaleft += 1.5
					usr.ki -= rand(20,50)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
					usr<<"<font color = blue>Ki Skill has increased to [usr.ki_skill]</font>"
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(5)usr.hiting = 0
					if(usr.staminaleft>=usr.staminaleft_max)
						usr.staminaleft=usr.staminaleft_max
	Machine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Punch Machine"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.punch)
					return
				if(usr.hiting)
					return
				else
					src.punch = 1
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)
						src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp += 8.5
					if(usr.expbuff)usr.exp += 8.5
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.staminaleft += 2.6
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*usr.statdef)/5)
						usr.defence_max += strbonus
						usr.defence += strbonus
					var/def_gain = rand(usr.level/2,usr.level)+rand(1,5)
					usr.defence_max += def_gain
					usr.defence += def_gain
					if(prob(10))
						usr << "\white The machine counters your attack and your defence rises..."
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max