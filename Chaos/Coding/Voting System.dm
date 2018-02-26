obj
	Vote
		var
			list
				voters=list()
			yes=0
			no=0
			Voter=0
			Voted=0
			VoterN=0
			VotedN=0
			time=0
			reason="Not specified"
		icon='Votes.dmi'
		Mute
			icon_state="mute"
			New()
				..()
				spawn while(1)
					time-=1
					if(time<=0)
						var/playerson=0
						for(var/mob/PC/M in world)
							if(M.client)
								playerson+=1
						if(yes>no)
							world<<"<font color=red>[Voted]'s mute succeded: <b>[src.yes]/[src.no]</b> (Y/N)"
							world.AutoVoteMute(Voted)
							del(src)
						else
							world<<"<font color=red>[Voted]'s mute failed: <b>[src.yes]/[src.no]</b> (Y/N)"
							world.AutoVoteMute(Voter)
							del(src)
					sleep(10)
			Click()
				..()
				if(src.voters.Find(usr.ckey))
					usr<<"You have already voted in this poll."
					return
				else
					src.voters.Add(usr.ckey)
					switch(alert("What do you wish to vote?","Vote Mute","Vote Yes","Vote No"))
						if("Vote Yes")
							src.yes+=1
							var/playerson=0
							for(var/mob/PC/M in world)
								if(M.client)
									playerson+=1
							if(yes>round(playerson/2))
								world<<"<font color=red>[Voted]'s mute succeded: <b>[src.yes]/[src.no]</b> (Y/N)"
								world.AutoVoteMute(Voted)
								del(src)
						else
							src.no+=1
							var/playerson=0
							for(var/mob/PC/M in world)
								if(M.client)
									playerson+=1
							if(no>=round(playerson/2))
								world<<"<font color=red>[Voted]'s mute failed: <b>[src.yes]/[src.no]</b> (Y/N)"
								world.AutoVoteMute(Voter)
								del(src)
		Boot
			icon_state="boot"
			New()
				..()
				spawn while(1)
					time-=1
					if(time<=0)
						var/playerson=0
						for(var/mob/PC/M in world)
							if(M.client)
								playerson+=1
						if(yes>no)
							world<<"<font color=red>[Voted]'s boot succeded: <b>[src.yes]/[src.no]</b> (Y/N)"
							world.AutoVoteBoot(Voted)
							del(src)
						else
							world<<"<font color=red>[Voted]'s boot failed: <b>[src.yes]/[src.no]</b> (Y/N)"
							world.AutoVoteBoot(Voter)
							del(src)
					sleep(10)
			Click()
				..()
				if(src.voters.Find(usr.ckey))
					usr<<"You have already voted in this poll."
					return
				else
					src.voters.Add(usr.ckey)
					switch(alert("What do you wish to vote?","Vote Boot","Vote Yes","Vote No"))
						if("Vote Yes")
							src.yes+=1
							var/playerson=0
							for(var/mob/PC/M in world)
								if(M.client)
									playerson+=1
							if(yes>round(playerson/2))
								world<<"<font color=red>[Voted]'s boot succeded: <b>[src.yes]/[src.no]</b> (Y/N)"
								world.AutoVoteBoot(Voted)
								del(src)
						else
							src.no+=1
							var/playerson=0
							for(var/mob/PC/M in world)
								if(M.client)
									playerson+=1
							if(no>round(playerson/2))
								world<<"<font color=red>[Voted]'s boot failed: <b>[src.yes]/[src.no]</b> (Y/N)"
								world.AutoVoteBoot(Voter)
								del(src)
var
	list
		RelogDelay=list()
		VoteDelay=list()
		VoteMute=list()
		VoteBoot=list()
