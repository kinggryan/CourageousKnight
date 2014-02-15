// This function shoots four fireballs out from the boss dragon, one in each direction.

for(dir = 0 ; dir < 360 ; dir += 90)
{
    fireball = instance_create(obj_boss_dragon.x,obj_boss_dragon.y,obj_fireball)
    fireball.direction = dir
    fireball.speed = 16
    fireball.image_angle = dir + 90
}
