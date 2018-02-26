obj
	var
		radarlvl=1
obj/Equipment
	DragonRadar
		value=20000
		name="Dragon Radar {Level: 1}"
		icon = 'Dragon Radar.dmi'
		icon_state = "DBRadar1"
		Click()
			set category = null
			if(usr.z)
				if(usr.dbrad == 0)
					if(src.radarlvl==1)
						if(usr.CheckEarthBalls()!=TRUE)
							usr<<"The Earth Dragonballs haven't been spawned."
							return
						usr.dbrad = 1
						var/obj/O = new/obj/dragonradar/hud/s0(usr.client)
						O.screen_loc = "1:16,16:10"
						O.layer = 1501
						usr.client.screen += O
						usr.client.radar = O
						var/obj/O1 = new/obj/dragonradar/hud/s1(usr.client)
						O1.screen_loc = "1,16"
						O1.layer = 1500
						usr.client.screen += O1
						var/obj/O2 = new/obj/dragonradar/hud/s2(usr.client)
						O2.screen_loc = "2,16"
						O2.layer = 1500
						usr.client.screen += O2
						var/obj/O3 = new/obj/dragonradar/hud/s3(usr.client)
						O3.screen_loc = "1,17"
						O3.layer = 1500
						usr.client.screen += O3
						var/obj/O4 = new/obj/dragonradar/hud/s4(usr.client)
						O4.screen_loc = "2,17"
						O4.layer = 1500
						usr.client.screen += O4
						spawn(5)usr.client.UpdateRadarEarth()
					if(src.radarlvl==2)
						if(usr.CheckNamekBalls()!=TRUE)
							usr<<"The Namek Dragonballs haven't been spawned."
							return
						usr.dbrad = 1
						var/obj/O = new/obj/dragonradar/hud/s0(usr.client)
						O.screen_loc = "1:16,16:10"
						O.layer = 1501
						usr.client.screen += O
						usr.client.radar = O
						var/obj/O1 = new/obj/dragonradar/hud/s1n(usr.client)
						O1.screen_loc = "1,16"
						O1.layer = 1500
						usr.client.screen += O1
						var/obj/O2 = new/obj/dragonradar/hud/s2n(usr.client)
						O2.screen_loc = "2,16"
						O2.layer = 1500
						usr.client.screen += O2
						var/obj/O3 = new/obj/dragonradar/hud/s3n(usr.client)
						O3.screen_loc = "1,17"
						O3.layer = 1500
						usr.client.screen += O3
						var/obj/O4 = new/obj/dragonradar/hud/s4n(usr.client)
						O4.screen_loc = "2,17"
						O4.layer = 1500
						usr.client.screen += O4
						spawn(5)usr.client.UpdateRadarNamek()
					if(src.radarlvl==3)
						if(usr.CheckBlackBalls()!=TRUE)
							usr<<"The Black Star Dragonballs haven't been spawned."
							return
						usr.dbrad = 1
						var/obj/O = new/obj/dragonradar/hud/s0(usr.client)
						O.screen_loc = "1:16,16:10"
						O.layer = 1501
						usr.client.screen += O
						usr.client.radar = O
						var/obj/O1 = new/obj/dragonradar/hud/s1b(usr.client)
						O1.screen_loc = "1,16"
						O1.layer = 1500
						usr.client.screen += O1
						var/obj/O2 = new/obj/dragonradar/hud/s2b(usr.client)
						O2.screen_loc = "2,16"
						O2.layer = 1500
						usr.client.screen += O2
						var/obj/O3 = new/obj/dragonradar/hud/s3b(usr.client)
						O3.screen_loc = "1,17"
						O3.layer = 1500
						usr.client.screen += O3
						var/obj/O4 = new/obj/dragonradar/hud/s4b(usr.client)
						O4.screen_loc = "2,17"
						O4.layer = 1500
						usr.client.screen += O4
						spawn(5)usr.client.UpdateRadarBlack()
				else
					for(var/obj/dragonradar/hud/H in usr.client.screen)
						del(H)
					usr.dbrad = 0
			else
				return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.icon_state = "DBRadar[src.radarlvl]"
					usr << "You have dropped the: <u>[src]</u>."
					for(var/obj/dragonradar/hud/H in usr.client.screen)
						del(H)
					usr.dbrad = 0
					usr.inven_min -= 1
					src.loc = usr.loc
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."


