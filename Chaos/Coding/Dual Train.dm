mob/var/exp_bonus = 0
mob/var/dualtrain = 0
mob
	var
		tmp
			dtpartner=""
mob/PC/verb/Dual_Train()
	set category = "Training"
	if(usr.dt_delay)
		usr << "You must wait before dual train again"
		return
	if(usr.dualtrain)
		usr.doing = 0
		usr.frozen = 0
		usr.dualtrain = 0
		usr.icon_state = ""
		usr.dtpartner=""
		for(var/mob/DM in world)
			if(DM.dtpartner==usr)
				if(DM.dualtrain)
					DM.doing = 0
					DM.frozen = 0
					DM.dualtrain = 0
					DM.icon_state = ""
					DM.dtpartner=""
	for(var/mob/PC/M in get_step(usr,usr.dir))
		if(!M)return
		usr.dt_delay = 1
		M.dt_delay = 1
		spawn(70)
			if(usr)
				usr.dt_delay = 0
			if(M)
				M.dt_delay = 0
		if(istype(M,/mob/PC))
			if(usr.staminaleft>=usr.staminaleft_max)
				usr << "You are too drained to train."
				M << "[usr] is too drained to train."
				return
			if(M.staminaleft>=M.staminaleft_max)
				usr << "[M] is too drained to train."
				M << "You are too drained to train."
				return
			if(usr.doing)
				src << "You are already doing something"
				return
			if(M.doing)
				src << "[M.name] is already doing something"
				return
			if(alert("Are you sure you want to dual train with [M]?","Dual Train with [M]?","Yes","No") == "Yes")
				switch(alert(M,"Would you like to Dual Train with [usr]?","Dual Train","Yes","No"))
					if("Yes")
						if(!usr)
							M.dt_delay = 0
							return
						if(usr in oview(4,M))
							if(!M)return
							if(!usr)return
							if(usr.doing)
								M << "[usr] is already doing something"
								usr << "You are already doing something"
								return
							if(M.doing)
								usr << "[M] is already doing something"
								M << "You are already doing something"
								return
							if(!M.doing && !usr.doing)
								usr.dualtrain = 1
								usr.doing = 1
								usr.dtpartner=M
								M.dtpartner=usr
								usr.icon_state = "spar fury"
								M.icon_state = "spar fury"
								usr << "You begin to Dual Train."
								usr.frozen = 1
								M.dualtrain = 1
								M.doing = 1
								M.icon_state = "spar fury"
								M << "You begin to Dual Train."
								M.frozen = 1
								usr.Dual_Train2(M)
								return
					if("No")
						if(usr)
							usr << "[M] does not want to dual train"
							usr.dt_delay = 0
						M.dt_delay = 0
						return
		else
			usr << "You can't train with NPC's"
			return
mob/proc/Dual_Train2(mob/M)
	if(!src||!M)
		if(src)
			src.dtpartner=""
			src.doing = 0
			src.frozen = 0
			src.dualtrain = 0
			src.icon_state = ""
			src.dt_delay = 1
			src.dt_delay = 0
		if(M)
			M.doing = 0
			M.frozen = 0
			M.dualtrain = 0
			M.icon_state = ""
			M.dtpartner=""
			M.dt_delay = 1
			M.dt_delay = 0
		return
	var/exp_bonus = 19.8
	if(src.dualtrain == 1 && M.dualtrain == 1)
		if(src.staminaleft < src.staminaleft_max)
			if(M.staminaleft < M.staminaleft_max)
				if(M.frozen && src.frozen)
					src.exp+=exp_bonus
					if(src.expbuff)src.exp+=exp_bonus
					if(!src.staminabuff)src.staminaleft+=3.6
					src.Level_Up()
					M.exp+=exp_bonus
					if(M.expbuff)M.exp+=exp_bonus
					if(!M.staminabuff)M.staminaleft+=3.6
					M.Level_Up()
					M.sttps+=1
					if(M.sttps>=13)
						M.sttps=0
						M.tp += 1
						M << "<font color = white>Training points +1"
					src.sttps+=1
					if(src.sttps>=13)
						src.sttps=0
						src.tp += 1
						src << "<font color = white>Training points +1"
					sleep(15)
					if(!src||!M)
						if(src)
							src.dtpartner=""
							src.doing = 0
							src.frozen = 0
							src.dualtrain = 0
							src.icon_state = ""
							src.dt_delay = 1
							src.dt_delay = 0
						if(M)
							M.doing = 0
							M.frozen = 0
							M.dualtrain = 0
							M.icon_state = ""
							M.dtpartner=""
							M.dt_delay = 1
							M.dt_delay = 0
						return
					if(src&&M)
						return src.Dual_Train2(M)
					else
						if(!src||!M)
							if(src)
								src.dtpartner=""
								src.doing = 0
								src.frozen = 0
								src.dualtrain = 0
								src.icon_state = ""
								src.dt_delay = 1
								spawn(70)src.dt_delay = 0
							if(M)
								M.doing = 0
								M.frozen = 0
								M.dualtrain = 0
								M.icon_state = ""
								M.dtpartner=""
								M.dt_delay = 1
								spawn(70)M.dt_delay = 0
				else
					M.doing = 0
					M.frozen = 0
					M.dualtrain = 0
					M.icon_state = ""
					src.dtpartner=""
					M.dtpartner=""
					src.doing = 0
					src.frozen = 0
					src.dualtrain = 0
					src.icon_state = ""
					src.dt_delay = 1
					M.dt_delay = 1
					spawn(70)
						if(src)
							src.dt_delay = 0
						if(M)
							M.dt_delay = 0
			else
				M.staminaleft = M.staminaleft_max
				src << "You stop training"
				src.doing = 0
				src.frozen = 0
				src.dualtrain = 0
				src.icon_state = ""
				src.dtpartner=""
				M.dtpartner=""
				M.doing = 0
				M.frozen = 0
				M.dualtrain = 0
				M.icon_state = ""
				src.dt_delay = 1
				M.dt_delay = 1
				spawn(70)
					if(src)
						src.dt_delay = 0
					if(M)
						M.dt_delay = 0
		else
			M.staminaleft = M.staminaleft_max
			src << "You stop training"
			src.doing = 0
			src.frozen = 0
			src.dualtrain = 0
			src.icon_state = ""
			M.doing = 0
			M.frozen = 0
			M.dualtrain = 0
			src.dtpartner=""
			M.dtpartner=""
			M.icon_state = ""
			src.dt_delay = 1
			M.dt_delay = 1
			spawn(70)
				if(src)
					src.dt_delay = 0
				if(M)
					M.dt_delay = 0
	else
		return