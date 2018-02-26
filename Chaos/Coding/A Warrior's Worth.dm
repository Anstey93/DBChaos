obj/Quests/King_Kai

	A_Warriors_Worth
		name = "A Warrior's Worth"
		icon = 'Skills.dmi'
		icon_state = "unarmed"
		density = 0
		suffix = "{Difficulty: Easy}"
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://img460.imageshack.us/img460/8647/kingkai9gi.jpg"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Catch Bubbles and
      Gregory </font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Kaio Ken (Skill)</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>King Kai</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hey [usr.name]! I've been
      watching your training on Earth, and as unfortunant it is you died, it's
      a good thing, because I can offer to teach you a skill to greatly enhance
      your Power, Speed and Defence! But before I go teaching you this ancient
      Technique I made, you need to prove your worth. All I ask is you catch Bubbles
      and Gregory. Pretty simple huh? Get to it then!</font></td>
  </tr>
</table>

"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.kk_quest_start = 0
						del(src)
					if("No")
						return