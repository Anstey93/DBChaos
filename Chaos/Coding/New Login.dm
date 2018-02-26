mob
	var
		tmp
			clickdelay=0
	proc
		DeleteChar(S)
			switch(S)
				if(1)
					if(fexists("World Save Files/Player Saves/[src.ckey]-Slot 1.sav"))
						switch(alert("Do you want to delete your current character?","Delete: Slot 1","Delete","Cancel"))
							if("Delete")
								var/delname=""
								var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 1.sav")
								F["name"]>>delname
								var/savefile/N=new("World Save Files/Player Names.sav")
								NameList.Remove(lowertext(delname))
								N["NameList"]<<NameList
								fdel("World Save Files/Player Saves/[src.ckey]-Slot 1.sav")
								src<<"<font color=red>Slot 1 Deleted!"
								src.client.screen=null
								spawn(15)src.clickdelay=0
					else
						src<<"<font color=red>Slot 1 is empty!"
						src.client.screen=null
						spawn(15)src.clickdelay=0
				if(2)
					if(fexists("World Save Files/Player Saves/[src.ckey]-Slot 2.sav"))
						switch(alert("Do you want to delete your current character?","Delete: Slot 2","Delete","Cancel"))
							if("Delete")
								var/delname
								var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 2.sav")
								F["name"]>>delname
								var/savefile/N=new("World Save Files/Player Names.sav")
								NameList.Remove(lowertext(delname))
								N["NameList"]<<NameList
								fdel("World Save Files/Player Saves/[src.ckey]-Slot 2.sav")
								src<<"<font color=red>Slot 2 Deleted!"
								src.client.screen=null
								spawn(15)src.clickdelay=0
					else
						src<<"<font color=red>Slot 2 is empty!"
						src.client.screen=null
						spawn(15)src.clickdelay=0
				if(3)
					if(fexists("World Save Files/Player Saves/[src.ckey]-Slot 3.sav"))
						switch(alert("Do you want to delete your current character?","Delete: Slot 3","Delete","Cancel"))
							if("Delete")
								var/delname
								var/savefile/F=new("World Save Files/Player Saves/[src.ckey]-Slot 3.sav")
								F["name"]>>delname
								var/savefile/N=new("World Save Files/Player Names.sav")
								NameList.Remove(lowertext(delname))
								N["NameList"]<<NameList
								fdel("World Save Files/Player Saves/[src.ckey]-Slot 3.sav")
								src<<"<font color=red>Slot 3 Deleted!"
								src.client.screen=null
								spawn(15)src.clickdelay=0
					else
						src<<"<font color=red>Slot 3 is empty!"
						src.client.screen=null
						spawn(15)src.clickdelay=0
		AddSlots(T)
			src.client.screen=null
			switch(T)
				if("New")
					var/obj/LoginStuff/Slot1New/S1=new
					var/obj/LoginStuff/Slot2New/S2=new
					var/obj/LoginStuff/Slot3New/S3=new
					var/obj/LoginStuff/S1N/SN1=new
					var/obj/LoginStuff/S2N/SN2=new
					var/obj/LoginStuff/S3N/SN3=new
					src.client.screen.Add(S1,S2,S3,SN1,SN2,SN3)
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav")
						F["PI"]>>SN1.icon
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav")
						F["PI"]>>SN2.icon
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav")
						F["PI"]>>SN3.icon
				if("Load")
					var/obj/LoginStuff/Slot1Load/S1=new
					var/obj/LoginStuff/Slot2Load/S2=new
					var/obj/LoginStuff/Slot3Load/S3=new
					var/obj/LoginStuff/S1L/SN1=new
					var/obj/LoginStuff/S2L/SN2=new
					var/obj/LoginStuff/S3L/SN3=new
					src.client.screen.Add(S1,S2,S3,SN1,SN2,SN3)
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav")
						F["PI"]>>SN1.icon
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav")
						F["PI"]>>SN2.icon
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav")
						F["PI"]>>SN3.icon
				if("Delete")
					var/obj/LoginStuff/Slot1Delete/S1=new
					var/obj/LoginStuff/Slot2Delete/S2=new
					var/obj/LoginStuff/Slot3Delete/S3=new
					var/obj/LoginStuff/S1D/SN1=new
					var/obj/LoginStuff/S2D/SN2=new
					var/obj/LoginStuff/S3D/SN3=new
					src.client.screen.Add(S1,S2,S3,SN1,SN2,SN3)
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav")
						F["PI"]>>SN1.icon
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav")
						F["PI"]>>SN2.icon
					if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav"))
						var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav")
						F["PI"]>>SN3.icon
