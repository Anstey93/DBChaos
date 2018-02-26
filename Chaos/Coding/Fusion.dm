obj/Technique/FusionDance
	verb
		Fusion_Dance(mob/M in oview(1))
			set category = "Techniques"
			if(usr.Oozaru)
				usr << "Revert from Oozaru first."
				return
			if(M.Oozaru)
				usr << "[M] must revert from Oozaru first."
				return
			if(!M)
				return
			if(M == usr)
				return
			if(usr.dead)
				usr<<"You are dead."
			if(M.dead)
				usr<<"[M] is dead."
			else
				if(!usr.asking_fuse || !M.asking_fuse)
					if(usr.fused == 0 || usr.fused == null)
						if(M.fused == 0 || M.fused == null)
							if(istype(M,/mob/PC))
								if(usr.powerlevel == M.powerlevel)
									if(usr.race == M.race)
										if(M.learn_fusiondance==1)
											if(!M.talking && !usr.talking)
												usr << "<b>Asking [M] if he wants to fuse!"
												if(usr.doing)return
												if(M.doing)return
												usr.asking_fuse = 1
												M.asking_fuse = 1
												switch(alert(M,"[usr] wants to perform the Fusion Dance with you!  Do you want to perform the Fusion Dance with [usr]?  It lasts for about 5 minutes and since [usr] is starting the dance, he will control the fusion! Fuse?","Fuse","Yes","No"))
													if("Yes")
														if(!usr)return
														if(!M)return
														if(usr.fused)return
														if(M.fused)return
														if(usr.doing)return
														if(M.doing)return
														spawn(1)
															usr.FusionStatSave()
															M.FusionStatSave()
														usr.fused = 1
														M.fused = 1
														M.FuseFollower = 1
														var/lead = copytext(usr.name,1,5)
														var/load = copytext(M.name,6)
														usr.random = rand(1,2)
														sleep(4)
														view(8) << "<font face = arial><font color=white>[usr]: <tt>Fuuuu.......SION!...... HAAA!!!"
														view(8) << "<font face = arial><font color=white>[M]: <tt>Fuuuu.......SION!...... HAAA!!!"
														view(8) << "[M] and [usr] fuse to make [lead][load]!!!"
														M.icon = 0
														M.density = 0
														M.overlays -= M.overlays
														M.doing=1
														M.name = "[lead][load]"
														usr.name = "[lead][load]"
														M.loc=usr.loc
														M.follow = usr
														usr.powerlevel_max += M.powerlevel_max
														usr.ki_max += M.ki_max
														usr.strength_max += M.strength_max
														usr.defence_max += M.defence_max
														usr.kidefense_max+=M.kidefense_max
														usr.powerlevel = usr.powerlevel_max
														usr.ki = usr.ki_max
														usr.strength = usr.strength_max
														usr.defence = usr.defence_max
														M.powerlevel_max = 1
														M.powerlevel = 1
														M.ki_max = 1
														M.ki = 1
														M.kidefense_max=1
														M.kidefense=1
														spawn(1)M.FusionFollow(usr)
														if(usr.race=="Saibaman")
															if(usr.form_4 && M.form_4)
																usr.finalformfuse=1
																usr.SaibamanFuseForm()
																spawn(1500)usr.UnFuse()
																spawn(1500)M.UnFuse()
															else
																spawn(3000)usr.UnFuse()
																spawn(3000)M.UnFuse()
														if(usr.race=="Saiyan")
															if(usr.form_5 && M.form_5)
																usr.finalformfuse=1
																usr.SaiyanFuseForm()
																spawn(1500)usr.UnFuse()
																spawn(1500)M.UnFuse()
															else
																spawn(3000)usr.UnFuse()
																spawn(3000)M.UnFuse()
														if(usr.race=="Changeling")
															if(usr.form_5 && M.form_5)
																usr.finalformfuse=1
																usr.ChanglingFuseForm()
																spawn(1500)usr.UnFuse()
																spawn(1500)M.UnFuse()
															else
																spawn(3000)usr.UnFuse()
																spawn(3000)M.UnFuse()
														if(usr.race=="Demon")
															if(usr.form_4 && M.form_4)
																usr.finalformfuse=1
																usr.DemonFuseForm()
																spawn(1500)usr.UnFuse()
																spawn(1500)M.UnFuse()
															else
																spawn(3000)usr.UnFuse()
																spawn(3000)M.UnFuse()
														if(usr.race=="Kai")
															if(usr.form_2 && M.form_2)
																usr.finalformfuse=1
																usr.KaiFuseForm()
																spawn(1500)usr.UnFuse()
																spawn(1500)M.UnFuse()
															else
																spawn(3000)usr.UnFuse()
																spawn(3000)M.UnFuse()
														if(usr.race=="Half Saiyan")
															if(usr.form_6 && M.form_6)
																usr.finalformfuse=1
																usr.HalfSaiyanFuseForm()
																spawn(1500)usr.UnFuse()
																spawn(1500)M.UnFuse()
															else
																spawn(3000)usr.UnFuse()
																spawn(3000)M.UnFuse()
														if(usr.race=="Human")
															if(usr.form_4 && M.form_4)
																usr.finalformfuse=1
																usr.HumanFuseForm()
																spawn(1500)usr.UnFuse()
																spawn(1500)M.UnFuse()
															else
																spawn(3000)usr.UnFuse()
																spawn(3000)M.UnFuse()
													if("No")
														usr << "[M] doesn't want to fuse!"
														usr.asking_fuse = 0
														M.asking_fuse = 0
														return
										else
											usr << "[M] doesn't know how to do the Fusion Dance!"
											usr.asking_fuse = 0
											M.asking_fuse = 0
											return
									else
										usr << "[M] must be the same race as you!"
										usr.asking_fuse = 0
										M.asking_fuse = 0
										return
								else
									usr << "[M.name] wants to fuse with you, but your powerlevels aren't exactly the same!"
									M << "[usr.name] wants to fuse with you, but your powerlevels aren't exactly the same!"
									usr.asking_fuse = 0
									M.asking_fuse = 0
									return
							else
								usr << "You can only Fuse with other players."
								usr.asking_fuse = 0
								M.asking_fuse = 0
								return

