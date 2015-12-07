#define scripts_Movements


#define script_hcolission
///script_hcolission()

    if (place_meeting(x+hsp,y,obj_Solid)) {
        while (!(place_meeting(x+sign(hsp),y,obj_Solid)))
            x += sign(hsp);
        hsp = 0;
        if (input_controlled && place_meeting(x+hsp,y,obj_S_Movable) && (player_state != player_states.jumping))
            f_colission_movable = 1;
    }
    else {
        x += hsp;
    }

#define script_vcolission
///script_vcolission()

    if (place_meeting(x,y+vsp,obj_Solid)) {
        while !(place_meeting(x,y+sign(vsp),obj_Solid))
            y += sign(vsp);
        vsp = 0;
        if (player_state = player_states.jumping) {
            f_vcolission = 1;
        }
    }
    else {
        y += vsp;
    }

#define script_hspeed
///script_hspeed()

    if (input_controlled) {
        if (abs(input_direction)) {
            if (abs(hsp + (INPUT_ACCEL) + (WATER_ACCEL)) <= max_hsp) {
                hsp += (INPUT_ACCEL) + (WATER_ACCEL);
            }
            else {
                hsp = max_hsp * input_direction;
            }
        }
        else {
            if (hsp != 0) {
                if (abs(hsp) + (WATER_ACCEL) <= 0)
                    hsp += (WATER_ACCEL);
                else {
                    hsp = 0;
                }
            }
        }
    }

#define script_vspeed
///script_vspeed(state_player);

    switch (argument0) {
        case player_states.walking:
        case player_states.moving_block:
            if (key_jump) {
                vsp += jmp_accel;
                f_jump = 1;
            }
            break;
        case player_states.jumping:
            if (vsp + (GRAV * mass) + (key_jump * v_accel) <= max_vsp)
                vsp += (GRAV * mass) + (key_jump * v_accel);
            else {
                vsp = max_vsp;
            }
            break;
    }