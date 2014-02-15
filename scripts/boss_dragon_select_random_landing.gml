// This function selects a random landing location and returns the id of the landing passage
        
list = ds_list_create()

with(obj_passage_parent)
{
    ds_list_add(obj_shadow.list,self.id)
}

randomize()

ds_list_shuffle(list)

do
{
    return_value = ds_list_find_value(list,0)
    ds_list_delete(list,0)
} until (point_distance(x,y,return_value.x,return_value.y) >= BLOCK_SIZE * 3)

ds_list_destroy(list)

return return_value
