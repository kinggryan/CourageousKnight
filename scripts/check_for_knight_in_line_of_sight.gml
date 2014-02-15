// This function takes an ID as argument0 and sees if there is a straight path from that objecct to the knightr 
// ARGUMENT0 : object ID

monster = argument0

check_dir = 0
check_length = BLOCK_SIZE

monster_center_x = monster.x - (monster.x % BLOCK_SIZE) + (BLOCK_SIZE / 2)
monster_center_y = monster.y - (monster.y % BLOCK_SIZE) + (BLOCK_SIZE / 2)

for(check_dir = 0 ; check_dir < 360 ; check_dir += 90)
{
    check_x = monster_center_x
    check_y = monster_center_y
    
    while(collision_line(check_x,check_y,monster_center_x,monster_center_y,obj_passage_parent,true,true) == noone)
    {
        if(collision_rectangle(check_x-BLOCK_SIZE/4,check_y-BLOCK_SIZE/4,check_x+BLOCK_SIZE/4,check_y+BLOCK_SIZE/4,obj_knight,false,true) != noone)
            return check_dir
            
        check_x += lengthdir_x(BLOCK_SIZE,check_dir)
        check_y += lengthdir_y(BLOCK_SIZE,check_dir)
    }
}

return -1
