obj/Quests/Guru
	Dying_Namek
		name = "Dying Namek!"
		icon = 'Skills.dmi'
		icon_state = "ki"
		density = 0
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://img159.imageshack.us/img159/885/nail6xw.jpg"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Put an End to Frieza's
      Attacks on the Namek Village</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Unlocked Potential</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Nail</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Greetings [usr.name]. I'm
      sorry that Guru isn't feeling the best, but he asked me to find a Warrior
      strong enough to help the people of Namek. Guru's time is drawing near,
      and he wants to be sure that his people are able to live in peace before
      his time expires. He wishes you luck, and if you succeed, he will help you
      unlock your potential within your heart.</font></td>
  </tr>
</table>
"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.guru_quest_start = 0
						del(src)
					if("No")
						return