client
	proc
		UpdateRadarEarth()
			set background=1
			spawn while(src.mob.dbrad)
				if(!src.mob.dbrad)break
				var/icon/R=icon('Dragon Radar2.dmi',"")
				R.DrawBox(rgb(255,255,255), 17, 17-3, 17, 17+3)
				R.DrawBox(rgb(255,255,255), 17-3, 17, 17+3, 17)
				for(var/obj/Earth_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 16-(src.mob.x/25 - O.x/25)+1
						var/dy = 16-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in world)
					if(M.z == src.mob.z)
						if(M.e_db_1||M.e_db_2||M.e_db_3||M.e_db_4||M.e_db_5||M.e_db_6||M.e_db_7)
							var/dx = 16-(src.mob.x/25 - M.x/25)+1
							var/dy = 16-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				src.radar.icon = R
				sleep(10)
		UpdateRadarNamek()
			set background=1
			spawn while(src.mob.dbrad)
				if(!src.mob.dbrad)break
				var/icon/R=icon('Dragon Radar2.dmi',"")
				R.DrawBox(rgb(255,255,255), 17, 17-3, 17, 17+3)
				R.DrawBox(rgb(255,255,255), 17-3, 17, 17+3, 17)
				for(var/obj/Namek_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 16-(src.mob.x/25 - O.x/25)+1
						var/dy = 16-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in world)
					if(M.z == src.mob.z)
						if(M.n_db_1||M.n_db_2||M.n_db_3||M.n_db_4||M.n_db_5||M.n_db_6||M.n_db_7)
							var/dx = 16-(src.mob.x/25 - M.x/25)+1
							var/dy = 16-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				src.radar.icon = R
				sleep(10)
		UpdateRadarBlack()
			set background=1
			spawn while(src.mob.dbrad)
				if(!src.mob.dbrad)break
				var/icon/R=icon('Dragon Radar2.dmi',"")
				R.DrawBox(rgb(255,255,255), 17, 17-3, 17, 17+3)
				R.DrawBox(rgb(255,255,255), 17-3, 17, 17+3, 17)
				for(var/obj/Black_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 16-(src.mob.x/25 - O.x/25)+1
						var/dy = 16-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in world)
					if(M.z == src.mob.z)
						if(M.b_db_1||M.b_db_2||M.b_db_3||M.b_db_4||M.b_db_5||M.b_db_6||M.b_db_7)
							var/dx = 16-(src.mob.x/25 - M.x/25)+1
							var/dy = 16-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				src.radar.icon = R
				sleep(10)
obj/dragonradar/hud
	icon = 'Dragon Radar.dmi'
	s0
		icon_state = "radar"
	s1
		icon_state = "1"
	s2
		icon_state = "2"
	s3
		icon_state = "3"
	s4
		icon_state = "4"
	s1n
		icon_state = "n1"
	s2n
		icon_state = "n2"
	s3n
		icon_state = "n3"
	s4n
		icon_state = "n4"
	s1b
		icon_state = "b1"
	s2b
		icon_state = "b2"
	s3b
		icon_state = "b3"
	s4b
		icon_state = "b4"
mob/var/tmp
	dbrad = 0
client
	var
		obj/dragonradar/radar
mob
	proc
		CheckEarthBalls()
			for(var/obj/Earth_Dragonballs/O in world)
				if(O.dball)
					return TRUE
		CheckNamekBalls()
			for(var/obj/Namek_Dragonballs/O in world)
				if(O.dball)
					return TRUE
		CheckBlackBalls()
			for(var/obj/Black_Dragonballs/O in world)
				if(O.dball)
					return TRUE
world
	proc
		ShutDownRadar()
			for(var/client/C in world)
				if(!C.mob.loggedin)continue
				for(var/obj/dragonradar/hud/H in C.screen)
					del(H)
				C.mob.dbrad = 0