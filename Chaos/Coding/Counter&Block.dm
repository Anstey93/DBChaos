mob/var/skill_points = 0
mob/proc/Counter_Attack(mob/M,str,def)
	if(src.countering)
		return FALSE
	if(src.doing)
		return FALSE
	if(prob(1+(src.counter/5)))
		if(M.dir==src.dir)
			return FALSE
		src.countering=1
		spawn(src.speed+4)src.countering=0
		var/damage = (str - def)
		if(damage <= 0)
			damage = 1
		flick("attack",src)
		M << "\green [src] Counters your attack!"
		src << "\green You Counter [M]'s attack!"
		M.powerlevel -= damage
		spawn() M.KO()
		return TRUE
	else
		return FALSE
mob/proc/Block_Attack(mob/M,str,def)
	if(src.blocking)
		return FALSE
	if(src.doing)
		return FALSE
	if(prob(1+(src.block/5)))
		if(M.dir==src.dir)
			return FALSE
		src.blocking=1
		spawn(src.speed+4)src.blocking=0
		var/block_power=def*3
		var/damage = (str - block_power)
		if(damage <= 0)
			damage = 0
		flick("block",src)
		M << "\green [src] Blocks your attack!"
		src << "\green You Block [M]'s attack!"
		src.powerlevel -= damage
		spawn() src.KO()
		return TRUE
	else
		return FALSE
mob/proc/Deflect_Attack(mob/M)
	if(src.deflecting)
		return FALSE
	if(src.doing)
		return FALSE
	if(prob(src.reflect/5))
		if(M.dir==src.dir)
			return FALSE
		src.deflecting=1
		spawn(src.speed+4)src.deflecting=0
		flick("attack",src)
		M << "\green [src] Deflects your attack!"
		src << "\green You Deflect [M]'s attack!"
		return TRUE
	else
		return FALSE
mob/proc/Dodge_Attack(mob/M)
	if(src.dodging)
		return
	if(src.doing)
		return
	if(prob(src.dodge/5))
		src.dodging=1
		spawn(src.speed+4)src.dodging=0
		flick("IT",src)
		M << "\green [src] Dodges your attack!"
		src << "\green You Dodge [M]'s attack!"
		return TRUE
	else
		return FALSE