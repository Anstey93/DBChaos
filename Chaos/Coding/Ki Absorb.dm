mob/var/absorbing = 0

mob/learn
	verb
		Ki_Absorb()
			set category = "Techniques"

			if(src.buku)
				return

			if(src.absorbing)
				src << "You stop Absorbing Ki"
				src.absorbing = 0
				src.frozen = 0
				src.doing = 0
				return
			else
				if(src.doing)
					return
				src << "You prepare to start Absorbing Ki"
				src.absorbing = 1
				src.frozen = 1
				src.doing = 1
				src.icon_state = "absorb"
				return