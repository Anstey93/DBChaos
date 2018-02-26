mob/proc/HumanRevert()
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
		src.overlays -= 'Elec Human Blue.dmi'
		src.overlays -= 'Elec Human Red.dmi'
		src.Power_Redefine()
		src.Skin_Apply()
		src.Hair_Apply()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return