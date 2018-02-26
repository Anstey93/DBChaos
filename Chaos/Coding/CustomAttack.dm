mob/var/custom_homing=0
mob/var/custom_name="Custom Attack"
mob/var/custom_kill=1
mob/var/custom_delay=30
mob/var/custom_damage=1
mob/var/custom_piercing=1
mob/var/custom_ki=0.25
mob/var/custom_txt_1="You can change this text at Channels tab; Custom Attack Options verb."
mob/var/custom_txt_2="You can also change this one."
mob/var/custom_lvl=1
mob/var/custom_distance=180
mob/var/custom_icon='Custom1.dmi'
mob/var/custom_state=""
mob/var/learn_customattack=0

obj/Technique/CustomAttack
	verb
		CustomTechnique()
			set category="Techniques"
			set name="Custom Technique"
			set src in usr.contents
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are doing something."
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<1000)
				usr<<"Your ki is too low."
				return
			if(usr.ki_lock)
				src << "You can't use ki right now."
				return
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(!usr.pk)
				usr << "Reach level 75 to be able to use battle techniques."
				return
			if(usr.dead)
				usr<<"You are dead."
				return
			src.power=usr.custom_damage
			usr.doing=1
			usr.icon_state="[usr.custom_state]"
			view(8)<<"\white [usr]: [usr.custom_txt_1]"
			sleep(5+usr.custom_delay)
			view(8)<<"\white [usr]: [usr.custom_txt_2]"
			usr.frozen=1
			usr.tech_cooldown=1
			spawn(5)
				usr.icon_state=""
				usr.frozen=0
				usr.doing=0
			spawn(15+usr.custom_delay)
				usr.tech_cooldown=0
			var/obj/Tech/BeamH/A=new
			if(!usr.custom_homing)
				A.TechAttackStraight(usr,"[usr.custom_name]",usr.ki*usr.custom_ki+usr.custom_damage,usr.custom_icon,"","",0)
			else
				var/obj/Tech/BeamH/B=new
				B.icon=usr.custom_icon
				B.owner=usr
				B.name=usr.custom_name
				B.power=(usr.ki*usr.custom_ki+usr.custom_damage)/3
				B.dir=usr.dir
				B.loc=usr.loc
				usr.ki-=usr.ki*usr.custom_ki
				B.Scatter(usr)