// This function finds each sliding block in the room and assigns appropriate left_next, right_next, down_next, and up_next  ids.

global.x_queue = ds_priority_create()
global.y_queue = ds_priority_create()

with(obj_slide_passage_parent)
{
    ds_priority_add(global.x_queue,self.id,self.x)
    ds_priority_add(global.y_queue,self.id,self.y)
}

temp_passage_id = ds_priority_find_max(global.x_queue)
ds_priority_delete_max(global.x_queue)

temp_stack = ds_stack_create()
ds_stack_push(temp_stack,temp_passage_id)
comp_value = temp_passage_id.x

while(!ds_priority_empty(global.x_queue))
{
    temp_passage_id = ds_priority_find_max(global.x_queue)
    ds_priority_delete_max(global.x_queue)
    
    if(temp_passage_id.x == comp_value) // if the x value of the popped passage and the previously popped passage are the same
    {
        ds_stack_push(temp_stack,temp_passage_id)
    }
    else
    {
        start_id = ds_stack_pop(temp_stack)
        prev_id = start_id
        
        while(!ds_stack_empty(temp_stack))
        {
            modify_id = ds_stack_pop(temp_stack)
            modify_id.left_next = prev_id
            prev_id.right_next = modify_id
            prev_id = modify_id
        }
        
        prev_id.right_next = start_id
        start_id.left_next = 
    }
}
