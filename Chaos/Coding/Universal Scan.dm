obj/Technique/UniversalScan
	verb
		Universal_Scan(mob/M in world)
			set category = "Techniques"
			src << "Aquiring [M]'s Biological Signal..."
			sleep(25)
			if(!M)return
			usr << "---------------------"
			usr << "<font size = 4>[M]</size>"
			usr << "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]"
			usr << "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]"
			usr << "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]"
			usr << "Defense: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]"
			usr << ""
			usr << "Block Skill: [M.block] %"
			usr << "Counter Skill: [M.counter] %"
			usr << "Reflect Skill: [M.reflect] %"
			usr << "Dodge Skill: [M.dodge] %"
			usr << "Critical Skill: [M.critical] %"
			usr << ""
			usr << "Energy Code: [num2text(M.energy_code,1000000)]"
			usr << "---------------------"
			return