world
	proc
		RemoveDelay(K)
			spawn(3000)
				if(VoteDelay.Find("[K]"))
					VoteDelay.Remove("[K]")
		MuteVotes(mob/A,mob/B,R)
			world.RemoveDelay(A.key)
			var/obj/Vote/Mute/M=new
			M.Voter="[A.key]"
			M.Voted="[B.key]"
			M.VoterN="[A.name]"
			M.VotedN="[B.name]"
			M.reason=R
			M.time=60
		BootVotes(mob/A,mob/B,R)
			var/obj/Vote/Boot/M=new
			M.Voter="[A.key]"
			M.Voted="[B.key]"
			M.VoterN="[A.name]"
			M.VotedN="[B.name]"
			M.reason=R
			M.time=60
		AutoVoteMute(K)
			world<<"<font color=red>[K] has been muted."
			VoteMute.Add("[K]")
			spawn(3000)
				if(VoteMute.Find("[K]"))
					VoteMute.Remove("[K]")
					world<<"<font color=red>[K] has been unmuted."
		AutoVoteBoot(K)
			VoteBoot.Add("[K]")
			world<<"<font color=red>[K] was forced out of the game."
			for(var/mob/M in world)
				if(M.key==K)
					del(M)
			spawn(3000)
				if(VoteBoot.Find("[K]"))
					VoteBoot.Remove("[K]")
mob
	PC
		verb
			Vote_Mute()
				set category="Channels"
				VoteMute()
			Vote_Boot()
				set category="Channels"
				VoteBoot()
	proc
		VoteMute()
			if(!voteson)
				src<<"Player Votes are disabled."
				return
			var/playerson=0
			for(var/mob/PC/M in world)
				if(M.client)
					playerson+=1
			if(playerson<3)
				src<<"There aren't enough players online to start a poll."
				return
			if(VoteDelay.Find(src.key))
				src<<"You must wait 5 minutes before starting another poll."
				return
			VoteDelay.Add(src.key)
			var/list/L=new/list()
			for(var/mob/M in world)
				if(!M.client)continue
				L.Add(M)
			L.Add("Cancel")
			var/mob/B=input("Who do you wish to vote a mute on?","Vote Mute")as null|anything in L
			if(B=="Cancel"||!B)
				VoteDelay.Remove(src.key)
				return
			if(!B)
				src<<"The target has logged out."
				VoteDelay.Remove(src.key)
				return
			switch(alert("Do you want to vote for a mute on [B]?","Vote Mute","Yes","No"))
				if("No")
					VoteDelay.Remove(src.key)
					return
				else
					var/reason=input("What is the reason for the mute?","Vote Mute")as text
					if(!B)
						src<<"The target has logged out."
						VoteDelay.Remove(src.key)
						return
					reason=html_encode(reason)
					if(lentext(reason)>25)
						reason=copytext(reason,1,26)
					world<<"<font color=green><b>[src]([src.key]) has started a poll to <b>Mute</b> [B]([B.key]). Reason: <b>[reason]</b>"
					world.MuteVotes(src,B,reason)
		VoteBoot()
			if(!voteson)
				src<<"Player Votes are disabled."
				return
			var/playerson=0
			for(var/mob/PC/M in world)
				if(M.client)
					playerson+=1
			if(playerson<3)
				src<<"There aren't enough players online to start a poll."
				return
			if(VoteDelay.Find(src.key))
				src<<"You must wait 5 minutes before starting another poll."
				return
			VoteDelay.Add(src.key)
			var/list/L=new/list()
			for(var/mob/M in world)
				if(!M.client)continue
				L.Add(M)
			L.Add("Cancel")
			var/mob/B=input("Who do you wish to vote a boot on?","Vote Boot")as null|anything in L
			if(B=="Cancel"||!B)
				VoteDelay.Remove(src.key)
				return
			if(!B)
				src<<"The target has logged out."
				VoteDelay.Remove(src.key)
				return
			switch(alert("Do you want to vote for a boot on [B]?","Vote Boot","Yes","No"))
				if("No")
					VoteDelay.Remove(src.key)
					return
				else
					var/reason=input("What is the reason for the boot?","Vote Boot")as text
					if(!B)
						src<<"The target has logged out."
						VoteDelay.Remove(src.key)
						return
					reason=html_encode(reason)
					if(lentext(reason)>25)
						reason=copytext(reason,1,26)
					world<<"<font color=green><b>[src]([src.key]) has started a poll to <b>Boot</b> [B]([B.key]). Reason: <b>[reason]</b>"
					world.BootVotes(src,B,reason)