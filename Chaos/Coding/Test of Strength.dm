obj/Quests/Yamcha

	A_Test_of_Strength
		name = "A Test of Strength"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0

		verb

			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Kill 5 Saibamen</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>EXP +100</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Yamcha</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hey [usr.name]! It's good
      to see your Training is coming along well. I have a small test that wil give you a
      good measure up of your skills so far. I want you to go out and kill 5 Green Saibamen.
      They shouldn't be a problem, right?</font></td>
  </tr>
</table>
"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")

			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.strength_test_start = 0
						del(src)
					if("No")
						return