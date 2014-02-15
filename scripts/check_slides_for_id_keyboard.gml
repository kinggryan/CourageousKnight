// This script checks whether to slide along rows and columns for the given id. ROW_MODE and COL_MODE should be set to 1 when the object is
// selected, and curr_offset should be initialized to 0 when the object is selected, and start_x and start_y should be set to the object's
// position
// ARGUMENT0 : id

id_to_check = argument0

if(!check_for_monsters_in_row(id_to_check) && !check_for_knight_in_row(id_to_check))
    slide_rows_keyboard(id_to_check)
if(!check_for_monsters_in_column(id_to_check) && !check_for_knight_in_column(id_to_check))
    slide_columns_keyboard(id_to_check)