obj
	LoginStuff
		layer=5
		icon='Login Stuff.dmi'
		name="DBZ:Super"
		SavingChar1
			icon_state="saving1"
			layer=1000
			screen_loc="9,9"
			New()
				..()
				pixel_x=-32
				src.overlays+=new/obj/LoginStuff/SavingChar2
				src.overlays+=new/obj/LoginStuff/SavingChar3
		SavingChar2
			icon_state="saving2"
			New()
				..()
				pixel_x=32
		SavingChar3
			icon_state="saving3"
			New()
				..()
				pixel_x=64
		S1N
			mouse_opacity=0
			screen_loc="2,15:5"
		S2N
			mouse_opacity=0
			screen_loc="3,15:5"
		S3N
			mouse_opacity=0
			screen_loc="4,15:5"
		S1L
			mouse_opacity=0
			screen_loc="2,12:-13"
		S2L
			mouse_opacity=0
			screen_loc="3,12:-13"
		S3L
			mouse_opacity=0
			screen_loc="4,12:-13"
		S1D
			mouse_opacity=0
			screen_loc="2,8"
		S2D
			mouse_opacity=0
			screen_loc="3,8"
		S3D
			mouse_opacity=0
			screen_loc="4,8"
		Slot1New
			icon_state="slot1"
			screen_loc="2,15:5"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav"))
					switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 1","Overwrite","Cancel"))
						if("Cancel")
							spawn(15)usr.clickdelay=0
							return
						else
							var/delname
							var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav")
							F["name"]>>delname
							var/savefile/N=new("World Save Files/Player Names.sav")
							NameList.Remove(lowertext(delname))
							N["NameList"]<<NameList
							fdel("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav")
							usr<<"<font color=red>Slot 1 Deleted!"
							spawn(15)usr.clickdelay=0
							usr.client.screen=null
							src.overlays=null
				else goto newchar
				newchar
				usr.client.screen=null
				var/titlerand=rand(1,5)
				if(titlerand==1)
					usr.loc = locate(43,392,8)
				if(titlerand==2)
					usr.loc = locate(43,296,8)
				if(titlerand==3)
					usr.loc = locate(43,192,8)
				if(titlerand==4)
					usr.loc = locate(43,96,8)
				if(titlerand==5)
					usr.loc = locate(43,9,8)
				usr.save_file_1=1
				usr.save_file_2=0
				usr.save_file_3=0
				usr.AddHUD()
		Slot2New
			icon_state="slot2"
			screen_loc="3,15:5"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav"))
					switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 2","Overwrite","Cancel"))
						if("Cancel")
							spawn(15)usr.clickdelay=0
							return
						else
							var/delname
							var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav")
							F["name"]>>delname
							var/savefile/N=new("World Save Files/Player Names.sav")
							NameList.Remove(lowertext(delname))
							N["NameList"]<<NameList
							fdel("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav")
							usr<<"<font color=red>Slot 2 Deleted!"
							spawn(15)usr.clickdelay=0
							usr.client.screen=null
							src.overlays=null
				else goto newchar
				newchar
				usr.client.screen=null
				var/titlerand=rand(1,5)
				if(titlerand==1)
					usr.loc = locate(43,392,8)
				if(titlerand==2)
					usr.loc = locate(43,296,8)
				if(titlerand==3)
					usr.loc = locate(43,192,8)
				if(titlerand==4)
					usr.loc = locate(43,96,8)
				if(titlerand==5)
					usr.loc = locate(43,9,8)
				usr.save_file_1=0
				usr.save_file_2=1
				usr.save_file_3=0
				usr.AddHUD()
		Slot3New
			icon_state="slot3"
			screen_loc="4,15:5"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav"))
					switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 3","Overwrite","Cancel"))
						if("Cancel")
							spawn(15)usr.clickdelay=0
							return
						else
							var/delname
							var/savefile/F=new("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav")
							F["name"]>>delname
							var/savefile/N=new("World Save Files/Player Names.sav")
							NameList.Remove(lowertext(delname))
							N["NameList"]<<NameList
							fdel("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav")
							usr<<"<font color=red>Slot 3 Deleted!"
							spawn(15)usr.clickdelay=0
							usr.client.screen=null
							src.overlays=null
				else goto newchar
				newchar
				usr.client.screen=null
				var/titlerand=rand(1,5)
				if(titlerand==1)
					usr.loc = locate(43,392,8)
				if(titlerand==2)
					usr.loc = locate(43,296,8)
				if(titlerand==3)
					usr.loc = locate(43,192,8)
				if(titlerand==4)
					usr.loc = locate(43,96,8)
				if(titlerand==5)
					usr.loc = locate(43,9,8)
				usr.save_file_1=0
				usr.save_file_2=0
				usr.save_file_3=1
				usr.AddHUD()
		Slot1Load
			icon_state="slot1"
			screen_loc="2,12:-13"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 1.sav"))
					usr.client.LoadChar(1)
				else
					usr<<"<font color=red>Slot 1 is empty!"
					spawn(15)if(usr)usr.clickdelay=0
		Slot2Load
			icon_state="slot2"
			screen_loc="3,12:-13"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 2.sav"))
					usr.client.LoadChar(2)
				else
					usr<<"<font color=red>Slot 2 is empty!"
					spawn(15)if(usr)usr.clickdelay=0
		Slot3Load
			icon_state="slot3"
			screen_loc="4,12:-13"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("World Save Files/Player Saves/[usr.ckey]-Slot 3.sav"))
					usr.client.LoadChar(3)
				else
					usr<<"<font color=red>Slot 3 is empty!"
					spawn(15)if(usr)usr.clickdelay=0
		Slot1Delete
			icon_state="slot1"
			screen_loc="2,8"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				usr.DeleteChar(1)
		Slot2Delete
			icon_state="slot2"
			screen_loc="3,8"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				usr.DeleteChar(2)
		Slot3Delete
			icon_state="slot3"
			screen_loc="4,8"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				usr.DeleteChar(3)
		ArrowL
			icon_state="arrowl"
			layer=999
			screen_loc="1,15"
			Click()
				if(src.icon_state=="arrowls")
					return
				if(src.icon_state=="arrowrs")
					return
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollSkin("RIGHT")
		ArrowR
			icon_state="arrowr"
			layer=999
			screen_loc="3,15"
			Click()
				if(src.icon_state=="arrowls")
					return
				if(src.icon_state=="arrowrs")
					return
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollSkin("LEFT")
		ArrowT
			icon_state="arrowt"
			layer=999
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollRace("UP")
		ArrowB
			icon_state="arrowb"
			layer=999
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollRace("DOWN")
		CharPreview
			icon_state="1race1"
			layer=998
			screen_loc="2,15"
		CharHair
			icon_state=""
			layer=999
			screen_loc="2,15"
		CharRace1
			icon='Login Races.dmi'
			icon_state="1-1"
			layer=999
			screen_loc="5,15"
		CharRace2
			icon='Login Races.dmi'
			icon_state="1-2"
			layer=999
			screen_loc="6,15"
		CharDesc
	//		icon='Android Desc.png'
			layer=999
			screen_loc="5,14"
		SPLeft
			icon_state="5"
			screen_loc="9,4:7"
		SPPL
			icon_state="0"
			screen_loc="13,11"
		SPPLAL
			icon_state="-"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("PL","L")
		SPPLAR
			icon_state="+"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("PL","R")
		SPKI
			icon_state="0"
			screen_loc="13,10"
		SPKIAL
			icon_state="-"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("KI","L")
		SPKIAR
			icon_state="+"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("KI","R")
		SPSTR
			icon_state="0"
			screen_loc="13,9"
		SPDEF
			icon_state="0"
			screen_loc="13,8"
		SPTRAIN
			icon_state="0"
			screen_loc="13,7"
		CharHair1
			icon_state="h1"
			screen_loc="9,16"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Adult Gohan.dmi'
				usr.newhair="Adult Gohan"
		CharHair2
			icon_state="h2"
			screen_loc="10,16"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Future Gohan.dmi'
				usr.newhair="Future Gohan"
		CharHair3
			icon_state="h3"
			screen_loc="11,16"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Goku.dmi'
				usr.newhair="Goku"
		CharHair4
			icon_state="h4"
			screen_loc="9,15"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Hercule.dmi'
				usr.newhair="Hercule"
		CharHair5
			icon_state="h5"
			screen_loc="10,15"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Raditz.dmi'
				usr.newhair="Raditz"
		CharHair6
			icon_state="h6"
			screen_loc="11,15"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Teen Gohan.dmi'
				usr.newhair="Teen Gohan"
		CharHair7
			icon_state="h7"
			screen_loc="9,14"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Trunks Long.dmi'
				usr.newhair="Trunks Long"
		CharHair8
			icon_state="h8"
			screen_loc="10,14"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=6&&usr.charrace!=7&&usr.charrace!=13)
					return
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
					O.overlays+='Hair - Vegeta.dmi'
				usr.newhair="Vegeta"
		CharHair0
			icon_state="h0"
			screen_loc="11,14"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(2)if(usr)usr.clickdelay=0
				for(var/obj/LoginStuff/CharHair/O in usr.client.screen)
					O.overlays=null
				usr.newhair="Bald"
		CharDiff
			CharDiff1
				icon='Star1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,9:11"
			CharDiff2
				icon='Star2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,9:11"
			CharDiff3
				icon='Star3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:24,9:11"
			CharDiff4
				icon='Star4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:36,9:11"
			CharDiff5
				icon='Star5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:48,9:11"
		CharPL
			CharPL1
				icon='PL1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,13"
			CharPL2
				icon='PL2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,13"
			CharPL3
				icon='PL3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:22,13"
			CharPL4
				icon='PL4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:34,13"
			CharPL5
				icon='PL5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:46,13"
		CharKI
			CharKI1
				icon='PL1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,12"
			CharKI2
				icon='PL2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,12"
			CharKI3
				icon='PL3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:22,12"
			CharKI4
				icon='PL4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:34,12"
			CharKI5
				icon='PL5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:46,12"
		CharStr
			CharStr1
				icon='PL1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,11"
			CharStr2
				icon='PL2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,11"
			CharStr3
				icon='PL3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:22,11"
			CharStr4
				icon='PL4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:34,11"
			CharStr5
				icon='PL5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:46,11"
		CharDef
			CharDef1
				icon='PL1.dmi'
				icon_state="3"
				layer=999
				screen_loc="3,10"
			CharDef2
				icon='PL2.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:12,10"
			CharDef3
				icon='PL3.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:22,10"
			CharDef4
				icon='PL4.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:34,10"
			CharDef5
				icon='PL5.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:46,10"
