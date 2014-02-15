// This script should be called by any monsters that need to find a path to the player. It handles the monster queue stuff. The monster ID is given as argument0,
// and monster tracking target is given as argument1

var monster = argument0
var target = argument1

// Destroy previous movement queue
ds_queue_destroy(monster.movement_queue)

temp_queue = find_path_to_knight(monster,target)

if(temp_queue == -1)
{
 //   show_message("not walking")
    // if there is no valid path from the monster to it's target
    monster.speed = 0 // stop monster
}
else
{
 //   show_message("walking")
    monster.movement_queue = temp_queue // start the monster on it's new and glorious movement queue
    monster.speed = movement_speed // begin monster movement
    
    target_string = ds_queue_dequeue(monster.movement_queue)

    comma_index = string_pos(",",target_string)
    monster.target_x = (real(string_copy(target_string,1,comma_index - 1))*64)+32
    monster.target_y = (real(string_copy(target_string,comma_index + 1, string_length(check_string))))*64 + 32
    
    monster.direction = point_direction(monster.x,monster.y,target_x,target_y)
}
