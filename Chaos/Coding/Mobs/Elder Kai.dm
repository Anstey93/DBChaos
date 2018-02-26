mob/var/mystic = 0
mob/var/gone_mystic = 0
mob
	NPC
		Elder_Kai
			icon_state = "Elder Kai"
			name = "{NPC}Elder Kai"
			density=1
			safe=1
			it_blocked=1
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(src.owner!=usr)
						usr<<"Elder Kai is training with [src.owner]."
						return
					if(src.doing)
						usr<<"Elder Kai is training at the moment."
						return
					if(usr.z_sword_quest)
						if(usr.karma == "Good" && usr.karma_rating >= 30)
							if(usr.race == "Half Saiyan" && usr.powerlevel_max >= 5000000)
								if(!usr.gone_mystic)
									src.doing = 1
									usr << "<font color = white>Elder Kai:</font> Ahhh, I see you are the one who set me free!"
									sleep(25)
									usr << "<font color = white>Elder Kai:</font> You know, I used to train some of the Galaxies Strongest fighters?"
									sleep(25)
									usr << "<font color = white>Elder Kai:</font> If you want, for releasing me, I can teach you how to unlock a Power Deep within?"
									sleep(10)
									switch(alert("Do you wish to train with the Elder Kai?(Training takes 30 minutes)","","Yes","No"))
										if("Yes")
											if(usr.doing)
												return
											usr.mystic = 1
											usr.doing=1
											usr << "<font color = white>Elder Kai:</font> Sit child. The trainging shall begin..."
											spawn(1)usr.HalfSaiyanRevert()
											sleep(30)
											if(!usr)
												del(src)
												return
											usr.frozen=1
											usr.doing=1
											usr.safe=1
											usr.gone_mystic=1
											usr.icon_state="rest"
											usr << "\white You feel some of your true power begin to flow through you..."
											sleep(9000)
											if(!usr)
												del(src)
												return
											usr << "\white You feel some of your true power begin to flow through you..."
											usr.powerlevel+=usr.powerlevel_max*0.1
											usr.powerlevel_max+=usr.powerlevel_max*0.1
											usr.ki+=usr.ki_max*0.1
											usr.ki_max+=usr.ki_max*0.1
											usr.strength+=usr.strength_max*0.1
											usr.strength_max+=usr.strength_max*0.1
											usr.defence+=usr.defence_max*0.1
											usr.defence_max+=usr.defence_max*0.1
											sleep(9000)
											if(!usr)
												del(src)
												return
											usr << "\white The ground shakes as your true power is finally unleashed..."
											Explode(new/Effect/BasicBoom(src.loc,1,4))
											usr.frozen = 0
											usr.safe = 0
											usr.speed_max-=2000
											if(usr.speed_max<1000)
												usr.speed_max=1000
											usr.powerlevel = usr.powerlevel_max
											usr.ki = usr.ki_max
											usr.strength = usr.strength_max
											usr.defence = usr.defence_max
											usr.critical = usr.critical_max
											usr.dodge = usr.dodge_max
											usr.reflect = usr.reflect_max
											usr.block = usr.block_max
											usr << "<font color = white>Elder Kai:</font> Your training is now complete!"
											usr.doing = 0
											usr.frozen = 0
											usr.safe = 0
											usr.mystic = 1
											usr.form_1 = 1
											usr.form_2 = 1
											usr.form_3 = 1
											usr.form_4 = 1
											usr.form_5 = 1
											sleep(5)
											if(!usr)
												del(src)
												return
											spawn(1)usr.client.SaveChar()
											spawn(2)usr.HalfSaiyanTrans()
											sleep(20)
											usr << "<font color = white>Elder Kai:</font> My job here is done. Good luck [usr]."
											del(src)
										if("No")
											usr.frozen = 0
											usr.safe = 0
											del(src)
											return
								else
									usr << "<font color = white>Elder Kai:</font> You can no longer do this special training."
									usr.frozen = 0
									usr.safe = 0
									usr.doing=0
									del(src)
									return
							else
								usr << "<font color = white>Elder Kai:</font> You are not strong enough for this training."
								del(src)
								return
						else
							usr << "<font color = white>Elder Kai:</font> Your heart is not pure enough for my teachings."
							src.doing = 0
							del(src)
							return