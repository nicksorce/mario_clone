/// collisionsAndMoving(objects); 

///Collisions

//Horizontal
for(i = 0; i < argument_count; i++)
{
	if(place_meeting(x+hSpeed,y,argument[i]))
	{
		while(!place_meeting(x+sign(hSpeed),y,argument[i]))
		{
		   x += sign(hSpeed);
		}
	    hSpeed = 0; 	
	}	
	x += hSpeed; 

	//Vertical
	if(place_meeting(x,y+(vSpeed),argument[i]))
	{
		while(!place_meeting(x,y+sign(vSpeed),argument[i]))
		{
		   y += sign(vSpeed);
		}	
	    vSpeed = 0; 

	}	
	y += vSpeed;
}	