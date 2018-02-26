proc
	Explode(Effect/theeffect)
		if(theeffect.orig)
			new /ExplodeNode/CenterAll(theeffect,theeffect.orig.x,theeffect.orig.y,theeffect.basepower)
	ExplodeBM(Effect/theeffect)

		if(theeffect.orig)
			new /ExplodeNode/CenterBM(theeffect,theeffect.orig.x,theeffect.orig.y,theeffect.basepower)
ExplodeNode
	CenterBM
		New(Effect/theeffect,x as num,y as num, power as num)
			if(round(power) > 0)
				power = theeffect.Apply(x,y,power,NORTH)
				new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
				new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
				new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
				new /ExplodeNode/Straight(theeffect,x + 1,y,power,EAST)
			del(src)
	CenterAll
		New(Effect/theeffect,x as num,y as num, power as num)
			if(round(power) > 0)
				power = theeffect.Apply(x,y,power,NORTH)
				new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
				new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
				new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
				new /ExplodeNode/Straight(theeffect,x + 1,y,power,EAST)
				new /ExplodeNode/Corner(theeffect,x - 1,y - 1,power,NORTHWEST)
				new /ExplodeNode/Corner(theeffect,x + 1,y - 1,power,NORTHEAST)
				new /ExplodeNode/Corner(theeffect,x - 1,y + 1,power,SOUTHWEST)
				new /ExplodeNode/Corner(theeffect,x + 1,y + 1,power,SOUTHEAST)
			del(src)
	Straight
		New(Effect/theeffect,x as num,y as num, power as num, dir as num)
			var
				tx
				ty
			if(round(power) > 0)
				if(x >= 1 && x <= world.maxx && y >= 1 && y <= world.maxy)
					power = theeffect.Apply(x,y,power,dir)
					switch(dir)
						if(NORTH)
							ty = -1
						if(SOUTH)
							ty = 1
						if(WEST)
							tx = -1
						if(EAST)
							tx = 1
					if(theeffect.speed)
						spawn(theeffect.speed)
							src.New(theeffect,x+tx,y+ty,power,dir)
					else
						src.New(theeffect,x+tx,y+ty,power,dir)
			else
				del(src)
	Corner
		New(Effect/theeffect,x as num,y as num, power as num, dir as num)
			var
				ty
				tx
			if(round(power) > 0)
				if(x >= 1 && x <= world.maxx && y >= 1 && y <= world.maxy)
					power = theeffect.Apply(x,y,power,dir)
					switch(dir)
						if(NORTHEAST)
							ty = -1
							tx = 1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
									new /ExplodeNode/Straight(theeffect,x+1,y,power,EAST)
							else
								new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
								new /ExplodeNode/Straight(theeffect,x+1,y,power,EAST)
						if(SOUTHEAST)
							ty = 1
							tx = 1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
									new /ExplodeNode/Straight(theeffect,x +1,y,power,EAST)
							else
								new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
								new /ExplodeNode/Straight(theeffect,x +1,y,power,EAST)
						if(NORTHWEST)
							ty = -1
							tx = -1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
									new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
							else
								new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
								new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
						if(SOUTHWEST)
							ty = 1
							tx = -1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
									new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
							else
								new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
								new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
					if(theeffect.speed)
						spawn(theeffect.speed)
							src.New(theeffect,x + tx,y + ty,power,dir)
					else
						src.New(theeffect,x + tx,y + ty,power,dir)
			else
				del(src)