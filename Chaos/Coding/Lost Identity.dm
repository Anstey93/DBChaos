obj/Quests/Saiyaman

	Lost_Identity
		name = "Lost Identity"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0

		verb

			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://img327.imageshack.us/img327/9306/saiyaman8dq.jpg"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Find Saiyaman's Helmet!</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Replica Helmet (Item)</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Saiyaman</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Greetings Citizen. If I
      may trouble you for a moment, I'm in somewhat of a Dilema. You see, I prefer
      to keep my identity secret when fighting Crime, that's why I need my helmet
      back! My little brother Goten was playing with it last. He is somewhere
      around the planet now, can you help find him and bring my Helmet back? Thanks!</font></td>
  </tr>
</table>
"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")

			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.saiyaman_quest_start = 0
						del(src)
					if("No")
						return