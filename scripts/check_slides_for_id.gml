// This script checks whether to slide along rows and columns for the given id. ROW_MODE and COL_MODE should be set to 1 when the object is
// selected, and curr_offset should be initialized to 0 when the object is selected, and start_x and start_y should be set to the object's
// position
// ARGUMENT0 : id

id_to_check = argument0

if(row_mode && (mouse_x < id_to_check.x - BLOCK_SIZE || mouse_x > id_to_check.x + BLOCK_SIZE ))
{
    col_mode = 0
    slide_rows(id_to_check)
}
else if(col_mode && (mouse_y < id_to_check.y - BLOCK_SIZE || mouse_y > id_to_check.y + BLOCK_SIZE ))
{
    row_mode = 0
    slide_columns(id_to_check)
}
else 
{
    row_mode = 1
    col_mode = 1 // reset row and column modes
}
