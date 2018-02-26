obj
	var
		tmp
			exploded=0
		canfuse=0
mob
	var
		kiuse=0.5
		kill=1
		tmp
			beaming=0
			binded=0
			tech_cooldown=0
			killer=""
	proc
		ThousandSlash()
			var/combocount=0
			src.icon_state="swordcombo"
			comboagain
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				step(M,src.dir)
				M.dir=get_dir(M,src)
				M.powerlevel-=src.strength
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				M.powerlevel-=src.strength*1.02
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				M.powerlevel-=src.strength*1.03
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				step(M,src.dir)
				M.dir=get_dir(M,src)
				M.powerlevel-=src.strength*1.04
				M.DeathCheck(src)
			flick("IT",src)
			src.frozen=0
			step(src,src.dir)
			src.frozen=1
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				M.powerlevel-=src.strength*1.05
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				M.powerlevel-=src.strength*1.06
				M.DeathCheck(src)
			sleep(2)
			combocount+=1
			if(combocount>3)
				src.icon_state="swordcombo6"
				sleep(20)
				src.doing=0
				src.frozen=0
				src.icon_state=""
				return
			else
				goto comboagain
obj
	var
		TargetList=list()
		setpower=500
		clashable=0
		clashing=0
		tmp
			clashrush=1
	Technique
		ThousandSwordSlash
			verb
				Thousand_Sword_Slash()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<usr.ki_max)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.ki=0
					usr.doing=1
					usr.frozen=1
					usr.ThousandSlash()
		Kamehameha
			canfuse=1
			verb
				Kamehameha()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					if((usr.ki*usr.ki)+src.setpower>=100000000)
						src.setpower+=(usr.level*0.1+(usr.ki_skill/4))
						if(usr.race=="Saiyan"&&usr.form_5&&usr.rage_chromosome)
							usr.overlays+='Charge Red.dmi'
						else
							usr.overlays+='Charge Blue.dmi'
					else
						usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/4)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: KA..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: ME..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: HA..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: ME..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.overlays-='Charge Blue.dmi'
					usr.overlays-='Charge Red.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if((usr.ki*usr.ki)+src.setpower>=100000000)
						if(usr.race=="Saiyan"&&usr.form_5&&usr.rage_chromosome)
							src.setpower+=(usr.level*0.1+(usr.ki_skill/10))
							A.TechAttackBeam(usr,"Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"kamehameha10","kamehameha10t",0)
						else
							A.TechAttackBeam(usr,"Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"kamehameha","kamehamehat",0)
					else
						A.TechAttackBeam(usr,"Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"kamehameha","kamehamehat",0)
		GalickGun
			canfuse=1
			verb
				Galick_Gun()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Pink.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: GALICK..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: GUN..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.frozen=1
					usr.overlays-='Charge Pink.dmi'
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Galick Gun",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"galickgun","galickgunt",0)
		FinishBuster
			canfuse=1
			verb
				Finish_Buster()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: FINISH..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: BUSTER..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(30)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Finish Buster",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finishbuster","finishbustert",0)
		FinalFlash
			canfuse=1
			verb
				Final_Flash()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: FINAL..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: FLASH..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ff3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.42+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Final Flash",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finalflash","finalflasht",0)
		FlameBlast
			canfuse=1
			verb
				Hell_Blaze()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: HELL..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: BLAZE..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Hell Blaze",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"hellblaze","hellblazet",0)
		FinalShine
			verb
				Final_Shine()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Green.dmi'
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: FINAL..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: SHINE..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ff3"
					usr.overlays-='Charge Green.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(50)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Final Shine",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finalshine","finalshinet",0)
		DeathBeam
			verb
				Death_Beam()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DEATH..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: BEAM..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="attack"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.42+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Death Beam",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"deathbeam","deathbeamt",0)
		DeathWave
			verb
				Death_Wave()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Charge Pink.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: DEATH..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: WAVE..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Pink.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					spawn(15)
						usr.icon_state=""
						usr.doing=0
						usr.frozen=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.38+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Death Wave",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"deathwave",0)
		SpecialBeamCannon
			verb
				Special_Beam_Cannon()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					var/chargedelay=round(usr.ki_skill/6000/3)
					if(chargedelay>6)
						chargedelay=6
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="sbc1"
					spawn(2)
						usr.icon_state="sbc2"
					view(8)<<"\white [usr]: SPECIAL..."
					sleep(7-chargedelay)
					view(8)<<"\white [usr]: BEAM..."
					sleep(7-chargedelay)
					view(8)<<"\white [usr]: CANNON..."
					sleep(7-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="sbc3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Special Beam Cannon",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"specialbeamcannon","specialbeamcannont","Critical")
		Masenko
			canfuse=1
			verb
				Masenko()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Orange.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>13)
						chargedelay=13
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: MASENKO..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Orange.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					spawn(15)
						usr.icon_state=""
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Masenko",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"masenko","masenkot",0)
		Dodonpa
			verb
				Dodonpa()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>13)
						chargedelay=13
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(4)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: DODONPA..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Dodonpa",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"dodonpa","dodonpat",0)
		CandyRay
			verb
				Candy_Ray()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: CANDY..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: RAY..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.32+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Candy Ray",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"candyray","candyrayt","Candy")
		DragonFist
			verb
				Dragon_Fist()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Fist Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DRAGON..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: FIST..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					flick("attack",usr)
					usr.overlays-='Fist Charge.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(55)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.5+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Dragon Fist",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"dragonfist","dragonfistt","Critical")
		TriBeam
			verb
				Tri_Beam()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>13)
						chargedelay=13
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(4)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: TRIBEAM..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Tri Beam",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"tribeam","tribeamt",0)
		LightGrenade
			verb
				Light_Grenade()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: LIGHT..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: GRENADE..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					spawn(35)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.33+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Light Grenade",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lightgrenade",0)
		WhirlWindSpin
			verb
				Whirlwind_Spin()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+=icon('Techs.dmi',"whirlwindspin")
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: WHIRLWIND SPIN..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"whirlwindspin")
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(25)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Whirlwind Spin",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"whirlwindspin",0)
		KiBlast
			verb
				Ki_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if(usr.legendary_chromosome)
						A.TechAttackStraight(usr,"Ki Blast",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lblast",0)
					else
						A.TechAttackStraight(usr,"Ki Blast",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"blast",0)
		FlameBullet
			verb
				Hell_Blitz()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Hell Blitz",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"blastd",0)
		DistructoDisk
			verb
				Distructo_Disk()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+=icon('Techs.dmi',"distructodisko")
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DISTRUCTO..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: DISK..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"distructodisko")
					usr.frozen=1
					spawn(5)
						usr.frozen=0
						usr.doing=0
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.25+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Distructo Disk",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"distructodisk","Critical")
		KienzanDisk
			verb
				Kienzan_Disk()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+=icon('Techs.dmi',"kienzandisko")
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: KIENZAN..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: DISK..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"kienzandisko")
					usr.frozen=1
					spawn(5)
						usr.frozen=0
						usr.doing=0
					spawn(60)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.23+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Kienzan Disk",usr.ki*(1+usr.kiuse/3)+src.setpower,'Techs.dmi',"kienzandisk","Critical")
		SSDeadlyBomber
			verb
				SS_Deadly_Bomber()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: SS DEADLY BOMBER..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/2))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"SS Deadly Bomber",usr.ki*(1+usr.kiuse/3)+src.setpower,'Techs.dmi',"ssdeadlybomber",0)
		KarmaBomb
			verb
				Negative_Karma_Bomb()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: NEGATIVE..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: KARMA BOMB..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/4))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Karma Bomb",usr.ki*(1+usr.kiuse/3)+src.setpower,'Techs.dmi',"ssdeadlybomber",0)
		ImprisonmentBall
			verb
				Imprisonment_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					spawn(15)
						usr.frozen=0
						usr.doing=0
					spawn(70)
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Imprisonment Ball",'Techs.dmi',"imprisonmentball",usr.ki*usr.kiuse+src.setpower,usr,"Critical")
		GalacticDonut
			verb
				Galactic_Donut()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					spawn(15)
						usr.frozen=0
						usr.doing=0
					spawn(25)
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Galactic Donut",'Techs.dmi',"galaticdonut",usr.ki*usr.kiuse+src.setpower,usr,0)
		DemonShackle
			verb
				Demon_Shackle()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					spawn(15)
						usr.frozen=0
						usr.doing=0
					spawn(25)
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Demon Shackle",'Techs.dmi',"demonshackle",usr.ki*usr.kiuse+src.setpower,usr,0)
		FatWrap
			verb
				Fat_Wrap()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					spawn(5)
						usr.frozen=0
						usr.doing=0
					spawn(25)
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Fat Wrap",'Techs.dmi',"fatwrap",usr.ki*usr.kiuse+src.setpower,usr,0)
		RapidBlast
			verb
				Rapid_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					spawn(17)
						usr.frozen=0
						usr.doing=0
					usr.overlays+='Charge Blue.dmi'
					view(8)<<"\white [usr]: RAPID BLAST!"
					sleep(15)
					usr.overlays-='Charge Blue.dmi'
					var/obj/Tech/KiMissile/A=new
					view(8)<<"\white [usr]: HA!"
					A.icon_state="blastr"
					A.loc=usr.loc
					A.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(5)
					var/obj/Tech/KiMissile/B=new
					view(8)<<"\white [usr]: HA!"
					B.icon_state="blastr"
					B.loc=usr.loc
					B.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(5)
					var/obj/Tech/KiMissile/C=new
					view(8)<<"\white [usr]: HA!"
					C.icon_state="blastr"
					C.loc=usr.loc
					C.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					if(usr.level>500)
						sleep(5)
						var/obj/Tech/KiMissile/D=new
						view(8)<<"\white [usr]: HA!"
						D.icon_state="blastr"
						D.loc=usr.loc
						D.power=usr.ki*0.2+src.setpower
						usr.ki-=usr.ki*0.2
						D.owner=usr
						D.dir=usr.dir
					if(usr.level>750)
						sleep(5)
						var/obj/Tech/KiMissile/E=new
						view(8)<<"\white [usr]: HA!"
						E.icon_state="blastr"
						E.loc=usr.loc
						E.power=usr.ki*0.2+src.setpower
						usr.ki-=usr.ki*0.2
						E.owner=usr
						E.dir=usr.dir
					if(usr.level>1000)
						sleep(5)
						var/obj/Tech/KiMissile/F=new
						view(8)<<"\white [usr]: HA!"
						F.icon_state="blastr"
						F.loc=usr.loc
						F.power=usr.ki*0.2+src.setpower
						usr.ki-=usr.ki*0.2
						F.owner=usr
						F.dir=usr.dir
					spawn(5)
						usr.doing=0
					spawn(30)
						usr.tech_cooldown=0
		ShineMissile
			verb
				Shine_Missile()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<30000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					src.setpower+=(usr.level*0.023+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.overlays+='Charge Yellow.dmi'
					view(8)<<"\white [usr]: SHINE..."
					sleep(10)
					view(8)<<"\white [usr]: SHINE..."
					sleep(13)
					view(8)<<"\white [usr]: MISSILE!"
					sleep(10)
					usr.overlays-='Charge Yellow.dmi'
					var/obj/Tech/KiMissile/A=new
					view(8)<<"\white [usr]: HA!"
					A.loc=usr.loc
					A.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/B=new
					view(8)<<"\white [usr]: HA!"
					B.loc=usr.loc
					B.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/C=new
					view(8)<<"\white [usr]: HA!"
					C.loc=usr.loc
					C.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/D=new
					view(8)<<"\white [usr]: HA!"
					D.loc=usr.loc
					D.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					D.owner=usr
					D.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/E=new
					view(8)<<"\white [usr]: HA!"
					E.loc=usr.loc
					E.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					E.owner=usr
					E.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/F=new
					view(8)<<"\white [usr]: HA!"
					F.loc=usr.loc
					F.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					F.owner=usr
					F.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/G=new
					view(8)<<"\white [usr]: HA!"
					G.loc=usr.loc
					G.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					G.owner=usr
					G.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/H=new
					view(8)<<"\white [usr]: HA!"
					H.loc=usr.loc
					H.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					H.owner=usr
					H.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/I=new
					view(8)<<"\white [usr]: HA!"
					I.loc=usr.loc
					I.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					I.owner=usr
					I.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/J=new
					view(8)<<"\white [usr]: HA!"
					J.loc=usr.loc
					J.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					J.owner=usr
					J.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/K=new
					view(8)<<"\white [usr]: HA!"
					K.loc=usr.loc
					K.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					K.owner=usr
					K.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/L=new
					view(8)<<"\white [usr]: HA!"
					L.loc=usr.loc
					L.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					L.owner=usr
					L.dir=usr.dir
					spawn(5)
						usr.doing=0
					spawn(40)
						usr.tech_cooldown=0
		KiShower
			verb
				Ki_Shower()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<30000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.overlays+='Charge Yellow.dmi'
					view(8)<<"\white [usr]: KI..."
					sleep(10)
					view(8)<<"\white [usr]: SHOWER!"
					sleep(13)
					usr.overlays-='Charge Yellow.dmi'
					var/obj/Tech/KiMissile/A=new
					view(8)<<"\white [usr]: HA!"
					A.loc=usr.loc
					A.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/B=new
					view(8)<<"\white [usr]: HA!"
					B.loc=usr.loc
					B.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/C=new
					view(8)<<"\white [usr]: HA!"
					C.loc=usr.loc
					C.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/D=new
					view(8)<<"\white [usr]: HA!"
					D.loc=usr.loc
					D.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					D.owner=usr
					D.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/E=new
					view(8)<<"\white [usr]: HA!"
					E.loc=usr.loc
					E.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					E.owner=usr
					E.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/F=new
					view(8)<<"\white [usr]: HA!"
					F.loc=usr.loc
					F.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					F.owner=usr
					F.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/G=new
					view(8)<<"\white [usr]: HA!"
					G.loc=usr.loc
					G.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					G.owner=usr
					G.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/H=new
					view(8)<<"\white [usr]: HA!"
					H.loc=usr.loc
					H.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					H.owner=usr
					H.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/I=new
					view(8)<<"\white [usr]: HA!"
					I.loc=usr.loc
					I.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					I.owner=usr
					I.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/J=new
					view(8)<<"\white [usr]: HA!"
					J.loc=usr.loc
					J.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					J.owner=usr
					J.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/K=new
					view(8)<<"\white [usr]: HA!"
					K.loc=usr.loc
					K.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					K.owner=usr
					K.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/L=new
					view(8)<<"\white [usr]: HA!"
					L.loc=usr.loc
					L.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					L.owner=usr
					L.dir=usr.dir
					spawn(5)
						usr.doing=0
					spawn(40)
						usr.tech_cooldown=0
		FlameShower
			verb
				Flame_Shower()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<30000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.overlays+='Charge Yellow.dmi'
					view(8)<<"\white [usr]: FLAME..."
					sleep(10)
					view(8)<<"\white [usr]: SHOWER!"
					sleep(13)
					usr.overlays-='Charge Yellow.dmi'
					var/obj/Tech/KiMissile/A=new
					A.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					A.loc=usr.loc
					A.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/B=new
					B.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					B.loc=usr.loc
					B.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/C=new
					C.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					C.loc=usr.loc
					C.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/D=new
					D.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					D.loc=usr.loc
					D.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					D.owner=usr
					D.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/E=new
					E.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					E.loc=usr.loc
					E.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					E.owner=usr
					E.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/F=new
					F.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					F.loc=usr.loc
					F.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					F.owner=usr
					F.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/G=new
					G.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					G.loc=usr.loc
					G.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					G.owner=usr
					G.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/H=new
					H.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					H.loc=usr.loc
					H.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					H.owner=usr
					H.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/I=new
					I.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					I.loc=usr.loc
					I.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					I.owner=usr
					I.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/J=new
					J.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					J.loc=usr.loc
					J.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					J.owner=usr
					J.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/K=new
					K.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					K.loc=usr.loc
					K.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					K.owner=usr
					K.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/L=new
					L.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					L.loc=usr.loc
					L.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					L.owner=usr
					L.dir=usr.dir
					spawn(5)
						usr.doing=0
					spawn(40)
						usr.tech_cooldown=0
		HellZoneGrenade
			verb
				Hell_Zone_Grenade()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/ScatterBlast/A=new
					var/obj/Tech/ScatterBlast/B=new
					var/obj/Tech/ScatterBlast/C=new
					var/obj/Tech/ScatterBlast/D=new
					var/obj/Tech/ScatterBlast/E=new
					var/obj/Tech/ScatterBlast/F=new
					var/obj/Tech/ScatterBlast/G=new
					var/obj/Tech/ScatterBlast/H=new
					var/obj/Tech/ScatterBlast/I=new
					var/obj/Tech/ScatterBlast/J=new
					var/obj/Tech/ScatterBlast/K=new
					var/obj/Tech/ScatterBlast/L=new
					var/obj/Tech/ScatterBlast/M=new
					var/obj/Tech/ScatterBlast/N=new
					var/obj/Tech/ScatterBlast/O=new
					var/obj/Tech/ScatterBlast/P=new
					var/obj/Tech/ScatterBlast/Q=new
					var/obj/Tech/ScatterBlast/R=new
					var/obj/Tech/ScatterBlast/S=new
					var/obj/Tech/ScatterBlast/T=new
					var/obj/Tech/ScatterBlast/U=new
					var/obj/Tech/ScatterBlast/V=new
					var/obj/Tech/ScatterBlast/W=new
					var/obj/Tech/ScatterBlast/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-4,usr.y+3,usr.z)
					A.dir=NORTHWEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+2,usr.y+5,usr.z)
					B.dir=NORTHEAST
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x,usr.y+2,usr.z)
					C.dir=NORTH
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x-2,usr.y+5,usr.z)
					D.dir=NORTHWEST
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x+4,usr.y+3,usr.z)
					E.dir=NORTHEAST
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-2,usr.y-2,usr.z)
					F.dir=SOUTHWEST
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y-5,usr.z)
					G.dir=SOUTHEAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+4,usr.y,usr.z)
					H.dir=EAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x-4,usr.y,usr.z)
					I.dir=WEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-2,usr.y-5,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x,usr.y+4,usr.z)
					K.dir=NORTH
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+2,usr.y-2,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+2,usr.z)
					M.dir=NORTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y-4,usr.z)
					N.dir=SOUTH
					N.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					O.loc=locate(usr.x+2,usr.y+2,usr.z)
					O.dir=NORTHEAST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					P.loc=locate(usr.x,usr.y-2,usr.z)
					P.dir=SOUTH
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					Q.loc=locate(usr.x-2,usr.y,usr.z)
					Q.dir=WEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					R.loc=locate(usr.x+2,usr.y,usr.z)
					R.dir=EAST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					S.loc=locate(usr.x+4,usr.y-3,usr.z)
					S.dir=SOUTHEAST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					T.loc=locate(usr.x-4,usr.y-3,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					U.loc=locate(usr.x,usr.y+6,usr.z)
					U.dir=NORTH
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					V.loc=locate(usr.x-6,usr.y,usr.z)
					V.dir=WEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					W.loc=locate(usr.x+6,usr.y,usr.z)
					W.dir=EAST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					X.loc=locate(usr.x,usr.y-6,usr.z)
					X.dir=SOUTH
					X.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(15)
					view(8)<<"\white [usr]: SCATTER!"
					spawn(10)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					spawn(50)
						usr.tech_cooldown=0
		GenocideAttack
			verb
				GenocideAttack()
					set category = "Techniques"
					set name = "Genocide Attack"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/GenocideBlast/A=new
					var/obj/Tech/GenocideBlast/B=new
					var/obj/Tech/GenocideBlast/C=new
					var/obj/Tech/GenocideBlast/D=new
					var/obj/Tech/GenocideBlast/E=new
					var/obj/Tech/GenocideBlast/F=new
					var/obj/Tech/GenocideBlast/G=new
					var/obj/Tech/GenocideBlast/H=new
					var/obj/Tech/GenocideBlast/I=new
					var/obj/Tech/GenocideBlast/J=new
					var/obj/Tech/GenocideBlast/K=new
					var/obj/Tech/GenocideBlast/L=new
					var/obj/Tech/GenocideBlast/M=new
					var/obj/Tech/GenocideBlast/N=new
					var/obj/Tech/GenocideBlast/O=new
					var/obj/Tech/GenocideBlast/P=new
					var/obj/Tech/GenocideBlast/Q=new
					var/obj/Tech/GenocideBlast/R=new
					var/obj/Tech/GenocideBlast/S=new
					var/obj/Tech/GenocideBlast/T=new
					var/obj/Tech/GenocideBlast/U=new
					var/obj/Tech/GenocideBlast/V=new
					var/obj/Tech/GenocideBlast/W=new
					var/obj/Tech/GenocideBlast/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-2,usr.y+7,usr.z)
					A.dir=WEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+1,usr.y+6,usr.z)
					B.dir=SOUTH
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x-3,usr.y+8,usr.z)
					C.dir=NORTHWEST
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x+1,usr.y+8,usr.z)
					D.dir=NORTH
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x-1,usr.y+6,usr.z)
					E.dir=SOUTH
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-1,usr.y+8,usr.z)
					F.dir=NORTH
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y+7,usr.z)
					G.dir=EAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+3,usr.y+8,usr.z)
					H.dir=NORTHEAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x,usr.y+5,usr.z)
					I.dir=SOUTHWEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-3,usr.y+6,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x+2,usr.y+5,usr.z)
					K.dir=SOUTHEAST
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+3,usr.y+6,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+5,usr.z)
					M.dir=SOUTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y+7,usr.z)
					N.dir=SOUTHEAST
					N.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(2)
					O.loc=locate(usr.x-2,usr.y+3,usr.z)
					O.dir=SOUTHWEST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					P.loc=locate(usr.x+2,usr.y+3,usr.z)
					P.dir=SOUTHWEST
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					Q.loc=locate(usr.x-3,usr.y+4,usr.z)
					Q.dir=SOUTHWEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					R.loc=locate(usr.x+3,usr.y+4,usr.z)
					R.dir=SOUTHWEST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					S.loc=locate(usr.x-4,usr.y+5,usr.z)
					S.dir=SOUTHWEST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					T.loc=locate(usr.x+4,usr.y+5,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					U.loc=locate(usr.x-1,usr.y+4,usr.z)
					U.dir=SOUTHWEST
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					V.loc=locate(usr.x+1,usr.y+4,usr.z)
					V.dir=SOUTHWEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					W.loc=locate(usr.x-4,usr.y+7,usr.z)
					W.dir=SOUTHWEST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					X.loc=locate(usr.x+4,usr.y+7,usr.z)
					X.dir=SOUTHWEST
					X.power=usr.ki*usr.kiuse+src.setpower
					sleep(15)
					usr.icon_state=""
					view(8)<<"\white [usr]: GENOCIDE ATTACK!"
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(50)
						usr.tech_cooldown=0
		AcidRain
			verb
				Acid_Rain()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/AcidBlast/A=new
					var/obj/Tech/AcidBlast/B=new
					var/obj/Tech/AcidBlast/C=new
					var/obj/Tech/AcidBlast/D=new
					var/obj/Tech/AcidBlast/E=new
					var/obj/Tech/AcidBlast/F=new
					var/obj/Tech/AcidBlast/G=new
					var/obj/Tech/AcidBlast/H=new
					var/obj/Tech/AcidBlast/I=new
					var/obj/Tech/AcidBlast/J=new
					var/obj/Tech/AcidBlast/K=new
					var/obj/Tech/AcidBlast/L=new
					var/obj/Tech/AcidBlast/M=new
					var/obj/Tech/AcidBlast/N=new
					var/obj/Tech/AcidBlast/O=new
					var/obj/Tech/AcidBlast/P=new
					var/obj/Tech/AcidBlast/Q=new
					var/obj/Tech/AcidBlast/R=new
					var/obj/Tech/AcidBlast/S=new
					var/obj/Tech/AcidBlast/T=new
					var/obj/Tech/AcidBlast/U=new
					var/obj/Tech/AcidBlast/V=new
					var/obj/Tech/AcidBlast/W=new
					var/obj/Tech/AcidBlast/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-2,usr.y+7,usr.z)
					A.dir=WEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+1,usr.y+6,usr.z)
					B.dir=SOUTH
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x-3,usr.y+8,usr.z)
					C.dir=NORTHWEST
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x+1,usr.y+8,usr.z)
					D.dir=NORTH
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x-1,usr.y+6,usr.z)
					E.dir=SOUTH
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-1,usr.y+8,usr.z)
					F.dir=NORTH
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y+7,usr.z)
					G.dir=EAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+3,usr.y+8,usr.z)
					H.dir=NORTHEAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x,usr.y+5,usr.z)
					I.dir=SOUTHWEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-3,usr.y+6,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x+2,usr.y+5,usr.z)
					K.dir=SOUTHEAST
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+3,usr.y+6,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+5,usr.z)
					M.dir=SOUTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y+7,usr.z)
					N.dir=SOUTHEAST
					N.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					O.loc=locate(usr.x-2,usr.y+3,usr.z)
					O.dir=SOUTHWEST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					P.loc=locate(usr.x+2,usr.y+3,usr.z)
					P.dir=SOUTHWEST
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					Q.loc=locate(usr.x-3,usr.y+4,usr.z)
					Q.dir=SOUTHWEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					R.loc=locate(usr.x+3,usr.y+4,usr.z)
					R.dir=SOUTHWEST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					S.loc=locate(usr.x-4,usr.y+5,usr.z)
					S.dir=SOUTHWEST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					T.loc=locate(usr.x+4,usr.y+5,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					U.loc=locate(usr.x-1,usr.y+4,usr.z)
					U.dir=SOUTHWEST
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					V.loc=locate(usr.x+1,usr.y+4,usr.z)
					V.dir=SOUTHWEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					W.loc=locate(usr.x-4,usr.y+7,usr.z)
					W.dir=SOUTHWEST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					X.loc=locate(usr.x+4,usr.y+7,usr.z)
					X.dir=SOUTHWEST
					X.power=usr.ki*usr.kiuse+src.setpower
					sleep(15)
					usr.icon_state=""
					view(8)<<"\white [usr]: ACID RAIN!"
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(50)
						usr.tech_cooldown=0
		BurningAttack
			verb
				BurningAttack()
					set category = "Techniques"
					set name = "Burning Attack"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: BURNING..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: ATTACK..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.name="Burning Attack"
					TL.name="Burning Attack"
					T.name="Burning Attack"
					TR.name="Burning Attack"
					L.name="Burning Attack"
					R.name="Burning Attack"
					BL.name="Burning Attack"
					B.name="Burning Attack"
					BR.name="Burning Attack"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		BigBangAttack
			verb
				BigBangAttack()
					set category = "Techniques"
					set name = "Big Bang Attack"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: BIG BANG..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: ATTACK..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.icon_state="bb c"
					TL.icon_state="bb tl"
					T.icon_state="bb t"
					TR.icon_state="bb tr"
					L.icon_state="bb l"
					R.icon_state="bb r"
					BL.icon_state="bb bl"
					B.icon_state="bb b"
					BR.icon_state="bb br"
					C.name="Big Bang Attack"
					TL.name="Big Bang Attack"
					T.name="Big Bang Attack"
					TR.name="Big Bang Attack"
					L.name="Big Bang Attack"
					R.name="Big Bang Attack"
					BL.name="Big Bang Attack"
					B.name="Big Bang Attack"
					BR.name="Big Bang Attack"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		BlasterShell
			verb
				BlasterShell()
					set category = "Techniques"
					set name = "Blaster Shell"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: BLASTER..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: SHELL..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.icon_state="bs c"
					TL.icon_state="bs tl"
					T.icon_state="bs t"
					TR.icon_state="bs tr"
					L.icon_state="bs l"
					R.icon_state="bs r"
					BL.icon_state="bs bl"
					B.icon_state="bs b"
					BR.icon_state="bs br"
					C.name="Blaster Shell"
					TL.name="Blaster Shell"
					T.name="Blaster Shell"
					TR.name="Blaster Shell"
					L.name="Blaster Shell"
					R.name="Blaster Shell"
					BL.name="Blaster Shell"
					B.name="Blaster Shell"
					BR.name="Blaster Shell"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		RevengeDeathBall
			verb
				Revenge_Death_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: REVENGE..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: DEATH BALL..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.icon_state="rb c"
					TL.icon_state="rb tl"
					T.icon_state="rb t"
					TR.icon_state="rb tr"
					L.icon_state="rb l"
					R.icon_state="rb r"
					BL.icon_state="rb bl"
					B.icon_state="rb b"
					BR.icon_state="rb br"
					C.name="Revenge Death Ball"
					TL.name="Revenge Death Ball"
					T.name="Revenge Death Ball"
					TR.name="Revenge Death Ball"
					L.name="Revenge Death Ball"
					R.name="Revenge Death Ball"
					BL.name="Revenge Death Ball"
					B.name="Revenge Death Ball"
					BR.name="Revenge Death Ball"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		DimensionSwordAttack
			verb
				Dimension_Sword_Attack()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DIMENSION..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: SWORD ATTACK..."
					sleep(20-chargedelay)
					view(8)<<"\white [usr]: HA!"
					flick("attack",usr)
					usr.frozen=1
					spawn(5)
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/SwordL/L=new
					var/obj/Tech/BeamH/SwordC/C=new
					var/obj/Tech/BeamH/SwordR/R=new
					L.owner=usr
					C.owner=usr
					R.owner=usr
					L.power=usr.ki*usr.kiuse+usr.ki*0.2
					C.power=usr.ki*usr.kiuse+usr.ki*0.2
					R.power=usr.ki*usr.kiuse+usr.ki*0.2
					L.dir=usr.dir
					L.loc=usr.loc
					C.dir=usr.dir
					C.loc=usr.loc
					R.dir=usr.dir
					R.loc=usr.loc
					switch(usr.dir)
						if(NORTHWEST)
							C.dir = NORTH
							C.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHWEST)
							C.dir = SOUTH
							C.loc=locate(usr.x,usr.y-1,usr.z)
						if(NORTHEAST)
							C.dir = NORTH
							C.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHEAST)
							C.dir = SOUTH
							C.loc=locate(usr.x,usr.y-1,usr.z)
						if(WEST)
							C.dir = WEST
							C.loc=locate(usr.x-1,usr.y,usr.z)
						if(EAST)
							C.dir = EAST
							C.loc=locate(usr.x+1,usr.y,usr.z)
						if(NORTH)
							C.dir = NORTH
							C.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTH)
							C.dir = SOUTH
							C.loc=locate(usr.x,usr.y-1,usr.z)
					if(C.dir==NORTH)
						L.loc=locate(C.x-1,C.y,C.z)
						R.loc=locate(C.x+1,C.y,C.z)
					if(C.dir==SOUTH)
						L.loc=locate(C.x+1,C.y,C.z)
						R.loc=locate(C.x-1,C.y,C.z)
					if(C.dir==EAST)
						L.loc=locate(C.x,C.y+1,C.z)
						R.loc=locate(C.x,C.y-1,C.z)
					if(C.dir==WEST)
						L.loc=locate(C.x,C.y-1,C.z)
						R.loc=locate(C.x,C.y+1,C.z)
		SwordSlash
			verb
				SwordSlash()
					set category = "Techniques"
					set name = "Sword Slash"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn((usr.speed/1000)*2)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/LSword/L=new
					L.owner=usr
					L.power=(usr.ki*usr.kiuse)+usr.strength*0.05
					L.dir=usr.dir
					switch(usr.dir)
						if(NORTHWEST)
							L.dir = NORTH
							L.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHWEST)
							L.dir = SOUTH
							L.loc=locate(usr.x,usr.y-1,usr.z)
						if(NORTHEAST)
							L.dir = NORTH
							L.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHEAST)
							L.dir = SOUTH
							L.loc=locate(usr.x,usr.y-1,usr.z)
						if(WEST)
							L.dir = WEST
							L.loc=locate(usr.x-1,usr.y,usr.z)
						if(EAST)
							L.dir = EAST
							L.loc=locate(usr.x+1,usr.y,usr.z)
						if(NORTH)
							L.dir = NORTH
							L.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTH)
							L.dir = SOUTH
							L.loc=locate(usr.x,usr.y-1,usr.z)
					flick("attack",usr)