turf
	LoginStuff
		layer=5
		icon='Login Stuff.dmi'
		name="DBZ:Super"
		Title1
			icon='Title 0.png'
			density=1
		Title2
			icon='Title 2.png'
			density=1
		Title3
			icon='Title 3.jpg'
			density=1
		BG
			icon_state="bg"
		BGT
			icon_state="bgt"
		BGB
			icon_state="bgb"
		BGL
			icon_state="bgl"
		BGR
			icon_state="bgr"
		FrameL
			icon_state="framel"
			layer=999
		FrameR
			icon_state="framer"
			layer=999
		FrameT
			icon_state="framet"
			layer=999
		FrameB
			icon_state="frameb"
			layer=999
		Race
			icon='Login Races.dmi'
			icon_state="race"
		SPPLAL
			icon_state="-"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("PL","L")
		SPPLAR
			icon_state="+"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("PL","R")
		SPKIAL
			icon_state="-"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("KI","L")
		SPKIAR
			icon_state="+"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("KI","R")
		SPSTRAL
			icon_state="-"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("STR","L")
		SPSTRAR
			icon_state="+"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("STR","R")
		SPDEFAL
			icon_state="-"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("DEF","L")
		SPDEFAR
			icon_state="+"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("DEF","R")
		SPTRAINAL
			icon_state="-"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("TRAIN","L")
		SPTRAINAR
			icon_state="+"
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.DistributeStats("TRAIN","R")
		CharNew
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.AddSlots("New")
		CharLoad
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.AddSlots("Load")
		CharDelete
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.AddSlots("Delete")
		CharSave
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				if(usr.statpoints)
					switch(alert(usr,"You still have [usr.statpoints] stat point(s) left. Stat points increase training gains. Are you sure you want to continue without using your remaining points?","","Continue","Cancel"))
						if("Cancel")
							usr.clickdelay=0
							return
						if("Continue")
							if(!usr)return
							usr.CreateNewChar()
				else
					usr.CreateNewChar()
		CharCancel
			Click()
				if(usr.clickdelay)
					return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.client.screen=null
		Pl
			icon='PL.png'
		Ki
			icon='KI.png'
		Str
			icon='STR.png'
		Def
			icon='DEF.png'
		TrainingDiff
			icon='TD.png'
		CharCreation
			icon='Character Creation.png'
		StatDist
			icon='Stat Distribution.png'
		PointsLeft
			icon='Points Left.png'
		SaveChar
			icon='Save.png'
			pixel_y=14
		Stats
			icon='Stats.png'
