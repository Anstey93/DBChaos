mob/proc/TuffleRevert()
	if(src.form_3)
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.doing = 0
		src.form_3 = 0
		src.overlays -= 'Elec Blue Small.dmi'
		src.overlays -= 'Elec Blue Big.dmi'
		src.overlays -= 'Elec Red Big.dmi'
		src.overlays -= 'Elec White.dmi'
		src.Power_Redefine()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon = 'Bebi - Form 3.dmi'
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return