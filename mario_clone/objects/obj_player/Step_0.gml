/// Main Actions

// Movement
switch(state)
{
   case("IDLE"):
   {
       lastState = "IDLE"; 
	   sprite_index = spr_player_idle; 
	   //image_speed = 1; 
	   
	   
	   hSpeed = lerp(hSpeed, 0, acc*1.5); 
	   if(hSpeed < 0.09) && (hSpeed > -0.09)
	   {
	       hSpeed = 0; 
	   }	   
	   
	   //check inputs
	   if(input.up) && (vSpeed == 0)  state = "JUMPING_INIT";
	   if(input.right) state = "RIGHT";
	   if(input.left) state = "LEFT";
	  
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
	   if(input.up) && (vSpeed == 0)  state = "JUMPING_INIT";
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
	   if(input.up) && (vSpeed == 0)  state = "JUMPING_INIT";
	   if(input.right) state = "RIGHT";
	   if(hSpeed = 0) state = "IDLE"; 
	   	  
	      break;   
   }
   case("JUMPING_INIT"):
   {
	    sprite_index = spr_player_jump;
		//sprite_index = spr_player_idle; 
		image_speed = (abs(vSpeed)/maxSpeed) * animationSpeed;
	    
		vSpeed = -jumpSpeed; 
		state = "JUMPING"; 
	   break;   
   }   
   case("JUMPING"):
   { 
        
        if(vSpeed < 0) && (!input.up_held) vSpeed = max(vSpeed, -jumpSpeed/2);
		allowPlayerMovement();
		
		if(vSpeed == 0)
		{
			if(place_meeting(x, y+1, obj_wall)) state = lastState; 
		}	
		else
		{
			if(place_meeting(x, y+vSpeed, obj_wall)) state = lastState;
			
		}	
		break; 
		
   }	 
   
}	


//Gravity
if(vSpeed < 5) vSpeed += grav; 




collisionsAndMoving(obj_wall);



