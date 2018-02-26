mob/PC/verb/Rest()
	set category = "Training"
	if(src.rest_delay)
		src << "You must wait a moment before resting again."
		return
	if(src.kaioken)
		return
	if(src.KO)
		return
	if(src.rest)
		src.rest_delay = 1
		src.rest = 0
		src.icon_state = ""
		src.frozen = 0
		src.doing = 0
		spawn(25)src.rest_delay = 0
		return
	if(src.doing)
		return
	if(!src.staminaleft)
		return
	else
		src.rest_delay = 1
		src.rest = 1
		src.frozen = 1
		src.doing = 1
		src.icon_state = "meditate"
		spawn(25)src.rest_delay = 0
		src.Rest_Gain()
		return
mob/proc/Rest_Gain()
	if(!src.rest)
		return
	else
		if(src.staminaleft<=0)
			src.staminaleft = 0
			src.rest = 0
			src.icon_state = ""
			src.frozen = 0
			src.doing = 0
			sleep(50)
			src.rest_delay = 0
			return
		sleep(10)
		if(!src.rest)
			return
		else
			var/gains = rand(45,50)+(usr.level/18)
			if(src.staminaleft > 0)
				src.staminaleft -= gains
				if(src.staminaleft < 0)
					src.staminaleft = 0
			if(src.staminaleft <= 0)
				src.staminaleft = 0
				src.rest = 0
				src.icon_state = ""
				src.frozen = 0
				src.doing = 0
				sleep(50)
				src.rest_delay = 0
				return
			spawn(5)src.Rest_Gain()