mob/var/tab_vitals = 1
mob/var/tab_skills = 1
mob/var/tab_quests = 1
mob/var/tab_inventory = 1
mob/var/ooc_on = 1
mob/var/gooc_on = 1
mob/var/auction_on = 1
mob/var/tab_guild = 1
mob/var/wisper_on = 1
mob/var/tab_saga = 1
mob/var/attackguild=0
mob/var/attackparty=0
mob/var/tmp/attacktarget=0
mob
	var
		trans1t=""
		trans2t=""
		trans3t=""
		trans4t=""
		trans5t=""
		trans6t=""
mob/PC
	verb
		Options()
			set category = "Channels"
			switch(input("What would you like to configure?","Options",) in list("Toogle Tabs","Chat Options","Transformation Chart","Technique Chart","Cancel"))
				if("Cancel")
					return
				if("Toogle Tabs")
					switch(input("Which Tab?","Toogle Tabs") in list ("Guild Members","Sagas","Vitals","Skills","Quests","Inventory","Cancel"))
						if("Cancel")
							return
						if("Sagas")
							switch(alert("On or Off","","On","Off"))
								if("On")
									usr.tab_saga = 1
								if("Off")
									usr.tab_saga = 0
						if("Guild Members")
							switch(alert("On or Off","","On","Off"))
								if("On")
									usr.tab_guild = 1
								if("Off")
									usr.tab_guild = 0
						if("Vitals")
							switch(alert("On or Off","","On","Off"))
								if("On")
									usr.tab_vitals = 1
								if("Off")
									usr.tab_vitals = 0
						if("Skills")
							switch(alert("On or Off","","On","Off"))
								if("On")
									usr.tab_skills = 1
								if("Off")
									usr.tab_skills = 0
						if("Quests")
							switch(alert("On or Off","","On","Off"))
								if("On")
									usr.tab_quests = 1
								if("Off")
									usr.tab_quests = 0
						if("Inventory")
							switch(alert("On or Off","","On","Off"))
								if("On")
									usr.tab_inventory = 1
								if("Off")
									usr.tab_inventory = 0
				if("Chat Options")
					switch(input("What Options would you like to Configure?","Options") in list ("Toggle OOC","Toggle Guild OOC","Toggle Whispers","Toggle Trade","Cancel"))
						if("Toggle Guild OOC")
							switch(alert("On or Off","","On","Off"))
								if("On")
									src.gooc_on = 1
									src << "You turn your Guild OOC \green ON"
									for(var/mob/PC/C in world)
										if(C.guild_name == src.guild_name)
											C << "[src] has turned his Guild OOC \green ON"
								if("Off")
									src.gooc_on = 0
									src << "You turn your Guild OOC \red OFF"
									for(var/mob/PC/C in world)
										if(C.guild_name == src.guild_name)
											C << "[src] has turned his Guild OOC \red OFF"
						if("Toggle OOC")
							switch(alert("On or Off","","On","Off"))
								if("On")
									src.ooc_on = 1
									src << "You turned your OOC \green ON"
									world << "[src] turned his OOC \green ON"
								if("Off")
									src.ooc_on = 0
									src << "You turned your OOC \red OFF"
									world << "[src] turned his OOC \red OFF"

						if("Toggle Whispers")
							switch(alert("On or Off","","On","Off"))
								if("On")
									src.wisper_on = 1
									src << "You turned your Whispers \green ON"
									world << "[src] turned his Whispers \green ON"
								if("Off")
									src.wisper_on = 0
									src << "You turned your Whispers \red OFF"
									world << "[src] turned his Whispers \red OFF"
						if("Toggle Trade")
							switch(alert("On or Off","","On","Off"))
								if("On")
									src.tradeon = 1
									src << "You turned your Trade channel \green ON"
								if("Off")
									src.tradeon = 0
									src << "You turned your Trade channel \red OFF"
				if("Transformation Chart")
					usr<<browse(null)
					usr.transfile()
				if("Technique Chart")
					usr<<browse(null)
					usr.techsfile()
	verb
		Custom_Attack_Options()
			set category = "Channels"
			switch(input("Customize What?","Custom Attack") in list ("Ki Use","Change Name","Homing/Non-Homing","Use Custom Points","Change Battle Text","Change Icon","View Custom Stats","Cancel"))
				if("Change Name")
					var/T = input("Whats the name of your Custom Attack?")as text
					if(Check_For_Spam(T,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					if(lentext(T) > 15)
						alert("Cannot exceed 15 characters.")
						return
					T = html_encode(T)
					usr.custom_name = T
					return
				if("Change Icon State")
					switch(alert("What do you want to do?","Change Icon State","Set Default","Custom State","Cancel"))
						if("Custom State")
							alert("Use a proper Icon, also, it cannot be invisible")
							var/c_icon = input("Choose an icon")as null|icon
							if(!length(c_icon))
								return
							if(length(c_icon) > 10000)
								usr << "File is too large 10kb Max"
								return
							usr.custom_state = c_icon
							return
						if("Set Default")
							usr.custom_state = ""
							return
						if("Cancel")
							return
				if("Homing/Non-Homing")
					switch(alert("Do you want your attack to be Homing or Straight.(Homing is weaker than Straight)","Homing/Non-Homing","Straight","Homing"))
						if("Homing")
							usr.custom_homing = 1
							usr << "\white [src.custom_name] type set:\red Homing"
							return
						if("Straight")
							usr.custom_homing = 0
							usr << "\white [src.custom_name] type set:\red Straight"
							return
				if("Kill/KO")
					switch(alert("Do you want your attack to Kill or KO opponents?","Kill/KO","Kill","KO"))
						if("Kill")
							usr.custom_kill = 1
							usr << "\white [src.custom_name] set to:\red Kill"
						if("KO")
							usr.custom_kill = 0
							usr << "\white [src.custom_name] set to:\red KO"
				if("Use Custom Points")
					if(usr.spam_delay)
						return
					usr.spam_delay=1
					switch(input("Increase What?","Custom Attack") in list ("Speed","Damage","Knockback","Distance","Cancel"))
						if("Knockback")
							var/custom_piercing = input("How many custom points do u want to use?")as num
							if(custom_piercing > usr.custom_points)
								alert("You dont have that many custom points")
								usr.spam_delay=0
								return
							if(custom_piercing <= 0)
								usr.spam_delay=0
								return
							if(usr.custom_piercing >= 200)
								usr << "Custom Knockback is already maxed."
								usr.spam_delay=0
								return
							if(custom_piercing <= usr.custom_points)
								usr.custom_points -= round(custom_piercing)
								usr.custom_piercing += round(custom_piercing)
								usr << "Custom Attack Knockback +[custom_piercing]"
								if(usr.custom_piercing >= 200)
									usr.custom_piercing = 200
								usr.spam_delay=0
								return
						if("Distance")
							var/custom_distance = input("How many custom points do u want to use?")as num
							if(custom_distance > usr.custom_points)
								alert("You dont have that many custom points")
								usr.spam_delay=0
								return
							if(custom_distance <= 0)
								usr.spam_delay=0
								return
							if(usr.custom_distance >= 1000)
								usr << "Custom Distance is already maxed."
								usr.spam_delay=0
								return
							if(custom_piercing <= usr.custom_points)
								usr.custom_points -= round(custom_distance)
								usr.custom_distance += round(custom_distance)
								usr << "Custom Attack Distance +[round(custom_piercing)]"
								if(usr.custom_distance >= 1000)
									usr.custom_distance = 1000
								usr.spam_delay=0
								return
						if("Speed")
							var/custom_delay = input("How many custom points do u want to use?")as num
							if(custom_delay > usr.custom_points)
								alert("You dont have that many custom points")
								usr.spam_delay=0
								return
							if(custom_delay <= 0)
								usr.spam_delay=0
								return
							if(usr.custom_delay <= 0)
								usr << "Custom Speed is already maxed."
								usr.spam_delay=0
								return
							if(custom_delay <= usr.custom_points)
								usr.custom_points -= custom_delay
								usr.custom_delay -= custom_delay
								usr << "Custom Attack Speed +[custom_delay]"
								if(usr.custom_delay < 0)
									usr.custom_delay = 0
								usr.spam_delay=0
								return
						if("Damage")
							var/custom_damage = input("How many custom points do u want to use?")as num
							if(custom_damage > usr.custom_points)
								alert("You dont have that many custom points")
								usr.spam_delay=0
								return
							if(custom_damage < 0)
								usr.spam_delay=0
								return
							if(custom_damage <= usr.custom_points)
								usr.custom_points -= custom_damage
								usr.custom_damage += custom_damage * 10
								usr << "Custom Attack Damage +[custom_damage * 10]"
								usr.spam_delay=0
								return
						if("Cancel")
							usr.spam_delay=0
							return
				if("Ki Use")
					var/custom_ki = input("How much Ki % do you want to put into your custom attack?")as num
					if(custom_ki > 100)
						alert("Ki ammount automaticaly set to 100%")
						usr.custom_ki = 1
					if(custom_ki <= 0)
						alert("Ki ammount automaticaly set to 1%")
						usr.custom_ki = 0.01
					if(custom_ki > 0 && custom_ki <= 100)
						alert("Ki ammount set to [custom_ki]%")
						usr.custom_ki = custom_ki/100
				if("Change Battle Text")
					var/custom_txt1 = input("Whats the Starting line of your custom attack's battle text?")as text
					if(Check_For_Spam(custom_txt1,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					if(lentext(custom_txt1) > 15)
						alert("Cannot exceed 15 characters.")
						return
					custom_txt1 = html_encode(custom_txt1)
					usr.custom_txt_1 = custom_txt1
					var/custom_txt2 = input("Whats the Ending line of your custom attack's battle text?")as text
					if(Check_For_Spam(custom_txt2,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					if(lentext(custom_txt2) > 15)
						alert("Cannot exceed 15 characters.")
						return
					custom_txt2 = html_encode(custom_txt2)
					usr.custom_txt_2 = custom_txt2
					return
				if("Change Icon")
					switch(input("What do u want?","Change Icon") in list ("Custom Style 1","Custom Style 2","Custom Style 3","My Own Icon","Cancel"))
						if("Custom Style 1")
							usr.custom_icon='Custom1.dmi'
							var/r=input("How much Red do you want?")as num
							var/g=input("How much Green do you want?")as num
							var/b=input("How much Blue do you want?")as num
							usr.custom_icon += rgb(r,g,b)
							return
						if("Custom Style 2")
							usr.custom_icon='Custom2.dmi'
							var/r=input("How much Red do you want?")as num
							var/g=input("How much Green do you want?")as num
							var/b=input("How much Blue do you want?")as num
							usr.custom_icon += rgb(r,g,b)
							return
						if("Custom Style 3")
							usr.custom_icon='Custom3.dmi'
							var/r=input("How much Red do you want?")as num
							var/g=input("How much Green do you want?")as num
							var/b=input("How much Blue do you want?")as num
							usr.custom_icon += rgb(r,g,b)
							return
						if("My Own Icon")
							alert("Make sure that the icon has no icon state. If you are caught using an invisible icon, you will get punished.")
							var/cicon = input("Choose an icon.")as null|icon
							if(length(cicon) > 10000)
								usr << "File is too large 10kb Max"
								return
							usr.custom_icon = cicon
							return
						if("Cancel")
							return
				if("View Custom Stats")
					if(usr.spam_delay)
						return
					usr.spam_delay = 1
					spawn(25)usr.spam_delay = 0
					usr.custom_lvl = round((usr.custom_damage/20)+(usr.custom_piercing/5)-(usr.custom_delay/5))
					if(usr.custom_lvl < 1)
						usr.custom_lvl = 1
					usr << "<center>\white -----------------------------------"
					usr << "<center><font size = +2>[usr.custom_name]"
					usr << "<center><font size = +1>\white Level:\red [round(usr.custom_lvl)]"
					usr << "<center><font size = +1>\white Power:\red [round(usr.custom_damage)]"
					usr << "<center><font size = +1>\white Delay:\red [usr.custom_delay]"
					usr << "<center><font size = +1>\white Knockback:\red [round(usr.custom_piercing/2)]%"
					usr << "<center><font size = +1>\white Ki Usage:\red [round(usr.custom_ki * 100)]%"
					var/type
					if(usr.custom_homing)
						type = "Homing"
					if(!usr.custom_homing)
						type = "Straight"
					usr << "<center><font size = +1>\white Type:\red [type]"
					var/kk
					if(usr.custom_kill)
						kk = "Kill"
					if(!usr.custom_kill)
						kk = "KO"
					usr << "<center><font size = +1>\white Set to:\red [kk]"
					usr << "<center>\white -----------------------------------"
	verb
		Screen_Size()
			set category = "Channels"
			switch(input("What Screen size?","Screen Size",) in list("1","2","3","4","5","6","7","8","Cancel"))
				if("1")
					client.view = 1
				if("2")
					client.view = 2
				if("3")
					client.view = 3
				if("4")
					client.view = 4
				if("5")
					client.view = 5
				if("6")
					client.view = 6
				if("7")
					client.view = 7
				if("8")
					client.view = 8
				if("Cancel")
					return
	verb
		Technique_Options()
			set category = "Channels"
			switch(input("What do you wish to change?")in list("Ki Usage","Homing Settings","Kill/KO","Transformation Options","Transformation Text","Instant Transmission Options","Cancel"))
				if("Transformation Text")
					alert(usr,"Not all races go up to Form 6. If you don't want any text, leave it blank. HTML is NOT allowed. 45 characters max.")
					var/t1=input(usr,"Type in the text you want to say when you transform into your First form/Invert Power:")as text
					t1=html_encode(t1)
					if(lentext(t1)>45)
						usr<<"45 characters max."
						return
					if(Check_For_Spam(t1,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					usr.trans1t=t1
					var/t2=input(usr,"Type in the text you want to say when you transform into your Second form:")as text
					t2=html_encode(t2)
					if(lentext(t2)>45)
						usr<<"45 characters max."
						return
					if(Check_For_Spam(t2,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					usr.trans2t=t2
					var/t3=input(usr,"Type in the text you want to say when you transform into your Third form:")as text
					t3=html_encode(t3)
					if(lentext(t3)>45)
						usr<<"45 characters max."
						return
					if(Check_For_Spam(t3,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					usr.trans3t=t3
					var/t4=input(usr,"Type in the text you want to say when you transform into your Fourth form:")as text
					t4=html_encode(t4)
					if(lentext(t4)>45)
						usr<<"45 characters max."
						return
					if(Check_For_Spam(t4,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					usr.trans4t=t4
					var/t5=input(usr,"Type in the text you want to say when you transform into your Fifth form:")as text
					t5=html_encode(t5)
					if(lentext(t5)>45)
						usr<<"45 characters max."
						return
					if(Check_For_Spam(t5,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					usr.trans5t=t5
					var/t6=input(usr,"Type in the text you want to say when you transform into your Sixth form:")as text
					t6=html_encode(t6)
					if(lentext(t6)>45)
						usr<<"45 characters max."
						return
					if(Check_For_Spam(t6,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					usr.trans6t=t6
				if("Homing Settings")
					switch(alert("What do you wish to change?","","Change Target Options","Cancel"))
						if("Cancel")
							return
						if("Set Target Name")
							var/nm=input("Set the target's name. (Case sensitive)")as text
							if(!nm)return
							usr.attacktarget="[nm]"
						if("Change Target Options")
							switch(alert("Do you want your homing attacks to target your GUILD members?","Guild Members","Yes","No"))
								if("Yes")
									usr.attackguild=1
								else
									usr.attackguild=0
							switch(alert("Do you want your homing attacks to target your PARTY members?","PARTY Members","Yes","No"))
								if("Yes")
									usr.attackparty=1
								else
									usr.attackparty=0
				if("Instant Transmission Options")
					switch(alert("Do you wish others to be able to Instant Transmit you?","IT","Yes","No"))
						if("Yes")
							usr.it_taken = 1
							return
						if("No")
							usr.it_taken = 0
							return
				if("Transformation Options")
					switch(alert("Do you want to damage your surroundings when transforming?","","Yes","No"))
						if("Yes")
							usr.crater_on = 1
						else
							usr.crater_on = 0
					switch(alert("Do you want to unleash your aura when transforming?","","Yes","No"))
						if("Yes")
							usr.trans_aura_on = 1
							return
						else
							usr.trans_aura_on = 0
							return
				if("Ki Usage")
					var/xx=input("How much ki % do you wish to use in your attacks?(Default is 50%)")as num
					if(xx<=0)
						xx=1
					if(xx>=100)
						xx=100
					if(xx>0&&xx<=100)
						var/xxx=round(xx)
						alert("Ki usage set to: [xxx]%")
						usr.kiuse=xxx/100
						return
					else
						alert("Input a number from 1-100.")
						return
				if("Kill/KO")
					switch(alert("Do you want your techniques to Kill or KO?","","Kill","KO"))
						if("Kill")
							usr.kill=1
							return
						else
							usr.kill=0
							return
		Toggle_Challenges()
			set category = "Channels"
			switch(alert("Toogle Challenges On or Off","","On","Off"))
				if("On")
					usr.challenge_on = 1
					return
				if("Off")
					usr.challenge_on = 0
					return
		Toggle_Challenge_Info()
			set category = "Channels"
			switch(alert("Toogle Challenge Info On or Off","","On","Off"))
				if("On")
					usr.arenatxt = 1
					return
				if("Off")
					usr.arenatxt = 0
					return