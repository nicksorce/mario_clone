/// Main Actions

// Movement
switch(state)
{
   case("IDLE"):
   {
       lastState = "IDLE"; 
	   sprite_index = spr_player_idle; 
	   //image_speed = 1; 
	   //Check Inputs
	   
	   if(input.up) state = "JUMPING";
	   if(input.right) state = "RIGHT";
	   if(input.left) state = "LEFT";
	  // allowPlayerMovement();
	      break;   
   }	   
   case("RIGHT"):
   {
	   lastState = "RIGHT";
	   if(hSpeed < 0) sprite_index = spr_player_stop;
	   else sprite_index = spr_player_walk;
	   image_xscale = 1;
	   allowPlayerMovement();
	   
	   image_speed = (abs(hSpeed)/maxSpeed) * animationSpeed;
	   
	   //Check inputs
	   if(input.up) state = "JUMPING";
	   if(input.left) state = "LEFT";
	   if(hSpeed = 0) state = "IDLE"; 
	      break;   	  
   }
   case("LEFT"):
   {
	   lastState = "LEFT";

	   
	   if(hSpeed > 0) sprite_index = spr_player_stop;
	   else sprite_index = spr_player_walk;
	   
	   image_xscale = -1;
	   allowPlayerMovement(); 
	   
	   image_speed = (abs(hSpeed)/maxSpeed) * animationSpeed;
	   
	   //Check inputs
	   if(input.up) state = "JUMPING";
	   if(input.right) state = "RIGHT";
	   if(hSpeed = 0) state = "IDLE"; 
	   	  
	      break;   
   }
   case("JUMPING"):
   { 
        
        sprite_index = spr_player_jump;
		//sprite_index = spr_player_idle; 
		image_speed = (abs(vSpeed)/maxSpeed) * animationSpeed;
		allowPlayerMovement();
		if(input.up)
		{
		   jumpTime ++; 
		   if(jumpTime < 8) vSpeed = -jumpSpeed;
		}		
		else jumpTime = 20; 
		if(place_meeting(x ,y+1, obj_wall)) 
		{
		   jumpTime = 0;
		   state = lastState;
		}
	      break;   
   }	 
   
}	


//Gravity
if(vSpeed < 5) vSpeed += grav; 

//Collisions
collisionsAndMoving(obj_wall);




