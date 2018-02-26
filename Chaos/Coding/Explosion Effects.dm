Effect
{

	var
	{
		atom/orig				// The point of origin for the explosion
		speed = 1				// The rate at which the explosion expands in ticks
		basepower = 10			// The strength of the explosion at ground zero
	}

	proc
	{
		Apply(x,y,power,dir)
		{
			return power
		}
	}

	New(atom/p_orig, p_speed, p_basepower)
	{
		orig = p_orig
		speed = p_speed
		basepower = p_basepower
	}
	//------------------------
	//Example Effects
	//------------------------

	//------------------------
	//Standard Explosion
	//------------------------

	BasicBoom
	{
		Apply(x,y,power,dir)
		{
			var/i
			var/obj/dirt/i2 = new
			var/i3
			var/turf/T
			T = locate(x,y,orig.z)
			//Doesn't go through walls so kill the trail if there is a wall
			if(T.density)
				return 0

			//Show the fire
			i = image('fire.dmi',locate(x,y,orig.z))
			world << i
			spawn(1)
				del(i)

			//Damage the terrain
			i3 = image(i2,locate(x,y,orig.z))
			world << i3
			spawn(50)
				del(i3)

			//Use the base expansion algorithm except reduce the
			//power by one so it doesn't go forever
			return ..(x,y,power-1,dir)
		}
	}


}

obj
{
	dirt
	{
		icon = 'Dirt.dmi'
		density = 0
	}
}