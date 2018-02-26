mob
	proc
		Gravity_Strain()
			set background=1
			spawn while(src.grav)
				if(src.dead)
					break
				for(var/obj/Gravity_Room/A in oview(8))
					if(A in oview(8))
						goto skip
				break
				skip
				var/Pl_Loss = src.grav * (rand(2,7))
				var/Pl_Loss2 = src.grav * (rand(3,9))
				if(src.grav <= 0)
					break
				if(prob(40))
					src << "You feel the gravity pull down on you."
					src.powerlevel -= Pl_Loss
					src.GRAVITYDeath()
				else
					if(prob(25))
						src << "You feel yourself getting use to the gravity."
					else
						if(prob(30))
							src << "You feel the full force of the gravity pull down on you."
							src.powerlevel -= Pl_Loss2
							src.GRAVITYDeath()
				sleep(40)
				if(src.staminaleft < src.staminaleft_max)
					src.staminaleft_exp += rand(1,5)
					src.Fatigue_Level_Up()
					src.exp += ((src.grav/100)+1)
					if(src.expbuff)src.exp += ((src.grav/100)+1)
					if(!src.staminabuff)src.staminaleft += 1+((src.grav/100)*0.8)
					src.Level_Up()
				src.GRAVITYDeath()
				sleep(12)