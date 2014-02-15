// this script sets all the next variables for sliding blocks

global.unchecked_block_count = instance_number(obj_slide_passage_parent)

with(obj_slide_passage_parent)
{
    next_right = noone
}

while(global.unchecked_block_count != 0)
{
    global.unchecked_block_count = 0
    
    global.p_queue = ds_priority_create()
    
    with(obj_slide_passage_parent)
    {
        if(next_right == noone)
        {
            ds_priority_add(global.p_queue,self.id,distance_to_point(0,0))
            global.unchecked_block_count++
        }
    }

    find_next_right_recursive(ds_priority_find_min(global.p_queue),ds_priority_find_min(global.p_queue))
    find_next_down_recursive(ds_priority_find_min(global.p_queue),ds_priority_find_min(global.p_queue))
    
    ds_priority_destroy(global.p_queue)
}
