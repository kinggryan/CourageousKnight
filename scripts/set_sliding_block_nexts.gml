// this script sets all the next variables for sliding blocks

global.unchecked_block_count = instance_number(obj_slide_passage_parent)

with(obj_slide_passage_parent)
{
    next_right = noone
}

while(global.unchecked_block_count != 0)
{
    global.unchecked_block_count = 0
    
    global.x_queue = ds_priority_create()
    global.y_queue = ds_priority_create()
    
    with(obj_slide_passage_parent)
    {
        if(next_right == noone)
        {
            ds_priority_add(global.x_queue,self.id,self.x)
            ds_priority_add(global.y_queue,self.id,self.y)
            global.unchecked_block_count++
        }
    }

//    find_next_right_recursive(ds_priority_find_min(global.x_queue),ds_priority_find_min(global.x_queue))
//    find_next_down_recursive(ds_priority_find_min(global.x_queue),ds_priority_find_min(global.x_queue))
    
    if(ds_priority_find_min(global.y_queue).next_right == noone)
    {
            find_next_right_recursive(ds_priority_find_min(global.y_queue),ds_priority_find_min(global.y_queue))
            find_next_down_recursive(ds_priority_find_min(global.y_queue),ds_priority_find_min(global.y_queue))
    }
    
    
    ds_priority_destroy(global.x_queue)
    ds_priority_destroy(global.y_queue)
}
