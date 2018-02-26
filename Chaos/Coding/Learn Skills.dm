mob
	var
		learn_dimensionsword=0
		learn_distructodisk=0
		learn_kienzandisk=0
		learn_spiritball=0
		learn_aura=0
		learn_karmabomb=0
		learn_energyfield=0
		learn_angryexplosion=0
		learn_supernova=0
		learn_deathball=0
		learn_sauzerblade=0
		learn_finalexplosion=0
		learn_giganticmeteor=0
		learn_blastershell=0
		learn_rapidblast=0
		learn_blowup=0
		learn_flameblast=0
		learn_deathbeam=0
		learn_demonsword=0
		learn_universalscan=0
		learn_fusiondance=0
		learn_acidbomb=0
		learn_galacticdonut=0
		learn_demonshackle=0
		learn_imprisonmentball=0
		learn_powerup=0
		learn_fakemoon=0
		learn_enrage=0
		learn_sense=0
		learn_finalshine=0
		learn_bigbangattack=0
		learn_finalflash=0
		learn_galickgun=0
		learn_tribeam=0
		learn_solarflare=0
		learn_splitform=0
		learn_specialbeam=0
		learn_lightgrenade=0
		learn_zanzoken=0
		learn_dragonfist=0
		learn_afterimage=0
		learn_it=0
		learn_ssdeadlybomber=0
		learn_fly=0
		learn_hellzonegrenade=0
		learn_genocideattack
		learn_invertpower=0
		learn_deathwave=0
		learn_finishbuster=0
		learn_burningattack=0
		learn_absorb=0
		learn_kiabsorb=0
		learn_revengeball=0
		learn_kishower=0
		learn_sacrifice=0
		learn_adtrain=0
		learn_gravfield=0
		learn_buffpl=0
		learn_buffki=0
		learn_buffstr=0
		learn_buffdef=0
		learn_buffstam=0
		learn_explode=0
		learn_acidrain=0
	proc
		Skill_Gain()
			if(istype(src,/mob/PC))
				if(src.race=="Android")
					if(src.level>=1)
						if(!src.learn_kiabsorb)
							src.contents += new/obj/Technique/KiAbsorb
							src.learn_kiabsorb=1
					if(src.level>=2500)
						if(!src.learn_universalscan)
							src << "<center><font color = white> .:: You learn Universal Scan  ::.</font></center></center>"
							src.contents += new/obj/Technique/UniversalScan
							src.learn_universalscan = 1
					if(src.level>=4000)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower = 1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
				if(src.race=="Saiyan")
					if(src.level>=300)
						if(!src.learn_fakemoon)
							src << "<center><font color = white> .:: You learn Fake Moon ::.</font></center></center>"
							src.contents += new/obj/Technique/FakeMoon
							src.learn_fakemoon = 1
					if(src.level>=1500)
						if(!src.learn_galacticdonut)
							src << "<center><font color = white> .:: You learn Galactic Donut  ::.</font></center></center>"
							src.contents += new/obj/Technique/GalacticDonut
							src.learn_galacticdonut = 1
					if(src.level>=5000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance = 1
						if(src.legendary_chromosome)
							if(!src.learn_blastershell)
								src << "<center><font color = white> .:: You learn Blaster Shell  ::.</font></center></center>"
								src.contents += new/obj/Technique/BlasterShell
								src.learn_blastershell = 1
					if(src.level>=7500)
						if(!src.learn_finalexplosion)
							src << "<center><font color = white> .:: You learn Final Explosion  ::.</font></center></center>"
							src.contents += new/obj/Technique/FinalExplosion
							src.learn_finalexplosion = 1
						if(src.legendary_chromosome)
							if(!src.learn_giganticmeteor)
								src << "<center><font color = white> .:: You learn Gigantic Meteor  ::.</font></center></center>"
								src.contents += new/obj/Technique/GiganticMeteor
								src.learn_giganticmeteor = 1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Shine Missile  ::.</font></center></center>"
							src.contents += new/obj/Technique/ShineMissile
							src.learn_kishower = 1
				if(src.race=="Half Saiyan")
					if(src.level >= 300)
						if(!src.learn_fakemoon)
							src << "<center><font color = white> .:: You learn Fake Moon ::.</font></center></center>"
							src.contents += new/obj/Technique/FakeMoon
							src.learn_fakemoon = 1
					if(src.level>=1500)
						if(!src.learn_galacticdonut)
							src << "<center><font color = white> .:: You learn Galactic Donut  ::.</font></center></center>"
							src.contents += new/obj/Technique/GalacticDonut
							src.learn_galacticdonut = 1
					if(src.level>=5000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance = 1
					if(src.level>=7500)
						if(!src.learn_finalexplosion)
							src << "<center><font color = white> .:: You learn Final Explosion  ::.</font></center></center>"
							src.contents += new/obj/Technique/FinalExplosion
							src.learn_finalexplosion = 1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Shine Missile  ::.</font></center></center>"
							src.contents += new/obj/Technique/ShineMissile
							src.learn_kishower = 1
				if(src.race=="Changeling")
					if(src.level>=1500)
						if(!src.learn_imprisonmentball)
							src << "<center><font color = white> .:: You learn Imprisonment Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/ImprisonmentBall
							src.learn_imprisonmentball = 1
						if(!src.learn_deathwave)
							src << "<center><font color = white> .:: You learn Death Wave  ::.</font></center></center>"
							src.contents += new/obj/Technique/DeathWave
							src.learn_deathwave = 1
					if(src.level>=3500)
						if(!src.learn_sauzerblade)
							src << "<center><font color = white> .:: You learn Sauzer Blade  ::.</font></center></center>"
							src.contents += new/obj/Technique/SauzerBlade
							src.learn_sauzerblade = 1
					if(src.level>=5000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance=1
						if(!src.learn_supernova)
							src << "<center><font color = white> .:: You learn Super Nova  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperNova
							src.learn_supernova=1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
				if(src.race=="Demon")
					if(src.level>=1500)
						if(!src.learn_demonshackle)
							src << "<center><font color = white> .:: You learn Demon Shackle  ::.</font></center></center>"
							src.contents += new/obj/Technique/DemonShackle
							src.learn_demonshackle=1
					if(src.level>=1500)
						if(!src.learn_flameblast)
							src << "<center><font color = white> .:: You learn Hell Blaze  ::.</font></center></center>"
							src.contents += new/obj/Technique/FlameBlast
							src.learn_flameblast=1
					if(src.level>=3000)
						if(!src.learn_demonsword)
							src << "<center><font color = white> .:: You learn Demon Sword  ::.</font></center></center>"
							src.contents += new/obj/Technique/DemonSword
							src.learn_demonsword=1
					if(src.level>=4000)
						if(!src.learn_dimensionsword)
							src << "<center><font color = white> .:: You learn Dimension Sword Attack  ::.</font></center></center>"
							src.learn_dimensionsword=1
					if(src.level>=5000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance=1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Flame Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/FlameShower
							src.learn_kishower=1
				if(src.race=="Majin")
					if(src.level>=4000)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower=1
					if(src.level>=5000)
						if(!src.learn_genocideattack)
							src<<"<center><font color = white> .:: You learn Genocide Attack  ::.</font></center></center>"
							src.contents += new/obj/Technique/GenocideAttack
							src.learn_genocideattack=1
					if(src.level>=8000)
						if(!src.learn_angryexplosion)
							src << "<center><font color = white> .:: You learn Angry Explosion  ::.</font></center></center>"
							src.contents += new/obj/Technique/AngryExplosion
							src.learn_angryexplosion=1
				if(src.race=="Namekian")
					if(src.level>=4000)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower=1
					if(src.level>=5000)
						if(!src.learn_hellzonegrenade)
							src<<"<center><font color = white> .:: You learn Hell Zone Grenade  ::.</font></center></center>"
							src.contents += new/obj/Technique/HellZoneGrenade
							src.learn_hellzonegrenade=1
				if(src.race=="Bio-Android")
					if(src.level>=4000)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower=1
					if(src.level>=7500)
						if(!src.learn_energyfield)
							src << "<center><font color = white> .:: You learn Energy Field  ::.</font></center></center>"
							src.contents += new/obj/Technique/EnergyField
							src.learn_energyfield = 1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
				if(src.race=="Tuffle")
					if(src.level>=4000)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower = 1
					if(src.level>=5000)
						if(!src.learn_revengeball)
							src.learn_revengeball=1
							src << "<center><font color = white> .:: You learn Revenge Death Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/RevengeDeathBall
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
				if(src.race=="Dragon")
					if(src.level>=4000)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower = 1
					if(src.level>=5000)
						if(!src.learn_karmabomb)
							src << "<center><font color = white> .:: You learn Negative Karma Bomb  ::.</font></center></center>"
							src.contents += new/obj/Technique/KarmaBomb
							src.learn_karmabomb = 1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
				if(src.race=="Human")
					if(src.level>=5000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance = 1
					if(src.level>=10000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
				if(src.race=="Saibaman")
					if(src.level >= 3500)
						if(!src.learn_acidbomb)
							src << "<center><font color = white> .:: You learn Acid Bomb  ::.</font></center></center>"
							src.contents += new/obj/Technique/AcidBomb
							src.learn_acidbomb = 1
					if(src.level >= 4000)
						if(!src.learn_blowup)
							src << "<center><font color = white> .:: You learn Blow Up  ::.</font></center></center>"
							src.contents += new/obj/Technique/BlowUp
							src.learn_blowup = 1
					if(src.level >= 4500)
						if(!src.learn_acidrain)
							src << "<center><font color = white> .:: You learn Acid Rain  ::.</font></center></center>"
							src.contents += new/obj/Technique/AcidRain
							src.learn_acidrain = 1
					if(src.level>=5000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance = 1
				if(src.race=="Konat")
					if(src.level>=4000)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower=1
				if(src.race=="Kai")
					if(src.level>=1000)
						if(!src.learn_sacrifice)
							src << "<center><font color = white> .:: You learn Sacrifice  ::.</font></center></center>"
							src.contents += new/obj/Technique/Sacrifice
							src.learn_sacrifice=1
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance = 1
					if(src.level>=2000)
						if(!src.learn_adtrain)
							src << "<center><font color = white> .:: You learn Advanced Training  ::.</font></center></center>"
							src.contents += new/obj/Technique/AdvancedTraining
							src.learn_adtrain=1
					if(src.level>=3000)
						if(!src.learn_gravfield)
							src << "<center><font color = white> .:: You learn Gravity Field  ::.</font></center></center>"
							src.contents += new/obj/Technique/GravityField
							src.learn_gravfield=1
					if(src.level>=4000)
						if(!src.learn_buffdef)
							src << "<center><font color = white> .:: You learn Buff Defense  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuffDefense
							src.learn_buffdef=1
					if(src.level>=4500)
						if(!src.learn_buffstr)
							src << "<center><font color = white> .:: You learn Buff Strength  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuffStrength
							src.learn_buffstr=1
					if(src.level>=5000)
						if(!src.learn_buffki)
							src << "<center><font color = white> .:: You learn Buff Ki  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuffKi
							src.learn_buffki=1
					if(src.level>=5000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance = 1
					if(src.level>=5500)
						if(!src.learn_buffpl)
							src << "<center><font color = white> .:: You learn Buff Powerlevel  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuffPowerlevel
							src.learn_buffpl=1
					if(src.level>=6000)
						if(!src.learn_buffstam)
							src << "<center><font color = white> .:: You learn Buff Stamina  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuffStamina
							src.learn_buffstam=1
				if(src.level >= 100)
					if(!src.learn_sense)
						src << "<center><font color = white> .:: You learn to Sense Energy ::.</font></center></center>"
						src.contents += new/obj/Technique/Sense
						src.learn_sense = 1
				if(src.level >= 10)
					if(!src.learn_aura)
						src << "<center><font color = white> .:: You learn to create an Aura ::.</font></center></center>"
						src.learn_aura=1
						src.contents += new/obj/Technique/Aura
				if(src.level >= 15)
					if(!src.learn_fly)
						src << "<center><font color = white> .:: You learn to Fly ::.</font></center></center>"
						src.contents += new/obj/Technique/Fly
						src.learn_fly = 1
				if(src.level >= 20)
					if(!src.learn_enrage)
						src << "<center><font color = white> .:: You learn to Unleash your Rage ::.</font></center></center>"
						src.contents += new/obj/Technique/UnleashRage
						src.learn_enrage = 1
				if(src.level >= 500)
					if(!src.learn_powerup)
						src << "<center><font color = white> .:: You learn Power Up  ::.</font></center></center>"
						src.contents += new/obj/Technique/PowerUp
						src.learn_powerup = 1
				if(src.level>=50)
					if(!src.learn_it)
						src << "<center><font color = white> .:: You learn Instant Transmission ::.</font></center></center>"
						src.contents += new/obj/Technique/InstantTransmission
						src.learn_it=1
				if(src.level>=2000)
					if(!src.pk)
						world << "<FONT color = #F3982D>Training Information: \white [src] has now become a permanent Combatant."
						src.pk=1
				if(src.race!="Kai")
					if(src.level >= 1000)
						if(!src.learn_rapidblast)
							src << "<center><font color = white> .:: You learn Rapid Blast  ::.</font></center></center>"
							src.contents += new/obj/Technique/RapidBlast
							src.learn_rapidblast = 1