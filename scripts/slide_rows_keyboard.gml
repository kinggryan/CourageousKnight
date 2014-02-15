// This function takes an ID as argument0. It slides the rows for this ID based on the mouse position
// curr_offset needs to be set to 0 in the calling object when it is selected, and start_x should be set when it's selected.
// argument0 : id
// 

//ord("A") || ord("D")

if( keyboard_check_pressed( vk_right ) ||
    keyboard_check_pressed( vk_left ) ||
    keyboard_check_pressed( ord("A")) ||
    keyboard_check_pressed( ord("D")) )
{
 //   show_message("SLIDING")
 //   change_in_offset = floor((mouse_x - start_x) / BLOCK_SIZE) - curr_offset
    if(keyboard_check_pressed(ord("A")) || 
        keyboard_check_pressed(vk_left))
        change_in_offset = -1
    else
        change_in_offset = 1  
 
  
    first_passage_id = argument0
    first_passage_x = argument0.x
    first_passage_next_up = argument0.next_up
    first_passage_next_down = argument0.next_down
    temp_passage = argument0
    
    if(temp_passage.next_right != temp_passage.id) // make sure we don't inifinitely loop
    {
    if(change_in_offset > 0)
        for(i = 0 ; i < change_in_offset ; i++)
        {
   //         show_message("1")
            while(temp_passage.next_right != first_passage_id)
            {
                temp_passage.x = temp_passage.next_right.x
                if(temp_passage.next_right.next_up != temp_passage.next_right) // as long as it's not the only block in the column
                {
                    temp_passage.next_up = temp_passage.next_right.next_up
                    temp_passage.next_down = temp_passage.next_right.next_down
                    
                    //set new adjacencies
                    temp_passage.next_up.next_down = temp_passage
                    temp_passage.next_down.next_up = temp_passage
                }
                else
                {
                    temp_passage.next_up = temp_passage
                    temp_passage.next_down = temp_passage // if it is, then make yourself the only one in the column
                }
                temp_passage = temp_passage.next_right
    //            show_message("1a")
            }
            
            // do final slide
            temp_passage.x = first_passage_x
            if(first_passage_next_up != first_passage_id) // as long as it's not the only block in the column
            {
                temp_passage.next_up = first_passage_next_up
                temp_passage.next_down = first_passage_next_down
                
                //set new adjacencies
                temp_passage.next_up.next_down = temp_passage
                temp_passage.next_down.next_up = temp_passage
            }
            else
            {
                temp_passage.next_up = temp_passage
                temp_passage.next_down = temp_passage // if it is, then make yourself the only one in the column
            }
        }
    else if(change_in_offset < 0)
        for(i = 0 ; i > change_in_offset ; i--)
        {
   //         show_message("2")
            while(temp_passage.next_left != first_passage_id)
            {
        //        show_message("2a")
                temp_passage.x = temp_passage.next_left.x
                if(temp_passage.next_left.next_up != temp_passage.next_left) // as long as it's not the only block in the column
                {
                    temp_passage.next_up = temp_passage.next_left.next_up
                    temp_passage.next_down = temp_passage.next_left.next_down
                    
                    //set new adjacencies
                    temp_passage.next_up.next_down = temp_passage
                    temp_passage.next_down.next_up = temp_passage
                }
                else
                {
                    temp_passage.next_up = temp_passage
                    temp_passage.next_down = temp_passage // if it is, then make yourself the only one in the column
                }
                
                temp_passage = temp_passage.next_left
            }
            
            temp_passage.x = first_passage_x
            if(first_passage_next_up != first_passage_id) // as long as it's not the only block in the column
            {
                temp_passage.next_up = first_passage_next_up
                temp_passage.next_down = first_passage_next_down
                
                //set new adjacencies
                temp_passage.next_up.next_down = temp_passage
                temp_passage.next_down.next_up = temp_passage
            }
            else
            {
                temp_passage.next_up = temp_passage
                temp_passage.next_down = temp_passage // if it is, then make yourself the only one in the column
            }
        }
    }
        
    with(obj_minotaur)
        monster_redo_movements(self.id,obj_knight.id)
            
    highlight_rows_and_columns(argument0)
        
    curr_offset += change_in_offset
}
