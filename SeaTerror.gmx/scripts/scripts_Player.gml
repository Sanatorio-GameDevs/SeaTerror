#define scripts_Player


#define script_player_walking
///script_player_walking();

    script_hspeed();
    script_vspeed(player_state);
    
    script_hcolission();
    script_vcolission();
    
//Change_State
if (f_jump) {
    player_state = player_states.jumping;
    f_jump = 0;
}

if (f_colission_movable && !f_jump) {
    player_state = player_states.moving_block;
    f_colission_movable = 0;
}
    

#define script_player_jumping
///script_player_jumping();

    script_hspeed();
    script_vspeed(player_state);

    script_hcolission();
    script_vcolission();
    
    if (f_vcolission) {
        player_state = player_states.walking;
        f_vcolission = 0;
    }

#define script_player_moving_block
///script_player_moving_block();