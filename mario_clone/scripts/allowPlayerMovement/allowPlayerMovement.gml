/// allowPLayerMovement(); 

//Decelerate 
if((!input.right) && (!input.left))
{
   hSpeed = lerp(hSpeed, 0, acc*1.5); 
   if(hSpeed < 0.09) && (hSpeed > -0.09)
   {
       hSpeed = 0; 
   }	   
}	

// Move Right
if(input.right)
{
   hSpeed += acc;
   if(hSpeed >= maxSpeed) hSpeed = maxSpeed;    
	   
} 

// Move Left
if(input.left)
{
   hSpeed -= acc;
   if(hSpeed <= -maxSpeed) hSpeed = -maxSpeed;    
	   
} 
