// This function finds the next sliding block to the right of the given object id ARGUMENT0. If the edge is found, ARGUMENT1 is treated as the farthest left in
// this row
// ARGUMENT0 : id of current block
// ARGUMENT1 : id of furthest left block

check_x = argument0.x
check_y = argument0.y

show_message("RIGHT check_id: " + string(argument0))

while(check_x < room_width)
{
    check_x += BLOCK_SIZE // increment size
    
    if(collision_point(check_x,check_y,obj_slide_passage_parent,false,true))
    {
        check_id = collision_point(check_x,check_y,obj_slide_passage_parent,false,true)
        check_id.next_left = argument0
        argument0.next_right = argument1
        
        show_message("Hit : " + string(check_id))
        
        find_next_right_recursive(check_id,argument1)
        find_next_down_recursive(check_id,argument1)
        exit
    }
}

show_message("exit arg 0 : " + string(argument0) + " 1: " + string(argument1))

argument0.next_right = argument1
argument1.next_left = argument0
