mob/var/level_tp = 0
mob/var/level_chance = 0
mob/var/spam_lvl = 0
mob/proc/Level_Up()
	if(!src.client)return
	if(!src.loggedin)return
	if(src.exp >= src.tnl)
		var/power_gain=(src.level+(src.level*((0.5+src.statpl)/9)))+rand(50,60)
		var/ki_gain=(src.level+(src.level*((0.5+src.statki)/10)))+rand(50,60)
		var/str_gain=(src.level+(src.level*((0.5+src.statstr)/10)))+rand(50,60)
		var/def_gain=(src.level+(src.level*((0.5+src.statdef)/10)))+rand(50,60)
		src.exp-=src.tnl
		src.level++
		src.level_tp++
		src.level_chance++
		src.spam_lvl++
		if(src.level_tp>=5)

			src.tp += 1+src.stattrain
			src.level_tp = 0
		if(src.level_chance >= 15)
			var/chance_up = rand(1,2)

			src.skill_points += chance_up
			src.level_chance = 0

		src.staminaleft_exp += rand(4,6)
		src.powerlevel_max += power_gain
		src.ki_max += ki_gain
		src.kidefense += ki_gain*0.8
		src.kidefense_max += ki_gain*0.8
		src.add_exp = src.level
		src.strength += str_gain
		src.defence += def_gain
		src.strength_max += str_gain
		src.defence_max += def_gain
		src.staminaleft_tnl+=0.05
		src.tnl+=1.3
		if(src.level>500)
			src.tnl+=1.5
		if(src.level>1000)
			src.tnl+=3
		if(src.level>1500)
			src.tnl+=5
		if(src.level>2000)
			src.tnl+=8
		src.staminaleft_max+=0.3
		if(src.stattrain)
			src.tnl-=src.stattrain/110
			src.staminaleft_max+=src.stattrain/110
		if(src.spam_lvl>=50)
			if(CreationSpam.Find("2[src.ckey]"))
				CreationSpam.Remove("2[src.ckey]")
			else
				if(CreationSpam.Find("1[src.ckey]"))
					CreationSpam.Remove("1[src.ckey]")
			src.spam_lvl=0
		if(!src.gone_ssj)
			if(src.train_chromosome && src.level>=100)
				src.TrainSSJ()
		spawn(1)src.Skill_Gain()
		spawn(1)src.Level_Up()
		spawn(1)src.Fatigue_Level_Up()

mob/proc/PK_LVLUP(var/N as num)
	if(!src.client)return
	if(!src.loggedin)return
	if(N>1)
		var/cpp=round(N/2)
		if(cpp>1)
			src.custom_points += round(cpp)
			src <<output ("<center><font color = white>Custom Points +[round(cpp)]</center></font>","output2")
		else
			src.custom_points += 1
			src << "<center><font color = white>Custom Points +1</center></font>"
	else
		src.custom_points += 1
		src << "<center><font color = white>Custom Points +1</center></font>"
mob/proc/Fatigue_Level_Up()
	if(!src.client)return
	if(!src.loggedin)return
	if(src.staminaleft_exp >= src.staminaleft_tnl)
		src.staminaleft_tnl += 4.3
		src.staminaleft_exp -= src.staminaleft_tnl
		src.staminaleft_max += 5
		src <<output( "\white You feel your Endurance increase...","output2")
mob
	proc
		TrainSSJ()
			if(!src.client)return
			if(!src.loggedin)return
			if(src.train_chromosome)
				if(src.race=="Saiyan"&&src.level>=50)
					if(src.powerlevel_max>=90000)
						src.buku = 0
						src.rest = 0
						src.frozen = 1
						src.boxing = 0
						src.focus_boxing = 0
						src.doing = 1
						src.icon_state = ""
						src.gone_ssj = 1
						src.density=1
						src.icon_state = "enrage"
						view(8) << "\white <I>[src.name] feels an uncontrollable rage burning in him as he remembers those Saiyans who have Surpassed him."
						sleep(25)
						view(8) << "\white <I>[src.name] clentchs his fists, as tears well in his eyes. Veins protrude from his hands and forehead as the ground rumbles"
						sleep(25)
						view(8) << "\white [src.name]: I AM THE STRONGEST OF THE SAIYANS! NO ONE SHALL SURPASS ME!!"
						src.icon_state = ""
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.SaiyanTrans()
						Explode(new /Effect/BasicBoom(src.loc,1,4))
						sleep(25)
						src.frozen=0
						src.doing=0
						var/chance = rand(20,60)
						if(prob(chance))
							src << "You are unable to fully control your Super Saiyan state!"
							src.SaiyanRevert()