mob
	var
		tmp
			charrace=1
			charskin=1
			newrace="Android"
			newskin="tan"
			newhair="Bald"
			statpoints=5
		statpl=0
		statki=0
		statstr=0
		statdef=0
		stattrain=0
	proc
		DistributeStats(S,A)
			switch(A)
				if("L")
					switch(S)
						if("PL")
							if(src.statpl<=0)
								return
							src.statpl-=1
							src.statpoints+=1
							for(var/obj/LoginStuff/SPPL/X in src.client.screen)
								X.icon_state="[src.statpl]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("KI")
							if(src.statki<=0)
								return
							src.statki-=1
							src.statpoints+=1
							for(var/obj/LoginStuff/SPKI/X in src.client.screen)
								X.icon_state="[src.statki]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("STR")
							if(src.statstr<=0)
								return
							src.statstr-=1
							src.statpoints+=1
							for(var/obj/LoginStuff/SPSTR/X in src.client.screen)
								X.icon_state="[src.statstr]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("DEF")
							if(src.statdef<=0)
								return
							src.statdef-=1
							src.statpoints+=1
							for(var/obj/LoginStuff/SPDEF/X in src.client.screen)
								X.icon_state="[src.statdef]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("TRAIN")
							if(src.stattrain<=0)
								return
							src.stattrain-=1
							src.statpoints+=1
							for(var/obj/LoginStuff/SPTRAIN/X in src.client.screen)
								X.icon_state="[src.stattrain]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
				if("R")
					switch(S)
						if("PL")
							if(src.statpoints<=0)
								return
							src.statpl+=1
							src.statpoints-=1
							for(var/obj/LoginStuff/SPPL/X in src.client.screen)
								X.icon_state="[src.statpl]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("KI")
							if(src.statpoints<=0)
								return
							src.statki+=1
							src.statpoints-=1
							for(var/obj/LoginStuff/SPKI/X in src.client.screen)
								X.icon_state="[src.statki]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("STR")
							if(src.statpoints<=0)
								return
							src.statstr+=1
							src.statpoints-=1
							for(var/obj/LoginStuff/SPSTR/X in src.client.screen)
								X.icon_state="[src.statstr]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("DEF")
							if(src.statpoints<=0)
								return
							src.statdef+=1
							src.statpoints-=1
							for(var/obj/LoginStuff/SPDEF/X in src.client.screen)
								X.icon_state="[src.statdef]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"
						if("TRAIN")
							if(src.statpoints<=0)
								return
							src.stattrain+=1
							src.statpoints-=1
							for(var/obj/LoginStuff/SPTRAIN/X in src.client.screen)
								X.icon_state="[src.stattrain]"
							for(var/obj/LoginStuff/SPLeft/X in src.client.screen)
								X.icon_state="[src.statpoints]"

		AddHUD()
			src.client.screen=null
			sleep(1)
			if(!src)return
			src.client.screen+=new/obj/LoginStuff/CharRace1
			src.client.screen+=new/obj/LoginStuff/CharRace2
			src.client.screen+=new/obj/LoginStuff/CharHair1
			src.client.screen+=new/obj/LoginStuff/CharHair2
			src.client.screen+=new/obj/LoginStuff/CharHair3
			src.client.screen+=new/obj/LoginStuff/CharHair4
			src.client.screen+=new/obj/LoginStuff/CharHair5
			src.client.screen+=new/obj/LoginStuff/CharHair6
			src.client.screen+=new/obj/LoginStuff/CharHair7
			src.client.screen+=new/obj/LoginStuff/CharHair8
			src.client.screen+=new/obj/LoginStuff/CharHair0
			src.client.screen+=new/obj/LoginStuff/CharPreview
			src.client.screen+=new/obj/LoginStuff/CharHair
			src.client.screen+=new/obj/LoginStuff/SPLeft
			src.client.screen+=new/obj/LoginStuff/ArrowL
			src.client.screen+=new/obj/LoginStuff/ArrowR
			src.client.screen+=new/obj/LoginStuff/CharDiff/CharDiff1
			src.client.screen+=new/obj/LoginStuff/CharDiff/CharDiff2
			src.client.screen+=new/obj/LoginStuff/CharDiff/CharDiff3
			src.client.screen+=new/obj/LoginStuff/CharDiff/CharDiff4
			src.client.screen+=new/obj/LoginStuff/CharDiff/CharDiff5
			src.client.screen+=new/obj/LoginStuff/CharPL/CharPL1
			src.client.screen+=new/obj/LoginStuff/CharPL/CharPL2
			src.client.screen+=new/obj/LoginStuff/CharPL/CharPL3
			src.client.screen+=new/obj/LoginStuff/CharPL/CharPL4
			src.client.screen+=new/obj/LoginStuff/CharPL/CharPL5
			src.client.screen+=new/obj/LoginStuff/CharKI/CharKI1
			src.client.screen+=new/obj/LoginStuff/CharKI/CharKI2
			src.client.screen+=new/obj/LoginStuff/CharKI/CharKI3
			src.client.screen+=new/obj/LoginStuff/CharKI/CharKI4
			src.client.screen+=new/obj/LoginStuff/CharKI/CharKI5
			src.client.screen+=new/obj/LoginStuff/CharStr/CharStr1
			src.client.screen+=new/obj/LoginStuff/CharStr/CharStr2
			src.client.screen+=new/obj/LoginStuff/CharStr/CharStr3
			src.client.screen+=new/obj/LoginStuff/CharStr/CharStr4
			src.client.screen+=new/obj/LoginStuff/CharStr/CharStr5
			src.client.screen+=new/obj/LoginStuff/CharDef/CharDef1
			src.client.screen+=new/obj/LoginStuff/CharDef/CharDef2
			src.client.screen+=new/obj/LoginStuff/CharDef/CharDef3
			src.client.screen+=new/obj/LoginStuff/CharDef/CharDef4
			src.client.screen+=new/obj/LoginStuff/CharDef/CharDef5
			src.client.screen+=new/obj/LoginStuff/SPPL
			src.client.screen+=new/obj/LoginStuff/SPKI
			src.client.screen+=new/obj/LoginStuff/SPSTR
			src.client.screen+=new/obj/LoginStuff/SPDEF
			src.client.screen+=new/obj/LoginStuff/SPTRAIN
			spawn(15)if(src)src.clickdelay=0
		ScrollRace(var/A)
			if(A=="UP")
				src.charrace+=1
				if(src.charrace>14)
					charrace=1
			if(A=="DOWN")
				src.charrace-=1
				if(src.charrace<1)
					charrace=14
			if(src.charrace==1||src.charrace==6||src.charrace==7||src.charrace==13)
				for(var/obj/LoginStuff/ArrowL/AL in src.client.screen)
					AL.icon_state="arrowl"
				for(var/obj/LoginStuff/ArrowR/AR in src.client.screen)
					AR.icon_state="arrowr"
				for(var/obj/LoginStuff/CharPreview/CP in src.client.screen)
					CP.icon_state="[charskin]race[charrace]"
			else
				for(var/obj/LoginStuff/ArrowL/AL in src.client.screen)
					AL.icon_state="arrowls"
				for(var/obj/LoginStuff/ArrowR/AR in src.client.screen)
					AR.icon_state="arrowrs"
				for(var/obj/LoginStuff/CharPreview/CP in src.client.screen)
					CP.icon_state="race[charrace]"
			for(var/obj/LoginStuff/CharRace1/CR1 in src.client.screen)
				for(var/obj/LoginStuff/CharRace2/CR2 in src.client.screen)
					switch(charrace)
						if(1)
							CR1.icon_state="1-1"
							CR2.icon_state="1-2"
							src.newrace="Android"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=999
						if(2)
							CR1.icon_state="2-1"
							CR2.icon_state="2-2"
							src.newrace="Bio-Android"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(3)
							CR1.icon_state="3-1"
							CR2.icon_state="3-2"
							src.newrace="Changeling"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(4)
							CR1.icon_state="4"
							CR2.icon_state=""
							src.newrace="Demon"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(5)
							CR1.icon_state="5-1"
							CR2.icon_state="5-2"
							src.newrace="Dragon"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(6)
							CR1.icon_state="6-1"
							CR2.icon_state="6-2"
							src.newrace="Half Saiyan"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=999
						if(7)
							CR1.icon_state="7"
							CR2.icon_state=""
							src.newrace="Human"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=999
						if(8)
							CR1.icon_state="8"
							CR2.icon_state=""
							src.newrace="Kai"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(9)
							CR1.icon_state="9"
							CR2.icon_state=""
							src.newrace="Konat"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(10)
							CR1.icon_state="10"
							CR2.icon_state=""
							src.newrace="Majin"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(11)
							CR1.icon_state="11-1"
							CR2.icon_state="11-2"
							src.newrace="Namekian"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(12)
							CR1.icon_state="12-1"
							CR2.icon_state="12-2"
							src.newrace="Saibaman"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
						if(13)
							CR1.icon_state="13-1"
							CR2.icon_state="13-2"
							src.newrace="Saiyan"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=999
						if(14)
							CR1.icon_state="14-1"
							CR2.icon_state="14-2"
							src.newrace="Tuffle"
							for(var/obj/LoginStuff/CharHair/O in src.client.screen)
								O.layer=1
			for(var/obj/LoginStuff/CharPL/P in src.client.screen)
				for(var/obj/LoginStuff/CharKI/K in src.client.screen)
					for(var/obj/LoginStuff/CharStr/S in src.client.screen)
						for(var/obj/LoginStuff/CharDef/D in src.client.screen)
							for(var/obj/LoginStuff/CharDiff/T in src.client.screen)
								switch(charrace)
									if(1)
										P.icon_state="4"
										K.icon_state="4"
										S.icon_state="4"
										D.icon_state="4"
										T.icon_state="4"
									if(2)
										P.icon_state="4"
										K.icon_state="3"
										S.icon_state="4"
										D.icon_state="4"
										T.icon_state="3"
									if(3)
										P.icon_state="2"
										K.icon_state="2"
										S.icon_state="3"
										D.icon_state="3"
										T.icon_state="2"
									if(4)
										P.icon_state="2"
										K.icon_state="3"
										S.icon_state="2"
										D.icon_state="3"
										T.icon_state="1"
									if(5)
										P.icon_state="5"
										K.icon_state="5"
										S.icon_state="5"
										D.icon_state="5"
										T.icon_state="5"
									if(6)
										P.icon_state="3"
										K.icon_state="2"
										S.icon_state="2"
										D.icon_state="3"
										T.icon_state="1"
									if(7)
										P.icon_state="2"
										K.icon_state="2"
										S.icon_state="3"
										D.icon_state="3"
										T.icon_state="1"
									if(8)
										P.icon_state="2"
										K.icon_state="3"
										S.icon_state="2"
										D.icon_state="3"
										T.icon_state="1"
									if(9)
										P.icon_state="4"
										K.icon_state="2"
										S.icon_state="5"
										D.icon_state="2"
										T.icon_state="3"
									if(10)
										P.icon_state="3"
										K.icon_state="3"
										S.icon_state="4"
										D.icon_state="4"
										T.icon_state="3"
									if(11)
										P.icon_state="3"
										K.icon_state="4"
										S.icon_state="3"
										D.icon_state="4"
										T.icon_state="4"
									if(12)
										P.icon_state="3"
										K.icon_state="2"
										S.icon_state="3"
										D.icon_state="2"
										T.icon_state="1"
									if(13)
										P.icon_state="3"
										K.icon_state="2"
										S.icon_state="3"
										D.icon_state="2"
										T.icon_state="2"
									if(14)
										P.icon_state="3"
										K.icon_state="4"
										S.icon_state="5"
										D.icon_state="4"
										T.icon_state="4"
		ScrollSkin(var/T)
			if(T=="LEFT")
				src.charskin+=1
				if(src.charskin>6)
					charskin=1
			if(T=="RIGHT")
				src.charskin-=1
				if(src.charskin<1)
					src.charskin=6
			for(var/obj/LoginStuff/CharPreview/CP in src.client.screen)
				CP.icon_state="[src.charskin]race[src.charrace]"
			if(src.charskin==1)
				src.newskin="tan"
			if(src.charskin==2)
				src.newskin="white"
			if(src.charskin==3)
				src.newskin="dark"
			if(src.charskin==4)
				src.newskin="tanf"
			if(src.charskin==5)
				src.newskin="whitef"
			if(src.charskin==6)
				src.newskin="darkf"
		CreateNewChar()
			var/mob/mobcreation=new/mob/PC()
			mobcreation.name="PC-[src.key]-PC"
			var/newname = null
			newname=input("What's your name?")as text
			var/lowername=lowertext(newname)
			var/ntxt1=uppertext(copytext(newname,1,2))
			var/ntxt2=copytext(newname,2)
			newname="[ntxt1][ntxt2]"
			if(NameList.Find(lowername))
				alert("[newname] is already in use. Try another name.")
				del(mobcreation)
				src.CreateNewChar()
			for(var/i=1,i<=lentext(lowername),i++)
				if(Allowed_Letters.Find(copytext(lowername,i,i+1))==0)
					alert(src,"Only letters A-Z are allowed.")
					del(mobcreation)
					src.CreateNewChar()
			if(lentext(newname) < 2)
				alert("Your name must contain at least 2 characters.")
				del(mobcreation)
				src.CreateNewChar()
			if(lentext(newname) > 15)
				alert("Your name cannot exceed 15 characters.")
				del(mobcreation)
				src.CreateNewChar()
			if(isnull(newname) | newname == "" | !newname)
				alert("Your name cannot be blank.")
				del(mobcreation)
				src.CreateNewChar()
			if(lowername=="pc"||lowername=="cancel"||lowername=="nevermind"||lowername=="")
				alert("That name is not allowed.")
				del(mobcreation)
				src.CreateNewChar()
			if(isnull(newname) | newname == " " | !newname)
				alert("Your name cannot be blank.")
				del(mobcreation)
				src.CreateNewChar()
			else
				newname=html_encode(newname)
				var/txt1=uppertext(copytext(newname,1,2))
				var/txt2=copytext(newname,2)
				newname="[txt1][txt2]"
				var/savefile/N = new("World Save Files/Player Names.sav")
				NameList.Add(lowername)
				N["NameList"]<<NameList
			src.client.screen+=new/obj/LoginStuff/SavingChar1
			switch(src.newrace)
				if("Android")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Technique/SelfDestruct
					src.ApplyIconHair()
				if("Bio-Android")
					src.icon='Bio Android - Form 1.dmi'
					mobcreation.contents += new/obj/Technique/Absorb
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Technique/Regenerate
					mobcreation.learn_kienzandisk=1
					mobcreation.learn_absorb=1
					mobcreation.contents+=new/obj/Technique/KienzanDisk
				if("Changeling")
					src.icon='Changling - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.learn_kienzandisk=1
					mobcreation.contents+=new/obj/Technique/KienzanDisk
				if("Demon")
					src.icon='Demon - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/FlameBullet
				if("Dragon")
					src.icon='Syn.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Technique/WhirlWindSpin
					mobcreation.contents += new/obj/Technique/KiBlast
				if("Half Saiyan")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					src.ApplyIconHair()
				if("Human")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.learn_distructodisk=1
					mobcreation.contents+=new/obj/Technique/DistructoDisk
					src.ApplyIconHair()
				if("Kai")
					src.icon='Kai - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
				if("Konat")
					src.icon='Konat - Form 1.dmi'
					mobcreation.contents += new/obj/Technique/KiBlast
				if("Majin")
					src.icon='Majin - Form 1.dmi'
					mobcreation.contents += new/obj/Technique/Regenerate
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Technique/FatWrap
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Technique/CandyRay
				if("Namekian")
					src.icon='Namek - Normal.dmi'
					mobcreation.contents += new/obj/Technique/Regenerate
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Technique/KiBlast
				if("Saibaman")
					src.icon='Saibaman - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
				if("Saiyan")
					var/genetype=rand(1,10001)
					if(genetype==10001)
						mobcreation.legendary_chromosome = 1
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.contents += new/obj/Technique/KiBlast
					if(genetype<5000)
						mobcreation.rage_chromosome = 1
						mobcreation.contents += new/obj/Technique/KiBlast
					if(genetype>=5000&&genetype<=10000)
						mobcreation.train_chromosome = 1
						mobcreation.contents += new/obj/Technique/KiBlast
					src.ApplyIconHair()
				if("Tuffle")
					src.icon='Bebi - Form 1.dmi'
					mobcreation.contents += new/obj/Technique/Infect
					mobcreation.contents += new/obj/Technique/KiBlast
			mobcreation.save_file_1=src.save_file_1
			mobcreation.save_file_2=src.save_file_2
			mobcreation.save_file_3=src.save_file_3
			mobcreation.icon=src.icon
			mobcreation.hair=src.hair
			mobcreation.overlays+=src.overlays
			mobcreation.race=newrace
			mobcreation.skin=newskin
			mobcreation.hair=newhair
			mobcreation.name=newname
			mobcreation.statpl=src.statpl
			mobcreation.statki=src.statki
			mobcreation.statstr=src.statstr
			mobcreation.statdef=src.statdef
			mobcreation.stattrain=src.stattrain
			mobcreation.powerlevel=300
			mobcreation.powerlevel_max=300
			mobcreation.ki=300
			mobcreation.ki_max=300
			mobcreation.strength=100
			mobcreation.strength_max=100
			mobcreation.defence=100
			mobcreation.defence_max=100
			mobcreation.zenni=500
			mobcreation.karma="Good"
			mobcreation.karma_rating=1
			if(client.IsByondMember())
				mobcreation.level=125
				mobcreation.pk=1
				mobcreation.powerlevel=45000
				mobcreation.powerlevel_max=45000
				mobcreation.ki=45000
				mobcreation.ki_max=45000
				mobcreation.strength=20000
				mobcreation.strength_max=20000
				mobcreation.defence=20000
				mobcreation.defence_max=20000
				mobcreation.zenni=10000
			mobcreation.energy_code=rand(0000001,9999999)
			sleep(20)
			if(!src)return
			src.client.screen=null
			if(client.IsByondMember())
				src<<"<font color=#993333>For being a BYOND member, you have received some zenni and a small increase on your basic attributes.</font>"
			world << "<font color = #1E90FF>Client Information: <font color = white>Everyone welcome our newest player: [mobcreation.name] the [mobcreation.race]!"
			src.client.mob=mobcreation
			del(src)
