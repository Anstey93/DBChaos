obj/Transform/Transform
	verb
		Transform()
			set category = "Combat"
			if(usr.KO)
				return
			if(usr.spam_delay)
				return
			if(usr.doing)
				usr << "You are already doing something!"
				return
			if(usr.trans_delay)
				usr << "You body is still recovering from Transforming!"
				return
			usr.spam_delay=1
			if(usr.race != "Namekian" || usr.race != "Majin" || usr.race != "Android" || usr.race != "Half Majin")
				if(usr.kaioken && usr.form_1)
					usr << "You relax your Kaioken state"
					usr.kaioken = 0
					usr.Power_Redefine()
			if(usr.race == "Namekian")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)
							return
						usr.trans_delay = 1
						usr.NamekTrans()
					if("No")
						usr.spam_delay=0
						return
			if(usr.race == "Dragon")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)
							return
						usr.trans_delay = 1
						usr.DragonTrans()
					if("No")
						usr.spam_delay=0
						return
			if(usr.race == "Android")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)
							return
						usr.trans_delay = 1
						usr.AndroidTrans()
					if("No")
						usr.spam_delay=0
						return
			if(usr.race == "Majin")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)
							return
						usr.trans_delay = 1
						usr.MajinTrans()
					if("No")
						usr.spam_delay=0
						return
			if(usr.race == "Changeling")
				usr.spam_delay=0
				usr.ChanglingTrans()
			if(usr.race == "Saiyan")
				usr.spam_delay=0
				if(usr.legendary_chromosome)
					usr.LSaiyanTrans()
				else
					usr.SaiyanTrans()
			if(usr.race == "Human")
				usr.spam_delay=0
				usr.HumanTrans()
			if(usr.race == "Tuffle")
				if(!usr.form_3)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay)
								return
							usr.spam_delay=0
							usr.TuffleTrans()
						else
							return
				else
					usr.spam_delay=0
					usr.TuffleTrans()
			if(usr.race == "Bio-Android")
				if(!usr.form_2)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay)
								return
							usr.spam_delay=0
							usr.BioTrans()
						else
							return
				else
					usr.spam_delay=0
					usr.BioTrans()
			if(usr.race == "Demon")
				usr.spam_delay=0
				usr.DemonTrans()
			if(usr.race == "Android")
				usr.spam_delay=0
				usr.AndroidTrans()
			if(usr.race == "Half Saiyan")
				usr.spam_delay=0
				usr.HalfSaiyanTrans()
			if(usr.race == "Saibaman")
				usr.spam_delay=0
				usr.SaibamanTrans()
			if(usr.race == "Kai")
				usr.spam_delay=0
				usr.KaiTrans()
			usr.doing = 0
			sleep(35)
			usr.trans_delay = 0
			return
obj/Transform/Revert
	verb
		Revert()
			set category = "Combat"
			if(usr.doing)
				return
			if(usr.KO)
				return
			if(usr.trans_delay)
				return
			usr.trans_delay = 1
			usr.doing = 1
			if(usr.race == "Human")
				usr.HumanRevert()
			if(usr.race == "Half Saiyan")
				usr.HalfSaiyanRevert()
			if(usr.race == "Changeling")
				usr.ChanglingRevert()
			if(usr.race == "Saiyan")
				usr.SaiyanRevert()
			if(usr.race == "Tuffle")
				usr.TuffleRevert()
			if(usr.race == "Bio-Android")
				usr.BioRevert()
			if(usr.race == "Demon")
				usr.DemonRevert()
			if(usr.race == "Saibaman")
				usr.SaibamanRevert()
			if(usr.race == "Kai")
				usr.KaiRevert()
			usr.underlays-=usr.underlays
			usr.doing=0
			usr.aura_on=0
			sleep(35)
			usr.trans_delay=0
			return
mob
	proc
		Power_Redefine()
			if(src.powerlevel > src.powerlevel_max)
				src.powerlevel = src.powerlevel_max
			if(src.ki > src.ki_max)
				src.ki = src.ki_max
			src.kidefense=src.kidefense_max
			src.strength = src.strength_max
			src.defence = src.defence_max
			src.speed = src.speed_max
			src.critical = src.critical_max
			src.dodge = src.dodge_max
			src.reflect = src.reflect_max
			src.block = src.block_max
			src.counter = src.counter_max
			return