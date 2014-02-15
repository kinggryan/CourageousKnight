global.x_master_queue = ds_priority_create()
global.y_master_queue = ds_priority_create()

with(obj_slide_passage_parent)
{
    ds_priority_add(global.y_master_queue,self.id,self.y) 
    ds_priority_add(global.x_master_queue,self.id,self.x)
}

global.row_queue = ds_priority_create()

temp_passage_id = ds_priority_find_min(global.y_master_queue)
ds_priority_delete_min(global.y_master_queue)
ds_priority_add(global.row_queue,temp_passage_id,temp_passage_id.x)
row_value = temp_passage_id.y

while(!ds_priority_empty(global.y_master_queue))
{
    temp_passage_id = ds_priority_find_min(global.y_master_queue)
    ds_priority_delete_min(global.y_master_queue)
    
    if(row_value != temp_passage_id.y)
    {
        //store data
        first_id = ds_priority_find_min(global.row_queue)
        ds_priority_delete_min(global.row_queue)
        prev_id = first_id
        curr_id = first_id
        
        // now go through the row and set next and prev values
        while( !ds_priority_empty(global.row_queue))
        {
            curr_id = ds_priority_find_min(global.row_queue)
            curr_id.next_left = prev_id
            prev_id.next_right = curr_id
            prev_id = curr_id
            ds_priority_delete_min(global.row_queue)
        }
        
        // finish up the row
        curr_id.next_right = first_id
        first_id.next_left = curr_id
        
        //reset row value
        row_value = temp_passage_id.y
    }
    
    ds_priority_add(global.row_queue,temp_passage_id,temp_passage_id.x)
}

//store data
first_id = ds_priority_find_min(global.row_queue)
ds_priority_delete_min(global.row_queue)
prev_id = first_id
curr_id = first_id
        
// now go through the row and set next and prev values
while( !ds_priority_empty(global.row_queue))
{
    curr_id = ds_priority_find_min(global.row_queue)
    curr_id.next_left = prev_id
    prev_id.next_right = curr_id
    prev_id = curr_id
    ds_priority_delete_min(global.row_queue)
}
        
// finish up the row
curr_id.next_right = first_id
first_id.next_left = curr_id

//Do ups and downs

temp_passage_id = ds_priority_find_min(global.x_master_queue)
ds_priority_delete_min(global.x_master_queue)
ds_priority_add(global.row_queue,temp_passage_id,temp_passage_id.y)
row_value = temp_passage_id.x

while(!ds_priority_empty(global.x_master_queue))
{
    temp_passage_id = ds_priority_find_min(global.x_master_queue)
    ds_priority_delete_min(global.x_master_queue)
    
    if(row_value != temp_passage_id.x)
    {
        //store data
        first_id = ds_priority_find_min(global.row_queue)
        ds_priority_delete_min(global.row_queue)
        prev_id = first_id
        curr_id = first_id
        
        // now go through the row and set next and prev values
        while( !ds_priority_empty(global.row_queue))
        {
            curr_id = ds_priority_find_min(global.row_queue)
            curr_id.next_up = prev_id
            prev_id.next_down = curr_id
            prev_id = curr_id
            ds_priority_delete_min(global.row_queue)
        }
        
        // finish up the row
        curr_id.next_down = first_id
        first_id.next_up = curr_id
        
        //reset row value
        row_value = temp_passage_id.x
    }
    
    ds_priority_add(global.row_queue,temp_passage_id,temp_passage_id.y)
}

//store data
first_id = ds_priority_find_min(global.row_queue)
ds_priority_delete_min(global.row_queue)
prev_id = first_id
curr_id = first_id
        
// now go through the row and set next and prev values
while( !ds_priority_empty(global.row_queue))
{
    curr_id = ds_priority_find_min(global.row_queue)
    curr_id.next_up = prev_id
    prev_id.next_down = curr_id
    prev_id = curr_id
    ds_priority_delete_min(global.row_queue)
}
        
// finish up the row
curr_id.next_down = first_id
first_id.next_up = curr_id

ds_priority_destroy(global.x_master_queue)
ds_priority_destroy(global.y_master_queue)
ds_priority_destroy(global.row_queue)
