mob/proc/SaiyanRevert()
	if(src.Oozaru)
		return
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
		src.form_6 = 0
		src.overlays -= src.aura
		src.aura = 0
		src.overlays -= 'Elec Blue Small.dmi'
		src.overlays -= 'Elec Blue Big.dmi'
		src.overlays -= 'Elec Red Big.dmi'
		src.overlays -= 'Elec White.dmi'
		src.overlays -= 'Hair - SSJ3.dmi'
		src.overlays -= 'Hair - SSJ4.dmi'
		src.overlays -= 'Hair - SSJ4(fused).dmi'
		src.overlays -= 'ssj4tail.dmi'
		src.overlays -= 'Elec LSSJ.dmi'
		src.Power_Redefine()
		src.Skin_Apply()
		src.Hair_Apply()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return