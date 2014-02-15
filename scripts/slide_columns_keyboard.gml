// This function takes an ID as argument0. It slides the columns for this ID based on the mouse position
// curr_offset needs to be set to 0 in the calling object when it is selected, and start_y should be set when it's selected.
// argument0 : id
// 

if( keyboard_check_pressed( vk_down ) ||
    keyboard_check_pressed( vk_up ) ||
    keyboard_check_pressed( ord("W")) ||
    keyboard_check_pressed( ord("S")) )
{
    //show_message("SLIDING")
   // change_in_offset = floor((mouse_y - start_y) / BLOCK_SIZE) - curr_offset
    if(keyboard_check_pressed(vk_up) ||
        keyboard_check_pressed(ord("W")))
        change_in_offset = -1
    else
        change_in_offset = 1 
   
    first_passage_id = argument0
    first_passage_y = argument0.y
    first_passage_next_left = argument0.next_left
    first_passage_next_right = argument0.next_right
    temp_passage = argument0
    
    if(temp_passage.next_up != temp_passage)
    {
    if(change_in_offset > 0)
        for(i = 0 ; i < change_in_offset ; i++)
        {
            while(temp_passage.next_down != first_passage_id)
            {
                temp_passage.y = temp_passage.next_down.y
                if(temp_passage.next_down.next_left != temp_passage.next_down) // as long as it's not the only block in the row
                {
                    temp_passage.next_left = temp_passage.next_down.next_left
                    temp_passage.next_right = temp_passage.next_down.next_right
                    
                    temp_passage.next_left.next_right = temp_passage
                    temp_passage.next_right.next_left = temp_passage
                }
                else
                {
                    temp_passage.next_left = temp_passage
                    temp_passage.next_right = temp_passage // if it is, then make yourself the only one in the row
                }
                temp_passage = temp_passage.next_down
            }
            
            // do final slide
            temp_passage.y = first_passage_y
            if(first_passage_next_left != first_passage_id) // as long as it's not the only block in the row
            {
                temp_passage.next_left = first_passage_next_left
                temp_passage.next_right = first_passage_next_right
                
                temp_passage.next_left.next_right = temp_passage
                temp_passage.next_right.next_left = temp_passage
            }
            else
            {
                temp_passage.next_left = temp_passage
                temp_passage.next_right = temp_passage // if it is, then make yourself the only one in the row
            }
        }
    else
        for(i = 0 ; i > change_in_offset ; i--)
        {
            while(temp_passage.next_up != first_passage_id)
            {
                temp_passage.y = temp_passage.next_up.y
                if(temp_passage.next_up.next_left != temp_passage.next_up) // as long as it's not the only block in the column
                {
                    temp_passage.next_left = temp_passage.next_up.next_left
                    temp_passage.next_right = temp_passage.next_up.next_right
                    
                    temp_passage.next_left.next_right = temp_passage
                    temp_passage.next_right.next_left = temp_passage
                }
                else
                {
                    temp_passage.next_left = temp_passage
                    temp_passage.next_right = temp_passage // if it is, then make yourself the only one in the column
                }
                
                temp_passage = temp_passage.next_up
            }
            
            temp_passage.y = first_passage_y
            if(first_passage_next_left != first_passage_id) // as long as it's not the only block in the column
            {
                temp_passage.next_left = first_passage_next_left
                temp_passage.next_right = first_passage_next_right
                
                temp_passage.next_left.next_right = temp_passage
                temp_passage.next_right.next_left = temp_passage
            }
            else
            {
                temp_passage.next_left = temp_passage
                temp_passage.next_right = temp_passage // if it is, then make yourself the only one in the column
            }
        }
    }
        
    with(obj_minotaur)
        monster_redo_movements(self.id,obj_knight.id)
    
    highlight_rows_and_columns(argument0)
        
    curr_offset += change_in_offset
}
