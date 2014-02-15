// This script breathes fire around the key on the boss dragon level. It picks two of the four directions that access the key and places
// fireballs in those spots after it destroys the other fireball objects.

var key_x = obj_boss_dragon.key_x
var key_y = obj_boss_dragon.key_y

randomize()

dir_1 = irandom(3)

for(dir_2 = irandom(3) ; dir_2 == dir_1 ; dir_2 = irandom(3))
{}

with(obj_fire_ground)
    instance_destroy()
    
instance_create(key_x + lengthdir_x(BLOCK_SIZE,dir_1*90),key_y + lengthdir_y(BLOCK_SIZE,dir_1*90),obj_fire_ground)
instance_create(key_x + lengthdir_x(BLOCK_SIZE,dir_2*90),key_y + lengthdir_y(BLOCK_SIZE,dir_2*90),obj_fire_ground)
