// This function takes an object ID as argument0 and chooses and returns a direction that the object can move
// that does not intersect with a passageway.

object_id = argument0

object_center_x = object_id.x - (object_id.x%BLOCK_SIZE) + BLOCK_SIZE/2
object_center_y = object_id.y - (object_id.y%BLOCK_SIZE) + BLOCK_SIZE/2

dir_list = ds_list_create()

for(dir = 0 ; dir < 360 ; dir += 90)
{
    if(collision_line(object_center_x,object_center_y,object_center_x + lengthdir_x(BLOCK_SIZE,dir), object_center_y + lengthdir_y(BLOCK_SIZE,dir),obj_passage_parent,true,false) == noone)
    {
        ds_list_add(dir_list,dir)
    }
}

randomize()

ds_list_shuffle(dir_list)

return_value = ds_list_find_value(dir_list,0)

ds_list_destroy(dir_list)

return return_value