mob
	proc
		FusionFollow(mob/M)
			if(!src.fused)return
			loop
			if(src.follow==M.name)
				if(!src.fused)return
				src.loc=M.loc
				sleep(1)
				goto loop
mob
	proc
		UnFuse()
			if(!src)return
			src.finalformfuse=0
			src << "Time's up! You have UnFused!"
			src.follow=""
			src.overlays-=src.overlays
			src.FusionStatLoad()
			sleep(2)
			src.fused=0
			src.frozen=0
			src.doing=0
			src.boxing=0
			src.icon=1
			src.density=1
			src.asking_fuse=0
			src.FuseFollower = 0
			src.dead=0
			src.overlays -= 'Hair - SSJ4(fused).dmi'
			src.overlays -= 'ssj4tail.dmi'
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.form_5 = 0
			src.form_6 = 0
			src.underlays -= src.underlays
			src.overlays -= src.aura
			src.aura = 0
			src.overlays -= 'Elec Blue Small.dmi'
			src.overlays -= 'Elec Blue Big.dmi'
			src.overlays -= 'Elec Red Big.dmi'
			src.overlays -= 'Elec White.dmi'
			src.overlays -= 'Hair - SSJ3.dmi'
			src.overlays -= 'Hair - SSJ4.dmi'
			src.overlays-='Halo.dmi'
			src.overlays-='Halo.dmi'
			src.overlays-='Halo.dmi'
			spawn(1)
				src.Power_Redefine()
				src.Skin_Apply()
				src.Hair_Apply()
mob
	proc
		FusionStatSave()
			var/savefile/S=new("World Save Files/Player Saves/[src.ckey]-Fusion.sav")
			S["name"]<<src.name
			S["level"]<<src.level
			S["powerlevel_max"]<<src.powerlevel_max
			S["ki_max"]<<src.ki_max
			S["kidefense_max"]<<src.kidefense_max
			S["strength_max"]<<src.strength_max
			S["defence_max"]<<src.defence_max
		FusionStatLoad()
			var/savefile/L=new("World Save Files/Player Saves/[src.ckey]-Fusion.sav")
			L["name"]>>src.name
			L["level"]>>src.level
			L["powerlevel_max"]>>src.powerlevel_max
			L["ki_max"]>>src.ki_max
			L["kidefense_max"]>>src.kidefense_max
			L["strength_max"]>>src.strength_max
			L["defence_max"]>>src.defence_max