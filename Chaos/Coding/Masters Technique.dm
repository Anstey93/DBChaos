obj/Quests/Master_Roshi

	Masters_Technique
		name = "The Masters Technique"
		icon = 'Skills.dmi'
		icon_state = "unarmed"
		density = 0

		verb

			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://img296.imageshack.us/img296/4867/masterroshi1dr.jpg"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Find the Rock Master
      Roshi Threw</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Kamehameha Wave (Skill)</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Master Roshi</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Well [usr.name] if you've
      come to me for my skill, the Kamehameha Wave, your going to have to prove
      your dedicated enough to learn it. I've thrown a rock somewhere in the world
      you'll need to go find, once you do that and bring it to me, then and only
      then, will I teach you my technique</font></td>
  </tr>
</table>
"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")

			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.roshi_quest_start = 0
						del(src)
					if("No")
						return