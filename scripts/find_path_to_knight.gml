// This script takes two ID's : start and target, and attempts to find a path that will lead from start to target. It does this 
// backwards. THe method returns the ID of a stack with the grid coordinates from start to target. If there is no path, this returns -1
// 
// ARGUMENT0 : STARTID
// ARGUMENT1 : TARGETID

// this grid stores each coordinate's distance from start. Initialized to 100.
g_distance = ds_grid_create(floor(room_width/64),floor(room_height/64))
ds_grid_set_region(g_distance,0,0,ds_grid_width(g_distance),ds_grid_height(g_distance),100)

// This grid stores the coordinates of the previous cell as a string "x,y"
g_previous = ds_grid_create(floor(room_width/64),floor(room_height/64)) 

// This grid stores each cell's checked or unchecked value as a boolean. Initialize each to false
g_checked = ds_grid_create(floor(room_width/64), floor(room_height/64))
ds_grid_set_region(g_checked,0,0,ds_grid_width(g_distance),ds_grid_height(g_distance),0)

// set start and target. We'll solve backwards from target to start
start_x = floor(argument0.x / 64)
start_y = floor(argument0.y / 64)

target_x = floor(argument1.x / 64)
target_y = floor(argument1.y / 64)

// make priority queue
route_q = ds_priority_create()

ds_priority_add(route_q,string(target_x) + "," + string(target_y),0)
current_x = target_x
current_y = target_y

ds_grid_set(g_distance,target_x,target_y,0) // initialize distance of start to 0

//show_message("Start at " + string(current_x) + "," + string(current_y))
//show_message("Target " + string(start_x) + "," + string(start_y))

while(!(current_x == start_x && current_y == start_y) && !ds_priority_empty(route_q))
{
//    show_message("start loop at " + string(current_x) + "," + string(current_y))
    check_string = ds_priority_find_min(route_q)
    ds_priority_delete_min(route_q)
    
    comma_index = string_pos(",",check_string)
    
    current_x = real(string_copy(check_string,1,comma_index - 1))
    current_y = real(string_copy(check_string,comma_index + 1, string_length(check_string)))
    
    if(!ds_grid_get(g_checked,current_x,current_y)) // if unchecked
    {
        ds_grid_set(g_checked,current_x,current_y,1) // set it as checked
        
        current_distance = ds_grid_get(g_distance,current_x,current_y)
        
        for(dir = 0 ; dir < 360 ; dir += 90) // for each direction
        {
  //          show_message("direction : " + string(dir))
            check_x = (current_x+lengthdir_x(1,dir))
            check_y = (current_y+lengthdir_y(1,dir))
/*            show_message("curr coords:  " + string(current_x) + "," + string(current_y))
            show_message("check coords:  " + string(check_x) + "," + string(check_y))
            show_message("current point : " + string((current_x*64)+32) + "," + string((current_y*64)+32))
            show_message("check point : " + string((check_x*64)+32) + "," + string((check_y*64)+32)) */
            if(collision_line((current_x*64)+32,(current_y*64)+32,(check_x*64)+32,(check_y*64)+32,obj_passage_parent,true,false) == noone)
            {
       //         for(i = 0 ; i < ds_grid_width(g_distance) ; i++)
         //           for(j = 0 ; j < ds_grid_height(g_distance) ; j++)
           //             show_message("Distance Grid value at : " + string(i) + "," + string(j) + " : " + string(ds_grid_get(g_distance,check_x,check_y)))
                    
      //          show_message("No collision. Current distance to check : " + string(ds_grid_get(g_distance,check_x,check_y)))
        //        show_message("and current distance :  "+ string(current_distance))
                if(current_distance + 1 < ds_grid_get(g_distance,check_x,check_y)) // if new route is faster
                {
                    ds_grid_set(g_distance,check_x,check_y,current_distance+1)
                    ds_grid_set(g_previous,check_x,check_y,string(current_x) + "," + string(current_y))
                    
                    ds_priority_add(route_q,string(check_x) + "," + string(check_y),current_distance + 1)
   //                 show_message("Adding to queue : " + string(check_x) + "," + string(check_y))
                }
        //        else
    //                show_message("But no replacement")
            }
     //       else
      //          show_message("Collision")
        }
    }
}

if(!(current_x == start_x && current_y == start_y))
{
    // empty, so clean up and return -1
    ds_priority_destroy(route_q)
    ds_grid_destroy(g_distance)
    ds_grid_destroy(g_previous)
    ds_grid_destroy(g_checked)
    return -1
}
else
{
    new_queue = ds_queue_create()
    read_x = start_x
    read_y = start_y
    
    while(!(read_x == target_x && read_y == target_y))
    {
        ds_queue_enqueue(new_queue,string(read_x) + "," + string(read_y))
    
        check_string = ds_grid_get(g_previous,read_x,read_y)
    
        comma_index = string_pos(",",check_string)
        read_x = real(string_copy(check_string,1,comma_index - 1))
        read_y = real(string_copy(check_string,comma_index + 1, string_length(check_string)))
    }
    
    ds_queue_enqueue(new_queue,string(read_x) + "," + string(read_y))
    
    ds_priority_destroy(route_q)
    ds_grid_destroy(g_distance)
    ds_grid_destroy(g_previous)
    ds_grid_destroy(g_checked)
    
    return new_queue
    // else, construct stack, clean up, and return queue ID
}
