var
	sagas_on= 0
	sagas_evil=0
	sagas_good=0
	saga="Not On"
	part="Not On"
	saga_difficulty="Easy"
	saga_episode=0
	saga_spawned=0
proc
	SAGA_DIFFICULTY()
		return
	/*	if(saga_difficulty == "Easy")
			for(var/mob/Saga/M in world)
				M.powerlevel_max = M.powerlevel_max/2
				M.ki_max = M.ki_max/2
				M.strength_max = M.strength_max/2
				M.defence_max = M.defence_max/2
				M.kidefense_max = M.kidefense_max/2
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max
		if(saga_difficulty == "Medium")
			for(var/mob/Saga/M in world)
				M.powerlevel_max = M.powerlevel_max
				M.ki_max = M.ki_max
				M.strength_max = M.strength_max
				M.defence_max = M.defence_max
				M.kidefense_max = M.kidefense_max
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max
		if(saga_difficulty == "Hard")
			for(var/mob/Saga/M in world)
				M.powerlevel_max = M.powerlevel_max*2
				M.ki_max = M.ki_max*2
				M.strength_max = M.strength_max*2
				M.defence_max = M.defence_max*2
				M.kidefense_max = M.kidefense_max*2
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max*/
world
	proc
		SAGA_CHECK()
			spawn while(sagas_on)
				if(sagas_on&&sagas_evil)
					if(!saga_episode&&!saga_spawned)
						for(var/mob/Saga/M in world)
							del(M)
						saga = "Saiyan"
						part = "Raditz"
						saga_episode = 1
						saga_spawned=1
						var/Raditz = /mob/Saga/Raditz
						new Raditz(locate(31,42,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode==2&&saga_spawned!=2)
						saga = "Saiyan"
						part = "Vegeta and Nappa"
						saga_spawned=2
						var/Vegeta = /mob/Saga/Vegeta
						new Vegeta(locate(310,80,1))
						var/Nappa = /mob/Saga/Nappa
						new Nappa(locate(315,78,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode==4&&saga_spawned!=4)
						saga = "Frieza"
						part = "Ginyu Force"
						saga_spawned=4
						var/Jeice = /mob/Saga/Jeice
						new Jeice(locate(62,325,2))
						var/Burter = /mob/Saga/Burter
						new Burter(locate(318,352,2))
						var/Recoom = /mob/Saga/Recoom
						new Recoom(locate(220,266,2))
						var/Guldo = /mob/Saga/Guldo
						new Guldo(locate(82,227,2))
						var/Ginyu = /mob/Saga/Ginyu
						new Ginyu(locate(176,80,2))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode==9&&saga_spawned!=9)
						saga = "Frieza"
						part = "Frieza: Form 1"
						saga_spawned=9
						var/Frieza = /mob/Saga/Frieza
						new Frieza(locate(60,111,2))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 10)
						saga = "Frieza"
						part = "Frieza: Form 2"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 11)
						saga = "Frieza"
						part = "Frieza: Form 3"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 12)
						saga = "Frieza"
						part = "Frieza: Form 4"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 13)
						saga = "Frieza"
						part = "Frieza: Form 4 100%"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 14&&saga_spawned!=14)
						saga = "Android"
						part = "Cyborg Frieza"
						saga_spawned=14
						var/Cyborg_Frieza = /mob/Saga/MechaFrieza
						new Cyborg_Frieza(locate(231,86,1))
						var/King_Cold = /mob/Saga/KingCold
						new King_Cold(locate(233,87,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 16&&saga_spawned!=16)
						saga = "Cooler"
						part = "Cooler"
						saga_spawned=16
						var/Cooler = /mob/Saga/Cooler
						new Cooler(locate(210,110,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 17)
						saga = "Cooler"
						part = "Metal Cooler"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 18&&saga_spawned!=18)
						saga = "Android"
						part = "Android 19 and 20"
						saga_spawned=18
						var/Android_19 = /mob/Saga/Android19
						new Android_19(locate(174,134,1))
						var/Dr_Gero = /mob/Saga/Android20
						new Dr_Gero(locate(175,133,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 20&&saga_spawned!=20)
						saga = "Android"
						part = "Android 16, 17 and 18"
						saga_spawned=20
						var/Android_16 = /mob/Saga/Android16
						new Android_16(locate(295,195,1))
						var/Android_17 = /mob/Saga/Android17
						new Android_17(locate(297,195,1))
						var/Android_18 = /mob/Saga/Android18
						new Android_18(locate(298,193,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 23&&saga_spawned!=23)
						saga = "Android"
						part = "Cell: Form I"
						saga_spawned=23
						var/Cell = /mob/Saga/Cell
						new Cell(locate(315,236,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 24)
						saga = "Android"
						part = "Cell: Imperfect Form"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 25)
						saga = "Android"
						part = "Cell: Perfect Form"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 26)
						saga = "Android"
						part = "Cell: Power Weighted"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 27)
						saga = "Android"
						part = "Cell: Perfect Form Power Weighted"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 28&&saga_spawned!=28)
						saga = "Brolly"
						part = "Brolly"
						saga_spawned=28
						var/Broly = /mob/Saga/Brolly
						new Broly(locate(227,105,3))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 29)
						saga = "Brolly"
						part = "Legendary Super Saiyan"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 30&&saga_spawned!=30)
						saga = "Majin"
						part = "Babidi and Dabura"
						saga_spawned=30
						var/Dabura = /mob/Saga/Dabura
						new Dabura(locate(325,47,1))
						var/Babidi = /mob/Saga/Babidi
						new Babidi(locate(324,47,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 32&&saga_spawned!=32)
						saga = "Majin"
						part = "Fat Buu"
						saga_spawned=32
						var/Fat_Buu = /mob/Saga/MajinBuu
						new Fat_Buu(locate(325,50,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 33)
						saga = "Majin"
						part = "Evil Buu"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 34)
						saga = "Majin"
						part = "Super Buu"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 35)
						saga = "Majin"
						part = "Kid Buu"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 36&&saga_spawned!=36)
						saga = "Baby"
						part = "Baby"
						saga_spawned=36
						spawn(1)SAGA_DIFFICULTY()
						var/Bebi = /mob/Saga/Baby
						new Bebi(locate(83,43,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 37)
						saga = "Baby"
						part = "Baby Vegeta"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 38)
						saga = "Baby"
						part = "Golden Oozaru Baby"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 39&&saga_spawned!=39)
						saga = "Super 17"
						part = "Super 17"
						saga_spawned=39
						var/Super17 = /mob/Saga/Super17
						new Super17(locate(242,60,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 40&&saga_spawned!=40)
						saga = "Shenron"
						part = "Shenron"
						saga_spawned=40
						var/Shenron = /mob/Saga/Shenron
						new Shenron(locate(326,205,1))
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 41)
						saga = "Shenron"
						part = "Omega Shenron"
						spawn(1)SAGA_DIFFICULTY()
					if(saga_episode == 42)
						saga = "Not On"
						part = "Not On"
						saga_spawned=0
						saga_episode=0
						break
				sleep(300)
	/*		if(sagas_on&&sagas_good)
				if(!saga_episode)
					saga = "Saiyan"
					part = "Goku and Piccolo"
					saga_episode = 1
					var/Goku1 = /mob/Saga/Goku1
					var/Piccolo1 = /mob/Saga/Piccolo1
					var/Gohan1 = /mob/Saga/Gohan1
					new Goku1(locate(28,42,1))
					new Piccolo1(locate(31,44,1))
					new Gohan1(locate(31,41,1))
					SAGA_DIFFICULTY()
				if(saga_episode == 4)
					saga = "Saiyan"
					part = "Saiyan Force"
					var/Goku2 = /mob/Saga/Goku2
					var/Piccolo2 = /mob/Saga/Piccolo2
					var/Choutzu1 = /mob/Saga/Choutzu1
					var/Krillin1 = /mob/Saga/Krillin1
					var/Tien1 = /mob/Saga/Tien1
					var/Yamcha1 = /mob/Saga/Yamcha1
					new Goku2(locate(310,83,1))
					new Piccolo2(locate(315,78,1))
					new Choutzu1(locate(310,76,1))
					new Krillin1(locate(315,78,1))
					new Tien1(locate(311,76,1))
					new Yamcha1(locate(310,76,1))
					SAGA_DIFFICULTY()
				if(saga_episode == 10)
					saga = "Frieza"
					part = "Gohan and Krillin"
					var/Gohan2 = /mob/Saga/Gohan2
					var/Krillin2 = /mob/Saga/Krillin2
					new Gohan2(locate(82,227,2))
					new Krillin2(locate(84,227,2))
					SAGA_DIFFICULTY()
				if(saga_episode == 13)
					saga = "Frieza"
					part = "Goku and Vegeta"
					var/Goku3 = /mob/Saga/Goku3
					var/Vegeta2 = /mob/Saga/Vegeta2
					new Goku3(locate(60,111,2))
					new Vegeta2(locate(63,110,2))
					SAGA_DIFFICULTY()
				if(saga_episode == 15)
					saga = "Frieza"
					part = "Super Saiyan Goku"
					var/Goku4 = /mob/Saga/Goku4
					new Goku4(locate(60,111,2))
					SAGA_DIFFICULTY()
				if(saga_episode == 16)
					saga = "Android"
					part = "Future Trunks"
					var/Trunks1 = /mob/Saga/Trunks1
					new Trunks1(locate(231,86,1))
					SAGA_DIFFICULTY()
				if(saga_episode == 17)
					saga = "Cooler"
					part = "Goku and Vegeta"
					var/Goku5 = /mob/Saga/Goku5
					var/Vegeta3 = /mob/Saga/Vegeta3
					new Goku5(locate(210,110,1))
					new Vegeta3(locate(212,110,1))
					SAGA_DIFFICULTY()
				if(saga_episode == 19)
					saga = "Android"
					part = "Super Saiyan Vegeta"
					var/Vegeta4 = /mob/Saga/Vegeta4
					new Vegeta4(locate(315,236,1))
					SAGA_DIFFICULTY()
				if(saga_episode == 20)
					saga = "Android"
					part = "Super Saiyan Gohan"
					var/Goku6 = /mob/Saga/Goku6
					var/Gohan3 = /mob/Saga/Gohan3
					new Goku6(locate(315,236,1))
					new Gohan3(locate(312,237,1))
					SAGA_DIFFICULTY()
				if(saga_episode == 22)
					saga = "Android"
					part = "Super Saiyan 2 Gohan"
					SAGA_DIFFICULTY()
				if(saga_episode == 23)
					saga = "Brolly"
					part = "Trunks and Goten"
					var/Trunks2 = /mob/Saga/Trunks2
					var/Goten1 = /mob/Saga/Goten1
					new Trunks2(locate(227,105,3))
					new Goten1(locate(228,105,3))
					SAGA_DIFFICULTY()
				if(saga_episode == 25)
					saga = "Majin"
					part = "Goku and Vegeta"
					var/Vegeta5 = /mob/Saga/Vegeta5
					new Vegeta5(locate(324,47,1))
					SAGA_DIFFICULTY()
				if(saga_episode == 26)
					saga = "Majin"
					part = "Super Saiyan 3 Goku"
					var/Goku7 = /mob/Saga/Goku7
					new Goku7(locate(325,47,1))
				if(saga_episode == 27)
					saga = "Majin"
					part = "Gotenks and Mystic Gohan"
					var/Gotenks1 = /mob/Saga/Gotenks1
					var/Gohan4 = /mob/Saga/Gohan4
					new Gotenks1(locate(14,160,7))
					new Gohan4(locate(15,161,7))
				if(saga_episode == 29)
					saga = "Majin"
					part = "Vegito"
					var/Vegito1 = /mob/Saga/Vegito1
					new Vegito1(locate(336,335,1))
				if(saga_episode == 30)
					saga = "Not On"
					part = "Not On"*/
