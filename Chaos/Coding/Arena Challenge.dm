var/arena_on=0
mob/var/arenatxt=1
mob/PC/verb/Arena_Challenge()
	set category = "Channels"
	var/list/Rivals=new/list()
	for(var/mob/PC/N in world)
		if(N==usr)continue
		if(N.dead)continue
		if(N.z==8)continue
		if(N.grav)continue
		if(N.FuseFollower)continue
		if(!N.challenge_on)continue
		if(!N.pk)continue
		Rivals.Add(N)
	Rivals.Add("Cancel")
	var/mob/M=input("Challenge who?")in Rivals
	if(arena_on)
		usr<<"The arena is currently being used."
		return
	if(M=="Cancel")
		return
	if(!M)
		return
	if(M == usr)
		usr << "You cannot challenge yourself."
		return
	if(usr.dead)
		usr << "You are dead."
		return
	if(M.FuseFollower)
		return
	if(usr.FuseFollower)
		return
	if(!M.challenge_on)
		usr << "[M] does not want to be challenged."
		return
	if(M.dead)
		usr << "[M] is dead"
		return
	if(usr.grav > 0)
		return
	if(M.grav > 0)
		return
	if(!M.pk)
		usr << "[M] is not a Combatant."
		return
	if(!usr.pk)
		usr << "You are not a Combatant."
		return
	if(istype(M,/mob/PC))
		arena_on=1
		usr.challenge = 1
		M.challenge = 1
		for(var/mob/X in world)
			if(X.arenatxt)
				X << "\red Arena Info: \white [usr] has challenged [M] for an Arena Battle!"
		var/obj/Challenges/C=new
		C.C1=src
		C.C2=M
		C.ChallengeMob(M,src)
	else
		usr << "You can't challenge NPCs."
		arena_on=0
		return

obj
	Challenges
		var/time=15
		var/mob/C1
		var/mob/C2
		New()
			..()
			spawn while(1)
				time-=1
				if(time<=0)
					if(C1)
						C1.challenge=0
						C1.challenger=""
					if(C2)
						C2.challenge=0
						C2.challenger=""
					arena_on=0
					for(var/mob/M in world)
						if(M.arenatxt)
							M << "<font color=red>Server: \white [C2] didn't reply to [C1]'s Challenge!"
					del(src)
				sleep(10)
		proc
			ChallengeMob(mob/A,mob/B)
				switch(alert(A,"Do you accept [B]'s Challenge? You have 15 seconds to reply.","Arena Challenge","Accept","Decline"))
					if("Accept")
						if(A.dead)
							A<<"You are dead."
							A.challenge=0
							A.challenger=""
							arena_on=0
							del(src)
						if(B.dead)
							A<<"[B] is dead."
							B.challenge=0
							B.challenger=""
							arena_on=0
							del(src)
						if(!B)
							A.challenge=0
							A.challenger=""
							arena_on=0
							del(src)
						for(var/mob/M in world)
							if(M.arenatxt)
								M << "<font color=red>Server: \white [A] has \green <u>Accepted</u> \white [B]'s Challenge!"
						B.loc=locate(27,126,1)
						A.loc=locate(35,126,1)
						A.safe=0
						B.safe=0
						A.grav=0
						B.grav=0
						B.challenger=A
						A.challenger=B
						del(src)
					if("Decline")
						arena_on=0
						A.challenge = 0
						A.challenger = ""
						if(B)
							for(var/mob/M in world)
								if(M.arenatxt)
									M << "<font color=red>Server: \white [A] has \red <u>Declined</u> \white [B]'s Challenge!"
							B.challenger = ""
							B.challenge = 0
						del(src)