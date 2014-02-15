// This function takes a passage id as argument0 and checks to see if any monsters exist in this passage's row. It returns true if there
//  are, and false if none
// ARGUMENT0 : Passage ID

p_to_check = argument0
start_p = argument0
do
{
    p_to_check = p_to_check.next_down
    
    if(collision_rectangle(p_to_check.x-BLOCK_SIZE/2,p_to_check.y-BLOCK_SIZE/2,p_to_check.x+BLOCK_SIZE/2,p_to_check.y+BLOCK_SIZE/2,obj_monster_parent,false,true) != noone)
        return true
} until(p_to_check == start_p)

return false