mob/var/save_file_1 = 0
mob/var/save_file_2 = 0
mob/var/save_file_3 = 0
mob/var/displayicon = 0
var/list/NameList = list()
var/list/Allowed_Letters = list ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," ")
mob/Login()
	..()
mob/Guest
	Login()
		winset(src,"mapwindow.map","icon-size=32")
		if(src.client.key == "Guest")
			del(src.client)
		src.CheckBan()
		if(src.MK()==TRUE)
			del(src)
		var/titlerand=rand(1,10)
		if(titlerand==1)
			src.loc = locate(9,392,8)
		if(titlerand==2)
			src.loc = locate(9,296,8)
		if(titlerand==3)
			src.loc = locate(9,192,8)
		if(titlerand==4)
			src.loc = locate(9,96,8)
		if(titlerand==5)
			src.loc = locate(9,9,8)
		if(titlerand==6)
			src.loc = locate(26,392,8)
		if(titlerand==7)
			src.loc = locate(26,296,8)
		if(titlerand==8)
			src.loc = locate(26,192,8)
		if(titlerand==9)
			src.loc = locate(26,96,8)
		if(titlerand==10)
			src.loc = locate(26,9,8)
mob
	proc
		UpdateDisplayIcon()
			if(src.Oozaru)return
			var/icon/PI = icon(src.icon,"",SOUTH)
			for(var/X in src.overlays)
				PI.Blend(icon(X:icon,"",SOUTH),ICON_OVERLAY)
			for(var/X in src.underlays)
				PI.Blend(icon(X:icon,"",SOUTH),ICON_UNDERLAY)
			src.displayicon=PI
		ApplyIconHair()
			if(src.newskin=="tan")
				src.skin="tan"
				src.icon = 'Male - Tan.dmi'
			if(src.newskin=="white")
				src.skin="white"
				src.icon = 'Male - White.dmi'
			if(src.newskin=="dark")
				src.skin="dark"
				src.icon = 'Male - Dark.dmi'
			if(src.newskin=="tanf")
				src.skin="tanf"
				src.icon = 'Female - Tan.dmi'
			if(src.newskin=="whitef")
				src.skin="whitef"
				src.icon = 'Female - White.dmi'
			if(src.newskin=="darkf")
				src.skin="darkf"
				src.icon = 'Female - Dark.dmi'
			if(src.newhair=="Bald")
				src.hair = "Bald"
			if(src.newhair=="Goku")
				src.hair = "Goku"
				src.hair_icon = 'Hair - Goku.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Vegeta")
				src.hair = "Vegeta"
				src.hair_icon = 'Hair - Vegeta.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Teen Gohan")
				src.hair = "Teen Gohan"
				src.hair_icon = 'Hair - Teen Gohan.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Adult Gohan")
				src.hair = "Adult Gohan"
				src.hair_icon = 'Hair - Adult Gohan.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Future Gohan")
				src.hair = "Future Gohan"
				src.hair_icon = 'Hair - Future Gohan.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Hercule")
				src.hair = "Hercule"
				src.hair_icon = 'Hair - Hercule.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Raditz")
				src.hair = "Raditz"
				src.hair_icon = 'Hair - Raditz.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Trunks Long")
				src.hair = "Trunks Long"
				src.hair_icon = 'Hair - Trunks Long.dmi'
				src.overlays += src.hair_icon