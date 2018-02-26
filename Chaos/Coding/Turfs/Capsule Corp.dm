turf
	Passages
		CapsuleCorp
			ChamberEntrance
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					for(var/obj/O in M.contents)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
					M.grav = 0
					switch(input("Which Gravity Room do you wish to go to?") in list("Gravity Room 1","Gravity Room 2","Gravity Room 3","Gravity Room 4","Gravity Room 5","Gravity Room 6","Gravity Room 7","Gravity Room 8","Gravity Pull Room","Cancel"))
						if("Gravity Room 1")
							M.loc = locate(238,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Room 2")
							M.loc = locate(256,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Room 3")
							M.loc = locate(274,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Room 4")
							M.loc = locate(292,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Room 5")
							M.loc = locate(310,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Room 6")
							M.loc = locate(328,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Room 7")
							M.loc = locate(346,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Room 8")
							M.loc = locate(364,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Gravity Pull Room")
							M.loc = locate(394,283,7)
							M.density = 1
							M.buku_lock = 1
							M.ki_lock = 1
							M.it_lock = 1
							M.grav=0
						if("Cancel")
							return
			TrainingEntrance
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					for(var/obj/O in M.contents)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
					M.loc = locate(392,243,7)
					M.density = 1
					M.buku_lock = 1
					M.ki_lock = 1
					M.it_lock = 1
					M.grav = 0
			SimulationEntrance
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					for(var/obj/O in M.contents)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
					M.loc = locate(328,247,7)
					M.density = 1
					M.buku_lock = 1
					M.ki_lock = 1
					M.it_lock = 1
					M.grav = 0
			CapsuleCorpExit
				density = 1
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					M.loc = locate(223,147,1)
					M.density = 1
					M.buku_lock = 0
					M.attack_lock = 0
					M.ki_lock = 0
					M.it_lock = 0
					M.grav = 0