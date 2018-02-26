mob/learn
	verb
		Scan(mob/M in view(8))
			set category = "Techniques"
			if(M.race != "Android")
				var/form = ""
				if(!M.form_1)
					form = "Normal State"

				if(M.form_1)
					if(M.race == "Saiyan" || M.race == "Half Saiyan")
						if(M.ascended_ssj)
							form = "\yellow Ascended Super Saiyan"
						else
							form = "\yellow Super Saiyan"

					if(M.race == "Changeling")
						form = "\white Form 2"

					if(M.race == "Majin")
						form = "<font color=#E358B4>Punk Form</font>"

					if(M.race == "Human")
						form = "<font color = #EB7F00>Advanced Focus</font>"

					if(M.race == "Namekian")
						form = "\green Super Namekian"

					if(M.race == "Tuffle")
						form = "\yellow Infected Tuffle"

					if(M.race == "Bio-Android")
						form = "\green Imperfect Form"
				else
					if(M.form_2)
						if(M.race == "Saiyan" || M.race == "Half Saiyan")
							form = "\yellow Ultra Super Saiyan"

						if(M.race == "Changeling")
							form = "\white Form 3"

						if(M.race == "Majin")
							form = "<font color=#E358B4>Super Form</font>"

						if(M.race == "Tuffle")
							form = "\yellow Super Tuffle"

						if(M.race == "Human")
							form = "<font color = #EB7F00>High Tension</font>"

						if(M.race == "Namekian")
							form = "\green Ascended Namekian"

						if(M.race == "Bio-Android")
							form = "\green Perfect Form"
					else
						if(M.form_3)
							if(M.race == "Saiyan" || M.race == "Half Saiyan")
								form = "\yellow Super Saiyan 2"

							if(M.race == "Changeling")
								form = "\white Form 4"

							if(M.race == "Majin")
								form = "<font color=#E358B4>Kid Form</font>"

							if(M.race == "Tuffle")
								form = "\yellow Super Tuffle 2"

							if(M.race == "Human")
								form = "<font color = #EB7F00>Advanced High Tension</font>"

							if(M.race == "Namekian")
								form = "\green Super Namekian 2"

							if(M.race == "Bio-Android")
								form = "\green Perfect Power Weighted Form"
						else
							if(M.form_4)
								if(M.race == "Saiyan")
									form = "\yellow Super Saiyan 3"

								if(M.race == "Changeling")
									form = "\white Form 4: 100% Power"
							else
								if(M.form_5)
									if(M.race == "Saiyan")
										form = "\yellow Super Saiyan 4"

				src << "Aquiring [M]'s Biological Signal..."
				sleep(25)
				if(!M)return
				src << "---------------------"
				src << "<font size = 4>[M]</size>"
				src << "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]"
				src << "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]"
				src << "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]"
				src << "Defense: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]"
				src << ""
				src << "Block Skill: [M.block] %"
				src << "Counter Skill: [M.counter] %"
				src << "Reflect Skill: [M.reflect] %"
				src << "Dodge Skill: [M.dodge] %"
				src << "Critical Skill: [M.critical] %"
				src << ""
				src << "Currently In: [form]"
				src << "Energy Code: [num2text(M.energy_code,1000000)]"
				src << "---------------------"
			else
				src << "They have no Energy to Scan!"
				return