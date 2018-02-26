mob/proc/DemonRevert()
	if(src.form_1)
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.doing = 0
		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.form_6=0
		src.overlays -= 'Elec Demon 1.dmi'
		src.overlays -= 'Elec Demon 2.dmi'
		src.overlays -= 'Elec Demon 3.dmi'
		src.Power_Redefine()
		src.Skin_Apply()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return