mob
	Saga
		icon='Sagas.dmi'
		pk=1
		density=1
		safe=0
		var
			has_beam=0
			beam_txt=""
			beamI='Techs.dmi'
			beamIS=0
			beamIST=0
			CPS=1
		New()
			..()
			spawn(20)
				src.Wander()
			spawn(50)
				src.SagaAI()
			spawn(1)
				var/pl=(src.level*src.level*(src.level*0.3))+rand(1,1000)
				var/str=(src.level*src.level*(src.level*0.3))+rand(1,1000)
				src.powerlevel = pl
				src.powerlevel_max = pl
				src.ki=pl*0.95
				src.ki_max=pl*0.95
				src.kidefense=pl*0.7
				src.kidefense_max=pl*0.7
				src.strength=str
				src.strength_max=str
				src.defence=str
				src.defence_max=str
				src.exp=src.level
				src.zenni=(src.level*src.level*0.2)+100
				if(saga_difficulty == "Easy")
					src.powerlevel_max*=0.5
					src.ki_max*=0.5
					src.kidefense_max*=0.5
					src.strength_max*=0.5
					src.defence_max*=0.5
					src.Power_Redefine()
		proc
			SagaPowerUp()
				if(src.powering)
					if(src.powerlevel>=src.powerlevel_max)
						src.powerlevel=src.powerlevel_max
					if(src.ki>=src.ki_max)
						src.ki=src.ki_max
					if(src.powerlevel>=src.powerlevel_max&&src.ki>=src.ki_max)
						src.powering=0
						src.doing=0
						src.frozen=0
						src.power_delay=0
						src.overlays-='aura.dmi'
						return
					else
						spawn(25)src.SagaPowerUp()
					src.powerlevel+=src.powerlevel_max*0.15
					src.ki+=src.ki_max*0.15
					if(src.powerlevel>=src.powerlevel_max&&src.ki>=src.ki_max)
						src.powerlevel=src.powerlevel_max
						src.ki=src.ki_max
						src.powering=0
						src.doing=0
						src.power_delay=0
						src.frozen=0
						src.overlays-='aura.dmi'
						return
					else
						spawn(25)src.SagaPowerUp()
			SagaAI()
				spawn while(src)
					if(src.powerlevel<=src.powerlevel_max*0.20||src.ki<=src.ki_max*0.15)
						if(!src.powering)
							if(src.power_delay)
								return
							if(src.doing)
								return
							src.power_delay=1
							src.powering=1
							src.doing=1
							src.frozen=1
							src.overlays+='aura.dmi'
							spawn(20)
								src.SagaPowerUp()
					if(prob(5))
						if(!src.doing)
							if(src.dir==NORTH)
								for(var/mob/PC/M in oview(8))
									if(M.x==src.x&&M.y>src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
							if(src.dir==SOUTH)
								for(var/mob/PC/M in oview(8))
									if(M.x==src.x&&M.y<src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
							if(src.dir==EAST)
								for(var/mob/PC/M in oview(8))
									if(M.x>src.x&&M.y==src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
							if(src.dir==WEST)
								for(var/mob/PC/M in oview(8))
									if(M.x<src.x&&M.y==src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
					sleep(30)