obj
	Tech
		BeamH
			LSword
				icon = 'Techs.dmi'
				icon_state = "swordslash"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Sword Slash",src.power,src.owner)
			SwordL
				icon = 'Dimension Sword Attack.dmi'
				icon_state = "l"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Dimension Sword Attack",src.power,src.owner)
			SwordC
				icon = 'Dimension Sword Attack.dmi'
				icon_state = "c"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Dimension Sword Attack",src.power,src.owner)
			SwordR
				icon = 'Dimension Sword Attack.dmi'
				icon_state = "r"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Dimension Sword Attack",src.power,src.owner)

			BangTL
				icon = 'Burning Attack.dmi'
				icon_state = "ba tl"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangT
				icon = 'Burning Attack.dmi'
				icon_state = "ba t"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangTR
				icon = 'Burning Attack.dmi'
				icon_state = "ba tr"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangL
				icon = 'Burning Attack.dmi'
				icon_state = "ba l"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangC
				icon = 'Burning Attack.dmi'
				icon_state = "ba c"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack(src.name,src.power,src.owner)
			BangR
				icon = 'Burning Attack.dmi'
				icon_state = "ba r"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangBL
				icon = 'Burning Attack.dmi'
				icon_state = "ba bl"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangB
				icon = 'Burning Attack.dmi'
				icon_state = "ba b"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangBR
				icon = 'Burning Attack.dmi'
				icon_state = "ba br"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
		ScatterBlast
			icon='Techs.dmi'
			icon_state="scatter"
			name="Scatter Shot"
			New()
				..()
				spawn(63)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)
		KiMissile
			icon='Techs.dmi'
			icon_state="blast"
			name="Ki Missile"
			New()
				..()
				spawn(1)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)
		GenocideBlast
			icon='Techs.dmi'
			icon_state="genocide"
			name="Genocide Attack"
			New()
				..()
				spawn(63)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)
		AcidBlast
			icon='Techs.dmi'
			icon_state="acid"
			name="Acid Rain"
			New()
				..()
				spawn(63)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)
	proc
		ExplodeDamage(mob/M,Range,Damage)
			var/mob/O=src.owner
			if(!O)return
			if(src.exploded)return
			src.exploded=1
			for(var/mob/Y in oview(Range,src))
				if(M)
					if(Y==M)
						continue
				if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
					var/damage=(Damage-Y.kidefense)/1+get_dist(src,Y)
					if(damage<1)
						damage=1
					Y.powerlevel-=damage
					Y<<"<font color = red>[O]'s [src.name]'s explosion damages you!"
					if(O.kill)
						Y.DeathCheck(O)
					else
						spawn(0)Y.KO()
		Scatter(mob/O)
			if(!O)
				del(src)
				return
			src.owner=O
			src.range=0
			while(src)
				if(!src.owner)
					del(src)
					break
				src.target=O.target
				src.range+=1
				var/Found=FALSE
				var/hastarget=0
				for(var/mob/ST in view(8,src))
					if(istype(ST,/mob/NPC))continue
					if(ST.FuseFollower)continue
					if(ST==src.target)
						if(ST.pk&&ST!=O)
							hastarget=1
				for(var/mob/M in view(8,src))
					if(istype(M,/mob/NPC))continue
					if(M.FuseFollower)continue
					if(hastarget)
						step_towards(src,src.target)
						Found=TRUE
					if(!hastarget)
						if(M==O)continue
						if(istype(M,/mob/PC))
							if(O.in_guild&&!O.attackguild&&M.guild==O.guild)
								Found=FALSE
							else
								if(O.in_party&&!O.attackparty&&M.party_name==O.party_name)
									Found=FALSE
								else
									step_towards(src,M)
									Found=TRUE
						else
							step_towards(src,M)
							Found=TRUE
					break
				if(Found!=TRUE)
					step(src,src.dir)
				var/turf/T=src.loc
				if(!T.density&&src.power>=50000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					if(M!=O||M==O&&src.range>=15)
						spawn(1)del(src)
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							if(M.kiabsorb)
								var/absorbpower=M.kidefense*0.5+M.ki*0.15
								var/absorbdamage=src.power-absorbpower
								if(absorbpower>=src.power)
									M.ki+=src.power
									if(M.ki>M.ki_max*2)
										M<<"Your body can't handle anymore ki!"
										M.powerlevel=0
										M.DeathCheck(O)
								else
									M.powerlevel-=absorbdamage
									M << "<font color = red>[O]'s [src.name] hits you!"
									O << "<font color = red>Your [src.name] hits [M]!"
									if(O.kill)
										M.DeathCheck(O)
									else
										spawn(0)M.KO()
							else
								if(M.Dodge_Attack(src.owner)==TRUE)
									flick("IT",M)
									switch(src.dir)
										if(WEST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(EAST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(NORTH)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTH)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
										if(NORTHWEST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(NORTHEAST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(SOUTHEAST)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTHWEST)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
								else
									var/damage=src.power-M.kidefense
									if(damage<1)
										damage=1
									M.powerlevel-=damage
									M << "<font color = red>[O]'s [src.name] hits you!"
									O << "<font color = red>Your [src.name] hits [M]!"
									if(O.kill)
										M.DeathCheck(O)
									else
										spawn(0)M.KO()
							if(src.power>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=src.loc
							else
								if(src.power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=src.loc
						var/drange=1
						if(src.power>=10000000)
							drange=2
						if(src.power>=20000000)
							drange=3
						if(src.power>=30000000)
							drange=4
						if(src.power>=40000000)
							drange=5
						if(src.power>=50000000)
							drange=6
						if(src.power>=60000000)
							drange=7
						if(src.power>=70000000)
							drange=8
						for(var/obj/Buildings/DE in oview(drange,src))
							DE.hp-=src.power/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						src.ExplodeDamage(M,drange,src.power)
					break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(src.power>=10000000)
							drange=2
						if(src.power>=20000000)
							drange=3
						if(src.power>=30000000)
							drange=4
						if(src.power>=40000000)
							drange=5
						if(src.power>=50000000)
							drange=6
						if(src.power>=60000000)
							drange=7
						if(src.power>=70000000)
							drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				if(src.range>=25)
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
					if(src.power>=10000000)
						drange=2
					if(src.power>=20000000)
						drange=3
					if(src.power>=30000000)
						drange=4
					if(src.power>=40000000)
						drange=5
					if(src.power>=50000000)
						drange=6
					if(src.power>=60000000)
						drange=7
					if(src.power>=70000000)
						drange=8
					for(var/obj/Buildings/DE in oview(drange,src))
						DE.hp-=src.power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					src.ExplodeDamage(0,drange,src.power)
					del(src)
					break
				sleep(1)
		BindAttack(Z=0,I=0,IS=0,Power=0,mob/O,Effect=0)
			src.owner=O
			O.ki-=O.ki*O.kiuse
			src.power=Power
			src.icon=I
			src.icon_state=IS
			src.range=0
			src.name=Z
			src.dir=O.dir
			src.loc=O.loc
			while(src)
				if(!src.owner)
					del(src)
					break
				src.target=O.target
				src.range+=1
				step(src,src.dir)
				var/turf/T=src.loc
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					spawn(1)
						del(src)
						break
					if(M.pk&&!M.safe&&!M.dead&&!M.binded)
						view(8)<<"\white [O] has binded [M]!"
						M.binded=1
						M.doing+=1
						if(Z=="Imprisonment Ball")
							M.overlays+=icon('Techs.dmi',"imprisonmentball")
						if(Z=="Galactic Donut")
							M.overlays+=icon('Techs.dmi',"galaticdonut")
						if(Z=="Demon Shackle")
							M.overlays+=icon('Techs.dmi',"demonshackle")
						var/damage=(src.power-(M.kidefense+M.strength*0.2+M.ki*0.1))
						if(Effect=="Critical")
							if(prob(40))
								damage=(src.power*2-(M.kidefense+M.strength*0.2+M.ki*0.1))
						if(damage<=0)
							damage=0
							flick("enrage",M)
							M.overlays-=icon('Techs.dmi',"imprisonmentball")
							M.overlays-=icon('Techs.dmi',"galaticdonut")
							M.overlays-=icon('Techs.dmi',"demonshackle")
							view(8)<<"\white [M] has broken free!"
							M.binded=0
							M.doing-=1
						else
							var/timer=100
							if(damage<M.strength*0.9)
								timer=80
							if(damage<M.strength*0.7)
								timer=60
							if(damage<M.strength*0.5)
								timer=40
							if(damage<M.strength*0.3)
								timer=20
							if(damage<M.strength*0.1)
								timer=10
							if(Z=="Imprisonment Ball")
								spawn(0)M.BindTimer(O,timer,damage/3)
							else
								spawn(0)M.BindTimer(O,timer,0)
				if(src.range>=20)
					del(src)
					break
				sleep(1)
		BangAttack(Z=0,Power=0,mob/O)
			src.clashable=0
			src.owner=O
			src.power=Power
			src.range=0
			src.name=Z
			O.ki-=O.ki*O.kiuse
			src.dir=O.dir
			src.loc=O.loc
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(src)
					if(!src.owner)
						src.TrailDelete()
						del(src)
						break
					src.range+=1
					var/turf/T=src.loc
					if(!T.density)
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
					for(var/mob/M in T)
						if(M.FuseFollower)continue
						var/mob/OW=src.owner
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							var/damage=src.power-M.kidefense
							var/apower=src.power
							if(damage<1)
								damage=1
							src.power-=M.powerlevel
							M.powerlevel-=damage
							M << "<font color = red>[OW]'s [src.name] hits you!"
							OW << "<font color = red>Your [src.name] hits [M]!"
							if(O.kill)
								M.DeathCheck(OW)
							else
								spawn(0)M.KO()
							if(apower>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=src.loc
							else
								if(src.power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=src.loc
							var/drange=1
							if(apower>=10000000)
								drange=2
							if(apower>=20000000)
								drange=3
							if(apower>=30000000)
								drange=4
							if(apower>=40000000)
								drange=5
							if(apower>=50000000)
								drange=6
							if(apower>=60000000)
								drange=7
							if(apower>=70000000)
								drange=8
							src.ExplodeDamage(M,drange,apower)
							if(src.power<=0)
								src.TrailDelete()
								break
						else
							src.TrailDelete()
							break
					for(var/obj/Buildings/DE in T)
						var/mob/DEO=src.owner
						if(!DEO.see_invisible)
							if(istype(DE,/obj/Buildings)&&DE.invisibility)
								continue
						DE.hp-=src.power
						if(DE.DestroyIt()==TRUE)
							var/drange=1
							if(src.power>=10000000)
								drange=2
							if(src.power>=20000000)
								drange=3
							if(src.power>=30000000)
								drange=4
							if(src.power>=40000000)
								drange=5
							if(src.power>=50000000)
								drange=6
							if(src.power>=60000000)
								drange=7
							if(src.power>=70000000)
								drange=8
							for(var/obj/Buildings/DE2 in oview(drange,DE))
								DE2.hp-=src.power/(1+get_dist(src,DE2))
								spawn(0)DE2.DestroyIt()
							src.ExplodeDamage(0,drange,src.power)
							DEO.frozen=0
							DEO.doing=0
							DEO.icon_state=""
							src.TrailDelete()
							break
					if(src.power<=0)
						src.TrailDelete()
						break
					if(src.range>=20)
						if(src.power>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
						if(src.power>=10000000)
							drange=2
						if(src.power>=20000000)
							drange=3
						if(src.power>=30000000)
							drange=4
						if(src.power>=40000000)
							drange=5
						if(src.power>=50000000)
							drange=6
						if(src.power>=60000000)
							drange=7
						if(src.power>=70000000)
							drange=8
						for(var/obj/Buildings/DE2 in oview(drange,src))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						src.TrailDelete()
						break
					step(src,src.dir)
					sleep(1)
		BangAttack2(Z=0,Power=0,mob/O)
			src.clashable=0
			src.owner=O
			src.power=Power
			src.range=0
			src.name=Z
			src.dir=O.dir
			src.loc=O.loc
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(!src.owner)
					src.TrailDelete()
					del(src)
					break
				src.range+=1
				var/turf/T=src.loc
				if(!T.density)
					T.overlays+='Dirt.dmi'
					T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					var/mob/OW=src.owner
					if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
						var/damage=src.power-M.kidefense
						var/apower=src.power
						if(damage<1)
							damage=1
						src.power-=M.powerlevel
						M.powerlevel-=damage
						M << "<font color = red>[OW]'s [src.name] hits you!"
						OW << "<font color = red>Your [src.name] hits [M]!"
						if(O.kill)
							M.DeathCheck(OW)
						else
							spawn(0)M.KO()
						if(apower>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
						if(apower>=10000000)
							drange=2
						if(apower>=20000000)
							drange=3
						if(apower>=30000000)
							drange=4
						if(apower>=40000000)
							drange=5
						if(apower>=50000000)
							drange=6
						if(apower>=60000000)
							drange=7
						if(apower>=70000000)
							drange=8
						src.ExplodeDamage(M,drange,apower)
						if(src.power<=0)
							src.TrailDelete()
							break
					else
						src.TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(src.power>=10000000)
							drange=2
						if(src.power>=20000000)
							drange=3
						if(src.power>=30000000)
							drange=4
						if(src.power>=40000000)
							drange=5
						if(src.power>=50000000)
							drange=6
						if(src.power>=60000000)
							drange=7
						if(src.power>=70000000)
							drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,src.dir))
					if(N.kiabsorb)
						var/mob/OW=src.owner
						var/absorbpower=N.kidefense*0.5+N.ki*0.15
						var/absorbdamage=src.power-absorbpower
						if(absorbpower>=src.power)
							N.ki+=src.power
							if(N.ki>N.ki_max*2)
								N<<"Your body can't handle anymore ki!"
								N.powerlevel=0
								N.DeathCheck(O)
						else
							N.powerlevel-=absorbdamage
							N << "<font color = red>[OW]'s [src.name] hits you!"
							OW << "<font color = red>Your [src.name] hits [N]!"
							if(O.kill)
								N.DeathCheck(OW)
							else
								spawn(0)N.KO()
						src.TrailDelete()
						break
					else
						if(N.Dodge_Attack(src.owner)==TRUE)
							flick("IT",N)
							switch(src.dir)
								if(WEST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
									else
										N.loc=locate(N.x,N.y-2,N.z)
								if(EAST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
									else
										N.loc=locate(N.x,N.y-2,N.z)
								if(NORTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
									else
										N.loc=locate(N.x-2,N.y,N.z)
								if(SOUTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
									else
										N.loc=locate(N.x-2,N.y,N.z)
				for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
					if(src.power<C.power)
						if(src.power>=20000000)
							var/obj/techs/Overlays/Crater_Center/CR=new
							CR.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/CR=new
								CR.loc=src.loc
						var/drange=1
						var/explosion=src.power+(C.power-src.power)
						if(explosion>=10000000)
							drange=2
						if(explosion>=20000000)
							drange=3
						if(explosion>=30000000)
							drange=4
						if(explosion>=40000000)
							drange=5
						if(explosion>=50000000)
							drange=6
						if(explosion>=60000000)
							drange=7
						if(explosion>=70000000)
							drange=8
						C.power-=src.power
						src.ExplodeDamage(0,drange,src.power)
						src.TrailDelete()
						break
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					src.TrailDelete()
					break
				step(src,src.dir)
				sleep(1)
		SwordAttack(Z=0,Power=0,mob/O)
			src.clashable=0
			src.owner=O
			src.power=Power
			src.range=0
			src.name=Z
			O.ki-=O.ki*O.kiuse
			src.dir=O.dir
			while(src)
				if(!src.owner)
					src.TrailDelete()
					del(src)
					break
				src.range+=1
				var/turf/T=src.loc
				if(!T.density&&src.power>50000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					var/mob/OW=src.owner
					if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
						var/damage=src.power-M.kidefense
						if(damage<1)
							damage=1
						src.power-=M.powerlevel
						M.powerlevel-=damage
						M << "<font color = red>[OW]'s [src.name] hits you!"
						OW << "<font color = red>Your [src.name] hits [M]!"
						if(O.kill)
							M.DeathCheck(OW)
						else
							spawn(0)M.KO()
						if(src.power<=0)
							src.TrailDelete()
							break
					else
						src.TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(src.power>=10000000)
							drange=2
						if(src.power>=20000000)
							drange=3
						if(src.power>=30000000)
							drange=4
						if(src.power>=40000000)
							drange=5
						if(src.power>=50000000)
							drange=6
						if(src.power>=60000000)
							drange=7
						if(src.power>=70000000)
							drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,src.dir))
					if(N.Dodge_Attack(src.owner)==TRUE)
						flick("IT",N)
						switch(src.dir)
							if(WEST)
								if(prob(50))
									N.loc=locate(N.x,N.y+2,N.z)
								else
									N.loc=locate(N.x,N.y-2,N.z)
							if(EAST)
								if(prob(50))
									N.loc=locate(N.x,N.y+2,N.z)
								else
									N.loc=locate(N.x,N.y-2,N.z)
							if(NORTH)
								if(prob(50))
									N.loc=locate(N.x+2,N.y,N.z)
								else
									N.loc=locate(N.x-2,N.y,N.z)
							if(SOUTH)
								if(prob(50))
									N.loc=locate(N.x+2,N.y,N.z)
								else
									N.loc=locate(N.x-2,N.y,N.z)
				for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
					if(src.power<C.power)
						C.power-=src.power
						src.TrailDelete()
						break
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					src.TrailDelete()
					break
				step(src,src.dir)
				sleep(1)
obj
	proc
		UpdateBombTrails()
			for(var/obj/Tech/BeamH/BangTL/TL in world)
				if(TL.owner==src.owner)
					TL.loc=locate(src.x-1,src.y+1,src.z)
			for(var/obj/Tech/BeamH/BangT/T in world)
				if(T.owner==src.owner)
					T.loc=locate(src.x,src.y+1,src.z)
			for(var/obj/Tech/BeamH/BangTR/TR in world)
				if(TR.owner==src.owner)
					TR.loc=locate(src.x+1,src.y+1,src.z)
			for(var/obj/Tech/BeamH/BangL/L in world)
				if(L.owner==src.owner)
					L.loc=locate(src.x-1,src.y,src.z)
			for(var/obj/Tech/BeamH/BangR/R in world)
				if(R.owner==src.owner)
					R.loc=locate(src.x+1,src.y,src.z)
			for(var/obj/Tech/BeamH/BangBL/BL in world)
				if(BL.owner==src.owner)
					BL.loc=locate(src.x-1,src.y-1,src.z)
			for(var/obj/Tech/BeamH/BangB/B in world)
				if(B.owner==src.owner)
					B.loc=locate(src.x,src.y-1,src.z)
			for(var/obj/Tech/BeamH/BangBR/BR in world)
				if(BR.owner==src.owner)
					BR.loc=locate(src.x+1,src.y-1,src.z)
			spawn(1)src.UpdateBombTrails()
		TrailDelete()
			var/mob/M=src.owner
			spawn(0)M.TrailDelete2()
			spawn(0)
				for(var/obj/Tech/BeamT/T1 in world)
					if(T1.owner==src.owner)
						del(T1)
				for(var/obj/Tech/T2 in world)
					if(T2.owner==src.owner)
						del(T2)
				for(var/obj/Tech/T3 in world)
					if(T3.owner==src.owner)
						del(T3)
				del(src)
mob
	proc
		UnFreeze(T)
			sleep(T)
			src.beaming=0
			src.frozen=0
			src.doing=0
			src.icon_state=""
		DeleteTrails()
			sleep(0)
			src.overlays-=icon('Techs.dmi',"kamehamehaki")
			src.overlays-=icon('Techs.dmi',"kamehameha10ki")
			src.overlays-=icon('Techs.dmi',"finishbusterki")
			src.overlays-=icon('Techs.dmi',"galickgunki")
			src.overlays-=icon('Techs.dmi',"finalflashki")
			src.overlays-=icon('Techs.dmi',"finalshineki")
			src.overlays-=icon('Techs.dmi',"masenkoki")
			src.overlays-=icon('Techs.dmi',"hellblazeki")
			src.overlays-=icon('Techs.dmi',"tribeamki")
			src.overlays-=icon('Techs.dmi',"specialbeamcannonki")
			src.overlays-=icon('Techs.dmi',"fakemoono")
			src.beaming=0
			for(var/obj/Tech/BeamT/BT in world)
				if(BT.owner==src)
					del(BT)
		TrailDelete2()
			sleep(0)
			src.overlays-=icon('Techs.dmi',"kamehamehaki")
			src.overlays-=icon('Techs.dmi',"kamehameha10ki")
			src.overlays-=icon('Techs.dmi',"finishbusterki")
			src.overlays-=icon('Techs.dmi',"galickgunki")
			src.overlays-=icon('Techs.dmi',"finalflashki")
			src.overlays-=icon('Techs.dmi',"finalshineki")
			src.overlays-=icon('Techs.dmi',"masenkoki")
			src.overlays-=icon('Techs.dmi',"hellblazeki")
			src.overlays-=icon('Techs.dmi',"tribeamki")
			src.overlays-=icon('Techs.dmi',"specialbeamcannonki")
			src.overlays-=icon('Techs.dmi',"fakemoono")
			src.beaming=0
			for(var/obj/Tech/T1 in world)
				if(T1.owner==src)
					del(T1)
obj
	Tech
		icon='Techs.dmi'
		BeamH
			layer=49
			New()
				..()
				spawn(700)del(src)
		BeamT
			layer=48
			New()
				..()
				spawn(700)del(src)
		BindTech
			layer=100
			New()
				..()
				spawn(700)del(src)
		BeamC
			layer=40
			New()
				..()
				spawn(700)del(src)
turf
	proc
		RemoveDirt(T)
			spawn(T)src.overlays-='Dirt.dmi'
obj/Technique/SolarFlare
	verb
		Solar_Flare()
			set category = "Techniques"
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr << "You are already doing something."
				return
			if(usr.dead)
				return
			if(usr.ki_lock)
				return
			if(!usr.pk)
				usr << "You are not a Combatant!"
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in view(8))
					usr << "Safe Zone!"
					return
			if(usr.ki < 50000)
				usr<<"Your ki is too low."
				return
			var/damage=usr.ki*usr.kiuse/2
			usr.ki -= damage
			usr.frozen = 1
			usr.doing = 1
			usr.tech_cooldown=1
			view(8) << "<font color = white>[usr]:</font> SOLAR..."
			sleep(20)
			view(8) << "<font color = white>[usr]:</font> FLARE!"
			usr.frozen = 0
			spawn(25)usr.doing = 0
			for(var/mob/M in view(8))
				if(M.pk && !M.dead)
					if(M != usr)
						if((M.ki/3) < damage)
							M << "[usr] has blinded you!"
							M.sight |= BLIND
							sleep(50)
							M.sight &= ~BLIND
			spawn(35)usr.tech_cooldown=0
obj/Technique/DeathBall
	verb/Death_Ball()
		set category = "Techniques"
		if(usr.karma == "Good")
			src << "You must be Evil to use the Spirit Bomb technique"
			return
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr << "You can't use ki right now."
			return
		if(usr.safe)
			usr << "You can't attack right now."
			return
		if(!usr.pk)
			usr << "Reach level 75 to be able to use battle techniques."
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into a Death Ball!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_death_ball/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Death Ball?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_death_ball/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_death_ball/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Death Ball Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr << "<font size = -1><B>Your Death Ball is complete!"
						var/obj/techs/Overlays/Death_Ball_Center/S=new
						S.name="Death Ball"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)
obj/Technique/SpiritBomb
	verb/Spirit_Bomb()
		set category = "Techniques"
		if(usr.karma == "Evil")
			src << "You must be Good to use the Spirit Bomb technique"
			return
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr << "You can't use ki right now."
			return
		if(usr.safe)
			usr << "You can't attack right now."
			return
		if(!usr.pk)
			usr << "Reach level 75 to be able to use battle techniques."
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into a Spirit Bomb!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_spirit_bomb/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Spirit Bomb?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_spirit_bomb/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_spirit_bomb/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Spirit Bomb Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr << "<font size = -1><B>Your Spirit Bomb is complete!"
						var/obj/techs/Overlays/Spirit_Bomb_Center/S=new
						S.name="Spirit Bomb"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)
obj/Technique/SuperNova
	verb/Super_Nova()
		set category = "Techniques"
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr << "You can't use ki right now."
			return
		if(usr.safe)
			usr << "You can't attack right now."
			return
		if(!usr.pk)
			usr << "Reach level 75 to be able to use battle techniques."
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into a Super Nova!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_super_nova/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Super Nova?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_super_nova/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_super_nova/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Super Nova Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr << "<font size = -1><B>Your Super Nova is complete!"
						var/obj/techs/Overlays/Super_Nova_Center/S=new
						S.name="Super Nova"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)
obj/Technique/AcidBomb
	verb/Acid_Bomb()
		set category = "Techniques"
		var/db_damage = usr.ki*0.55
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr << "You can't use ki right now."
			return
		if(usr.safe)
			usr << "You can't attack right now."
			return
		if(!usr.pk)
			usr << "Reach level 75 to be able to use battle techniques."
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into an Acid Bomb!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_acid_bomb/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Acid Bomb?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_acid_bomb/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_acid_bomb/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Acid Bomb Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr << "<font size = -1><B>Your Acid Bomb is complete!"
						var/obj/techs/Overlays/Acid_Bomb_Center/S=new
						S.name="Super Nova"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)
obj/Technique/SpiritBall
	verb/Spirit_Ball()
		set category = "Techniques"
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<20000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr << "You can't use ki right now."
			return
		if(usr.safe)
			usr << "You can't attack right now."
			return
		if(!usr.pk)
			usr << "Reach level 75 to be able to use battle techniques."
			return
		var/db_damage=usr.ki*0.3
		if(db_damage>0)
			usr<<"<font size = -1><B>You begin to concentrate your energy into a Spirit Ball!"
			usr.ki-=usr.ki*0.3
			usr.frozen=1
			usr.doing=1
			usr.icon_state="attack"
			usr.overlays+=icon('Techs.dmi',"spiritballo")
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue charging your Spirit Ball?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.055)
							usr<<"Your ki is too low."
							usr.overlays-=icon('Techs.dmi',"spiritballo")
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.05
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=20000)
								usr<<"Your ki is too low."
								usr.overlays -= icon('Techs.dmi',"spiritballo")
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,6)
								if(chance == 6)
									missile('Spirit Bomb Energy.dmi',T,src)
									db_damage += usr.ki_max * 0.05
					else
						usr.overlays-=icon('Techs.dmi',"spiritballo")
						usr.charging=0
						usr.firing_bomb=1
						var/obj/Tech/BeamH/S=new
						S.icon='Techs.dmi'
						S.icon_state="spiritball"
						S.name="Spirit Ball"
						S.range=0
						S.owner=usr
						S.dir=usr.dir
						S.power=db_damage
						S.loc=usr.loc
						spawn(1)S.BombShot()
				sleep(35)
obj
	proc
		BombShot()
			var/mob/OW=src.owner
			var/oldeye=OW.client.eye
			OW.client.perspective=EYE_PERSPECTIVE
			OW.client.eye=src
			var/maxrange=50
			if(src.power>=30000000)
				maxrange=100
			if(src.power>=75000000)
				maxrange=150
			if(src.power>=100000000)
				maxrange=200
			if(src.power>=130000000)
				maxrange=250
			if(src.power>=180000000)
				maxrange=300
			while(src)
				src.range+=1
				step(src,src.dir)
				for(var/mob/M in oview(1,src))
					if(M.safe)continue
					if(M.FuseFollower)continue
					if(M.dead)continue
					if(M!=OW||M==OW&&src.range>=10)
						OW.client.perspective=EDGE_PERSPECTIVE
						OW.client.eye=oldeye
						spawn(1)del(src)
						if(M.pk)
							OW.doing=0
							OW.frozen=0
							OW.icon_state = ""
							OW.tech_cooldown=0
							var/damage=src.power-M.kidefense
							if(damage<1)
								damage=1
							M.powerlevel-=damage
							M << "<font color = red>[OW]'s [src.name] hits you!"
							OW << "<font color = red>Your [src.name] hits [M]!"
							M.DeathCheck(OW)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
							var/drange=1
							if(src.power>=10000000)
								drange=2
							if(src.power>=20000000)
								drange=3
							if(src.power>=30000000)
								drange=4
							if(src.power>=40000000)
								drange=5
							if(src.power>=50000000)
								drange=6
							if(src.power>=60000000)
								drange=7
							if(src.power>=70000000)
								drange=8
							for(var/mob/Y in oview(src,drange))
								if(Y!=M)
									if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
										var/damage2=(src.power-Y.kidefense)/get_dist(src,Y)
										if(damage2<1)
											damage2=1
										Y.powerlevel-=damage2
										Y<<"<font color = red>[OW]'s [src.name]'s explosion damages you!"
										Y.DeathCheck(OW)
							for(var/obj/techs/Overlays/B in world)
								if(B.owner==OW)
									del(B)
						else
							OW.doing=0
							OW.frozen=0
							OW.icon_state = ""
							OW.tech_cooldown=0
							for(var/obj/techs/Overlays/B in world)
								if(B.owner==OW)
									del(B)
						break
				if(src.range>=maxrange)
					OW.client.perspective=EDGE_PERSPECTIVE
					OW.client.eye=oldeye
					OW.doing=0
					OW.frozen=0
					OW.icon_state = ""
					OW.tech_cooldown=0
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
					if(src.power>=10000000)
						drange=2
					if(src.power>=20000000)
						drange=3
					if(src.power>=30000000)
						drange=4
					if(src.power>=40000000)
						drange=5
					if(src.power>=50000000)
						drange=6
					if(src.power>=60000000)
						drange=7
					if(src.power>=70000000)
						drange=8
					for(var/mob/Y in oview(src,drange))
						if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
							var/damage=(src.power-Y.kidefense)/get_dist(src,Y)
							if(damage<1)
								damage=1
							Y.powerlevel-=damage
							Y<<"<font color = red>[OW]'s [src.name]'s explosion damages you!"
							if(OW.kill)
								Y.DeathCheck(OW)
							else
								spawn(0)Y.KO()
					del(src)
					for(var/obj/techs/Overlays/B in world)
						if(B.owner==OW)
							del(B)
					break
				sleep(1)
mob/var/tmp/clasharrow=""
mob/var/sauzer_blade = 0
mob/var/sword_power = 0
mob/var/demon_sword = 0
mob/var/regen=0
obj/Technique/SauzerBlade
	verb
		Sauzer_Blade()
			set category = "Techniques"
			var/ki_cost = usr.ki_max * 0.15
			usr.sword_power = usr.strength_max * 1.3
			if(usr.doing)
				src << "You are already doing something!"
				return
			if(usr.buku)
				return
			if(usr.ki_lock)
				usr << "Cannot use this Technique at his time."
				return
			if(!usr.sauzer_blade)
				if(usr.ki < ki_cost)
					usr << "You do not have enough Ki to sustain the Sauzer Blade."
					return
				usr << "You wear your Sauzer Blade."
				usr.overlays += 'Sauzer Blade.dmi'
				usr.sauzer_blade = 1
				usr.strength += usr.sword_power
				spawn(1)usr.Sauzer_Cost()
			else
				usr << "You stop using your Sauzer Blade."
				usr.overlays -= 'Sauzer Blade.dmi'
				usr.strength -= usr.sword_power
				usr.sauzer_blade = 0
				return
mob
	proc/Sauzer_Cost()
		var/ki_cost = round(src.ki_max * 0.07)
		if(ki_cost <= 0)
			ki_cost = 1
		if(src.sauzer_blade)
			if(src.ki >= ki_cost)
				src.ki -= ki_cost
				sleep(50)
				src.Sauzer_Cost()
			else
				src << "You do not have enough Ki to sustain the Sauzer Blade."
				src.overlays -= 'Sauzer Blade.dmi'
				src.strength -= src.sword_power
				src.sauzer_blade = 0
				return
obj/Technique/DemonSword
	verb
		Demon_Sword()
			set category = "Techniques"
			var/ki_cost = round(usr.ki_max * 0.15)

			if(usr.doing)
				usr << "You are already doing something!"
				return
			if(usr.buku)
				return
			if(usr.ki_lock)
				usr << "Cannot use this Technique at his time."
				return
			if(!usr.demon_sword)
				if(usr.ki < ki_cost)
					usr << "You do not have enough Ki to sustain the Demon Sword."
					return
				usr << "You wear your Demon Sword."
				usr.sword_power = usr.strength_max * 1.3
				if(usr.learn_dimensionsword)
					usr.contents += new/obj/Technique/DimensionSwordAttack
				usr.overlays += 'Demon Sword.dmi'
				usr.demon_sword = 1
				usr.strength += usr.sword_power
				spawn(1)usr.DSword_Cost()
			else
				for(var/obj/Technique/DimensionSwordAttack/D in usr)
					del(D)
				usr << "You stop using your Demon Sword."
				usr.overlays -= 'Demon Sword.dmi'
				usr.strength -= usr.sword_power
				usr.demon_sword = 0
				return
mob
	proc/DSword_Cost()
		var/ki_cost = round(src.ki_max * 0.07)
		if(ki_cost <= 0)
			ki_cost = 1
		if(src.demon_sword)
			if(src.ki >= ki_cost)
				src.ki -= ki_cost
				spawn(50)src.DSword_Cost()
			else
				for(var/obj/Technique/DimensionSwordAttack/D in src)
					del(D)
				src << "You do not have enough Ki to sustain the Demon Sword."
				src.overlays -= 'Demon Sword.dmi'
				src.strength -= src.sword_power
				src.tech_cooldown=0
				src.demon_sword = 0
				return
obj/Technique/KiAbsorb
	verb/Ki_Absorb()
		set category = "Combat"
		if(usr.tech_cooldown)
			return
		usr.tech_cooldown=1
		spawn((usr.speed/1000)+3)usr.tech_cooldown=0
		if(usr.kiabsorb)
			usr<<"You stop absorbing ki."
			usr.kiabsorb=0
			usr.doing=0
			usr.frozen=0
			usr.icon_state=""
			return
		else
			usr<<"You start absorbing ki."
			usr.kiabsorb=1
			usr.doing=1
			usr.frozen=1
			usr.icon_state="attack"
			return
obj/Technique/Regenerate
	verb/Regenerate()
		set category = "Techniques"
		if(usr.race=="Majin")
			if(usr.dead)
				usr << "Your body was completely destroyed. You cannot regenerate it!"
				return
			if(usr.regen_delay)
				return
			usr.regen_delay = 1
			if(usr.regen_dead)
				spawn(1)usr.Regenerate()
				usr.overlays -= 'Halo.dmi'
			else
				usr << "You are not dead, there is no reason to regenerate!"
				spawn(25)usr.regen_delay=0
		if(usr.race=="Namekian"||usr.race=="Bio-Android")
			if(usr.regen_delay)
				return
			usr.regen_delay = 1
			if(usr.regen)
				usr << "You stop Regenerating."
				usr.regen = 0
				spawn(25)usr.regen_delay=0
			else
				if(!usr.regen)
					usr << "You allow your body to Regenerate."
					usr.regen = 1
					spawn(25)usr.regen_delay=0
					spawn(1)usr.Regenerate()
mob
	var
		kiabsorb=0
	proc
		BindTimer(var/mob/M,var/T,var/D)
			sleep(T)
			if(!src.binded)
				return
			flick("enrage",src)
			src.overlays-=icon('Techs.dmi',"galaticdonut")
			src.overlays-=icon('Techs.dmi',"demonshackle")
			src.overlays-=icon('Techs.dmi',"imprisonmentball")
			src.binded=0
			src.doing=0
			src.frozen=0
			src.boxing=0
			src.dualtrain=0
			view(8)<<"\white [src] has broken free!"
			if(D>=0)
				if(!M)return
				if(src.dead)return
				src.powerlevel-=D
				if(M.kill)
					src.DeathCheck(M)
				else
					spawn(0)src.KO()
			return
		Regenerate()
			if(src.race=="Namekian"||src.race=="Bio-Android")
				if(!src.regen)
					return
				sleep(10)
				if(!src.regen)
					return
				else
					if(src.powerlevel>=src.powerlevel_max)
						src.powerlevel=src.powerlevel_max
						src<<"Your body is fully regenerated."
						src.regen=0
					else
						if(!src.regen)
							return
						src.powerlevel+=src.powerlevel_max*0.03
						spawn(5)src.Regenerate()
			else
				if(usr.race=="Majin")
					if(!src.regen_dead)
						src << "There is no need to regenerate."
						return
					sleep(10)
					if(src.powerlevel >= src.powerlevel_max)
						src << "You body is fully regenerated."
						src.powerlevel = src.powerlevel_max
						src.regen_delay = 0
						src.ki = src.ki_max
						src.doing = 0
						src.frozen = 0
						src.icon_state = ""
						src.density = 1
						src.buku = 0
						src.regen_dead = 0
						src.add_exp = 0
						spawn(300)src.add_exp = src.level
						src.it_lock = 0
						src.ki_lock = 0
						src.buku_lock = 0
						src.attack_lock = 0
					else
						src.powerlevel += src.powerlevel_max*0.15
						src.density = 1
						src.frozen=1
						src.doing=1
						src.icon_state = "Regenerate"
						spawn(5)src.Regenerate()
		RegenerateAndro()
			set background=1
			spawn while(1)
				if(src.ki<src.ki_max)
					src.ki+=src.ki_max*0.03
					if(src.ki>src.ki_max)
						src.ki=src.ki_max
				sleep(30)
obj
	Technique
		BlowUp
			verb
				Blow_Up()
					set category = "Techniques"
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.race == "Saibaman")
						usr.icon_state = "enrage"
						usr.frozen = 1
						usr.doing=1
						sleep(30)
						new/obj/techs/Overlays/Crater_Center(usr.loc)
						sleep(10)
						for(var/obj/Earth_Dragonballs/O in usr)
							O.loc = usr.loc
						for(var/obj/Namek_Dragonballs/O in usr)
							O.loc = usr.loc
						for(var/obj/Black_Dragonballs/O in usr)
							O.loc = usr.loc
						usr.e_db_1 = 0
						usr.e_db_2 = 0
						usr.e_db_3 = 0
						usr.e_db_4 = 0
						usr.e_db_5 = 0
						usr.e_db_6 = 0
						usr.e_db_7 = 0
						usr.n_db_1 = 0
						usr.n_db_2 = 0
						usr.n_db_3 = 0
						usr.n_db_4 = 0
						usr.n_db_5 = 0
						usr.n_db_6 = 0
						usr.n_db_7 = 0
						usr.b_db_1 = 0
						usr.b_db_2 = 0
						usr.b_db_3 = 0
						usr.b_db_4 = 0
						usr.b_db_5 = 0
						usr.b_db_6 = 0
						usr.b_db_7 = 0
						for(var/turf/Floors/Safe_Zone/S in view(8))
							if(S in oview(8))
								usr << "Safe Zone!"
								usr.DeathCheck(usr)
								return
						for(var/mob/M in oview(8,usr))
							var/damage = usr.ki*2
							if(!M.dead&&!M.safe&&M.pk)
								var/turf/CL=M.loc
								for(var/turf/Floors/Safe_Zone/SZ in CL)
									if(SZ in CL)
										continue
								var/damage2=(damage-M.kidefense)/(((2+get_dist(usr,M))/2))
								if(damage2<0)
									damage2=0
								M.powerlevel-=damage2
								M.DeathCheck(usr)
						usr.powerlevel=0
						usr.DeathCheck(usr)
						return
		GiganticMeteor
			verb
				Gigantic_Meteor()
					set category = "Techniques"
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					usr.overlays+='Gigantic Meteor.dmi'
					usr.frozen = 1
					usr.doing=1
					sleep(35)
					usr.overlays-='Gigantic Meteor.dmi'
					sleep(5)
					new/obj/techs/Overlays/Crater_Center(usr.loc)
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							usr.ki=0
							usr.frozen=0
							usr.doing=0
							return
					for(var/mob/M in oview(8,usr))
						var/damage = usr.ki*2
						if(!M.dead&&!M.safe&&M.pk)
							var/turf/CL=M.loc
							for(var/turf/Floors/Safe_Zone/SZ in CL)
								if(SZ in CL)
									continue
							var/damage2=(damage-M.kidefense)/(((2+get_dist(usr,M))/2))
							if(damage2<0)
								damage2=0
							M.powerlevel-=damage2
							M.DeathCheck(usr)
					usr.ki=0
					usr.frozen=0
					usr.doing=0
					return