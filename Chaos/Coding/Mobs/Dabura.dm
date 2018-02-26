mob/NPC/

	Dabura
		name = "{NPC}Dabura"
		icon_state = "Dabura"
		density = 1
		safe = 1
		energy_code = 2234155
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(!usr)return
			if(usr.level >= 10)
				usr << "<font color = white>Dabura:</font> Go back to Snake Way..."
				usr.loc = locate(72,383,7)
				if(usr.karma=="Evil"&&usr.karma_rating>=30)
					if(!usr.learn_deathball)
						usr.learn_deathball=1
						usr.contents+=new/obj/Technique/DeathBall
						usr << "<font color = white>Dabura:</font> Here's a little something to help with with those that oppose you."
						return
			else
				usr << "<font color = white>Dabura:</font> Your not even strong enough to go back to Snake Way...Train some more..."
				return