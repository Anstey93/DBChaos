mob
	NPC
		Fix
			name = "{NPC}Fix"
			icon = 'mr.fix.dmi'
			icon_state = "Robot"
			density = 1
			safe = 1
			energy_code = 1949631
			New()
				..()
				if(src.z==2)
					src.energy_code = 1949632
				if(src.z==3)
					src.energy_code = 1949633
				if(src.z==4)
					src.energy_code = 1949634
				src.CreateName()
			race = "Robot"
			karma = "Neutral"
			verb
				Talk()
					set src in oview(2)
					set category=null
					switch(input("What do you need help with?")in list("Fix Equipment","Overlays/Underlays","Rest/Fly/IT","Dead on Earth","Lost Transform verbs","Cancel"))
						if("Cancel")
							return
						if("Lost Transform verbs")
							for(var/obj/Transform/Transform/T1 in usr)
								del(T1)
							for(var/obj/Transform/Revert/T2 in usr)
								del(T2)
							var/obj/Transform/Transform/T1=new
							var/obj/Transform/Revert/T2=new
							T1.loc=usr
							T2.loc=usr
						if("Fix Equipment")
							for(var/obj/O in usr)
								O.suffix=null
								O.equiped=0
							usr.weight=0
							usr.overlays-=usr.overlays
							usr.underlays-=usr.underlays
							usr.head="EMPTY"
							usr.back="EMPTY"
							usr.chest="EMPTY"
							usr.legs="EMPTY"
							usr.feet="EMPTY"
							usr.arms="EMPTY"
							usr.hands="EMPTY"
							usr.waist="EMPTY"
							usr.underclothes="EMPTY"
							usr.clothes="EMPTY"
							usr.clothes_eq=0
							usr.scouter=0
							usr.scouter_eq=0
							usr.armor=0
							usr.armor_eq=0
							usr.under=0
							usr.under_eq=0
							usr.helmet=0
							usr.helmet_eq=0
							usr.gloves=0
							usr.gloves_eq=0
							usr.z_sword=0
							usr.radar=0
							usr.hench_equiped=0
							usr.saiyan_equiped=0
							usr.sellable_items=0
							usr.weightgi = 0
							usr.weightcape = 0
							usr.weightarmor = 0
							usr.weightarm = 0
							usr.weightleg = 0
							usr.weightankle = 0
							usr.weightwrist = 0
							usr.weighthead = 0
						if("Fix Icon")
							switch(input(usr,"Are you sure?","Fix Icon")in list("Yes","No"))
								if("Yes")
									usr.Skin_Apply()
									switch(usr.race)
										if("Bio-Android")
											if(!usr.form_1)
												usr.icon='Bio Android - Form 1.dmi'
											if(usr.form_1)
												usr.icon='Bio Android - Form 2.dmi'
											if(usr.form_2)
												usr.icon='Bio Android - Form 3.dmi'
										if("Majin")
											if(!usr.form_1)
												usr.icon='Majin - Form 1.dmi'
											if(usr.form_1)
												usr.icon='Majin - Form 2.dmi'
											if(usr.form_2)
												usr.icon='Majin - Form 3.dmi'
											if(usr.form_3)
												usr.icon='Majin - Form 4.dmi'
											if(usr.form_4)
												usr.icon='Majin - Form 5.dmi'
										if("Namekian")
											usr.icon='Namek - Normal.dmi'
											if(usr.form_3)
												usr.icon='Namek - Super.dmi'
										if("Konat")
											usr.icon='Konat - Form 1.dmi'
											if(usr.form_3)
												usr.icon='Namek - Super.dmi'
										if("Tuffle")
											usr.icon='Bebi - Form 1.dmi'
											if(usr.form_1)
												usr.icon='Bebi - Form 2.dmi'
											if(usr.form_2)
												usr.icon='Bebi - Form 2.dmi'
											if(usr.form_3)
												usr.icon='Bebi - Form 3.dmi'
											if(usr.form_4)
												usr.icon='Bebi - Form 3.dmi'
										if("Android")
											if(usr.form_1)
												usr.icon='AndroidForm2.dmi'
											if(usr.form_2)
												usr.icon='AndroidForm3.dmi'
						if("Overlays/Underlays")
							usr.underlays -= usr.underlays
							usr.overlays -= usr.overlays
							if(usr.majin)
								usr.overlays += 'Majin.dmi'
							if(usr.race == "Saiyan" && usr.has_tail)
								usr.overlays += 'Tail.dmi'
							return
						if("Rest/Fly/IT")
							usr.density = 1
							usr.boxing = 0
							usr.buku = 0
							usr.doing = 0
							usr.frozen = 0
							usr.powering = 0
							usr.buku_lock = 0
							usr.icon_state = ""
							usr.charging = 0
							usr.attack_lock	= 0
							usr.ki_lock	= 0
							usr.it_lock	= 0
							usr.buku_lock = 0
							usr.playing = 0
							usr.buku_lock = 0
							usr.grav = 0
							usr.hiting = 0
							usr.dualtrain = 0
							usr.dt_delay = 0
							usr.it_blocked=0
							return
						if("Dead on Earth")
							usr.charging = 0
							usr.icon_state = ""
							usr.overlays -= 'Halo.dmi'
							usr.overlays -= 'Halo.dmi'
							usr.overlays -= 'Halo.dmi'
							usr.dead = 0
							usr.density = 1
							usr.boxing = 0
							usr.buku = 0
							usr.doing = 0
							usr.frozen = 0
							usr.powering = 0
							usr.buku_lock = 0
							usr.icon_state = ""
							usr.charging = 0
							usr.attack_lock	= 0
							usr.ki_lock	= 0
							usr.it_lock	= 0
							usr.buku_lock = 0
							usr.playing = 0
							usr.buku_lock = 0
							usr.grav = 0
							usr.hiting = 0
							usr.dualtrain = 0
							usr.dt_delay = 0
							usr.it_blocked=0
							return
