obj/Quests/Bulma
	Malfunction
		name = "Malfunction!"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://img341.imageshack.us/img341/6510/bulmanamek8ed.jpg"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Deliver the part to
      Dr Briefs</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Capsule (Item)</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Bulma</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hey [usr.name]. I've heard
      my fathers been busy at work on one of the new Capsule Corp. Spacepods,
      but knowing him, I knew he would neglect to take care of his equipment!
      I need you to run this part over to him so he can continue working on the
      Spacpod. Thanks a bunch!</font></td>
  </tr>
</table>
"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")

			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.bulma_quest_start = 0
						for(var/obj/Equipment/Spanner/O in contents)
							del(O)
						del(src)
					if("No")
						return