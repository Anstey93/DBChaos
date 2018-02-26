obj
	Daycycle
		icon='Day & Night.dmi'
		DawnColor
			icon_state="dawn"
			layer=1001
			mouse_opacity=0
		NightColor
			icon_state="night"
			layer=1001
			mouse_opacity=0
var
	daycycleon=0
	dayon=0
	nighton=0
	dawnon=0
	eveningon=0
	day=0
	night=0
	dawn=0
	evening=0
	daytime=0
	nighttime=0
	dawntime=0
	eveningtime=0
world
	proc
		Daycycle()
			set background=1
			spawn while(daycycleon)
				if(day)
					if(!dayon)
						world<<"<font color=#FF9900>The sun shines brightly from above."
						daytime=60
						for(var/area/outside/A in world)
							A.overlays=null
						for(var/obj/Buildings/Roof/B in world)
							B.overlays=null
						for(var/obj/Buildings/Roof2/C in world)
							C.overlays=null
						for(var/obj/Buildings/Roof3/D in world)
							D.overlays=null
						dayon=1
					if(daytime>0)
						daytime-=1
					else
						day=0
						dayon=0
						evening=1
						eveningon=0
				if(evening)
					if(!eveningon)
						world<<"<font color=#FF6600>The sun starts to set over the hills."
						eveningtime=3
						for(var/area/outside/A in world)
							A.overlays=null
							if(A.z==1||A.z==2||A.z==3||A.z==7)
								A.overlays+=new/obj/Daycycle/DawnColor
						for(var/obj/Buildings/Roof/B in world)
							B.overlays=null
							if(B.z==1||B.z==2||B.z==3||B.z==7)
								B.overlays+=new/obj/Daycycle/DawnColor
						for(var/obj/Buildings/Roof2/C in world)
							C.overlays=null
							if(C.z==1||C.z==2||C.z==3||C.z==7)
								C.overlays+=new/obj/Daycycle/DawnColor
						for(var/obj/Buildings/Roof3/D in world)
							D.overlays=null
							if(D.z==1||D.z==2||D.z==3||D.z==7)
								D.overlays+=new/obj/Daycycle/DawnColor
						eveningon=1
					if(eveningtime>0)
						eveningtime-=1
					else
						evening=0
						eveningon=0
						night=1
						nighton=0
				if(night)
					if(!nighton)
						world<<"<font color=#0000CC>The sun sets and the moon comes out."
						nighttime=30
						for(var/mob/PC/M in world)
							if(M.z==1||M.z==2||M.z==3)
								if(M.race=="Saiyan"||M.race=="Half Saiyan")
									if(M.level<75)
										M.OozaruTrans()
						for(var/area/outside/A in world)
							A.overlays=null
							if(A.z==1||A.z==2||A.z==3||A.z==7)
								A.overlays+=new/obj/Daycycle/NightColor
						for(var/obj/Buildings/Roof/B in world)
							B.overlays=null
							if(B.z==1||B.z==2||B.z==3||B.z==7)
								B.overlays+=new/obj/Daycycle/NightColor
						for(var/obj/Buildings/Roof2/C in world)
							C.overlays=null
							if(C.z==1||C.z==2||C.z==3||C.z==7)
								C.overlays+=new/obj/Daycycle/NightColor
						for(var/obj/Buildings/Roof3/D in world)
							D.overlays=null
							if(D.z==1||D.z==2||D.z==3||D.z==7)
								D.overlays+=new/obj/Daycycle/NightColor
						nighton=1
					if(nighttime>0)
						nighttime-=1
					else
						night=0
						nighton=0
						dawn=1
						dawnon=0
				if(dawn)
					if(!dawnon)
						world<<"<font color=#FF6600>The sun starts to rise from behind the hills."
						dawntime=3
						for(var/mob/PC/M in world)
							if(M.race=="Saiyan"||M.race=="Half Saiyan")
								M.Forced_Oozaru_Revert()
						for(var/area/outside/A in world)
							A.overlays=null
							if(A.z==1||A.z==2||A.z==3||A.z==7)
								A.overlays+=new/obj/Daycycle/DawnColor
						for(var/obj/Buildings/Roof/B in world)
							B.overlays=null
							if(B.z==1||B.z==2||B.z==3||B.z==7)
								B.overlays+=new/obj/Daycycle/DawnColor
						for(var/obj/Buildings/Roof2/C in world)
							C.overlays=null
							if(C.z==1||C.z==2||C.z==3||C.z==7)
								C.overlays+=new/obj/Daycycle/DawnColor
						for(var/obj/Buildings/Roof3/D in world)
							D.overlays=null
							if(D.z==1||D.z==2||D.z==3||D.z==7)
								D.overlays+=new/obj/Daycycle/DawnColor
						dawnon=1
					if(dawntime>0)
						dawntime-=1
					else
						dawn=0
						dawnon=0
						day=1
						dayon=0
				sleep(600)