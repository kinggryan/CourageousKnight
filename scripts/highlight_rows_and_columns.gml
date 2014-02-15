// This function takes a passage id as argument0 and checks to see if any monsters exist in this passage's row. It returns true if there
//  are, and false if none
// ARGUMENT0 : Passage ID

with(obj_slide_passage_others_overlay)
    instance_destroy()

p_to_check = argument0.next_right
start_p = argument0
while(p_to_check != start_p)
{
    new_overlay = instance_create(p_to_check.x,p_to_check.y,obj_slide_passage_others_overlay)
 //   new_overlay.image_single = obj_slide_passage_overlay.image_single
    p_to_check = p_to_check.next_right
}

p_to_check = start_p.next_down
while(p_to_check != start_p)
{
    new_overlay = instance_create(p_to_check.x,p_to_check.y,obj_slide_passage_others_overlay)
//    new_overlay.image_single = obj_slide_passage_overlay.image_single
    p_to_check = p_to_check.next_down
}


