mob/var/tmp
	checker=""
	undercheck=0
	sttps=0
mob/PC/verb/SelfTrain()
	set category = "Training"
	set name="Self Train"
	if(src.boxing_delay)
		src << "You must wait before Training again"
		return
	if(src.boxing)
		src.icon_state = ""
		src.boxing = 0
		src.frozen = 0
		src.doing = 0
		src.boxing_delay = 1
		src.thrown=0
		src.undercheck=0
		spawn(35)src.boxing_delay = 0
		return
	if(src.staminaleft >= src.staminaleft_max)
		src.undercheck=0
		return
	if(src.doing)
		src.undercheck=0
		return
	if(!src.boxing)
		src.boxing_delay = 1
		src.icon_state = "spar fury"
		src.boxing = 1
		src.doing = 1
		src.frozen = 1
		spawn(35) src.boxing_delay = 0
		spawn(1)src.Box_Gain()
mob/proc/Box_Gain()
	if(!src.boxing)
		src.undercheck=0
		return
	if(!src.frozen)
		src.undercheck=0
		return
	if(src.staminaleft >= src.staminaleft_max)
		src.staminaleft = src.staminaleft_max
		src.boxing = 0
		src.frozen = 0
		src.doing = 0
		src.icon_state = ""
		src.undercheck=0
		return
	sleep(10)
	if(!src.boxing)
		src.undercheck=0
		return
	if(!src.frozen)
		src.undercheck=0
		return
	src.sttps+=1
	if(src.sttps>=20)
		var/random=round(5,10)
		src.sttps=0
		src.tp += random
		src <<output ("<font color = white>Training points +[random]","output2")
	if(prob(5))
		src.zenni += round(rand(5,15) + src.level)
	var/bonus_exp = 160000
	if(src.expbuff)bonus_exp*=2
	if(src.undercheck)
		var/mob/GMC=src.checker
		GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Self Train)"
	src.exp += bonus_exp
	if(!src.staminabuff)src.staminaleft+=3.5
	spawn(1)src.Level_Up()
	spawn(1)src.Box_Gain()
