; HEADER_BLOCK_START
; BambuStudio 01.06.01.02
; model printing time: 20m 34s; total estimated time: 26m 35s
; total layer number: 10
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; additional_cooling_fan_speed = 70,70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_difference = 10,10
; before_layer_change_gcode = 
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = no_brim
; brim_width = 5
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}M104 S[old_filament_temp]{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; close_fan_the_first_x_layers = 1,1
; cool_plate_temp = 35,35
; cool_plate_temp_initial_layer = 35,35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = brim_type;ironing_flow;ironing_speed;ironing_type;top_shell_layers;top_surface_speed;filament_flow_ratio;filament_flow_ratio;
; draft_shield = disabled
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1
; enable_prime_tower = 1
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0
; eng_plate_temp_initial_layer = 0,0
; ensure_vertical_shell_thickness = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 56
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; fan_cooling_layer_time = 100,100
; fan_max_speed = 100,100
; fan_min_speed = 100,100
; filament_colour = #FFFFFF;#80FF00
; filament_cost = 24.99,24.99
; filament_density = 1.26,1.26
; filament_diameter = 1.75,1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.93,0.93
; filament_ids = GFA00;GFA00
; filament_is_support = 0,0
; filament_max_volumetric_speed = 21,21
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_settings_id = "Bambu PLA Basic @BBL X1";"Bambu PLA Basic @BBL X1"
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}"
; filament_type = PLA;PLA
; filament_vendor = "Bambu Lab";"Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,241,387,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; host_type = octoprint
; hot_plate_temp = 55,55
; hot_plate_temp_initial_layer = 55,55
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_infill_speed = 105
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_speed = 250
; ironing_flow = 30%
; ironing_spacing = 0.15
; ironing_speed = 60
; ironing_type = top
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; machine_end_gcode = ;===== date: 20230118 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\nM991 S0 P-1 ;end smooth timelapse at safe pos\nM400 S2 ;wait for last picture to be taken\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: P1P ========================\n;===== date: 20230323 =====================\n;===== turn on the HB fan =================\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp to turn on the HB fan\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG0 Z12 F300 ; lower the hotbed , to prevent the nozzle is below the hotbed\nG0 Z-6;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== noozle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression
; machine_unload_filament_time = 28
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; nozzle_diameter = 0.4
; nozzle_hrc = 20
; nozzle_temperature = 220,220
; nozzle_temperature_initial_layer = 220,220
; nozzle_temperature_range_high = 240,240
; nozzle_temperature_range_low = 190,190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; only_one_wall_top = 1
; ooze_prevention = 0
; outer_wall_acceleration = 5000
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,50%
; post_process = 
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle"
; print_host = 
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab P1S
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_technology = FFF
; printer_variant = 0.4
; printhost_apikey = 
; printhost_authorization_type = key
; printhost_cafile = 
; printhost_password = 
; printhost_port = 
; printhost_ssl_ignore_revoke = 0
; printhost_user = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 0
; seam_position = aligned
; silent_mode = 0
; single_extruder_multi_material = 1
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 8,8
; slow_down_min_speed = 20,20
; solid_infill_filament = 1
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; temperature_vitrification = 55,55
; template_custom_gcode = 
; textured_plate_temp = 55,55
; textured_plate_temp_initial_layer = 55,55
; thick_bridges = 0
; timelapse_type = 0
; top_shell_layers = 4
; top_shell_thickness = 0.6
; top_surface_acceleration = 2000
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 100
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_wall_count = 1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_infill_order = inner wall/outer wall/infill
; wall_loops = 2
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 155
; wipe_tower_y = 221
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Spiral Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R26
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1P ========================
;===== date: 20230323 =====================
;===== turn on the HB fan =================
M104 S220 ;set extruder temp to turn on the HB fan
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G0 Z12 F300 ; lower the hotbed , to prevent the nozzle is below the hotbed
G0 Z-6;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
M73 P16 R22
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P17 R21
G1 X76 F15000
M73 P18 R21
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
M73 P19 R21
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X81.3606 Y97.8611 I112.068 J147.067
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== noozle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
G21
M83 ; only support relative e
M620 S0A
M204 S9000

G1 Z3 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0
M104 S220
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

M73 P20 R21
G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T0
M620.1 E F523 T240


M400

G92 E0







; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60 F15000
G1 X80 F15000
G1 X60 F15000; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265 F5000
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
M73 P21 R21
G1 Y256 ; move Y to aside, prevent collision
M400
M73 P21 R20
G1 Z3 F3000

M204 S500


M621 S0A
;_FORCE_RESUME_FAN_SPEED
; filament start gcode
M106 P3 S255
M981 S1 P20000 ;open spaghetti detector
G1 Z.2 F30000
M106 S0
M106 P2 S0
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 1/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M204 S500
G1 E-.8 F1800
G1 X189.5 Y239 F30000
G1 Z.6
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F3000
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X156.500 Y219.500  
;--------------------
; CP EMPTY GRID START
; layer #2
G1  Y220.000  E0.0190
G1  X189.000  E1.2352
G1  Y220.500  E0.0190
G1  X156.000  E1.2542
G1  Y221.000  E0.0190
G1  X189.000  E1.2542
G1  Y221.500  E0.0190
G1  X156.000  E1.2542
G1  Y222.000  E0.0190
G1  X189.000  E1.2542
G1  Y222.500  E0.0190
G1  X156.000  E1.2542
G1  Y223.000  E0.0190
G1  X189.000  E1.2542
G1  Y223.500  E0.0190
G1  X156.000  E1.2542
M73 P22 R20
G1  Y224.000  E0.0190
G1  X189.000  E1.2542
G1  Y224.500  E0.0190
G1  X156.000  E1.2542
G1  Y225.000  E0.0190
G1  X189.000  E1.2542
G1  Y225.500  E0.0190
G1  X156.000  E1.2542
G1  Y226.000  E0.0190
G1  X189.000  E1.2542
G1  Y226.500  E0.0190
G1  X156.000  E1.2542
G1  Y227.000  E0.0190
G1  X189.000  E1.2542
G1  Y227.500  E0.0190
G1  X156.000  E1.2542
G1  Y228.000  E0.0190
G1  X189.000  E1.2542
G1  Y228.500  E0.0190
G1  X156.000  E1.2542
G1  Y229.000  E0.0190
G1  X189.000  E1.2542
G1  Y229.500  E0.0190
G1  X156.000  E1.2542
G1  Y230.000  E0.0190
G1  X189.000  E1.2542
G1  Y230.500  E0.0190
G1  X156.000  E1.2542
G1  Y231.000  E0.0190
G1  X189.000  E1.2542
G1  Y231.500  E0.0190
G1  X156.000  E1.2542
G1  Y232.000  E0.0190
G1  X189.000  E1.2542
G1  Y232.500  E0.0190
G1  X156.000  E1.2542
G1  Y233.000  E0.0190
G1  X189.000  E1.2542
G1  Y233.500  E0.0190
G1  X156.000  E1.2542
G1  Y234.000  E0.0190
G1  X189.000  E1.2542
G1  Y234.500  E0.0190
G1  X156.000  E1.2542
M73 P23 R20
G1  Y235.000  E0.0190
G1  X189.000  E1.2542
G1  Y235.500  E0.0190
G1  X156.000  E1.2542
G1  Y236.000  E0.0190
G1  X189.000  E1.2542
G1  Y236.500  E0.0190
G1  X156.000  E1.2542
G1  Y237.000  E0.0190
G1  X189.000  E1.2542
G1  Y237.500  E0.0190
G1  X156.000  E1.2542
G1  Y238.000  E0.0190
G1  X189.000  E1.2542
G1  Y238.500  E0.0190
G1  X156.000  E1.2542
G1  Y239.000  E0.0190
; CP EMPTY GRID END
;------------------






G1  X155.000 
G1  Y239.500 
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X155.000  E1.3302
G1  X154.543 
G1  Y239.957 
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X154.543  E1.3650
G1  X154.086 
G1  Y240.414 
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X154.086  E1.3997
G1  X153.629 
G1  Y240.871 
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834
G1  X153.629  E1.4345
G1  X153.172 
M73 P24 R20
G1  Y241.328 
G1  Y217.172  E0.9181
G1  X191.828  E1.4692
G1  Y241.328  E0.9181
G1  X153.172  E1.4692
G1  X152.715 
G1  Y241.785 
G1  Y216.715  E0.9528
G1  X192.285  E1.5039
G1  Y241.785  E0.9528
G1  X152.715  E1.5039
G1  X152.258 
G1  Y242.242 
G1  Y216.258  E0.9876
G1  X192.742  E1.5387
G1  Y242.242  E0.9876
G1  X152.258  E1.5387
G1  X151.800 
G1  Y242.700 
G1  Y215.800  E1.0223
G1  X193.200  E1.5734
G1  Y242.700  E1.0223
G1  X151.800  E1.5734

; WIPE_START
G1 F24000
G1 X151.8 Y240.7 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J-.007 P1  F30000
G1 X151.21 Y143.827 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
G1 X149.483 Y144.709 E.06856
G1 X148.073 Y146.117 E.07041
G1 X147.167 Y147.893 E.07048
G1 X146.992 Y149.004 E.03975
G1 X145.925 Y149.004 E.03772
M73 P24 R19
G1 X145.774 Y148.047 E.03424
G1 X144.941 Y146.411 E.0649
G1 X143.643 Y145.113 E.06489
G1 X142.007 Y144.28 E.0649
G1 X140.193 Y143.993 E.06491
G1 X138.381 Y144.28 E.06484
M73 P25 R19
G1 X136.745 Y145.113 E.0649
G1 X135.447 Y146.411 E.06489
G1 X134.613 Y148.047 E.0649
G1 X134.462 Y149.004 E.03424
G1 X133.355 Y149.004 E.03914
G1 X133.228 Y148.201 E.02874
G1 X132.465 Y146.705 E.05936
G1 X131.277 Y145.517 E.05938
G1 X129.781 Y144.756 E.05933
G1 X128.123 Y144.493 E.05933
G1 X126.465 Y144.756 E.05932
G1 X124.967 Y145.517 E.0594
G1 X123.781 Y146.705 E.05934
G1 X123.017 Y148.201 E.05935
G1 X122.89 Y149.004 E.02875
G1 X121.883 Y149.004 E.03562
G1 X121.78 Y148.357 E.02315
G1 X121.089 Y146.999 E.05386
G1 X120.013 Y145.923 E.0538
G1 X118.655 Y145.232 E.05383
G1 X117.151 Y144.991 E.05386
G1 X115.646 Y145.232 E.05388
G1 X114.291 Y145.923 E.05375
G1 X113.213 Y146.999 E.05384
G1 X112.521 Y148.358 E.0539
G1 X112.42 Y149.004 E.02312
G1 X111.226 Y149.004 E.0422
G1 X111.148 Y148.511 E.01763
G1 X110.531 Y147.301 E.04803
G2 X109.617 Y146.376 I-24.488 J23.275 E.04594
G1 X109.41 Y146.239 E.00877
G2 X108.316 Y145.701 I-5.038 J8.866 E.04312
M73 P26 R19
G1 X106.993 Y145.493 E.04735
G1 X105.645 Y145.705 E.0482
G1 X104.426 Y146.325 E.04833
G1 X103.461 Y147.293 E.04834
G1 X102.84 Y148.51 E.0483
G1 X102.761 Y149.004 E.01766
G1 X101.749 Y149.004 E.03576
G1 X101.696 Y148.665 E.01212
G1 X101.147 Y147.587 E.04278
G1 X100.291 Y146.731 E.04278
G1 X99.213 Y146.182 E.04275
G1 X98.017 Y145.991 E.04283
G1 X96.822 Y146.182 E.04276
G1 X95.745 Y146.731 E.04274
G1 X94.889 Y147.587 E.04279
G1 X94.34 Y148.664 E.04274
G1 X94.285 Y149.004 E.01215
G1 X93.413 Y149.004 E.03083
G1 X93.384 Y148.819 E.00664
G1 X92.904 Y147.881 E.03724
G1 X92.159 Y147.135 E.03728
G1 X91.22 Y146.658 E.0372
G1 X90.181 Y146.493 E.0372
G1 X89.139 Y146.658 E.03727
G1 X88.201 Y147.135 E.03721
G1 X87.454 Y147.881 E.03731
G1 X86.977 Y148.82 E.03721
G1 X86.948 Y149.004 E.0066
G1 X82.218 Y149.004 E.1672
G1 X82.218 Y145.797 E.11337
G1 X83.959 Y145.585 E.06201
G1 X86.408 Y144.655 E.09258
G1 X88.563 Y143.167 E.09256
G1 X90.301 Y141.208 E.09255
G2 X91.518 Y138.889 I-819.447 J-431.645 E.09259
G1 X92.144 Y136.347 E.09254
G1 X92.144 Y133.727 E.0926
G1 X91.518 Y131.185 E.09253
G1 X90.301 Y128.866 E.09256
G1 X88.563 Y126.907 E.09258
G1 X86.408 Y125.419 E.09256
G1 X83.959 Y124.489 E.09258
G1 X82.218 Y124.278 E.06201
G1 X82.218 Y122.862 E.05002
G1 X83.84 Y122.665 E.05775
G1 X86.176 Y121.777 E.08835
G1 X88.231 Y120.359 E.08825
G1 X89.889 Y118.49 E.08833
G1 X91.05 Y116.277 E.08831
G1 X91.648 Y113.851 E.08831
G1 X91.648 Y111.353 E.0883
G1 X91.05 Y108.927 E.08831
G1 X89.889 Y106.714 E.08831
G1 X88.231 Y104.845 E.08832
G1 X86.176 Y103.425 E.0883
G1 X83.839 Y102.539 E.08833
G1 X82.218 Y102.342 E.05774
G1 X82.218 Y96.718 E.19877
G1 X84.881 Y96.718 E.09413
G1 X85.104 Y98.413 E.06041
G1 X86.09 Y100.794 E.09109
G1 X87.658 Y102.834 E.09096
G1 X89.7 Y104.402 E.091
G2 X92.079 Y105.388 I525.475 J-1263.752 E.09102
G1 X94.633 Y105.724 E.09104
G1 X97.184 Y105.388 E.09096
G1 X99.565 Y104.402 E.09109
G1 X101.608 Y102.834 E.09101
G1 X103.176 Y100.793 E.09098
G1 X104.16 Y98.413 E.09104
G1 X104.384 Y96.718 E.06042
G1 X106.503 Y96.718 E.07491
G1 X106.71 Y98.283 E.05577
G1 X107.644 Y100.543 E.08646
G1 X109.134 Y102.483 E.08644
G1 X111.073 Y103.97 E.08637
G1 X113.331 Y104.904 E.08639
G1 X115.755 Y105.224 E.0864
G1 X118.178 Y104.904 E.08641
G1 X120.437 Y103.97 E.08638
G1 X122.376 Y102.483 E.08638
G1 X123.865 Y100.543 E.08643
G1 X124.8 Y98.283 E.08647
G1 X125.006 Y96.718 E.05578
G1 X126.757 Y96.718 E.06188
G1 X126.946 Y98.155 E.05122
G1 X127.832 Y100.291 E.08176
G1 X129.241 Y102.128 E.08182
G1 X131.076 Y103.538 E.08179
G1 X133.215 Y104.422 E.08179
G1 X135.508 Y104.726 E.08177
G1 X137.804 Y104.422 E.08186
G1 X139.943 Y103.538 E.08179
G1 X141.778 Y102.128 E.08179
G1 X143.187 Y100.291 E.08184
G1 X144.072 Y98.155 E.08173
G1 X144.261 Y96.718 E.05121
G1 X145.653 Y96.718 E.04923
G1 X145.868 Y98.217 E.05351
G1 X146.858 Y100.383 E.08421
G1 X148.418 Y102.182 E.08413
G1 X150.421 Y103.469 E.08416
G1 X152.705 Y104.14 E.08416
G1 X155.084 Y104.14 E.08408
G2 X157.371 Y103.469 I-76.76 J-265.576 E.08423
G1 X159.374 Y102.182 E.08415
G1 X160.933 Y100.383 E.08414
G1 X161.921 Y98.217 E.08415
G1 X162.139 Y96.718 E.05354
G1 X165.502 Y96.718 E.11887
G1 X165.502 Y99.723 E.10619
G1 X164.143 Y99.918 E.04853
G1 X162.107 Y100.849 E.07912
G1 X160.414 Y102.314 E.07913
G1 X159.205 Y104.197 E.07911
G1 X158.574 Y106.346 E.07914
G1 X158.574 Y108.584 E.07913
G1 X159.205 Y110.733 E.07914
G1 X160.414 Y112.616 E.0791
G1 X162.106 Y114.083 E.07917
G1 X164.143 Y115.014 E.07915
G1 X165.502 Y115.208 E.04851
G1 X165.502 Y116.917 E.06039
G1 X164.285 Y117.092 E.04346
G1 X162.377 Y117.962 E.07412
G1 X160.792 Y119.334 E.07408
G1 X159.659 Y121.1 E.07416
G1 X159.07 Y123.11 E.07404
G1 X159.07 Y125.206 E.07408
G1 X159.659 Y127.218 E.07412
G1 X160.792 Y128.982 E.0741
G1 X162.377 Y130.356 E.07411
G1 X164.285 Y131.226 E.07413
G1 X165.502 Y131.401 E.04346
G1 X165.502 Y132.747 E.04757
G1 X164.239 Y132.948 E.0452
G1 X162.323 Y133.923 E.07598
G1 X160.803 Y135.443 E.07598
G1 X159.827 Y137.357 E.07592
G1 X159.491 Y139.479 E.07595
G1 X159.827 Y141.601 E.07594
G1 X160.803 Y143.517 E.076
G1 X162.323 Y145.035 E.07594
G1 X164.239 Y146.01 E.07597
G1 X165.502 Y146.211 E.0452
G1 X165.502 Y149.004 E.09873
G1 X159.456 Y149.004 E.21367
G1 X159.28 Y147.893 E.03976
G1 X158.377 Y146.117 E.07043
G1 X156.967 Y144.709 E.07043
G1 X155.193 Y143.804 E.07038
G1 X153.225 Y143.491 E.07045
G1 X151.265 Y143.803 E.07014
G1 X151.267 Y144.312 F30000
; FEATURE: Outer wall
G1 F3000
G1 X149.755 Y145.083 E.06001
G1 X148.447 Y146.389 E.0653
G1 X147.607 Y148.036 E.06535
G1 X147.383 Y149.461 E.05099
G1 X145.535 Y149.461 E.06533
G1 X145.334 Y148.19 E.04548
G1 X144.566 Y146.683 E.05978
G1 X143.371 Y145.487 E.05977
G1 X141.864 Y144.72 E.05978
G1 X140.193 Y144.456 E.0598
G1 X138.524 Y144.72 E.05972
G1 X137.017 Y145.487 E.05978
G1 X135.821 Y146.683 E.05977
G1 X135.053 Y148.19 E.05978
G1 X134.853 Y149.461 E.04548
G1 X132.964 Y149.461 E.06675
G1 X132.788 Y148.344 E.03998
G1 X132.09 Y146.977 E.05424
G1 X131.005 Y145.891 E.05426
G1 X129.638 Y145.196 E.05421
G1 X128.123 Y144.956 E.05422
G1 X126.608 Y145.196 E.05421
G1 X125.239 Y145.891 E.05428
G1 X124.155 Y146.977 E.05422
G1 X123.458 Y148.344 E.05424
G1 X123.281 Y149.461 E.03998
G1 X121.492 Y149.461 E.06322
G1 X121.34 Y148.5 E.03439
G1 X120.714 Y147.271 E.04874
G1 X119.741 Y146.297 E.04867
G1 X118.512 Y145.672 E.04873
G1 X117.151 Y145.454 E.04873
G1 X115.789 Y145.672 E.04874
G1 X114.563 Y146.297 E.04865
G1 X113.587 Y147.271 E.04872
G1 X112.961 Y148.5 E.04876
G1 X112.811 Y149.461 E.03438
G1 X110.835 Y149.461 E.06984
G1 X110.708 Y148.654 E.02888
G1 X110.154 Y147.569 E.04307
G2 X109.326 Y146.732 I-22.163 J21.093 E.0416
G1 X109.18 Y146.635 E.00621
G2 X108.187 Y146.144 I-4.597 J8.041 E.03917
G1 X106.993 Y145.956 E.04275
G1 X105.788 Y146.146 E.0431
G1 X104.699 Y146.699 E.04319
G1 X103.835 Y147.565 E.04322
G1 X103.28 Y148.654 E.04319
G1 X103.151 Y149.461 E.0289
G1 X101.359 Y149.461 E.06336
G1 X101.256 Y148.808 E.02336
G1 X100.772 Y147.859 E.03765
G1 X100.019 Y147.106 E.03766
G1 X99.07 Y146.622 E.03764
G1 X98.017 Y146.454 E.0377
G1 X96.965 Y146.622 E.03764
G1 X96.017 Y147.105 E.03763
G1 X95.263 Y147.859 E.03767
G1 X94.78 Y148.808 E.03764
G1 X94.675 Y149.461 E.02338
G1 X93.023 Y149.461 E.05842
G1 X92.944 Y148.962 E.01787
G1 X92.53 Y148.153 E.03212
G1 X91.887 Y147.509 E.03216
G1 X91.078 Y147.098 E.03208
G1 X90.181 Y146.956 E.03209
G1 X89.282 Y147.098 E.03217
G1 X88.473 Y147.509 E.03208
G1 X87.829 Y148.153 E.03218
G1 X87.417 Y148.962 E.03208
G1 X87.339 Y149.461 E.01785
G1 X81.761 Y149.461 E.19716
G1 X81.761 Y145.391 E.14384
G1 X83.849 Y145.138 E.07436
G1 X86.194 Y144.248 E.08866
G1 X88.258 Y142.823 E.08865
G1 X89.922 Y140.946 E.08864
G2 X91.087 Y138.726 I-781.416 J-411.59 E.08864
G1 X91.687 Y136.292 E.08861
G1 X91.687 Y133.783 E.08868
G1 X91.087 Y131.348 E.08861
G1 X89.922 Y129.128 E.08862
G1 X88.258 Y127.251 E.08866
G1 X86.194 Y125.826 E.08865
G1 X83.849 Y124.936 E.08866
G1 X81.761 Y124.683 E.07436
G1 X81.761 Y122.457 E.07865
G1 X83.729 Y122.218 E.07009
G1 X85.962 Y121.37 E.08443
G1 X87.926 Y120.015 E.08433
G1 X89.51 Y118.228 E.08441
G1 X90.619 Y116.114 E.08439
G1 X91.191 Y113.796 E.08439
G1 X91.191 Y111.409 E.08437
G1 X90.619 Y109.09 E.08439
G1 X89.51 Y106.976 E.08439
G1 X87.926 Y105.189 E.0844
G1 X85.962 Y103.832 E.08438
G1 X83.729 Y102.986 E.08441
G1 X81.761 Y102.747 E.07009
G1 X81.761 Y96.261 E.22924
G1 X85.282 Y96.261 E.12446
G1 X85.549 Y98.293 E.07246
G1 X86.489 Y100.563 E.08683
G1 X87.984 Y102.508 E.08671
G1 X89.931 Y104.002 E.08676
G2 X92.198 Y104.943 I501.852 J-1206.878 E.08676
G1 X94.633 Y105.263 E.08679
G1 X97.065 Y104.943 E.08671
G1 X99.334 Y104.002 E.08683
G1 X101.282 Y102.508 E.08676
G1 X102.776 Y100.563 E.08672
G1 X103.714 Y98.293 E.08679
G1 X103.983 Y96.261 E.07246
G1 X106.904 Y96.261 E.10324
G1 X107.155 Y98.163 E.06782
G1 X108.043 Y100.313 E.0822
G1 X109.46 Y102.156 E.08217
G1 X111.303 Y103.57 E.08212
G1 X113.45 Y104.459 E.08214
G1 X115.755 Y104.763 E.08215
M73 P27 R19
G1 X118.059 Y104.459 E.08215
G1 X120.206 Y103.571 E.08213
G1 X122.05 Y102.156 E.08212
G1 X123.466 Y100.313 E.08217
G1 X124.354 Y98.163 E.08221
G1 X124.605 Y96.261 E.06782
G1 X127.158 Y96.261 E.09022
G1 X127.391 Y98.036 E.06326
G1 X128.231 Y100.061 E.0775
G1 X129.567 Y101.802 E.07758
G1 X131.307 Y103.139 E.07753
G1 X133.334 Y103.977 E.07754
G1 X135.509 Y104.265 E.07752
G1 X137.685 Y103.977 E.0776
G1 X139.712 Y103.139 E.07754
G1 X141.452 Y101.802 E.07754
G1 X142.788 Y100.061 E.07758
G1 X143.626 Y98.035 E.07748
G1 X143.86 Y96.261 E.06325
G1 X146.05 Y96.261 E.07742
G1 X146.311 Y98.087 E.06519
G1 X147.247 Y100.134 E.07955
G1 X148.72 Y101.833 E.07948
G1 X150.613 Y103.049 E.07952
G1 X152.771 Y103.683 E.07952
G1 X155.019 Y103.683 E.07947
G2 X157.179 Y103.049 I-72.635 J-251.195 E.07955
G1 X159.071 Y101.833 E.07952
G1 X160.545 Y100.134 E.07949
G1 X161.478 Y98.087 E.07951
G1 X161.743 Y96.261 E.06521
G1 X165.959 Y96.261 E.14901
G1 X165.959 Y100.119 E.13635
G1 X164.273 Y100.361 E.06021
G1 X162.356 Y101.237 E.07448
G1 X160.763 Y102.616 E.07448
G1 X159.625 Y104.389 E.07446
G1 X159.031 Y106.411 E.0745
G1 X159.031 Y108.519 E.07448
G1 X159.625 Y110.541 E.0745
G1 X160.763 Y112.314 E.07446
G1 X162.356 Y113.695 E.07453
G1 X164.273 Y114.571 E.07449
G1 X165.959 Y114.812 E.06019
G1 X165.959 Y117.313 E.08839
G1 X164.415 Y117.535 E.05513
G1 X162.626 Y118.351 E.06948
G1 X161.141 Y119.636 E.06942
G1 X160.079 Y121.291 E.06951
G1 X159.527 Y123.176 E.0694
G1 X159.527 Y125.14 E.06945
G1 X160.079 Y127.027 E.06948
G1 X161.141 Y128.68 E.06945
G1 X162.626 Y129.967 E.06946
G1 X164.415 Y130.783 E.06948
G1 X165.959 Y131.005 E.05513
G1 X165.959 Y133.138 E.07536
G1 X164.382 Y133.388 E.05644
G1 X162.595 Y134.297 E.07087
G1 X161.177 Y135.715 E.07086
G1 X160.268 Y137.5 E.07081
G1 X159.954 Y139.479 E.07083
G1 X160.268 Y141.458 E.07083
G1 X161.177 Y143.245 E.07087
G1 X162.595 Y144.661 E.07082
G1 X164.382 Y145.57 E.07086
G1 X165.959 Y145.821 E.05644
G1 X165.959 Y149.461 E.12868
G1 X159.066 Y149.461 E.24362
G1 X158.84 Y148.036 E.051
G1 X158.002 Y146.389 E.06531
G1 X156.695 Y145.083 E.06531
G1 X155.05 Y144.244 E.06527
G1 X153.225 Y143.954 E.06532
G1 X151.4 Y144.244 E.06532
G1 X151.32 Y144.284 E.00314
; WIPE_START
G1 F24000
G1 X149.755 Y145.083 E-.668
G1 X149.583 Y145.255 E-.092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.776 J.938 P1  F30000
G1 X165.319 Y132.236 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.501497
G1 F6300
G1 X164.771 Y131.688 E.02747
G1 X164.174 Y131.602 E.02138
G1 X163.921 Y131.487 E.00988
G1 X165.065 Y132.631 E.0574
; WIPE_START
G1 F24000
G1 X163.921 Y131.487 E-.61512
G1 X164.174 Y131.602 E-.10584
G1 X164.276 Y131.617 E-.03904
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.214 J.081 P1  F30000
G1 X165.319 Y116.023 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X164.795 Y115.5 E.02625
G1 X164.039 Y115.392 E.02711
G1 X165.113 Y116.466 E.05388
G1 X165.113 Y116.58 E.00405
G1 X164.646 Y116.648 E.01673
G1 X162.432 Y114.433 E.11107
; WIPE_START
G1 F24000
G1 X163.846 Y115.847 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.143 J-.417 P1  F30000
G1 X159.375 Y103.594 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X158.796 Y103.015 E.02906
G1 X158.401 Y103.268 E.01664
G1 X158.973 Y103.84 E.02868
G2 X158.773 Y104.289 I.667 J.565 E.01766
G1 X158.006 Y103.522 E.03847
G1 X157.611 Y103.776 E.01664
G1 X158.626 Y104.79 E.05089
G1 X158.479 Y105.292 E.01853
G1 X157.131 Y103.944 E.06759
G1 X156.629 Y104.091 E.01853
G1 X158.331 Y105.793 E.08534
G1 X158.185 Y106.295 E.01856
G1 X156.128 Y104.238 E.10316
G1 X155.627 Y104.386 E.01853
G1 X158.185 Y106.944 E.1283
G1 X158.185 Y107.592 E.023
G1 X155.121 Y104.529 E.15365
G1 X154.473 Y104.529 E.023
G1 X158.185 Y108.241 E.18617
G1 X158.185 Y108.64 E.01416
G1 X158.289 Y108.993 E.01304
G1 X153.824 Y104.529 E.2239
G1 X153.176 Y104.529 E.023
G1 X158.559 Y109.912 E.26996
G1 X158.829 Y110.83 E.03395
G1 X152.476 Y104.478 E.31858
G1 X151.558 Y104.208 E.03395
G1 X164.1 Y116.75 E.62898
G1 X163.654 Y116.953 E.01736
G1 X150.327 Y103.626 E.66835
; WIPE_START
G1 F24000
G1 X151.742 Y105.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.932 J-.783 P1  F30000
G1 X144.9 Y96.901 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X145.352 Y97.353 E.02268
G1 X145.46 Y98.11 E.02711
G1 X144.585 Y97.234 E.04391
G1 X144.509 Y97.808 E.0205
G1 X146.297 Y99.596 E.08967
; WIPE_START
G1 F24000
G1 X144.883 Y98.181 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.031 J-1.217 P1  F30000
G1 X144.251 Y98.197 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X146.427 Y100.374 E.10914
G1 X146.528 Y100.596 E.00866
G1 X148.161 Y102.478 E.08836
G1 X149.197 Y103.144 E.04368
G1 X163.209 Y117.156 E.7027
G1 X162.764 Y117.359 E.01736
G1 X144.219 Y98.815 E.93001
G1 X144.029 Y99.273 E.0176
G1 X162.318 Y117.562 E.9172
G1 X162.165 Y117.632 E.00597
G1 X161.937 Y117.829 E.01069
G1 X143.839 Y99.732 E.9076
G1 X143.65 Y100.191 E.0176
G1 X161.589 Y118.13 E.89968
G1 X161.242 Y118.431 E.0163
G1 X143.427 Y100.617 E.8934
G1 X143.146 Y100.984 E.0164
G1 X160.894 Y118.732 E.89008
G1 X160.546 Y119.033 E.0163
G1 X142.864 Y101.351 E.88677
G1 X142.583 Y101.718 E.0164
G1 X160.279 Y119.414 E.88748
G1 X160.026 Y119.809 E.01664
G1 X142.301 Y102.085 E.88889
G1 X142.055 Y102.405 E.01432
G1 X142.009 Y102.441 E.00208
G1 X159.772 Y120.204 E.89084
G1 X159.519 Y120.599 E.01664
G1 X141.642 Y102.723 E.89652
G1 X141.275 Y103.004 E.0164
G1 X159.28 Y121.01 E.90297
G1 X159.133 Y121.511 E.01853
G1 X140.908 Y103.286 E.914
G1 X140.542 Y103.568 E.0164
G1 X158.986 Y122.013 E.92502
G1 X158.839 Y122.514 E.01853
G1 X140.175 Y103.85 E.93604
G1 X139.725 Y104.048 E.01744
G1 X158.692 Y123.016 E.95123
G1 X158.681 Y123.653 E.0226
G1 X139.266 Y104.238 E.97367
G1 X138.807 Y104.428 E.01761
G1 X158.681 Y124.302 E.99668
G1 X158.681 Y124.95 E.023
G1 X138.349 Y104.617 E1.01969
G1 X137.886 Y104.803 E.01768
G1 X158.821 Y125.738 E1.0499
G1 X159.089 Y126.655 E.03388
G1 X137.313 Y104.879 E1.09209
G1 X136.74 Y104.955 E.02049
G1 X159.544 Y127.759 E1.14364
G1 X160.496 Y129.239 E.06239
G1 X162.164 Y130.686 E.07832
G1 X162.729 Y130.943 E.02199
G1 X164.326 Y132.541 E.08011
G1 X164.117 Y132.574 E.0075
G1 X163.848 Y132.711 E.01072
M73 P28 R19
G1 X136.167 Y105.03 E1.38819
G1 X135.595 Y105.106 E.02049
G1 X163.418 Y132.93 E1.39536
G1 X162.988 Y133.148 E.0171
G1 X134.873 Y105.033 E1.40997
G1 X134.126 Y104.934 E.02674
G1 X162.558 Y133.367 E1.42591
G1 X162.129 Y133.586 E.0171
G1 X133.378 Y104.836 E1.44184
G1 X133.114 Y104.8 E.00947
G1 X132.4 Y104.505 E.0274
G1 X161.795 Y133.901 E1.47421
G1 X161.471 Y134.225 E.01626
G1 X130.808 Y103.562 E1.53779
; WIPE_START
G1 F24000
G1 X132.222 Y104.976 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.978 J-.724 P1  F30000
G1 X126.673 Y97.481 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X126.298 Y97.107 E.0188
G1 X125.649 Y97.107 E.023
G1 X126.532 Y97.989 E.04426
G1 X126.567 Y98.256 E.00956
G1 X126.863 Y98.968 E.02732
G1 X125.306 Y97.412 E.07804
G1 X125.231 Y97.985 E.02049
G1 X127.814 Y100.569 E.12956
; WIPE_START
G1 F24000
G1 X126.4 Y99.154 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.585 J-1.067 P1  F30000
G1 X124.963 Y98.366 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X161.147 Y134.549 E1.81462
G1 X160.823 Y134.874 E.01626
G1 X124.931 Y98.982 E1.79997
G1 X124.741 Y99.441 E.01761
G1 X160.498 Y135.198 E1.79322
G1 X160.275 Y135.623 E.01703
M73 P28 R18
G1 X124.552 Y99.9 E1.79153
G1 X124.362 Y100.359 E.01761
G1 X160.056 Y136.053 E1.79006
G1 X159.837 Y136.482 E.0171
G1 X124.157 Y100.802 E1.78939
G1 X123.875 Y101.169 E.0164
G1 X159.618 Y136.912 E1.79254
G1 X159.453 Y137.235 E.01287
G1 X159.431 Y137.374 E.00498
G1 X123.593 Y101.536 E1.7973
G1 X123.311 Y101.902 E.0164
G1 X159.343 Y137.934 E1.80698
G1 X159.254 Y138.493 E.0201
G1 X123.03 Y102.269 E1.81666
G1 X122.748 Y102.636 E.0164
G1 X159.165 Y139.053 E1.82634
G1 X159.098 Y139.479 E.01529
G1 X159.127 Y139.663 E.00662
G1 X122.41 Y102.946 E1.84138
G1 X122.043 Y103.228 E.0164
G1 X159.249 Y140.434 E1.86591
G1 X159.371 Y141.205 E.02767
G1 X121.676 Y103.509 E1.89045
G1 X121.309 Y103.791 E.0164
G1 X160.144 Y142.626 E1.94761
; WIPE_START
G1 F24000
G1 X158.73 Y141.212 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.815 J.904 P1  F30000
G1 X165.319 Y147.152 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X164.633 Y146.466 E.03441
G1 X164.117 Y146.384 E.01851
G1 X163.68 Y146.162 E.0174
G1 X165.113 Y147.595 E.07189
G1 X165.113 Y148.244 E.023
G1 X120.942 Y104.072 E2.21522
G1 X120.633 Y104.309 E.01381
M73 P29 R18
G1 X120.56 Y104.339 E.00278
G1 X164.836 Y148.615 E2.22047
G1 X164.188 Y148.615 E.023
G1 X120.101 Y104.529 E2.21095
G1 X119.643 Y104.719 E.01761
G1 X163.539 Y148.615 E2.20144
G1 X162.891 Y148.615 E.023
G1 X119.184 Y104.909 E2.19192
G1 X118.725 Y105.098 E.01761
G1 X162.242 Y148.615 E2.1824
G1 X161.594 Y148.615 E.023
G1 X118.263 Y105.285 E2.17305
G1 X117.69 Y105.36 E.0205
G1 X156.223 Y143.893 E1.93245
G1 X157.198 Y144.391 E.03881
G1 X158.695 Y145.886 E.07503
G1 X159.191 Y146.862 E.03882
G1 X160.945 Y148.615 E.08796
G1 X160.297 Y148.615 E.023
G1 X159.393 Y147.712 E.04533
; WIPE_START
G1 F24000
G1 X160.297 Y148.615 E-.48576
G1 X160.945 Y148.615 E-.24644
G1 X160.893 Y148.564 E-.0278
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.805 J-.912 P1  F30000
G1 X155.37 Y143.689 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X117.117 Y105.436 E1.91841
G1 X116.544 Y105.511 E.0205
G1 X154.302 Y143.269 E1.89355
G1 X153.531 Y143.146 E.02768
G1 X115.971 Y105.587 E1.88363
G1 X115.755 Y105.615 E.00774
G1 X115.29 Y105.554 E.01663
G1 X152.887 Y143.151 E1.88552
G1 X152.327 Y143.24 E.02009
G1 X114.543 Y105.456 E1.89492
G1 X113.796 Y105.357 E.02672
G1 X151.768 Y143.329 E1.90431
G1 X151.208 Y143.418 E.02009
G1 X112.962 Y105.172 E1.91807
G1 X111.856 Y104.714 E.04245
G1 X150.915 Y143.773 E1.95882
; WIPE_START
G1 F24000
G1 X149.5 Y142.359 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.873 J-.848 P1  F30000
G1 X106.496 Y98.057 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X105.545 Y97.107 E.04766
G1 X104.897 Y97.107 E.023
G1 X106.442 Y98.652 E.0775
G1 X106.899 Y99.757 E.04241
G1 X104.669 Y97.527 E.11184
G1 X104.593 Y98.1 E.02049
M73 P30 R18
G1 X107.544 Y101.051 E.14802
G1 X108.857 Y102.76 E.07639
G1 X110.557 Y104.064 E.07597
G1 X150.332 Y143.839 E1.99477
G1 X149.903 Y144.058 E.01709
G1 X104.486 Y98.641 E2.27769
G1 X104.296 Y99.1 E.01761
G1 X149.474 Y144.278 E2.26567
G2 X149.095 Y144.547 I.228 J.721 E.01676
G1 X104.106 Y99.559 E2.2562
G1 X103.917 Y100.018 E.01761
G1 X148.77 Y144.871 E2.24943
G1 X148.446 Y145.195 E.01626
G1 X103.727 Y100.476 E2.24267
G1 X103.537 Y100.935 E.01761
G1 X148.121 Y145.519 E2.23591
G1 X147.797 Y145.843 E.01626
G1 X103.266 Y101.313 E2.23323
G1 X102.984 Y101.68 E.0164
G1 X147.564 Y146.259 E2.23569
G1 X147.345 Y146.689 E.0171
G1 X102.703 Y102.047 E2.23883
G1 X102.421 Y102.413 E.0164
G1 X147.126 Y147.118 E2.24198
G1 X146.907 Y147.548 E.0171
G1 X102.139 Y102.78 E2.24512
G1 X101.849 Y103.139 E.01635
G1 X143.123 Y144.412 E2.06988
G1 X143.874 Y144.795 E.02989
G1 X145.259 Y146.18 E.06947
G1 X145.642 Y146.931 E.02989
G1 X146.751 Y148.04 E.05563
G1 X146.663 Y148.6 E.02011
G1 X145.844 Y147.782 E.04104
; WIPE_START
G1 F24000
G1 X146.663 Y148.6 E-.43973
G1 X146.751 Y148.04 E-.21551
G1 X146.556 Y147.845 E-.10476
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.787 J-.928 P1  F30000
G1 X142.272 Y144.209 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X101.482 Y103.42 E2.04559
G1 X101.115 Y103.702 E.0164
G1 X141.168 Y143.754 E2.00863
G1 X140.397 Y143.632 E.02765
G1 X100.748 Y103.983 E1.98841
G1 X100.382 Y104.265 E.0164
G1 X139.782 Y143.665 E1.97593
G1 X139.222 Y143.754 E.02011
G1 X100.015 Y104.546 E1.96625
G1 X99.761 Y104.741 E.01134
G1 X99.619 Y104.8 E.00544
G1 X138.662 Y143.842 E1.95798
G1 X138.259 Y143.906 E.01444
G1 X138.138 Y143.967 E.00482
G1 X99.161 Y104.99 E1.95474
G1 X98.702 Y105.18 E.0176
G1 X137.709 Y144.186 E1.95618
G1 X137.279 Y144.405 E.0171
G1 X98.244 Y105.37 E1.95763
G1 X97.785 Y105.56 E.0176
G1 X136.849 Y144.624 E1.95908
G1 X136.514 Y144.795 E.01336
G1 X136.443 Y144.866 E.00356
G1 X97.327 Y105.75 E1.96168
M73 P31 R18
G1 X96.764 Y105.835 E.02019
G1 X136.118 Y145.19 E1.97365
G1 X135.794 Y145.514 E.01626
G1 X96.19 Y105.911 E1.98614
G1 X95.617 Y105.986 E.0205
G1 X135.47 Y145.838 E1.99862
G1 X135.146 Y146.163 E.01626
G1 X95.044 Y106.061 E2.0111
G1 X94.633 Y106.115 E.01471
G1 X94.422 Y106.088 E.00754
G1 X134.921 Y146.587 E2.03105
G1 X134.702 Y147.017 E.0171
G1 X93.675 Y105.99 E2.05752
G1 X92.929 Y105.891 E.0267
G1 X134.483 Y147.446 E2.08398
G1 X134.265 Y147.876 E.0171
G1 X92.182 Y105.793 E2.11045
G3 X91.752 Y105.673 I.009 J-.864 E.01602
G1 X91.173 Y105.433 E.02221
G1 X130.349 Y144.609 E1.96469
G1 X131.508 Y145.199 E.04609
G1 X132.783 Y146.474 E.06394
G1 X133.376 Y147.636 E.04627
G1 X134.161 Y148.421 E.03938
G1 X134.13 Y148.615 E.00699
G1 X133.707 Y148.615 E.01501
G1 X133.436 Y148.344 E.01361
; WIPE_START
G1 F24000
G1 X133.707 Y148.615 E-.14582
G1 X134.13 Y148.615 E-.16081
G1 X134.161 Y148.421 E-.07487
G1 X133.457 Y147.717 E-.3785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.777 J-.936 P1  F30000
G1 X129.64 Y144.548 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X89.685 Y104.593 E2.00378
; WIPE_START
G1 F24000
G1 X91.099 Y106.007 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.968 J-.738 P1  F30000
G1 X84.839 Y97.802 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X84.144 Y97.107 E.03486
G1 X83.495 Y97.107 E.023
G1 X84.698 Y98.31 E.06033
G1 X84.725 Y98.514 E.00732
G1 X85.058 Y99.318 E.03086
G1 X82.847 Y97.107 E.11091
G1 X82.606 Y97.107 E.00853
G1 X82.606 Y97.515 E.01447
G1 X85.897 Y100.806 E.16505
; WIPE_START
M73 P32 R18
G1 F24000
G1 X84.483 Y99.391 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.69 J-1.002 P1  F30000
G1 X82.401 Y97.957 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X128.622 Y144.179 E2.31803
G1 X128.123 Y144.1 E.01793
G1 X127.926 Y144.131 E.00707
G1 X82.606 Y98.812 E2.27279
G1 X82.606 Y99.46 E.023
G1 X86.142 Y102.996 E.17734
G1 X85.098 Y102.6 E.03961
G1 X82.606 Y100.109 E.12496
G1 X82.606 Y100.757 E.023
G1 X84.054 Y102.204 E.07258
G1 X83.933 Y102.159 E.00457
G1 X83.28 Y102.079 E.02333
G1 X82.401 Y101.2 E.0441
; WIPE_START
G1 F24000
G1 X83.28 Y102.079 E-.47258
G1 X83.933 Y102.159 E-.24996
G1 X84.025 Y102.194 E-.03746
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.756 J.954 P1  F30000
G1 X90.355 Y107.209 Z.6
M73 P32 R17
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X127.366 Y144.22 E1.8561
G1 X126.806 Y144.308 E.0201
G1 X91.459 Y108.961 E1.77269
G1 X91.671 Y109.822 E.03143
G1 X126.269 Y144.42 E1.73511
G1 X125.839 Y144.638 E.01711
G1 X91.883 Y110.682 E1.70291
G1 X92.036 Y111.306 E.02278
G1 X92.036 Y111.484 E.00633
G1 X125.409 Y144.857 E1.67363
G1 X124.979 Y145.075 E.01711
G1 X92.036 Y112.133 E1.65206
G1 X92.036 Y112.781 E.023
G1 X124.595 Y145.34 E1.63281
G1 X124.271 Y145.664 E.01626
G1 X92.036 Y113.43 E1.61657
G1 X92.036 Y113.898 E.01661
G1 X92.001 Y114.043 E.00528
G1 X123.947 Y145.989 E1.60211
G1 X123.623 Y146.313 E.01626
G1 X91.872 Y114.563 E1.59229
G1 X91.744 Y115.083 E.019
G1 X123.352 Y146.691 E1.58513
G1 X123.133 Y147.12 E.0171
G1 X91.616 Y115.604 E1.58057
G1 X91.488 Y116.124 E.019
G1 X122.914 Y147.55 E1.57601
G1 X122.694 Y147.979 E.0171
G1 X91.318 Y116.603 E1.57354
G1 X91.095 Y117.028 E.01703
G1 X119.078 Y145.011 E1.40337
G1 X120.244 Y145.605 E.04639
G1 X121.407 Y146.768 E.05834
G1 X122.001 Y147.934 E.04639
G1 X122.755 Y148.689 E.03785
; WIPE_START
G1 F24000
G1 X122.001 Y147.934 E-.40559
G1 X121.577 Y147.103 E-.35441
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.673 J-1.014 P1  F30000
G1 X118.429 Y145.011 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X90.872 Y117.453 E1.38201
G1 X90.648 Y117.879 E.01703
G1 X117.409 Y144.639 E1.34203
G1 X117.151 Y144.598 E.00926
G1 X116.778 Y144.657 E.01337
G1 X90.425 Y118.304 E1.32162
G1 X90.199 Y118.726 E.01698
G1 X116.219 Y144.747 E1.30495
G1 X115.66 Y144.836 E.02008
G1 X89.894 Y119.07 E1.2922
G1 X89.589 Y119.414 E.01629
G1 X115.199 Y145.024 E1.28436
G1 X114.77 Y145.243 E.0171
G1 X89.284 Y119.757 E1.2781
G1 X88.979 Y120.101 E.01629
G1 X114.34 Y145.462 E1.27185
G1 X114.06 Y145.605 E.01116
G1 X113.947 Y145.717 E.00565
G1 X88.675 Y120.445 E1.26742
G3 X88.339 Y120.757 I-.803 J-.526 E.01643
G1 X113.623 Y146.041 E1.268
G1 X113.298 Y146.365 E.01626
M73 P33 R17
G1 X87.955 Y121.022 E1.27096
G1 X87.571 Y121.287 E.01653
G1 X112.973 Y146.689 E1.27392
G1 X112.895 Y146.767 E.00394
G1 X112.729 Y147.093 E.01296
G1 X87.187 Y121.552 E1.28091
G1 X86.804 Y121.816 E.01653
G1 X112.51 Y147.523 E1.28919
G1 X112.291 Y147.953 E.0171
G1 X86.42 Y122.081 E1.29746
G1 X86.358 Y122.124 E.00267
G1 X85.964 Y122.274 E.01495
G1 X112.117 Y148.427 E1.31159
G1 X112.087 Y148.615 E.00678
G1 X111.657 Y148.615 E.01525
G1 X111.146 Y148.104 E.02566
; WIPE_START
G1 F24000
G1 X111.657 Y148.615 E-.27493
G1 X112.087 Y148.615 E-.16346
G1 X112.117 Y148.427 E-.0726
G1 X111.654 Y147.963 E-.24901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.747 J-.96 P1  F30000
G1 X108.731 Y145.689 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X85.494 Y122.452 E1.16533
G1 X85.024 Y122.631 E.01783
G1 X107.587 Y145.194 E1.13153
G1 X106.993 Y145.1 E.02133
G1 X106.865 Y145.12 E.00458
G1 X90.882 Y129.137 E.80154
G1 X90.623 Y128.644 E.01976
G1 X88.823 Y126.614 E.09623
G1 X87.323 Y125.578 E.06462
G1 X84.554 Y122.809 E.13886
G1 X84.084 Y122.988 E.01783
G1 X85.91 Y124.814 E.09158
G1 X84.865 Y124.417 E.03966
G1 X83.541 Y123.093 E.0664
G1 X82.962 Y123.163 E.02066
G1 X83.888 Y124.089 E.04642
G1 X83.15 Y123.999 E.02636
G1 X82.401 Y123.25 E.03758
; WIPE_START
G1 F24000
G1 X83.15 Y123.999 E-.40266
G1 X83.888 Y124.089 E-.2825
G1 X83.749 Y123.949 E-.07484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.774 J.939 P1  F30000
G1 X91.11 Y130.013 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X106.305 Y145.208 E.76204
G1 X105.744 Y145.297 E.02011
G1 X92.011 Y131.564 E.68871
G1 X92.223 Y132.424 E.03142
G1 X105.263 Y145.464 E.65396
G1 X104.833 Y145.683 E.0171
G1 X92.435 Y133.284 E.62178
G1 X92.532 Y133.68 E.01445
G1 X92.532 Y134.03 E.01242
G1 X104.403 Y145.901 E.59533
G2 X104.028 Y146.174 I.23 J.709 E.01674
G1 X92.532 Y134.679 E.57651
G1 X92.532 Y135.327 E.023
G1 X103.704 Y146.499 E.56027
G1 X103.38 Y146.824 E.01626
G1 X92.532 Y135.976 E.54403
G1 X92.532 Y136.394 E.01483
G1 X92.487 Y136.579 E.00675
G1 X103.084 Y147.176 E.53146
G1 X102.865 Y147.606 E.0171
G1 X92.359 Y137.099 E.5269
M73 P34 R17
G1 X92.231 Y137.62 E.01901
G1 X102.646 Y148.035 E.52234
G1 X102.466 Y148.389 E.01408
G1 X102.45 Y148.487 E.00355
G1 X92.103 Y138.14 E.51892
G1 X91.974 Y138.661 E.01901
G1 X99.081 Y145.768 E.35642
G1 X98.31 Y145.644 E.02771
G1 X91.818 Y139.153 E.32555
G1 X91.595 Y139.578 E.01703
G1 X97.67 Y145.653 E.30466
G1 X97.111 Y145.742 E.02008
G1 X91.372 Y140.004 E.28781
G1 X91.149 Y140.429 E.01703
G1 X96.586 Y145.866 E.27269
G1 X96.156 Y146.085 E.0171
G1 X90.925 Y140.854 E.26234
G1 X90.702 Y141.279 E.01703
G1 X95.727 Y146.304 E.25199
G2 X95.35 Y146.576 I.23 J.716 E.01675
G1 X90.426 Y141.652 E.24694
G1 X90.121 Y141.996 E.01629
G1 X95.026 Y146.9 E.24596
G1 X94.702 Y147.225 E.01626
G1 X89.817 Y142.34 E.24499
G1 X89.512 Y142.683 E.01629
G1 X94.44 Y147.612 E.24716
G1 X94.221 Y148.041 E.0171
G1 X89.207 Y143.027 E.25147
G1 X88.902 Y143.371 E.01629
G1 X94.16 Y148.629 E.26369
; WIPE_START
G1 F24000
G1 X92.746 Y147.214 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.542 J-1.089 P1  F30000
G1 X91.455 Y146.572 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X88.539 Y143.656 E.14622
G1 X88.155 Y143.921 E.01653
G1 X90.363 Y146.129 E.11073
G1 X90.181 Y146.1 E.00655
G1 X89.753 Y146.167 E.01535
G1 X87.772 Y144.186 E.09938
G1 X87.388 Y144.451 E.01653
G1 X89.193 Y146.256 E.09052
G1 X89.018 Y146.283 E.00629
G1 X88.723 Y146.434 E.01175
G1 X87.005 Y144.716 E.08616
G1 X86.621 Y144.981 E.01653
G1 X88.293 Y146.652 E.08384
G1 X87.97 Y146.816 E.01285
G1 X87.889 Y146.897 E.00405
G1 X86.158 Y145.166 E.08682
G1 X85.688 Y145.345 E.01783
G1 X87.565 Y147.221 E.09413
G1 X87.241 Y147.546 E.01626
G1 X85.218 Y145.523 E.10144
G1 X84.748 Y145.702 E.01783
G1 X86.988 Y147.942 E.11234
G1 X86.769 Y148.371 E.0171
G1 X84.278 Y145.88 E.12495
G3 X83.751 Y146.002 I-.51 J-1.004 E.01936
G1 X86.365 Y148.615 E.13107
G1 X85.716 Y148.615 E.023
G1 X83.173 Y146.072 E.12755
G1 X82.606 Y146.141 E.02024
G1 X82.606 Y146.154 E.00047
G1 X85.068 Y148.615 E.12344
G1 X84.419 Y148.615 E.023
G1 X82.606 Y146.803 E.09092
G1 X82.606 Y147.451 E.023
G1 X83.771 Y148.615 E.05839
G1 X83.122 Y148.615 E.023
G1 X82.401 Y147.894 E.03618
; WIPE_START
G1 F24000
G1 X83.122 Y148.615 E-.38773
G1 X83.771 Y148.615 E-.24644
G1 X83.536 Y148.381 E-.12583
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.627 J1.043 P1  F30000
G1 X159.591 Y102.683 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.497418
G1 F3000
G1 X159.828 Y102.367 E.01389
; LINE_WIDTH: 0.458582
G1 X160.065 Y102.051 E.0127
; LINE_WIDTH: 0.499055
G3 X160.388 Y101.722 I2.454 J2.088 E.01628
; LINE_WIDTH: 0.551513
G1 X160.672 Y101.438 E.01581
; LINE_WIDTH: 0.597992
G1 X160.957 Y101.154 E.01725
; LINE_WIDTH: 0.644471
G1 X161.241 Y100.87 E.01869
; WIPE_START
G1 F24000
G1 X160.957 Y101.154 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.736 J.969 P1  F30000
G1 X165.319 Y97.839 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.506447
G1 F6300
G1 X164.587 Y97.107 E.0371
G1 X163.931 Y97.107 E.0235
G1 X165.113 Y98.288 E.05991
G1 X165.113 Y98.944 E.0235
G1 X163.276 Y97.107 E.09314
G1 X162.62 Y97.107 E.0235
G1 X164.927 Y99.413 E.11691
G1 X164.354 Y99.495 E.02075
G1 X162.41 Y97.552 E.09851
G1 X162.327 Y98.125 E.02074
G1 X163.835 Y99.632 E.0764
G1 X163.385 Y99.838 E.01773
G1 X162.165 Y98.618 E.0618
G1 X161.96 Y99.068 E.01774
G1 X162.935 Y100.043 E.04941
G1 X162.485 Y100.249 E.01773
G1 X161.755 Y99.519 E.03701
G1 X161.549 Y99.969 E.01774
G1 X162.035 Y100.454 E.02461
G1 X161.894 Y100.518 E.00553
G1 X161.653 Y100.728 E.01146
G1 X161.189 Y100.264 E.02352
M106 S255
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X161.653 Y100.728 E-.24939
G1 X161.894 Y100.518 E-.12152
G1 X162.035 Y100.454 E-.05862
G1 X161.549 Y99.969 E-.26092
G1 X161.625 Y99.802 E-.06954
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I-1.193 J.239 P1  F30000
G1 X189.5 Y239 Z.6
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X156.500 Y219.500  
;--------------------
; CP EMPTY GRID START
; layer #3
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
M73 P35 R17
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X191.371 
G1  Y240.871 
G1  X153.629  E1.4345
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834
G1  X191.828 
G1  Y241.328 
G1  X153.172  E1.4692
G1  Y217.172  E0.9181
G1  X191.828  E1.4692
G1  Y241.328  E0.9181
G1  X192.285 
G1  Y241.785 
G1  X152.715  E1.5039
G1  Y216.715  E0.9528
G1  X192.285  E1.5039
G1  Y241.785  E0.9528

; WIPE_START
G1 F24000
G1 X190.285 Y241.785 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.13 J-.451 P1  F30000
G1 X151.292 Y144.072 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05858
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.99 Y146.857 I494.001 J494.187 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04543
G1 X114.443 Y146.132 E.04534
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G2 X109.394 Y146.532 I-7.299 J6.438 E.04111
G2 X108.244 Y145.948 I-3.686 J5.839 E.04064
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-87.594 J170.557 E.03556
G1 X98.017 Y146.249 E.0356
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09891
G1 X85.352 Y98.346 E.05979
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07894
G2 X92.146 Y105.14 I473.033 J-1137.341 E.07895
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-722.804 J-1747.734 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I1314.985 J-1138.86 E.07262
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-72.359 J-250.398 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
M73 P36 R17
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-197.995 J385.879 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.346 Y144.048 E.05987
G1 X151.398 Y144.458 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.868 Y145.239 E.05011
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I456.8 J456.937 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G1 X114.676 Y146.453 E.03839
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
M73 P36 R16
G2 X109.17 Y146.854 I-7.53 J6.717 E.0341
G2 X108.134 Y146.328 I-3.393 J5.396 E.03395
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.011 Y146.805 I-77.921 J151.773 E.02931
G1 X98.017 Y146.646 E.02935
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.11309
G1 X85.486 Y96.355 E.00834
G1 X85.734 Y98.244 E.05556
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I453.296 J-1089.832 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-693.263 J-1676.251 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G1 X111.662 Y103.514 E.00832
G1 X113.5 Y104.274 E.05799
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I1250.983 J-1083.453 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-68.889 J-238.304 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-185.007 J360.512 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.459 Y144.427 E.05213
G1 X151.452 Y144.431 E.00024
M204 S10000
; WIPE_START
G1 F24000
G1 X149.868 Y145.239 E-.67578
G1 X149.711 Y145.396 E-.08422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.765 J-.947 P1  F30000
G1 X147.726 Y146.999 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420074
G1 F15000
G1 X145.966 Y148.759 E.0726
G1 X145.992 Y148.926 E.00493
G1 X146.332 Y148.926 E.00992
G1 X147.036 Y148.222 E.02904
G1 X146.936 Y148.855 E.0187
G1 X146.696 Y149.095 E.00992
; WIPE_START
G1 F24000
G1 X146.936 Y148.855 E-.12931
G1 X147.036 Y148.222 E-.24359
G1 X146.332 Y148.926 E-.37841
G1 X146.309 Y148.926 E-.0087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.539 J-1.091 P1  F30000
G1 X137.757 Y144.7 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X158.991 Y123.465 E.87584
G1 X158.991 Y123.999 E.01556
G1 X138.867 Y144.124 E.83007
G1 X139.5 Y144.024 E.01871
G1 X158.991 Y124.532 E.80394
G1 X158.991 Y125.066 E.01556
G1 X140.133 Y143.923 E.77781
G1 X140.193 Y143.914 E.00175
G1 X140.61 Y143.98 E.01233
G1 X159.078 Y125.513 E.76171
G1 X159.199 Y125.925 E.01254
G1 X141.071 Y144.053 E.74769
G1 X141.532 Y144.125 E.0136
G1 X159.319 Y126.338 E.73367
G1 X159.44 Y126.75 E.01254
G1 X141.992 Y144.198 E.71966
G1 X142.355 Y144.369 E.01169
G1 X159.561 Y127.163 E.70969
G1 X159.587 Y127.251 E.00269
G1 X159.751 Y127.506 E.00884
G1 X142.708 Y144.549 E.70294
G1 X143.061 Y144.729 E.01157
G1 X159.96 Y127.831 E.69697
G1 X160.168 Y128.156 E.01126
G1 X143.415 Y144.909 E.69101
G1 X143.689 Y145.049 E.00898
G1 X143.749 Y145.108 E.00246
G1 X160.377 Y128.48 E.68584
G1 X160.586 Y128.805 E.01126
G1 X144.016 Y145.375 E.68344
G1 X144.282 Y145.642 E.011
G1 X160.817 Y129.107 E.68199
G1 X161.103 Y129.355 E.01103
G1 X144.549 Y145.909 E.68277
G1 X144.816 Y146.175 E.011
G1 X161.388 Y129.602 E.68356
G1 X161.674 Y129.85 E.01103
G1 X145.057 Y146.467 E.68538
G1 X145.237 Y146.82 E.01157
G1 X161.96 Y130.098 E.68974
G1 X162.245 Y130.345 E.01103
G1 X145.417 Y147.174 E.6941
G1 X145.597 Y147.527 E.01157
G1 X162.587 Y130.537 E.70076
G1 X162.953 Y130.705 E.01174
G1 X145.777 Y147.881 E.70844
G1 X145.849 Y148.023 E.00465
G1 X145.893 Y148.298 E.00813
G1 X163.319 Y130.872 E.71877
G1 X163.686 Y131.039 E.01174
G1 X150.75 Y143.975 E.53356
G1 X151.232 Y143.728 E.0158
G1 X151.586 Y143.672 E.01043
G1 X164.052 Y131.206 E.5142
G2 X164.461 Y131.33 I.417 J-.636 E.01263
G1 X152.22 Y143.572 E.5049
G1 X152.854 Y143.471 E.01873
G1 X164.927 Y131.398 E.49798
G1 X165.393 Y131.465 E.01374
G1 X163.749 Y133.109 E.06783
G1 X164.214 Y132.872 E.01523
G1 X164.576 Y132.815 E.0107
G1 X165.423 Y131.968 E.03493
G1 X165.423 Y132.501 E.01556
G1 X165.006 Y132.919 E.01721
G1 X160.376 Y136.482 F30000
G1 F15000
G1 X153.416 Y143.442 E.28707
G1 X153.876 Y143.515 E.01359
G1 X159.694 Y137.697 E.23998
G1 X159.594 Y138.331 E.01872
G1 X154.336 Y143.589 E.21685
G1 X154.796 Y143.662 E.01359
G1 X159.493 Y138.965 E.19372
G1 X159.412 Y139.479 E.01518
G1 X159.425 Y139.566 E.00257
G1 X155.248 Y143.744 E.17232
G1 X155.601 Y143.924 E.01156
G1 X159.498 Y140.026 E.16077
G1 X159.571 Y140.487 E.01359
G1 X155.954 Y144.104 E.14921
G1 X156.307 Y144.285 E.01156
G1 X159.644 Y140.947 E.13766
G1 X159.717 Y141.408 E.01359
G1 X156.66 Y144.465 E.1261
G1 X157.013 Y144.645 E.01156
G1 X159.847 Y141.812 E.11687
G1 X160.027 Y142.165 E.01157
G1 X157.28 Y144.912 E.11328
G1 X157.547 Y145.178 E.011
G1 X160.207 Y142.519 E.10969
G1 X160.386 Y142.872 E.01157
G1 X157.814 Y145.444 E.1061
G1 X158.081 Y145.711 E.011
G1 X160.566 Y143.226 E.10251
G1 X160.75 Y143.575 E.01152
G1 X158.348 Y145.977 E.09908
G1 X158.441 Y146.07 E.00384
G1 X158.558 Y146.301 E.00753
G1 X161.017 Y143.842 E.10142
G1 X161.284 Y144.108 E.011
G1 X158.738 Y146.654 E.10501
G1 X158.918 Y147.008 E.01157
G1 X161.551 Y144.375 E.1086
G1 X161.818 Y144.641 E.011
G1 X159.097 Y147.361 E.11219
G1 X159.277 Y147.715 E.01157
G1 X162.084 Y144.908 E.11579
G1 X162.277 Y145.1 E.00792
G1 X162.376 Y145.15 E.00324
G1 X159.397 Y148.129 E.12287
G1 X159.47 Y148.589 E.01359
G1 X162.729 Y145.33 E.13443
G1 X163.083 Y145.51 E.01157
G1 X159.667 Y148.926 E.1409
G1 X160.2 Y148.926 E.01556
G1 X163.436 Y145.69 E.13347
G1 X163.789 Y145.87 E.01157
G1 X160.733 Y148.926 E.12605
G1 X161.267 Y148.926 E.01556
G1 X164.143 Y146.049 E.11863
G1 X164.214 Y146.086 E.00233
G1 X164.582 Y146.144 E.01086
G1 X161.8 Y148.926 E.11473
G1 X162.333 Y148.926 E.01556
G1 X165.042 Y146.217 E.11172
G1 X165.423 Y146.278 E.01126
G1 X165.423 Y146.369 E.00267
G1 X162.867 Y148.926 E.10545
G1 X163.4 Y148.926 E.01556
G1 X165.423 Y146.903 E.08345
G1 X165.423 Y147.436 E.01556
G1 X163.934 Y148.926 E.06145
G1 X164.467 Y148.926 E.01556
G1 X165.423 Y147.969 E.03945
G1 X165.423 Y148.503 E.01556
G1 X164.831 Y149.095 E.02445
; WIPE_START
G1 F24000
G1 X165.423 Y148.503 E-.31854
G1 X165.423 Y147.969 E-.20268
G1 X164.979 Y148.414 E-.23878
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.217 J.023 P1  F30000
G1 X165.593 Y116.33 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X165.016 Y116.908 E.02381
G1 X164.392 Y116.998 E.01837
G1 X165.423 Y115.967 E.04252
G1 X165.423 Y115.433 E.01556
G1 X163.486 Y117.37 E.0799
G1 X162.506 Y117.818 E.03143
G1 X165.094 Y115.229 E.10677
G1 X164.628 Y115.162 E.01375
G1 X132.732 Y147.058 E1.31554
G1 X132.913 Y147.411 E.01156
G1 X160.179 Y120.144 E1.12464
G1 X159.587 Y121.067 E.03199
G1 X159.503 Y121.354 E.00872
G1 X133.093 Y147.764 E1.0893
G1 X133.273 Y148.117 E.01156
G1 X159.282 Y122.108 E1.07275
G1 X159.06 Y122.863 E.02293
G1 X133.364 Y148.559 E1.05988
G1 X133.422 Y148.926 E.01081
G1 X133.531 Y148.926 E.00319
G1 X134.646 Y147.811 E.04597
G1 X134.538 Y148.023 E.00693
G1 X134.457 Y148.533 E.01506
G1 X133.895 Y149.095 E.02321
G1 X132.426 Y146.831 F30000
G1 F15000
G1 X164.161 Y115.096 E1.30893
G1 X163.786 Y114.937 E.01187
G1 X132.297 Y146.426 E1.29881
G1 X132.03 Y146.16 E.011
G1 X163.42 Y114.77 E1.29471
G1 X163.054 Y114.602 E.01174
G1 X131.763 Y145.893 E1.29061
G1 X131.497 Y145.626 E.011
G1 X162.688 Y114.435 E1.28651
G1 X162.322 Y114.268 E.01174
G1 X131.2 Y145.39 E1.28366
G1 X130.846 Y145.21 E.01157
G1 X161.979 Y114.077 E1.28412
G1 X161.694 Y113.829 E.01103
G1 X130.493 Y145.03 E1.28692
G1 X130.139 Y144.85 E.01157
G1 X161.408 Y113.581 E1.28971
G1 X161.122 Y113.334 E.01103
G1 X129.78 Y144.676 E1.29275
G1 X129.319 Y144.603 E.0136
G1 X160.837 Y113.086 E1.29997
G1 X160.551 Y112.838 E.01103
G1 X128.859 Y144.531 E1.30718
G1 X128.398 Y144.458 E.0136
G1 X160.289 Y112.567 E1.31538
G1 X160.081 Y112.242 E.01126
G1 X127.868 Y144.454 E1.32864
G1 X127.235 Y144.555 E.01871
G1 X159.872 Y111.917 E1.34617
G1 X159.664 Y111.592 E.01126
G1 X126.601 Y144.655 E1.36371
G1 X126.441 Y144.68 E.00473
G1 X125.631 Y145.092 E.02649
G1 X159.455 Y111.267 E1.39512
G1 X159.247 Y110.942 E.01126
G1 X121.856 Y148.334 E1.54223
G1 X121.676 Y147.98 E.01157
G1 X159.078 Y110.578 E1.54268
G1 X158.957 Y110.166 E.01253
G1 X121.496 Y147.626 E1.54511
G1 X121.316 Y147.273 E.01157
G1 X158.836 Y109.753 E1.54753
G1 X158.714 Y109.341 E.01253
G1 X121.128 Y146.928 E1.55029
G1 X120.861 Y146.661 E.011
G1 X158.593 Y108.929 E1.55629
G1 X158.495 Y108.596 E.01013
G1 X158.495 Y108.494 E.00298
G1 X120.595 Y146.394 E1.56325
G1 X120.328 Y146.128 E.011
G1 X158.495 Y107.96 E1.57425
G1 X158.495 Y107.427 E.01556
G1 X120.061 Y145.861 E1.58525
G1 X119.709 Y145.68 E.01156
G1 X158.495 Y106.893 E1.5998
G1 X158.495 Y106.36 E.01556
G1 X119.355 Y145.5 E1.61438
G1 X119.002 Y145.32 E.01157
G1 X158.707 Y105.615 E1.63768
M73 P37 R16
G1 X158.929 Y104.86 E.02296
G1 X118.639 Y145.15 E1.66181
G1 X118.179 Y145.076 E.01358
G1 X159.773 Y103.483 E1.71557
G1 X162.474 Y100.781 F30000
G1 F15000
G1 X165.423 Y97.832 E.12165
G1 X165.423 Y98.365 E.01556
G1 X163.8 Y99.989 E.06697
G1 X164.12 Y99.842 E.01028
G1 X164.54 Y99.782 E.01237
G1 X165.423 Y98.899 E.03643
G1 X165.423 Y99.432 E.01556
G1 X164.963 Y99.893 E.01899
G1 X162.895 Y96.627 F30000
G1 F15000
G1 X162.118 Y97.403 E.03203
G1 X162.028 Y98.027 E.01838
G1 X163.259 Y96.796 E.05076
G1 X163.792 Y96.796 E.01556
G1 X161.702 Y98.886 E.0862
G1 X161.255 Y99.867 E.03144
G1 X164.325 Y96.796 E.12665
G1 X164.859 Y96.796 E.01556
G1 X116.666 Y144.989 E1.98777
G1 X117.151 Y144.912 E.01433
G1 X117.259 Y144.929 E.00321
G1 X165.392 Y96.796 E1.98528
G1 X165.423 Y96.796 E.00091
G1 X165.423 Y97.299 E.01465
G1 X117.571 Y145.151 E1.97372
G1 X115.826 Y145.296 F30000
G1 F15000
G1 X157.901 Y103.221 E1.73542
G1 X157.403 Y103.541 E.01725
G1 X156.9 Y103.689 E.01531
G1 X114.846 Y145.743 E1.73456
G1 X112.026 Y149.095 F30000
G1 F15000
G1 X112.382 Y148.74 E.01466
G1 X112.446 Y148.333 E.012
G1 X112.643 Y147.945 E.0127
G1 X111.663 Y148.926 E.04044
G1 X111.293 Y148.926 E.01079
G1 X111.27 Y148.785 E.00417
G1 X156.144 Y103.911 E1.85085
G1 X155.388 Y104.133 E.02297
G1 X111.16 Y148.362 E1.82424
G1 X110.98 Y148.009 E.01156
G1 X154.77 Y104.218 E1.80617
G1 X154.237 Y104.218 E.01556
G1 X110.799 Y147.655 E1.7916
G1 X110.619 Y147.302 E.01156
G1 X153.703 Y104.218 E1.77703
G1 X153.17 Y104.218 E.01556
G1 X110.367 Y147.021 E1.76542
G1 X110.104 Y146.751 E.011
G1 X152.649 Y104.205 E1.75483
G1 X152.237 Y104.084 E.01253
G1 X109.841 Y146.481 E1.74869
G2 X109.546 Y146.242 I-.716 J.583 E.01114
G1 X151.825 Y103.963 E1.74384
G1 X151.413 Y103.842 E.01253
G1 X109.219 Y146.036 E1.74034
G1 X108.865 Y145.856 E.01157
G1 X151.001 Y103.721 E1.73792
G1 X150.588 Y103.599 E.01253
G1 X108.494 Y145.694 E1.73621
G2 X108.071 Y145.584 I-.423 J.759 E.0129
G1 X150.221 Y103.433 E1.73853
G1 X149.896 Y103.225 E.01126
G1 X107.61 Y145.511 E1.74415
G1 X107.149 Y145.439 E.01361
G1 X149.572 Y103.016 E1.74976
G1 X149.247 Y102.807 E.01126
G1 X106.574 Y145.48 E1.76007
G1 X105.941 Y145.58 E.01869
G1 X148.922 Y102.599 E1.77279
G1 X148.598 Y102.39 E.01126
G1 X105.085 Y145.902 E1.7947
G1 X104.38 Y146.261 E.02308
G1 X103.396 Y147.247 E.04061
G1 X103.038 Y147.95 E.02302
G1 X102.062 Y148.926 E.04025
G1 X101.816 Y148.926 E.00716
G1 X101.777 Y148.677 E.00734
G1 X148.295 Y102.159 E1.91866
G1 X148.047 Y101.874 E.01103
G1 X101.606 Y148.315 E1.91552
G1 X101.426 Y147.962 E.01157
G1 X147.8 Y101.588 E1.91273
G1 X147.552 Y101.302 E.01103
G1 X101.246 Y147.609 E1.90994
G1 X101.211 Y147.54 E.00223
G1 X100.996 Y147.325 E.00888
G1 X147.304 Y101.017 E1.91003
G1 X147.056 Y100.731 E.01103
G1 X100.729 Y147.058 E1.91082
G1 X100.462 Y146.792 E.011
G1 X146.809 Y100.445 E1.9116
G1 X146.636 Y100.085 E.01166
G1 X100.149 Y146.571 E1.91738
G1 X99.796 Y146.391 E.01156
G1 X146.468 Y99.719 E1.92505
G1 X146.301 Y99.353 E.01174
G1 X99.443 Y146.211 E1.93271
G2 X99.045 Y146.076 I-.408 J.547 E.01247
G1 X146.134 Y98.987 E1.94223
G1 X145.966 Y98.621 E.01174
G1 X98.585 Y146.002 E1.9543
G1 X98.125 Y145.929 E.01359
G1 X145.799 Y98.255 E1.96637
G1 X145.728 Y97.792 E.01364
G1 X143.303 Y100.218 E.10004
G1 X143.679 Y99.308 E.02872
G1 X145.661 Y97.326 E.08175
G1 X145.595 Y96.859 E.01375
G1 X144.056 Y98.398 E.06347
G1 X144.148 Y98.175 E.00703
G1 X144.209 Y97.711 E.01364
G1 X145.124 Y96.796 E.03773
G1 X144.59 Y96.796 E.01556
G1 X144.093 Y97.294 E.02053
; WIPE_START
G1 F24000
G1 X144.59 Y96.796 E-.26753
G1 X145.124 Y96.796 E-.20268
G1 X144.585 Y97.336 E-.28978
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.045 J-1.216 P1  F30000
G1 X125.559 Y96.627 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X125.027 Y97.158 E.02193
G1 X124.946 Y97.773 E.01808
G1 X125.922 Y96.796 E.04027
G1 X126.456 Y96.796 E.01556
G1 X124.825 Y98.428 E.06728
G1 X124.449 Y99.337 E.02869
G1 X126.723 Y97.062 E.09381
G1 X126.785 Y97.534 E.01387
G1 X123.666 Y100.653 E.12864
; WIPE_START
G1 F24000
G1 X125.08 Y99.238 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.121 J-1.211 P1  F30000
G1 X104.235 Y97.149 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X104.587 Y96.796 E.01454
G1 X105.121 Y96.796 E.01556
G1 X104.351 Y97.566 E.03176
G1 X104.269 Y98.181 E.01808
G1 X105.654 Y96.796 E.05711
G1 X106.187 Y96.796 E.01556
M73 P38 R16
G1 X104.014 Y98.97 E.08964
G1 X103.638 Y99.879 E.0287
G1 X106.468 Y97.049 E.11672
G1 X106.53 Y97.52 E.01386
G1 X102.408 Y101.643 E.17003
; WIPE_START
G1 F24000
G1 X103.822 Y100.228 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.206 J-1.199 P1  F30000
G1 X82.888 Y96.627 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X82.296 Y97.219 E.02445
G1 X82.296 Y97.753 E.01556
G1 X83.252 Y96.796 E.03945
G1 X83.786 Y96.796 E.01556
G1 X82.296 Y98.286 E.06145
G1 X82.296 Y98.82 E.01556
G1 X84.319 Y96.796 E.08344
G1 X84.812 Y96.796 E.01439
G1 X84.817 Y96.832 E.00104
G1 X82.296 Y99.353 E.10398
G1 X82.296 Y99.886 E.01556
G1 X84.879 Y97.303 E.10654
G1 X84.941 Y97.775 E.01387
G1 X82.296 Y100.42 E.10909
G1 X82.296 Y100.953 E.01556
G1 X85.003 Y98.246 E.11165
G2 X85.122 Y98.661 I.832 J-.014 E.01272
G1 X82.296 Y101.486 E.11655
G1 X82.296 Y102.02 E.01556
G1 X85.278 Y99.038 E.12299
G1 X85.434 Y99.415 E.01191
G1 X82.546 Y102.303 E.11912
G1 X83.022 Y102.361 E.01397
G1 X85.59 Y99.792 E.10595
G1 X85.747 Y100.169 E.01191
G1 X83.497 Y102.418 E.09278
G1 X83.858 Y102.462 E.0106
G1 X83.951 Y102.498 E.00291
G1 X85.903 Y100.546 E.08049
G1 X86.022 Y100.833 E.00906
G1 X86.077 Y100.905 E.00266
G1 X84.338 Y102.644 E.07173
G1 X84.725 Y102.791 E.01206
G1 X86.309 Y101.207 E.06533
G1 X86.541 Y101.509 E.01109
G1 X85.112 Y102.937 E.05894
G1 X85.499 Y103.084 E.01206
G1 X86.772 Y101.81 E.05254
G1 X87.004 Y102.112 E.01109
G1 X85.885 Y103.231 E.04614
G1 X86.213 Y103.355 E.01021
G1 X86.261 Y103.388 E.00171
G1 X87.236 Y102.414 E.0402
G1 X87.467 Y102.715 E.01109
G1 X86.577 Y103.606 E.03675
G1 X86.892 Y103.824 E.01118
G1 X87.729 Y102.988 E.03451
G1 X88.03 Y103.219 E.01109
G1 X87.207 Y104.042 E.03395
G1 X87.523 Y104.26 E.01118
G1 X88.332 Y103.451 E.03339
G1 X88.634 Y103.682 E.01109
G1 X87.838 Y104.478 E.03283
G1 X88.154 Y104.696 E.01118
G1 X88.936 Y103.914 E.03227
G1 X89.238 Y104.145 E.01109
G1 X88.431 Y104.952 E.03328
G1 X88.682 Y105.235 E.01102
G1 X89.54 Y104.377 E.03539
G2 X89.886 Y104.563 I.523 J-.555 E.01162
G1 X88.932 Y105.517 E.03935
G1 X89.183 Y105.8 E.01102
G1 X90.263 Y104.72 E.04456
G1 X90.64 Y104.876 E.0119
G1 X89.434 Y106.083 E.04977
G1 X89.684 Y106.366 E.01102
G1 X91.017 Y105.033 E.05497
G1 X91.394 Y105.189 E.0119
G1 X89.935 Y106.648 E.06018
G1 X90.124 Y106.993 E.01146
G1 X91.771 Y105.345 E.06795
G1 X92.059 Y105.464 E.00908
G1 X92.171 Y105.479 E.00329
G1 X90.307 Y107.343 E.07687
G1 X90.491 Y107.693 E.01152
G1 X92.642 Y105.541 E.08874
G1 X93.114 Y105.603 E.01387
G1 X90.674 Y108.042 E.10062
G1 X90.858 Y108.392 E.01152
G1 X93.585 Y105.665 E.11249
G1 X94.057 Y105.727 E.01387
G1 X91.041 Y108.742 E.12437
G3 X91.182 Y109.135 I-.727 J.482 E.01229
G1 X94.528 Y105.789 E.13802
G1 X94.633 Y105.802 E.00308
G1 X95.111 Y105.74 E.01406
G1 X91.287 Y109.563 E.1577
G1 X91.393 Y109.991 E.01285
G1 X95.725 Y105.659 E.17867
G1 X96.339 Y105.578 E.01806
G1 X91.498 Y110.419 E.19965
G1 X91.604 Y110.847 E.01285
G1 X96.953 Y105.497 E.22063
G1 X97.205 Y105.464 E.0074
G1 X97.742 Y105.242 E.01695
G1 X91.709 Y111.275 E.24882
G1 X91.726 Y111.344 E.00207
G1 X91.726 Y111.791 E.01305
G1 X98.653 Y104.865 E.28569
G1 X99.563 Y104.487 E.02876
G1 X91.726 Y112.324 E.32326
G1 X91.726 Y112.858 E.01556
G1 X106.592 Y97.992 E.61317
G1 X106.633 Y98.303 E.00916
G1 X106.686 Y98.431 E.00404
G1 X91.726 Y113.391 E.61705
G1 X91.726 Y113.861 E.01369
G1 X91.705 Y113.945 E.00255
G1 X106.842 Y98.808 E.62435
G1 X106.998 Y99.186 E.01191
G1 X91.531 Y114.653 E.63797
G1 X91.356 Y115.361 E.02126
G1 X107.154 Y99.563 E.6516
G1 X107.31 Y99.941 E.01191
G1 X91.182 Y116.069 E.66522
G1 X91.124 Y116.305 E.0071
G1 X90.732 Y117.053 E.02462
G1 X107.466 Y100.318 E.69023
G1 X107.576 Y100.583 E.00835
G1 X107.645 Y100.673 E.00331
G1 X89.29 Y119.027 E.75705
G1 X82.126 Y123.524 F30000
G1 F15000
G1 X82.777 Y122.873 E.02685
G1 X83.385 Y122.799 E.01784
G1 X82.296 Y123.888 E.0449
G1 X82.296 Y124.208 E.00934
G1 X82.486 Y124.231 E.00558
G1 X84.047 Y122.67 E.06439
G1 X84.908 Y122.343 E.02684
G1 X82.962 Y124.289 E.08026
G1 X83.437 Y124.347 E.01398
G1 X85.768 Y122.016 E.09612
G1 X86.213 Y121.847 E.01388
G1 X87.044 Y121.274 E.02944
G1 X83.913 Y124.404 E.12912
G1 X83.978 Y124.412 E.00191
G1 X84.312 Y124.539 E.01041
G1 X107.876 Y100.974 E.97194
G1 X108.108 Y101.276 E.01109
G1 X84.699 Y124.686 E.96555
G1 X85.085 Y124.833 E.01206
G1 X108.34 Y101.578 E.95917
G1 X108.572 Y101.879 E.01109
G1 X85.472 Y124.979 E.95278
G1 X85.858 Y125.126 E.01206
G1 X108.803 Y102.181 E.94639
G1 X109.035 Y102.483 E.01109
G1 X86.245 Y125.273 E.94001
G3 X86.597 Y125.454 I-.192 J.806 E.01167
G1 X109.324 Y102.727 E.93739
G1 X109.626 Y102.959 E.01109
G1 X86.913 Y125.672 E.93683
G1 X87.228 Y125.89 E.01118
G1 X109.928 Y103.19 E.93626
G1 X110.23 Y103.422 E.01109
G1 X87.544 Y126.108 E.9357
G1 X87.859 Y126.326 E.01118
G1 X110.531 Y103.653 E.93514
G1 X110.833 Y103.885 E.01109
G1 X88.175 Y126.543 E.93457
G1 X88.49 Y126.761 E.01118
G1 X111.161 Y104.091 E.93506
G1 X111.538 Y104.247 E.01191
G1 X88.767 Y127.018 E.93922
G1 X89.017 Y127.301 E.01102
G1 X111.915 Y104.403 E.94444
G1 X112.292 Y104.559 E.01191
G1 X89.268 Y127.584 E.94966
G1 X89.519 Y127.866 E.01102
G1 X112.67 Y104.715 E.95489
G1 X113.047 Y104.871 E.01191
G1 X89.769 Y128.149 E.96011
G1 X90.02 Y128.432 E.01102
G1 X113.453 Y104.999 E.9665
G1 X113.924 Y105.061 E.01386
G1 X90.271 Y128.714 E.97559
G3 X90.48 Y129.039 I-.552 J.585 E.01136
G1 X114.395 Y105.123 E.98641
G1 X114.866 Y105.185 E.01386
G1 X90.663 Y129.388 E.99827
G1 X90.847 Y129.738 E.01152
G1 X115.338 Y105.248 E1.01014
G1 X115.755 Y105.302 E.01227
G1 X115.825 Y105.293 E.00208
G1 X91.031 Y130.088 E1.02268
G1 X91.214 Y130.438 E.01152
G1 X116.44 Y105.212 E1.04045
G1 X117.054 Y105.131 E.01807
G1 X91.398 Y130.788 E1.05822
G1 X91.581 Y131.137 E.01152
G1 X117.668 Y105.05 E1.07598
G1 X118.199 Y104.98 E.0156
G1 X118.323 Y104.929 E.00393
G1 X91.691 Y131.561 E1.09846
G1 X91.797 Y131.989 E.01286
G1 X119.233 Y104.553 E1.13164
G1 X120.143 Y104.176 E.02871
G1 X91.902 Y132.417 E1.16481
G1 X92.007 Y132.845 E.01286
G1 X126.847 Y98.005 E1.437
G2 X126.969 Y98.416 I.826 J-.022 E.01265
G1 X92.113 Y133.273 E1.4377
G1 X92.218 Y133.701 E.01286
G1 X127.126 Y98.793 E1.4398
G1 X127.282 Y99.17 E.0119
G1 X92.222 Y134.23 E1.44609
G1 X92.222 Y134.764 E.01556
G1 X127.439 Y99.547 E1.45254
G1 X127.595 Y99.924 E.0119
G1 X92.222 Y135.297 E1.45899
G1 X92.222 Y135.83 E.01556
G1 X127.751 Y100.301 E1.46544
G1 X127.977 Y100.609 E.01113
G1 X92.22 Y136.366 E1.47484
G1 X92.046 Y137.074 E.02125
G1 X128.209 Y100.911 E1.49158
G1 X128.44 Y101.212 E.01109
G1 X91.871 Y137.781 E1.50831
G1 X91.697 Y138.489 E.02125
G1 X128.672 Y101.514 E1.52505
G1 X128.903 Y101.816 E.01109
G1 X91.359 Y139.36 E1.54853
G1 X90.77 Y140.483 E.03697
G1 X129.135 Y102.118 E1.58238
G1 X129.185 Y102.184 E.00243
G1 X129.421 Y102.365 E.00867
G1 X82.86 Y148.926 E1.92044
G1 X83.394 Y148.926 E.01556
G1 X129.723 Y102.597 E1.91088
G1 X130.024 Y102.828 E.01109
G1 X83.927 Y148.926 E1.90133
G1 X84.46 Y148.926 E.01556
G1 X130.326 Y103.06 E1.89177
G1 X130.628 Y103.292 E.01109
G1 X84.994 Y148.926 E1.88221
G1 X85.527 Y148.926 E.01556
G1 X130.929 Y103.524 E1.87265
G2 X131.28 Y103.707 I.515 J-.559 E.01166
G1 X86.061 Y148.926 E1.8651
G1 X86.594 Y148.926 E.01556
G1 X87.085 Y148.434 E.02026
G1 X87.39 Y147.835 E.01962
G1 X88.154 Y147.071 E.03151
G1 X88.754 Y146.766 E.01962
G1 X131.657 Y103.863 E1.76957
G1 X132.034 Y104.019 E.01191
G1 X89.538 Y146.516 E1.75282
G1 X90.171 Y146.416 E.01869
G1 X132.412 Y104.175 E1.74227
G1 X132.789 Y104.331 E.01191
G1 X90.634 Y146.486 E1.73873
G1 X91.095 Y146.559 E.0136
G1 X133.167 Y104.487 E1.73529
G1 X133.631 Y104.556 E.01369
G1 X91.483 Y146.703 E1.73841
G1 X91.837 Y146.883 E.01157
G1 X134.102 Y104.618 E1.74326
G1 X134.573 Y104.681 E.01386
G1 X92.19 Y147.063 E1.7481
G1 X92.461 Y147.326 E.011
G1 X135.044 Y104.743 E1.75638
G1 X135.517 Y104.804 E.0139
G1 X92.727 Y147.593 E1.76488
G1 X92.986 Y147.868 E.01101
G1 X136.131 Y104.722 E1.77958
G1 X136.746 Y104.641 E.01808
G1 X93.166 Y148.221 E1.79749
G1 X93.347 Y148.574 E.01156
G1 X137.361 Y104.56 E1.81539
G1 X137.825 Y104.498 E.01366
G1 X138.047 Y104.406 E.00702
G1 X93.358 Y149.095 E1.84324
G1 X93.892 Y149.095 F30000
G1 F15000
G1 X94.567 Y148.42 E.02784
G1 X96.578 Y146.409 F30000
G1 F15000
G1 X138.957 Y104.03 E1.74795
G1 X139.866 Y103.654 E.0287
G1 X97.326 Y146.194 E1.75459
; WIPE_START
G1 F24000
G1 X98.741 Y144.78 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.925 J.79 P1  F30000
G1 X102.426 Y149.095 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X102.917 Y148.604 E.02028
; WIPE_START
M73 P39 R16
G1 F24000
G1 X102.426 Y149.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.01 J1.217 P1  F30000
G1 X121.78 Y148.942 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X123.355 Y147.368 E.06493
G1 X122.942 Y148.176 E.02647
G1 X122.916 Y148.34 E.00483
G1 X122.161 Y149.095 E.03117
; WIPE_START
G1 F24000
G1 X122.916 Y148.34 E-.40611
G1 X122.942 Y148.176 E-.06289
G1 X123.29 Y147.494 E-.291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.047 J-1.216 P1  F30000
G1 X82.157 Y149.095 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X86.712 Y144.541 E.18786
G1 X86.445 Y144.725 E.00947
G1 X85.718 Y145.001 E.02267
G1 X82.296 Y148.423 E.14115
G1 X82.296 Y147.89 E.01556
G1 X84.858 Y145.328 E.10568
G1 X83.998 Y145.654 E.02683
G1 X82.296 Y147.357 E.07021
G1 X82.296 Y146.823 E.01556
G1 X83.385 Y145.734 E.04493
G1 X82.778 Y145.807 E.01783
G1 X82.126 Y146.459 E.0269
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X82.778 Y145.807 E-.35042
G1 X83.385 Y145.734 E-.23233
G1 X83.056 Y146.064 E-.17724
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I-.8 J.917 P1  F30000
G1 X189.5 Y239 Z.8
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X156.500 Y219.500  
;--------------------
; CP EMPTY GRID START
; layer #4
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X191.371 
G1  Y240.871 
G1  X153.629  E1.4345
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834
G1  X191.828 
G1  Y241.328 
G1  X153.172  E1.4692
G1  Y217.172  E0.9181
G1  X191.828  E1.4692
G1  Y241.328  E0.9181

; WIPE_START
G1 F24000
G1 X189.828 Y241.328 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.131 J-.448 P1  F30000
G1 X151.292 Y144.072 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05858
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.99 Y146.857 I457.348 J457.597 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04543
G2 X114.443 Y146.132 I863.33 J1694.744 E.04534
G1 X113.422 Y147.151 E.0454
M73 P39 R15
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
M73 P40 R15
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-84.017 J163.545 E.03556
G1 X98.017 Y146.249 E.0356
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09892
G1 X85.138 Y96.717 E.00805
G1 X85.352 Y98.346 E.05174
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07894
G2 X92.146 Y105.14 I434.795 J-1045.128 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-670.335 J-1621.091 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I1122.849 J-972.243 E.07262
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-70.167 J-242.933 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-188.626 J367.513 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.346 Y144.048 E.05987
G1 X151.451 Y144.431 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.868 Y145.239 E.05184
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I421.263 J421.468 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G2 X114.676 Y146.453 I786.954 J1544.838 E.03839
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.088 Y146.851 E.00239
G1 X108.801 Y146.618 E.01079
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-74.757 J145.566 E.02931
G1 X98.017 Y146.646 E.02935
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.11309
G1 X85.734 Y98.244 E.0639
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I416.903 J-1002.081 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-640.986 J-1550.083 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G1 X111.821 Y103.579 E.01332
G1 X113.5 Y104.274 E.05298
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I1068.655 J-925.334 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-66.744 J-231.003 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-176.386 J343.618 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.51 Y144.419 E.05064
M204 S10000
; WIPE_START
G1 F24000
G1 X149.868 Y145.239 E-.69747
G1 X149.751 Y145.355 E-.06253
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.203 J1.2 P1  F30000
G1 X155.969 Y144.302 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420073
G1 F15000
G1 X116.827 Y105.161 E1.61441
G1 X116.356 Y105.223 E.01386
G1 X154.794 Y143.661 E1.58541
G1 X154.16 Y143.561 E.01872
G1 X115.885 Y105.285 E1.57869
G1 X115.755 Y105.302 E.00383
G1 X115.31 Y105.244 E.01308
G1 X153.526 Y143.46 E1.57625
G1 X153.225 Y143.412 E.00889
G1 X152.983 Y143.45 E.00714
G1 X114.696 Y105.163 E1.5792
G1 X114.081 Y105.082 E.01807
G1 X152.523 Y143.523 E1.58555
G1 X152.063 Y143.597 E.01359
G1 X113.467 Y105.001 E1.59191
G1 X113.311 Y104.98 E.00459
G1 X112.632 Y104.7 E.02142
G1 X151.602 Y143.67 E1.60735
G1 X151.232 Y143.728 E.01092
G1 X151.163 Y143.764 E.00227
G1 X111.723 Y104.323 E1.62675
G1 X111.033 Y104.038 E.02176
G1 X110.479 Y103.613 E.02038
G1 X150.81 Y143.944 E1.66349
G1 X150.457 Y144.124 E.01156
G1 X104.298 Y97.965 E1.90386
G1 X104.235 Y98.436 E.01384
G1 X150.104 Y144.304 E1.89189
G1 X149.75 Y144.485 E.01156
G1 X104.079 Y98.813 E1.88376
G1 X103.923 Y99.191 E.01191
G1 X149.407 Y144.674 E1.87602
G1 X149.14 Y144.941 E.011
G1 X103.767 Y99.568 E1.87145
G1 X103.611 Y99.945 E.01191
G1 X148.873 Y145.207 E1.86687
G1 X148.606 Y145.474 E.011
G1 X103.455 Y100.323 E1.8623
G1 X103.299 Y100.7 E.01191
G1 X148.339 Y145.74 E1.85772
G1 X148.072 Y146.007 E.011
G1 X103.094 Y101.028 E1.85517
G1 X102.862 Y101.33 E.01109
G1 X147.871 Y146.339 E1.85645
G1 X147.691 Y146.693 E.01157
G1 X102.63 Y101.632 E1.85858
G1 X102.399 Y101.933 E.01109
G1 X147.511 Y147.046 E1.86071
G1 X147.331 Y147.399 E.01157
G1 X102.167 Y102.235 E1.86284
G1 X101.935 Y102.537 E.01109
G1 X147.151 Y147.753 E1.86496
G1 X147.092 Y147.869 E.0038
G1 X147.043 Y148.178 E.00913
G1 X101.704 Y102.838 E1.87007
G1 X101.664 Y102.89 E.00191
G1 X101.414 Y103.082 E.00918
G1 X143.06 Y144.728 E1.71774
G1 X141.997 Y144.199 E.03463
G1 X101.112 Y103.314 E1.68635
G1 X100.81 Y103.545 E.01109
G1 X141.364 Y144.099 E1.67268
G1 X140.731 Y143.999 E.0187
G1 X100.508 Y103.777 E1.65901
G1 X100.206 Y104.008 E.01109
G1 X140.123 Y143.925 E1.6464
G1 X139.663 Y143.998 E.0136
G1 X99.905 Y104.24 E1.63985
G1 X99.602 Y104.471 E.0111
G1 X139.202 Y144.071 E1.63332
G1 X138.742 Y144.143 E.0136
G1 X99.225 Y104.627 E1.62988
G1 X98.848 Y104.783 E.0119
G1 X138.299 Y144.234 E1.62716
G1 X137.945 Y144.414 E.01157
G1 X98.471 Y104.94 E1.62813
G1 X98.094 Y105.096 E.0119
G1 X137.592 Y144.594 E1.62911
G1 X137.238 Y144.774 E.01157
G1 X97.717 Y105.252 E1.63009
G1 X97.34 Y105.408 E.01191
G1 X136.885 Y144.954 E1.63107
G2 X136.572 Y145.175 I.183 J.591 E.01135
G1 X96.902 Y105.504 E1.63624
G1 X96.431 Y105.566 E.01387
G1 X136.306 Y145.441 E1.64468
G1 X136.039 Y145.708 E.011
G1 X95.959 Y105.628 E1.65312
G1 X95.488 Y105.69 E.01387
G1 X135.772 Y145.975 E1.66157
G1 X135.506 Y146.241 E.011
G1 X95.016 Y105.752 E1.67001
M73 P41 R15
G1 X94.633 Y105.802 E.01129
G1 X94.518 Y105.787 E.00336
G1 X135.286 Y146.555 E1.68147
G1 X135.106 Y146.908 E.01157
G1 X93.904 Y105.707 E1.69938
G1 X93.29 Y105.626 E.01806
G1 X134.926 Y147.261 E1.71728
G1 X134.746 Y147.615 E.01157
G1 X92.676 Y105.546 E1.73518
G1 X92.062 Y105.465 E.01806
G1 X134.566 Y147.968 E1.75308
G1 X134.538 Y148.023 E.00179
G1 X134.476 Y148.412 E.0115
G1 X91.154 Y105.089 E1.78689
G1 X90.242 Y104.711 E.02879
G1 X130.632 Y145.101 E1.66591
G1 X129.805 Y144.68 E.02705
G1 X129.654 Y144.656 E.00446
G1 X88.83 Y103.832 E1.68382
G1 X87.602 Y102.89 E.04514
G1 X86.655 Y101.658 E.04532
G1 X82.296 Y97.298 E.17982
G1 X82.295 Y96.796 E.01463
G1 X82.327 Y96.796 E.00093
G1 X85.78 Y100.249 E.14241
G1 X85.402 Y99.338 E.02875
G1 X82.861 Y96.796 E.10484
G1 X83.394 Y96.796 E.01556
G1 X85.027 Y98.429 E.06735
G1 X84.946 Y97.815 E.01806
G1 X83.927 Y96.796 E.04202
G1 X84.461 Y96.796 E.01556
G1 X85.063 Y97.398 E.02482
G1 X82.126 Y101.929 F30000
G1 F15000
G1 X82.494 Y102.296 E.01515
G1 X83.101 Y102.37 E.01784
G1 X82.296 Y101.565 E.03319
G1 X82.296 Y101.032 E.01556
G1 X83.708 Y102.444 E.05823
G1 X83.858 Y102.462 E.00442
G1 X84.504 Y102.707 E.02016
G1 X82.296 Y100.499 E.09109
G1 X82.296 Y99.965 E.01556
G1 X85.363 Y103.033 E.12653
G1 X86.232 Y103.368 E.02716
G1 X82.296 Y99.432 E.16236
G1 X82.296 Y98.898 E.01556
G1 X127.854 Y144.457 E1.87909
G3 X128.387 Y144.456 I.268 J.82 E.01579
G1 X82.296 Y98.365 E1.90105
G1 X82.296 Y97.832 E.01556
G1 X129.224 Y144.76 E1.93561
G1 X127.542 Y144.678 F30000
G1 F15000
G1 X90.418 Y107.554 E1.53119
G1 X91.007 Y108.676 E.03696
G1 X126.933 Y144.602 E1.4818
G1 X126.472 Y144.675 E.0136
G1 X91.264 Y109.466 E1.45222
G1 X91.438 Y110.174 E.02126
G1 X126.111 Y144.848 E1.43013
G1 X125.758 Y145.027 E.01157
G1 X91.612 Y110.882 E1.40835
G1 X91.726 Y111.344 E.01387
G1 X91.726 Y111.529 E.00541
G1 X125.404 Y145.207 E1.38907
G1 X125.05 Y145.387 E.01157
G1 X91.726 Y112.062 E1.37448
G1 X91.726 Y112.596 E.01556
G1 X124.752 Y145.621 E1.36217
G1 X124.485 Y145.888 E.011
G1 X91.726 Y113.129 E1.35118
G1 X91.726 Y113.662 E.01556
G1 X124.219 Y146.155 E1.34019
G1 X123.952 Y146.422 E.011
G1 X91.66 Y114.13 E1.33194
G1 X91.554 Y114.558 E.01285
G1 X123.696 Y146.699 E1.32571
G1 X123.516 Y147.052 E.01156
G1 X91.449 Y114.985 E1.32262
G1 X91.343 Y115.413 E.01285
G1 X123.335 Y147.405 E1.31954
G1 X123.155 Y147.759 E.01156
G1 X91.238 Y115.841 E1.31645
G1 X91.133 Y116.269 E.01285
G1 X122.975 Y148.112 E1.31337
G1 X122.942 Y148.176 E.00211
G1 X122.883 Y148.553 E.01111
G1 X90.956 Y116.626 E1.31685
G1 X90.772 Y116.975 E.01152
G1 X119.237 Y145.44 E1.17405
G1 X118.68 Y145.157 E.01822
G1 X118.37 Y145.107 E.00914
G1 X90.588 Y117.325 E1.14589
G1 X90.405 Y117.675 E.01152
G1 X117.735 Y145.005 E1.12726
G1 X117.114 Y144.918 E.0183
G1 X90.221 Y118.025 E1.10921
G1 X90.038 Y118.375 E.01152
G1 X116.654 Y144.991 E1.09782
G1 X116.195 Y145.065 E.01358
G1 X89.818 Y118.688 E1.08793
G1 X89.567 Y118.971 E.01102
G1 X115.735 Y145.139 E1.07931
G1 X115.621 Y145.157 E.00336
G1 X115.355 Y145.292 E.00871
G1 X89.316 Y119.253 E1.07399
G1 X89.066 Y119.536 E.01102
G1 X115.002 Y145.473 E1.06976
G1 X114.649 Y145.653 E.01156
G1 X88.815 Y119.819 E1.06553
G1 X88.564 Y120.102 E.01102
G1 X114.296 Y145.833 E1.0613
G1 X114.244 Y145.859 E.00167
G1 X114.016 Y146.087 E.00941
G1 X88.314 Y120.384 E1.06012
G1 X88.006 Y120.61 E.01113
G1 X113.749 Y146.353 E1.0618
G1 X113.482 Y146.619 E.011
G1 X87.69 Y120.828 E1.0638
G1 X87.375 Y121.045 E.01118
G1 X113.215 Y146.886 E1.06581
G1 X113.149 Y146.952 E.00274
G1 X113.014 Y147.218 E.00869
G1 X87.059 Y121.263 E1.07051
G1 X86.744 Y121.481 E.01118
G1 X112.834 Y147.571 E1.07611
G1 X112.654 Y147.925 E.01157
G1 X86.428 Y121.699 E1.0817
G3 X86.09 Y121.894 I-.567 J-.591 E.0115
G1 X112.474 Y148.278 E1.08823
G1 X112.446 Y148.333 E.00181
G1 X112.385 Y148.722 E.01148
G1 X85.703 Y122.041 E1.1005
G1 X85.317 Y122.188 E.01206
G1 X108.975 Y145.846 E.97579
G1 X108.94 Y145.888 E.00158
G1 X108.338 Y145.626 E.01916
G1 X108.2 Y145.604 E.00409
G1 X84.93 Y122.335 E.95976
G1 X84.544 Y122.481 E.01206
G1 X107.567 Y145.504 E.9496
G1 X106.993 Y145.414 E.01695
G1 X106.95 Y145.421 E.00126
G1 X84.157 Y122.628 E.9401
G1 X83.859 Y122.742 E.00932
G1 X83.751 Y122.755 E.00317
G1 X86.283 Y125.287 E.10446
G1 X85.423 Y124.961 E.02683
G1 X83.275 Y122.813 E.0886
G1 X82.799 Y122.871 E.01397
G1 X84.563 Y124.634 E.07275
G1 X83.978 Y124.412 E.01824
G1 X83.784 Y124.389 E.00571
G1 X82.324 Y122.928 E.06023
G1 X82.296 Y122.932 E.00081
G1 X82.296 Y123.434 E.01465
G1 X83.177 Y124.315 E.03634
G1 X82.57 Y124.241 E.01783
G1 X82.126 Y123.798 E.01831
; WIPE_START
G1 F24000
M73 P42 R15
G1 X82.57 Y124.241 E-.23851
G1 X83.177 Y124.315 E-.23234
G1 X82.639 Y123.777 E-.28916
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.217 J.012 P1  F30000
G1 X82.889 Y149.095 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X82.296 Y148.503 E.02445
G1 X82.296 Y147.969 E.01556
G1 X83.253 Y148.926 E.03945
G1 X83.786 Y148.926 E.01556
G1 X82.296 Y147.436 E.06145
G1 X82.296 Y146.902 E.01556
G1 X84.319 Y148.926 E.08345
G1 X84.853 Y148.926 E.01556
G1 X82.296 Y146.369 E.10545
G1 X82.296 Y145.866 E.01468
G1 X82.323 Y145.863 E.00079
G1 X85.386 Y148.926 E.12634
G1 X85.919 Y148.926 E.01556
G1 X82.799 Y145.805 E.12872
G1 X83.274 Y145.747 E.01398
G1 X86.453 Y148.926 E.1311
G1 X86.881 Y148.926 E.0125
G1 X86.896 Y148.835 E.00268
G1 X83.75 Y145.69 E.12974
G2 X84.179 Y145.586 I.004 J-.921 E.01301
G1 X87.066 Y148.472 E.11906
G1 X87.246 Y148.119 E.01157
G1 X84.566 Y145.439 E.11054
G1 X84.953 Y145.292 E.01206
G1 X87.443 Y147.782 E.10271
G1 X87.709 Y147.516 E.011
G1 X85.339 Y145.145 E.09777
G1 X85.726 Y144.998 E.01206
G1 X87.976 Y147.249 E.09282
G1 X88.154 Y147.071 E.00735
G1 X88.272 Y147.011 E.00384
G1 X86.112 Y144.852 E.08907
G1 X86.489 Y144.695 E.0119
G1 X88.625 Y146.831 E.08812
G1 X88.979 Y146.651 E.01157
G1 X86.804 Y144.477 E.08968
G1 X87.12 Y144.259 E.01118
G1 X89.398 Y146.537 E.09398
G1 X89.859 Y146.465 E.0136
G1 X87.435 Y144.041 E.09997
G1 X87.751 Y143.823 E.01118
G1 X90.372 Y146.444 E.1081
G1 X91.005 Y146.544 E.0187
G1 X88.066 Y143.605 E.12122
G1 X88.382 Y143.388 E.01118
G1 X93.92 Y148.926 E.22842
G1 X94.219 Y148.926 E.00871
G1 X94.251 Y148.723 E.00598
G1 X88.681 Y143.153 E.22976
G1 X88.931 Y142.87 E.01102
G1 X94.412 Y148.351 E.22604
G1 X94.592 Y147.997 E.01157
G1 X89.182 Y142.588 E.22313
G1 X89.433 Y142.305 E.01102
G1 X94.772 Y147.644 E.22022
G1 X94.825 Y147.54 E.00339
G1 X95.013 Y147.352 E.00778
G1 X89.683 Y142.022 E.21983
G1 X89.934 Y141.74 E.01102
G1 X95.28 Y147.085 E.22049
G1 X95.546 Y146.819 E.011
G1 X90.185 Y141.457 E.22115
G2 X90.417 Y141.156 I-.494 J-.62 E.0112
G1 X95.851 Y146.589 E.22412
G1 X96.204 Y146.409 E.01157
G1 X90.6 Y140.806 E.23112
G1 X90.784 Y140.456 E.01152
G1 X96.557 Y146.229 E.23812
G1 X96.797 Y146.107 E.00786
G1 X96.945 Y146.083 E.00435
G1 X90.968 Y140.106 E.24653
G1 X91.151 Y139.756 E.01152
G1 X97.405 Y146.01 E.25792
G1 X97.864 Y145.936 E.01358
G1 X91.335 Y139.407 E.26932
G1 X91.518 Y139.057 E.01152
G1 X98.441 Y145.98 E.28553
G1 X99.076 Y146.081 E.01874
G1 X91.655 Y138.66 E.30607
G1 X91.76 Y138.232 E.01286
G1 X102.454 Y148.926 E.44107
G1 X102.694 Y148.926 E.00701
G1 X102.735 Y148.673 E.00747
G1 X91.866 Y137.804 E.44829
G1 X91.971 Y137.376 E.01286
G1 X102.871 Y148.276 E.44959
G1 X103.051 Y147.923 E.01156
G1 X92.076 Y136.948 E.45267
G1 X92.182 Y136.52 E.01286
G1 X103.232 Y147.57 E.45576
G1 X103.419 Y147.224 E.01147
G1 X92.222 Y136.027 E.46184
G1 X92.222 Y135.493 E.01556
G1 X103.686 Y146.957 E.47282
G1 X103.952 Y146.69 E.011
G1 X92.222 Y134.96 E.48381
G1 X92.222 Y134.427 E.01556
G1 X104.218 Y146.423 E.49479
G3 X104.519 Y146.19 I.506 J.343 E.01128
G1 X92.222 Y133.893 E.50719
G1 X92.222 Y133.718 E.00513
G1 X92.105 Y133.243 E.01425
G1 X104.873 Y146.01 E.5266
G1 X105.226 Y145.831 E.01157
G1 X91.931 Y132.536 E.54837
G1 X91.757 Y131.828 E.02125
G1 X105.58 Y145.651 E.57014
G1 X105.621 Y145.63 E.00135
G1 X106.028 Y145.566 E.01202
G1 X91.561 Y131.099 E.59669
G1 X90.972 Y129.977 E.03697
G1 X106.637 Y145.642 E.64612
G1 X102.09 Y149.095 F30000
G1 F15000
G1 X101.524 Y148.529 E.02334
; WIPE_START
G1 F24000
G1 X102.09 Y149.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I0 J1.217 P1  F30000
G1 X111.691 Y149.095 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X111.25 Y148.654 E.0182
G1 X111.224 Y148.487 E.00495
G1 X110.815 Y147.686 E.02622
G1 X112.224 Y149.095 E.05813
; WIPE_START
G1 F24000
G1 X110.815 Y147.686 E-.75743
G1 X110.818 Y147.692 E-.00257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.147 J1.208 P1  F30000
G1 X122.359 Y149.095 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X121.904 Y148.641 E.01874
G1 X121.855 Y148.333 E.00911
G1 X121.572 Y147.775 E.01824
G1 X122.892 Y149.095 E.05446
; WIPE_START
G1 F24000
G1 X121.572 Y147.775 E-.70955
G1 X121.632 Y147.893 E-.05045
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.117 J1.211 P1  F30000
G1 X134.093 Y149.095 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X133.328 Y148.33 E.03156
G1 X133.303 Y148.176 E.00455
G1 X132.883 Y147.352 E.02699
G1 X134.552 Y149.021 E.06886
; WIPE_START
G1 F24000
G1 X133.138 Y147.607 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.085 J1.214 P1  F30000
G1 X145.751 Y148.486 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X146.191 Y148.926 E.01815
G1 X146.724 Y148.926 E.01556
G1 X145.855 Y148.056 E.03586
G1 X145.325 Y146.993 E.03463
G1 X147.119 Y148.787 E.07398
; WIPE_START
G1 F24000
G1 X145.705 Y147.373 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.12 J1.211 P1  F30000
G1 X159.319 Y148.719 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X159.525 Y148.926 E.00852
G1 X160.059 Y148.926 E.01556
G1 X159.422 Y148.289 E.02625
G1 X159.355 Y147.869 E.01242
G1 X159.17 Y147.504 E.01195
G1 X160.592 Y148.926 E.05866
G1 X161.125 Y148.926 E.01556
G1 X117.299 Y105.099 E1.80767
G1 X117.77 Y105.037 E.01386
G1 X161.659 Y148.926 E1.81023
G1 X162.192 Y148.926 E.01556
G1 X118.233 Y104.966 E1.81314
G1 X118.61 Y104.81 E.01191
G1 X162.725 Y148.926 E1.81958
G1 X163.259 Y148.926 E.01556
G1 X118.987 Y104.654 E1.82601
G1 X119.365 Y104.498 E.01191
G1 X163.792 Y148.926 E1.83245
G1 X164.326 Y148.926 E.01556
G1 X119.742 Y104.342 E1.83889
G1 X120.119 Y104.186 E.01191
G1 X164.859 Y148.926 E1.84533
G1 X165.392 Y148.926 E.01556
G1 X120.492 Y104.026 E1.85193
G1 X120.794 Y103.794 E.01109
G1 X165.593 Y148.593 E1.84776
G1 X165.205 Y146.071 F30000
G1 F15000
G1 X165.423 Y146.29 E.00903
G1 X165.423 Y146.823 E.01556
G1 X164.775 Y146.175 E.02675
G1 X164.214 Y146.086 E.01655
G1 X164.088 Y146.022 E.00412
G1 X165.423 Y147.357 E.05507
G1 X165.423 Y147.89 E.01556
G1 X163.002 Y145.469 E.09987
G1 X162.277 Y145.1 E.02374
G1 X160.739 Y143.564 E.06339
G1 X160.367 Y142.834 E.0239
G1 X121.096 Y103.563 E1.61976
G1 X121.398 Y103.331 E.01109
G1 X159.814 Y141.747 E1.58451
G1 X159.752 Y141.626 E.00399
G1 X159.663 Y141.063 E.01662
G1 X121.7 Y103.1 E1.56582
G1 X122.002 Y102.868 E.01109
G1 X159.562 Y140.429 E1.54922
G1 X159.462 Y139.795 E.01872
G1 X122.303 Y102.637 E1.53262
G2 X122.565 Y102.365 I-.377 J-.625 E.01113
G1 X159.448 Y139.248 E1.52128
G1 X159.521 Y138.788 E.01359
G1 X122.797 Y102.063 E1.51474
G1 X123.028 Y101.761 E.01109
G1 X159.594 Y138.327 E1.50819
G1 X159.667 Y137.867 E.01359
G1 X123.26 Y101.46 E1.50164
G1 X123.492 Y101.158 E.01109
G1 X159.74 Y137.407 E1.4951
G1 X159.752 Y137.332 E.00219
G1 X159.903 Y137.036 E.0097
G1 X123.724 Y100.856 E1.49225
G1 X123.948 Y100.548 E.01114
G1 X160.083 Y136.683 E1.49041
G1 X160.263 Y136.329 E.01157
G1 X124.104 Y100.17 E1.4914
G1 X124.26 Y99.793 E.01191
G1 X160.443 Y135.976 E1.4924
G1 X160.623 Y135.623 E.01157
G1 X124.416 Y99.416 E1.49339
G1 X124.572 Y99.038 E.01191
G1 X160.834 Y135.301 E1.49567
G1 X161.101 Y135.034 E.011
G1 X124.728 Y98.661 E1.50023
G1 X124.879 Y98.279 E.01199
G1 X161.488 Y134.887 E1.50995
G1 X145.839 Y97.37 F30000
G1 F15000
G1 X145.265 Y96.796 E.02366
G1 X144.732 Y96.796 E.01556
G1 X145.728 Y97.792 E.04108
G1 X145.792 Y98.239 E.01316
G1 X145.919 Y98.516 E.00889
G1 X144.314 Y96.912 E.06618
G1 X144.252 Y97.383 E.01387
G1 X146.712 Y99.843 E.10145
G1 X149.884 Y103.015 F30000
G1 F15000
G1 X164.003 Y117.135 E.58238
G1 X164.263 Y117.016 E.0083
G1 X164.399 Y116.997 E.00402
G1 X151.174 Y103.772 E.54548
G1 X151.929 Y103.994 E.02296
G1 X159.908 Y111.972 E.32908
G1 X159.133 Y110.766 E.04182
G1 X159.091 Y110.622 E.00437
G1 X152.685 Y104.216 E.26423
G1 X153.221 Y104.218 E.01564
G1 X158.869 Y109.866 E.23296
G1 X158.647 Y109.111 E.02296
G1 X153.754 Y104.218 E.2018
G1 X154.288 Y104.218 E.01556
G1 X158.495 Y108.426 E.17355
G1 X158.495 Y107.893 E.01556
G1 X154.821 Y104.218 E.15155
G2 X155.296 Y104.16 I.137 J-.85 E.01415
G1 X158.495 Y107.359 E.13195
G1 X158.495 Y106.826 E.01556
G1 X155.709 Y104.039 E.11494
G1 X156.121 Y103.918 E.01253
G1 X158.505 Y106.302 E.09834
G1 X158.626 Y105.89 E.01253
G1 X156.533 Y103.797 E.08634
G1 X156.945 Y103.675 E.01253
G1 X158.747 Y105.478 E.07434
G1 X158.868 Y105.066 E.01253
G1 X157.357 Y103.554 E.06234
G1 X157.692 Y103.355 E.01135
G1 X158.99 Y104.653 E.05354
G1 X159.111 Y104.241 E.01253
G1 X158.016 Y103.147 E.04514
G1 X158.341 Y102.938 E.01126
G1 X159.303 Y103.9 E.03968
G1 X159.512 Y103.575 E.01126
G1 X158.666 Y102.729 E.03489
G1 X158.99 Y102.521 E.01126
G1 X159.72 Y103.25 E.03009
G1 X159.929 Y102.926 E.01126
M73 P43 R15
G1 X159.315 Y102.312 E.0253
G2 X159.589 Y102.053 I-.306 J-.597 E.01115
G1 X160.137 Y102.601 E.02261
G1 X160.346 Y102.276 E.01126
G1 X159.837 Y101.767 E.02099
G1 X160.084 Y101.481 E.01103
G1 X160.628 Y102.025 E.02243
G1 X160.914 Y101.778 E.01103
G1 X160.332 Y101.196 E.024
G1 X160.58 Y100.91 E.01103
G1 X161.2 Y101.53 E.02558
G1 X161.486 Y101.283 E.01103
G1 X160.828 Y100.624 E.02715
G1 X161 Y100.426 E.00766
G1 X161.051 Y100.314 E.00359
G1 X161.772 Y101.035 E.02974
G1 X162.058 Y100.788 E.01103
G1 X161.218 Y99.948 E.03464
G1 X161.385 Y99.582 E.01174
G1 X162.422 Y100.619 E.04277
G1 X162.788 Y100.451 E.01174
G1 X161.552 Y99.215 E.05098
G1 X161.719 Y98.849 E.01174
G1 X163.154 Y100.284 E.05918
G1 X163.52 Y100.117 E.01174
G1 X161.886 Y98.483 E.06739
G2 X162.02 Y98.083 I-.618 J-.429 E.01246
G1 X163.886 Y99.949 E.07698
G3 X164.289 Y99.818 I.424 J.619 E.01251
G1 X162.087 Y97.617 E.09079
G1 X162.155 Y97.151 E.01373
G1 X164.755 Y99.751 E.10723
G1 X165.221 Y99.684 E.01374
G1 X162.333 Y96.796 E.1191
G1 X162.867 Y96.796 E.01556
G1 X165.423 Y99.353 E.10545
G1 X165.423 Y98.82 E.01556
G1 X163.4 Y96.796 E.08345
G1 X163.934 Y96.796 E.01556
G1 X165.423 Y98.286 E.06145
G1 X165.423 Y97.753 E.01556
G1 X164.467 Y96.796 E.03945
G1 X165 Y96.796 E.01556
G1 X165.593 Y97.389 E.02445
; WIPE_START
G1 F24000
G1 X165 Y96.796 E-.31854
G1 X164.467 Y96.796 E-.20268
G1 X164.911 Y97.241 E-.23878
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.17 J-.333 P1  F30000
G1 X160.538 Y112.602 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X164.865 Y116.929 E.17849
G1 X165.331 Y116.862 E.01374
G1 X163.086 Y114.617 E.0926
G1 X164.068 Y115.066 E.03149
G1 X165.423 Y116.421 E.05589
G1 X165.423 Y115.888 E.01556
G1 X164.71 Y115.174 E.02943
G1 X165.332 Y115.263 E.01834
G1 X165.593 Y115.524 E.01075
G1 X163.765 Y117.43 F30000
G1 F15000
G1 X144.19 Y97.855 E.80739
G1 X144.148 Y98.175 E.00943
G1 X144.098 Y98.296 E.00381
G1 X163.271 Y117.469 E.7908
G1 X162.905 Y117.636 E.01174
G1 X143.942 Y98.673 E.78213
G1 X143.786 Y99.05 E.01191
G1 X162.538 Y117.803 E.77346
G2 X162.208 Y118.006 I.18 J.665 E.01147
G1 X143.63 Y99.428 E.76626
G1 X143.473 Y99.805 E.01191
G1 X161.922 Y118.253 E.76091
G1 X161.636 Y118.5 E.01103
G1 X143.317 Y100.182 E.75556
G3 X143.115 Y100.514 I-.719 J-.211 E.01145
G1 X161.35 Y118.748 E.75209
G1 X161.064 Y118.995 E.01103
G1 X142.884 Y100.815 E.74985
G1 X142.652 Y101.117 E.01109
G1 X160.778 Y119.243 E.7476
G1 X160.732 Y119.282 E.00175
G1 X160.557 Y119.555 E.00947
G1 X142.421 Y101.419 E.74805
G1 X142.189 Y101.721 E.01109
G1 X160.349 Y119.88 E.749
G1 X160.14 Y120.205 E.01126
G1 X141.958 Y102.023 E.74995
G3 X141.694 Y102.292 I-.635 J-.359 E.01113
G1 X159.932 Y120.53 E.75225
G1 X159.723 Y120.855 E.01126
G1 X141.392 Y102.524 E.75609
G1 X141.09 Y102.755 E.01109
G1 X159.545 Y121.21 E.76118
G1 X159.424 Y121.623 E.01254
G1 X140.789 Y102.987 E.76864
G1 X140.487 Y103.219 E.01109
G1 X159.303 Y122.035 E.77609
G1 X159.182 Y122.447 E.01254
G1 X140.185 Y103.45 E.78355
G3 X139.859 Y103.657 I-.548 J-.503 E.0114
G1 X159.061 Y122.86 E.79203
G2 X158.991 Y123.323 I.755 J.351 E.01385
G1 X139.481 Y103.813 E.8047
G1 X139.104 Y103.969 E.01191
G1 X158.991 Y123.857 E.82027
G1 X158.991 Y124.39 E.01556
G1 X138.727 Y104.125 E.83583
G1 X138.349 Y104.281 E.01191
G1 X158.991 Y124.923 E.8514
G1 X158.991 Y125.217 E.00857
G1 X159.091 Y125.556 E.0103
G1 X137.972 Y104.437 E.87105
G1 X137.825 Y104.498 E.00464
G1 X137.537 Y104.536 E.00846
G1 X159.311 Y126.31 E.89808
G1 X159.532 Y127.064 E.02292
G1 X137.066 Y104.599 E.92662
G1 X136.595 Y104.661 E.01386
G1 X164.726 Y132.791 E1.16026
G1 X165.186 Y132.718 E.01359
G1 X163.356 Y130.888 E.07547
G1 X164.263 Y131.302 E.02906
G1 X164.31 Y131.308 E.00139
G1 X165.423 Y132.422 E.04594
G1 X165.423 Y131.889 E.01556
G1 X164.733 Y131.198 E.02849
G1 X164.414 Y133.013 F30000
G1 F15000
G1 X136.124 Y104.723 E1.16682
G1 X135.653 Y104.785 E.01386
G1 X163.9 Y133.032 E1.16506
G1 X163.547 Y133.212 E.01157
G1 X135.082 Y104.748 E1.17402
G1 X134.468 Y104.667 E.01809
G1 X163.193 Y133.392 E1.1848
G1 X162.84 Y133.572 E.01157
G1 X133.853 Y104.585 E1.19558
G1 X133.238 Y104.504 E.01809
G1 X162.486 Y133.752 E1.20635
G2 X162.168 Y133.967 I.171 J.597 E.01139
G1 X132.35 Y104.149 E1.22987
G1 X131.44 Y103.773 E.0287
G1 X161.901 Y134.234 E1.25638
G1 X161.635 Y134.5 E.011
G1 X124.941 Y97.807 E1.51344
G1 X125.004 Y97.336 E.01386
G1 X127.598 Y99.93 E.10699
G1 X127.219 Y99.018 E.02879
G1 X125.066 Y96.865 E.08882
G1 X125.075 Y96.796 E.00202
G1 X125.531 Y96.796 E.01329
G1 X126.863 Y98.129 E.05497
G1 X126.783 Y97.515 E.01806
G1 X126.064 Y96.796 E.02964
G1 X126.597 Y96.796 E.01556
G1 X126.899 Y97.098 E.01244
; WIPE_START
G1 F24000
G1 X126.597 Y96.796 E-.16213
G1 X126.064 Y96.796 E-.20268
G1 X126.783 Y97.515 E-.38624
G1 X126.786 Y97.538 E-.00895
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.298 J-1.18 P1  F30000
G1 X108.92 Y102.054 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X104.36 Y97.494 E.18806
G1 X104.422 Y97.023 E.01386
G1 X107.289 Y99.89 E.11825
G1 X106.914 Y98.981 E.02869
G1 X104.729 Y96.796 E.09011
G1 X105.262 Y96.796 E.01556
G1 X106.613 Y98.147 E.0557
G1 X106.532 Y97.532 E.01808
G1 X105.796 Y96.796 E.03036
G1 X106.329 Y96.796 E.01556
G1 X106.648 Y97.115 E.01315
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X106.329 Y96.796 E-.17133
G1 X105.796 Y96.796 E-.20268
G1 X106.514 Y97.515 E-.38599
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I-1.05 J.616 P1  F30000
G1 X189.5 Y239 Z1
G1 Z.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X156.500 Y219.500  
;--------------------
; CP EMPTY GRID START
; layer #5
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X191.371 
G1  Y240.871 
G1  X153.629  E1.4345
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834

; WIPE_START
G1 F24000
G1 X189.371 Y240.871 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.132 J-.446 P1  F30000
G1 X151.292 Y144.072 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05856
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
M73 P43 R14
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.99 Y146.857 I417.9 J418.218 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04543
G2 X114.443 Y146.132 I685.13 J1345.276 E.04534
G1 X113.422 Y147.151 E.0454
M73 P44 R14
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-80.632 J156.911 E.03556
G1 X98.017 Y146.249 E.0356
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09893
G1 X85.179 Y97.027 E.01791
G1 X85.352 Y98.346 E.04187
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07893
G2 X92.146 Y105.14 I399.05 J-958.93 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-614.812 J-1487.083 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I925.383 J-801.005 E.07263
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-67.648 J-234.355 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-179.154 J348.948 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.346 Y144.048 E.05989
G1 X151.5 Y144.42 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.459 Y144.427 E.0012
G2 X149.868 Y145.239 I131.056 J258.745 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I385.376 J385.651 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G2 X114.676 Y146.453 I628.219 J1233.533 E.03839
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-71.79 J139.747 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.1131
G1 X85.568 Y96.976 E.02662
G1 X85.734 Y98.244 E.03728
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I382.246 J-918.513 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-588.379 J-1423.121 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G1 X111.98 Y103.645 E.01833
G1 X113.5 Y104.274 E.04797
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I880.86 J-762.473 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-64.352 J-222.861 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-167.518 J326.242 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.559 Y144.411 E.04918
M204 S10000
; WIPE_START
G1 F24000
G1 X151.459 Y144.427 E-.03842
G1 X149.868 Y145.239 E-.67896
G1 X149.788 Y145.318 E-.04262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.769 J-.944 P1  F30000
G1 X147.726 Y146.998 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420075
G1 F15000
G1 X145.966 Y148.759 E.07261
G1 X145.992 Y148.926 E.00493
G1 X146.332 Y148.926 E.00992
G1 X147.036 Y148.222 E.02905
G1 X146.936 Y148.855 E.0187
G1 X146.696 Y149.095 E.00993
; WIPE_START
G1 F24000
G1 X146.936 Y148.855 E-.12934
G1 X147.036 Y148.222 E-.24359
G1 X146.332 Y148.926 E-.37844
G1 X146.309 Y148.926 E-.00863
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.011 J1.217 P1  F30000
G1 X164.831 Y149.095 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X165.423 Y148.503 E.02445
G1 X165.423 Y147.969 E.01556
G1 X164.467 Y148.926 E.03945
G1 X163.934 Y148.926 E.01556
G1 X165.423 Y147.436 E.06145
G1 X165.423 Y146.903 E.01556
G1 X163.4 Y148.926 E.08345
G1 X162.867 Y148.926 E.01556
G1 X165.423 Y146.369 E.10545
G1 X165.423 Y146.278 E.00267
G1 X165.042 Y146.217 E.01126
G1 X162.333 Y148.926 E.11172
G1 X161.8 Y148.926 E.01556
G1 X164.582 Y146.144 E.11473
G1 X164.214 Y146.086 E.01086
G1 X164.143 Y146.049 E.00233
G1 X161.267 Y148.926 E.11863
G1 X160.733 Y148.926 E.01556
G1 X163.789 Y145.87 E.12606
G1 X163.436 Y145.69 E.01157
G1 X160.2 Y148.926 E.13348
G1 X159.667 Y148.926 E.01556
G1 X163.083 Y145.51 E.1409
G1 X162.729 Y145.33 E.01157
G1 X159.47 Y148.589 E.13443
G1 X159.397 Y148.129 E.01359
G1 X162.376 Y145.15 E.12287
G1 X162.277 Y145.1 E.00324
G1 X162.084 Y144.908 E.00792
G1 X159.277 Y147.715 E.11579
G1 X159.097 Y147.361 E.01157
G1 X161.818 Y144.641 E.1122
G1 X161.551 Y144.375 E.011
G1 X158.918 Y147.008 E.1086
G1 X158.738 Y146.654 E.01157
G1 X161.284 Y144.108 E.10501
G1 X161.017 Y143.842 E.011
G1 X158.558 Y146.301 E.10142
G1 X158.441 Y146.07 E.00753
G1 X158.348 Y145.977 E.00384
G1 X160.75 Y143.575 E.09908
G1 X160.566 Y143.225 E.01152
G1 X158.081 Y145.711 E.10251
G1 X157.814 Y145.444 E.011
G1 X160.386 Y142.872 E.1061
G1 X160.207 Y142.519 E.01157
G1 X157.547 Y145.178 E.10969
G1 X157.28 Y144.912 E.011
G1 X160.027 Y142.165 E.11328
G1 X159.847 Y141.812 E.01157
G1 X157.013 Y144.645 E.11687
G1 X156.66 Y144.465 E.01156
G1 X159.717 Y141.407 E.1261
G1 X159.644 Y140.947 E.01359
G1 X156.307 Y144.285 E.13766
G1 X155.954 Y144.104 E.01156
G1 X159.571 Y140.487 E.14921
G1 X159.498 Y140.026 E.01359
G1 X155.601 Y143.924 E.16077
G1 X155.248 Y143.744 E.01156
G1 X159.425 Y139.566 E.17232
G1 X159.412 Y139.479 E.00257
G1 X159.493 Y138.965 E.01518
G1 X154.796 Y143.662 E.19372
G1 X154.336 Y143.589 E.01359
G1 X159.594 Y138.331 E.21685
G1 X159.694 Y137.697 E.01872
G1 X153.876 Y143.515 E.23998
G1 X153.416 Y143.442 E.01359
G1 X160.376 Y136.482 E.28708
G1 X165.006 Y132.919 F30000
G1 F15000
G1 X165.423 Y132.501 E.01721
G1 X165.423 Y131.968 E.01556
G1 X164.576 Y132.815 E.03494
G1 X164.214 Y132.872 E.0107
G1 X163.749 Y133.109 E.01524
G1 X165.393 Y131.465 E.06784
G1 X164.927 Y131.398 E.01374
G1 X152.854 Y143.471 E.49798
G1 X152.22 Y143.572 E.01873
G1 X164.461 Y131.33 E.50491
G3 X164.052 Y131.206 I.009 J-.761 E.01263
G1 X151.585 Y143.672 E.5142
G1 X151.232 Y143.728 E.01043
G1 X150.75 Y143.975 E.01581
G1 X163.686 Y131.039 E.53356
G1 X163.319 Y130.872 E.01174
G1 X145.893 Y148.298 E.71877
G1 X145.849 Y148.023 E.00813
G1 X145.777 Y147.881 E.00465
G1 X162.953 Y130.705 E.70844
G1 X162.587 Y130.537 E.01174
G1 X145.597 Y147.527 E.70076
G1 X145.417 Y147.174 E.01157
G1 X162.245 Y130.345 E.6941
G1 X161.96 Y130.098 E.01103
G1 X145.237 Y146.82 E.68974
G1 X145.057 Y146.467 E.01157
G1 X161.674 Y129.85 E.68538
G1 X161.388 Y129.602 E.01103
G1 X144.816 Y146.175 E.68356
G1 X144.549 Y145.908 E.011
G1 X161.103 Y129.355 E.68278
G1 X160.817 Y129.107 E.01103
G1 X144.282 Y145.642 E.68199
G1 X144.016 Y145.375 E.011
G1 X160.586 Y128.805 E.68345
G1 X160.377 Y128.48 E.01126
G1 X143.749 Y145.108 E.68584
G1 X143.689 Y145.049 E.00246
G1 X143.415 Y144.909 E.00898
G1 X160.168 Y128.156 E.69101
G1 X159.96 Y127.831 E.01126
G1 X143.061 Y144.729 E.69698
G1 X142.708 Y144.549 E.01157
G1 X159.751 Y127.506 E.70295
G1 X159.587 Y127.251 E.00884
G1 X159.561 Y127.163 E.00269
G1 X142.355 Y144.369 E.70969
G1 X141.992 Y144.198 E.01169
G1 X159.44 Y126.75 E.71966
G1 X159.319 Y126.338 E.01254
G1 X141.532 Y144.125 E.73368
G1 X141.071 Y144.053 E.0136
G1 X159.199 Y125.925 E.7477
G1 X159.078 Y125.512 E.01254
G1 X140.61 Y143.98 E.76171
G1 X140.193 Y143.914 E.01233
G1 X140.133 Y143.923 E.00175
G1 X158.991 Y125.066 E.77782
G1 X158.991 Y124.532 E.01556
G1 X139.5 Y144.024 E.80394
G1 X138.866 Y144.124 E.01871
G1 X158.991 Y123.999 E.83007
G1 X158.991 Y123.465 E.01556
G1 X137.757 Y144.7 E.87585
G1 X133.895 Y149.095 F30000
G1 F15000
G1 X134.457 Y148.533 E.02321
G1 X134.538 Y148.023 E.01506
G1 X134.646 Y147.811 E.00693
G1 X133.531 Y148.926 E.04598
G1 X133.422 Y148.926 E.00318
M73 P45 R14
G1 X133.364 Y148.559 E.01082
G1 X159.061 Y122.863 E1.05988
G1 X159.282 Y122.108 E.02293
G1 X133.273 Y148.117 E1.07275
G1 X133.093 Y147.764 E.01156
G1 X159.503 Y121.354 E1.08931
G1 X159.587 Y121.067 E.00872
G1 X160.18 Y120.144 E.032
G1 X132.913 Y147.411 E1.12465
G1 X132.732 Y147.057 E.01156
G1 X164.628 Y115.162 E1.31555
G1 X164.161 Y115.096 E.01375
G1 X132.552 Y146.704 E1.30373
G1 X132.529 Y146.658 E.00151
G1 X132.297 Y146.426 E.00956
G1 X163.786 Y114.937 E1.29881
G1 X163.42 Y114.77 E.01174
G1 X132.03 Y146.16 E1.29471
G1 X131.763 Y145.893 E.011
G1 X163.054 Y114.602 E1.29061
G1 X162.688 Y114.435 E.01174
G1 X131.497 Y145.626 E1.28651
G1 X131.323 Y145.453 E.00716
G1 X131.2 Y145.39 E.00404
G1 X162.322 Y114.268 E1.28366
G1 X162.064 Y114.15 E.00828
G1 X161.979 Y114.077 E.00325
G1 X130.846 Y145.21 E1.28412
G1 X130.493 Y145.03 E.01157
G1 X161.694 Y113.829 E1.28692
G1 X161.408 Y113.581 E.01103
G1 X130.139 Y144.85 E1.28972
G1 X129.78 Y144.676 E.01165
G1 X161.122 Y113.334 E1.29276
G1 X160.837 Y113.086 E.01103
G1 X129.319 Y144.603 E1.29997
G1 X128.859 Y144.531 E.0136
G1 X160.551 Y112.838 E1.30718
G1 X160.354 Y112.668 E.0076
G1 X160.289 Y112.567 E.0035
G1 X128.398 Y144.458 E1.31538
G2 X127.868 Y144.454 I-.27 J.815 E.01572
G1 X160.081 Y112.242 E1.32864
G1 X159.872 Y111.917 E.01126
G1 X127.235 Y144.555 E1.34618
G1 X126.601 Y144.655 E.01871
G1 X159.664 Y111.592 E1.36371
G1 X159.455 Y111.267 E.01126
G1 X125.631 Y145.092 E1.39513
G1 X124.92 Y145.453 E.02324
G1 X123.717 Y146.659 E.0497
G1 X123.355 Y147.368 E.02322
G1 X121.929 Y148.794 E.05882
G1 X121.856 Y148.334 E.01359
G1 X159.247 Y110.942 E1.54224
G3 X159.078 Y110.578 I.538 J-.47 E.01188
G1 X121.676 Y147.98 E1.54269
G1 X121.496 Y147.626 E.01157
G1 X158.957 Y110.166 E1.54511
G1 X158.836 Y109.753 E.01253
G1 X121.316 Y147.273 E1.54753
G1 X121.128 Y146.928 E.01147
G1 X158.714 Y109.341 E1.55029
G1 X158.593 Y108.929 E.01253
G1 X120.861 Y146.661 E1.55629
G1 X120.595 Y146.394 E.011
G1 X158.495 Y108.493 E1.56325
G1 X158.495 Y107.96 E.01556
G1 X120.328 Y146.127 E1.57425
G1 X120.061 Y145.861 E.011
G1 X158.495 Y107.427 E1.58525
G1 X158.495 Y106.893 E.01556
G1 X119.708 Y145.68 E1.59981
G1 X119.355 Y145.5 E.01157
G1 X158.495 Y106.36 E1.61439
G1 X158.707 Y105.615 E.02258
G1 X119.001 Y145.32 E1.63769
G1 X118.638 Y145.15 E.0117
G1 X158.929 Y104.86 E1.66182
G1 X159.133 Y104.165 E.02113
G1 X159.21 Y104.046 E.00413
G1 X118.179 Y145.076 E1.69236
G1 X117.719 Y145.003 E.01358
G1 X165.423 Y97.298 E1.96762
G1 X165.423 Y97.832 E.01556
G1 X162.817 Y100.438 E.10749
G1 X163.8 Y99.989 E.0315
G1 X165.423 Y98.365 E.06698
G1 X165.423 Y98.899 E.01556
G1 X164.54 Y99.782 E.03644
G1 X165.163 Y99.692 E.01836
G1 X165.593 Y99.262 E.01774
G1 X161.918 Y97.604 F30000
G1 F15000
G1 X162.725 Y96.796 E.03329
G1 X163.258 Y96.796 E.01556
G1 X162.028 Y98.027 E.05075
G1 X161.997 Y98.24 E.00627
G1 X161.702 Y98.886 E.02072
G1 X163.792 Y96.796 E.08619
G1 X164.325 Y96.796 E.01556
G1 X160.912 Y100.21 E.14079
; WIPE_START
G1 F24000
G1 X162.326 Y98.796 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.1 J-1.213 P1  F30000
G1 X144.093 Y97.294 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X144.59 Y96.796 E.02052
G1 X145.124 Y96.796 E.01556
G1 X144.209 Y97.711 E.03773
G1 X144.148 Y98.175 E.01365
G1 X144.056 Y98.397 E.00702
G1 X145.595 Y96.859 E.06346
G1 X145.661 Y97.326 E.01375
G1 X143.679 Y99.307 E.08175
G1 X143.303 Y100.218 E.02873
G1 X145.728 Y97.792 E.10004
G1 X145.799 Y98.255 E.01364
G1 X98.124 Y145.929 E1.96638
G1 X98.584 Y146.002 E.01359
G1 X145.966 Y98.621 E1.95431
G1 X146.134 Y98.987 E.01174
G1 X99.044 Y146.076 E1.94224
G3 X99.443 Y146.211 I-.01 J.682 E.01247
G1 X146.301 Y99.353 E1.93272
G1 X146.468 Y99.719 E.01174
G1 X99.796 Y146.391 E1.92506
G1 X100.149 Y146.571 E.01157
G1 X146.636 Y100.085 E1.91739
G1 X146.809 Y100.445 E.01166
G1 X100.462 Y146.792 E1.9116
G1 X100.729 Y147.058 E.011
G1 X147.056 Y100.731 E1.91082
G1 X147.304 Y101.017 E.01103
G1 X100.996 Y147.325 E1.91004
G1 X101.211 Y147.54 E.00888
G1 X101.246 Y147.608 E.00223
G1 X147.552 Y101.302 E1.90995
G1 X147.799 Y101.588 E.01103
G1 X101.426 Y147.962 E1.91274
G1 X101.606 Y148.315 E.01157
G1 X148.047 Y101.874 E1.91553
G1 X148.295 Y102.159 E.01103
G1 X101.777 Y148.677 E1.91867
G1 X101.816 Y148.926 E.00735
G1 X102.062 Y148.926 E.00715
G1 X103.038 Y147.95 E.04026
G1 X103.396 Y147.247 E.02301
G1 X104.38 Y146.261 E.04061
G1 X105.085 Y145.903 E.02306
G1 X148.597 Y102.39 E1.79472
G1 X148.922 Y102.599 E.01126
G1 X105.941 Y145.58 E1.7728
G1 X106.574 Y145.48 E.01869
G1 X149.247 Y102.807 E1.76008
G1 X149.572 Y103.016 E.01126
G1 X107.149 Y145.439 E1.74977
G1 X107.61 Y145.511 E.01361
G1 X149.896 Y103.225 E1.74415
G1 X150.221 Y103.433 E.01126
G1 X108.071 Y145.584 E1.73853
G3 X108.494 Y145.694 I.001 J.869 E.0129
G1 X150.588 Y103.599 E1.73621
G1 X151.001 Y103.721 E.01253
G1 X108.866 Y145.855 E1.73789
G1 X108.94 Y145.888 E.00237
G1 X109.097 Y145.694 E.00726
G1 X109.324 Y145.931 E.00955
G1 X151.413 Y103.842 E1.73599
G1 X151.825 Y103.963 E.01253
G1 X109.585 Y146.203 E1.74222
G1 X109.846 Y146.475 E.011
G1 X152.237 Y104.084 E1.74845
G1 X152.649 Y104.205 E.01253
G1 X110.108 Y146.747 E1.75468
G1 X110.369 Y147.019 E.011
G1 X153.17 Y104.218 E1.76536
G1 X153.703 Y104.218 E.01556
G1 X110.619 Y147.302 E1.77703
G1 X110.799 Y147.655 E.01156
G1 X154.236 Y104.218 E1.7916
G1 X154.77 Y104.218 E.01556
G1 X110.98 Y148.009 E1.80617
G1 X111.16 Y148.362 E.01156
G1 X155.388 Y104.134 E1.82422
G2 X156.143 Y103.912 I-23.057 J-79.793 E.02297
G1 X111.27 Y148.784 E1.85083
G1 X111.293 Y148.926 E.00417
G1 X111.663 Y148.926 E.01079
G1 X112.643 Y147.945 E.04046
G1 X113.149 Y146.952 E.03249
G1 X114.244 Y145.859 E.04514
G1 X115.234 Y145.354 E.0324
G1 X156.899 Y103.689 E1.71853
G1 X157.404 Y103.54 E.01533
G1 X157.901 Y103.221 E.01723
M73 P46 R14
G1 X116.03 Y145.091 E1.72698
G1 X116.665 Y144.99 E.01876
G1 X164.859 Y96.796 E1.98777
G1 X165.392 Y96.796 E.01556
G1 X117.096 Y145.092 E1.99202
; WIPE_START
G1 F24000
G1 X118.51 Y143.678 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.772 J-.941 P1  F30000
G1 X112.586 Y148.536 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X112.026 Y149.095 E.02307
; WIPE_START
G1 F24000
G1 X112.586 Y148.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.008 J-1.217 P1  F30000
G1 X102.917 Y148.603 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X102.425 Y149.095 E.02029
; WIPE_START
G1 F24000
G1 X102.917 Y148.603 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.482 J-1.118 P1  F30000
G1 X97.326 Y146.194 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X139.866 Y103.654 E1.75459
G1 X138.956 Y104.03 E.0287
G1 X96.578 Y146.409 E1.74796
G1 X94.567 Y148.42 F30000
G1 F15000
G1 X93.891 Y149.095 E.02786
G1 X93.358 Y149.095 F30000
G1 F15000
G1 X138.047 Y104.406 E1.84324
G1 X137.825 Y104.498 E.00701
G1 X137.36 Y104.56 E.01366
G1 X93.347 Y148.573 E1.81539
G1 X93.166 Y148.221 E.01156
G1 X136.746 Y104.641 E1.79748
G1 X136.131 Y104.722 E.01808
G1 X92.986 Y147.868 E1.77958
G1 X92.727 Y147.593 E.01101
G1 X135.516 Y104.804 E1.76488
G1 X135.044 Y104.743 E.0139
G1 X92.46 Y147.326 E1.75638
G1 X92.19 Y147.063 E.011
G1 X134.573 Y104.681 E1.7481
G1 X134.101 Y104.618 E.01386
G1 X91.837 Y146.883 E1.74326
G1 X91.483 Y146.703 E.01157
G1 X133.63 Y104.556 E1.73841
G1 X133.166 Y104.487 E.01368
G1 X91.095 Y146.559 E1.7353
G1 X90.634 Y146.486 E.0136
G1 X132.789 Y104.331 E1.73873
G1 X132.412 Y104.175 E.01191
G1 X90.17 Y146.416 E1.74228
G1 X89.537 Y146.516 E.01869
G1 X132.034 Y104.019 E1.75283
G1 X131.657 Y103.863 E.01191
G1 X88.754 Y146.766 E1.76959
G1 X88.154 Y147.071 E.01961
G1 X87.39 Y147.835 E.03151
G1 X87.086 Y148.434 E.01961
G1 X86.594 Y148.926 E.02028
G1 X86.06 Y148.926 E.01556
G1 X131.28 Y103.706 E1.86511
G3 X130.929 Y103.523 I.165 J-.742 E.01166
G1 X85.527 Y148.926 E1.87266
G1 X84.994 Y148.926 E.01556
G1 X130.628 Y103.292 E1.88222
G1 X130.326 Y103.06 E.01109
G1 X84.46 Y148.926 E1.89178
G1 X83.927 Y148.926 E.01556
G1 X130.024 Y102.828 E1.90133
G1 X129.723 Y102.597 E.01109
G1 X83.394 Y148.926 E1.91089
G1 X82.86 Y148.926 E.01556
G1 X129.421 Y102.365 E1.92045
G1 X129.185 Y102.184 E.00866
G1 X129.135 Y102.118 E.00243
G1 X90.77 Y140.482 E1.58237
G1 X91.36 Y139.36 E.03697
G1 X128.903 Y101.816 E1.54852
G1 X128.672 Y101.514 E.01109
G1 X91.697 Y138.488 E1.52504
G1 X91.871 Y137.781 E.02125
G1 X128.44 Y101.212 E1.50831
G1 X128.208 Y100.911 E.01109
G1 X92.046 Y137.073 E1.49157
G1 X92.22 Y136.366 E.02125
G1 X127.977 Y100.609 E1.47484
G1 X127.751 Y100.301 E.01113
G1 X92.222 Y135.83 E1.46544
G1 X92.222 Y135.297 E.01556
G1 X127.595 Y99.924 E1.45899
G1 X127.439 Y99.547 E.0119
G1 X92.222 Y134.763 E1.45254
G1 X92.222 Y134.23 E.01556
G1 X127.282 Y99.17 E1.44609
G1 X127.126 Y98.793 E.0119
G1 X92.218 Y133.701 E1.43981
G1 X92.113 Y133.273 E.01286
G1 X126.969 Y98.416 E1.4377
G3 X126.847 Y98.005 I.703 J-.433 E.01265
G1 X92.007 Y132.845 E1.437
G1 X91.902 Y132.417 E.01286
G1 X120.142 Y104.176 E1.1648
G1 X119.232 Y104.553 E.02871
G1 X91.796 Y131.989 E1.13163
G1 X91.691 Y131.561 E.01286
G1 X118.323 Y104.929 E1.09845
G1 X118.199 Y104.98 E.00392
G1 X117.668 Y105.05 E.01561
G1 X91.581 Y131.137 E1.07598
G1 X91.398 Y130.787 E.01152
G1 X117.054 Y105.131 E1.05821
G1 X116.439 Y105.212 E.01807
G1 X91.214 Y130.438 E1.04044
G1 X91.031 Y130.088 E.01152
G1 X115.825 Y105.293 E1.02268
G1 X115.755 Y105.302 E.00207
G1 X115.337 Y105.247 E.01228
G1 X90.847 Y129.738 E1.01013
G1 X90.663 Y129.388 E.01152
G1 X114.866 Y105.185 E.99827
G1 X114.395 Y105.123 E.01386
G1 X90.48 Y129.038 E.9864
G2 X90.271 Y128.714 I-.761 J.261 E.01136
G1 X113.924 Y105.061 E.97559
G1 X113.452 Y104.999 E.01386
G1 X90.02 Y128.431 E.96649
G1 X89.769 Y128.149 E.01102
G1 X113.047 Y104.871 E.96011
G1 X112.67 Y104.715 E.01191
G1 X89.519 Y127.866 E.95489
G1 X89.268 Y127.583 E.01102
G1 X112.292 Y104.559 E.94966
G1 X111.915 Y104.403 E.01191
G1 X89.017 Y127.301 E.94444
G1 X88.766 Y127.018 E.01102
G1 X111.538 Y104.247 E.93922
G1 X111.16 Y104.091 E.01191
G1 X88.49 Y126.761 E.93506
G1 X88.174 Y126.543 E.01118
G1 X110.833 Y103.885 E.93458
G1 X110.531 Y103.653 E.0111
G1 X87.859 Y126.325 E.93514
G1 X87.543 Y126.108 E.01118
G1 X110.229 Y103.422 E.9357
G1 X109.928 Y103.19 E.0111
M73 P47 R14
G1 X87.228 Y125.89 E.93627
G1 X86.912 Y125.672 E.01118
G1 X109.626 Y102.959 E.93683
G1 X109.324 Y102.727 E.0111
G1 X86.597 Y125.454 E.93739
G2 X86.245 Y125.273 I-.544 J.625 E.01167
G1 X109.035 Y102.483 E.94001
G1 X108.803 Y102.181 E.01109
G1 X85.858 Y125.126 E.9464
G1 X85.471 Y124.979 E.01206
G1 X108.572 Y101.879 E.95278
G1 X108.34 Y101.578 E.01109
G1 X85.085 Y124.832 E.95917
G1 X84.698 Y124.686 E.01206
G1 X108.108 Y101.276 E.96556
G1 X107.876 Y100.974 E.01109
G1 X84.312 Y124.539 E.97194
G1 X83.978 Y124.412 E.0104
G1 X83.913 Y124.404 E.00192
G1 X87.043 Y121.275 E.12909
G1 X86.213 Y121.847 E.02941
G1 X85.767 Y122.016 E.0139
G1 X83.437 Y124.347 E.09611
G1 X82.962 Y124.289 E.01398
G1 X84.907 Y122.343 E.08025
G1 X84.047 Y122.67 E.02684
G1 X82.486 Y124.231 E.06438
G1 X82.296 Y124.208 E.00558
G1 X82.296 Y123.888 E.00935
G1 X83.384 Y122.799 E.04488
G1 X82.777 Y122.873 E.01784
G1 X82.126 Y123.524 E.02684
G1 X89.292 Y119.025 F30000
G1 F15000
G1 X107.645 Y100.673 E.75695
G1 X107.576 Y100.583 E.00331
G1 X107.466 Y100.318 E.00836
G1 X90.732 Y117.052 E.69022
G1 X91.124 Y116.305 E.0246
G1 X91.182 Y116.068 E.00711
G1 X107.31 Y99.94 E.66522
G1 X107.154 Y99.563 E.01191
G1 X91.356 Y115.361 E.65159
G1 X91.531 Y114.653 E.02126
G1 X106.998 Y99.186 E.63797
G1 X106.842 Y98.808 E.01191
G1 X91.705 Y113.945 E.62434
G1 X91.726 Y113.861 E.00254
G1 X91.726 Y113.391 E.0137
G1 X106.686 Y98.431 E.61705
G1 X106.633 Y98.303 E.00403
G1 X106.592 Y97.991 E.00917
G1 X91.726 Y112.858 E.61317
G1 X91.726 Y112.324 E.01556
G1 X99.563 Y104.487 E.32324
G1 X98.652 Y104.865 E.02877
G1 X91.726 Y111.791 E.28566
G1 X91.726 Y111.344 E.01304
G1 X91.709 Y111.274 E.00208
G1 X97.741 Y105.243 E.24879
G1 X97.205 Y105.464 E.01693
G1 X96.953 Y105.498 E.00741
G1 X91.604 Y110.846 E.22062
G1 X91.498 Y110.419 E.01285
G1 X96.338 Y105.578 E.19964
G1 X95.724 Y105.659 E.01806
G1 X91.393 Y109.991 E.17866
G1 X91.287 Y109.563 E.01285
G1 X95.11 Y105.74 E.15768
G1 X94.633 Y105.802 E.01405
G1 X94.528 Y105.789 E.00308
G1 X91.182 Y109.135 E.13801
G2 X91.041 Y108.742 I-.867 J.089 E.01229
G1 X94.056 Y105.727 E.12436
G1 X93.585 Y105.665 E.01387
G1 X90.858 Y108.392 E.11249
G1 X90.674 Y108.042 E.01152
G1 X93.114 Y105.603 E.10061
G1 X92.642 Y105.541 E.01387
G1 X90.491 Y107.692 E.08874
G1 X90.307 Y107.343 E.01152
G1 X92.171 Y105.479 E.07686
G1 X92.059 Y105.464 E.00329
G1 X91.771 Y105.345 E.00909
G1 X90.124 Y106.993 E.06795
M73 P47 R13
G1 X89.935 Y106.648 E.01146
G1 X91.394 Y105.189 E.06017
G1 X91.017 Y105.033 E.0119
G1 X89.684 Y106.365 E.05496
G1 X89.434 Y106.083 E.01102
G1 X90.64 Y104.876 E.04976
G1 X90.263 Y104.72 E.0119
G1 X89.183 Y105.8 E.04455
G1 X88.932 Y105.517 E.01102
G1 X89.886 Y104.563 E.03934
G3 X89.539 Y104.377 I.176 J-.742 E.01162
G1 X88.681 Y105.235 E.03538
G1 X88.431 Y104.952 E.01102
G1 X89.238 Y104.145 E.03328
G1 X88.936 Y103.914 E.01109
G1 X88.153 Y104.696 E.03227
G1 X87.838 Y104.478 E.01118
G1 X88.634 Y103.682 E.03283
G1 X88.332 Y103.451 E.01109
G1 X87.523 Y104.26 E.03339
G1 X87.207 Y104.042 E.01118
G1 X88.03 Y103.219 E.03395
G1 X87.728 Y102.987 E.01109
G1 X86.892 Y103.824 E.03451
G1 X86.576 Y103.606 E.01118
G1 X87.467 Y102.715 E.03675
G1 X87.236 Y102.413 E.01109
G1 X86.261 Y103.388 E.0402
G1 X86.213 Y103.355 E.00171
G1 X85.885 Y103.231 E.01022
G1 X87.004 Y102.112 E.04615
G1 X86.772 Y101.81 E.01109
G1 X85.498 Y103.084 E.05254
G1 X85.112 Y102.937 E.01206
G1 X86.54 Y101.508 E.05894
G1 X86.309 Y101.207 E.01109
G1 X84.725 Y102.791 E.06534
G1 X84.338 Y102.644 E.01206
G1 X86.077 Y100.905 E.07173
G1 X86.022 Y100.833 E.00265
G1 X85.903 Y100.546 E.00906
G1 X83.951 Y102.498 E.0805
G1 X83.858 Y102.462 E.0029
G1 X83.497 Y102.418 E.01061
G1 X85.747 Y100.169 E.09279
G1 X85.59 Y99.792 E.01191
G1 X83.021 Y102.361 E.10596
G1 X82.546 Y102.303 E.01397
G1 X85.434 Y99.415 E.11913
G1 X85.278 Y99.037 E.01191
G1 X82.296 Y102.019 E.12299
G1 X82.296 Y101.486 E.01555
G1 X85.122 Y98.66 E.11655
G3 X85.003 Y98.246 I.713 J-.429 E.01272
G1 X82.296 Y100.953 E.11165
G1 X82.296 Y100.419 E.01555
G1 X84.941 Y97.774 E.1091
G1 X84.879 Y97.303 E.01387
G1 X82.296 Y99.886 E.10655
G1 X82.296 Y99.353 E.01555
G1 X84.817 Y96.831 E.10399
G1 X84.812 Y96.796 E.00103
G1 X84.319 Y96.796 E.0144
G1 X82.296 Y98.819 E.08344
G1 X82.295 Y98.286 E.01555
G1 X83.785 Y96.796 E.06145
G1 X83.252 Y96.796 E.01556
G1 X82.295 Y97.753 E.03945
G1 X82.295 Y97.22 E.01555
G1 X82.888 Y96.627 E.02445
; WIPE_START
G1 F24000
G1 X82.295 Y97.22 E-.31858
G1 X82.295 Y97.753 E-.20266
G1 X82.74 Y97.309 E-.23876
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.262 J1.188 P1  F30000
G1 X102.409 Y101.641 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X106.53 Y97.52 E.16999
G1 X106.468 Y97.049 E.01386
G1 X103.638 Y99.878 E.11671
G1 X104.014 Y98.969 E.0287
G1 X106.187 Y96.796 E.08962
G1 X105.654 Y96.796 E.01556
G1 X104.269 Y98.181 E.0571
G1 X104.351 Y97.566 E.01808
G1 X105.12 Y96.796 E.03175
G1 X104.587 Y96.796 E.01556
G1 X104.235 Y97.149 E.01453
; WIPE_START
G1 F24000
G1 X104.587 Y96.796 E-.18929
G1 X105.12 Y96.796 E-.20268
G1 X104.435 Y97.481 E-.36803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.198 J1.201 P1  F30000
G1 X123.667 Y100.652 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X126.785 Y97.533 E.12861
G1 X126.723 Y97.062 E.01387
G1 X124.449 Y99.336 E.0938
G1 X124.825 Y98.427 E.02869
G1 X126.455 Y96.796 E.06726
G1 X125.922 Y96.796 E.01556
G1 X124.946 Y97.772 E.04026
G1 X125.027 Y97.158 E.01808
G1 X125.558 Y96.627 E.02191
; WIPE_START
G1 F24000
G1 X125.027 Y97.158 E-.28552
G1 X124.946 Y97.772 E-.23551
G1 X125.391 Y97.328 E-.23897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.627 J1.043 P1  F30000
G1 X161.358 Y118.965 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X165.094 Y115.229 E.1541
G1 X165.423 Y115.276 E.0097
G1 X165.423 Y115.433 E.00458
G1 X163.486 Y117.371 E.07991
G1 X164.263 Y117.016 E.02489
G1 X164.392 Y116.998 E.00382
G1 X165.423 Y115.967 E.04253
G1 X165.423 Y116.5 E.01556
G1 X164.815 Y117.108 E.02508
; WIPE_START
G1 F24000
G1 X165.423 Y116.5 E-.32681
G1 X165.423 Y115.967 E-.20268
G1 X164.994 Y116.396 E-.2305
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.735 J-.97 P1  F30000
G1 X123.188 Y148.068 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X122.16 Y149.095 E.04238
; WIPE_START
G1 F24000
G1 X123.188 Y148.068 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.03 J-1.217 P1  F30000
G1 X82.157 Y149.095 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X86.711 Y144.541 E.18784
G1 X86.445 Y144.725 E.00944
G1 X85.718 Y145.001 E.02268
G1 X82.296 Y148.423 E.14113
G1 X82.296 Y147.89 E.01556
G1 X84.858 Y145.328 E.10566
G1 X83.998 Y145.654 E.02683
G1 X82.296 Y147.356 E.07019
G1 X82.296 Y146.823 E.01556
G1 X83.385 Y145.734 E.04492
G1 X82.778 Y145.807 E.01783
G1 X82.126 Y146.459 E.02688
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X82.778 Y145.807 E-.35028
G1 X83.385 Y145.734 E-.23233
G1 X83.055 Y146.064 E-.17738
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I-.8 J.917 P1  F30000
G1 X189.5 Y239 Z1.2
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X156.500 Y219.500  
;--------------------
; CP EMPTY GRID START
; layer #6
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486

; WIPE_START
G1 F24000
G1 X188.914 Y240.414 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.134 J-.443 P1  F30000
G1 X151.291 Y144.073 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05854
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05526
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.989 Y146.857 I378.014 J378.403 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
M73 P48 R13
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04542
G1 X114.443 Y146.132 E.04534
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-77.265 J150.31 E.03556
G1 X98.017 Y146.249 E.03559
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09894
G1 X85.22 Y97.338 E.02778
G1 X85.352 Y98.346 E.032
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07893
G2 X92.146 Y105.14 I362.604 J-871.041 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-557.937 J-1349.81 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I729.877 J-631.467 E.07263
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-65.292 J-226.329 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-169.958 J330.924 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.345 Y144.048 E.05991
G1 X151.565 Y144.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.459 Y144.427 E.00311
G2 X149.868 Y145.239 I127.88 J252.52 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I348.538 J348.883 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G2 X114.676 Y146.453 I479.975 J942.801 E.0384
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-68.769 J133.821 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.11311
G1 X85.608 Y97.287 E.03576
G1 X85.734 Y98.244 E.02814
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I347.675 J-835.156 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-535.358 J-1295.158 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G2 X113.5 Y104.274 I689.731 J-1664.41 E.0663
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I694.205 J-600.602 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-62.118 J-215.259 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-158.876 J309.309 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.624 Y144.401 E.04727
M204 S10000
; WIPE_START
G1 F24000
G1 X151.459 Y144.427 E-.06332
G1 X149.868 Y145.239 E-.67897
G1 X149.835 Y145.272 E-.01771
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.19 J1.202 P1  F30000
G1 X155.969 Y144.302 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420073
G1 F15000
G1 X116.827 Y105.161 E1.61441
G1 X116.356 Y105.223 E.01386
G1 X154.794 Y143.661 E1.58541
G1 X154.16 Y143.561 E.01872
G1 X115.885 Y105.285 E1.57869
G1 X115.755 Y105.302 E.00383
G1 X115.31 Y105.244 E.01308
G1 X153.526 Y143.46 E1.57625
G1 X153.225 Y143.412 E.00889
G1 X152.983 Y143.45 E.00714
G1 X114.696 Y105.163 E1.5792
G1 X114.081 Y105.082 E.01807
G1 X152.523 Y143.523 E1.58555
G1 X152.063 Y143.597 E.01359
G1 X113.467 Y105.001 E1.59191
G1 X113.311 Y104.98 E.00459
G1 X112.632 Y104.7 E.02142
G1 X151.602 Y143.67 E1.60735
G1 X151.232 Y143.728 E.01092
G1 X151.163 Y143.764 E.00227
G1 X111.723 Y104.323 E1.62675
G1 X111.033 Y104.038 E.02176
G1 X110.479 Y103.613 E.02038
G1 X150.81 Y143.944 E1.66349
G1 X150.457 Y144.124 E.01156
G1 X104.298 Y97.965 E1.90386
G1 X104.235 Y98.436 E.01384
G1 X150.104 Y144.304 E1.89189
G1 X149.75 Y144.485 E.01156
G1 X104.079 Y98.813 E1.88376
G1 X103.923 Y99.191 E.01191
G1 X149.407 Y144.674 E1.87602
G1 X149.14 Y144.941 E.011
G1 X103.767 Y99.568 E1.87145
G1 X103.611 Y99.945 E.01191
G1 X148.873 Y145.207 E1.86687
G1 X148.606 Y145.474 E.011
G1 X103.455 Y100.323 E1.8623
G1 X103.299 Y100.7 E.01191
G1 X148.339 Y145.74 E1.85772
G1 X148.072 Y146.007 E.011
G1 X103.094 Y101.028 E1.85517
G1 X102.862 Y101.33 E.01109
G1 X147.871 Y146.339 E1.85645
G1 X147.691 Y146.693 E.01157
G1 X102.63 Y101.632 E1.85858
G1 X102.399 Y101.933 E.01109
G1 X147.511 Y147.046 E1.86071
G1 X147.331 Y147.399 E.01157
G1 X102.167 Y102.235 E1.86284
G1 X101.935 Y102.537 E.01109
G1 X147.151 Y147.753 E1.86496
G1 X147.092 Y147.869 E.0038
G1 X147.043 Y148.178 E.00913
G1 X101.704 Y102.838 E1.87007
G1 X101.664 Y102.89 E.00191
G1 X101.414 Y103.082 E.00918
G1 X143.06 Y144.728 E1.71774
G1 X141.997 Y144.199 E.03463
G1 X101.112 Y103.314 E1.68635
G1 X100.81 Y103.545 E.01109
G1 X141.364 Y144.099 E1.67268
G1 X140.731 Y143.999 E.0187
G1 X100.508 Y103.777 E1.65901
G1 X100.206 Y104.008 E.01109
G1 X140.123 Y143.925 E1.6464
G1 X139.663 Y143.998 E.0136
G1 X99.905 Y104.24 E1.63985
G1 X99.602 Y104.471 E.0111
G1 X139.202 Y144.071 E1.63332
M73 P49 R13
G1 X138.742 Y144.143 E.0136
G1 X99.225 Y104.627 E1.62988
G1 X98.848 Y104.784 E.0119
G1 X138.299 Y144.234 E1.62715
G1 X137.945 Y144.414 E.01157
G1 X98.471 Y104.94 E1.62813
G1 X98.094 Y105.096 E.0119
G1 X137.592 Y144.594 E1.6291
G1 X137.238 Y144.774 E.01157
G1 X97.717 Y105.252 E1.63009
G1 X97.34 Y105.408 E.01191
G1 X136.885 Y144.954 E1.63107
G2 X136.572 Y145.175 I.183 J.591 E.01135
G1 X96.902 Y105.504 E1.63624
G1 X96.431 Y105.566 E.01387
G1 X136.306 Y145.441 E1.64468
G1 X136.039 Y145.708 E.011
G1 X95.959 Y105.628 E1.65312
G1 X95.488 Y105.69 E.01387
G1 X135.772 Y145.975 E1.66157
G1 X135.506 Y146.241 E.011
G1 X95.016 Y105.752 E1.67001
G1 X94.633 Y105.802 E.01129
G1 X94.518 Y105.787 E.00336
G1 X135.286 Y146.555 E1.68147
G1 X135.106 Y146.908 E.01157
G1 X93.904 Y105.707 E1.69938
G1 X93.29 Y105.626 E.01806
G1 X134.926 Y147.261 E1.71728
G1 X134.746 Y147.615 E.01157
G1 X92.676 Y105.546 E1.73518
G1 X92.062 Y105.465 E.01806
G1 X134.566 Y147.968 E1.75308
G1 X134.538 Y148.023 E.00179
G1 X134.476 Y148.412 E.0115
G1 X91.154 Y105.09 E1.78686
G1 X90.242 Y104.711 E.0288
G1 X130.632 Y145.101 E1.66591
G1 X129.805 Y144.68 E.02705
G1 X129.654 Y144.656 E.00446
G1 X88.83 Y103.832 E1.68382
G1 X87.602 Y102.89 E.04514
G1 X86.655 Y101.658 E.04532
G1 X82.295 Y97.298 E.17984
G1 X82.295 Y96.796 E.01462
G1 X82.327 Y96.796 E.00094
G1 X85.78 Y100.249 E.14241
G1 X85.402 Y99.338 E.02875
G1 X82.861 Y96.796 E.10484
G1 X83.394 Y96.796 E.01556
G1 X85.027 Y98.429 E.06735
G1 X84.946 Y97.815 E.01806
G1 X83.927 Y96.796 E.04202
G1 X84.461 Y96.796 E.01556
G1 X85.063 Y97.398 E.02482
G1 X82.126 Y101.929 F30000
G1 F15000
G1 X82.494 Y102.296 E.01515
G1 X83.101 Y102.37 E.01784
G1 X82.296 Y101.565 E.0332
G1 X82.296 Y101.032 E.01556
G1 X83.708 Y102.444 E.05824
G1 X83.858 Y102.462 E.00442
G1 X84.504 Y102.707 E.02016
G1 X82.296 Y100.498 E.0911
G1 X82.296 Y99.965 E.01556
G1 X85.363 Y103.033 E.12654
G1 X86.232 Y103.368 E.02716
G1 X82.295 Y99.432 E.16237
G1 X82.295 Y98.898 E.01556
G1 X127.854 Y144.457 E1.8791
G3 X128.387 Y144.456 I.268 J.82 E.01579
G1 X82.295 Y98.365 E1.90107
G1 X82.295 Y97.831 E.01556
G1 X129.224 Y144.76 E1.93563
G1 X127.542 Y144.678 F30000
G1 F15000
G1 X90.418 Y107.554 E1.53119
G1 X91.007 Y108.676 E.03696
G1 X126.933 Y144.602 E1.4818
G1 X126.472 Y144.675 E.0136
G1 X91.264 Y109.466 E1.45222
G1 X91.438 Y110.174 E.02126
G1 X126.111 Y144.848 E1.43013
G1 X125.758 Y145.027 E.01157
G1 X91.612 Y110.882 E1.40835
G1 X91.726 Y111.344 E.01387
G1 X91.726 Y111.529 E.00541
G1 X125.404 Y145.207 E1.38907
G1 X125.05 Y145.387 E.01157
G1 X91.726 Y112.062 E1.37448
G1 X91.726 Y112.596 E.01556
G1 X124.752 Y145.621 E1.36217
G1 X124.485 Y145.888 E.011
G1 X91.726 Y113.129 E1.35118
G1 X91.726 Y113.662 E.01556
G1 X124.219 Y146.155 E1.34019
G1 X123.953 Y146.422 E.011
G1 X91.66 Y114.13 E1.33194
G1 X91.554 Y114.558 E.01285
G1 X123.696 Y146.699 E1.32571
G1 X123.516 Y147.052 E.01156
G1 X91.449 Y114.985 E1.32262
G1 X91.343 Y115.413 E.01285
G1 X123.335 Y147.405 E1.31954
G1 X123.155 Y147.759 E.01156
G1 X91.238 Y115.841 E1.31645
G1 X91.133 Y116.269 E.01285
G1 X122.975 Y148.112 E1.31337
G1 X122.942 Y148.176 E.00211
G1 X122.883 Y148.553 E.01111
G1 X90.956 Y116.626 E1.31685
G1 X90.772 Y116.975 E.01152
G1 X119.237 Y145.44 E1.17405
G1 X118.68 Y145.157 E.01822
G1 X118.37 Y145.107 E.00914
G1 X90.588 Y117.325 E1.14589
G1 X90.405 Y117.675 E.01152
G1 X117.735 Y145.005 E1.12726
G1 X117.114 Y144.918 E.0183
G1 X90.221 Y118.025 E1.10921
G1 X90.038 Y118.375 E.01152
G1 X116.654 Y144.991 E1.09782
G1 X116.195 Y145.065 E.01358
G1 X89.818 Y118.688 E1.08793
G1 X89.567 Y118.971 E.01102
G1 X115.735 Y145.139 E1.07931
G1 X115.621 Y145.157 E.00336
G1 X115.355 Y145.292 E.00871
G1 X89.316 Y119.253 E1.074
G1 X89.066 Y119.536 E.01102
G1 X115.002 Y145.473 E1.06976
G1 X114.649 Y145.653 E.01156
G1 X88.815 Y119.819 E1.06553
G1 X88.564 Y120.102 E.01102
G1 X114.296 Y145.833 E1.0613
G1 X114.244 Y145.859 E.00167
G1 X114.016 Y146.087 E.00941
G1 X88.314 Y120.384 E1.06012
G1 X88.006 Y120.61 E.01113
G1 X113.749 Y146.353 E1.0618
G1 X113.482 Y146.619 E.011
G1 X87.69 Y120.828 E1.0638
G1 X87.375 Y121.045 E.01118
G1 X113.215 Y146.886 E1.06581
G1 X113.149 Y146.952 E.00274
G1 X113.014 Y147.218 E.00869
G1 X87.059 Y121.263 E1.07051
G1 X86.744 Y121.481 E.01118
G1 X112.834 Y147.571 E1.07611
G1 X112.654 Y147.925 E.01157
M73 P50 R13
G1 X86.428 Y121.699 E1.0817
G3 X86.09 Y121.894 I-.567 J-.591 E.0115
G1 X112.474 Y148.278 E1.08823
G1 X112.446 Y148.333 E.00181
G1 X112.385 Y148.722 E.01148
G1 X85.703 Y122.041 E1.1005
G1 X85.317 Y122.188 E.01206
G1 X108.975 Y145.846 E.97579
G1 X108.94 Y145.888 E.00158
G1 X108.338 Y145.626 E.01916
G1 X108.2 Y145.604 E.00409
G1 X84.93 Y122.335 E.95976
G1 X84.544 Y122.481 E.01206
G1 X107.567 Y145.504 E.9496
G1 X106.993 Y145.414 E.01695
G1 X106.95 Y145.421 E.00126
G1 X84.157 Y122.628 E.9401
G1 X83.859 Y122.742 E.00932
G1 X83.751 Y122.755 E.00317
G1 X86.283 Y125.287 E.10446
G1 X85.423 Y124.961 E.02683
G1 X83.275 Y122.813 E.0886
G1 X82.799 Y122.871 E.01397
G1 X84.563 Y124.634 E.07275
G1 X83.978 Y124.412 E.01824
G1 X83.784 Y124.389 E.00571
G1 X82.324 Y122.928 E.06023
G1 X82.296 Y122.932 E.00081
G1 X82.296 Y123.434 E.01465
G1 X83.177 Y124.315 E.03634
G1 X82.57 Y124.241 E.01783
G1 X82.126 Y123.798 E.01831
; WIPE_START
G1 F24000
G1 X82.57 Y124.241 E-.23851
G1 X83.177 Y124.315 E-.23234
G1 X82.639 Y123.777 E-.28916
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J.012 P1  F30000
G1 X82.889 Y149.095 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X82.296 Y148.503 E.02445
G1 X82.296 Y147.969 E.01556
G1 X83.253 Y148.926 E.03945
G1 X83.786 Y148.926 E.01556
G1 X82.296 Y147.436 E.06145
G1 X82.296 Y146.902 E.01556
G1 X84.319 Y148.926 E.08345
G1 X84.853 Y148.926 E.01556
G1 X82.296 Y146.369 E.10545
G1 X82.296 Y145.866 E.01468
G1 X82.323 Y145.863 E.00079
G1 X85.386 Y148.926 E.12634
G1 X85.919 Y148.926 E.01556
G1 X82.799 Y145.805 E.12872
G1 X83.274 Y145.747 E.01398
G1 X86.453 Y148.926 E.1311
G1 X86.881 Y148.926 E.0125
G1 X86.896 Y148.835 E.00268
G1 X83.75 Y145.69 E.12974
G2 X84.179 Y145.586 I.004 J-.921 E.01301
G1 X87.066 Y148.472 E.11906
G1 X87.246 Y148.119 E.01157
G1 X84.566 Y145.439 E.11054
G1 X84.953 Y145.292 E.01206
G1 X87.443 Y147.782 E.10271
G1 X87.709 Y147.516 E.011
G1 X85.339 Y145.145 E.09777
G1 X85.726 Y144.998 E.01206
G1 X87.976 Y147.249 E.09282
G1 X88.154 Y147.071 E.00735
G1 X88.272 Y147.011 E.00384
G1 X86.112 Y144.852 E.08907
G1 X86.489 Y144.695 E.0119
G1 X88.625 Y146.831 E.08812
G1 X88.979 Y146.651 E.01157
G1 X86.804 Y144.477 E.08969
G1 X87.12 Y144.259 E.01118
G1 X89.398 Y146.537 E.09398
G1 X89.859 Y146.465 E.0136
G1 X87.435 Y144.041 E.09997
G1 X87.751 Y143.823 E.01118
G1 X90.372 Y146.444 E.1081
G1 X91.005 Y146.544 E.0187
G1 X88.066 Y143.605 E.12122
G1 X88.382 Y143.388 E.01118
G1 X93.92 Y148.926 E.22842
G1 X94.219 Y148.926 E.00871
G1 X94.251 Y148.723 E.00598
G1 X88.681 Y143.153 E.22976
G1 X88.931 Y142.87 E.01102
G1 X94.412 Y148.351 E.22604
G1 X94.592 Y147.997 E.01157
G1 X89.182 Y142.588 E.22313
G1 X89.433 Y142.305 E.01102
G1 X94.772 Y147.644 E.22022
G1 X94.825 Y147.54 E.00339
G1 X95.013 Y147.352 E.00778
G1 X89.683 Y142.022 E.21983
G1 X89.934 Y141.74 E.01102
G1 X95.28 Y147.085 E.22049
G1 X95.546 Y146.819 E.011
G1 X90.185 Y141.457 E.22115
G2 X90.417 Y141.156 I-.494 J-.62 E.0112
G1 X95.851 Y146.589 E.22412
G1 X96.204 Y146.409 E.01157
G1 X90.6 Y140.806 E.23112
G1 X90.784 Y140.456 E.01152
G1 X96.557 Y146.229 E.23812
G1 X96.797 Y146.107 E.00786
G1 X96.945 Y146.083 E.00435
G1 X90.968 Y140.106 E.24653
G1 X91.151 Y139.756 E.01152
G1 X97.405 Y146.01 E.25792
G1 X97.864 Y145.936 E.01358
G1 X91.335 Y139.407 E.26932
G1 X91.518 Y139.057 E.01152
G1 X98.441 Y145.98 E.28553
G1 X99.076 Y146.081 E.01874
G1 X91.655 Y138.66 E.30607
G1 X91.76 Y138.232 E.01286
G1 X102.454 Y148.926 E.44107
G1 X102.694 Y148.926 E.00701
G1 X102.735 Y148.673 E.00747
G1 X91.866 Y137.804 E.44829
G1 X91.971 Y137.376 E.01286
G1 X102.871 Y148.276 E.44959
G1 X103.051 Y147.923 E.01156
G1 X92.076 Y136.948 E.45267
G1 X92.182 Y136.52 E.01286
G1 X103.232 Y147.57 E.45576
G1 X103.419 Y147.224 E.01147
G1 X92.222 Y136.027 E.46184
G1 X92.222 Y135.493 E.01556
G1 X103.686 Y146.957 E.47282
G1 X103.952 Y146.69 E.011
G1 X92.222 Y134.96 E.48381
G1 X92.222 Y134.427 E.01556
G1 X104.218 Y146.423 E.49479
G3 X104.519 Y146.19 I.506 J.343 E.01128
G1 X92.222 Y133.893 E.50719
G1 X92.222 Y133.718 E.00513
G1 X92.105 Y133.243 E.01425
G1 X104.873 Y146.01 E.5266
G1 X105.226 Y145.831 E.01157
G1 X91.931 Y132.536 E.54837
G1 X91.757 Y131.828 E.02125
G1 X105.58 Y145.651 E.57014
G1 X105.621 Y145.63 E.00135
G1 X106.028 Y145.566 E.01202
G1 X91.561 Y131.099 E.59669
G1 X90.972 Y129.977 E.03697
G1 X106.637 Y145.642 E.64612
G1 X102.09 Y149.095 F30000
G1 F15000
G1 X101.524 Y148.529 E.02334
; WIPE_START
G1 F24000
G1 X102.09 Y149.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I0 J1.217 P1  F30000
G1 X111.691 Y149.095 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X111.25 Y148.654 E.0182
G1 X111.224 Y148.487 E.00495
G1 X110.815 Y147.686 E.02622
G1 X112.224 Y149.095 E.05813
; WIPE_START
G1 F24000
G1 X110.815 Y147.686 E-.75743
G1 X110.818 Y147.692 E-.00257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.147 J1.208 P1  F30000
G1 X122.359 Y149.095 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X121.904 Y148.641 E.01874
G1 X121.855 Y148.333 E.00911
G1 X121.572 Y147.775 E.01824
G1 X122.892 Y149.095 E.05446
; WIPE_START
G1 F24000
G1 X121.572 Y147.775 E-.70955
G1 X121.632 Y147.893 E-.05045
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.117 J1.211 P1  F30000
G1 X134.093 Y149.095 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X133.328 Y148.33 E.03156
G1 X133.303 Y148.176 E.00455
G1 X132.883 Y147.352 E.02699
G1 X134.552 Y149.021 E.06886
; WIPE_START
G1 F24000
G1 X133.138 Y147.607 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.085 J1.214 P1  F30000
G1 X145.751 Y148.486 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X146.191 Y148.926 E.01815
G1 X146.724 Y148.926 E.01556
G1 X145.855 Y148.056 E.03586
G1 X145.325 Y146.993 E.03463
G1 X147.119 Y148.787 E.07398
; WIPE_START
G1 F24000
G1 X145.705 Y147.373 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.12 J1.211 P1  F30000
G1 X159.319 Y148.719 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X159.525 Y148.926 E.00852
G1 X160.059 Y148.926 E.01556
G1 X159.422 Y148.289 E.02625
G1 X159.355 Y147.869 E.01242
G1 X159.17 Y147.504 E.01195
G1 X160.592 Y148.926 E.05866
G1 X161.125 Y148.926 E.01556
G1 X117.299 Y105.099 E1.80767
G1 X117.77 Y105.037 E.01386
G1 X161.659 Y148.926 E1.81023
G1 X162.192 Y148.926 E.01556
G1 X118.233 Y104.966 E1.81314
G1 X118.61 Y104.81 E.01191
G1 X162.725 Y148.926 E1.81958
G1 X163.259 Y148.926 E.01556
G1 X118.987 Y104.654 E1.82601
G1 X119.365 Y104.498 E.01191
G1 X163.792 Y148.926 E1.83245
G1 X164.326 Y148.926 E.01556
G1 X119.742 Y104.342 E1.83889
G1 X120.119 Y104.186 E.01191
G1 X164.859 Y148.926 E1.84533
G1 X165.392 Y148.926 E.01556
G1 X120.492 Y104.026 E1.85193
G1 X120.794 Y103.794 E.01109
G1 X165.593 Y148.593 E1.84776
G1 X165.205 Y146.071 F30000
G1 F15000
G1 X165.423 Y146.29 E.00903
G1 X165.423 Y146.823 E.01556
G1 X164.775 Y146.175 E.02675
G1 X164.214 Y146.086 E.01655
G1 X164.088 Y146.022 E.00412
G1 X165.423 Y147.357 E.05507
G1 X165.423 Y147.89 E.01556
G1 X163.002 Y145.469 E.09987
G1 X162.277 Y145.1 E.02374
G1 X160.739 Y143.564 E.06339
G1 X160.367 Y142.834 E.0239
G1 X121.096 Y103.563 E1.61976
G1 X121.398 Y103.331 E.01109
G1 X159.814 Y141.747 E1.58451
G1 X159.752 Y141.626 E.00399
G1 X159.663 Y141.063 E.01662
G1 X121.7 Y103.1 E1.56582
G1 X122.002 Y102.868 E.01109
G1 X159.562 Y140.429 E1.54922
G1 X159.462 Y139.795 E.01872
G1 X122.303 Y102.637 E1.53262
G2 X122.565 Y102.365 I-.377 J-.625 E.01113
G1 X159.448 Y139.248 E1.52128
G1 X159.521 Y138.788 E.01359
G1 X122.797 Y102.063 E1.51474
G1 X123.028 Y101.761 E.01109
G1 X159.594 Y138.327 E1.50819
G1 X159.667 Y137.867 E.01359
G1 X123.26 Y101.46 E1.50164
G1 X123.492 Y101.158 E.01109
G1 X159.74 Y137.407 E1.4951
G1 X159.752 Y137.332 E.00219
G1 X159.903 Y137.036 E.0097
G1 X123.724 Y100.856 E1.49225
G1 X123.948 Y100.548 E.01114
G1 X160.083 Y136.683 E1.49041
G1 X160.263 Y136.329 E.01157
G1 X124.104 Y100.17 E1.4914
G1 X124.26 Y99.793 E.01191
G1 X160.443 Y135.976 E1.4924
G1 X160.623 Y135.623 E.01157
G1 X124.416 Y99.416 E1.49339
G1 X124.572 Y99.038 E.01191
G1 X160.834 Y135.301 E1.49567
G1 X161.101 Y135.034 E.011
G1 X124.728 Y98.661 E1.50023
G1 X124.879 Y98.279 E.01199
G1 X161.488 Y134.887 E1.50995
G1 X145.839 Y97.37 F30000
G1 F15000
G1 X145.265 Y96.796 E.02366
G1 X144.732 Y96.796 E.01556
G1 X145.728 Y97.792 E.04108
G1 X145.792 Y98.239 E.01316
G1 X145.919 Y98.516 E.00889
G1 X144.314 Y96.912 E.06618
G1 X144.252 Y97.383 E.01387
G1 X146.712 Y99.843 E.10145
G1 X149.884 Y103.015 F30000
G1 F15000
G1 X164.003 Y117.135 E.58238
G1 X164.263 Y117.016 E.0083
G1 X164.399 Y116.997 E.00402
G1 X151.174 Y103.772 E.54548
G1 X151.929 Y103.994 E.02296
G1 X159.908 Y111.972 E.32908
G1 X159.133 Y110.766 E.04182
G1 X159.091 Y110.622 E.00437
G1 X152.685 Y104.216 E.26423
G1 X153.221 Y104.218 E.01564
G1 X158.869 Y109.866 E.23296
G1 X158.647 Y109.111 E.02296
G1 X153.754 Y104.218 E.2018
G1 X154.288 Y104.218 E.01556
G1 X158.495 Y108.426 E.17355
M73 P51 R13
G1 X158.495 Y107.893 E.01556
G1 X154.821 Y104.218 E.15155
G2 X155.296 Y104.16 I.137 J-.85 E.01415
G1 X158.495 Y107.359 E.13195
G1 X158.495 Y106.826 E.01556
G1 X155.709 Y104.04 E.11492
G1 X156.121 Y103.918 E.01253
G1 X158.505 Y106.302 E.09832
G1 X158.626 Y105.89 E.01253
G1 X156.533 Y103.797 E.08633
G1 X156.945 Y103.676 E.01253
G1 X158.747 Y105.478 E.07433
G1 X158.868 Y105.066 E.01253
G1 X157.357 Y103.554 E.06234
G1 X157.404 Y103.54 E.00142
G1 X157.692 Y103.355 E.00998
G1 X158.99 Y104.653 E.05354
G1 X159.111 Y104.241 E.01253
G1 X158.016 Y103.147 E.04514
G1 X158.341 Y102.938 E.01126
G1 X159.303 Y103.9 E.03968
G1 X159.512 Y103.575 E.01126
G1 X158.666 Y102.729 E.03489
M73 P51 R12
G1 X158.99 Y102.521 E.01126
G1 X159.72 Y103.25 E.03009
G1 X159.929 Y102.926 E.01126
G1 X159.315 Y102.312 E.0253
G2 X159.589 Y102.053 I-.306 J-.597 E.01115
G1 X160.137 Y102.601 E.02261
G1 X160.346 Y102.276 E.01126
G1 X159.837 Y101.767 E.02099
G1 X160.084 Y101.481 E.01103
G1 X160.628 Y102.025 E.02243
G1 X160.914 Y101.778 E.01103
G1 X160.332 Y101.196 E.024
G1 X160.58 Y100.91 E.01103
G1 X161.2 Y101.53 E.02558
G1 X161.486 Y101.283 E.01103
G1 X160.828 Y100.624 E.02715
G1 X161 Y100.426 E.00766
G1 X161.051 Y100.314 E.00359
G1 X161.772 Y101.035 E.02974
G1 X162.058 Y100.788 E.01103
G1 X161.218 Y99.948 E.03464
G1 X161.385 Y99.582 E.01174
G1 X162.422 Y100.619 E.04277
G1 X162.788 Y100.451 E.01174
G1 X161.552 Y99.215 E.05098
G1 X161.719 Y98.849 E.01174
G1 X163.154 Y100.284 E.05918
G1 X163.52 Y100.117 E.01174
G1 X161.886 Y98.483 E.06739
G2 X162.02 Y98.083 I-.618 J-.429 E.01246
G1 X163.886 Y99.949 E.07698
G3 X164.289 Y99.818 I.424 J.619 E.01251
G1 X162.087 Y97.617 E.09079
G1 X162.155 Y97.151 E.01373
G1 X164.755 Y99.751 E.10723
G1 X165.221 Y99.684 E.01374
G1 X162.333 Y96.796 E.1191
G1 X162.867 Y96.796 E.01556
G1 X165.423 Y99.353 E.10545
G1 X165.423 Y98.82 E.01556
G1 X163.4 Y96.796 E.08345
G1 X163.934 Y96.796 E.01556
G1 X165.423 Y98.286 E.06145
G1 X165.423 Y97.753 E.01556
G1 X164.467 Y96.796 E.03945
G1 X165 Y96.796 E.01556
G1 X165.593 Y97.389 E.02445
; WIPE_START
G1 F24000
G1 X165 Y96.796 E-.31854
G1 X164.467 Y96.796 E-.20268
G1 X164.911 Y97.241 E-.23878
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.17 J-.333 P1  F30000
G1 X160.538 Y112.602 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X164.865 Y116.929 E.17849
G1 X165.331 Y116.862 E.01374
G1 X163.086 Y114.617 E.0926
G1 X164.068 Y115.066 E.03149
G1 X165.423 Y116.421 E.05589
G1 X165.423 Y115.888 E.01556
G1 X164.71 Y115.174 E.02943
G1 X165.332 Y115.263 E.01834
G1 X165.593 Y115.524 E.01075
G1 X163.765 Y117.43 F30000
G1 F15000
G1 X144.19 Y97.855 E.80739
G1 X144.148 Y98.175 E.00943
G1 X144.098 Y98.296 E.00381
G1 X163.271 Y117.469 E.7908
G1 X162.905 Y117.636 E.01174
G1 X143.942 Y98.673 E.78213
G1 X143.786 Y99.05 E.01191
G1 X162.538 Y117.803 E.77346
G2 X162.208 Y118.006 I.18 J.665 E.01147
G1 X143.63 Y99.428 E.76626
G1 X143.473 Y99.805 E.01191
G1 X161.922 Y118.253 E.76091
G1 X161.636 Y118.5 E.01103
G1 X143.317 Y100.182 E.75556
G3 X143.115 Y100.514 I-.719 J-.211 E.01145
G1 X161.35 Y118.748 E.75209
G1 X161.064 Y118.995 E.01103
G1 X142.884 Y100.815 E.74985
G1 X142.652 Y101.117 E.01109
G1 X160.778 Y119.243 E.7476
G1 X160.732 Y119.282 E.00175
G1 X160.557 Y119.555 E.00947
G1 X142.421 Y101.419 E.74805
G1 X142.189 Y101.721 E.01109
G1 X160.349 Y119.88 E.749
G1 X160.14 Y120.205 E.01126
G1 X141.958 Y102.023 E.74995
G3 X141.694 Y102.292 I-.635 J-.359 E.01113
G1 X159.932 Y120.53 E.75225
G1 X159.723 Y120.855 E.01126
G1 X141.392 Y102.524 E.75609
G1 X141.09 Y102.755 E.01109
G1 X159.545 Y121.21 E.76118
G1 X159.424 Y121.623 E.01254
G1 X140.789 Y102.987 E.76864
G1 X140.487 Y103.219 E.01109
G1 X159.303 Y122.035 E.77609
G1 X159.182 Y122.447 E.01254
G1 X140.185 Y103.45 E.78355
G3 X139.859 Y103.657 I-.548 J-.503 E.0114
G1 X159.061 Y122.86 E.79203
G2 X158.991 Y123.323 I.755 J.351 E.01385
G1 X139.481 Y103.813 E.8047
G1 X139.104 Y103.969 E.01191
G1 X158.991 Y123.857 E.82027
G1 X158.991 Y124.39 E.01556
G1 X138.727 Y104.125 E.83583
G1 X138.349 Y104.281 E.01191
G1 X158.991 Y124.923 E.8514
G1 X158.991 Y125.217 E.00857
G1 X159.091 Y125.556 E.0103
G1 X137.972 Y104.437 E.87105
G1 X137.825 Y104.498 E.00464
G1 X137.537 Y104.536 E.00846
G1 X159.311 Y126.31 E.89808
G1 X159.532 Y127.064 E.02292
G1 X137.066 Y104.599 E.92662
G1 X136.595 Y104.661 E.01386
G1 X164.726 Y132.791 E1.16026
G1 X165.186 Y132.718 E.01359
G1 X163.356 Y130.888 E.07547
G1 X164.263 Y131.302 E.02906
G1 X164.31 Y131.308 E.00139
G1 X165.423 Y132.422 E.04594
G1 X165.423 Y131.889 E.01556
G1 X164.733 Y131.198 E.02849
G1 X164.414 Y133.013 F30000
G1 F15000
G1 X136.124 Y104.723 E1.16682
G1 X135.653 Y104.785 E.01386
G1 X163.9 Y133.032 E1.16506
G1 X163.547 Y133.212 E.01157
G1 X135.082 Y104.748 E1.17402
G1 X134.468 Y104.667 E.01809
G1 X163.193 Y133.392 E1.1848
G1 X162.84 Y133.572 E.01157
G1 X133.853 Y104.585 E1.19558
G1 X133.238 Y104.504 E.01809
G1 X162.486 Y133.752 E1.20635
G2 X162.168 Y133.967 I.171 J.597 E.01139
G1 X132.35 Y104.149 E1.22987
G1 X131.44 Y103.773 E.0287
G1 X161.901 Y134.234 E1.25638
G1 X161.635 Y134.5 E.011
G1 X124.941 Y97.807 E1.51344
G1 X125.004 Y97.336 E.01386
G1 X127.598 Y99.93 E.10699
G1 X127.219 Y99.018 E.02879
G1 X125.066 Y96.865 E.08882
G1 X125.075 Y96.796 E.00202
G1 X125.531 Y96.796 E.01329
G1 X126.863 Y98.129 E.05497
G1 X126.783 Y97.515 E.01806
G1 X126.064 Y96.796 E.02964
G1 X126.597 Y96.796 E.01556
G1 X126.899 Y97.098 E.01244
; WIPE_START
G1 F24000
G1 X126.597 Y96.796 E-.16213
G1 X126.064 Y96.796 E-.20268
G1 X126.783 Y97.515 E-.38624
G1 X126.786 Y97.538 E-.00895
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.298 J-1.18 P1  F30000
G1 X108.92 Y102.054 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X104.36 Y97.494 E.18806
G1 X104.422 Y97.023 E.01386
G1 X107.289 Y99.89 E.11825
G1 X106.914 Y98.981 E.02869
G1 X104.729 Y96.796 E.09011
G1 X105.262 Y96.796 E.01556
G1 X106.613 Y98.147 E.0557
G1 X106.532 Y97.532 E.01808
G1 X105.796 Y96.796 E.03036
G1 X106.329 Y96.796 E.01556
G1 X106.648 Y97.115 E.01315
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X106.329 Y96.796 E-.17133
G1 X105.796 Y96.796 E-.20268
G1 X106.514 Y97.515 E-.38599
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I-1.05 J.616 P1  F30000
G1 X189.5 Y239 Z1.4
G1 Z1.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X156.500 Y219.500  
;--------------------
; CP EMPTY GRID START
; layer #7
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139

; WIPE_START
G1 F24000
G1 X188.457 Y239.957 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.135 J-.44 P1  F30000
G1 X151.29 Y144.073 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05852
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.989 Y146.857 I338.552 J339.012 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04542
M73 P52 R12
G2 X114.443 Y146.132 I363.275 J714.098 E.04535
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-73.809 J143.535 E.03556
G1 X98.017 Y146.249 E.03559
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.961 Y96.463 E.19217
G1 X85.105 Y96.463 E.09894
G1 X85.26 Y97.649 E.03765
G1 X85.352 Y98.346 E.02214
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07893
G2 X92.146 Y105.14 I327.462 J-786.296 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-504.897 J-1221.791 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G2 X113.398 Y104.656 I637.956 J-1539.107 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I535.29 J-462.724 E.07263
G1 X150.528 Y103.234 E.07263
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-62.972 J-218.427 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-160.463 J312.313 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.344 Y144.048 E.05993
G1 X151.63 Y144.4 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.459 Y144.427 E.00505
G2 X149.868 Y145.239 I124.159 J245.229 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I312.148 J312.563 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03844
G2 X114.676 Y146.453 I331.757 J652.119 E.0384
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-65.641 J127.684 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.569 Y96.071 E.19957
G1 X85.449 Y96.071 E.11312
G1 X85.649 Y97.598 E.04491
G1 X85.734 Y98.244 E.019
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I313.843 J-753.579 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-483.776 J-1170.668 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G2 X113.5 Y104.274 I608.931 J-1469.087 E.0663
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I509.048 J-440.028 E.06398
G1 X150.693 Y102.874 E.064
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-59.915 J-207.759 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05212
G2 X154.99 Y144.427 I-149.99 J291.896 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.69 Y144.39 E.04532
M204 S10000
; WIPE_START
G1 F24000
G1 X151.459 Y144.427 E-.08864
G1 X149.886 Y145.23 E-.67136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.771 J-.942 P1  F30000
G1 X147.726 Y146.998 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420077
G1 F15000
G1 X145.966 Y148.759 E.07261
G1 X145.992 Y148.926 E.00493
G1 X146.332 Y148.926 E.00992
G1 X147.036 Y148.221 E.02905
G1 X146.936 Y148.855 E.0187
G1 X146.696 Y149.095 E.00993
; WIPE_START
G1 F24000
G1 X146.936 Y148.855 E-.12941
G1 X147.036 Y148.221 E-.24359
G1 X146.332 Y148.926 E-.3785
G1 X146.31 Y148.926 E-.0085
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.539 J-1.091 P1  F30000
G1 X137.756 Y144.7 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X158.991 Y123.465 E.87587
G1 X158.991 Y123.999 E.01556
G1 X138.866 Y144.124 E.83009
G1 X139.5 Y144.024 E.01871
G1 X158.991 Y124.532 E.80396
G1 X158.991 Y125.065 E.01556
G1 X140.133 Y143.924 E.77783
G1 X140.193 Y143.914 E.00175
G1 X140.61 Y143.98 E.01233
G1 X159.078 Y125.512 E.76172
G1 X159.199 Y125.925 E.01254
G1 X141.071 Y144.053 E.7477
G1 X141.531 Y144.125 E.0136
G1 X159.319 Y126.337 E.73369
G1 X159.44 Y126.75 E.01254
G1 X141.992 Y144.198 E.71967
G1 X142.355 Y144.369 E.01169
G1 X159.561 Y127.163 E.7097
G1 X159.587 Y127.251 E.00269
G1 X159.751 Y127.506 E.00884
G1 X142.708 Y144.549 E.70295
G1 X143.061 Y144.729 E.01157
G1 X159.959 Y127.831 E.69698
G1 X160.168 Y128.156 E.01126
G1 X143.415 Y144.909 E.69101
G1 X143.689 Y145.049 E.00899
G1 X143.749 Y145.108 E.00245
G1 X160.377 Y128.48 E.68584
G1 X160.585 Y128.805 E.01126
G1 X144.015 Y145.375 E.68345
G1 X144.282 Y145.642 E.011
G1 X160.817 Y129.107 E.682
G1 X161.103 Y129.355 E.01103
G1 X144.549 Y145.908 E.68278
G1 X144.816 Y146.175 E.011
G1 X161.388 Y129.602 E.68356
G1 X161.674 Y129.85 E.01103
G1 X145.057 Y146.467 E.68538
G1 X145.237 Y146.82 E.01157
G1 X161.96 Y130.098 E.68974
G1 X162.245 Y130.345 E.01103
G1 X145.417 Y147.174 E.6941
G1 X145.597 Y147.527 E.01157
G1 X162.587 Y130.537 E.70076
G1 X162.953 Y130.705 E.01174
G1 X145.777 Y147.881 E.70845
G1 X145.849 Y148.023 E.00465
G1 X145.893 Y148.298 E.00813
G1 X163.319 Y130.872 E.71877
G1 X163.686 Y131.039 E.01174
G1 X150.749 Y143.975 E.53357
G1 X151.232 Y143.728 E.01581
G1 X151.585 Y143.672 E.01042
G1 X164.052 Y131.206 E.5142
G2 X164.461 Y131.33 I.417 J-.636 E.01263
G1 X152.219 Y143.572 E.50491
G1 X152.854 Y143.471 E.01873
G1 X164.927 Y131.398 E.49798
G1 X165.393 Y131.465 E.01374
G1 X163.748 Y133.11 E.06784
G1 X164.214 Y132.872 E.01524
G1 X164.576 Y132.815 E.01069
G1 X165.423 Y131.968 E.03494
G1 X165.423 Y132.501 E.01556
G1 X165.006 Y132.919 E.01721
G1 X160.376 Y136.482 F30000
G1 F15000
G1 X153.416 Y143.442 E.28709
G1 X153.876 Y143.515 E.01359
G1 X159.694 Y137.697 E.23999
G1 X159.594 Y138.331 E.01872
G1 X154.336 Y143.589 E.21686
G1 X154.796 Y143.662 E.01359
G1 X159.493 Y138.965 E.19373
G1 X159.412 Y139.479 E.01519
G1 X159.425 Y139.566 E.00257
G1 X155.247 Y143.744 E.17233
G1 X155.601 Y143.924 E.01156
G1 X159.498 Y140.026 E.16077
G1 X159.571 Y140.487 E.01359
G1 X155.954 Y144.104 E.14922
G1 X156.307 Y144.285 E.01156
G1 X159.644 Y140.947 E.13766
G1 X159.717 Y141.407 E.01359
G1 X156.66 Y144.465 E.12611
G1 X157.013 Y144.645 E.01156
G1 X159.847 Y141.812 E.11687
G1 X160.027 Y142.165 E.01157
G1 X157.28 Y144.911 E.11328
G1 X157.547 Y145.178 E.011
M73 P53 R12
G1 X160.207 Y142.518 E.10969
G1 X160.386 Y142.872 E.01157
G1 X157.814 Y145.444 E.1061
G1 X158.081 Y145.711 E.011
G1 X160.566 Y143.225 E.10252
G1 X160.75 Y143.575 E.01152
G1 X158.348 Y145.977 E.09908
G1 X158.441 Y146.07 E.00384
G1 X158.558 Y146.301 E.00753
G1 X161.017 Y143.842 E.10142
G1 X161.284 Y144.108 E.011
G1 X158.738 Y146.654 E.10501
G1 X158.918 Y147.008 E.01157
G1 X161.551 Y144.375 E.1086
G1 X161.818 Y144.641 E.011
G1 X159.097 Y147.361 E.1122
G1 X159.277 Y147.715 E.01157
G1 X162.084 Y144.908 E.11579
G1 X162.277 Y145.1 E.00792
G1 X162.376 Y145.15 E.00324
G1 X159.397 Y148.129 E.12287
G1 X159.47 Y148.589 E.01359
G1 X162.729 Y145.33 E.13443
G1 X163.083 Y145.51 E.01157
G1 X159.667 Y148.926 E.1409
G1 X160.2 Y148.926 E.01556
G1 X163.436 Y145.69 E.13348
G1 X163.789 Y145.87 E.01157
G1 X160.733 Y148.926 E.12606
G1 X161.267 Y148.926 E.01556
G1 X164.143 Y146.049 E.11864
G1 X164.214 Y146.086 E.00233
G1 X164.582 Y146.144 E.01085
G1 X161.8 Y148.926 E.11473
G1 X162.333 Y148.926 E.01556
G1 X165.042 Y146.217 E.11172
G1 X165.423 Y146.278 E.01126
G1 X165.423 Y146.369 E.00267
G1 X162.867 Y148.926 E.10545
G1 X163.4 Y148.926 E.01556
G1 X165.423 Y146.903 E.08345
G1 X165.423 Y147.436 E.01556
G1 X163.934 Y148.926 E.06145
G1 X164.467 Y148.926 E.01556
G1 X165.423 Y147.969 E.03945
G1 X165.423 Y148.503 E.01556
G1 X164.831 Y149.095 E.02445
; WIPE_START
G1 F24000
G1 X165.423 Y148.503 E-.31854
G1 X165.423 Y147.969 E-.20268
G1 X164.979 Y148.414 E-.23877
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.217 J.023 P1  F30000
G1 X165.593 Y116.33 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X165.015 Y116.908 E.02383
G1 X164.392 Y116.998 E.01837
G1 X165.423 Y115.966 E.04254
G1 X165.423 Y115.433 E.01556
G1 X163.486 Y117.371 E.07992
G1 X162.505 Y117.818 E.03143
G1 X165.094 Y115.229 E.10678
G1 X164.627 Y115.162 E.01375
G1 X132.732 Y147.057 E1.31555
G1 X132.913 Y147.41 E.01156
G1 X160.18 Y120.143 E1.12467
G1 X159.587 Y121.067 E.03201
G1 X159.503 Y121.353 E.00871
G1 X133.093 Y147.764 E1.08932
G1 X133.273 Y148.117 E.01156
G1 X159.282 Y122.108 E1.07276
G1 X159.061 Y122.863 E.02293
G1 X133.364 Y148.559 E1.05989
G1 X133.422 Y148.926 E.01082
G1 X133.531 Y148.926 E.00318
G1 X134.646 Y147.811 E.04599
G1 X134.538 Y148.023 E.00694
G1 X134.457 Y148.532 E.01505
G1 X133.895 Y149.095 E.02322
G1 X132.426 Y146.83 F30000
G1 F15000
G1 X164.161 Y115.096 E1.30894
G1 X163.786 Y114.937 E.01187
G1 X132.297 Y146.426 E1.29882
G1 X132.03 Y146.16 E.011
G1 X163.42 Y114.77 E1.29472
G1 X163.054 Y114.602 E.01174
G1 X131.763 Y145.893 E1.29062
G1 X131.497 Y145.626 E.011
G1 X162.688 Y114.435 E1.28652
G1 X162.322 Y114.268 E.01174
G1 X131.2 Y145.39 E1.28367
G1 X130.846 Y145.21 E.01157
G1 X161.979 Y114.077 E1.28413
G1 X161.694 Y113.829 E.01103
G1 X130.493 Y145.03 E1.28693
G1 X130.139 Y144.85 E.01157
G1 X161.408 Y113.581 E1.28973
G1 X161.122 Y113.334 E.01103
G1 X129.78 Y144.676 E1.29277
G1 X129.319 Y144.603 E.0136
G1 X160.837 Y113.086 E1.29998
G1 X160.551 Y112.838 E.01103
G1 X128.859 Y144.531 E1.30719
G1 X128.398 Y144.458 E.0136
G1 X160.289 Y112.566 E1.31539
G1 X160.081 Y112.242 E.01126
G1 X127.868 Y144.454 E1.32866
G1 X127.234 Y144.555 E.01871
G1 X159.872 Y111.917 E1.34619
G1 X159.664 Y111.592 E.01126
G1 X126.601 Y144.655 E1.36373
G1 X126.441 Y144.68 E.00472
G1 X125.63 Y145.092 E.02651
G1 X159.455 Y111.267 E1.39515
G1 X159.247 Y110.942 E.01126
G1 X121.855 Y148.333 E1.54224
G1 X121.676 Y147.98 E.01157
G1 X159.078 Y110.578 E1.5427
G1 X158.957 Y110.165 E.01253
G1 X121.496 Y147.626 E1.54512
G1 X121.316 Y147.273 E.01157
G1 X158.836 Y109.753 E1.54754
G1 X158.714 Y109.341 E.01253
G1 X121.128 Y146.927 E1.5503
G1 X120.861 Y146.661 E.011
G1 X158.593 Y108.929 E1.55631
G1 X158.495 Y108.596 E.01012
G1 X158.495 Y108.493 E.00299
G1 X120.594 Y146.394 E1.56327
G1 X120.328 Y146.127 E.011
G1 X158.495 Y107.96 E1.57427
G1 X158.495 Y107.426 E.01556
G1 X120.061 Y145.861 E1.58527
G1 X119.708 Y145.68 E.01156
G1 X158.495 Y106.893 E1.59982
G1 X158.495 Y106.36 E.01556
G1 X119.355 Y145.5 E1.6144
G1 X119.001 Y145.32 E.01157
G1 X158.707 Y105.615 E1.63771
G1 X158.929 Y104.859 E.02296
G1 X118.638 Y145.15 E1.66184
G1 X118.178 Y145.076 E.01358
G1 X159.773 Y103.482 E1.71563
G1 X162.473 Y100.782 F30000
G1 F15000
G1 X165.423 Y97.832 E.12168
G1 X165.423 Y98.365 E.01556
G1 X163.799 Y99.989 E.067
G1 X164.12 Y99.842 E.0103
G1 X164.54 Y99.782 E.01236
G1 X165.423 Y98.898 E.03645
G1 X165.423 Y99.432 E.01556
G1 X164.962 Y99.893 E.01901
G1 X162.895 Y96.627 F30000
G1 F15000
G1 X162.118 Y97.403 E.03201
G1 X162.028 Y98.027 E.01838
G1 X163.258 Y96.796 E.05074
G1 X163.792 Y96.796 E.01556
G1 X161.703 Y98.885 E.08616
G1 X161.255 Y99.866 E.03144
G1 X164.325 Y96.796 E.12662
G1 X164.858 Y96.796 E.01556
G1 X116.665 Y144.99 E1.98779
G1 X117.151 Y144.912 E.01434
G1 X117.259 Y144.929 E.0032
G1 X165.392 Y96.796 E1.98529
G1 X165.423 Y96.796 E.00092
G1 X165.423 Y97.298 E.01463
G1 X117.571 Y145.151 E1.97375
G1 X115.825 Y145.296 F30000
G1 F15000
G1 X157.9 Y103.222 E1.73541
G1 X157.404 Y103.54 E.0172
G1 X156.899 Y103.689 E.01535
G1 X114.845 Y145.743 E1.73457
G1 X112.026 Y149.095 F30000
G1 F15000
G1 X112.382 Y148.739 E.01469
G1 X112.446 Y148.333 E.01199
G1 X112.644 Y147.944 E.01273
G1 X111.662 Y148.926 E.04048
G1 X111.293 Y148.926 E.01078
G1 X111.27 Y148.784 E.00418
G1 X156.142 Y103.912 E1.8508
G3 X155.387 Y104.134 I-22.197 J-74.221 E.02295
G1 X111.16 Y148.361 E1.82422
G1 X110.98 Y148.008 E.01156
G1 X154.769 Y104.218 E1.80617
G1 X154.236 Y104.218 E.01556
G1 X110.799 Y147.655 E1.7916
G1 X110.619 Y147.302 E.01156
G1 X153.703 Y104.218 E1.77703
G1 X153.169 Y104.218 E.01556
G1 X110.369 Y147.019 E1.76536
G1 X110.107 Y146.747 E.011
G1 X152.649 Y104.205 E1.75468
G1 X152.237 Y104.084 E.01253
G1 X109.846 Y146.475 E1.74846
G1 X109.585 Y146.203 E.011
G1 X151.825 Y103.963 E1.74223
G1 X151.412 Y103.842 E.01253
G1 X109.324 Y145.93 E1.736
G1 X109.097 Y145.694 E.00955
G1 X108.94 Y145.888 E.00726
G1 X108.866 Y145.855 E.00238
G1 X151 Y103.721 E1.73789
G1 X150.588 Y103.599 E.01253
G1 X108.494 Y145.693 E1.73622
G2 X108.07 Y145.584 I-.423 J.759 E.0129
G1 X150.221 Y103.433 E1.73855
G1 X149.896 Y103.224 E.01126
G1 X107.609 Y145.511 E1.74417
G1 X107.149 Y145.439 E.01361
G1 X149.571 Y103.016 E1.74978
G1 X149.247 Y102.807 E.01126
G1 X106.574 Y145.48 E1.7601
G1 X105.941 Y145.58 E.01869
G1 X148.922 Y102.599 E1.77281
G1 X148.597 Y102.39 E.01126
G1 X105.084 Y145.903 E1.79475
G1 X104.38 Y146.261 E.02304
G1 X103.396 Y147.247 E.04061
G1 X103.038 Y147.949 E.02299
G1 X102.061 Y148.926 E.04029
G1 X101.816 Y148.926 E.00715
G1 X101.777 Y148.677 E.00736
G1 X148.295 Y102.159 E1.91867
G1 X148.047 Y101.873 E.01103
G1 X101.605 Y148.315 E1.91554
G1 X101.425 Y147.962 E.01157
G1 X147.799 Y101.588 E1.91275
G1 X147.552 Y101.302 E.01103
G1 X101.245 Y147.608 E1.90995
G1 X101.211 Y147.54 E.00222
G1 X100.995 Y147.325 E.00889
G1 X147.304 Y101.016 E1.91005
G1 X147.056 Y100.731 E.01103
G1 X100.729 Y147.058 E1.91083
G1 X100.462 Y146.792 E.011
G1 X146.808 Y100.445 E1.91161
G1 X146.636 Y100.084 E.01166
G1 X100.149 Y146.571 E1.9174
G1 X99.796 Y146.391 E.01157
G1 X146.468 Y99.718 E1.92507
G1 X146.301 Y99.352 E.01174
G1 X99.442 Y146.211 E1.93274
G2 X99.044 Y146.076 I-.408 J.547 E.01247
G1 X146.134 Y98.986 E1.94226
G1 X145.966 Y98.62 E.01174
G1 X98.584 Y146.002 E1.95433
G1 X98.124 Y145.929 E.01359
G1 X145.799 Y98.254 E1.9664
M73 P54 R12
G1 X145.728 Y97.792 E.01365
G1 X143.303 Y100.217 E.10002
G1 X143.68 Y99.307 E.02873
G1 X145.661 Y97.325 E.08174
G1 X145.594 Y96.859 E.01375
G1 X144.056 Y98.397 E.06345
G1 X144.148 Y98.175 E.007
G1 X144.209 Y97.711 E.01366
G1 X145.123 Y96.796 E.03771
G1 X144.59 Y96.796 E.01556
G1 X144.093 Y97.294 E.02051
; WIPE_START
G1 F24000
G1 X144.59 Y96.796 E-.26717
G1 X145.123 Y96.796 E-.20268
G1 X144.583 Y97.336 E-.29014
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.045 J-1.216 P1  F30000
G1 X125.558 Y96.627 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X125.027 Y97.157 E.02189
G1 X124.946 Y97.772 E.01808
G1 X125.922 Y96.796 E.04024
G1 X126.455 Y96.796 E.01556
G1 X124.825 Y98.426 E.06723
G1 X124.449 Y99.335 E.02869
G1 X126.723 Y97.062 E.09378
G1 X126.785 Y97.533 E.01387
G1 X123.669 Y100.65 E.12854
; WIPE_START
G1 F24000
G1 X125.083 Y99.235 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.121 J-1.211 P1  F30000
G1 X104.235 Y97.148 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X104.586 Y96.796 E.0145
G1 X105.12 Y96.796 E.01556
G1 X104.351 Y97.565 E.03172
G1 X104.269 Y98.18 E.01808
G1 X105.653 Y96.796 E.05707
G1 X106.186 Y96.796 E.01556
G1 X104.015 Y98.968 E.08957
G1 X103.639 Y99.877 E.0287
G1 X106.468 Y97.048 E.11669
G1 X106.53 Y97.52 E.01386
G1 X102.411 Y101.639 E.1699
; WIPE_START
G1 F24000
G1 X103.825 Y100.225 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.206 J-1.199 P1  F30000
G1 X82.887 Y96.627 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X82.295 Y97.219 E.02444
G1 X82.295 Y97.753 E.01555
G1 X83.251 Y96.796 E.03944
G1 X83.784 Y96.796 E.01556
G1 X82.295 Y98.286 E.06143
G1 X82.295 Y98.819 E.01555
G1 X84.318 Y96.796 E.08343
G1 X84.812 Y96.796 E.01442
G1 X84.817 Y96.831 E.00101
G1 X82.295 Y99.352 E.104
G1 X82.295 Y99.886 E.01555
G1 X84.879 Y97.302 E.10655
G1 X84.941 Y97.774 E.01387
G1 X82.296 Y100.419 E.1091
G1 X82.296 Y100.952 E.01555
G1 X85.003 Y98.245 E.11166
G2 X85.121 Y98.66 I.832 J-.014 E.01273
G1 X82.296 Y101.485 E.11655
G1 X82.296 Y102.019 E.01555
G1 X85.278 Y99.037 E.12299
G1 X85.434 Y99.414 E.01191
G1 X82.545 Y102.303 E.11915
G1 X83.021 Y102.361 E.01397
G1 X85.59 Y99.791 E.10597
G1 X85.746 Y100.168 E.01191
G1 X83.496 Y102.418 E.0928
G1 X83.858 Y102.462 E.01063
G1 X83.951 Y102.497 E.00289
G1 X85.903 Y100.545 E.08051
G1 X86.022 Y100.833 E.00908
G1 X86.077 Y100.905 E.00263
G1 X84.338 Y102.644 E.07174
G1 X84.724 Y102.791 E.01206
G1 X86.309 Y101.206 E.06534
G1 X86.54 Y101.508 E.01109
G1 X85.111 Y102.937 E.05895
G1 X85.498 Y103.084 E.01206
G1 X86.772 Y101.81 E.05255
G1 X87.004 Y102.111 E.01109
G1 X85.885 Y103.23 E.04616
G1 X86.261 Y103.388 E.01189
G1 X87.235 Y102.413 E.04021
G1 X87.467 Y102.715 E.01109
G1 X86.576 Y103.606 E.03675
G1 X86.891 Y103.824 E.01118
G1 X87.728 Y102.987 E.03451
G1 X88.03 Y103.219 E.0111
G1 X87.207 Y104.042 E.03395
G1 X87.522 Y104.26 E.01118
G1 X88.332 Y103.45 E.03339
G1 X88.633 Y103.682 E.0111
G1 X87.838 Y104.478 E.03283
G1 X88.153 Y104.696 E.01118
G1 X88.935 Y103.913 E.03227
G1 X89.237 Y104.145 E.0111
G1 X88.43 Y104.952 E.03327
G1 X88.681 Y105.234 E.01102
G1 X89.539 Y104.376 E.03538
G2 X89.886 Y104.563 I.523 J-.556 E.01161
G1 X88.932 Y105.517 E.03934
G1 X89.183 Y105.8 E.01102
G1 X90.262 Y104.72 E.04454
G1 X90.639 Y104.876 E.0119
G1 X89.433 Y106.082 E.04974
G1 X89.684 Y106.365 E.01102
G1 X91.016 Y105.033 E.05495
G1 X91.393 Y105.189 E.01191
G1 X89.935 Y106.648 E.06016
G1 X90.123 Y106.992 E.01146
G1 X91.771 Y105.345 E.06794
G1 X92.059 Y105.464 E.0091
G1 X92.17 Y105.479 E.00327
G1 X90.307 Y107.342 E.07685
G1 X90.49 Y107.692 E.01152
G1 X92.642 Y105.541 E.08872
G1 X93.113 Y105.603 E.01387
G1 X90.674 Y108.042 E.1006
G1 X90.858 Y108.392 E.01152
G1 X93.584 Y105.665 E.11247
G1 X94.056 Y105.727 E.01387
G1 X91.041 Y108.742 E.12435
G3 X91.182 Y109.134 I-.727 J.482 E.01229
G1 X94.527 Y105.789 E.138
G1 X94.633 Y105.802 E.0031
G1 X95.11 Y105.74 E.01403
G1 X91.287 Y109.562 E.15766
G1 X91.393 Y109.99 E.01285
G1 X95.724 Y105.659 E.17864
G1 X96.338 Y105.578 E.01806
G1 X91.498 Y110.418 E.19962
G1 X91.603 Y110.846 E.01285
G1 X96.952 Y105.498 E.2206
G1 X97.205 Y105.464 E.00743
G1 X97.74 Y105.243 E.0169
G1 X91.709 Y111.274 E.24876
G1 X91.726 Y111.344 E.00209
G1 X91.726 Y111.79 E.01303
G1 X98.651 Y104.866 E.28561
G1 X99.562 Y104.488 E.02878
G1 X91.726 Y112.324 E.3232
G1 X91.726 Y112.857 E.01556
G1 X106.592 Y97.991 E.61317
G1 X106.633 Y98.303 E.00918
G1 X106.686 Y98.43 E.00402
G1 X91.726 Y113.39 E.61704
G1 X91.726 Y113.861 E.01372
G1 X91.705 Y113.944 E.00252
G1 X106.842 Y98.808 E.62433
G1 X106.998 Y99.185 E.01191
G1 X91.531 Y114.652 E.63795
G1 X91.357 Y115.36 E.02126
G1 X107.154 Y99.563 E.65158
G1 X107.31 Y99.94 E.01191
G1 X91.182 Y116.068 E.66521
G1 X91.124 Y116.305 E.00713
G1 X90.732 Y117.051 E.02456
G1 X107.466 Y100.317 E.69019
G1 X107.576 Y100.583 E.00837
G1 X107.644 Y100.672 E.0033
G1 X89.297 Y119.02 E.75676
G1 X82.126 Y123.523 F30000
G1 F15000
G1 X82.776 Y122.873 E.02681
G1 X83.384 Y122.8 E.01784
G1 X82.296 Y123.887 E.04486
G1 X82.296 Y124.208 E.00937
G1 X82.485 Y124.231 E.00556
G1 X84.046 Y122.671 E.06437
G1 X84.906 Y122.344 E.02684
G1 X82.961 Y124.289 E.08023
G1 X83.437 Y124.347 E.01398
G1 X85.767 Y122.017 E.09609
G1 X86.213 Y121.847 E.01392
G1 X87.041 Y121.276 E.02934
G1 X83.912 Y124.404 E.12904
G1 X83.978 Y124.412 E.00194
G1 X84.311 Y124.539 E.01039
G1 X107.876 Y100.974 E.97196
G1 X108.108 Y101.276 E.01109
G1 X84.698 Y124.686 E.96557
G1 X85.085 Y124.832 E.01206
G1 X108.34 Y101.577 E.95918
G1 X108.571 Y101.879 E.01109
G1 X85.471 Y124.979 E.9528
G1 X85.858 Y125.126 E.01206
G1 X108.803 Y102.181 E.94641
G1 X109.035 Y102.482 E.01109
G1 X86.244 Y125.273 E.94002
G3 X86.597 Y125.454 I-.191 J.806 E.01167
G1 X109.324 Y102.727 E.9374
G1 X109.625 Y102.958 E.0111
G1 X86.912 Y125.672 E.93684
G1 X87.228 Y125.889 E.01118
G1 X109.927 Y103.19 E.93627
G1 X110.229 Y103.421 E.0111
G1 X87.543 Y126.107 E.93571
G1 X87.859 Y126.325 E.01118
G1 X110.531 Y103.653 E.93515
G1 X110.833 Y103.884 E.0111
G1 X88.174 Y126.543 E.93458
G1 X88.49 Y126.761 E.01118
G1 X111.16 Y104.091 E.93506
G1 X111.537 Y104.247 E.01191
G1 X88.766 Y127.018 E.93922
G1 X89.017 Y127.3 E.01102
G1 X111.915 Y104.403 E.94444
G1 X112.292 Y104.559 E.01191
G1 X89.268 Y127.583 E.94966
G1 X89.518 Y127.866 E.01102
G1 X112.669 Y104.715 E.95489
G1 X113.047 Y104.871 E.01191
G1 X89.769 Y128.148 E.96011
G1 X90.02 Y128.431 E.01102
G1 X113.452 Y104.999 E.96649
G1 X113.923 Y105.061 E.01386
G1 X90.27 Y128.714 E.97559
G3 X90.48 Y129.038 I-.552 J.585 E.01136
G1 X114.394 Y105.123 E.9864
G1 X114.866 Y105.185 E.01386
G1 X90.663 Y129.388 E.99826
G1 X90.847 Y129.738 E.01152
G1 X115.337 Y105.247 E1.01013
G1 X115.755 Y105.302 E.01229
G1 X115.825 Y105.293 E.00205
G1 X91.03 Y130.087 E1.02266
G1 X91.214 Y130.437 E.01152
G1 X116.439 Y105.212 E1.04043
G1 X117.053 Y105.131 E.01807
G1 X91.398 Y130.787 E1.0582
G1 X91.581 Y131.137 E.01152
G1 X117.668 Y105.05 E1.07597
G1 X118.199 Y104.98 E.01562
G1 X118.322 Y104.929 E.00389
G1 X91.691 Y131.56 E1.09843
G1 X91.796 Y131.988 E.01286
G1 X119.232 Y104.553 E1.1316
G1 X120.141 Y104.177 E.02871
G1 X91.902 Y132.416 E1.16478
G1 X92.007 Y132.844 E.01286
G1 X126.847 Y98.005 E1.43701
G2 X126.969 Y98.416 I.826 J-.022 E.01266
G1 X92.112 Y133.272 E1.43771
G1 X92.218 Y133.7 E.01286
G1 X127.126 Y98.793 E1.43981
G1 X127.282 Y99.17 E.0119
G1 X92.222 Y134.23 E1.44609
G1 X92.222 Y134.763 E.01556
G1 X127.438 Y99.547 E1.45254
G1 X127.595 Y99.924 E.0119
G1 X92.222 Y135.296 E1.45899
G1 X92.222 Y135.83 E.01556
G1 X127.751 Y100.301 E1.46544
G1 X127.977 Y100.608 E.01113
G1 X92.22 Y136.365 E1.47483
G1 X92.046 Y137.073 E.02125
G1 X128.208 Y100.91 E1.49157
G1 X128.44 Y101.212 E.0111
G1 X91.872 Y137.78 E1.5083
G1 X91.697 Y138.488 E.02125
G1 X128.671 Y101.514 E1.52504
G1 X128.903 Y101.816 E.0111
G1 X91.36 Y139.359 E1.5485
G1 X90.771 Y140.481 E.03697
G1 X129.135 Y102.118 E1.58236
G1 X129.185 Y102.184 E.00244
G1 X129.421 Y102.365 E.00865
G1 X82.86 Y148.926 E1.92047
G1 X83.393 Y148.926 E.01556
M73 P54 R11
G1 X129.722 Y102.596 E1.91091
G1 X130.024 Y102.828 E.01109
G1 X83.926 Y148.926 E1.90135
G1 X84.46 Y148.926 E.01556
G1 X130.326 Y103.06 E1.89179
G1 X130.627 Y103.292 E.01109
G1 X84.993 Y148.926 E1.88224
G1 X85.527 Y148.926 E.01556
G1 X130.929 Y103.523 E1.87268
G2 X131.279 Y103.706 I.515 J-.559 E.01166
G1 X86.06 Y148.926 E1.86513
G1 X86.593 Y148.926 E.01556
G1 X87.086 Y148.433 E.02032
G1 X87.39 Y147.835 E.01958
G1 X88.154 Y147.071 E.03151
G1 X88.753 Y146.766 E.01958
G1 X131.657 Y103.862 E1.76962
G1 X132.034 Y104.018 E.01191
M73 P55 R11
G1 X89.537 Y146.516 E1.75285
G1 X90.17 Y146.416 E.01869
G1 X132.411 Y104.174 E1.7423
G1 X132.789 Y104.33 E.01191
G1 X90.634 Y146.486 E1.73874
G1 X91.094 Y146.558 E.0136
G1 X133.166 Y104.486 E1.73531
G1 X133.63 Y104.556 E.01368
G1 X91.483 Y146.703 E1.73842
G1 X91.836 Y146.883 E.01157
G1 X134.101 Y104.618 E1.74327
G1 X134.572 Y104.681 E.01386
G1 X92.19 Y147.063 E1.74811
G1 X92.46 Y147.326 E.011
G1 X135.043 Y104.743 E1.75638
G1 X135.516 Y104.804 E.0139
G1 X92.727 Y147.593 E1.76488
G1 X92.985 Y147.867 E.01101
G1 X136.131 Y104.722 E1.77957
G1 X136.745 Y104.641 E.01808
G1 X93.166 Y148.22 E1.79748
G1 X93.346 Y148.573 E.01156
G1 X137.36 Y104.56 E1.81539
G1 X137.825 Y104.498 E.01368
G1 X138.046 Y104.407 E.00699
G1 X93.358 Y149.095 E1.84324
G1 X93.891 Y149.095 F30000
G1 F15000
G1 X94.567 Y148.419 E.02789
G1 X96.577 Y146.41 F30000
G1 F15000
G1 X138.956 Y104.031 E1.74797
G1 X139.865 Y103.655 E.0287
G1 X97.326 Y146.194 E1.75459
; WIPE_START
G1 F24000
G1 X98.74 Y144.78 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.925 J.79 P1  F30000
G1 X102.425 Y149.095 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X102.917 Y148.603 E.02031
; WIPE_START
G1 F24000
G1 X102.425 Y149.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.01 J1.217 P1  F30000
G1 X121.78 Y148.942 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X123.355 Y147.367 E.06495
G1 X122.942 Y148.176 E.02649
G1 X122.916 Y148.339 E.00481
G1 X122.16 Y149.095 E.03119
; WIPE_START
G1 F24000
G1 X122.916 Y148.339 E-.40633
G1 X122.942 Y148.176 E-.06273
G1 X123.29 Y147.494 E-.29094
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.047 J-1.216 P1  F30000
G1 X82.157 Y149.095 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X86.71 Y144.542 E.1878
G1 X86.445 Y144.725 E.00939
G1 X85.717 Y145.002 E.0227
G1 X82.296 Y148.423 E.1411
G1 X82.296 Y147.889 E.01556
G1 X84.857 Y145.328 E.10563
G1 X83.997 Y145.655 E.02683
G1 X82.296 Y147.356 E.07016
G1 X82.296 Y146.822 E.01556
G1 X83.385 Y145.734 E.0449
G1 X82.778 Y145.807 E.01783
G1 X82.126 Y146.459 E.02686
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X82.778 Y145.807 E-.35
G1 X83.385 Y145.734 E-.23234
G1 X83.054 Y146.064 E-.17766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I-.8 J.917 P1  F30000
G1 X189.5 Y239 Z1.6
G1 Z1.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X156.500 Y219.500  
;--------------------
; CP EMPTY GRID START
; layer #8
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791

; WIPE_START
G1 F24000
G1 X188 Y239.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.137 J-.434 P1  F30000
G1 X151.695 Y144.389 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X151.459 Y144.427 E.00696
G2 X149.868 Y145.239 I120.514 J238.087 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I438.724 J438.895 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03844
G2 X114.676 Y146.453 I182.811 J360.009 E.0384
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
M73 P56 R11
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-62.643 J121.804 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.569 Y96.071 E.19957
G1 X85.449 Y96.071 E.11312
G1 X85.734 Y98.244 E.0639
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I279.313 J-670.317 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-430.125 J-1041.184 E.07017
G1 X101.146 Y102.373 E.07011
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G2 X113.5 Y104.274 I526.699 J-1270.298 E.0663
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.06251
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.688 I323.725 J-279.311 E.06399
G1 X150.693 Y102.874 E.064
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-57.676 J-200.138 E.06402
G1 X158.946 Y101.687 E.064
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05212
G2 X154.99 Y144.427 I-141.358 J274.982 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.754 Y144.38 E.04341
M204 S10000
; WIPE_START
G1 F24000
G1 X151.459 Y144.427 E-.11355
G1 X149.944 Y145.2 E-.64645
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.161 J.364 P1  F30000
G1 X165.268 Y96.278 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X165.941 Y96.952 E.02777
G1 X165.941 Y97.485
G1 X164.735 Y96.278 E.04976
G1 X164.201 Y96.278
G1 X165.941 Y98.018 E.07175
G1 X165.941 Y98.552
G1 X163.668 Y96.278 E.09374
G1 X163.135 Y96.278
G1 X165.941 Y99.085 E.11573
G1 X165.941 Y99.618
G1 X162.602 Y96.278 E.13772
G1 X162.068 Y96.278
G1 X165.899 Y100.11 E.15798
G1 X165.433 Y100.177
G1 X161.73 Y96.473 E.15272
G1 X161.662 Y96.939
G1 X164.967 Y100.244 E.13628
G1 X164.501 Y100.311
G1 X161.595 Y97.405 E.11985
G1 X161.527 Y97.87
G1 X164.085 Y100.428 E.10547
G1 X163.719 Y100.595
G1 X161.408 Y98.284 E.09531
G1 X161.241 Y98.65
G1 X163.353 Y100.763 E.08711
G1 X162.987 Y100.93
G1 X161.073 Y99.016 E.0789
G1 X160.906 Y99.383
G1 X162.621 Y101.097 E.0707
G1 X162.275 Y101.284
G1 X160.739 Y99.749 E.06333
G1 X160.572 Y100.115
G1 X161.989 Y101.532 E.05843
G1 X161.703 Y101.779
G1 X160.331 Y100.407 E.0566
G1 X160.083 Y100.692
G1 X161.418 Y102.027 E.05503
G1 X161.132 Y102.274
G1 X159.835 Y100.978 E.05346
G1 X159.588 Y101.264
G1 X160.846 Y102.522 E.05189
G1 X160.612 Y102.821
G1 X159.34 Y101.549 E.05243
G1 X159.092 Y101.835
G1 X160.403 Y103.145 E.05405
G1 X160.194 Y103.47
G1 X158.771 Y102.046 E.05872
G1 X158.446 Y102.255
G1 X159.986 Y103.795 E.06351
G1 X159.777 Y104.12
G1 X158.121 Y102.464 E.0683
G1 X157.797 Y102.672
G1 X159.586 Y104.461 E.07378
G1 X159.465 Y104.873
G1 X157.472 Y102.881 E.08217
G1 X157.137 Y103.079
G1 X159.344 Y105.286 E.09099
G1 X159.222 Y105.698
G1 X156.725 Y103.2 E.10298
G1 X156.313 Y103.322
G1 X159.101 Y106.11 E.11496
G1 X159.013 Y106.555
G1 X155.902 Y103.444 E.12832
G1 X155.49 Y103.565
G1 X159.013 Y107.088 E.1453
G1 X159.013 Y107.622
G1 X155.076 Y103.685 E.16235
G1 X154.559 Y103.7
G1 X159.013 Y108.155 E.18369
G1 X159.083 Y108.758
G1 X154.026 Y103.7 E.20855
G1 X153.492 Y103.7
G1 X159.305 Y109.513 E.2397
G1 X159.527 Y110.268
G1 X152.959 Y103.7 E.27085
G1 X152.283 Y103.558
G1 X160.211 Y111.486 E.32694
M204 S10000
; WIPE_START
G1 F24000
G1 X158.797 Y110.072 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.726 J.977 P1  F30000
G1 X165.02 Y114.695 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X165.941 Y115.616 E.03798
G1 X165.941 Y116.15
G1 X164.398 Y114.606 E.06364
G1 X163.491 Y114.233
G1 X165.941 Y116.683 E.10103
G1 X165.941 Y117.216
G1 X162.509 Y113.784 E.14153
M204 S10000
; WIPE_START
G1 F24000
G1 X163.924 Y115.198 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.972 J.732 P1  F30000
G1 X165.547 Y117.355 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X151.528 Y103.336 E.57811
G1 X150.772 Y103.114
G1 X165.08 Y117.422 E.59003
G1 X164.614 Y117.489
G1 X149.443 Y102.318 E.62562
M204 S10000
; WIPE_START
G1 F24000
G1 X150.858 Y103.732 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.002 J-.691 P1  F30000
G1 X146.118 Y96.859 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X145.537 Y96.278 E.02395
G1 X145.004 Y96.278
G1 X146.207 Y97.482 E.04961
G1 X146.303 Y98.111
G1 X144.47 Y96.278 E.07556
G1 X143.937 Y96.278
G1 X146.752 Y99.093 E.11608
G1 X147.201 Y100.076
G1 X143.82 Y96.695 E.13943
G1 X143.758 Y97.166
G1 X164.204 Y117.612 E.84315
G1 X163.838 Y117.779
G1 X143.696 Y97.637 E.83061
G1 X143.621 Y98.095
G1 X163.472 Y117.946 E.81862
G1 X163.106 Y118.113
G1 X143.465 Y98.472 E.80996
G1 X143.308 Y98.849
G1 X162.739 Y118.28 E.80129
G1 X162.427 Y118.501
G1 X143.152 Y99.226 E.79483
G1 X142.996 Y99.604
G1 X162.141 Y118.748 E.78948
G1 X161.855 Y118.996
G1 X142.84 Y99.981 E.78413
G1 X142.626 Y100.3
G1 X161.569 Y119.243 E.78116
G1 X161.283 Y119.491
G1 X142.395 Y100.602 E.77892
G1 X142.163 Y100.904
G1 X161.033 Y119.773 E.77813
G1 X160.824 Y120.098
G1 X141.932 Y101.206 E.77908
G1 X141.7 Y101.507
G1 X160.616 Y120.423 E.78004
G1 X160.407 Y120.748
G1 X141.469 Y101.809 E.78099
G1 X141.168 Y102.042
G1 X160.199 Y121.072 E.78477
G1 X160.021 Y121.428
G1 X140.867 Y102.274 E.78987
G1 X140.565 Y102.505
G1 X159.9 Y121.84 E.79732
G1 X159.779 Y122.253
G1 X140.264 Y102.737 E.80478
G1 X139.962 Y102.969
G1 X159.658 Y122.665 E.81223
G1 X159.537 Y123.077
G1 X139.645 Y103.185 E.82031
G1 X139.268 Y103.341
G1 X159.509 Y123.583 E.83471
G1 X159.509 Y124.116
G1 X138.891 Y103.497 E.85027
G1 X138.513 Y103.653
G1 X159.509 Y124.649 E.86583
G1 X159.526 Y125.199
G1 X138.136 Y103.809 E.88206
G1 X137.759 Y103.965
G1 X159.746 Y125.953 E.90672
G1 X159.967 Y126.707
G1 X137.305 Y104.045 E.93454
G1 X136.834 Y104.107
G1 X160.606 Y127.879 E.9803
M204 S10000
; WIPE_START
G1 F24000
G1 X159.192 Y126.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.721 J.98 P1  F30000
G1 X165.247 Y130.92 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X165.941 Y131.614 E.02861
G1 X165.941 Y132.148
G1 X164.624 Y130.831 E.05431
G1 X163.767 Y130.506
G1 X165.941 Y132.681 E.08967
G1 X165.862 Y133.135
G1 X162.786 Y130.059 E.12685
M204 S10000
; WIPE_START
G1 F24000
G1 X164.201 Y131.473 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P57 R11
G3 Z1.8 I-1 J.693 P1  F30000
G1 X165.402 Y133.208 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X136.363 Y104.169 E1.19751
G1 X135.892 Y104.231
G1 X164.942 Y133.281 E1.19795
G1 X164.482 Y133.354
G1 X135.394 Y104.267 E1.1995
G1 X134.78 Y104.186
G1 X164.104 Y133.51 E1.20926
G1 X163.75 Y133.69
G1 X134.165 Y104.104 E1.22004
G1 X133.55 Y104.023
G1 X163.397 Y133.87 E1.23081
G1 X163.044 Y134.049
G1 X132.747 Y103.753 E1.24937
G1 X131.838 Y103.377
G1 X162.69 Y134.229 E1.27229
G1 X162.398 Y134.47
G1 X130.363 Y102.435 E1.32103
M204 S10000
; WIPE_START
G1 F24000
G1 X131.777 Y103.85 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.007 J-.684 P1  F30000
G1 X127.264 Y97.203 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X126.339 Y96.278 E.03814
G1 X125.806 Y96.278
G1 X127.345 Y97.817 E.06346
G1 X127.615 Y98.621
G1 X125.273 Y96.278 E.09659
G1 X124.739 Y96.278
G1 X127.993 Y99.532 E.13418
M204 S10000
; WIPE_START
G1 F24000
G1 X126.579 Y98.118 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.943 J.769 P1  F30000
G1 X128.937 Y101.01 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X124.572 Y96.645 E.18
G1 X124.51 Y97.116
G1 X162.131 Y134.737 E1.5514
G1 X161.864 Y135.003
G1 X124.448 Y97.587 E1.54296
G1 X124.386 Y98.058
G1 X161.598 Y135.27 E1.53453
G1 X161.331 Y135.536
G1 X124.252 Y98.457 E1.52906
G1 X124.096 Y98.835
G1 X161.096 Y135.835 E1.52582
G1 X160.916 Y136.188
G1 X123.94 Y99.212 E1.52483
G1 X123.784 Y99.589
G1 X160.736 Y136.542 E1.52383
G1 X160.556 Y136.895
G1 X123.628 Y99.967 E1.52284
G1 X123.468 Y100.339
G1 X160.376 Y137.248 E1.52203
G1 X160.229 Y137.634
G1 X123.236 Y100.641 E1.5255
G1 X123.004 Y100.943
G1 X160.156 Y138.094 E1.53204
G1 X160.083 Y138.554
G1 X122.773 Y101.244 E1.53859
G1 X122.541 Y101.546
G1 X160.01 Y139.015 E1.54513
G1 X159.937 Y139.475
G1 X122.309 Y101.847 E1.55167
G1 X122.078 Y102.149
G1 X160.036 Y140.107 E1.56531
G1 X160.136 Y140.741
G1 X121.78 Y102.385 E1.5817
G1 X121.479 Y102.617
G1 X160.237 Y141.375 E1.59829
G1 X160.726 Y142.397
G1 X121.177 Y102.848 E1.63091
M204 S10000
; WIPE_START
G1 F24000
G1 X122.591 Y104.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.502 J-1.109 P1  F30000
G1 X107.012 Y97.216 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X106.075 Y96.278 E.03866
G1 X105.542 Y96.278
G1 X107.094 Y97.83 E.06399
G1 X107.307 Y98.577
G1 X105.008 Y96.278 E.0948
G1 X104.475 Y96.278
G1 X107.683 Y99.486 E.13227
G1 X108.171 Y100.507
G1 X103.992 Y96.328 E.17233
M204 S10000
; WIPE_START
G1 F24000
G1 X105.406 Y97.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.052 J-1.216 P1  F30000
G1 X85.346 Y96.88 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X84.744 Y96.278 E.0248
G1 X84.211 Y96.278
G1 X85.426 Y97.494 E.05012
G1 X85.507 Y98.108
G1 X83.678 Y96.278 E.07544
M73 P58 R11
G1 X83.144 Y96.278
G1 X85.793 Y98.927 E.1092
G1 X86.17 Y99.837
G1 X82.611 Y96.278 E.14675
G1 X82.078 Y96.278
G1 X86.816 Y101.016 E.19537
M204 S10000
; WIPE_START
G1 F24000
G1 X85.401 Y99.602 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.609 J1.053 P1  F30000
G1 X165.097 Y145.701 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X165.941 Y146.546 E.03483
G1 X165.941 Y147.079
G1 X164.463 Y145.601 E.06097
G1 X163.439 Y145.11
G1 X165.941 Y147.612 E.1032
G1 X165.941 Y148.146
G1 X120.875 Y103.079 E1.85843
G1 X120.573 Y103.311
G1 X165.941 Y148.679 E1.87088
G1 X165.941 Y149.212
G1 X120.272 Y103.542 E1.88332
G1 X119.908 Y103.713
G1 X165.639 Y149.444 E1.88585
G1 X165.106 Y149.444
G1 X119.531 Y103.869 E1.87941
G1 X119.154 Y104.025
G1 X164.573 Y149.444 E1.87298
G1 X164.04 Y149.444
G1 X118.777 Y104.181 E1.86654
G1 X118.399 Y104.337
G1 X163.506 Y149.444 E1.86011
G1 X162.973 Y149.444
G1 X118.012 Y104.483 E1.8541
G1 X117.541 Y104.545
G1 X162.44 Y149.444 E1.85154
G1 X161.907 Y149.444
G1 X117.07 Y104.607 E1.84897
G1 X116.598 Y104.669
G1 X161.373 Y149.444 E1.84641
G1 X160.84 Y149.444
G1 X158.267 Y146.87 E.10612
G1 X158.818 Y147.955
G1 X160.307 Y149.444 E.06138
G1 X159.773 Y149.444
G1 X158.95 Y148.621 E.03395
M204 S10000
; WIPE_START
G1 F24000
G1 X159.773 Y149.444 E-.44237
G1 X160.307 Y149.444 E-.20264
G1 X160.093 Y149.23 E-.11499
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.914 J-.804 P1  F30000
G1 X156.215 Y144.819 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X116.127 Y104.731 E1.65312
G1 X115.626 Y104.763
G1 X155.126 Y144.263 E1.6289
G1 X154.463 Y144.133
G1 X115.012 Y104.682 E1.62687
G1 X114.398 Y104.601
G1 X153.829 Y144.032 E1.62605
G1 X153.203 Y143.94
G1 X113.783 Y104.52 E1.62558
G1 X113.037 Y104.307
G1 X152.743 Y144.013 E1.6374
G1 X152.283 Y144.086
G1 X112.127 Y103.931 E1.65591
G1 X111.101 Y103.437
G1 X151.823 Y144.159 E1.67928
G1 X151.37 Y144.24
G1 X103.93 Y96.799 E1.95633
G1 X103.867 Y97.27
M73 P58 R10
G1 X151.016 Y144.419 E1.94431
G1 X150.663 Y144.6
G1 X103.805 Y97.741 E1.93233
G1 X103.743 Y98.212
G1 X150.31 Y144.78 E1.92035
G1 X149.957 Y144.96
G1 X103.604 Y98.607 E1.91152
G1 X103.448 Y98.984
G1 X149.639 Y145.175 E1.90481
G1 X149.372 Y145.441
G1 X103.292 Y99.361 E1.90024
G1 X103.136 Y99.738
G1 X149.105 Y145.708 E1.89566
G1 X148.838 Y145.974
G1 X102.98 Y100.116 E1.89109
G1 X102.824 Y100.493
M73 P59 R10
G1 X148.571 Y146.24 E1.88652
G1 X148.346 Y146.549
G1 X102.608 Y100.81 E1.88614
G1 X102.376 Y101.112
G1 X148.166 Y146.902 E1.88827
G1 X147.986 Y147.255
G1 X102.145 Y101.414 E1.8904
G1 X101.913 Y101.715
G1 X147.806 Y147.608 E1.89253
G1 X147.626 Y147.962
G1 X101.681 Y102.017 E1.89465
G1 X101.45 Y102.319
G1 X147.532 Y148.401 E1.90034
G1 X147.46 Y148.862
G1 X101.195 Y102.597 E1.90785
G1 X100.893 Y102.829
G1 X147.387 Y149.322 E1.9173
M204 S10000
; WIPE_START
G1 F24000
G1 X145.973 Y147.908 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.515 J-1.102 P1  F30000
G1 X144.972 Y147.44 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X146.975 Y149.444 E.08262
G1 X146.442 Y149.444
G1 X145.382 Y148.384 E.04369
G1 X145.482 Y149.017
G1 X145.908 Y149.444 E.01758
M204 S10000
; WIPE_START
G1 F24000
G1 X145.482 Y149.017 E-.22912
G1 X145.382 Y148.384 E-.2436
G1 X145.917 Y148.919 E-.28728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.922 J-.794 P1  F30000
G1 X142.614 Y145.082 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X100.591 Y103.06 E1.7329
G1 X100.29 Y103.292
G1 X141.67 Y144.672 E1.70642
G1 X141.036 Y144.572
G1 X99.988 Y103.523 E1.69275
G1 X99.686 Y103.755
G1 X140.403 Y144.472 E1.67908
G1 X139.885 Y144.487
G1 X99.384 Y103.986 E1.67017
G1 X99.018 Y104.153
G1 X139.425 Y144.56 E1.6663
G1 X138.964 Y144.633
G1 X98.641 Y104.309 E1.66285
G1 X98.264 Y104.465
G1 X138.507 Y144.709 E1.65954
G1 X138.154 Y144.889
G1 X107.593 Y114.327 E1.26028
G1 X107.551 Y114.286
G1 X97.887 Y104.622 E.39852
M73 P60 R10
G1 X97.51 Y104.778
G1 X137.801 Y145.069 E1.66151
G1 X137.447 Y145.249
G1 X97.132 Y104.934 E1.66249
G1 X96.677 Y105.011
G1 X137.094 Y145.429 E1.66671
G1 X136.806 Y145.674
G1 X96.205 Y105.073 E1.67427
G1 X95.734 Y105.135
G1 X136.539 Y145.94 E1.68271
G1 X136.273 Y146.207
G1 X95.263 Y105.197 E1.69115
G1 X94.791 Y105.259
G1 X136.006 Y146.474 E1.69959
G1 X135.761 Y146.762
G1 X94.226 Y105.227 E1.71284
G1 X93.612 Y105.146
G1 X135.581 Y147.116 E1.73073
G1 X135.401 Y147.469
G1 X92.998 Y105.065 E1.74863
G1 X92.384 Y104.985
G1 X135.221 Y147.822 E1.76652
G1 X135.041 Y148.175
G1 X91.566 Y104.7 E1.79283
G1 X90.655 Y104.322
G1 X134.966 Y148.633 E1.8273
G1 X134.893 Y149.094
G1 X89.47 Y103.671 E1.87314
M204 S10000
; WIPE_START
G1 F24000
G1 X90.885 Y105.085 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.834 J-.886 P1  F30000
G1 X81.777 Y96.51 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X134.71 Y149.444 E2.18285
G1 X134.177 Y149.444
G1 X132.527 Y147.794 E.06803
G1 X132.855 Y148.655
G1 X133.643 Y149.444 E.03252
M204 S10000
; WIPE_START
G1 F24000
G1 X132.855 Y148.655 E-.42376
G1 X132.54 Y147.828 E-.33624
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.864 J-.857 P1  F30000
G1 X130.19 Y145.458 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X81.777 Y97.044 E1.99647
G1 X81.777 Y97.577
G1 X129.329 Y145.129 E1.96095
G1 X128.695 Y145.029
G1 X81.777 Y98.111 E1.93481
G1 X81.777 Y98.644
G1 X128.079 Y144.945 E1.90937
G1 X127.618 Y145.018
G1 X89.202 Y106.602 E1.58419
M204 S10000
; WIPE_START
G1 F24000
G1 X90.616 Y108.016 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.033 J-1.217 P1  F30000
G1 X90.068 Y108.001 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X127.158 Y145.091 E1.5295
G1 X126.697 Y145.164
G1 X90.642 Y109.109 E1.48684
G1 X90.816 Y109.816
G1 X126.322 Y145.322 E1.46416
M73 P61 R10
G1 X125.968 Y145.501
G1 X90.991 Y110.524 E1.44239
G1 X91.165 Y111.232
G1 X125.614 Y145.681 E1.42061
G1 X125.261 Y145.861
G1 X91.208 Y111.808 E1.40425
G1 X91.208 Y112.341
G1 X124.986 Y146.119 E1.39293
G1 X124.72 Y146.386
G1 X91.208 Y112.875 E1.38195
G1 X91.208 Y113.408
G1 X124.454 Y146.653 E1.37097
G1 X124.187 Y146.92
G1 X91.18 Y113.913 E1.36116
G1 X91.074 Y114.341
G1 X123.992 Y147.258 E1.35745
G1 X123.812 Y147.611
G1 X90.969 Y114.768 E1.35437
G1 X90.864 Y115.196
G1 X123.632 Y147.964 E1.35129
G1 X123.451 Y148.317
G1 X90.758 Y115.624 E1.3482
G1 X90.653 Y116.052
G1 X123.372 Y148.772 E1.34929
G1 X123.3 Y149.232
G1 X90.482 Y116.414 E1.35334
G1 X90.298 Y116.764
G1 X122.978 Y149.444 E1.34764
G1 X122.445 Y149.444
G1 X121.213 Y148.212 E.0508
G1 X121.431 Y148.963
G1 X121.911 Y149.444 E.01981
M204 S10000
; WIPE_START
G1 F24000
G1 X121.431 Y148.963 E-.25813
G1 X121.213 Y148.212 E-.29736
G1 X121.593 Y148.592 E-.20451
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.861 J-.861 P1  F30000
G1 X118.8 Y145.799 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X90.115 Y117.114 E1.18292
G1 X89.931 Y117.463
G1 X118.048 Y145.58 E1.15946
G1 X117.413 Y145.478
G1 X89.748 Y117.813 E1.14085
G1 X89.564 Y118.163
G1 X116.881 Y145.48 E1.12648
G1 X116.421 Y145.553
G1 X89.328 Y118.46 E1.11726
G1 X89.077 Y118.743
G1 X115.961 Y145.627 E1.10865
G1 X115.567 Y145.766
G1 X88.827 Y119.025 E1.10271
G1 X88.576 Y119.308
G1 X115.214 Y145.946 E1.09849
G1 X114.861 Y146.126
G1 X88.325 Y119.591 E1.09426
G1 X88.075 Y119.873
G1 X114.519 Y146.317 E1.09049
G1 X114.252 Y146.583
G1 X87.795 Y120.126 E1.09103
G1 X87.479 Y120.344
G1 X113.985 Y146.85 E1.09303
G1 X113.718 Y147.116
G1 X87.164 Y120.562 E1.09503
G1 X86.848 Y120.78
G1 X113.491 Y147.422 E1.09868
G1 X113.311 Y147.776
G1 X86.532 Y120.997 E1.10428
G1 X86.217 Y121.215
G1 X113.131 Y148.129 E1.10987
G1 X112.951 Y148.482
G1 X85.886 Y121.417 E1.1161
G1 X85.499 Y121.564
M73 P62 R10
G1 X112.875 Y148.94 E1.1289
G1 X112.803 Y149.4
G1 X85.113 Y121.711 E1.14185
G1 X84.727 Y121.858
G1 X112.312 Y149.444 E1.13758
G1 X111.779 Y149.444
G1 X110.455 Y148.119 E.05463
G1 X110.776 Y148.974
G1 X111.246 Y149.444 E.01939
M204 S10000
; WIPE_START
G1 F24000
G1 X110.776 Y148.974 E-.25263
G1 X110.455 Y148.119 E-.34691
G1 X110.753 Y148.418 E-.16045
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.861 J-.861 P1  F30000
G1 X108.671 Y146.335 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X84.34 Y122.005 E1.00333
G1 X83.954 Y122.152
G1 X107.88 Y146.078 E.98667
G1 X107.248 Y145.979
G1 X83.529 Y122.26 E.9781
G1 X83.054 Y122.318
G1 X87.315 Y126.579 E.17572
M204 S10000
; WIPE_START
G1 F24000
G1 X85.901 Y125.165 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.007 P1  F30000
G1 X85.898 Y125.695 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X82.578 Y122.376 E.13689
G1 X82.103 Y122.433
G1 X85.038 Y125.369 E.12104
G1 X84.178 Y125.042
G1 X81.778 Y122.642 E.09896
G1 X81.778 Y123.176
G1 X83.476 Y124.873 E.07
M73 P62 R9
G1 X82.869 Y124.799
G1 X81.778 Y123.709 E.04498
G1 X81.778 Y124.242
G1 X82.262 Y124.726 E.01995
M204 S10000
; WIPE_START
G1 F24000
G1 X81.778 Y124.242 E-.26001
G1 X81.778 Y123.709 E-.20264
G1 X82.331 Y124.262 E-.29735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.177 J.308 P1  F30000
G1 X87.415 Y104.815 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X81.777 Y99.177 E.2325
G1 X81.777 Y99.711
G1 X85.83 Y103.764 E.16713
G1 X84.971 Y103.438
G1 X81.777 Y100.244 E.13171
G1 X81.778 Y100.778
G1 X84.113 Y103.113 E.09629
G1 X83.394 Y102.928
G1 X81.778 Y101.311 E.06667
G1 X81.778 Y101.844
G1 X82.787 Y102.854 E.04163
G1 X82.18 Y102.78
G1 X81.778 Y102.378 E.01659
M204 S10000
; WIPE_START
G1 F24000
G1 X82.18 Y102.78 E-.21623
G1 X82.787 Y102.854 E-.23236
G1 X82.208 Y102.274 E-.31141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.169 J.338 P1  F30000
G1 X90.028 Y129.293 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X106.718 Y145.982 E.68823
G1 X106.257 Y146.054
G1 X90.617 Y130.415 E.64494
G1 X91.134 Y131.465
G1 X105.796 Y146.127 E.60462
G1 X105.439 Y146.303
G1 X91.308 Y132.172 E.58273
G1 X91.482 Y132.88
G1 X105.086 Y146.483 E.56097
G1 X104.732 Y146.663
G1 X91.657 Y133.587 E.53921
G1 X91.704 Y134.168
G1 X104.455 Y146.919 E.52582
G1 X104.189 Y147.186
G1 X91.704 Y134.701 E.51484
G1 X91.704 Y135.235
G1 X103.922 Y147.453 E.50386
G1 X103.709 Y147.773
G1 X91.704 Y135.768 E.49507
G1 X91.703 Y136.3
G1 X103.529 Y148.126 E.4877
G1 X103.349 Y148.479
G1 X91.597 Y136.728 E.48462
G1 X91.492 Y137.156
G1 X103.225 Y148.888 E.48383
G1 X103.152 Y149.348
G1 X91.387 Y137.583 E.48516
G1 X91.281 Y138.011
G1 X102.714 Y149.444 E.47144
G1 X102.18 Y149.444
G1 X100.996 Y148.259 E.04885
M204 S10000
; WIPE_START
G1 F24000
G1 X102.18 Y149.444 E-.63657
G1 X102.505 Y149.444 E-.12343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.808 J-.91 P1  F30000
G1 X99.618 Y146.881 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X91.176 Y138.439 E.34811
G1 X91.046 Y138.843
G1 X98.758 Y146.555 E.31803
G1 X98.124 Y146.453
G1 X90.862 Y139.192 E.29943
G1 X90.679 Y139.542
G1 X97.634 Y146.497 E.28683
G1 X97.175 Y146.571
G1 X90.495 Y139.892 E.27544
G1 X90.312 Y140.241
G1 X96.772 Y146.701 E.26639
G1 X96.418 Y146.881
G1 X90.128 Y140.591 E.25939
G1 X89.945 Y140.941
G1 X96.065 Y147.061 E.25239
G1 X95.784 Y147.314
G1 X89.697 Y141.226 E.25102
G1 X89.446 Y141.509
G1 X95.517 Y147.58 E.25036
G1 X95.251 Y147.847
G1 X89.196 Y141.792 E.2497
G1 X88.945 Y142.074
G1 X95.07 Y148.199 E.25259
G1 X94.89 Y148.553
G1 X88.694 Y142.357 E.2555
M73 P63 R9
G1 X88.444 Y142.639
G1 X94.741 Y148.937 E.25971
G1 X94.668 Y149.397
G1 X88.173 Y142.902 E.26783
G1 X87.858 Y143.12
G1 X94.181 Y149.444 E.26077
G1 X93.648 Y149.444
G1 X92.751 Y148.547 E.03698
M204 S10000
; WIPE_START
G1 F24000
G1 X93.648 Y149.444 E-.48188
G1 X94.181 Y149.444 E-.20264
G1 X94.041 Y149.303 E-.07548
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.755 J-.955 P1  F30000
G1 X91.495 Y147.29 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X87.542 Y143.338 E.16299
G1 X87.227 Y143.556
G1 X90.69 Y147.019 E.14281
G1 X90.091 Y146.953
G1 X86.911 Y143.774 E.1311
G1 X86.596 Y143.991
G1 X89.63 Y147.025 E.12511
G1 X89.194 Y147.123
G1 X86.28 Y144.209 E.12015
G1 X85.912 Y144.374
G1 X88.841 Y147.303 E.12079
G1 X88.487 Y147.482
G1 X85.525 Y144.52 E.12215
G1 X85.139 Y144.667
G1 X88.214 Y147.743 E.12684
G1 X87.948 Y148.01
G1 X84.752 Y144.814 E.13178
G1 X84.366 Y144.961
G1 X87.725 Y148.32 E.13852
G1 X87.545 Y148.673
G1 X83.979 Y145.108 E.14704
G1 X83.533 Y145.194
G1 X87.386 Y149.048 E.15892
G1 X87.249 Y149.444
G1 X83.057 Y145.252 E.17286
G1 X82.581 Y145.31
G1 X86.715 Y149.444 E.17048
G1 X86.182 Y149.444
G1 X82.106 Y145.367 E.16811
G1 X81.778 Y145.573
G1 X85.649 Y149.444 E.15962
G1 X85.116 Y149.444
G1 X81.778 Y146.106 E.13763
G1 X81.778 Y146.639
G1 X84.582 Y149.444 E.11564
G1 X84.049 Y149.444
G1 X81.778 Y147.173 E.09365
G1 X81.778 Y147.706
G1 X83.516 Y149.444 E.07166
G1 X82.983 Y149.444
G1 X81.778 Y148.239 E.04967
G1 X81.778 Y148.772
G1 X82.449 Y149.444 E.02768
M204 S10000
; WIPE_START
G1 F24000
G1 X81.778 Y148.772 E-.3607
G1 X81.778 Y148.239 E-.20264
G1 X82.144 Y148.605 E-.19666
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.666 J1.018 P1  F30000
G1 X161.998 Y96.349 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.149246
G1 F15000
G2 X161.729 Y96.348 I-.135 J.195 E.00236
; WIPE_START
G1 F24000
G1 X161.83 Y96.307 E-.29075
G1 X161.896 Y96.307 E-.17656
G1 X161.998 Y96.349 E-.29268
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.118 J-1.211 P1  F30000
G1 X108.943 Y101.516 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X108.665 Y101.2 E.00147
; LINE_WIDTH: 0.137752
G1 X108.388 Y100.884 E.00308
; LINE_WIDTH: 0.187335
G1 X108.111 Y100.568 E.0047
; WIPE_START
G1 F24000
G1 X108.388 Y100.884 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.854 J.867 P1  F30000
G1 X111.04 Y103.497 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.236843
G1 F15000
G1 X110.726 Y103.222 E.00627
; LINE_WIDTH: 0.187286
G1 X110.411 Y102.946 E.00467
; LINE_WIDTH: 0.137728
G1 X110.097 Y102.67 E.00307
; WIPE_START
G1 F24000
G1 X110.411 Y102.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.267 J1.187 P1  F30000
G1 X127.787 Y99.034 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X127.709 Y98.917 E.00049
; LINE_WIDTH: 0.1289
G1 X127.631 Y98.8 E.00093
; LINE_WIDTH: 0.16963
G1 X127.553 Y98.683 E.00138
; WIPE_START
G1 F24000
G1 X127.631 Y98.8 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.103 J.515 P1  F30000
G1 X128.165 Y99.945 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X128.087 Y99.828 E.00049
; LINE_WIDTH: 0.1289
G1 X128.009 Y99.711 E.00093
; LINE_WIDTH: 0.16963
G1 X127.931 Y99.595 E.00138
; WIPE_START
G1 F24000
G1 X128.009 Y99.711 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.939 J.774 P1  F30000
G1 X130.303 Y102.496 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.236909
G1 F15000
G1 X130.05 Y102.274 E.00504
; LINE_WIDTH: 0.197357
G1 X129.798 Y102.053 E.00401
; LINE_WIDTH: 0.156681
G3 X129.539 Y101.824 I1.616 J-2.096 E.00304
; LINE_WIDTH: 0.118254
G1 X129.318 Y101.573 E.00195
; LINE_WIDTH: 0.157787
G1 X129.098 Y101.321 E.00297
; LINE_WIDTH: 0.19732
G1 X128.877 Y101.07 E.00399
; WIPE_START
G1 F24000
G1 X129.098 Y101.321 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.652 J1.028 P1  F30000
G1 X133.475 Y104.098 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.120535
G1 F15000
G1 X133.241 Y103.963 E.00162
; WIPE_START
G1 F24000
G1 X133.475 Y104.098 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.033 J1.217 P1  F30000
G1 X137.716 Y103.982 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0895537
G1 F15000
G3 X137.586 Y104.059 I-.644 J-.94 E.00055
; WIPE_START
G1 F24000
G1 X137.716 Y103.982 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.639 J1.035 P1  F30000
G1 X146.506 Y98.554 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X146.417 Y98.427 E.00054
; LINE_WIDTH: 0.130104
G1 X146.329 Y98.3 E.00104
; LINE_WIDTH: 0.172039
G1 X146.241 Y98.173 E.00155
; WIPE_START
G1 F24000
G1 X146.329 Y98.3 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.018 J.667 P1  F30000
G1 X148.498 Y101.608 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0882219
G1 F15000
G1 X148.064 Y101.142 E.00223
; LINE_WIDTH: 0.133088
G1 X147.629 Y100.675 E.00444
; LINE_WIDTH: 0.180062
G1 X147.195 Y100.209 E.00676
G1 X147.196 Y100.178 E.00033
; LINE_WIDTH: 0.179981
G1 X147.207 Y100.07 E.00115
; WIPE_START
G1 F24000
G1 X147.196 Y100.178 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.863 J.858 P1  F30000
G1 X149.383 Y102.379 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.228392
G1 F15000
G1 X149.182 Y102.217 E.00369
; LINE_WIDTH: 0.181651
G1 X148.982 Y102.056 E.00276
; LINE_WIDTH: 0.134911
G1 X148.782 Y101.894 E.00183
; WIPE_START
G1 F24000
G1 X148.982 Y102.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.668 J1.017 P1  F30000
G1 X150.702 Y103.184 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.173983
G1 F15000
G1 X150.58 Y103.1 E.00151
; LINE_WIDTH: 0.167398
G1 X150.427 Y102.976 E.00189
; LINE_WIDTH: 0.127785
G1 X150.274 Y102.853 E.00129
; WIPE_START
G1 F24000
G1 X150.427 Y102.976 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.777 J.936 P1  F30000
G1 X159.677 Y110.657 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.1031
G1 F15000
G3 X159.45 Y110.345 I2.044 J-1.727 E.0018
; WIPE_START
G1 F24000
G1 X159.677 Y110.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.024 J.657 P1  F30000
G1 X160.634 Y112.146 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X160.473 Y111.946 E.0009
; LINE_WIDTH: 0.134897
G1 X160.311 Y111.746 E.00183
; LINE_WIDTH: 0.181624
G1 X160.15 Y111.547 E.00275
; WIPE_START
G1 F24000
G1 X160.311 Y111.746 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.853 J.868 P1  F30000
G1 X162.447 Y113.846 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.211247
G1 F15000
G3 X162.309 Y113.748 I.618 J-1.02 E.0022
; LINE_WIDTH: 0.187749
G1 X161.788 Y113.263 E.00798
; LINE_WIDTH: 0.137959
G1 X161.267 Y112.777 E.00524
; WIPE_START
G1 F24000
G1 X161.788 Y113.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.648 J1.03 P1  F30000
G1 X163.429 Y114.295 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.213949
G1 F15000
G1 X163.302 Y114.207 E.00205
; LINE_WIDTH: 0.172022
G1 X163.175 Y114.118 E.00154
; LINE_WIDTH: 0.130096
G1 X163.048 Y114.03 E.00104
; WIPE_START
G1 F24000
G1 X163.175 Y114.118 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.204 J-.179 P1  F30000
G1 X161.029 Y128.54 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X160.868 Y128.34 E.0009
; LINE_WIDTH: 0.134913
G1 X160.707 Y128.14 E.00183
; LINE_WIDTH: 0.181657
G1 X160.545 Y127.939 E.00276
; WIPE_START
G1 F24000
G1 X160.707 Y128.14 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.853 J.868 P1  F30000
G1 X162.724 Y130.121 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.211002
G1 F15000
G3 X162.581 Y130.02 I.643 J-1.062 E.00229
; LINE_WIDTH: 0.184999
G1 X162.074 Y129.548 E.0076
; LINE_WIDTH: 0.136584
G1 X161.568 Y129.076 E.00501
; WIPE_START
G1 F24000
G1 X162.074 Y129.548 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.646 J1.032 P1  F30000
G1 X163.705 Y130.568 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.213872
G1 F15000
G1 X163.592 Y130.49 E.00182
; LINE_WIDTH: 0.180487
G1 X163.479 Y130.412 E.00146
; LINE_WIDTH: 0.147103
G1 X163.402 Y130.358 E.00076
; LINE_WIDTH: 0.117637
G1 X163.324 Y130.304 E.00054
; WIPE_START
G1 F24000
G1 X163.402 Y130.358 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.195 J-.232 P1  F30000
G1 X160.974 Y142.885 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X160.897 Y142.779 E.00046
; LINE_WIDTH: 0.126805
G1 X160.82 Y142.673 E.00085
; LINE_WIDTH: 0.16544
G1 X160.743 Y142.567 E.00124
; LINE_WIDTH: 0.204075
G1 X160.664 Y142.459 E.00167
; WIPE_START
G1 F24000
G1 X160.743 Y142.567 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.856 J.865 P1  F30000
G1 X163.377 Y145.171 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218228
G1 F15000
G1 X163.235 Y145.068 E.00238
; LINE_WIDTH: 0.174875
G1 X163.093 Y144.965 E.00179
; LINE_WIDTH: 0.131522
G1 X162.951 Y144.862 E.0012
; WIPE_START
G1 F24000
G1 X163.093 Y144.965 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.439 J-1.135 P1  F30000
G1 X158.328 Y146.809 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.21819
G1 F15000
G1 X158.225 Y146.667 E.00238
; LINE_WIDTH: 0.17485
G1 X158.122 Y146.525 E.00179
; LINE_WIDTH: 0.13151
G1 X158.019 Y146.383 E.0012
; WIPE_START
G1 F24000
G1 X158.122 Y146.525 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.872 J-.849 P1  F30000
G1 X156.705 Y145.069 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881698
G1 F15000
G1 X156.562 Y144.965 E.00062
; LINE_WIDTH: 0.13159
G1 X156.419 Y144.861 E.00121
; LINE_WIDTH: 0.17501
G1 X156.276 Y144.757 E.0018
G1 X155.613 Y144.511 F30000
; LINE_WIDTH: 0.0882282
G1 F15000
G1 X155.471 Y144.408 E.00061
; LINE_WIDTH: 0.131543
G1 X155.33 Y144.305 E.0012
; LINE_WIDTH: 0.174858
G1 X155.188 Y144.202 E.00179
; WIPE_START
G1 F24000
G1 X155.33 Y144.305 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.457 J-1.128 P1  F30000
G1 X145.457 Y148.309 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.138819
G1 F15000
G1 X145.372 Y148.17 E.00121
; LINE_WIDTH: 0.131824
G1 X145.277 Y148.039 E.00111
G1 X145.033 Y147.379 F30000
; LINE_WIDTH: 0.218257
G1 F15000
G1 X144.93 Y147.237 E.00238
; LINE_WIDTH: 0.174895
G1 X144.827 Y147.094 E.00179
; LINE_WIDTH: 0.131533
G1 X144.723 Y146.952 E.0012
; WIPE_START
G1 F24000
G1 X144.827 Y147.094 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.87 J-.851 P1  F30000
G1 X143.101 Y145.33 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881707
G1 F15000
G1 X142.959 Y145.227 E.00061
; LINE_WIDTH: 0.131533
G1 X142.817 Y145.124 E.0012
; LINE_WIDTH: 0.174894
G1 X142.675 Y145.021 E.00179
G1 X142.015 Y144.777 F30000
; LINE_WIDTH: 0.0881705
G1 F15000
G1 X141.883 Y144.682 E.00057
; LINE_WIDTH: 0.131824
G1 X141.744 Y144.597 E.00112
; WIPE_START
G1 F24000
G1 X141.883 Y144.682 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.38 J-1.156 P1  F30000
G1 X132.588 Y147.732 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218342
G1 F15000
G1 X132.485 Y147.59 E.00239
; LINE_WIDTH: 0.174951
G1 X132.381 Y147.448 E.0018
; LINE_WIDTH: 0.13156
G1 X132.278 Y147.305 E.00121
; WIPE_START
G1 F24000
G1 X132.381 Y147.448 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.87 J-.851 P1  F30000
G1 X130.678 Y145.705 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X130.536 Y145.602 E.00061
; LINE_WIDTH: 0.131519
G1 X130.394 Y145.499 E.0012
; LINE_WIDTH: 0.174867
G1 X130.252 Y145.396 E.00179
; WIPE_START
G1 F24000
G1 X130.394 Y145.499 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.344 J-1.167 P1  F30000
G1 X128.275 Y144.875 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0923796
G1 F15000
G1 X128.121 Y144.935 E.00063
G1 X128.108 Y144.959 E.00011
; WIPE_START
G1 F24000
G1 X128.121 Y144.935 E-.1089
G1 X128.275 Y144.875 E-.6511
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.815 J-.903 P1  F30000
G1 X123.297 Y149.368 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.162879
G1 F15000
G3 X123.048 Y149.373 I-.129 J-.202 E.00243
; WIPE_START
G1 F24000
G1 X123.126 Y149.406 E-.24369
G1 X123.206 Y149.406 E-.2325
G1 X123.297 Y149.368 E-.28381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.628 J-1.043 P1  F30000
G1 X121.274 Y148.15 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218228
G1 F15000
G1 X121.171 Y148.008 E.00238
; LINE_WIDTH: 0.174875
G1 X121.068 Y147.866 E.00179
; LINE_WIDTH: 0.131523
G1 X120.965 Y147.724 E.0012
; WIPE_START
G1 F24000
G1 X121.068 Y147.866 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.87 J-.851 P1  F30000
G1 X119.287 Y146.047 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X119.145 Y145.944 E.00061
; LINE_WIDTH: 0.131522
G1 X119.003 Y145.841 E.0012
; LINE_WIDTH: 0.174876
G1 X118.861 Y145.738 E.00179
; WIPE_START
G1 F24000
G1 X119.003 Y145.841 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.308 J-1.177 P1  F30000
G1 X110.516 Y148.058 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218332
G1 F15000
G1 X110.412 Y147.915 E.00239
; LINE_WIDTH: 0.174945
G1 X110.309 Y147.773 E.0018
; LINE_WIDTH: 0.131557
G1 X110.205 Y147.63 E.00121
; WIPE_START
G1 F24000
G1 X110.309 Y147.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.861 J-.86 P1  F30000
G1 X109.092 Y146.554 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.13889
G1 F15000
G2 X108.923 Y146.402 I-1.192 J1.165 E.00169
; LINE_WIDTH: 0.158601
G1 X108.828 Y146.338 E.00103
; LINE_WIDTH: 0.185347
G1 X108.733 Y146.273 E.00126
; WIPE_START
G1 F24000
G1 X108.828 Y146.338 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.283 J-1.184 P1  F30000
G1 X101.057 Y148.198 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218276
G1 F15000
G1 X100.972 Y148.08 E.00197
; LINE_WIDTH: 0.182045
G1 X100.886 Y147.962 E.00156
; LINE_WIDTH: 0.112439
G2 X100.794 Y147.837 I-.848 J.526 E.00084
G1 X100.033 Y147.077 E.00578
; LINE_WIDTH: 0.109577
G1 X99.915 Y146.991 E.00075
; LINE_WIDTH: 0.145861
G1 X99.797 Y146.905 E.00116
; LINE_WIDTH: 0.182146
G1 X99.679 Y146.819 E.00157
; WIPE_START
G1 F24000
G1 X99.797 Y146.905 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.269 J-1.187 P1  F30000
G1 X92.813 Y148.486 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218432
G1 F15000
G1 X92.728 Y148.37 E.00195
; LINE_WIDTH: 0.183034
G1 X92.644 Y148.254 E.00155
; LINE_WIDTH: 0.115521
G2 X92.553 Y148.13 I-.843 J.525 E.00087
G1 X91.902 Y147.48 E.00517
; LINE_WIDTH: 0.112262
G1 X91.786 Y147.396 E.00076
; LINE_WIDTH: 0.147575
G1 X91.671 Y147.313 E.00115
; LINE_WIDTH: 0.182888
G1 X91.556 Y147.229 E.00154
; WIPE_START
G1 F24000
G1 X91.671 Y147.313 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.215 J-.071 P1  F30000
G1 X90.679 Y130.353 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.219497
G1 F15000
G1 X90.57 Y130.206 E.0025
; LINE_WIDTH: 0.175722
G1 X90.462 Y130.059 E.00188
; LINE_WIDTH: 0.131946
G1 X90.354 Y129.912 E.00126
G1 X90.09 Y129.231 F30000
; LINE_WIDTH: 0.21713
G1 F15000
G2 X89.977 Y129.08 I-1.314 J.861 E.00255
; LINE_WIDTH: 0.191651
G1 X89.576 Y128.655 E.00672
; LINE_WIDTH: 0.157157
G1 X89.176 Y128.23 E.00516
; LINE_WIDTH: 0.122663
G1 X88.776 Y127.804 E.0036
G1 X88.075 Y127.102 F30000
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X87.842 Y126.908 E.00106
; LINE_WIDTH: 0.136034
G1 X87.609 Y126.713 E.00219
; LINE_WIDTH: 0.183897
G1 X87.375 Y126.519 E.00331
; WIPE_START
G1 F24000
G1 X87.609 Y126.713 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.654 J-1.026 P1  F30000
G1 X86.352 Y125.912 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.105921
G1 F15000
G2 X85.973 Y125.62 I-2.592 J2.97 E.00234
; WIPE_START
G1 F24000
G1 X86.352 Y125.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.753 J-.956 P1  F30000
G1 X82.028 Y122.508 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.138703
G1 F15000
G2 X81.759 Y122.487 I-.16 J.324 E.00205
; WIPE_START
G1 F24000
G1 X81.942 Y122.478 E-.50805
G1 X82.028 Y122.508 E-.25195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.023 J.659 P1  F30000
G1 X90.706 Y109.045 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.214071
G1 F15000
G1 X90.601 Y108.904 E.00233
; LINE_WIDTH: 0.172104
G1 X90.497 Y108.762 E.00176
; LINE_WIDTH: 0.130138
G1 X90.393 Y108.62 E.00119
G1 X90.129 Y107.94 F30000
; LINE_WIDTH: 0.219482
G1 F15000
G1 X90.021 Y107.793 E.00249
; LINE_WIDTH: 0.175712
G1 X89.913 Y107.646 E.00188
; LINE_WIDTH: 0.131941
G1 X89.804 Y107.499 E.00126
; WIPE_START
G1 F24000
G1 X89.913 Y107.646 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.048 J-.618 P1  F30000
G1 X89.262 Y106.542 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.244121
G1 F15000
G1 X88.828 Y106.081 E.00985
; LINE_WIDTH: 0.208202
G1 X88.394 Y105.62 E.00809
; LINE_WIDTH: 0.171656
G2 X87.952 Y105.152 I-4.102 J3.429 E.00642
; LINE_WIDTH: 0.137047
G1 X87.714 Y104.953 E.00226
; LINE_WIDTH: 0.184423
G1 X87.476 Y104.755 E.00339
; WIPE_START
G1 F24000
G1 X87.714 Y104.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.655 J-1.026 P1  F30000
G1 X86.451 Y104.147 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881702
G1 F15000
G1 X86.302 Y104.022 E.00068
; LINE_WIDTH: 0.121886
G1 X86.152 Y103.898 E.00119
; LINE_WIDTH: 0.158493
G2 X85.988 Y103.763 I-1.187 J1.272 E.0019
; LINE_WIDTH: 0.19482
G1 X85.893 Y103.701 E.00133
; WIPE_START
G1 F24000
G1 X85.988 Y103.763 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P64 R9
G3 Z1.8 I1.214 J-.091 P1  F30000
G1 X85.587 Y98.428 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X85.508 Y98.311 E.0005
; LINE_WIDTH: 0.134625
G1 X85.434 Y98.181 E.00106
; WIPE_START
G1 F24000
G1 X85.508 Y98.311 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.118 J.481 P1  F30000
G1 X86.341 Y100.25 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X86.263 Y100.133 E.00049
; LINE_WIDTH: 0.128883
G1 X86.185 Y100.016 E.00093
; LINE_WIDTH: 0.169596
G1 X86.107 Y99.9 E.00137
; WIPE_START
G1 F24000
G1 X86.185 Y100.016 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.998 J.696 P1  F30000
G1 X87.587 Y102.024 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X87.31 Y101.708 E.00147
; LINE_WIDTH: 0.137748
G1 X87.032 Y101.392 E.00308
; LINE_WIDTH: 0.187326
G1 X86.755 Y101.076 E.00469
; WIPE_START
G1 F24000
G1 X87.032 Y101.392 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.853 J.868 P1  F30000
G1 X89.41 Y103.731 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.236851
G1 F15000
G1 X89.095 Y103.455 E.00628
; LINE_WIDTH: 0.187291
G1 X88.781 Y103.179 E.00467
; LINE_WIDTH: 0.13773
G1 X88.466 Y102.903 E.00307
; WIPE_START
G1 F24000
G1 X88.781 Y103.179 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.674 J1.013 P1  F30000
G1 X90.592 Y104.384 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.210418
G1 F15000
G1 X90.475 Y104.306 E.00182
; LINE_WIDTH: 0.169669
G1 X90.358 Y104.228 E.00138
; LINE_WIDTH: 0.12892
G1 X90.241 Y104.15 E.00094
; WIPE_START
G1 F24000
G1 X90.358 Y104.228 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.476 J1.12 P1  F30000
G1 X92.31 Y105.058 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.141405
G1 F15000
G1 X92.058 Y104.913 E.00222
; WIPE_START
G1 F24000
G1 X92.31 Y105.058 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.062 J1.215 P1  F30000
G1 X93.581 Y105.123 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0999045
G1 F15000
G1 X93.362 Y105.123 E.00096
G1 X93.326 Y105.105 E.00018
; WIPE_START
G1 F24000
G1 X93.362 Y105.123 E-.11961
G1 X93.581 Y105.123 E-.64039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.585 J1.067 P1  F30000
G1 X107.884 Y112.963 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X107.884 Y111.911 E.00366
G2 X107.734 Y111.603 I-.872 J.235 E.0012
G1 X107.734 Y113.067 E.00509
G3 X107.584 Y113.171 I-.45 J-.489 E.00064
G1 X107.584 Y111.502 E.00581
G1 X107.557 Y111.499 E.00009
G2 X107.434 Y111.565 I.082 J.302 E.00049
G1 X107.434 Y113.109 E.00538
G3 X107.284 Y112.875 I.353 J-.391 E.00098
G1 X107.284 Y111.639 E.0043
; WIPE_START
G1 F24000
G1 X107.284 Y112.875 E-.46994
G1 X107.359 Y113.026 E-.06427
G1 X107.434 Y113.109 E-.04233
G1 X107.434 Y112.627 E-.18346
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.163 J.359 P1  F30000
G1 X107.884 Y114.083 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X107.884 Y114.636 E.00193
G1 X107.813 Y114.901 E.00096
G1 X107.734 Y115.03 E.00053
G1 X107.734 Y113.941 E.00379
G2 X107.584 Y113.83 I-.355 J.32 E.00066
G1 X107.584 Y115.14 E.00456
G3 X107.434 Y115.078 I-.001 J-.209 E.00058
G1 X107.434 Y113.895 E.00412
G2 X107.284 Y114.177 I.419 J.404 E.00113
G1 X107.284 Y114.989 E.00283
; WIPE_START
G1 F24000
G1 X107.284 Y114.177 E-.30866
G1 X107.313 Y114.068 E-.04263
G1 X107.434 Y113.895 E-.08045
G1 X107.434 Y114.759 E-.32826
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.999 J-.695 P1  F30000
G1 X98.884 Y127.039 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X98.884 Y124.314 E.00948
G1 X98.734 Y123.942 F30000
G1 F3600
G1 X98.734 Y127.274 E.01159
G3 X98.584 Y127.48 I-.404 J-.137 E.0009
G1 X98.584 Y123.876 E.01254
G2 X98.434 Y123.833 I-.132 J.177 E.00056
G1 X98.434 Y127.523 E.01284
G3 X98.284 Y127.447 I.023 J-.231 E.0006
G1 X98.284 Y123.922 E.01227
G2 X98.134 Y124.164 I1.197 J.91 E.00099
G1 X98.134 Y127.347 E.01108
; WIPE_START
G1 F24000
G1 X98.134 Y125.347 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.519 J1.101 P1  F30000
G1 X124.084 Y137.582 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X124.084 Y136.912 E.00233
G2 X123.934 Y136.652 I-.487 J.108 E.00106
G1 X123.934 Y137.688 E.0036
G1 X123.784 Y137.826 E.00071
G1 X123.784 Y136.515 E.00456
G2 X123.634 Y136.428 I-.222 J.21 E.00061
G1 X123.634 Y137.902 E.00513
G3 X123.484 Y137.957 I-.168 J-.224 E.00056
G1 X123.484 Y136.375 E.00551
G2 X123.334 Y136.353 I-.11 J.234 E.00054
G1 X123.334 Y137.981 E.00566
G3 X123.184 Y137.979 I-.072 J-.247 E.00053
G1 X123.184 Y136.347 E.00568
G2 X123.034 Y136.381 I-.019 J.267 E.00054
G1 X123.034 Y137.959 E.00549
G3 X122.884 Y137.9 I.022 J-.277 E.00057
G1 X122.884 Y136.427 E.00512
G1 X122.734 Y136.517 E.00061
G1 X122.734 Y137.816 E.00452
G1 X122.584 Y137.684 E.00069
G1 X122.584 Y136.658 E.00357
G2 X122.434 Y136.913 I.331 J.367 E.00104
G1 X122.434 Y137.576 E.00231
; WIPE_START
G1 F24000
G1 X122.434 Y136.913 E-.25189
G1 X122.522 Y136.725 E-.07866
G1 X122.584 Y136.658 E-.03478
G1 X122.584 Y137.684 E-.38988
G1 X122.593 Y137.692 E-.00479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.025 J.657 P1  F30000
G1 X123.934 Y139.784 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X123.934 Y139.114 E.00233
G1 X123.82 Y138.911 E.00081
G1 X123.784 Y138.878 E.00017
G1 X123.784 Y139.874 E.00347
G3 X123.634 Y139.993 I-.267 J-.182 E.00068
G1 X123.634 Y138.753 E.00431
G1 X123.484 Y138.681 E.00058
G1 X123.484 Y140.06 E.0048
G3 X123.334 Y140.094 I-.131 J-.234 E.00054
G1 X123.334 Y138.654 E.00501
G2 X123.184 Y138.647 I-.095 J.431 E.00053
G1 X123.184 Y140.101 E.00506
G1 X123.034 Y140.063 E.00054
G1 X123.034 Y138.684 E.0048
G2 X122.884 Y138.754 I.037 J.276 E.00058
G1 X122.884 Y139.993 E.00431
G3 X122.734 Y139.872 I.119 J-.302 E.00068
G1 X122.734 Y138.876 E.00347
G2 X122.584 Y139.112 I.318 J.368 E.00099
G1 X122.584 Y139.795 E.00238
; WIPE_START
G1 F24000
G1 X122.584 Y139.112 E-.25951
G1 X122.652 Y138.967 E-.06075
G1 X122.734 Y138.876 E-.0465
G1 X122.734 Y139.872 E-.37861
G1 X122.759 Y139.901 E-.01463
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.057 J1.216 P1  F30000
G1 X132.184 Y139.46 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.184 Y138.231 E.00428
G1 X132.034 Y138.323 E.00061
G1 X132.034 Y139.584 E.00439
G3 X131.884 Y139.764 I-.368 J-.153 E.00083
G1 X131.884 Y138.414 E.0047
G1 X131.856 Y138.431 E.00011
G1 X131.734 Y138.283 E.00067
G1 X131.734 Y139.888 E.00559
G3 X131.584 Y139.947 I-.206 J-.301 E.00057
G1 X131.584 Y138.153 E.00624
G2 X131.434 Y138.072 I-.206 J.202 E.0006
G1 X131.434 Y139.989 E.00667
G1 X131.284 Y139.994 E.00052
G1 X131.284 Y138.035 E.00682
G1 X131.134 Y138.038 E.00052
G1 X131.134 Y139.988 E.00678
G1 X130.984 Y139.948 E.00054
G1 X130.984 Y138.067 E.00654
G2 X130.834 Y138.141 I.055 J.304 E.00059
G1 X130.834 Y139.863 E.00599
G3 X130.684 Y139.729 I.148 J-.316 E.00071
G1 X130.684 Y138.27 E.00508
G2 X130.534 Y138.501 I.291 J.353 E.00097
G1 X130.534 Y139.658 E.00403
; WIPE_START
G1 F24000
G1 X130.534 Y138.501 E-.4397
G1 X130.579 Y138.393 E-.04466
G1 X130.684 Y138.27 E-.06119
G1 X130.684 Y138.835 E-.21445
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.22 J1.197 P1  F30000
G1 X141.334 Y136.875 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X141.334 Y139.483 E.00908
G1 X141.184 Y139.903 F30000
G1 F3600
G1 X141.184 Y136.616 E.01144
G1 X141.071 Y136.407 E.00083
G1 X141.034 Y136.372 E.00018
G1 X141.034 Y139.985 E.01257
G3 X140.884 Y139.932 I-.056 J-.079 E.00065
G1 X140.884 Y136.422 E.01221
G2 X140.734 Y136.748 I.605 J.476 E.00126
G1 X140.734 Y139.797 E.01061
; WIPE_START
G1 F24000
G1 X140.734 Y137.797 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.509 J1.105 P1  F30000
G1 X154.684 Y131.376 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.684 Y132.564 E.00414
G3 X154.534 Y132.751 I-.582 J-.312 E.00084
G1 X154.534 Y131.275 E.00514
G1 X154.384 Y131.055 E.00093
G1 X154.384 Y132.816 E.00613
G3 X154.234 Y132.818 I-.083 J-.545 E.00052
G1 X154.234 Y130.835 E.0069
G1 X154.084 Y130.615 E.00093
G1 X154.084 Y132.754 E.00745
G3 X153.934 Y132.594 I.476 J-.596 E.00077
G1 X153.934 Y130.394 E.00765
G3 X153.784 Y130.158 I1.808 J-1.311 E.00098
G1 X153.784 Y131.884 E.00601
G1 X153.634 Y131.884 E.00052
G1 X153.634 Y129.905 E.00689
G1 X153.484 Y129.652 E.00102
G1 X153.484 Y131.885 E.00777
G1 X153.334 Y131.886 E.00052
G1 X153.334 Y129.152 E.00951
; WIPE_START
G1 F24000
G1 X153.334 Y131.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.196 J.223 P1  F30000
G1 X154.684 Y123.897 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.684 Y122.972 E.00322
G2 X154.534 Y122.784 I-.344 J.12 E.00085
G1 X154.534 Y123.964 E.00411
G3 X154.384 Y124.023 I-.179 J-.235 E.00057
G1 X154.384 Y122.693 E.00463
G2 X154.234 Y122.661 I-.133 J.257 E.00054
G1 X154.234 Y124.077 E.00493
; WIPE_START
G1 F24000
G1 X154.234 Y122.661 E-.53807
G1 X154.384 Y122.693 E-.05826
G1 X154.384 Y123.123 E-.16367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.151 J.395 P1  F30000
G1 X154.834 Y121.812 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.834 Y120.847 E.00336
G2 X154.684 Y120.52 I-.718 J.132 E.00126
G1 X154.684 Y121.919 E.00487
G3 X154.534 Y122.042 I-.363 J-.29 E.00068
G1 X154.534 Y120.382 E.00578
G2 X154.384 Y120.334 I-.184 J.32 E.00055
G1 X154.384 Y122.069 E.00604
G3 X154.234 Y122.038 I-.025 J-.259 E.00054
G1 X154.234 Y120.355 E.00586
G2 X154.084 Y120.472 I.164 J.366 E.00067
G1 X154.084 Y123.889 E.01189
G1 X154.061 Y123.865 E.00012
G3 X153.934 Y123.502 I.604 J-.415 E.00135
G1 X153.934 Y120.593 E.01012
G1 X153.784 Y121.131 F30000
G1 F3600
G1 X153.784 Y123.184 E.00714
G1 X153.634 Y123.198 E.00052
G1 X153.634 Y121.236 E.00683
G1 X153.484 Y121.217 E.00053
G1 X153.484 Y123.213 E.00695
G1 X153.334 Y123.227 E.00052
G1 X153.334 Y121.13 E.0073
; WIPE_START
G1 F24000
G1 X153.334 Y123.13 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.122 J1.211 P1  F30000
G1 X159.784 Y122.479 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X159.784 Y122.983 E.00175
; WIPE_START
G1 F24000
G1 X159.784 Y122.479 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.756 J.954 P1  F30000
G1 X166.084 Y117.489 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y114.704 E.00969
G1 X165.934 Y114.682 E.00053
G1 X165.934 Y117.443 E.00961
G1 X165.784 Y117.464 E.00053
G1 X165.784 Y114.661 E.00976
G1 X165.634 Y114.639 E.00053
G1 X165.634 Y117.486 E.00991
G1 X165.484 Y117.507 E.00053
G1 X165.484 Y114.618 E.01006
G1 X165.334 Y114.596 E.00053
G1 X165.334 Y117.529 E.01021
G1 X165.184 Y117.551 E.00053
G1 X165.184 Y114.575 E.01036
G1 X165.034 Y114.553 E.00053
G1 X165.034 Y117.572 E.01051
G1 X164.884 Y117.594 E.00053
G1 X164.884 Y114.532 E.01066
G1 X164.734 Y114.51 E.00053
G1 X164.734 Y117.616 E.01081
G1 X164.584 Y117.637 E.00053
G1 X164.584 Y114.489 E.01096
G1 X164.434 Y114.468 E.00053
G1 X164.434 Y117.664 E.01112
G1 X164.284 Y117.733 E.00057
G1 X164.284 Y114.438 E.01146
G1 X164.134 Y114.37 E.00057
G1 X164.134 Y117.801 E.01194
G1 X163.984 Y117.869 E.00057
G1 X163.984 Y114.301 E.01242
G1 X163.834 Y114.233 E.00057
G1 X163.834 Y117.938 E.01289
G1 X163.684 Y118.006 E.00057
G1 X163.684 Y114.164 E.01337
G1 X163.534 Y114.096 E.00057
G1 X163.534 Y118.075 E.01385
G1 X163.384 Y118.143 E.00057
G1 X163.384 Y114.027 E.01432
G1 X163.234 Y113.959 E.00057
G1 X163.234 Y118.211 E.0148
G1 X163.084 Y118.28 E.00057
G1 X163.084 Y113.89 E.01528
G1 X162.934 Y113.821 E.00057
G1 X162.934 Y118.348 E.01575
G1 X162.784 Y118.417 E.00057
G1 X162.784 Y113.753 E.01623
G1 X162.634 Y113.684 E.00057
G1 X162.634 Y118.51 E.01679
G1 X162.484 Y118.64 E.00069
G1 X162.484 Y113.616 E.01748
G3 X162.334 Y113.51 I.105 J-.308 E.00065
G1 X162.334 Y118.77 E.0183
G1 X162.184 Y118.9 E.00069
G1 X162.184 Y113.38 E.01921
G1 X162.034 Y113.25 E.00069
G1 X162.034 Y119.029 E.02011
G1 X161.884 Y119.159 E.00069
G1 X161.884 Y113.12 E.02102
G1 X161.734 Y112.99 E.00069
G1 X161.734 Y119.289 E.02192
G1 X161.584 Y119.419 E.00069
G1 X161.584 Y112.86 E.02283
G1 X161.434 Y112.73 E.00069
G1 X161.434 Y119.549 E.02373
G1 X161.284 Y119.678 E.00069
G1 X161.284 Y112.599 E.02463
G1 X161.134 Y112.469 E.00069
G1 X161.134 Y119.88 E.02579
G1 X160.984 Y120.113 E.00097
G1 X160.984 Y112.339 E.02705
G3 X160.834 Y112.192 I.176 J-.329 E.00074
G1 X160.834 Y120.347 E.02838
G1 X160.684 Y120.581 E.00097
G1 X160.684 Y111.958 E.03
G1 X160.534 Y111.725 E.00097
G1 X160.534 Y120.814 E.03163
G1 X160.384 Y121.048 E.00097
G1 X160.384 Y111.491 E.03326
G1 X160.234 Y111.257 E.00097
G1 X160.234 Y121.448 E.03546
G1 X160.084 Y121.96 F30000
G1 F3600
G1 X160.084 Y111.024 E.03806
G1 X159.934 Y110.79 E.00097
G1 X159.934 Y122.472 E.04065
G1 X159.784 Y121.863 F30000
G1 F3600
G1 X159.784 Y110.398 E.0399
G1 X159.634 Y109.887 F30000
G1 F3600
G1 X159.634 Y121.788 E.04141
G1 X159.484 Y121.779 E.00052
G1 X159.484 Y110.094 E.04066
G1 X159.334 Y110.168 E.00058
G1 X159.334 Y121.771 E.04038
G1 X159.184 Y121.763 E.00052
G1 X159.184 Y110.242 E.04009
G1 X159.034 Y110.316 E.00058
G1 X159.034 Y121.754 E.0398
G1 X158.884 Y121.746 E.00052
G1 X158.884 Y110.391 E.03951
G1 X158.734 Y110.465 E.00058
G1 X158.734 Y121.737 E.03923
G1 X158.584 Y121.729 E.00052
G1 X158.584 Y110.539 E.03894
G1 X158.434 Y110.613 E.00058
G1 X158.434 Y121.721 E.03865
G1 X158.284 Y121.712 E.00052
G1 X158.284 Y110.687 E.03837
G1 X158.134 Y110.762 E.00058
G1 X158.134 Y121.704 E.03808
G1 X157.984 Y121.696 E.00052
G1 X157.984 Y110.836 E.03779
G1 X157.834 Y110.91 E.00058
G1 X157.834 Y121.687 E.0375
G1 X157.684 Y121.679 E.00052
G1 X157.684 Y110.984 E.03722
G1 X157.534 Y111.058 E.00058
G1 X157.534 Y121.67 E.03693
G1 X157.384 Y121.662 E.00052
G1 X157.384 Y111.132 E.03664
G1 X157.234 Y111.207 E.00058
G1 X157.234 Y121.654 E.03635
G1 X157.084 Y121.645 E.00052
G1 X157.084 Y111.281 E.03607
G1 X156.934 Y111.355 E.00058
G1 X156.934 Y121.637 E.03578
G1 X156.784 Y121.629 E.00052
G1 X156.784 Y111.429 E.03549
G1 X156.634 Y111.503 E.00058
G1 X156.634 Y121.62 E.03521
G1 X156.484 Y121.612 E.00052
G1 X156.484 Y111.578 E.03492
G1 X156.334 Y111.652 E.00058
G1 X156.334 Y121.603 E.03463
G1 X156.184 Y121.595 E.00052
G1 X156.184 Y111.651 E.03461
; WIPE_START
G1 F24000
G1 X156.184 Y113.651 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.079 J-.563 P1  F30000
G1 X150.484 Y102.737 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X150.484 Y102.987 E.00087
G1 X150.334 Y103.113 E.00068
G1 X150.334 Y102.721 E.00136
G1 X150.184 Y102.624 E.00062
G1 X150.184 Y103.238 E.00214
G1 X150.034 Y103.364 E.00068
G1 X150.034 Y102.528 E.00291
G1 X149.884 Y102.432 E.00062
G1 X149.884 Y103.49 E.00368
G1 X149.734 Y103.616 E.00068
G1 X149.734 Y102.335 E.00446
G1 X149.584 Y102.239 E.00062
G1 X149.584 Y103.742 E.00523
G1 X149.434 Y103.868 E.00068
G1 X149.434 Y102.142 E.006
G1 X149.284 Y102.046 E.00062
G1 X149.284 Y103.994 E.00678
G1 X149.134 Y104.119 E.00068
G1 X149.134 Y101.95 E.00755
G1 X148.984 Y101.853 E.00062
G1 X148.984 Y104.245 E.00832
G1 X148.834 Y104.371 E.00068
G1 X148.834 Y101.757 E.0091
G3 X148.684 Y101.6 I.194 J-.336 E.00077
G1 X148.684 Y104.497 E.01008
G1 X148.534 Y104.623 E.00068
G1 X148.534 Y101.428 E.01112
G1 X148.384 Y101.255 E.0008
G1 X148.384 Y104.749 E.01216
G1 X148.234 Y104.875 E.00068
M73 P65 R9
G1 X148.234 Y101.082 E.0132
G1 X148.084 Y100.909 E.0008
G1 X148.084 Y105 E.01424
G1 X147.934 Y105.126 E.00068
G1 X147.934 Y100.736 E.01528
G1 X147.784 Y100.562 E.0008
G1 X147.784 Y105.252 E.01632
G1 X147.634 Y105.378 E.00068
G1 X147.634 Y100.389 E.01736
G1 X147.484 Y100.216 E.0008
G1 X147.484 Y105.504 E.0184
G1 X147.334 Y105.63 E.00068
G1 X147.334 Y100.023 E.01951
G1 X147.184 Y99.695 E.00126
G1 X147.184 Y105.756 E.02109
G1 X147.034 Y105.882 E.00068
G1 X147.034 Y99.367 E.02267
G1 X146.884 Y99.039 E.00126
G1 X146.884 Y106.007 E.02425
G1 X146.734 Y106.133 E.00068
G1 X146.734 Y98.711 E.02583
G1 X146.584 Y98.383 E.00126
G1 X146.584 Y106.259 E.02741
G1 X146.434 Y106.385 E.00068
G1 X146.434 Y97.585 E.03062
; WIPE_START
G1 F24000
G1 X146.434 Y99.585 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.215 J-.06 P1  F30000
G1 X146.284 Y96.536 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X146.284 Y106.511 E.03471
G1 X146.134 Y106.637 E.00068
G1 X146.134 Y96.136 E.03654
G1 X145.984 Y96.136 E.00052
G1 X145.984 Y106.763 E.03698
G1 X145.834 Y106.888 E.00068
G1 X145.834 Y96.136 E.03742
G1 X145.684 Y96.136 E.00052
G1 X145.684 Y107.014 E.03785
G1 X145.534 Y107.14 E.00068
G1 X145.534 Y96.136 E.03829
G1 X145.384 Y96.136 E.00052
G1 X145.384 Y107.266 E.03873
G1 X145.234 Y107.392 E.00068
G1 X145.234 Y96.136 E.03917
G1 X145.084 Y96.136 E.00052
G1 X145.084 Y107.518 E.03961
G1 X144.934 Y107.644 E.00068
G1 X144.934 Y96.136 E.04004
G1 X144.784 Y96.136 E.00052
G1 X144.784 Y107.769 E.04048
G1 X144.634 Y107.895 E.00068
G1 X144.634 Y96.136 E.04092
G1 X144.484 Y96.136 E.00052
G1 X144.484 Y108.021 E.04136
G1 X144.334 Y108.147 E.00068
G1 X144.334 Y96.136 E.0418
G1 X144.184 Y96.136 E.00052
G1 X144.184 Y108.273 E.04223
G1 X144.034 Y108.399 E.00068
G1 X144.034 Y96.136 E.04267
G1 X143.884 Y96.136 E.00052
G1 X143.884 Y108.525 E.04311
G1 X143.734 Y108.651 E.00068
G1 X143.734 Y96.069 E.04378
G1 X143.584 Y96.883 F30000
G1 F3600
G1 X143.584 Y108.776 E.04139
G1 X143.434 Y108.902 E.00068
G1 X143.434 Y98.174 E.03733
G1 X143.284 Y98.537 E.00136
G1 X143.284 Y109.028 E.03651
G1 X143.134 Y109.154 E.00068
G1 X143.134 Y98.899 E.03569
G1 X142.984 Y99.261 E.00136
G1 X142.984 Y109.28 E.03486
G1 X142.834 Y109.406 E.00068
G1 X142.834 Y99.624 E.03404
G1 X142.684 Y99.986 E.00136
G1 X142.684 Y109.532 E.03322
G1 X142.534 Y109.657 E.00068
G1 X142.534 Y100.187 E.03296
G1 X142.384 Y100.383 E.00086
G1 X142.384 Y109.783 E.03271
G1 X142.234 Y109.909 E.00068
G1 X142.234 Y100.578 E.03247
G1 X142.084 Y100.774 E.00086
G1 X142.084 Y110.123 E.03253
; WIPE_START
G1 F24000
G1 X142.084 Y108.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.049 P1  F30000
G1 X142.234 Y111.862 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X142.234 Y112.973 E.00387
G1 X142.222 Y113.073 E.00035
G1 X142.084 Y113.371 E.00114
G1 X142.084 Y111.669 E.00592
G2 X141.934 Y111.478 I-.482 J.225 E.00085
G1 X141.932 Y113.5 E.00704
G3 X141.784 Y113.365 I.157 J-.322 E.00071
G1 X141.78 Y111.464 E.00662
G2 X141.634 Y111.612 I.132 J.277 E.00074
G1 X141.634 Y113.206 E.00555
G1 X141.484 Y113.047 E.00076
G1 X141.484 Y112.046 E.00348
G2 X141.456 Y112.303 I.773 J.213 E.0009
G1 X141.334 Y112.295 E.00043
G1 X141.334 Y113.038 E.00259
G1 X141.184 Y113.107 E.00057
G1 X141.184 Y112.285 E.00286
G1 X141.034 Y112.276 E.00052
G1 X141.034 Y113.176 E.00313
G1 X140.884 Y113.246 E.00057
G1 X140.884 Y112.198 E.00364
; WIPE_START
G1 F24000
G1 X140.884 Y113.246 E-.39796
G1 X141.034 Y113.176 E-.06278
G1 X141.034 Y112.389 E-.29926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.073 J-.574 P1  F30000
G1 X137.434 Y119.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X137.434 Y131.536 E.04322
G1 X137.284 Y131.536 E.00052
G1 X137.284 Y119.184 E.04298
G1 X137.134 Y119.184 E.00052
G1 X137.134 Y131.536 E.04298
G1 X136.984 Y131.536 E.00052
G1 X136.984 Y119.184 E.04298
G1 X136.834 Y119.184 E.00052
G1 X136.834 Y131.536 E.04298
G1 X136.684 Y131.536 E.00052
G1 X136.684 Y119.184 E.04298
G1 X136.534 Y119.184 E.00052
G1 X136.534 Y131.536 E.04298
G1 X136.384 Y131.536 E.00052
G1 X136.384 Y119.184 E.04298
G1 X136.234 Y119.184 E.00052
G1 X136.234 Y131.536 E.04298
G1 X136.084 Y131.536 E.00052
G1 X136.084 Y119.184 E.04298
G1 X135.934 Y119.184 E.00052
G1 X135.934 Y131.604 E.04322
; WIPE_START
G1 F24000
G1 X135.934 Y129.604 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.086 J-.549 P1  F30000
G1 X132.184 Y137.026 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.184 Y137.816 E.00275
G2 X132.034 Y137.677 I-.302 J.174 E.00072
G1 X132.034 Y136.878 E.00278
G2 X131.884 Y136.647 I-.436 J.118 E.00097
G1 X131.884 Y137.578 E.00324
G2 X131.734 Y137.489 I-.283 J.304 E.00061
G1 X131.734 Y136.507 E.00342
G1 X131.584 Y136.427 E.00059
G1 X131.584 Y137.431 E.00349
G2 X131.434 Y137.409 I-.121 J.301 E.00053
G1 X131.434 Y136.386 E.00356
G1 X131.284 Y136.357 E.00053
G1 X131.284 Y137.389 E.00359
G2 X131.134 Y137.387 I-.078 J.255 E.00053
G1 X131.134 Y136.37 E.00354
G1 X130.984 Y136.384 E.00052
G1 X130.984 Y137.41 E.00357
G1 X130.834 Y137.433 E.00053
G1 X130.834 Y136.447 E.00343
G2 X130.684 Y136.573 I.578 J.843 E.00068
G1 X130.684 Y137.491 E.0032
G1 X130.534 Y137.567 E.00058
G1 X130.534 Y136.937 E.00219
G2 X130.505 Y137.093 I.573 J.185 E.00055
G1 X130.384 Y137.078 E.00043
G1 X130.384 Y137.661 E.00203
G1 X130.234 Y137.808 E.00073
G1 X130.234 Y137.059 E.00261
G1 X130.084 Y137.04 E.00053
G1 X130.084 Y138.115 E.00374
; WIPE_START
G1 F24000
G1 X130.084 Y137.04 E-.40841
G1 X130.234 Y137.059 E-.05744
G1 X130.234 Y137.808 E-.28487
G1 X130.251 Y137.791 E-.00928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.191 J-.248 P1  F30000
G1 X128.734 Y145.086 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X128.734 Y145.179 E.00033
G1 X128.584 Y145.156 E.00053
G1 X128.584 Y145.066 E.00031
G1 X128.434 Y144.966 E.00063
G1 X128.434 Y145.2 E.00082
; WIPE_START
G1 F24000
G1 X128.434 Y144.966 E-.23762
G1 X128.584 Y145.066 E-.18314
G1 X128.584 Y145.156 E-.09039
G1 X128.734 Y145.179 E-.15399
G1 X128.734 Y145.086 E-.09487
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.869 J-.852 P1  F30000
G1 X122.284 Y138.5 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X122.284 Y138.28 E.00077
G1 X122.134 Y138.15 E.00069
G1 X122.134 Y138.592 E.00154
G1 X121.984 Y138.839 E.001
G1 X121.984 Y137.819 E.00355
; WIPE_START
G1 F24000
G1 X121.984 Y138.839 E-.38766
G1 X122.134 Y138.592 E-.10966
G1 X122.134 Y138.15 E-.16799
G1 X122.284 Y138.28 E-.07527
G1 X122.284 Y138.331 E-.01942
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.256 J-1.19 P1  F30000
G1 X115.684 Y139.753 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X115.684 Y139.868 E.0004
G1 X115.534 Y139.868 E.00052
G1 X115.534 Y139.666 E.0007
G1 X115.384 Y139.468 E.00087
G1 X115.384 Y139.868 E.00139
G1 X115.234 Y139.868 E.00052
G1 X115.234 Y139.224 E.00224
G1 X115.084 Y138.968 E.00103
G1 X115.084 Y139.868 E.00313
G1 X114.934 Y139.868 E.00052
G1 X114.934 Y138.703 E.00405
G1 X114.784 Y138.376 E.00125
G1 X114.784 Y139.868 E.00519
G1 X114.634 Y139.868 E.00052
G1 X114.634 Y137.85 E.00702
G1 X114.484 Y137.387 F30000
G1 F3600
G1 X114.484 Y139.868 E.00863
G1 X114.334 Y139.868 E.00052
G1 X114.334 Y136.786 E.01073
; WIPE_START
G1 F24000
G1 X114.334 Y138.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.349 J-1.166 P1  F30000
G1 X107.734 Y136.809 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X107.734 Y137.745 E.00325
G3 X107.584 Y138.05 I-.536 J-.074 E.0012
G1 X107.584 Y136.686 E.00474
G2 X107.434 Y136.519 I-.391 J.199 E.00079
G1 X107.434 Y138.187 E.00581
G3 X107.284 Y138.255 I-.186 J-.208 E.00058
G1 X107.284 Y136.43 E.00635
G2 X107.134 Y136.382 I-.152 J.218 E.00056
G1 X107.134 Y138.28 E.0066
G3 X106.984 Y138.269 I-.056 J-.261 E.00053
G1 X106.984 Y136.359 E.00664
G2 X106.834 Y136.37 I-.056 J.266 E.00053
G1 X106.834 Y138.219 E.00643
G3 X106.684 Y138.114 I.098 J-.3 E.00065
G1 X106.684 Y136.39 E.006
G2 X106.534 Y136.452 I.028 J.278 E.00057
G1 X106.534 Y137.893 E.00501
G1 X106.486 Y137.799 E.00036
G1 X106.384 Y137.834 E.00038
G1 X106.384 Y136.556 E.00444
G2 X106.234 Y136.704 I.21 J.364 E.00074
G1 X106.234 Y137.884 E.00411
G1 X106.084 Y137.934 E.00055
G1 X106.084 Y136.836 E.00382
; WIPE_START
G1 F24000
G1 X106.084 Y137.934 E-.41729
G1 X106.234 Y137.884 E-.06008
G1 X106.234 Y137.14 E-.28262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.056 J-1.216 P1  F30000
G1 X98.584 Y136.79 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X98.584 Y137.954 E.00405
G1 X98.434 Y138.161 E.00089
G1 X98.434 Y136.682 E.00515
G1 X98.284 Y136.532 E.00074
G1 X98.284 Y138.275 E.00607
G3 X98.134 Y138.353 I-.198 J-.201 E.0006
G1 X98.134 Y136.442 E.00665
G2 X97.984 Y136.393 I-.156 J.22 E.00056
G1 X97.984 Y138.386 E.00694
G3 X97.834 Y138.391 I-.084 J-.254 E.00053
G1 X97.834 Y136.362 E.00706
G2 X97.684 Y136.366 I-.067 J.263 E.00053
G1 X97.684 Y138.375 E.00699
G1 X97.534 Y138.32 E.00056
G1 X97.534 Y136.378 E.00676
G2 X97.384 Y136.407 I-.029 J.248 E.00054
G1 X97.384 Y138.233 E.00635
G1 X97.234 Y138.129 E.00064
G1 X97.234 Y136.468 E.00578
G1 X97.084 Y136.587 E.00066
G1 X97.084 Y138.025 E.00501
G1 X96.934 Y137.921 E.00064
G1 X96.934 Y136.67 E.00435
G1 X96.784 Y137.056 F30000
G1 F3600
G1 X96.784 Y138.001 E.00329
G1 X96.634 Y138.097 E.00062
G1 X96.634 Y137.2 E.00312
G1 X96.484 Y137.186 E.00052
G1 X96.484 Y138.272 E.00378
; WIPE_START
G1 F24000
G1 X96.484 Y137.186 E-.41249
G1 X96.634 Y137.2 E-.05724
G1 X96.634 Y137.964 E-.29026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.017 P1  F30000
G1 X96.484 Y127.487 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X96.484 Y126.129 E.00473
G2 X96.334 Y125.833 I-1.142 J.392 E.00116
G1 X96.334 Y127.501 E.0058
G3 X96.184 Y127.422 I-.006 J-.171 E.00062
G1 X96.184 Y125.598 E.00635
G1 X96.034 Y125.362 E.00097
G1 X96.034 Y126.889 E.00531
G1 X95.988 Y126.615 E.00097
G1 X95.884 Y126.62 E.00036
G1 X95.884 Y125.128 E.00519
G1 X95.734 Y124.9 E.00095
G1 X95.734 Y126.628 E.00601
G1 X95.584 Y126.636 E.00052
G1 X95.584 Y124.673 E.00683
G3 X95.434 Y124.41 I.623 J-.53 E.00106
G1 X95.434 Y126.711 E.00801
; WIPE_START
G1 F24000
G1 X95.434 Y124.711 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.111 J.496 P1  F30000
G1 X99.784 Y114.957 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.784 Y113.196 E.00613
G1 X99.634 Y113.326 E.00069
G1 X99.634 Y115.119 E.00624
G3 X99.484 Y115.287 I-.349 J-.161 E.0008
G1 X99.484 Y113.425 E.00648
G2 X99.375 Y113.329 I-.195 J.112 E.00052
G1 X99.372 Y113.329 E.00001
G2 X99.334 Y113.363 I.043 J.087 E.00018
G1 X99.329 Y115.243 E.00654
G3 X99.184 Y114.96 I.381 J-.375 E.00112
G1 X99.184 Y113.466 E.0052
G1 X99.784 Y112.918 F30000
G1 F3600
G1 X99.784 Y112.127 E.00275
G1 X99.634 Y111.762 F30000
G1 F3600
G1 X99.634 Y112.738 E.0034
G2 X99.484 Y112.692 I-.148 J.221 E.00055
G1 X99.484 Y111.693 E.00348
G2 X99.334 Y111.671 I-.095 J.121 E.00055
G1 X99.334 Y112.684 E.00353
G2 X99.184 Y112.71 I-.029 J.279 E.00054
G1 X99.184 Y111.774 E.00326
G1 X99.034 Y112.293 F30000
G1 F3600
G1 X99.034 Y112.776 E.00168
G2 X98.884 Y112.895 I.115 J.298 E.00068
G1 X98.884 Y112.349 E.0019
G1 X98.734 Y112.337 E.00052
G1 X98.734 Y113.093 E.00263
G2 X98.584 Y113.387 I.426 J.403 E.00116
M73 P66 R9
G1 X98.584 Y112.257 E.00393
; WIPE_START
G1 F24000
G1 X98.584 Y113.387 E-.42948
G1 X98.62 Y113.267 E-.04775
G1 X98.734 Y113.093 E-.07891
G1 X98.734 Y112.557 E-.20386
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.211 J.123 P1  F30000
G1 X99.634 Y103.731 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.634 Y103.53 E.0007
; WIPE_START
G1 F24000
G1 X99.634 Y103.731 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.972 J.732 P1  F30000
G1 X106.834 Y113.284 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X106.834 Y113.621 E.00117
G2 X106.684 Y113.926 I.414 J.393 E.0012
G1 X106.684 Y112.922 E.0035
; WIPE_START
G1 F24000
G1 X106.684 Y113.926 E-.45297
G1 X106.715 Y113.809 E-.05501
G1 X106.834 Y113.621 E-.09997
G1 X106.834 Y113.284 E-.15205
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.166 J1.206 P1  F30000
G1 X116.284 Y114.585 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X116.284 Y114.97 E.00134
G1 X116.134 Y114.97 E.00052
G1 X116.134 Y114.406 E.00196
G1 X115.984 Y114.055 E.00133
G1 X115.984 Y114.97 E.00318
G1 X115.834 Y114.97 E.00052
G1 X115.834 Y113.332 E.0057
G1 X115.684 Y112.734 F30000
G1 F3600
G1 X115.684 Y114.97 E.00778
G1 X115.534 Y114.97 E.00052
G1 X115.534 Y112.004 E.01032
; WIPE_START
G1 F24000
G1 X115.534 Y114.004 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.215 J-.076 P1  F30000
G1 X114.934 Y104.46 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X114.934 Y104.542 E.00029
G1 X114.784 Y104.542 E.00052
G1 X114.784 Y104.508 E.00012
G1 X114.634 Y104.489 E.00053
G1 X114.634 Y104.61 E.00042
; WIPE_START
G1 F24000
G1 X114.634 Y104.489 E-.17085
G1 X114.784 Y104.508 E-.21385
G1 X114.784 Y104.542 E-.0475
G1 X114.934 Y104.542 E-.21201
G1 X114.934 Y104.46 E-.11578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.023 J1.217 P1  F30000
G1 X132.484 Y104.129 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.484 Y103.49 E.00223
G1 X132.334 Y103.428 E.00056
G1 X132.334 Y104.7 E.00443
G1 X132.184 Y105.271 F30000
G1 F3600
G1 X132.184 Y103.366 E.00663
G1 X132.034 Y103.304 E.00056
G1 X132.034 Y105.841 E.00883
G1 X131.884 Y106.412 F30000
G1 F3600
G1 X131.884 Y103.242 E.01103
G1 X131.734 Y103.18 E.00056
G1 X131.734 Y106.983 E.01323
G1 X131.584 Y107.553 F30000
G1 F3600
G1 X131.584 Y103.118 E.01544
G1 X131.434 Y103.056 E.00056
G1 X131.434 Y108.124 E.01764
G1 X131.284 Y108.695 F30000
G1 F3600
G1 X131.284 Y102.963 E.01995
G1 X131.134 Y102.848 E.00066
G1 X131.134 Y109.265 E.02233
G1 X130.984 Y109.836 F30000
G1 F3600
G1 X130.984 Y102.647 E.02502
; WIPE_START
G1 F24000
G1 X130.984 Y104.647 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.204 J.18 P1  F30000
G1 X132.034 Y111.67 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.034 Y112.823 E.00401
G1 X132.023 Y112.91 E.0003
G1 X131.884 Y113.216 E.00117
G1 X131.884 Y111.506 E.00595
G2 X131.734 Y111.356 I-.209 J.06 E.00077
G1 X131.734 Y113.301 E.00677
G3 X131.584 Y113.281 I-.04 J-.269 E.00053
G1 X131.584 Y111.442 E.0064
G2 X131.434 Y111.718 I.408 J.4 E.00111
G1 X131.434 Y113.374 E.00576
G1 X131.284 Y113.657 E.00112
G1 X131.284 Y111.998 E.00577
; WIPE_START
G1 F24000
G1 X131.284 Y113.657 E-.6303
G1 X131.434 Y113.374 E-.12183
G1 X131.434 Y113.353 E-.00787
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.044 J1.216 P1  F30000
G1 X152.584 Y112.593 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X152.584 Y114.099 E.00524
G1 X152.434 Y113.766 E.00127
G1 X152.434 Y112.66 E.00385
G1 X152.284 Y112.66 E.00052
G1 X152.284 Y113.432 E.00269
G1 X152.134 Y113.098 E.00127
G1 X152.134 Y112.66 E.00152
G1 X151.984 Y112.66 E.00052
G1 X151.984 Y112.929 E.00094
; WIPE_START
G1 F24000
G1 X151.984 Y112.66 E-.10228
G1 X152.134 Y112.66 E-.057
G1 X152.134 Y113.098 E-.16653
G1 X152.284 Y113.432 E-.13904
G1 X152.284 Y112.66 E-.29334
G1 X152.288 Y112.66 E-.00181
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.51 J1.105 P1  F30000
G1 X159.334 Y109.409 Z1.8
M73 P66 R8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X159.334 Y108.867 E.00189
; WIPE_START
G1 F24000
G1 X159.334 Y109.409 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.978 J.724 P1  F30000
G1 X166.084 Y100.295 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y96.136 E.01447
G1 X165.934 Y96.136 E.00052
G1 X165.934 Y100.248 E.01431
G1 X165.784 Y100.27 E.00053
G1 X165.784 Y96.136 E.01439
G1 X165.634 Y96.136 E.00052
G1 X165.634 Y100.292 E.01446
G1 X165.484 Y100.313 E.00053
G1 X165.484 Y96.136 E.01454
G1 X165.334 Y96.136 E.00052
G1 X165.334 Y100.335 E.01461
G1 X165.184 Y100.356 E.00053
G1 X165.184 Y96.136 E.01469
G1 X165.034 Y96.136 E.00052
G1 X165.034 Y100.378 E.01476
G1 X164.884 Y100.4 E.00053
G1 X164.884 Y96.136 E.01484
G1 X164.734 Y96.136 E.00052
G1 X164.734 Y100.421 E.01491
G1 X164.584 Y100.443 E.00053
G1 X164.584 Y96.136 E.01499
G1 X164.434 Y96.136 E.00052
G1 X164.434 Y100.464 E.01506
G2 X164.284 Y100.494 I-.025 J.27 E.00054
G1 X164.284 Y96.136 E.01516
G1 X164.134 Y96.136 E.00052
G1 X164.134 Y100.562 E.0154
G1 X163.984 Y100.631 E.00057
G1 X163.984 Y96.136 E.01564
G1 X163.834 Y96.136 E.00052
G1 X163.834 Y100.699 E.01588
G1 X163.684 Y100.768 E.00057
G1 X163.684 Y96.136 E.01612
G1 X163.534 Y96.136 E.00052
G1 X163.534 Y100.837 E.01636
G1 X163.384 Y100.905 E.00057
G1 X163.384 Y96.136 E.0166
G1 X163.234 Y96.136 E.00052
G1 X163.234 Y100.974 E.01683
G1 X163.084 Y101.042 E.00057
G1 X163.084 Y96.136 E.01707
G1 X162.934 Y96.136 E.00052
G1 X162.934 Y101.111 E.01731
G1 X162.784 Y101.179 E.00057
G1 X162.784 Y96.136 E.01755
G1 X162.634 Y96.136 E.00052
G1 X162.634 Y101.248 E.01779
G1 X162.484 Y101.316 E.00057
G1 X162.484 Y96.136 E.01803
G1 X162.334 Y96.136 E.00052
G1 X162.334 Y101.422 E.01839
G1 X162.184 Y101.552 E.00069
G1 X162.184 Y96.136 E.01885
G1 X162.034 Y96.136 E.00052
G1 X162.034 Y101.682 E.0193
G1 X161.884 Y101.812 E.00069
G1 X161.884 Y96.136 E.01975
G1 X161.734 Y96.136 E.00052
G1 X161.734 Y101.942 E.0202
G1 X161.584 Y102.071 E.00069
G1 X161.584 Y96.069 E.02089
G1 X161.434 Y97.053 F30000
G1 F3600
G1 X161.434 Y102.201 E.01792
G1 X161.284 Y102.331 E.00069
G1 X161.284 Y98.213 E.01433
G1 X161.134 Y98.541 E.00126
G1 X161.134 Y102.461 E.01364
G1 X160.984 Y102.591 E.00069
G1 X160.984 Y98.87 E.01295
G1 X160.834 Y99.199 E.00126
G1 X160.834 Y102.738 E.01232
G1 X160.684 Y102.972 E.00097
G1 X160.684 Y99.528 E.01198
G1 X160.534 Y99.857 E.00126
G1 X160.534 Y103.205 E.01165
G1 X160.384 Y103.439 E.00097
G1 X160.384 Y100.128 E.01152
G1 X160.234 Y100.301 E.0008
G1 X160.234 Y103.673 E.01173
G1 X160.084 Y103.906 E.00097
G1 X160.084 Y100.474 E.01194
G1 X159.934 Y100.647 E.0008
G1 X159.934 Y104.14 E.01215
G1 X159.784 Y104.374 E.00097
G1 X159.784 Y100.82 E.01237
G1 X159.634 Y100.993 E.0008
G1 X159.634 Y105.043 E.01409
G1 X159.484 Y105.553 F30000
G1 F3600
G1 X159.484 Y101.166 E.01527
G1 X159.334 Y101.339 E.0008
G1 X159.334 Y106.063 E.01644
; WIPE_START
G1 F24000
G1 X159.334 Y104.063 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J-.034 P1  F30000
G1 X159.184 Y109.483 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X159.184 Y101.512 E.02774
G1 X159.034 Y101.685 E.0008
G1 X159.034 Y109.482 E.02713
G1 X158.884 Y109.556 E.00058
G1 X158.884 Y101.804 E.02697
G1 X158.734 Y101.901 E.00062
G1 X158.734 Y109.63 E.0269
G1 X158.584 Y109.704 E.00058
G1 X158.584 Y101.997 E.02682
G1 X158.434 Y102.094 E.00062
G1 X158.434 Y109.778 E.02674
G1 X158.284 Y109.853 E.00058
G1 X158.284 Y102.19 E.02666
G1 X158.134 Y102.286 E.00062
G1 X158.134 Y109.927 E.02659
G1 X157.984 Y110.001 E.00058
G1 X157.984 Y102.383 E.02651
G1 X157.834 Y102.479 E.00062
G1 X157.834 Y110.075 E.02643
G1 X157.684 Y110.149 E.00058
G1 X157.684 Y102.576 E.02635
G1 X157.534 Y102.672 E.00062
G1 X157.534 Y110.223 E.02628
G1 X157.384 Y110.297 E.00058
G1 X157.384 Y102.768 E.0262
G1 X157.234 Y102.865 E.00062
G1 X157.234 Y110.371 E.02612
G1 X157.084 Y110.445 E.00058
G1 X157.084 Y102.946 E.0261
G1 X156.934 Y102.991 E.00054
G1 X156.934 Y110.519 E.0262
G1 X156.784 Y110.594 E.00058
G1 X156.784 Y103.035 E.0263
G1 X156.634 Y103.079 E.00054
G1 X156.634 Y110.668 E.02641
G1 X156.484 Y110.742 E.00058
G1 X156.484 Y103.123 E.02651
G1 X156.334 Y103.168 E.00054
G1 X156.334 Y110.816 E.02661
G1 X156.184 Y110.89 E.00058
G1 X156.184 Y103.212 E.02672
G1 X156.034 Y103.256 E.00054
G1 X156.034 Y110.964 E.02682
G1 X155.884 Y111.038 E.00058
G1 X155.884 Y103.3 E.02693
G1 X155.734 Y103.345 E.00054
G1 X155.734 Y111.112 E.02703
G1 X155.584 Y111.186 E.00058
G1 X155.584 Y103.389 E.02713
G1 X155.434 Y103.433 E.00054
G1 X155.434 Y111.261 E.02724
G1 X155.284 Y111.335 E.00058
G1 X155.284 Y103.476 E.02735
G1 X155.134 Y103.52 E.00054
G1 X155.134 Y111.409 E.02745
G1 X154.984 Y111.483 E.00058
G1 X154.984 Y103.558 E.02758
G1 X154.834 Y103.558 E.00052
G1 X154.834 Y111.557 E.02783
G1 X154.684 Y111.631 E.00058
G1 X154.684 Y103.558 E.02809
G1 X154.534 Y103.558 E.00052
G1 X154.534 Y111.705 E.02835
G1 X154.384 Y111.779 E.00058
G1 X154.384 Y103.491 E.02884
; WIPE_START
G1 F24000
G1 X154.384 Y105.491 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.105 J.51 P1  F30000
G1 X166.084 Y130.829 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y133.244 E.0084
G1 X165.934 Y133.268 E.00053
G1 X165.934 Y130.876 E.00833
G1 X165.784 Y130.854 E.00053
G1 X165.784 Y133.292 E.00848
G1 X165.634 Y133.316 E.00053
G1 X165.634 Y130.832 E.00864
G1 X165.484 Y130.811 E.00053
G1 X165.484 Y133.34 E.0088
G1 X165.334 Y133.363 E.00053
G1 X165.334 Y130.789 E.00896
G1 X165.184 Y130.767 E.00053
G1 X165.184 Y133.387 E.00912
G1 X165.034 Y133.411 E.00053
G1 X165.034 Y130.746 E.00927
G1 X164.884 Y130.724 E.00053
G1 X164.884 Y133.435 E.00943
G1 X164.734 Y133.459 E.00053
G1 X164.734 Y130.702 E.00959
G1 X164.584 Y130.681 E.00053
G1 X164.584 Y133.482 E.00975
G1 X164.434 Y133.506 E.00053
G1 X164.434 Y130.654 E.00993
G1 X164.284 Y130.586 E.00057
G1 X164.284 Y133.578 E.01041
G1 X164.134 Y133.654 E.00059
G1 X164.134 Y130.517 E.01092
G1 X163.984 Y130.449 E.00057
G1 X163.984 Y133.731 E.01142
G1 X163.834 Y133.807 E.00059
G1 X163.834 Y130.38 E.01192
G1 X163.684 Y130.312 E.00057
G1 X163.684 Y133.883 E.01243
G1 X163.534 Y133.96 E.00059
G1 X163.534 Y130.244 E.01293
G1 X163.384 Y130.175 E.00057
G1 X163.384 Y134.036 E.01344
G1 X163.234 Y134.112 E.00059
G1 X163.234 Y130.107 E.01394
G1 X163.084 Y130.038 E.00057
G1 X163.084 Y134.189 E.01444
G1 X162.934 Y134.265 E.00059
G1 X162.934 Y129.97 E.01495
G1 X162.784 Y129.901 E.00057
G1 X162.784 Y134.341 E.01545
G1 X162.723 Y134.372 E.00024
G2 X162.634 Y134.435 I.052 J.168 E.00039
G1 X162.634 Y129.808 E.0161
G1 X162.484 Y129.678 E.00069
G1 X162.484 Y134.585 E.01708
G1 X162.334 Y134.735 E.00074
G1 X162.334 Y129.548 E.01805
G1 X162.184 Y129.418 E.00069
G1 X162.184 Y134.885 E.01903
G1 X162.034 Y135.035 E.00074
G1 X162.034 Y129.288 E.02
G1 X161.884 Y129.158 E.00069
G1 X161.884 Y135.185 E.02097
G1 X161.734 Y135.335 E.00074
G1 X161.734 Y129.028 E.02195
G1 X161.584 Y128.898 E.00069
G1 X161.584 Y135.485 E.02292
G1 X161.434 Y135.635 E.00074
G1 X161.434 Y128.768 E.0239
G1 X161.284 Y128.638 E.00069
G1 X161.284 Y135.582 E.02417
G1 X161.134 Y135.461 E.00067
G1 X161.134 Y128.437 E.02444
G1 X160.984 Y128.203 E.00097
G1 X160.984 Y135.339 E.02483
G1 X160.834 Y135.218 E.00067
G1 X160.834 Y127.97 E.02522
G1 X160.684 Y127.736 E.00097
G1 X160.684 Y135.096 E.02561
G1 X160.534 Y134.975 E.00067
G1 X160.534 Y127.503 E.026
G1 X160.384 Y127.27 E.00097
G1 X160.384 Y134.853 E.02639
G1 X160.234 Y134.732 E.00067
G1 X160.234 Y126.87 E.02736
G1 X160.084 Y126.358 F30000
G1 F3600
G1 X160.084 Y134.61 E.02872
G1 X159.934 Y134.489 E.00067
G1 X159.934 Y125.845 E.03008
G1 X159.784 Y125.333 F30000
G1 F3600
G1 X159.784 Y134.367 E.03144
G1 X159.634 Y134.246 E.00067
G1 X159.634 Y122.539 E.04074
G1 X159.484 Y122.53 E.00052
G1 X159.484 Y134.124 E.04035
G1 X159.334 Y134.003 E.00067
G1 X159.334 Y122.522 E.03995
G1 X159.184 Y122.513 E.00052
G1 X159.184 Y133.881 E.03956
G1 X159.034 Y133.76 E.00067
G1 X159.034 Y122.505 E.03917
G1 X158.884 Y122.497 E.00052
G1 X158.884 Y133.638 E.03877
G1 X158.734 Y133.517 E.00067
G1 X158.734 Y122.488 E.03838
G1 X158.584 Y122.48 E.00052
G1 X158.584 Y133.395 E.03799
G1 X158.434 Y133.274 E.00067
G1 X158.434 Y122.471 E.03759
G1 X158.284 Y122.463 E.00052
G1 X158.284 Y133.153 E.0372
G1 X158.134 Y133.031 E.00067
G1 X158.134 Y122.455 E.0368
G1 X157.984 Y122.446 E.00052
G1 X157.984 Y132.91 E.03641
G1 X157.834 Y132.788 E.00067
G1 X157.834 Y122.438 E.03602
G1 X157.684 Y122.429 E.00052
G1 X157.684 Y132.667 E.03563
M73 P67 R8
G1 X157.534 Y132.545 E.00067
G1 X157.534 Y122.421 E.03523
G1 X157.384 Y122.412 E.00052
G1 X157.384 Y132.424 E.03484
G1 X157.234 Y132.303 E.00067
G1 X157.234 Y122.404 E.03445
G1 X157.084 Y122.396 E.00052
G1 X157.084 Y132.181 E.03405
G1 X156.934 Y132.06 E.00067
G1 X156.934 Y122.387 E.03366
G1 X156.784 Y122.379 E.00052
G1 X156.784 Y131.938 E.03327
G1 X156.634 Y131.817 E.00067
G1 X156.634 Y122.37 E.03287
G1 X156.484 Y122.362 E.00052
G1 X156.484 Y131.695 E.03248
G1 X156.334 Y131.574 E.00067
G1 X156.334 Y122.354 E.03209
G1 X156.184 Y122.345 E.00052
G1 X156.184 Y131.592 E.03218
G1 X156.034 Y131.777 E.00083
G1 X156.034 Y111.725 E.06978
; WIPE_START
G1 F24000
G1 X156.034 Y113.725 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.186 J.273 P1  F30000
G1 X161.134 Y135.906 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X161.134 Y136.076 E.00059
G1 X160.984 Y136.37 E.00115
G1 X160.984 Y136.199 E.0006
G1 X160.932 Y136.263 E.00029
G1 X160.834 Y136.183 E.00044
G1 X160.834 Y136.664 E.00167
G1 X160.684 Y136.959 E.00115
G1 X160.684 Y136.062 E.00312
G1 X160.534 Y135.94 E.00067
G1 X160.534 Y137.253 E.00457
G1 X160.384 Y137.566 E.00121
G1 X160.384 Y135.819 E.00608
G1 X160.234 Y135.697 E.00067
G1 X160.234 Y138.943 E.01129
; WIPE_START
G1 F24000
G1 X160.234 Y136.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.01 J.679 P1  F30000
G1 X166.084 Y145.645 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y149.586 E.01371
G1 X165.934 Y149.586 E.00052
G1 X165.934 Y145.69 E.01356
G1 X165.784 Y145.666 E.00053
G1 X165.784 Y149.586 E.01364
G1 X165.634 Y149.586 E.00052
G1 X165.634 Y145.642 E.01372
G1 X165.484 Y145.619 E.00053
G1 X165.484 Y149.586 E.01381
G1 X165.334 Y149.586 E.00052
G1 X165.334 Y145.595 E.01389
G1 X165.184 Y145.571 E.00053
G1 X165.184 Y149.586 E.01397
G1 X165.034 Y149.586 E.00052
G1 X165.034 Y145.547 E.01405
G1 X164.884 Y145.523 E.00053
G1 X164.884 Y149.586 E.01414
G1 X164.734 Y149.586 E.00052
G1 X164.734 Y145.5 E.01422
G1 X164.584 Y145.476 E.00053
G1 X164.584 Y149.586 E.0143
G1 X164.434 Y149.586 E.00052
G1 X164.434 Y145.452 E.01439
G3 X164.284 Y145.38 I.036 J-.267 E.00059
G1 X164.284 Y149.586 E.01464
G1 X164.134 Y149.586 E.00052
G1 X164.134 Y145.304 E.0149
G1 X163.984 Y145.227 E.00059
G1 X163.984 Y149.586 E.01517
G1 X163.834 Y149.586 E.00052
G1 X163.834 Y145.151 E.01543
G1 X163.684 Y145.075 E.00059
G1 X163.684 Y149.586 E.0157
G1 X163.534 Y149.586 E.00052
G1 X163.534 Y144.998 E.01596
G1 X163.384 Y144.922 E.00059
G1 X163.384 Y149.586 E.01623
G1 X163.234 Y149.586 E.00052
G1 X163.234 Y144.846 E.0165
G1 X163.084 Y144.769 E.00059
G1 X163.084 Y149.586 E.01676
G1 X162.934 Y149.586 E.00052
G1 X162.934 Y144.693 E.01703
G1 X162.784 Y144.617 E.00059
G1 X162.784 Y149.586 E.01729
G1 X162.634 Y149.586 E.00052
G1 X162.634 Y144.523 E.01762
G1 X162.484 Y144.373 E.00074
G1 X162.484 Y149.586 E.01814
G1 X162.334 Y149.586 E.00052
G1 X162.334 Y144.223 E.01866
G1 X162.184 Y144.074 E.00074
G1 X162.184 Y149.586 E.01918
G1 X162.034 Y149.586 E.00052
G1 X162.034 Y143.924 E.0197
G1 X161.884 Y143.774 E.00074
G1 X161.884 Y149.586 E.02022
G1 X161.734 Y149.586 E.00052
G1 X161.734 Y143.624 E.02075
G1 X161.584 Y143.474 E.00074
G1 X161.584 Y149.586 E.02127
G1 X161.434 Y149.586 E.00052
G1 X161.434 Y143.325 E.02179
G1 X161.284 Y143.175 E.00074
G1 X161.284 Y149.586 E.02231
G1 X161.134 Y149.586 E.00052
G1 X161.134 Y142.884 E.02332
G1 X160.984 Y142.59 E.00115
G1 X160.984 Y149.586 E.02435
G1 X160.834 Y149.586 E.00052
G1 X160.834 Y142.295 E.02537
G1 X160.684 Y142 E.00115
G1 X160.684 Y149.586 E.0264
G1 X160.534 Y149.586 E.00052
G1 X160.534 Y141.705 E.02742
G1 X160.384 Y141.392 E.00121
G1 X160.384 Y149.586 E.02851
G1 X160.234 Y149.586 E.00052
G1 X160.234 Y140.015 E.0333
; WIPE_START
G1 F24000
G1 X160.234 Y142.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.024 P1  F30000
G1 X160.084 Y149.654 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X160.084 Y135.576 E.04899
G1 X159.934 Y135.454 E.00067
G1 X159.934 Y149.586 E.04918
G1 X159.784 Y149.586 E.00052
G1 X159.784 Y135.332 E.0496
G1 X159.634 Y135.211 E.00067
G1 X159.634 Y149.586 E.05002
G1 X159.484 Y149.586 E.00052
G1 X159.484 Y135.089 E.05045
G1 X159.334 Y134.968 E.00067
G1 X159.334 Y149.586 E.05087
G1 X159.184 Y149.586 E.00052
G1 X159.184 Y134.846 E.05129
G1 X159.034 Y134.725 E.00067
G1 X159.034 Y149.654 E.05195
G1 X158.884 Y149.539 F30000
G1 F3600
G1 X158.884 Y134.603 E.05197
G1 X158.734 Y134.482 E.00067
G1 X158.734 Y148.164 E.04761
G1 X158.72 Y148.075 E.00031
G1 X158.584 Y147.808 E.00104
G1 X158.584 Y134.36 E.0468
G1 X158.434 Y134.239 E.00067
G1 X158.434 Y147.513 E.04619
G1 X158.284 Y147.218 E.00115
G1 X158.284 Y134.117 E.04559
G1 X158.134 Y133.996 E.00067
G1 X158.134 Y146.923 E.04498
G1 X157.984 Y146.628 E.00115
G1 X157.984 Y133.874 E.04438
G1 X157.834 Y133.753 E.00067
G1 X157.834 Y146.397 E.044
G1 X157.684 Y146.247 E.00074
G1 X157.684 Y133.631 E.0439
G1 X157.534 Y133.51 E.00067
G1 X157.534 Y146.098 E.0438
G1 X157.384 Y145.948 E.00074
G1 X157.384 Y133.388 E.04371
G1 X157.234 Y133.267 E.00067
G1 X157.234 Y145.798 E.04361
G1 X157.084 Y145.648 E.00074
G1 X157.084 Y133.145 E.04351
G1 X156.934 Y133.024 E.00067
G1 X156.934 Y145.499 E.04341
G1 X156.784 Y145.349 E.00074
G1 X156.784 Y132.902 E.04331
G1 X156.634 Y132.781 E.00067
G1 X156.634 Y145.199 E.04321
G2 X156.484 Y145.116 I-.204 J.191 E.00061
G1 X156.484 Y132.659 E.04335
G1 X156.334 Y132.538 E.00067
G1 X156.334 Y145.039 E.0435
G1 X156.184 Y144.963 E.00059
G1 X156.184 Y132.416 E.04366
G1 X156.034 Y132.295 E.00067
G1 X156.034 Y144.886 E.04382
G1 X155.884 Y144.809 E.00059
G1 X155.884 Y132.173 E.04397
G1 X155.781 Y132.09 E.00046
G1 X155.884 Y131.963 E.00057
G1 X155.884 Y111.874 E.06991
G1 X155.734 Y111.948 E.00058
G1 X155.734 Y144.732 E.11408
G1 X155.584 Y144.656 E.00059
G1 X155.584 Y112.023 E.11356
G1 X155.434 Y112.097 E.00058
G1 X155.434 Y120.588 E.02955
G1 X155.319 Y120.295 E.00109
G1 X155.284 Y120.251 E.0002
G1 X155.284 Y112.171 E.02812
G1 X155.134 Y112.245 E.00058
G1 X155.134 Y120.058 E.02719
G2 X154.984 Y119.91 I-.309 J.162 E.00075
G1 X154.984 Y112.319 E.02641
G1 X154.834 Y112.394 E.00058
G1 X154.834 Y119.807 E.0258
G2 X154.684 Y119.744 I-.177 J.211 E.00057
G1 X154.684 Y112.468 E.02532
G1 X154.559 Y112.53 E.00049
G1 X154.534 Y112.479 E.0002
G1 X154.534 Y119.697 E.02512
G2 X154.384 Y119.69 I-.087 J.251 E.00053
G1 X154.384 Y112.023 E.02668
; WIPE_START
G1 F24000
G1 X154.384 Y114.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.032 P1  F30000
G1 X154.234 Y119.756 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.234 Y103.558 E.05637
M73 P68 R8
G1 X154.084 Y103.558 E.00052
G1 X154.084 Y119.726 E.05626
G2 X153.934 Y119.777 I.009 J.275 E.00056
G1 X153.934 Y103.558 E.05644
G1 X153.784 Y103.558 E.00052
G1 X153.784 Y119.874 E.05678
G2 X153.634 Y120.006 I.17 J.344 E.0007
G1 X153.634 Y103.558 E.05724
G1 X153.484 Y103.558 E.00052
G1 X153.484 Y112.01 E.02941
G1 X153.334 Y112.01 E.00052
G1 X153.334 Y103.558 E.02941
G1 X153.184 Y103.558 E.00052
G1 X153.184 Y110.886 E.0255
G1 X153.034 Y110.886 E.00052
G1 X153.034 Y103.558 E.0255
G1 X152.884 Y103.558 E.00052
G1 X152.884 Y110.886 E.0255
G1 X152.734 Y110.886 E.00052
G1 X152.734 Y103.542 E.02556
G1 X152.584 Y103.498 E.00054
G1 X152.584 Y112.01 E.02962
G1 X152.434 Y112.01 E.00052
G1 X152.434 Y103.454 E.02978
G1 X152.284 Y103.409 E.00054
G1 X152.284 Y112.01 E.02993
G1 X152.134 Y112.01 E.00052
G1 X152.134 Y103.365 E.03008
G1 X151.984 Y103.321 E.00054
G1 X151.984 Y112.01 E.03024
G1 X151.834 Y112.01 E.00052
G1 X151.834 Y103.277 E.03039
G1 X151.684 Y103.233 E.00054
G1 X151.684 Y112.01 E.03054
G1 X151.534 Y112.01 E.00052
G1 X151.534 Y103.189 E.0307
G1 X151.384 Y103.145 E.00054
G1 X151.384 Y112.078 E.03108
; WIPE_START
G1 F24000
G1 X151.384 Y110.078 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.934 J.78 P1  F30000
G1 X153.484 Y112.593 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X153.484 Y120.197 E.02646
G1 X153.334 Y120.501 E.00118
G1 X153.334 Y112.593 E.02752
; WIPE_START
G1 F24000
G1 X153.334 Y114.593 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.165 J.351 P1  F30000
G1 X155.434 Y121.575 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.434 Y144.579 E.08005
G1 X155.284 Y144.503 E.00059
G1 X155.284 Y132.8 E.04072
G3 X155.134 Y133.063 I-.598 J-.167 E.00106
G1 X155.134 Y144.427 E.03954
G2 X154.984 Y144.36 I-.178 J.199 E.00058
G1 X154.984 Y133.219 E.03877
G3 X154.834 Y133.325 I-.252 J-.196 E.00065
G1 X154.834 Y144.336 E.03832
G1 X154.684 Y144.312 E.00053
G1 X154.684 Y133.407 E.03795
G1 X154.534 Y133.443 E.00054
G1 X154.534 Y144.289 E.03774
G1 X154.384 Y144.265 E.00053
G1 X154.384 Y133.472 E.03756
G1 X154.234 Y133.468 E.00052
G1 X154.234 Y144.241 E.03749
G1 X154.084 Y144.217 E.00053
G1 X154.084 Y133.449 E.03747
G1 X153.934 Y133.404 E.00055
G1 X153.934 Y144.193 E.03755
G1 X153.784 Y144.169 E.00053
G1 X153.784 Y133.329 E.03772
G3 X153.634 Y133.232 I.085 J-.294 E.00063
G1 X153.634 Y144.146 E.03798
G1 X153.484 Y144.122 E.00053
G1 X153.484 Y133.061 E.03849
G3 X153.334 Y132.821 I.312 J-.362 E.001
G1 X153.334 Y144.166 E.03948
; WIPE_START
G1 F24000
G1 X153.334 Y142.166 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.863 J-.859 P1  F30000
G1 X151.534 Y143.975 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X151.534 Y144.349 E.0013
G2 X151.384 Y144.392 I-.008 J.254 E.00055
G1 X151.384 Y143.846 E.0019
G1 X151.234 Y143.579 E.00107
G1 X151.234 Y144.468 E.0031
G1 X151.084 Y144.545 E.00059
G1 X151.084 Y143.312 E.00429
G1 X150.934 Y143.045 E.00107
G1 X150.934 Y144.621 E.00548
G1 X150.784 Y144.698 E.00059
G1 X150.784 Y142.778 E.00668
G1 X150.634 Y142.512 E.00107
G1 X150.634 Y144.775 E.00788
G1 X150.484 Y144.851 E.00059
G1 X150.484 Y142.245 E.00907
G1 X150.334 Y141.978 E.00107
G1 X150.334 Y144.928 E.01027
G1 X150.184 Y145.005 E.00059
G1 X150.184 Y141.573 E.01194
; WIPE_START
G1 F24000
G1 X150.184 Y143.573 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.182 J.292 P1  F30000
G1 X155.284 Y122.912 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.284 Y122.208 E.00245
G1 X155.134 Y122.386 E.00081
G1 X155.134 Y122.576 E.00066
; WIPE_START
G1 F24000
G1 X155.134 Y122.386 E-.12813
G1 X155.284 Y122.208 E-.15687
G1 X155.284 Y122.912 E-.475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J0 P1  F30000
G1 X155.284 Y123.799 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.284 Y131.313 E.02615
G2 X155.134 Y130.999 I-.841 J.209 E.00122
G1 X155.134 Y129.234 E.00614
G1 X154.984 Y129.234 E.00052
G1 X154.984 Y130.752 E.00528
G1 X154.834 Y130.506 E.001
G1 X154.834 Y129.234 E.00443
G1 X154.684 Y129.234 E.00052
G1 X154.684 Y130.293 E.00369
G1 X154.534 Y130.085 E.00089
G1 X154.534 Y129.234 E.00296
G1 X154.384 Y129.234 E.00052
G1 X154.384 Y129.877 E.00224
G1 X154.234 Y129.669 E.00089
G1 X154.234 Y129.234 E.00151
G1 X154.084 Y129.234 E.00052
G1 X154.084 Y129.577 E.00119
; WIPE_START
G1 F24000
G1 X154.084 Y129.234 E-.13017
G1 X154.234 Y129.234 E-.057
G1 X154.234 Y129.669 E-.16535
G1 X154.384 Y129.877 E-.09744
G1 X154.384 Y129.234 E-.24438
G1 X154.534 Y129.234 E-.057
G1 X154.534 Y129.257 E-.00866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.863 J.858 P1  F30000
G1 X155.134 Y128.654 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.134 Y124.269 E.01526
G1 X154.984 Y124.437 E.00078
G1 X154.984 Y128.586 E.01444
G1 X154.834 Y128.586 E.00052
G1 X154.834 Y124.538 E.01409
G3 X154.684 Y124.615 I-.2 J-.206 E.0006
G1 X154.684 Y128.586 E.01382
G1 X154.534 Y128.586 E.00052
G1 X154.534 Y124.654 E.01368
G3 X154.384 Y124.673 I-.108 J-.251 E.00053
G1 X154.384 Y128.586 E.01362
G1 X154.234 Y128.586 E.00052
G1 X154.234 Y124.669 E.01363
G3 X154.084 Y124.637 I-.018 J-.285 E.00054
G1 X154.084 Y128.586 E.01374
G1 X153.934 Y128.586 E.00052
G1 X153.934 Y124.584 E.01393
G1 X153.784 Y124.489 E.00062
G1 X153.784 Y128.586 E.01426
G1 X153.634 Y128.586 E.00052
G1 X153.634 Y124.352 E.01473
G3 X153.484 Y124.154 I.265 J-.356 E.00088
G1 X153.484 Y128.586 E.01542
G1 X153.334 Y128.586 E.00052
G1 X153.334 Y123.471 E.0178
; WIPE_START
G1 F24000
G1 X153.334 Y125.471 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.016 P1  F30000
G1 X153.184 Y114.169 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X153.184 Y144.087 E.10411
G1 X153.034 Y144.111 E.00053
G1 X153.034 Y115.572 E.09931
G1 X152.884 Y115.64 E.00057
G1 X152.884 Y144.135 E.09916
G1 X152.734 Y144.159 E.00053
G1 X152.734 Y115.708 E.099
G1 X152.617 Y115.76 E.00045
G1 X152.584 Y115.686 E.00028
G1 X152.584 Y119.786 E.01427
G1 X152.434 Y119.786 E.00052
G1 X152.434 Y115.352 E.01543
G1 X152.284 Y115.019 E.00127
G1 X152.284 Y119.786 E.01659
G1 X152.134 Y119.786 E.00052
G1 X152.134 Y114.685 E.01775
G1 X151.984 Y114.352 E.00127
G1 X151.984 Y123.276 E.03105
G1 X151.834 Y123.123 E.00075
G1 X151.834 Y114.018 E.03168
G1 X151.684 Y113.685 E.00127
G1 X151.684 Y122.987 E.03237
G2 X151.534 Y122.868 I-.601 J.602 E.00067
G1 X151.534 Y113.351 E.03312
G1 X151.384 Y113.018 E.00127
G1 X151.384 Y122.766 E.03392
G1 X151.336 Y122.734 E.0002
G1 X151.234 Y122.91 E.00071
G1 X151.234 Y103.03 E.06918
; WIPE_START
G1 F24000
G1 X151.234 Y105.03 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.194 J.235 P1  F30000
G1 X153.034 Y114.169 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X153.034 Y115.101 E.00324
G1 X152.884 Y114.767 E.00127
G1 X152.884 Y114.236 E.00185
G1 X152.734 Y114.236 E.00052
G1 X152.734 Y114.598 E.00126
; WIPE_START
G1 F24000
G1 X152.734 Y114.236 E-.13747
G1 X152.884 Y114.236 E-.057
G1 X152.884 Y114.767 E-.20172
G1 X153.034 Y115.101 E-.13904
G1 X153.034 Y114.509 E-.22477
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.018 P1  F30000
G1 X152.584 Y144.251 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X152.584 Y124.36 E.06922
M73 P69 R8
G1 X152.434 Y124.407 E.00055
G1 X152.434 Y128.586 E.01454
G1 X152.284 Y128.586 E.00052
G1 X152.284 Y124.453 E.01438
G1 X152.134 Y124.499 E.00055
G1 X152.134 Y128.586 E.01422
G1 X151.984 Y128.586 E.00052
G1 X151.984 Y124.405 E.01455
G1 X151.834 Y124.181 E.00094
G1 X151.834 Y132.021 E.02728
G2 X151.684 Y131.87 I-.871 J.719 E.00074
G1 X151.684 Y123.973 E.02748
G1 X151.534 Y123.786 E.00084
G1 X151.534 Y131.744 E.02769
G2 X151.384 Y131.634 I-.604 J.669 E.00065
G1 X151.384 Y123.598 E.02796
G2 X151.234 Y123.467 I-.349 J.249 E.0007
G1 X151.234 Y131.538 E.02808
G1 X151.084 Y131.798 E.00105
G1 X151.084 Y103.458 E.09862
G1 X151.207 Y103.354 E.00056
G1 X151.084 Y103.208 E.00067
G1 X151.084 Y102.986 E.00077
G1 X150.934 Y103.135 F30000
G1 F3600
G1 X150.934 Y102.942 E.00067
; WIPE_START
G1 F24000
G1 X150.934 Y103.135 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.215 J.061 P1  F30000
G1 X152.434 Y133.097 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X152.434 Y144.206 E.03866
G1 X152.284 Y144.23 E.00053
G1 X152.413 Y144.148 E.00053
G1 X152.284 Y143.918 E.00092
G1 X152.284 Y133.214 E.03725
G1 X152.134 Y133.259 E.00055
G1 X152.134 Y143.651 E.03616
G1 X151.984 Y143.383 E.00107
G1 X151.984 Y133.305 E.03507
G1 X151.963 Y133.311 E.00007
G1 X151.834 Y133.118 E.00081
G1 X151.834 Y143.116 E.03479
G1 X151.684 Y142.849 E.00107
G1 X151.684 Y132.895 E.03464
G2 X151.534 Y132.703 I-1.151 J.743 E.00085
G1 X151.534 Y142.582 E.03438
G1 X151.384 Y142.315 E.00107
G1 X151.384 Y132.518 E.03409
G2 X151.234 Y132.344 I-.452 J.238 E.00081
G1 X151.234 Y142.048 E.03377
G1 X151.084 Y141.781 E.00107
G1 X151.084 Y140.102 E.00584
G1 X150.934 Y140.158 E.00056
G1 X150.934 Y141.514 E.00472
G1 X150.784 Y141.246 E.00107
G1 X150.784 Y140.213 E.0036
G1 X150.634 Y140.269 E.00056
G1 X150.634 Y140.979 E.00247
G1 X150.569 Y140.865 E.00046
G1 X150.484 Y140.913 E.00034
G1 X150.484 Y140.19 E.00252
G1 X150.334 Y140.039 E.00074
G1 X150.334 Y140.997 E.00333
G1 X150.184 Y141.081 E.0006
G1 X150.184 Y139.889 E.00415
G1 X150.034 Y139.739 E.00074
G1 X150.034 Y141.166 E.00497
G1 X149.915 Y141.232 E.00048
G1 X150.034 Y141.444 E.00085
G1 X150.034 Y145.081 E.01266
G1 X149.884 Y145.158 E.00059
G1 X149.884 Y139.595 E.01936
G1 X149.734 Y139.504 E.00061
G1 X149.734 Y145.281 E.0201
G1 X149.584 Y145.431 E.00074
G1 X149.584 Y139.333 E.02122
; WIPE_START
G1 F24000
G1 X149.584 Y141.333 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.174 J.321 P1  F30000
G1 X151.084 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X151.084 Y132.142 E.01291
; WIPE_START
G1 F24000
G1 X151.084 Y134.142 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.212 J-.106 P1  F30000
G1 X150.934 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X150.934 Y103.584 E.11229
G1 X150.784 Y103.71 E.00068
G1 X150.784 Y135.784 E.11161
G1 X150.634 Y135.784 E.00052
G1 X150.634 Y103.836 E.11117
G1 X150.484 Y103.963 E.00068
G1 X150.484 Y110.886 E.02409
G1 X150.334 Y110.886 E.00052
G1 X150.334 Y104.089 E.02365
G1 X150.184 Y104.215 E.00068
G1 X150.184 Y110.886 E.02321
G1 X150.034 Y110.886 E.00052
G1 X150.034 Y104.341 E.02278
G1 X149.884 Y104.467 E.00068
G1 X149.884 Y114.272 E.03412
G2 X149.734 Y114.129 I-.869 J.766 E.00072
G1 X149.734 Y104.593 E.03318
G1 X149.584 Y104.72 E.00068
G1 X149.584 Y114.002 E.0323
G1 X149.434 Y113.901 E.00063
G1 X149.434 Y104.846 E.03151
G1 X149.284 Y104.972 E.00068
G1 X149.284 Y114.056 E.03161
; WIPE_START
G1 F24000
G1 X149.284 Y112.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.146 J.409 P1  F30000
G1 X150.484 Y115.417 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X150.484 Y139.237 E.08289
G1 X150.334 Y139.118 E.00067
G1 X150.334 Y115.534 E.08207
G1 X150.184 Y115.58 E.00055
G1 X150.184 Y139.012 E.08154
G1 X150.034 Y138.913 E.00063
G1 X150.034 Y115.576 E.08121
G1 X149.884 Y115.352 E.00094
G1 X149.884 Y138.832 E.0817
G1 X149.734 Y138.752 E.00059
G1 X149.734 Y115.133 E.08219
G1 X149.584 Y114.946 E.00084
G1 X149.584 Y139.18 E.08433
; WIPE_START
G1 F24000
G1 X149.584 Y137.18 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.021 P1  F30000
G1 X149.434 Y145.676 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X149.434 Y114.758 E.10759
G2 X149.284 Y114.605 I-.391 J.234 E.00075
G1 X149.284 Y145.73 E.10831
G1 X149.134 Y145.88 E.00074
G1 X149.134 Y114.489 E.10924
G1 X149.011 Y114.394 E.00054
G1 X149.134 Y114.181 E.00085
G1 X149.134 Y105.098 E.03161
G1 X148.984 Y105.224 E.00068
G1 X148.984 Y146.03 E.142
G1 X148.834 Y146.18 E.00074
G1 X148.834 Y105.35 E.14208
G1 X148.684 Y105.476 E.00068
G1 X148.684 Y146.329 E.14216
G1 X148.534 Y146.494 E.00078
G1 X148.534 Y140.089 E.02229
G1 X148.384 Y140.145 E.00056
G1 X148.384 Y146.789 E.02312
G1 X148.234 Y147.083 E.00115
G1 X148.234 Y140.2 E.02395
G1 X148.084 Y140.256 E.00056
G1 X148.084 Y147.377 E.02478
G1 X147.934 Y147.671 E.00115
G1 X147.934 Y140.224 E.02592
G1 X147.784 Y140.074 E.00074
G1 X147.784 Y148.155 E.02812
G1 X147.634 Y149.106 F30000
G1 F3600
G1 X147.634 Y139.923 E.03196
G1 X147.484 Y139.773 E.00074
G1 X147.484 Y149.586 E.03415
G1 X147.334 Y149.586 E.00052
G1 X147.334 Y139.622 E.03467
G2 X147.184 Y139.525 I-.275 J.259 E.00063
G1 X147.184 Y149.586 E.03501
G1 X147.034 Y149.586 E.00052
G1 X147.034 Y139.354 E.03561
; WIPE_START
G1 F24000
G1 X147.034 Y141.354 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.174 J.32 P1  F30000
G1 X148.534 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X148.534 Y105.602 E.10526
G1 X148.384 Y105.728 E.00068
G1 X148.384 Y135.784 E.10459
G1 X148.234 Y135.784 E.00052
G1 X148.234 Y105.854 E.10415
G1 X148.084 Y105.979 E.00068
G1 X148.084 Y139.507 E.11667
G1 X147.934 Y139.356 F30000
G1 F3600
G1 X147.934 Y106.105 E.11571
M73 P69 R7
G1 X147.784 Y106.231 E.00068
G1 X147.784 Y139.146 E.11454
M73 P70 R7
G2 X147.634 Y139.036 I-.704 J.804 E.00065
G1 X147.634 Y106.357 E.11372
G1 X147.484 Y106.483 E.00068
G1 X147.484 Y138.937 E.11294
G2 X147.334 Y138.851 I-.526 J.741 E.0006
G1 X147.334 Y106.609 E.1122
G1 X147.184 Y106.734 E.00068
G1 X147.184 Y138.771 E.11148
G1 X147.123 Y138.739 E.00024
G1 X147.034 Y138.938 E.00076
G1 X147.034 Y106.86 E.11163
G1 X146.884 Y106.986 E.00068
G1 X146.884 Y149.586 E.14824
G1 X146.734 Y149.586 E.00052
G1 X146.734 Y107.112 E.1478
G1 X146.584 Y107.238 E.00068
G1 X146.584 Y149.586 E.14737
G1 X146.434 Y149.586 E.00052
G1 X146.434 Y107.364 E.14693
G1 X146.284 Y107.489 E.00068
G1 X146.284 Y149.586 E.14649
G1 X146.134 Y149.586 E.00052
G1 X146.134 Y107.615 E.14605
G1 X145.984 Y107.741 E.00068
G1 X145.984 Y149.586 E.14561
G1 X145.834 Y149.586 E.00052
G1 X145.834 Y107.867 E.14518
G1 X145.684 Y107.993 E.00068
G1 X145.684 Y149.586 E.14474
G1 X145.534 Y149.586 E.00052
G1 X145.534 Y108.119 E.1443
G1 X145.384 Y108.244 E.00068
G1 X145.384 Y149.654 E.1441
G1 X145.234 Y148.79 F30000
G1 F3600
G1 X145.234 Y108.37 E.14065
G1 X145.084 Y108.496 E.00068
G1 X145.084 Y147.974 E.13738
G1 X144.934 Y147.68 E.00115
G1 X144.934 Y108.622 E.13591
G1 X144.784 Y108.748 E.00068
G1 X144.784 Y147.385 E.13445
G1 X144.634 Y147.091 E.00115
G1 X144.634 Y108.874 E.13299
G1 X144.484 Y108.999 E.00068
G1 X144.484 Y146.796 E.13153
G2 X144.334 Y146.627 I-.335 J.146 E.0008
G1 X144.334 Y109.125 E.1305
G1 X144.184 Y109.251 E.00068
G1 X144.184 Y146.477 E.12954
G1 X144.034 Y146.327 E.00074
G1 X144.034 Y109.377 E.12858
G1 X143.884 Y109.503 E.00068
G1 X143.884 Y146.177 E.12762
G1 X143.734 Y146.027 E.00074
G1 X143.734 Y109.629 E.12666
G1 X143.584 Y109.754 E.00068
G1 X143.584 Y145.877 E.1257
G1 X143.434 Y145.727 E.00074
G1 X143.434 Y109.88 E.12474
G1 X143.284 Y110.006 E.00068
G1 X143.284 Y145.583 E.1238
G1 X143.134 Y145.507 E.00059
G1 X143.134 Y110.132 E.1231
G1 X142.984 Y110.258 E.00068
G1 X142.984 Y145.431 E.1224
G1 X142.834 Y145.354 E.00059
G1 X142.834 Y113.285 E.11159
G1 X142.684 Y113.628 E.0013
G1 X142.684 Y114.97 E.00467
G1 X142.534 Y114.97 E.00052
G1 X142.534 Y113.852 E.00389
G3 X142.384 Y113.99 I-.365 J-.247 E.00071
G1 X142.384 Y114.97 E.00341
G1 X142.234 Y114.97 E.00052
G1 X142.234 Y114.079 E.0031
G3 X142.084 Y114.133 I-.162 J-.218 E.00056
G1 X142.084 Y114.97 E.00291
G1 X141.934 Y114.97 E.00052
G1 X141.934 Y114.152 E.00285
G1 X141.784 Y114.13 E.00053
M73 P71 R7
G1 X141.784 Y114.97 E.00292
G1 X141.634 Y114.97 E.00052
G1 X141.634 Y114.072 E.00313
G3 X141.484 Y113.974 I.1 J-.317 E.00063
G1 X141.484 Y114.598 E.00217
; WIPE_START
G1 F24000
G1 X141.484 Y113.974 E-.23711
G1 X141.558 Y114.037 E-.03707
G1 X141.634 Y114.072 E-.03164
G1 X141.634 Y114.97 E-.34137
G1 X141.784 Y114.97 E-.057
G1 X141.784 Y114.823 E-.05581
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.766 J.945 P1  F30000
G1 X142.684 Y115.553 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X142.684 Y145.278 E.10344
G1 X142.534 Y145.201 E.00059
G1 X142.534 Y115.62 E.10294
G1 X142.384 Y115.62 E.00052
G1 X142.384 Y145.125 E.10267
G1 X142.234 Y145.049 E.00059
G1 X142.234 Y115.62 E.10241
G1 X142.084 Y115.62 E.00052
G1 X142.084 Y144.972 E.10214
G1 X141.934 Y144.896 E.00059
G1 X141.934 Y138.755 E.02137
; WIPE_START
G1 F24000
G1 X141.934 Y140.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.203 J-.184 P1  F30000
G1 X141.784 Y139.774 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X141.784 Y144.834 E.01761
G1 X141.634 Y144.81 E.00053
G1 X141.634 Y140.268 E.01581
G3 X141.484 Y140.457 I-.506 J-.248 E.00084
G1 X141.484 Y144.786 E.01507
G1 X141.334 Y144.763 E.00053
G1 X141.334 Y140.56 E.01463
G3 X141.184 Y140.621 I-.17 J-.202 E.00057
G1 X141.184 Y144.739 E.01433
G1 X141.034 Y144.715 E.00053
G1 X141.034 Y140.649 E.01415
G1 X140.884 Y140.642 E.00052
G1 X140.884 Y144.692 E.01409
G1 X140.734 Y144.668 E.00053
G1 X140.734 Y140.607 E.01413
G3 X140.584 Y140.534 I.045 J-.282 E.00059
G1 X140.584 Y144.644 E.0143
G1 X140.434 Y144.621 E.00053
G1 X140.434 Y143.05 E.00546
; WIPE_START
G1 F24000
G1 X140.434 Y144.621 E-.59671
G1 X140.584 Y144.644 E-.05771
G1 X140.584 Y144.367 E-.10558
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.056 P1  F30000
G1 X140.434 Y141.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X140.434 Y140.41 E.00246
G3 X140.284 Y140.181 I.45 J-.458 E.00096
G1 X140.284 Y141.04 E.00299
G1 X140.134 Y141.033 E.00052
G1 X140.134 Y139.609 E.00495
; WIPE_START
G1 F24000
G1 X140.134 Y141.033 E-.54079
G1 X140.284 Y141.04 E-.05708
G1 X140.284 Y140.614 E-.16213
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.021 J.662 P1  F30000
G1 X141.934 Y138.068 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X141.934 Y115.62 E.07812
G1 X141.784 Y115.62 E.00052
G1 X141.784 Y136.361 E.07217
G1 X141.634 Y136.094 E.00106
G1 X141.634 Y115.62 E.07125
G1 X141.484 Y115.62 E.00052
G1 X141.484 Y135.906 E.07059
G2 X141.334 Y135.795 I-.281 J.224 E.00066
G1 X141.334 Y115.62 E.07021
M73 P72 R7
G1 X141.184 Y115.62 E.00052
G1 X141.184 Y135.735 E.07
G1 X141.034 Y135.708 E.00053
G1 X141.034 Y115.137 E.07158
; WIPE_START
G1 F24000
G1 X141.034 Y117.137 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.057 P1  F30000
G1 X140.884 Y113.949 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X140.884 Y135.786 E.07599
; WIPE_START
G1 F24000
G1 X140.884 Y133.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.212 J.11 P1  F30000
G1 X142.834 Y112.282 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X142.834 Y110.384 E.00661
G1 X142.684 Y110.509 E.00068
G1 X142.684 Y111.404 E.00311
G1 X142.534 Y111.18 E.00094
G1 X142.534 Y110.635 E.0019
G1 X142.384 Y110.761 E.00068
G1 X142.384 Y111.014 E.00088
G2 X142.234 Y110.904 I-.268 J.208 E.00066
G1 X142.234 Y110.664 E.00084
G1 X142.084 Y110.486 E.00081
G1 X142.084 Y110.837 E.00122
G1 X141.934 Y110.815 E.00053
G1 X141.934 Y100.969 E.03426
G1 X141.784 Y101.165 E.00086
G1 X141.784 Y110.812 E.03357
G1 X141.634 Y110.831 E.00053
G1 X141.634 Y101.36 E.03296
G1 X141.484 Y101.556 E.00086
G1 X141.484 Y110.89 E.03248
G2 X141.334 Y110.981 I.081 J.304 E.00062
G1 X141.334 Y101.736 E.03217
G1 X141.184 Y101.851 E.00066
G1 X141.184 Y111.121 E.03226
G1 X141.034 Y111.348 E.00095
G1 X141.034 Y101.966 E.03265
G1 X140.884 Y102.081 E.00066
G1 X140.884 Y112.168 E.0351
; WIPE_START
G1 F24000
G1 X140.884 Y110.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.023 P1  F30000
G1 X140.734 Y102.111 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X140.734 Y135.75 E.11706
G2 X140.584 Y135.82 I.043 J.289 E.00058
G1 X140.584 Y102.312 E.1166
G1 X140.434 Y102.427 E.00066
G1 X140.434 Y135.943 E.11663
G1 X140.284 Y136.158 E.00091
G1 X140.284 Y102.542 E.11698
G1 X140.134 Y102.657 E.00066
G1 X140.134 Y136.769 E.1187
; WIPE_START
G1 F24000
G1 X140.134 Y134.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.029 P1  F30000
G1 X139.984 Y141.092 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.984 Y115.499 E.08906
G1 X139.834 Y115.544 E.00054
G1 X139.834 Y142.766 E.09473
; WIPE_START
G1 F24000
G1 X139.834 Y140.766 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J-.046 P1  F30000
G1 X139.684 Y144.731 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.684 Y115.59 E.10141
G1 X139.559 Y115.627 E.00045
G1 X139.534 Y115.589 E.00016
G1 X139.534 Y144.687 E.10126
G1 X139.384 Y144.711 E.00053
G1 X139.384 Y115.364 E.10212
G2 X139.234 Y115.142 I-1.39 J.778 E.00093
G1 X139.234 Y144.734 E.10298
G1 X139.084 Y144.758 E.00053
G1 X139.084 Y140.389 E.0152
G1 X138.934 Y140.435 E.00055
G1 X138.934 Y144.782 E.01513
G1 X138.784 Y144.805 E.00053
G1 X138.784 Y140.48 E.01505
G1 X138.664 Y140.517 E.00044
G1 X138.634 Y140.473 E.00019
G1 X138.634 Y144.829 E.01516
G2 X138.484 Y144.881 I.004 J.256 E.00056
G1 X138.484 Y140.251 E.01611
G2 X138.334 Y140.033 I-1.391 J.797 E.00092
G1 X138.334 Y144.957 E.01713
G1 X138.184 Y145.033 E.00059
G1 X138.184 Y139.846 E.01805
G1 X138.034 Y139.66 E.00083
G1 X138.034 Y145.11 E.01896
G1 X137.884 Y145.186 E.00059
G1 X137.884 Y139.421 E.02006
; WIPE_START
G1 F24000
G1 X137.884 Y141.421 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.19 J.256 P1  F30000
G1 X139.084 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.084 Y114.954 E.07272
G1 X138.934 Y114.766 E.00084
G1 X138.934 Y135.784 E.07314
G1 X138.784 Y135.784 E.00052
G1 X138.784 Y114.523 E.07399
; WIPE_START
G1 F24000
G1 X138.784 Y116.523 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.19 J.256 P1  F30000
G1 X139.984 Y110.954 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.984 Y102.773 E.02847
G1 X139.834 Y102.888 E.00066
G1 X139.834 Y110.886 E.02783
G1 X139.684 Y110.886 E.00052
G1 X139.684 Y103.003 E.02743
G3 X139.534 Y103.077 I-.213 J-.242 E.00059
G1 X139.534 Y114.539 E.03988
G1 X139.384 Y114.373 F30000
G1 F3600
G1 X139.384 Y103.139 E.03909
G1 X139.234 Y103.201 E.00056
G1 X139.234 Y114.131 E.03803
G1 X139.084 Y114.004 E.00069
G1 X139.084 Y103.263 E.03737
G1 X138.934 Y103.325 E.00056
G1 X138.934 Y113.9 E.0368
G1 X138.837 Y113.834 E.00041
G1 X138.784 Y113.924 E.00037
G1 X138.784 Y103.387 E.03667
G1 X138.634 Y103.449 E.00056
G1 X138.634 Y114.179 E.03734
G1 X138.509 Y114.391 E.00086
G1 X138.634 Y114.49 E.00055
G1 X138.634 Y139.443 E.08683
G1 X138.484 Y139.269 F30000
G1 F3600
G1 X138.484 Y103.511 E.12443
G1 X138.334 Y103.573 E.00056
G1 X138.334 Y139.031 E.12339
G2 X138.184 Y138.904 I-.634 J.596 E.00069
G1 X138.184 Y103.635 E.12273
G1 X138.034 Y103.697 E.00056
G1 X138.034 Y118.536 E.05164
G1 X137.884 Y118.536 E.00052
G1 X137.884 Y103.759 E.05142
G1 X137.734 Y103.821 E.00056
G1 X137.734 Y118.536 E.0512
G1 X137.584 Y118.536 E.00052
G1 X137.584 Y103.864 E.05106
G1 X137.434 Y103.884 E.00053
G1 X137.434 Y118.536 E.05099
G1 X137.284 Y118.536 E.00052
G1 X137.284 Y103.904 E.05092
G1 X137.134 Y103.924 E.00053
G1 X137.134 Y118.536 E.05085
G1 X136.984 Y118.536 E.00052
G1 X136.984 Y103.943 E.05078
G1 X136.834 Y103.963 E.00053
G1 X136.834 Y118.536 E.05071
G1 X136.684 Y118.536 E.00052
G1 X136.684 Y103.983 E.05064
G1 X136.534 Y104.003 E.00053
G1 X136.534 Y118.536 E.05057
G1 X136.384 Y118.536 E.00052
G1 X136.384 Y104.023 E.0505
G1 X136.234 Y104.043 E.00053
G1 X136.234 Y118.536 E.05043
G1 X136.084 Y118.536 E.00052
G1 X136.084 Y104.062 E.05037
G1 X135.934 Y104.082 E.00053
G1 X135.934 Y118.604 E.05053
; WIPE_START
G1 F24000
G1 X135.934 Y116.604 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.206 J.163 P1  F30000
G1 X138.034 Y132.117 Z1.8
M73 P73 R7
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X138.034 Y138.803 E.02327
G1 X137.934 Y138.736 E.00042
G1 X137.884 Y138.823 E.00035
G1 X137.884 Y132.184 E.0231
G1 X137.734 Y132.184 E.00052
G1 X137.734 Y139.082 E.024
G1 X137.611 Y139.294 E.00085
G1 X137.734 Y139.39 E.00054
G1 X137.734 Y145.263 E.02044
G1 X137.584 Y145.339 E.00059
G1 X137.584 Y132.184 E.04578
G1 X137.434 Y132.184 E.00052
G1 X137.434 Y145.415 E.04604
G1 X137.284 Y145.492 E.00059
G1 X137.284 Y132.184 E.04631
G1 X137.134 Y132.184 E.00052
G1 X137.132 Y145.569 E.04658
G2 X136.984 Y145.697 I.123 J.292 E.00069
G1 X136.984 Y132.184 E.04702
G1 X136.834 Y132.184 E.00052
G1 X136.834 Y145.847 E.04755
G1 X136.684 Y145.997 E.00074
G1 X136.684 Y132.184 E.04807
G1 X136.534 Y132.184 E.00052
G1 X136.534 Y146.147 E.04859
G1 X136.384 Y146.297 E.00074
G1 X136.384 Y132.184 E.04911
G1 X136.234 Y132.184 E.00052
G1 X136.234 Y146.447 E.04963
G1 X136.084 Y146.597 E.00074
G1 X136.084 Y132.184 E.05016
G1 X135.934 Y132.184 E.00052
G1 X135.934 Y146.747 E.05068
G1 X135.784 Y147.032 E.00112
G1 X135.784 Y104.102 E.14939
G1 X135.634 Y104.122 E.00053
G1 X135.634 Y147.326 E.15034
G1 X135.484 Y147.621 E.00115
G1 X135.484 Y104.135 E.15132
G1 X135.334 Y104.115 E.00053
G1 X135.334 Y147.915 E.15242
G1 X135.184 Y148.21 E.00115
G1 X135.184 Y127.078 E.07354
G1 X135.034 Y127.415 E.00128
G1 X135.034 Y149.551 E.07703
G1 X134.884 Y149.654 F30000
G1 F3600
G1 X134.884 Y127.708 E.07637
G1 X134.734 Y127.886 E.00081
G1 X134.734 Y149.586 E.07551
G1 X134.584 Y149.586 E.00052
G1 X134.584 Y128.064 E.07489
G1 X134.434 Y128.242 E.00081
G1 X134.434 Y149.586 E.07427
G1 X134.284 Y149.586 E.00052
G1 X134.284 Y128.345 E.07391
G1 X134.134 Y128.446 E.00063
G1 X134.134 Y149.586 E.07357
G1 X133.984 Y149.586 E.00052
G1 X133.984 Y128.546 E.07322
G1 X133.834 Y128.646 E.00063
G1 X133.834 Y149.586 E.07287
G1 X133.684 Y149.586 E.00052
G1 X133.684 Y128.711 E.07264
G1 X133.534 Y128.76 E.00055
G1 X133.534 Y149.586 E.07247
G1 X133.384 Y149.586 E.00052
G1 X133.384 Y128.808 E.0723
G1 X133.234 Y128.856 E.00055
G1 X133.234 Y149.586 E.07214
G1 X133.084 Y149.586 E.00052
G1 X133.084 Y128.905 E.07197
G3 X132.934 Y128.919 I-.1 J-.251 E.00053
G1 X132.934 Y149.654 E.07215
G1 X132.784 Y149.55 F30000
G1 F3600
G1 X132.784 Y139.468 E.03508
G3 X132.634 Y139.834 I-.669 J-.061 E.0014
G1 X132.634 Y148.317 E.02952
G1 X132.484 Y148.023 E.00115
G1 X132.484 Y140.089 E.02761
G1 X132.334 Y140.229 E.00072
G1 X132.334 Y147.729 E.0261
G1 X132.184 Y147.435 E.00115
G1 X132.184 Y140.365 E.0246
G3 X132.034 Y140.46 I-.288 J-.286 E.00062
G1 X132.034 Y147.141 E.02325
G2 X131.884 Y146.947 I-.374 J.134 E.00087
G1 X131.884 Y140.532 E.02232
M73 P73 R6
G1 X131.734 Y140.577 E.00055
G1 X131.734 Y146.797 E.02164
G1 X131.584 Y146.647 E.00074
G1 X131.584 Y140.623 E.02096
G3 X131.434 Y140.638 I-.1 J-.239 E.00053
G1 X131.434 Y146.497 E.02039
G1 X131.284 Y146.347 E.00074
G1 X131.284 Y141.574 E.01661
G1 X131.134 Y141.797 E.00094
G1 X131.134 Y146.197 E.01531
G1 X130.984 Y146.047 E.00074
G1 X130.984 Y142.021 E.01401
G1 X130.834 Y142.244 E.00094
G1 X130.834 Y145.945 E.01288
G1 X130.684 Y145.868 E.00059
G1 X130.684 Y142.468 E.01183
G1 X130.534 Y142.691 E.00094
G1 X130.534 Y145.792 E.01079
G1 X130.384 Y145.716 E.00059
G1 X130.384 Y142.915 E.00975
G1 X130.234 Y143.138 E.00094
M73 P74 R6
G1 X130.234 Y145.639 E.0087
G1 X130.084 Y145.563 E.00059
G1 X130.084 Y143.362 E.00766
G1 X129.934 Y143.585 E.00094
G1 X129.934 Y145.487 E.00662
G1 X129.784 Y145.41 E.00059
G1 X129.784 Y143.809 E.00557
G1 X129.634 Y144.032 E.00094
G1 X129.634 Y145.334 E.00453
G2 X129.484 Y145.298 I-.131 J.213 E.00055
G1 X129.484 Y144.256 E.00363
G1 X129.334 Y144.479 E.00094
G1 X129.334 Y145.274 E.00277
G1 X129.184 Y145.251 E.00053
G1 X129.184 Y144.703 E.00191
G1 X129.034 Y144.927 E.00094
G1 X129.034 Y145.227 E.00105
G1 X128.884 Y145.203 E.00053
G1 X128.884 Y145.029 E.00061
; WIPE_START
G1 F24000
G1 X128.884 Y145.203 E-.0662
G1 X129.034 Y145.227 E-.05771
G1 X129.034 Y144.927 E-.11412
G1 X129.184 Y144.703 E-.10229
G1 X129.184 Y145.251 E-.20808
G1 X129.334 Y145.274 E-.05771
G1 X129.334 Y144.869 E-.15389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.075 J.571 P1  F30000
G1 X131.284 Y141.199 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X131.284 Y140.638 E.00195
G1 X131.134 Y140.638 E.00052
G1 X131.134 Y141.017 E.00132
G1 X130.984 Y140.916 E.00063
G1 X130.984 Y140.618 E.00104
G1 X130.834 Y140.572 E.00055
G1 X130.834 Y140.903 E.00115
G1 X130.684 Y141.127 E.00094
G1 X130.684 Y140.526 E.00209
G3 X130.534 Y140.44 I.065 J-.285 E.00061
G1 X130.534 Y141.35 E.00317
G1 X130.384 Y141.573 E.00094
G1 X130.384 Y140.337 E.0043
G3 X130.234 Y140.199 I.148 J-.312 E.00072
G1 X130.234 Y141.796 E.00556
G1 X130.084 Y142.02 E.00094
G1 X130.084 Y140.011 E.00699
G3 X129.934 Y139.725 I.358 J-.37 E.00114
G1 X129.934 Y142.364 E.00918
; WIPE_START
G1 F24000
G1 X129.934 Y140.364 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.89 J.83 P1  F30000
G1 X132.784 Y137.305 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.784 Y128.924 E.02917
G1 X132.634 Y128.928 E.00052
G1 X132.634 Y136.63 E.0268
G1 X132.484 Y136.343 E.00113
G1 X132.484 Y128.932 E.02579
G1 X132.334 Y128.937 E.00052
G1 X132.334 Y136.181 E.02521
G2 X132.184 Y136.024 I-.484 J.313 E.00076
G1 X132.184 Y128.915 E.02474
G1 X132.034 Y128.876 E.00054
G1 X132.034 Y135.936 E.02457
G1 X131.884 Y135.856 E.00059
G1 X131.884 Y128.838 E.02442
G1 X131.734 Y128.8 E.00054
G1 X131.734 Y135.786 E.02431
G1 X131.584 Y135.757 E.00053
G1 X131.584 Y128.761 E.02434
G3 X131.434 Y128.692 I.046 J-.297 E.00058
G1 X131.434 Y135.727 E.02448
G2 X131.284 Y135.709 I-.108 J.256 E.00053
G1 X131.284 Y128.605 E.02472
G1 X131.134 Y128.517 E.0006
G1 X131.134 Y135.722 E.02507
G1 X130.984 Y135.734 E.00052
G1 X130.984 Y128.429 E.02542
G3 X130.834 Y128.327 I.108 J-.32 E.00064
G1 X130.834 Y135.751 E.02584
G1 X130.684 Y135.807 E.00056
G1 X130.684 Y128.17 E.02658
G1 X130.534 Y128.012 E.00076
G1 X130.534 Y135.866 E.02733
G1 X130.384 Y135.978 E.00065
G1 X130.384 Y127.881 E.02818
G1 X130.234 Y128.066 E.00083
G1 X130.234 Y136.096 E.02794
G1 X130.084 Y136.305 E.00089
G1 X130.084 Y128.251 E.02802
G1 X129.934 Y128.433 E.00082
G1 X129.934 Y138.452 E.03487
; WIPE_START
G1 F24000
G1 X129.934 Y136.452 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.03 P1  F30000
G1 X129.784 Y142.587 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X129.784 Y128.537 E.04889
G1 X129.634 Y128.64 E.00063
G1 X129.634 Y142.689 E.04889
G1 X129.484 Y142.913 E.00094
G1 X129.484 Y128.743 E.04931
G1 X129.334 Y128.847 E.00063
G1 X129.334 Y143.136 E.04972
G1 X129.184 Y143.359 E.00094
G1 X129.184 Y128.92 E.05024
G1 X129.034 Y128.97 E.00055
G1 X129.034 Y143.583 E.05085
G1 X128.884 Y143.806 E.00094
G1 X128.884 Y129.02 E.05145
G1 X128.734 Y129.07 E.00055
G1 X128.734 Y144.029 E.05205
G1 X128.584 Y144.252 E.00094
G1 X128.584 Y129.12 E.05266
G3 X128.434 Y129.153 I-.132 J-.236 E.00054
G1 X128.434 Y144.597 E.05374
G1 X128.284 Y145.176 F30000
G1 F3600
G1 X128.284 Y129.158 E.05574
G1 X128.134 Y129.163 E.00052
G1 X128.134 Y145.084 E.0554
G2 X127.984 Y145.105 I-.044 J.241 E.00054
G1 X127.984 Y129.168 E.05546
G1 X127.834 Y129.173 E.00052
G1 X127.834 Y145.128 E.05552
G1 X127.684 Y145.152 E.00053
G1 X127.684 Y129.178 E.05559
G3 X127.534 Y129.143 I-.016 J-.273 E.00054
G1 X127.534 Y145.176 E.05579
G1 X127.384 Y145.2 E.00053
G1 X127.384 Y129.104 E.05601
G1 X127.234 Y129.066 E.00054
G1 X127.234 Y145.223 E.05623
G1 X127.084 Y145.247 E.00053
G1 X127.084 Y129.027 E.05644
G1 X126.934 Y128.988 E.00054
G1 X126.934 Y145.271 E.05666
G1 X126.784 Y145.295 E.00053
G1 X126.784 Y128.918 E.05699
G1 X126.634 Y128.829 E.00061
G1 X126.634 Y145.323 E.05739
G1 X126.484 Y145.399 E.00059
G1 X126.484 Y128.74 E.05797
G1 X126.334 Y128.651 E.00061
G1 X126.334 Y145.475 E.05854
G1 X126.184 Y145.552 E.00059
G1 X126.184 Y128.562 E.05912
G1 X126.034 Y128.406 E.00075
G1 X126.034 Y145.628 E.05993
G1 X125.884 Y145.704 E.00059
G1 X125.884 Y128.146 E.0611
G1 X125.734 Y127.985 F30000
G1 F3600
G1 X125.734 Y145.78 E.06192
G1 X125.584 Y145.856 E.00059
G1 X125.584 Y129.102 E.0583
G1 X125.434 Y129.102 E.00052
G1 X125.434 Y145.932 E.05857
G2 X125.284 Y146.023 I.064 J.275 E.00062
G1 X125.284 Y129.035 E.05912
; WIPE_START
G1 F24000
G1 X125.284 Y131.035 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.855 J.866 P1  F30000
G1 X135.184 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X135.184 Y104.095 E.05971
G1 X135.034 Y104.076 E.00053
G1 X135.034 Y121.186 E.05954
G1 X134.884 Y121.186 E.00052
G1 X134.884 Y104.056 E.05961
G1 X134.734 Y104.036 E.00053
G1 X134.734 Y126.395 E.07781
G1 X134.584 Y127.004 F30000
G1 F3600
G1 X134.584 Y104.016 E.08
G1 X134.434 Y103.996 E.00053
G1 X134.434 Y127.162 E.08061
G1 X134.332 Y127.375 E.00082
G1 X134.284 Y127.427 E.00025
G1 X134.284 Y103.976 E.0816
G1 X134.134 Y103.956 E.00053
G1 X134.134 Y127.59 E.08224
G1 X133.984 Y127.753 E.00077
G1 X133.984 Y103.937 E.08288
G1 X133.834 Y103.917 E.00053
G1 X133.834 Y127.879 E.08338
G1 X133.684 Y127.967 E.0006
G1 X133.684 Y103.897 E.08376
G1 X133.534 Y103.877 E.00053
G1 X133.534 Y128.055 E.08413
G1 X133.384 Y128.143 E.0006
G1 X133.384 Y103.857 E.08451
G3 X133.271 Y103.815 I.022 J-.231 E.00042
G1 X133.234 Y103.959 E.00052
G1 X133.234 Y128.184 E.0843
G1 X133.084 Y128.22 E.00054
G1 X133.084 Y104.264 E.08336
G1 X132.934 Y104.835 F30000
M73 P75 R6
G1 F3600
G1 X132.934 Y128.255 E.0815
G1 X132.784 Y128.291 E.00054
G1 X132.784 Y105.406 E.07964
G1 X132.634 Y105.976 F30000
G1 F3600
G1 X132.634 Y111.684 E.01986
G1 X132.611 Y111.541 E.00051
G1 X132.484 Y111.265 E.00106
G1 X132.484 Y106.547 E.01642
G1 X132.334 Y107.118 F30000
G1 F3600
G1 X132.334 Y111.026 E.0136
G1 X132.184 Y110.866 E.00076
G1 X132.184 Y107.688 E.01106
G1 X132.034 Y108.259 F30000
G1 F3600
G1 X132.034 Y110.775 E.00876
G2 X131.884 Y110.729 I-.152 J.225 E.00055
G1 X131.884 Y108.83 E.00661
G1 X131.734 Y109.4 F30000
G1 F3600
G1 X131.734 Y110.712 E.00456
G2 X131.584 Y110.717 I-.066 J.26 E.00053
G1 X131.584 Y110.237 E.00167
G1 X131.482 Y110.623 E.00139
G1 X131.434 Y110.61 E.00017
G1 X131.434 Y110.764 E.00054
G2 X131.284 Y110.846 I.052 J.272 E.00061
G1 X131.284 Y110.571 E.00096
G1 X131.134 Y110.531 E.00054
G1 X131.134 Y110.972 E.00153
G1 X130.984 Y111.162 E.00084
G1 X130.984 Y110.422 E.00257
; WIPE_START
G1 F24000
G1 X130.984 Y111.162 E-.28105
G1 X131.134 Y110.972 E-.09187
G1 X131.134 Y110.531 E-.16754
G1 X131.284 Y110.571 E-.05893
G1 X131.284 Y110.846 E-.1048
G1 X131.373 Y110.783 E-.04162
G1 X131.409 Y110.772 E-.01419
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.026 J-.654 P1  F30000
G1 X130.834 Y111.674 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X130.834 Y102.617 E.03151
G1 X130.684 Y102.502 E.00066
G1 X130.684 Y113.098 E.03687
; WIPE_START
G1 F24000
G1 X130.684 Y111.098 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.751 J.957 P1  F30000
G1 X132.634 Y112.629 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.634 Y128.289 E.05449
G1 X132.484 Y128.279 E.00052
G1 X132.484 Y115.152 E.04568
G1 X132.334 Y115.385 E.00096
G1 X132.334 Y128.269 E.04483
G1 X132.184 Y128.259 E.00052
G1 X132.184 Y115.524 E.04432
G1 X132.034 Y115.601 E.00059
G1 X132.034 Y128.218 E.04391
G1 X131.884 Y128.161 E.00056
G1 X131.884 Y115.637 E.04358
G3 X131.734 Y115.65 I-.097 J-.255 E.00053
G1 X131.734 Y128.105 E.04334
G1 X131.584 Y128.048 E.00056
G1 X131.584 Y115.631 E.04321
G3 X131.434 Y115.581 I.014 J-.29 E.00056
G1 X131.434 Y127.948 E.04303
G1 X131.284 Y127.831 E.00066
G1 X131.284 Y115.493 E.04294
G3 X131.134 Y115.359 I.159 J-.329 E.00071
G1 X131.134 Y127.715 E.043
G3 X130.984 Y127.558 I.18 J-.322 E.00077
G1 X130.984 Y115.143 E.0432
G1 X130.938 Y115.076 E.00028
G1 X130.834 Y114.807 E.00101
G1 X130.834 Y127.462 E.04404
G1 X130.684 Y127.248 F30000
G1 F3600
G1 X130.684 Y113.228 E.04879
; WIPE_START
G1 F24000
G1 X130.684 Y115.228 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.03 P1  F30000
G1 X130.534 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X130.534 Y102.387 E.06565
G1 X130.384 Y102.272 E.00066
G1 X130.384 Y121.186 E.06582
G1 X130.234 Y121.186 E.00052
G1 X130.234 Y102.156 E.06622
G1 X130.084 Y102.041 E.00066
G1 X130.084 Y127.223 E.08763
G1 X129.934 Y127.477 F30000
G1 F3600
G1 X129.934 Y101.926 E.08891
G1 X129.784 Y101.811 E.00066
G1 X129.784 Y110.784 E.03123
G1 X129.634 Y110.784 E.00052
G1 X129.634 Y101.683 E.03167
G1 X129.484 Y101.488 E.00086
G1 X129.484 Y110.784 E.03235
G1 X129.334 Y110.784 E.00052
G1 X129.334 Y101.292 E.03303
G1 X129.184 Y101.097 E.00086
G1 X129.184 Y114.174 E.04551
G2 X129.034 Y114.031 I-.876 J.773 E.00072
G1 X129.034 Y100.901 E.04569
G1 X128.884 Y100.706 E.00086
G1 X128.884 Y113.904 E.04593
G1 X128.734 Y113.8 E.00063
G1 X128.734 Y100.51 E.04625
G1 X128.584 Y100.315 E.00086
G1 X128.584 Y113.959 E.04748
; WIPE_START
G1 F24000
G1 X128.584 Y111.959 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.146 J.409 P1  F30000
G1 X129.784 Y115.321 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X129.784 Y127.597 E.04272
G3 X129.634 Y127.796 I-.386 J-.136 E.00088
G1 X129.634 Y115.438 E.043
G1 X129.484 Y115.484 E.00055
G1 X129.484 Y127.929 E.04331
G1 X129.334 Y128.063 E.0007
G1 X129.334 Y115.48 E.04379
G1 X129.184 Y115.256 E.00094
G1 X129.184 Y128.192 E.04501
G1 X129.034 Y128.258 E.00057
G1 X129.034 Y115.035 E.04601
G1 X128.884 Y114.848 E.00084
G1 X128.884 Y128.325 E.0469
G1 X128.734 Y128.391 E.00057
G1 X128.734 Y114.661 E.04778
G2 X128.584 Y114.506 I-.399 J.237 E.00076
G1 X128.584 Y128.458 E.04855
G3 X128.434 Y128.48 I-.109 J-.228 E.00054
G1 X128.434 Y114.39 E.04903
G1 X128.311 Y114.294 E.00054
G1 X128.434 Y114.083 E.00085
G1 X128.434 Y100.119 E.04859
G3 X128.284 Y99.861 I.409 J-.41 E.00105
G1 X128.284 Y128.497 E.09965
G1 X128.134 Y128.514 E.00053
G1 X128.134 Y99.499 E.10097
G1 X127.984 Y99.138 E.00136
G1 X127.984 Y128.531 E.10228
G3 X127.834 Y128.529 I-.072 J-.238 E.00053
G1 X127.834 Y98.776 E.10354
G1 X127.684 Y98.415 E.00136
G1 X127.684 Y128.5 E.10469
G1 X127.534 Y128.471 E.00053
G1 X127.534 Y97.644 E.10727
; WIPE_START
G1 F24000
G1 X127.534 Y99.644 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.058 P1  F30000
M73 P76 R6
G1 X127.384 Y96.502 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X127.384 Y128.442 E.11115
G1 X127.234 Y128.413 E.00053
G1 X127.234 Y96.136 E.11232
G1 X127.084 Y96.136 E.00052
G1 X127.084 Y128.333 E.11204
G1 X126.934 Y128.251 E.00059
G1 X126.934 Y96.136 E.11176
G1 X126.784 Y96.136 E.00052
G1 X126.784 Y128.17 E.11147
G1 X126.634 Y128.088 E.00059
G1 X126.634 Y96.136 E.11119
G1 X126.484 Y96.136 E.00052
G1 X126.484 Y127.934 E.11065
G1 X126.334 Y127.777 E.00075
G1 X126.334 Y96.136 E.11011
G1 X126.184 Y96.136 E.00052
G1 X126.184 Y127.621 E.10956
G1 X126.034 Y127.343 E.0011
G1 X126.034 Y96.136 E.10859
G1 X125.884 Y96.136 E.00052
G1 X125.884 Y127.192 E.10807
G1 X125.734 Y126.632 F30000
G1 F3600
G1 X125.734 Y96.136 E.10612
G1 X125.584 Y96.136 E.00052
G1 X125.584 Y121.186 E.08717
G1 X125.434 Y121.186 E.00052
G1 X125.434 Y96.136 E.08717
G1 X125.284 Y96.136 E.00052
G1 X125.284 Y121.254 E.0874
; WIPE_START
G1 F24000
G1 X125.284 Y119.254 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.007 P1  F30000
G1 X125.134 Y146.269 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X125.134 Y96.136 E.17445
G1 X124.984 Y96.136 E.00052
G1 X124.984 Y146.323 E.17464
G1 X124.834 Y146.473 E.00074
G1 X124.834 Y96.136 E.17517
G1 X124.684 Y96.136 E.00052
G1 X124.684 Y136.658 E.14101
G1 X124.534 Y136.355 E.00118
G1 X124.534 Y96.069 E.14019
G1 X124.384 Y96.47 F30000
G1 F3600
G1 X124.384 Y136.188 E.13821
G1 X124.234 Y136.03 E.00076
G1 X124.234 Y98.123 E.13191
G1 X124.084 Y98.491 E.00138
G1 X124.084 Y135.942 E.13032
G1 X123.934 Y135.855 E.0006
G1 X123.934 Y98.854 E.12876
G1 X123.784 Y99.217 E.00137
G1 X123.784 Y135.787 E.12726
G1 X123.634 Y135.752 E.00054
G1 X123.634 Y99.58 E.12587
G1 X123.484 Y99.943 E.00137
G1 X123.484 Y135.717 E.12449
G1 X123.434 Y135.706 E.00018
G2 X123.334 Y135.701 I-.059 J.199 E.00035
G1 X123.334 Y100.28 E.12326
G1 X123.184 Y100.475 E.00086
G1 X123.184 Y135.71 E.12261
G1 X123.034 Y135.719 E.00052
G1 X123.034 Y100.671 E.12196
G1 X122.884 Y100.866 E.00086
G1 X122.884 Y135.743 E.12137
G1 X122.734 Y135.799 E.00056
G1 X122.734 Y126.965 E.03074
G1 X122.584 Y127.302 E.00128
G1 X122.584 Y135.855 E.02976
G2 X122.434 Y135.94 I.067 J.295 E.00061
G1 X122.434 Y127.64 E.02888
G1 X122.284 Y127.827 E.00083
G1 X122.284 Y136.053 E.02863
G2 X122.134 Y136.177 I.127 J.306 E.00069
G1 X122.134 Y128.005 E.02844
G1 X121.984 Y128.183 E.00081
G1 X121.984 Y136.385 E.02854
G2 X121.834 Y136.692 I.436 J.403 E.00121
G1 X121.834 Y128.231 E.02944
; WIPE_START
G1 F24000
G1 X121.834 Y130.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.211 J.121 P1  F30000
G1 X122.734 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M73 P77 R6
G1 X122.734 Y101.061 E.07027
G1 X122.584 Y101.256 E.00086
G1 X122.584 Y121.186 E.06935
G1 X122.434 Y121.186 E.00052
G1 X122.434 Y101.452 E.06867
G1 X122.284 Y101.647 E.00086
G1 X122.284 Y121.254 E.06823
; WIPE_START
G1 F24000
G1 X122.284 Y119.254 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.024 P1  F30000
G1 X122.134 Y126.9 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X122.134 Y101.842 E.0872
G1 X121.984 Y102.037 E.00086
G1 X121.984 Y127.057 E.08706
G1 X121.834 Y127.371 E.00121
G1 X121.834 Y102.165 E.08771
G1 X121.684 Y102.28 E.00066
G1 X121.684 Y127.536 E.08789
G1 X121.534 Y127.699 E.00077
G1 X121.534 Y102.395 E.08805
M73 P77 R5
G1 X121.384 Y102.51 E.00066
G1 X121.384 Y127.85 E.08818
G1 X121.234 Y127.938 E.0006
G1 X121.234 Y102.625 E.08808
G1 X121.084 Y102.74 E.00066
G1 X121.084 Y128.025 E.08799
G1 X120.934 Y128.113 E.0006
G1 X120.934 Y102.855 E.08789
G1 X120.784 Y102.97 E.00066
G1 X120.784 Y128.172 E.0877
G1 X120.634 Y128.208 E.00054
G1 X120.634 Y103.085 E.08742
G1 X120.484 Y103.2 E.00066
G1 X120.484 Y128.244 E.08715
G1 X120.334 Y128.279 E.00054
G1 X120.334 Y103.315 E.08687
G1 X120.184 Y103.43 E.00066
G1 X120.184 Y128.293 E.08652
G1 X120.034 Y128.282 E.00052
G1 X120.034 Y103.507 E.08622
G1 X119.884 Y103.569 E.00056
G1 X119.884 Y128.272 E.08596
G1 X119.734 Y128.262 E.00052
G1 X119.734 Y103.631 E.08571
G1 X119.584 Y103.693 E.00056
G1 X119.584 Y128.238 E.08541
G1 X119.434 Y128.181 E.00056
G1 X119.434 Y103.755 E.085
G1 X119.284 Y103.817 E.00056
G1 X119.284 Y128.124 E.08458
G1 X119.134 Y128.067 E.00056
G1 X119.134 Y103.879 E.08417
G1 X118.984 Y103.941 E.00056
G1 X118.984 Y127.986 E.08367
G1 X118.834 Y127.87 E.00066
G1 X118.834 Y104.003 E.08305
G1 X118.684 Y104.065 E.00056
G1 X118.684 Y127.754 E.08243
G3 X118.534 Y127.629 I.128 J-.306 E.00069
G1 X118.534 Y104.127 E.08178
G1 X118.384 Y104.189 E.00056
G1 X118.384 Y127.415 E.08082
G1 X118.234 Y127.202 E.00091
G1 X118.234 Y104.251 E.07987
G1 X118.084 Y104.313 E.00056
G1 X118.084 Y121.186 E.05871
G1 X117.934 Y121.186 E.00052
G1 X117.934 Y104.349 E.05859
G1 X117.784 Y104.369 E.00053
G1 X117.784 Y121.186 E.05852
G1 X117.634 Y121.186 E.00052
G1 X117.634 Y104.389 E.05845
G1 X117.484 Y104.409 E.00053
G1 X117.484 Y127.262 E.07953
G1 X117.334 Y127.512 E.00102
G1 X117.334 Y115.62 E.04138
G1 X117.468 Y115.62 E.00047
G1 X117.334 Y115.378 E.00096
G1 X117.334 Y104.428 E.0381
G1 X117.184 Y104.448 E.00053
M73 P78 R5
G1 X117.184 Y115.108 E.03709
G1 X117.034 Y114.838 E.00108
G1 X117.034 Y104.468 E.03609
G1 X116.884 Y104.488 E.00053
G1 X116.884 Y114.549 E.03501
G1 X116.734 Y114.193 E.00134
G1 X116.734 Y104.507 E.0337
G1 X116.584 Y104.527 E.00053
G1 X116.584 Y114.01 E.033
G1 X116.434 Y113.581 F30000
G1 F3600
G1 X116.434 Y104.547 E.03144
G1 X116.284 Y104.567 E.00053
G1 X116.284 Y112.999 E.02934
G1 X116.134 Y112.416 F30000
G1 F3600
G1 X116.134 Y104.586 E.02725
G1 X115.984 Y104.606 E.00053
G1 X115.984 Y110.88 E.02183
G1 X115.834 Y110.881 E.00052
G1 X115.834 Y104.626 E.02177
G3 X115.684 Y104.627 I-.077 J-.279 E.00053
G1 X115.684 Y110.883 E.02177
G1 X115.534 Y110.885 E.00052
G1 X115.534 Y104.607 E.02185
G1 X115.384 Y104.588 E.00053
G1 X115.384 Y114.97 E.03613
G1 X115.234 Y114.97 E.00052
G1 X115.234 Y110.534 E.01544
G1 X115.084 Y110.534 E.00052
G1 X115.084 Y115.038 E.01567
; WIPE_START
G1 F24000
G1 X115.084 Y113.038 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.934 J.78 P1  F30000
G1 X117.184 Y115.553 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X117.184 Y127.749 E.04244
G1 X117.034 Y127.883 E.0007
G1 X117.034 Y115.62 E.04267
G1 X116.884 Y115.62 E.00052
G1 X116.884 Y128.016 E.04314
G1 X116.734 Y128.15 E.0007
G1 X116.734 Y115.62 E.0436
G1 X116.584 Y115.62 E.00052
G1 X116.584 Y128.235 E.0439
G1 X116.434 Y128.303 E.00057
G1 X116.434 Y115.62 E.04413
G1 X116.284 Y115.62 E.00052
G1 X116.284 Y128.37 E.04437
G1 X116.134 Y128.437 E.00057
G1 X116.134 Y115.62 E.0446
G1 X115.984 Y115.62 E.00052
G1 X115.984 Y128.474 E.04473
G1 X115.834 Y128.491 E.00053
G1 X115.834 Y115.62 E.04479
G1 X115.684 Y115.62 E.00052
G1 X115.684 Y128.508 E.04485
G1 X115.534 Y128.525 E.00053
G1 X115.534 Y115.62 E.04491
G1 X115.384 Y115.62 E.00052
G1 X115.384 Y128.539 E.04496
G1 X115.234 Y128.51 E.00053
G1 X115.234 Y115.62 E.04485
G1 X115.084 Y115.62 E.00052
G1 X115.084 Y128.481 E.04475
G1 X114.934 Y128.451 E.00053
G1 X114.934 Y110.534 E.06235
G1 X114.784 Y110.534 E.00052
G1 X114.784 Y128.422 E.06225
G3 X114.634 Y128.36 I.023 J-.268 E.00057
G1 X114.634 Y110.467 E.06227
; WIPE_START
G1 F24000
G1 X114.634 Y112.467 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.023 P1  F30000
G1 X114.484 Y104.401 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X114.484 Y128.279 E.08309
G1 X114.334 Y128.197 E.00059
G1 X114.334 Y104.449 E.08264
G1 X114.184 Y104.429 E.00053
G1 X114.184 Y110.886 E.02247
G1 X114.034 Y110.886 E.00052
G1 X114.034 Y104.41 E.02254
G1 X113.884 Y104.39 E.00053
G1 X113.884 Y110.886 E.02261
G1 X113.734 Y110.886 E.00052
G1 X113.734 Y104.37 E.02267
G1 X113.584 Y104.35 E.00053
G1 X113.584 Y114.376 E.03489
G1 X113.434 Y114.221 E.00075
G1 X113.434 Y104.317 E.03447
G1 X113.284 Y104.255 E.00056
G1 X113.284 Y114.088 E.03422
G2 X113.134 Y113.969 I-.645 J.664 E.00067
G1 X113.134 Y104.193 E.03402
G1 X112.984 Y104.131 E.00056
G1 X112.984 Y113.867 E.03388
G1 X112.934 Y113.834 E.00021
G1 X112.834 Y114.007 E.0007
G1 X112.834 Y103.996 E.03484
; WIPE_START
G1 F24000
G1 X112.834 Y105.996 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.205 J.173 P1  F30000
G1 X114.184 Y115.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X114.184 Y128.115 E.04428
G3 X114.034 Y127.986 I.129 J-.301 E.0007
G1 X114.034 Y115.507 E.04342
G1 X113.884 Y115.553 E.00055
G1 X113.884 Y127.829 E.04272
G1 X113.734 Y127.673 E.00075
G1 X113.734 Y115.599 E.04202
G1 X113.661 Y115.621 E.00026
G1 X113.584 Y115.505 E.00049
G1 X113.584 Y127.444 E.04154
M73 P79 R5
G1 X113.434 Y127.141 E.00118
G1 X113.434 Y115.281 E.04127
G2 X113.284 Y115.073 I-1.296 J.775 E.00089
G1 X113.284 Y126.953 E.04134
; WIPE_START
G1 F24000
G1 X113.284 Y124.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.049 P1  F30000
G1 X113.134 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X113.134 Y114.886 E.02216
G1 X112.984 Y114.698 E.00084
G1 X112.984 Y121.186 E.02258
G1 X112.834 Y121.186 E.00052
G1 X112.834 Y114.481 E.02333
; WIPE_START
G1 F24000
G1 X112.834 Y116.481 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J-.038 P1  F30000
G1 X112.684 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X112.684 Y103.934 E.06027
; WIPE_START
G1 F24000
G1 X112.684 Y105.934 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.425 J1.14 P1  F30000
G1 X132.484 Y113.307 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.484 Y114.324 E.00354
G1 X132.334 Y114.312 E.00052
G1 X132.334 Y113.679 E.0022
G3 X132.184 Y113.8 I-.274 J-.186 E.00068
G1 X132.184 Y114.3 E.00174
G1 X132.039 Y114.288 E.00051
G1 X132.034 Y114.344 E.00019
G1 X132.034 Y113.887 E.00159
G1 X131.884 Y113.928 E.00054
G1 X131.884 Y114.9 E.00338
G3 X131.734 Y115 I-.126 J-.026 E.0007
G1 X131.734 Y113.95 E.00365
G1 X131.584 Y113.946 E.00052
G1 X131.584 Y114.876 E.00324
G3 X131.434 Y114.546 I.566 J-.456 E.00128
G1 X131.434 Y113.84 E.00246
; WIPE_START
G1 F24000
G1 X131.434 Y114.546 E-.26819
G1 X131.516 Y114.777 E-.09311
G1 X131.584 Y114.876 E-.04572
G1 X131.584 Y113.948 E-.35298
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.168 J-.343 P1  F30000
G1 X124.684 Y137.406 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X124.684 Y146.624 E.03208
G1 X124.534 Y146.774 E.00074
G1 X124.534 Y139.863 E.02405
G1 X124.416 Y140.122 E.00099
G1 X124.384 Y140.16 E.00017
G1 X124.384 Y146.925 E.02354
G2 X124.234 Y147.098 I.194 J.319 E.00081
G1 X124.234 Y140.331 E.02355
G3 X124.084 Y140.469 I-.302 J-.178 E.00072
G1 X124.084 Y147.392 E.02409
G1 X123.934 Y147.686 E.00115
G1 X123.934 Y140.562 E.02479
G3 X123.784 Y140.649 I-.218 J-.202 E.00061
G1 X123.784 Y147.98 E.02551
G1 X123.634 Y148.274 E.00115
G1 X123.634 Y140.689 E.02639
G1 X123.484 Y140.729 E.00054
G1 X123.484 Y149.412 E.03022
G1 X123.334 Y149.654 F30000
G1 F3600
G1 X123.334 Y140.746 E.031
G1 X123.184 Y140.74 E.00052
G1 X123.184 Y149.586 E.03078
G1 X123.034 Y149.586 E.00052
G1 X123.034 Y140.735 E.0308
G3 X122.884 Y140.693 I-.008 J-.259 E.00055
G1 X122.884 Y141.164 E.00164
G1 X122.734 Y141.043 E.00067
G1 X122.734 Y140.639 E.0014
G3 X122.584 Y140.574 I.037 J-.288 E.00058
G1 X122.584 Y140.922 E.00121
G3 X122.459 Y140.818 I1.634 J-2.081 E.00057
G1 X122.434 Y140.849 E.00014
G1 X122.434 Y140.465 E.00134
G1 X122.284 Y140.355 E.00065
G1 X122.284 Y141.034 E.00237
G1 X122.134 Y141.22 E.00083
G1 X122.134 Y140.154 E.00371
G3 X121.984 Y139.867 I.388 J-.386 E.00114
G1 X121.984 Y141.405 E.00535
G1 X121.834 Y141.59 E.00083
G1 X121.834 Y137.396 E.01459
; WIPE_START
G1 F24000
G1 X121.834 Y139.396 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.215 J-.073 P1  F30000
G1 X121.684 Y141.883 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X121.684 Y128.413 E.04687
G1 X121.534 Y128.513 E.00063
G1 X121.534 Y141.961 E.0468
G1 X121.384 Y142.146 E.00083
G1 X121.384 Y128.614 E.04709
G3 X121.234 Y128.696 I-.218 J-.219 E.0006
G1 X121.234 Y142.331 E.04745
G1 X121.084 Y142.517 E.00083
G1 X121.084 Y128.744 E.04793
G1 X120.934 Y128.792 E.00055
G1 X120.934 Y142.702 E.0484
G1 X120.784 Y142.887 E.00083
G1 X120.784 Y128.84 E.04888
G1 X120.634 Y128.888 E.00055
G1 X120.634 Y143.073 E.04936
G1 X120.484 Y143.258 E.00083
G1 X120.484 Y128.918 E.0499
G1 X120.334 Y128.922 E.00052
G1 X120.334 Y143.443 E.05053
G1 X120.184 Y143.629 E.00083
G1 X120.184 Y128.926 E.05116
G1 X120.034 Y128.931 E.00052
G1 X120.034 Y143.814 E.05179
G1 X119.884 Y143.999 E.00083
G1 X119.884 Y128.935 E.05242
G3 X119.734 Y128.927 I-.061 J-.265 E.00053
G1 X119.734 Y144.184 E.05309
G1 X119.584 Y144.37 E.00083
G1 X119.584 Y128.889 E.05387
G1 X119.434 Y128.851 E.00054
G1 X119.434 Y144.555 E.05465
G1 X119.284 Y144.74 E.00083
G1 X119.284 Y128.812 E.05543
G1 X119.134 Y128.774 E.00054
G1 X119.134 Y144.926 E.0562
G1 X118.984 Y145.111 E.00083
G1 X118.984 Y128.721 E.05703
G1 X118.834 Y128.634 E.0006
G1 X118.834 Y145.296 E.05798
G1 X118.684 Y145.481 E.00083
G1 X118.684 Y128.468 E.0592
; WIPE_START
G1 F24000
G1 X118.684 Y130.468 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.953 J.757 P1  F30000
G1 X124.534 Y137.833 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X124.534 Y138.876 E.00363
G1 X124.384 Y138.577 E.00116
G1 X124.384 Y138.144 E.00151
G3 X124.234 Y138.302 I-.442 J-.271 E.00076
G1 X124.234 Y138.515 E.00074
; WIPE_START
G1 F24000
G1 X124.234 Y138.302 E-.08116
G1 X124.384 Y138.144 E-.0826
G1 X124.384 Y138.577 E-.1645
G1 X124.534 Y138.876 E-.12686
G1 X124.534 Y138.073 E-.30486
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.089 J-.543 P1  F30000
G1 X122.884 Y141.381 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X122.884 Y149.586 E.02855
G1 X122.734 Y149.586 E.00052
G1 X122.734 Y141.673 E.02754
G1 X122.584 Y141.858 E.00083
G1 X122.584 Y149.586 E.02689
G1 X122.434 Y149.586 E.00052
G1 X122.434 Y142.043 E.02625
G1 X122.284 Y142.229 E.00083
G1 X122.284 Y149.586 E.0256
G1 X122.134 Y149.586 E.00052
G1 X122.134 Y142.414 E.02496
G1 X121.984 Y142.599 E.00083
G1 X121.984 Y149.586 E.02431
G1 X121.834 Y149.586 E.00052
G1 X121.834 Y142.784 E.02367
G1 X121.684 Y142.969 E.00083
G1 X121.684 Y149.586 E.02303
G1 X121.534 Y149.586 E.00052
G1 X121.534 Y143.155 E.02238
G1 X121.384 Y143.34 E.00083
G1 X121.384 Y149.654 E.02197
G1 X121.234 Y149.059 F30000
G1 F3600
G1 X121.234 Y143.525 E.01926
G1 X121.084 Y143.71 E.00083
G1 X121.084 Y148.272 E.01588
G1 X120.934 Y147.977 E.00115
G1 X120.934 Y143.895 E.01421
G1 X120.784 Y144.081 E.00083
G1 X120.784 Y147.683 E.01254
G1 X120.634 Y147.388 E.00115
G1 X120.634 Y144.266 E.01087
G1 X120.484 Y144.451 E.00083
G1 X120.484 Y147.217 E.00963
G1 X120.334 Y147.067 E.00074
G1 X120.334 Y144.636 E.00846
G1 X120.184 Y144.821 E.00083
G1 X120.184 Y146.917 E.00729
G1 X120.034 Y146.767 E.00074
G1 X120.034 Y145.007 E.00613
G1 X119.884 Y145.192 E.00083
G1 X119.884 Y146.617 E.00496
G1 X119.734 Y146.467 E.00074
G1 X119.734 Y145.377 E.00379
G1 X119.584 Y145.562 E.00083
G1 X119.584 Y146.358 E.00277
G1 X119.434 Y146.281 E.00059
G1 X119.434 Y145.747 E.00186
G1 X119.284 Y145.933 E.00083
G1 X119.284 Y146.205 E.00095
G1 X119.134 Y146.129 E.00059
G1 X119.134 Y146.01 E.00041
G1 X118.834 Y146.052 F30000
G1 F3600
G1 X118.834 Y145.936 E.0004
G1 X118.684 Y145.814 E.00067
G1 X118.684 Y145.9 E.0003
G1 X118.534 Y145.823 E.00059
G1 X118.534 Y128.459 E.06043
G1 X118.384 Y128.369 E.00061
G1 X118.384 Y145.778 E.06058
G1 X118.234 Y145.754 E.00053
G1 X118.234 Y128.223 E.06101
G1 X118.084 Y128.066 E.00076
G1 X118.084 Y145.73 E.06147
G1 X117.934 Y145.706 E.00053
G1 X117.934 Y127.909 E.06193
G1 X117.893 Y127.867 E.0002
G1 X117.784 Y128.003 E.00061
G1 X117.784 Y145.682 E.06152
G1 X117.634 Y145.658 E.00053
G1 X117.634 Y128.189 E.06079
G1 X117.484 Y128.375 E.00083
M73 P80 R5
G1 X117.484 Y145.634 E.06006
G1 X117.334 Y145.61 E.00053
G1 X117.334 Y128.502 E.05953
G1 X117.184 Y128.605 E.00063
G1 X117.184 Y145.586 E.05909
G2 X117.034 Y145.599 I-.055 J.235 E.00053
G1 X117.034 Y128.708 E.05878
G1 X116.884 Y128.811 E.00063
G1 X116.884 Y145.623 E.0585
G1 X116.734 Y145.647 E.00053
G1 X116.734 Y128.903 E.05827
G1 X116.584 Y128.953 E.00055
G1 X116.584 Y145.671 E.05818
G1 X116.434 Y145.695 E.00053
G1 X116.434 Y140.508 E.01805
G1 X116.284 Y140.518 E.00052
G1 X116.284 Y145.719 E.0181
G1 X116.134 Y145.743 E.00053
G1 X116.134 Y140.518 E.01818
G1 X115.984 Y140.518 E.00052
G1 X115.984 Y145.768 E.01827
G1 X115.834 Y145.792 E.00053
G1 X115.834 Y140.518 E.01835
G1 X115.684 Y140.518 E.00052
G1 X115.684 Y145.866 E.01861
G1 X115.534 Y145.942 E.00059
G1 X115.534 Y140.518 E.01888
G1 X115.384 Y140.518 E.00052
G1 X115.384 Y146.019 E.01914
G1 X115.234 Y146.095 E.00059
G1 X115.234 Y140.518 E.01941
G1 X115.084 Y140.518 E.00052
G1 X115.084 Y146.172 E.01967
G1 X114.934 Y146.249 E.00059
G1 X114.934 Y140.518 E.01994
G1 X114.784 Y140.518 E.00052
G1 X114.784 Y146.325 E.02021
G1 X114.634 Y146.403 E.00059
G1 X114.634 Y140.518 E.02048
G1 X114.484 Y140.518 E.00052
G1 X114.484 Y146.553 E.021
G1 X114.334 Y146.703 E.00074
G1 X114.334 Y140.518 E.02152
G1 X114.184 Y140.518 E.00052
G1 X114.184 Y146.852 E.02204
G1 X114.034 Y147.002 E.00074
G1 X114.034 Y140.518 E.02256
G1 X113.884 Y140.518 E.00052
G1 X113.884 Y147.152 E.02308
G1 X113.734 Y147.301 E.00074
G1 X113.734 Y141.574 E.01993
G1 X113.584 Y141.759 E.00083
G1 X113.584 Y147.553 E.02016
G1 X113.434 Y147.848 E.00115
G1 X113.434 Y141.945 E.02054
G1 X113.284 Y142.13 E.00083
G1 X113.284 Y148.143 E.02092
G1 X113.134 Y148.437 E.00115
G1 X113.134 Y142.315 E.0213
G1 X112.984 Y142.5 E.00083
G1 X112.984 Y149.6 E.02471
G1 X112.834 Y149.654 F30000
G1 F3600
G1 X112.834 Y142.686 E.02425
G1 X112.684 Y142.871 E.00083
G1 X112.684 Y149.586 E.02337
G1 X112.534 Y149.586 E.00052
G1 X112.534 Y143.056 E.02272
G1 X112.384 Y143.241 E.00083
G1 X112.384 Y149.586 E.02208
G1 X112.234 Y149.586 E.00052
G1 X112.234 Y143.427 E.02143
G1 X112.084 Y143.612 E.00083
G1 X112.084 Y149.586 E.02079
G1 X111.934 Y149.586 E.00052
G1 X111.934 Y143.797 E.02014
G1 X111.784 Y143.982 E.00083
G1 X111.784 Y149.586 E.0195
G1 X111.634 Y149.586 E.00052
G1 X111.634 Y144.168 E.01886
G1 X111.484 Y144.353 E.00083
G1 X111.484 Y149.586 E.01821
G1 X111.334 Y149.586 E.00052
G1 X111.334 Y144.538 E.01757
G1 X111.184 Y144.723 E.00083
G1 X111.184 Y149.586 E.01692
G1 X111.034 Y149.586 E.00052
G1 X111.034 Y144.908 E.01628
G1 X110.884 Y145.094 E.00083
G1 X110.884 Y149.586 E.01563
G1 X110.734 Y149.586 E.00052
G1 X110.734 Y145.279 E.01499
G1 X110.584 Y145.464 E.00083
G1 X110.584 Y148.685 E.01121
G1 X110.434 Y148.391 E.00115
G1 X110.434 Y145.649 E.00954
G1 X110.284 Y145.835 E.00083
G1 X110.284 Y148.097 E.00787
G1 X110.134 Y147.804 E.00115
G1 X110.134 Y146.02 E.00621
G1 X109.984 Y146.205 E.00083
G1 X109.984 Y147.572 E.00476
G1 X109.834 Y147.415 E.00075
G1 X109.834 Y146.39 E.00357
G1 X109.684 Y146.576 E.00083
G1 X109.684 Y147.259 E.00238
G1 X109.534 Y147.103 E.00075
G1 X109.534 Y146.761 E.00119
G1 X109.384 Y146.946 E.00083
G1 X109.384 Y147.044 E.00034
; WIPE_START
G1 F24000
G1 X109.384 Y146.946 E-.03719
G1 X109.534 Y146.761 E-.09057
G1 X109.534 Y147.103 E-.12992
G1 X109.684 Y147.259 E-.08232
G1 X109.684 Y146.576 E-.2597
G1 X109.834 Y146.39 E-.09057
G1 X109.834 Y146.574 E-.06973
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.985 J.714 P1  F30000
G1 X113.734 Y141.194 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X113.734 Y140.518 E.00235
G1 X113.584 Y140.518 E.00052
G1 X113.584 Y141.073 E.00193
; WIPE_START
G1 F24000
G1 X113.584 Y140.518 E-.30547
G1 X113.734 Y140.518 E-.08253
G1 X113.734 Y141.194 E-.372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.542 J1.09 P1  F30000
G1 X116.434 Y139.851 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X116.434 Y129.003 E.03775
G1 X116.284 Y129.053 E.00055
G1 X116.284 Y139.566 E.03658
G1 X116.134 Y139.386 E.00081
G1 X116.134 Y129.103 E.03578
G3 X115.984 Y129.152 I-.157 J-.228 E.00056
G1 X115.984 Y139.181 E.0349
G1 X115.834 Y138.938 E.00099
G1 X115.834 Y129.157 E.03404
G1 X115.684 Y129.162 E.00052
G1 X115.684 Y138.696 E.03318
G1 X115.534 Y138.453 E.00099
G1 X115.534 Y129.166 E.03232
G1 X115.384 Y129.171 E.00052
G1 X115.384 Y138.143 E.03122
G3 X115.234 Y137.777 I1.456 J-.81 E.00138
G1 X115.234 Y129.176 E.02993
G3 X115.084 Y129.156 I-.041 J-.264 E.00053
G1 X115.084 Y137.546 E.02919
G1 X114.934 Y137.105 F30000
G1 F3600
G1 X114.934 Y129.117 E.0278
G1 X114.784 Y129.078 E.00054
G1 X114.784 Y135.794 E.02337
G1 X114.781 Y135.773 E.00008
G1 X114.634 Y135.776 E.00051
G1 X114.634 Y129.04 E.02344
G1 X114.484 Y129.001 E.00054
G1 X114.484 Y135.779 E.02359
G1 X114.334 Y135.782 E.00052
G1 X114.334 Y128.947 E.02378
G1 X114.184 Y128.858 E.00061
G1 X114.184 Y139.868 E.03831
G1 X114.034 Y139.868 E.00052
G1 X114.034 Y128.769 E.03862
G1 X113.884 Y128.681 E.00061
G1 X113.884 Y139.868 E.03893
G1 X113.734 Y139.868 E.00052
G1 X113.734 Y128.592 E.03924
G3 X113.584 Y128.46 I.149 J-.321 E.0007
G1 X113.584 Y139.936 E.03993
; WIPE_START
G1 F24000
G1 X113.584 Y137.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.215 J-.06 P1  F30000
G1 X113.434 Y140.952 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X113.434 Y128.299 E.04403
G1 X113.284 Y128.138 E.00077
G1 X113.284 Y140.936 E.04453
G1 X113.134 Y141.121 E.00083
G1 X113.134 Y129.102 E.04182
G1 X112.984 Y129.102 E.00052
G1 X112.984 Y141.306 E.04247
G1 X112.834 Y141.492 E.00083
G1 X112.834 Y129.102 E.04311
G1 X112.684 Y129.102 E.00052
G1 X112.684 Y141.677 E.04376
G1 X112.534 Y141.862 E.00083
G1 X112.534 Y103.945 E.13195
G1 X112.384 Y103.883 E.00056
G1 X112.384 Y142.047 E.13281
G1 X112.234 Y142.233 E.00083
G1 X112.234 Y103.821 E.13367
G1 X112.084 Y103.758 E.00056
G1 X112.084 Y142.418 E.13453
G1 X111.934 Y142.603 E.00083
G1 X111.934 Y103.696 E.13539
G1 X111.784 Y103.634 E.00056
G1 X111.784 Y118.536 E.05186
G1 X111.634 Y118.536 E.00052
G1 X111.634 Y103.572 E.05207
G1 X111.484 Y103.51 E.00056
G1 X111.484 Y118.536 E.05229
G1 X111.334 Y118.536 E.00052
G1 X111.334 Y103.436 E.05254
G1 X111.184 Y103.321 E.00066
G1 X111.184 Y118.536 E.05294
G1 X111.034 Y118.536 E.00052
G1 X111.034 Y103.206 E.05335
G1 X110.884 Y103.091 E.00066
G1 X110.884 Y118.536 E.05375
G1 X110.734 Y118.536 E.00052
G1 X110.734 Y102.976 E.05415
G1 X110.584 Y102.861 E.00066
G1 X110.584 Y118.536 E.05455
G1 X110.434 Y118.536 E.00052
G1 X110.434 Y102.746 E.05495
G1 X110.284 Y102.631 E.00066
G1 X110.284 Y118.536 E.05535
G1 X110.134 Y118.536 E.00052
G1 X110.134 Y102.516 E.05575
G1 X109.984 Y102.401 E.00066
G1 X109.984 Y118.536 E.05615
G1 X109.834 Y118.536 E.00052
G1 X109.834 Y102.286 E.05655
G1 X109.684 Y102.171 E.00066
G1 X109.684 Y118.604 E.05718
; WIPE_START
G1 F24000
G1 X109.684 Y116.604 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.934 J.78 P1  F30000
G1 X111.784 Y119.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X111.784 Y131.536 E.04322
G1 X111.634 Y131.536 E.00052
G1 X111.634 Y119.184 E.04298
G1 X111.484 Y119.184 E.00052
G1 X111.484 Y131.536 E.04298
G1 X111.334 Y131.536 E.00052
G1 X111.334 Y119.184 E.04298
G1 X111.184 Y119.184 E.00052
M73 P81 R5
G1 X111.184 Y131.536 E.04298
G1 X111.034 Y131.536 E.00052
G1 X111.034 Y119.184 E.04298
G1 X110.884 Y119.184 E.00052
G1 X110.884 Y131.536 E.04298
G1 X110.734 Y131.536 E.00052
G1 X110.734 Y119.184 E.04298
G1 X110.584 Y119.184 E.00052
G1 X110.584 Y131.536 E.04298
G1 X110.434 Y131.536 E.00052
G1 X110.434 Y119.184 E.04298
G1 X110.284 Y119.184 E.00052
G1 X110.284 Y131.604 E.04322
; WIPE_START
G1 F24000
G1 X110.284 Y129.604 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.045 J.624 P1  F30000
G1 X111.784 Y132.117 Z1.8
G1 Z1.4
G1 E.8 F1800
M73 P81 R4
G1 F3600
G1 X111.784 Y142.789 E.03714
G1 X111.634 Y142.974 E.00083
G1 X111.634 Y132.184 E.03755
G1 X111.484 Y132.184 E.00052
G1 X111.484 Y143.159 E.03819
G1 X111.334 Y143.345 E.00083
G1 X111.334 Y132.184 E.03884
G1 X111.184 Y132.184 E.00052
G1 X111.184 Y143.53 E.03948
G1 X111.034 Y143.715 E.00083
G1 X111.034 Y132.184 E.04013
G1 X110.884 Y132.184 E.00052
G1 X110.884 Y143.901 E.04077
G1 X110.734 Y144.086 E.00083
G1 X110.734 Y132.184 E.04142
G1 X110.584 Y132.184 E.00052
G1 X110.584 Y144.271 E.04206
G1 X110.434 Y144.457 E.00083
G1 X110.434 Y132.184 E.04271
G1 X110.284 Y132.184 E.00052
G1 X110.284 Y144.642 E.04335
G1 X110.134 Y144.827 E.00083
G1 X110.134 Y132.184 E.044
G1 X109.984 Y132.184 E.00052
G1 X109.984 Y145.012 E.04464
G1 X109.834 Y145.198 E.00083
G1 X109.834 Y132.184 E.04529
G1 X109.684 Y132.184 E.00052
G1 X109.684 Y145.383 E.04593
G1 X109.534 Y145.568 E.00083
G1 X109.534 Y102.048 E.15145
G1 X109.384 Y101.852 E.00086
G1 X109.384 Y145.754 E.15277
G1 X109.234 Y145.939 E.00083
G1 X109.234 Y101.657 E.15409
G1 X109.084 Y101.462 E.00086
G1 X109.084 Y146.124 E.15542
G1 X108.934 Y146.31 E.00083
G1 X108.934 Y101.267 E.15674
G1 X108.784 Y101.071 E.00086
G1 X108.784 Y146.495 E.15807
G1 X108.757 Y146.528 E.00015
G1 X108.634 Y146.474 E.00047
G1 X108.634 Y100.876 E.15867
G1 X108.484 Y100.681 E.00086
G1 X108.484 Y111.648 E.03816
G1 X108.334 Y111.319 E.00126
G1 X108.334 Y100.486 E.0377
G1 X108.184 Y100.29 E.00086
G1 X108.184 Y111.144 E.03777
G2 X108.034 Y111.01 I-.318 J.206 E.00071
G1 X108.034 Y99.962 E.03845
G1 X107.884 Y99.599 E.00137
G1 X107.884 Y110.92 E.0394
G1 X107.734 Y110.871 E.00055
G1 X107.734 Y99.236 E.04049
G1 X107.584 Y98.873 E.00137
G1 X107.584 Y110.857 E.0417
G2 X107.434 Y110.866 I-.059 J.264 E.00053
G1 X107.434 Y98.51 E.043
G1 X107.284 Y98.147 E.00137
G1 X107.284 Y110.905 E.04439
G2 X107.134 Y110.987 I.054 J.277 E.0006
G1 X107.134 Y96.53 E.05031
G1 X106.984 Y96.069 F30000
G1 F3600
G1 X106.984 Y111.099 E.0523
G1 X106.834 Y111.277 E.00081
G1 X106.834 Y110.402 E.00305
G1 X106.684 Y110.551 E.00074
G1 X106.684 Y111.745 E.00415
; WIPE_START
G1 F24000
G1 X106.684 Y110.551 E-.45367
G1 X106.834 Y110.402 E-.08042
G1 X106.834 Y110.996 E-.22591
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J0 P1  F30000
G1 X106.834 Y110.191 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X106.834 Y96.136 E.04891
G1 X106.684 Y96.136 E.00052
G1 X106.684 Y109.946 E.04806
G1 X106.534 Y109.795 E.00074
G1 X106.534 Y96.136 E.04753
G1 X106.384 Y96.136 E.00052
G1 X106.384 Y109.645 E.04701
G1 X106.234 Y109.495 E.00074
G1 X106.234 Y96.136 E.04649
G1 X106.084 Y96.136 E.00052
G1 X106.084 Y109.345 E.04596
G1 X105.934 Y109.195 E.00074
M73 P82 R4
G1 X105.934 Y96.136 E.04544
G1 X105.784 Y96.136 E.00052
G1 X105.784 Y109.044 E.04492
G1 X105.634 Y108.894 E.00074
G1 X105.634 Y96.136 E.0444
G1 X105.484 Y96.136 E.00052
G1 X105.484 Y108.744 E.04387
G1 X105.334 Y108.594 E.00074
G1 X105.334 Y96.136 E.04335
G1 X105.184 Y96.136 E.00052
G1 X105.184 Y108.444 E.04283
G1 X105.034 Y108.293 E.00074
G1 X105.034 Y96.136 E.04231
G1 X104.884 Y96.136 E.00052
G1 X104.884 Y108.143 E.04178
G1 X104.734 Y107.993 E.00074
G1 X104.734 Y96.136 E.04126
G1 X104.584 Y96.136 E.00052
G1 X104.584 Y107.843 E.04074
G1 X104.434 Y107.693 E.00074
G1 X104.434 Y96.136 E.04022
G1 X104.284 Y96.136 E.00052
G1 X104.284 Y107.542 E.03969
G1 X104.134 Y107.392 E.00074
G1 X104.134 Y96.136 E.03917
G1 X103.984 Y96.136 E.00052
G1 X103.984 Y107.242 E.03865
G1 X103.834 Y107.092 E.00074
G1 X103.834 Y96.069 E.03836
; WIPE_START
G1 F24000
G1 X103.834 Y98.069 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.204 J-.179 P1  F30000
G1 X103.684 Y97.058 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X103.684 Y106.942 E.03439
G1 X103.534 Y106.791 E.00074
G1 X103.534 Y98.403 E.02919
G1 X103.384 Y98.766 E.00137
G1 X103.384 Y106.641 E.0274
G1 X103.234 Y106.491 E.00074
G1 X103.234 Y99.129 E.02562
G1 X103.084 Y99.492 E.00137
G1 X103.084 Y106.341 E.02383
G1 X102.934 Y106.191 E.00074
G1 X102.934 Y99.855 E.02205
G1 X102.784 Y100.217 E.00137
G1 X102.784 Y106.041 E.02026
G1 X102.634 Y105.89 E.00074
G1 X102.634 Y100.543 E.01861
G1 X102.484 Y100.738 E.00086
G1 X102.484 Y105.74 E.01741
G1 X102.334 Y105.59 E.00074
G1 X102.334 Y100.934 E.0162
G1 X102.184 Y101.129 E.00086
G1 X102.184 Y105.44 E.015
G1 X102.034 Y105.29 E.00074
G1 X102.034 Y101.324 E.0138
G1 X101.884 Y101.52 E.00086
G1 X101.884 Y105.139 E.0126
G1 X101.734 Y104.989 E.00074
G1 X101.734 Y101.715 E.01139
G1 X101.584 Y101.91 E.00086
G1 X101.584 Y104.839 E.01019
G1 X101.434 Y104.689 E.00074
G1 X101.434 Y102.106 E.00899
G1 X101.284 Y102.301 E.00086
G1 X101.284 Y104.539 E.00779
G1 X101.134 Y104.388 E.00074
G1 X101.134 Y102.465 E.00669
G1 X100.984 Y102.58 E.00066
G1 X100.984 Y104.238 E.00577
G1 X100.834 Y104.088 E.00074
G1 X100.834 Y102.695 E.00485
G1 X100.684 Y102.81 E.00066
G1 X100.684 Y103.938 E.00392
G1 X100.534 Y103.787 E.00074
G1 X100.534 Y102.925 E.003
G1 X100.384 Y103.04 E.00066
G1 X100.384 Y103.637 E.00208
G1 X100.234 Y103.486 E.00074
G1 X100.234 Y103.155 E.00115
G1 X100.084 Y103.27 E.00066
G1 X100.084 Y103.432 E.00056
; WIPE_START
G1 F24000
G1 X100.084 Y103.27 E-.06135
G1 X100.234 Y103.155 E-.07184
G1 X100.234 Y103.486 E-.12591
G1 X100.384 Y103.637 E-.08072
G1 X100.384 Y103.04 E-.2268
G1 X100.534 Y102.925 E-.07184
G1 X100.534 Y103.245 E-.12153
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.936 J.778 P1  F30000
G1 X108.484 Y112.816 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.484 Y146.409 E.1169
G1 X108.334 Y146.344 E.00057
G1 X108.334 Y138.015 E.02898
G1 X108.317 Y138.083 E.00025
G1 X108.184 Y138.312 E.00092
G1 X108.184 Y139.321 E.00351
G1 X108.034 Y139.302 E.00053
G1 X108.034 Y138.53 E.00269
G3 X107.884 Y138.652 I-.398 J-.333 E.00068
G1 X107.884 Y139.283 E.0022
G1 X107.734 Y139.265 E.00053
G1 X107.734 Y138.771 E.00172
G1 X107.584 Y138.83 E.00056
G1 X107.584 Y139.719 E.00309
G3 X107.434 Y139.879 I-.345 J-.173 E.00077
G1 X107.434 Y138.89 E.00344
G3 X107.284 Y138.916 I-.116 J-.23 E.00054
G1 X107.284 Y139.956 E.00362
G3 X107.134 Y139.985 I-.123 J-.235 E.00054
G1 X107.134 Y138.928 E.00368
G3 X106.984 Y138.929 I-.077 J-.248 E.00053
G1 X106.984 Y140.003 E.00374
G3 X106.834 Y139.98 I-.035 J-.275 E.00053
G1 X106.834 Y138.896 E.00377
G1 X106.684 Y138.864 E.00053
G1 X106.684 Y139.956 E.0038
G1 X106.534 Y139.882 E.00058
G1 X106.534 Y138.789 E.0038
G1 X106.384 Y138.705 E.0006
G1 X106.384 Y139.759 E.00367
G3 X106.234 Y139.554 I.268 J-.354 E.0009
G1 X106.234 Y138.574 E.00341
G1 X106.084 Y138.418 E.00075
G1 X106.084 Y139.425 E.0035
; WIPE_START
G1 F24000
G1 X106.084 Y138.418 E-.38247
G1 X106.234 Y138.574 E-.08228
G1 X106.234 Y139.351 E-.29525
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.292 J1.181 P1  F30000
G1 X108.184 Y139.833 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.184 Y146.279 E.02243
G2 X108.034 Y146.246 I-.137 J.272 E.00054
G1 X108.034 Y140.213 E.021
G1 X107.884 Y140.342 E.00069
G1 X107.884 Y146.223 E.02047
G1 X107.734 Y146.199 E.00053
G1 X107.734 Y140.464 E.01996
G1 X107.584 Y140.528 E.00057
G1 X107.584 Y146.176 E.01965
G1 X107.434 Y146.152 E.00053
G1 X107.434 Y140.592 E.01935
G3 X107.284 Y140.623 I-.136 J-.288 E.00054
G1 X107.284 Y146.128 E.01916
G1 X107.134 Y146.105 E.00053
G1 X107.134 Y140.647 E.01899
G3 X106.984 Y140.641 I-.061 J-.345 E.00053
G1 X106.984 Y146.084 E.01894
G1 X106.834 Y146.108 E.00053
G1 X106.834 Y140.633 E.01905
G1 X106.684 Y140.624 E.00052
G1 X106.684 Y146.131 E.01916
G1 X106.534 Y146.155 E.00053
G1 X106.534 Y140.58 E.0194
G1 X106.384 Y140.529 E.00055
G1 X106.384 Y146.179 E.01966
G1 X106.234 Y146.202 E.00053
G1 X106.234 Y140.457 E.01999
G1 X106.084 Y140.351 E.00064
G1 X106.084 Y146.226 E.02044
G1 X105.934 Y146.249 E.00053
G1 X105.934 Y140.239 E.02091
G3 X105.784 Y140.066 I.328 J-.435 E.0008
G1 X105.784 Y140.682 E.00214
G1 X105.634 Y140.529 E.00075
G1 X105.634 Y139.804 E.00252
G3 X105.484 Y139.404 I.606 J-.455 E.00151
G1 X105.484 Y140.472 E.00372
G1 X105.784 Y140.965 F30000
G1 F3600
G1 X105.784 Y146.288 E.01852
G1 X105.634 Y146.364 E.00059
G1 X105.634 Y141.208 E.01794
G1 X105.484 Y141.356 E.00073
G1 X105.484 Y146.441 E.01769
G1 X105.334 Y146.517 E.00059
G1 X105.334 Y141.504 E.01745
G1 X105.184 Y141.651 E.00073
G1 X105.184 Y146.593 E.0172
G1 X105.034 Y146.669 E.00059
G1 X105.034 Y141.799 E.01695
G1 X104.884 Y141.947 E.00073
G1 X104.884 Y146.746 E.0167
G1 X104.816 Y146.78 E.00026
G2 X104.734 Y146.841 I.052 J.156 E.00036
G1 X104.734 Y142.095 E.01652
G1 X104.584 Y142.243 E.00073
G1 X104.584 Y146.992 E.01653
G1 X104.434 Y147.142 E.00074
G1 X104.434 Y142.39 E.01654
G1 X104.284 Y142.538 E.00073
G1 X104.284 Y147.292 E.01654
G1 X104.134 Y147.443 E.00074
G1 X104.134 Y142.686 E.01655
G1 X103.984 Y142.834 E.00073
G1 X103.984 Y147.593 E.01656
G1 X103.937 Y147.64 E.00023
G1 X103.834 Y147.843 E.00079
G1 X103.834 Y142.982 E.01692
G1 X103.684 Y143.129 E.00073
G1 X103.684 Y148.137 E.01743
G1 X103.534 Y148.431 E.00115
G1 X103.534 Y143.277 E.01793
G1 X103.384 Y143.425 E.00073
G1 X103.384 Y149.225 E.02018
G1 X103.234 Y149.654 F30000
G1 F3600
G1 X103.234 Y143.573 E.02116
G1 X103.084 Y143.721 E.00073
G1 X103.084 Y149.586 E.02041
G1 X102.934 Y149.586 E.00052
G1 X102.934 Y143.868 E.0199
G1 X102.784 Y144.016 E.00073
G1 X102.784 Y149.586 E.01938
G1 X102.634 Y149.586 E.00052
G1 X102.634 Y144.164 E.01887
G1 X102.484 Y144.312 E.00073
G1 X102.484 Y149.586 E.01835
G1 X102.334 Y149.586 E.00052
G1 X102.334 Y144.459 E.01784
G1 X102.184 Y144.607 E.00073
G1 X102.184 Y149.586 E.01733
G1 X102.034 Y149.586 E.00052
G1 X102.034 Y144.755 E.01681
G1 X101.884 Y144.903 E.00073
G1 X101.884 Y149.586 E.0163
G1 X101.734 Y149.586 E.00052
G1 X101.734 Y145.051 E.01578
G1 X101.584 Y145.198 E.00073
G1 X101.584 Y149.586 E.01527
G1 X101.434 Y149.586 E.00052
G1 X101.434 Y145.346 E.01475
G1 X101.284 Y145.494 E.00073
G1 X101.284 Y149.654 E.01447
G1 X101.134 Y149.269 F30000
G1 F3600
G1 X101.134 Y145.642 E.01262
G1 X100.984 Y145.79 E.00073
G1 X100.984 Y148.549 E.0096
G1 X100.834 Y148.255 E.00115
G1 X100.834 Y145.937 E.00806
G1 X100.684 Y146.085 E.00073
G1 X100.684 Y147.96 E.00652
G1 X100.534 Y147.797 E.00077
G1 X100.534 Y146.233 E.00544
G1 X100.384 Y146.381 E.00073
G1 X100.384 Y147.647 E.00441
G1 X100.234 Y147.497 E.00074
G1 X100.234 Y146.529 E.00337
G1 X100.084 Y146.676 E.00073
G1 X100.084 Y147.347 E.00233
G1 X99.934 Y147.202 E.00073
G1 X99.934 Y146.824 E.00132
G1 X99.784 Y146.972 E.00073
G1 X99.784 Y147.201 E.0008
; WIPE_START
G1 F24000
G1 X99.784 Y146.972 E-.08715
G1 X99.934 Y146.824 E-.08002
G1 X99.934 Y147.202 E-.14373
G1 X100.084 Y147.347 E-.07919
G1 X100.084 Y146.676 E-.25486
G1 X100.234 Y146.529 E-.08002
G1 X100.234 Y146.621 E-.03503
; WIPE_END
G1 E-.04 F1800
G17
M73 P83 R4
G3 Z1.8 I.93 J.785 P1  F30000
G1 X108.334 Y137.017 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.334 Y115.281 E.07564
G1 X108.184 Y115.501 E.00093
G1 X108.184 Y136.414 E.07277
G2 X108.034 Y136.216 I-.587 J.289 E.00087
G1 X108.034 Y115.631 E.07163
G3 X107.884 Y115.719 I-.221 J-.206 E.00061
G1 X107.884 Y136.044 E.07073
G2 X107.734 Y135.928 I-.358 J.308 E.00066
G1 X107.734 Y115.771 E.07014
G1 X107.584 Y115.794 E.00053
G1 X107.584 Y135.857 E.06982
G1 X107.434 Y135.789 E.00057
G1 X107.434 Y115.778 E.06964
G3 X107.284 Y115.737 I-.005 J-.281 E.00055
G1 X107.284 Y135.751 E.06964
G1 X107.134 Y135.732 E.00053
G1 X107.134 Y115.667 E.06982
G1 X106.984 Y115.541 E.00068
G1 X106.984 Y135.712 E.07019
G2 X106.834 Y135.715 I-.07 J.269 E.00053
G1 X106.834 Y115.358 E.07084
G3 X106.684 Y115.043 I.485 J-.424 E.00123
G1 X106.684 Y135.738 E.07202
G1 X106.534 Y135.76 E.00053
G1 X106.534 Y110.7 E.0872
G1 X106.454 Y110.779 E.00039
G1 X106.384 Y110.708 E.00035
G1 X106.384 Y135.81 E.08735
G1 X106.234 Y135.879 E.00057
G1 X106.234 Y110.555 E.08812
G1 X106.084 Y110.404 E.00074
G1 X106.084 Y135.959 E.08893
G1 X105.934 Y136.096 E.00071
G1 X105.934 Y110.254 E.08993
G1 X105.784 Y110.104 E.00074
G1 X105.784 Y110.886 E.00272
G1 X105.634 Y110.886 E.00052
G1 X105.634 Y109.953 E.00325
G1 X105.484 Y109.803 E.00074
G1 X105.484 Y110.886 E.00377
G1 X105.334 Y110.886 E.00052
G1 X105.334 Y109.653 E.00429
G1 X105.184 Y109.503 E.00074
G1 X105.184 Y114.378 E.01696
G1 X105.034 Y114.223 E.00075
G1 X105.034 Y109.353 E.01695
G1 X104.884 Y109.203 E.00074
G1 X104.884 Y114.088 E.017
G2 X104.734 Y113.969 I-.652 J.666 E.00067
G1 X104.734 Y109.052 E.01711
G1 X104.584 Y108.902 E.00074
G1 X104.584 Y113.866 E.01727
G1 X104.537 Y113.833 E.0002
G1 X104.434 Y114.01 E.00071
G1 X104.434 Y108.656 E.01863
; WIPE_START
G1 F24000
G1 X104.434 Y110.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.664 J1.02 P1  F30000
G1 X108.334 Y113.195 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.334 Y113.827 E.0022
; WIPE_START
G1 F24000
G1 X108.334 Y113.195 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.795 J-.922 P1  F30000
G1 X105.784 Y115.394 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X105.784 Y136.232 E.07252
G1 X105.634 Y136.447 E.00091
G1 X105.634 Y115.51 E.07286
G1 X105.484 Y115.555 E.00055
G1 X105.484 Y137.014 E.07467
; WIPE_START
G1 F24000
G1 X105.484 Y135.014 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.033 P1  F30000
G1 X105.334 Y140.546 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X105.334 Y115.601 E.0868
G1 X105.261 Y115.623 E.00026
G1 X105.184 Y115.507 E.00049
G1 X105.184 Y140.599 E.08731
G1 X105.034 Y140.746 E.00073
G1 X105.034 Y115.284 E.08861
G2 X104.884 Y115.075 I-1.313 J.787 E.00089
G1 X104.884 Y140.894 E.08985
G1 X104.734 Y141.042 E.00073
G1 X104.734 Y114.888 E.09101
G1 X104.584 Y114.701 E.00084
G1 X104.584 Y141.19 E.09218
G1 X104.434 Y141.337 E.00073
G1 X104.434 Y114.481 E.09345
; WIPE_START
G1 F24000
G1 X104.434 Y116.481 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.023 P1  F30000
G1 X104.284 Y108.506 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X104.284 Y141.485 E.11476
G1 X104.134 Y141.633 E.00073
G1 X104.134 Y108.452 E.11546
G1 X103.984 Y108.301 E.00074
G1 X103.984 Y141.78 E.1165
G1 X103.834 Y141.928 E.00073
G1 X103.834 Y108.151 E.11754
G1 X103.684 Y108.001 E.00074
G1 X103.684 Y142.076 E.11857
G1 X103.534 Y142.224 E.00073
G1 X103.534 Y107.851 E.11961
G1 X103.384 Y107.701 E.00074
G1 X103.384 Y142.371 E.12065
G1 X103.234 Y142.519 E.00073
G1 X103.234 Y107.551 E.12168
G1 X103.084 Y107.4 E.00074
G1 X103.084 Y142.667 E.12272
G1 X102.934 Y142.814 E.00073
G1 X102.934 Y107.25 E.12376
G1 X102.784 Y107.1 E.00074
G1 X102.784 Y142.962 E.12479
G1 X102.634 Y143.11 E.00073
G1 X102.634 Y106.95 E.12583
G1 X102.484 Y106.8 E.00074
G1 X102.484 Y143.257 E.12687
G1 X102.334 Y143.405 E.00073
G1 X102.334 Y106.649 E.1279
G1 X102.184 Y106.499 E.00074
G1 X102.184 Y143.553 E.12894
G1 X102.034 Y143.701 E.00073
G1 X102.034 Y106.349 E.12998
G1 X101.884 Y106.199 E.00074
G1 X101.884 Y143.848 E.13101
G1 X101.734 Y143.996 E.00073
G1 X101.734 Y106.049 E.13205
G1 X101.584 Y105.899 E.00074
G1 X101.584 Y144.144 E.13309
G1 X101.434 Y144.291 E.00073
G1 X101.434 Y105.748 E.13412
G1 X101.284 Y105.598 E.00074
G1 X101.284 Y144.439 E.13516
G1 X101.134 Y144.587 E.00073
G1 X101.134 Y105.448 E.1362
G1 X100.984 Y105.298 E.00074
G1 X100.984 Y144.734 E.13723
G1 X100.834 Y144.882 E.00073
G1 X100.834 Y105.148 E.13827
G1 X100.684 Y104.997 E.00074
G1 X100.684 Y145.03 E.13931
G1 X100.534 Y145.178 E.00073
G1 X100.534 Y104.847 E.14034
G1 X100.384 Y104.697 E.00074
G1 X100.384 Y112.707 E.02787
G1 X100.234 Y111.837 F30000
G1 F3600
G1 X100.234 Y104.547 E.02537
G1 X100.084 Y104.397 E.00074
G1 X100.084 Y111.405 E.02439
G2 X99.934 Y111.233 I-.345 J.15 E.00081
M73 P84 R4
G1 X99.934 Y104.247 E.02431
G1 X99.784 Y104.096 E.00074
G1 X99.784 Y111.11 E.02441
G1 X99.634 Y111.048 E.00056
G1 X99.634 Y103.851 E.02505
G1 X99.484 Y103.645 F30000
G1 F3600
G1 X99.484 Y111.015 E.02564
G2 X99.334 Y111.014 I-.077 J.315 E.00053
G1 X99.334 Y103.845 E.02494
G3 X99.184 Y103.93 I-.232 J-.239 E.00061
G1 X99.184 Y111.03 E.02471
G1 X99.034 Y111.093 E.00057
G1 X99.034 Y103.992 E.02471
G1 X98.884 Y104.054 E.00057
G1 X98.884 Y111.205 E.02488
G2 X98.734 Y111.392 I.242 J.347 E.00085
G1 X98.734 Y104.116 E.02532
G1 X98.584 Y104.179 E.00057
G1 X98.584 Y111.963 E.02709
; WIPE_START
G1 F24000
G1 X98.584 Y109.963 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.133 J.445 P1  F30000
G1 X100.384 Y114.546 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X100.384 Y145.325 E.10711
G1 X100.234 Y145.473 E.00073
G1 X100.234 Y115.392 E.10468
G1 X100.084 Y115.601 E.0009
G1 X100.084 Y145.621 E.10446
G1 X99.934 Y145.768 E.00073
G1 X99.934 Y115.759 E.10443
G3 X99.784 Y115.861 I-.268 J-.231 E.00064
G1 X99.784 Y145.916 E.10459
G1 X99.634 Y146.064 E.00073
G1 X99.634 Y115.929 E.10487
G1 X99.484 Y115.948 E.00053
G1 X99.484 Y124.786 E.03076
G1 X99.334 Y123.987 F30000
G1 F3600
G1 X99.334 Y115.941 E.028
G3 X99.184 Y115.91 I-.025 J-.258 E.00054
G1 X99.184 Y123.56 E.02662
G1 X99.034 Y123.41 E.00074
G1 X99.034 Y115.837 E.02635
G1 X98.884 Y115.704 E.0007
G1 X98.884 Y123.304 E.02645
G2 X98.734 Y123.226 I-.204 J.21 E.0006
G1 X98.734 Y115.514 E.02684
G1 X98.584 Y115.237 E.0011
G1 X98.584 Y123.196 E.02769
G2 X98.434 Y123.186 I-.091 J.242 E.00053
G1 X98.434 Y104.241 E.06593
G1 X98.284 Y104.303 E.00057
G1 X98.284 Y123.2 E.06576
G2 X98.134 Y123.252 I.011 J.278 E.00056
G1 X98.134 Y104.365 E.06572
G1 X97.984 Y104.427 E.00057
G1 X97.984 Y123.328 E.06577
G1 X97.834 Y123.451 E.00068
G1 X97.834 Y104.49 E.06598
G1 X97.684 Y104.552 E.00056
G1 X97.684 Y111.084 E.02273
G1 X97.534 Y111.084 E.00052
G1 X97.534 Y104.614 E.02252
G1 X97.384 Y104.676 E.00056
G1 X97.384 Y111.084 E.0223
G1 X97.234 Y111.084 E.00052
G1 X97.234 Y104.738 E.02208
G1 X97.084 Y104.8 E.00056
G1 X97.084 Y114.578 E.03403
G1 X96.934 Y114.423 E.00075
G1 X96.934 Y104.834 E.03337
M73 P84 R3
G1 X96.784 Y104.854 E.00053
G1 X96.784 Y114.29 E.03284
G2 X96.634 Y114.171 I-.677 J.702 E.00067
M73 P85 R3
G1 X96.634 Y112.122 E.00713
G1 X96.538 Y112.483 E.0013
G1 X96.484 Y112.468 E.0002
G1 X96.484 Y114.068 E.00557
G1 X96.437 Y114.035 E.0002
G1 X96.334 Y114.212 E.00071
G1 X96.334 Y112.359 E.00645
G1 X96.634 Y111.802 F30000
G1 F3600
G1 X96.634 Y104.873 E.02411
G1 X96.484 Y104.893 E.00053
G1 X96.484 Y111.693 E.02366
G1 X96.334 Y111.653 E.00054
G1 X96.334 Y104.913 E.02346
G1 X96.184 Y104.933 E.00053
G1 X96.184 Y111.614 E.02325
G1 X96.034 Y111.575 E.00054
G1 X96.034 Y104.952 E.02304
G1 X95.884 Y104.972 E.00053
G1 X95.884 Y111.535 E.02284
G1 X95.734 Y111.496 E.00054
G1 X95.734 Y104.992 E.02263
G1 X95.584 Y105.011 E.00053
G1 X95.584 Y111.456 E.02243
G1 X95.434 Y111.417 E.00054
G1 X95.434 Y105.031 E.02222
G1 X95.284 Y105.051 E.00053
G1 X95.284 Y111.378 E.02202
G1 X95.134 Y111.338 E.00054
G1 X95.134 Y105.071 E.02181
G1 X94.984 Y105.09 E.00053
G1 X94.984 Y111.299 E.02161
G1 X94.834 Y111.26 E.00054
G1 X94.834 Y105.11 E.0214
G1 X94.684 Y105.13 E.00053
G1 X94.684 Y111.22 E.02119
G1 X94.534 Y111.181 E.00054
G1 X94.534 Y105.123 E.02108
G1 X94.384 Y105.104 E.00053
G1 X94.384 Y111.141 E.02101
G1 X94.234 Y111.102 E.00054
G1 X94.234 Y105.084 E.02094
G1 X94.084 Y105.064 E.00053
G1 X94.084 Y111.063 E.02087
G1 X93.934 Y111.023 E.00054
G1 X93.934 Y105.045 E.0208
G1 X93.784 Y105.025 E.00053
G1 X93.784 Y110.984 E.02074
G1 X93.634 Y110.944 E.00054
G1 X93.634 Y105.005 E.02067
G1 X93.484 Y104.986 E.00053
G1 X93.484 Y110.905 E.0206
G1 X93.334 Y110.866 E.00054
G1 X93.334 Y104.966 E.02053
G1 X93.184 Y104.946 E.00053
G1 X93.184 Y110.826 E.02046
G1 X93.034 Y110.787 E.00054
G1 X93.034 Y104.926 E.02039
G1 X92.884 Y104.907 E.00053
G1 X92.884 Y110.748 E.02033
G1 X92.734 Y110.708 E.00054
G1 X92.734 Y104.887 E.02026
G1 X92.584 Y104.867 E.00053
G1 X92.584 Y110.669 E.02019
G1 X92.434 Y110.629 E.00054
G1 X92.434 Y104.848 E.02012
G1 X92.284 Y104.828 E.00053
G1 X92.284 Y110.59 E.02005
G1 X92.134 Y110.55 E.00054
G1 X92.134 Y104.781 E.02008
G1 X91.984 Y104.719 E.00056
G1 X91.984 Y110.511 E.02016
G1 X91.834 Y110.472 E.00054
G1 X91.834 Y104.657 E.02024
G1 X91.684 Y104.595 E.00056
G1 X91.684 Y110.432 E.02031
G1 X91.534 Y110.393 E.00054
G1 X91.534 Y104.533 E.02039
G1 X91.384 Y104.47 E.00056
G1 X91.384 Y110.353 E.02047
G1 X91.234 Y110.314 E.00054
G1 X91.234 Y104.408 E.02055
G1 X91.084 Y104.346 E.00057
G1 X91.084 Y110.274 E.02063
G1 X91.011 Y110.255 E.00026
G1 X90.934 Y110.551 E.00106
G1 X90.934 Y104.284 E.02181
G1 X90.784 Y104.221 E.00057
G1 X90.784 Y110.561 E.02206
G1 X90.634 Y109.952 F30000
G1 F3600
G1 X90.634 Y104.159 E.02016
G1 X90.484 Y104.097 E.00057
G1 X90.484 Y109.1 E.01741
G1 X90.334 Y108.815 E.00112
G1 X90.334 Y104.034 E.01663
G1 X90.184 Y103.972 E.00057
G1 X90.184 Y108.529 E.01586
G1 X90.034 Y108.243 E.00112
G1 X90.034 Y103.91 E.01508
G3 X89.884 Y103.809 I.115 J-.332 E.00064
G1 X89.884 Y107.957 E.01444
G1 X89.734 Y107.671 E.00112
G1 X89.734 Y103.694 E.01384
G1 X89.584 Y103.578 E.00066
G1 X89.584 Y107.385 E.01325
G1 X89.434 Y107.099 E.00112
G1 X89.434 Y103.463 E.01265
G1 X89.284 Y103.348 E.00066
G1 X89.284 Y106.909 E.01239
G1 X89.134 Y106.74 E.00079
G1 X89.134 Y103.233 E.0122
G1 X88.984 Y103.118 E.00066
G1 X88.984 Y106.571 E.01201
G1 X88.834 Y106.402 E.00079
G1 X88.834 Y103.003 E.01183
G1 X88.684 Y102.888 E.00066
G1 X88.684 Y106.232 E.01164
G1 X88.534 Y106.063 E.00079
G1 X88.534 Y102.773 E.01145
G1 X88.384 Y102.658 E.00066
G1 X88.384 Y105.894 E.01126
G1 X88.234 Y105.725 E.00079
G1 X88.234 Y102.543 E.01107
G1 X88.084 Y102.428 E.00066
G1 X88.084 Y105.556 E.01089
G1 X87.934 Y105.387 E.00079
G1 X87.934 Y102.238 E.01096
G1 X87.784 Y102.043 E.00086
G1 X87.784 Y105.243 E.01114
G1 X87.634 Y105.139 E.00063
G1 X87.634 Y101.848 E.01146
G1 X87.484 Y101.652 E.00086
G1 X87.484 Y105.036 E.01177
G1 X87.334 Y104.932 E.00063
G1 X87.334 Y101.457 E.01209
G1 X87.184 Y101.262 E.00086
G1 X87.184 Y104.828 E.01241
G1 X87.034 Y104.725 E.00063
G1 X87.034 Y101.066 E.01273
G1 X86.884 Y100.871 E.00086
G1 X86.884 Y104.621 E.01305
G1 X86.734 Y104.518 E.00063
G1 X86.734 Y100.676 E.01337
G1 X86.584 Y100.464 E.0009
G1 X86.584 Y104.414 E.01375
G1 X86.434 Y104.31 E.00063
G1 X86.434 Y100.102 E.01464
G1 X86.284 Y99.74 E.00136
G1 X86.284 Y104.207 E.01554
G1 X86.134 Y104.103 E.00063
G1 X86.134 Y99.378 E.01644
G1 X85.984 Y99.016 E.00136
G1 X85.984 Y103.999 E.01734
G2 X85.834 Y103.917 I-.241 J.262 E.0006
G1 X85.834 Y98.654 E.01832
G1 X85.684 Y98.292 E.00136
G1 X85.684 Y103.86 E.01938
G1 X85.534 Y103.804 E.00056
G1 X85.534 Y96.7 E.02472
G1 X85.384 Y96.069 F30000
G1 F3600
G1 X85.384 Y103.747 E.02672
G1 X85.234 Y103.69 E.00056
G1 X85.234 Y96.136 E.02629
G1 X85.084 Y96.136 E.00052
G1 X85.084 Y103.633 E.02609
G1 X84.934 Y103.576 E.00056
G1 X84.934 Y96.136 E.02589
G1 X84.784 Y96.136 E.00052
G1 X84.784 Y103.519 E.02569
G1 X84.634 Y103.462 E.00056
G1 X84.634 Y96.136 E.02549
G1 X84.484 Y96.136 E.00052
G1 X84.484 Y103.406 E.0253
G1 X84.334 Y103.349 E.00056
G1 X84.334 Y96.136 E.0251
G1 X84.184 Y96.136 E.00052
G1 X84.184 Y103.292 E.0249
G1 X84.034 Y103.235 E.00056
G1 X84.034 Y96.136 E.0247
G1 X83.884 Y96.136 E.00052
G1 X83.884 Y103.178 E.02451
G1 X83.734 Y103.121 E.00056
G1 X83.734 Y96.136 E.02431
G1 X83.584 Y96.136 E.00052
G1 X83.584 Y103.094 E.02421
G1 X83.434 Y103.076 E.00053
G1 X83.434 Y96.136 E.02415
G1 X83.284 Y96.136 E.00052
G1 X83.284 Y103.058 E.02409
G1 X83.134 Y103.039 E.00053
G1 X83.134 Y96.136 E.02402
G1 X82.984 Y96.136 E.00052
G1 X82.984 Y103.021 E.02396
G1 X82.834 Y103.003 E.00053
G1 X82.834 Y96.136 E.0239
G1 X82.684 Y96.136 E.00052
G1 X82.684 Y102.985 E.02383
G1 X82.534 Y102.967 E.00053
G1 X82.534 Y96.136 E.02377
G1 X82.384 Y96.136 E.00052
G1 X82.384 Y102.948 E.02371
G1 X82.234 Y102.93 E.00053
G1 X82.234 Y96.136 E.02364
G1 X82.084 Y96.136 E.00052
G1 X82.084 Y102.912 E.02358
G1 X81.934 Y102.894 E.00053
G1 X81.934 Y96.136 E.02352
G1 X81.784 Y96.136 E.00052
G1 X81.784 Y102.943 E.02369
; WIPE_START
G1 F24000
G1 X81.784 Y100.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.825 J.895 P1  F30000
G1 X97.684 Y115.594 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.684 Y123.65 E.02803
G2 X97.534 Y123.916 I.68 J.559 E.00107
G1 X97.534 Y115.639 E.0288
; WIPE_START
G1 F24000
G1 X97.534 Y117.639 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.188 J.264 P1  F30000
G1 X99.484 Y126.412 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.484 Y146.211 E.0689
G1 X99.334 Y146.359 E.00073
G1 X99.334 Y127.545 E.06547
G3 X99.184 Y127.775 I-.78 J-.344 E.00096
G1 X99.184 Y136.678 E.03098
G1 X99.034 Y136.416 E.00105
G1 X99.034 Y127.943 E.02948
G3 X98.884 Y128.061 I-.277 J-.199 E.00067
G1 X98.884 Y136.22 E.02839
G1 X98.734 Y136.074 E.00073
G1 X98.734 Y128.126 E.02766
M73 P86 R3
G3 X98.584 Y128.159 I-.131 J-.237 E.00054
G1 X98.584 Y135.949 E.02711
G1 X98.434 Y135.872 E.00059
G1 X98.434 Y128.177 E.02678
G1 X98.284 Y128.151 E.00053
G1 X98.284 Y135.795 E.0266
G2 X98.134 Y135.754 I-.164 J.309 E.00055
G1 X98.134 Y128.113 E.02659
G1 X97.984 Y128.033 E.00059
G1 X97.984 Y135.726 E.02677
G1 X97.834 Y135.721 E.00052
G1 X97.834 Y127.908 E.02719
G3 X97.684 Y127.723 I.25 J-.356 E.00084
G1 X97.684 Y135.715 E.02781
G2 X97.534 Y135.715 I-.074 J.277 E.00053
G1 X97.534 Y127.191 E.02966
; WIPE_START
G1 F24000
G1 X97.534 Y129.191 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.028 P1  F30000
G1 X97.384 Y135.819 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.384 Y115.755 E.06982
G1 X97.234 Y115.801 E.00055
G1 X97.234 Y135.784 E.06954
G1 X97.084 Y135.818 E.00054
G1 X97.084 Y127.601 E.0286
G3 X96.934 Y127.858 I-.648 J-.205 E.00105
G1 X96.934 Y135.902 E.02799
G1 X96.784 Y135.989 E.0006
G1 X96.784 Y127.998 E.02781
G3 X96.634 Y128.087 I-.224 J-.204 E.00062
G1 X96.634 Y136.127 E.02798
G1 X96.484 Y136.288 E.00077
G1 X96.484 Y128.138 E.02836
G1 X96.334 Y128.145 E.00052
G1 X96.334 Y136.72 E.02984
; WIPE_START
G1 F24000
G1 X96.334 Y134.72 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.917 J.801 P1  F30000
G1 X99.184 Y137.983 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.184 Y146.507 E.02966
G1 X99.034 Y146.655 E.00073
G1 X99.034 Y140.518 E.02135
G1 X98.884 Y140.518 E.00052
G1 X98.884 Y146.719 E.02158
G1 X98.734 Y146.695 E.00053
G1 X98.734 Y140.518 E.02149
G1 X98.584 Y140.518 E.00052
G1 X98.584 Y146.671 E.02141
G1 X98.434 Y146.647 E.00053
G1 X98.434 Y140.518 E.02133
G1 X98.284 Y140.518 E.00052
G1 X98.284 Y146.623 E.02124
G1 X98.134 Y146.599 E.00053
G1 X98.134 Y140.518 E.02116
G1 X97.984 Y140.518 E.00052
G1 X97.984 Y146.586 E.02111
G1 X97.834 Y146.61 E.00053
G1 X97.834 Y140.518 E.0212
G1 X97.684 Y140.518 E.00052
G1 X97.684 Y146.634 E.02128
G1 X97.534 Y146.658 E.00053
G1 X97.534 Y140.518 E.02137
G1 X97.384 Y140.518 E.00052
G1 X97.384 Y146.682 E.02145
G1 X97.234 Y146.706 E.00053
G1 X97.234 Y140.518 E.02153
G1 X97.084 Y140.518 E.00052
G1 X97.084 Y146.73 E.02162
G2 X96.934 Y146.778 I0 J.256 E.00056
G1 X96.934 Y140.518 E.02179
G1 X96.784 Y140.518 E.00052
G1 X96.784 Y146.855 E.02205
G1 X96.634 Y146.931 E.00059
G1 X96.634 Y139.435 E.02608
G1 X96.484 Y138.654 F30000
G1 F3600
G1 X96.484 Y147.008 E.02907
G1 X96.334 Y147.084 E.00059
G1 X96.334 Y141.041 E.02103
G1 X96.184 Y141.226 E.00083
G1 X96.184 Y147.161 E.02065
G2 X96.034 Y147.266 I.087 J.283 E.00065
G1 X96.034 Y141.412 E.02037
G1 X95.884 Y141.597 E.00083
G1 X95.884 Y147.415 E.02025
G1 X95.734 Y147.565 E.00074
G1 X95.734 Y141.782 E.02012
G1 X95.584 Y141.967 E.00083
G1 X95.584 Y147.715 E.02
G1 X95.434 Y147.865 E.00074
G1 X95.434 Y142.153 E.01988
G1 X95.284 Y142.338 E.00083
G1 X95.284 Y148.094 E.02003
G1 X95.134 Y148.388 E.00115
G1 X95.134 Y142.523 E.02041
G1 X94.984 Y142.708 E.00083
G1 X94.984 Y148.831 E.02131
G1 X94.834 Y149.654 F30000
G1 F3600
G1 X94.834 Y142.894 E.02352
G1 X94.684 Y143.079 E.00083
G1 X94.684 Y149.586 E.02264
G1 X94.534 Y149.586 E.00052
G1 X94.534 Y143.264 E.022
G1 X94.384 Y143.449 E.00083
G1 X94.384 Y149.586 E.02135
G1 X94.234 Y149.586 E.00052
G1 X94.234 Y143.635 E.02071
G1 X94.084 Y143.82 E.00083
G1 X94.084 Y149.586 E.02007
G1 X93.934 Y149.586 E.00052
G1 X93.934 Y144.005 E.01942
G1 X93.784 Y144.19 E.00083
G1 X93.784 Y149.586 E.01878
G1 X93.634 Y149.586 E.00052
G1 X93.634 Y144.376 E.01813
G1 X93.484 Y144.561 E.00083
G1 X93.484 Y149.586 E.01749
G1 X93.334 Y149.586 E.00052
G1 X93.334 Y144.746 E.01684
G1 X93.184 Y144.931 E.00083
G1 X93.184 Y149.586 E.0162
G1 X93.034 Y149.586 E.00052
G1 X93.034 Y145.117 E.01555
G1 X92.884 Y145.302 E.00083
G1 X92.884 Y149.654 E.01514
G1 X92.734 Y148.973 F30000
G1 F3600
G1 X92.734 Y145.487 E.01213
G1 X92.584 Y145.672 E.00083
G1 X92.584 Y148.532 E.00995
G1 X92.434 Y148.239 E.00115
G1 X92.434 Y145.857 E.00829
G1 X92.284 Y146.043 E.00083
G1 X92.284 Y148.083 E.0071
G1 X92.134 Y147.933 E.00074
G1 X92.134 Y146.228 E.00593
G1 X91.984 Y146.413 E.00083
G1 X91.984 Y147.783 E.00477
G1 X91.834 Y147.633 E.00074
G1 X91.834 Y146.598 E.0036
G1 X91.684 Y146.784 E.00083
G1 X91.684 Y147.546 E.00265
G1 X91.534 Y147.47 E.00059
G1 X91.534 Y146.969 E.00174
G1 X91.384 Y147.154 E.00083
G1 X91.384 Y147.469 E.0011
; WIPE_START
G1 F24000
G1 X91.384 Y147.154 E-.11981
G1 X91.534 Y146.969 E-.09058
G1 X91.534 Y147.47 E-.19042
G1 X91.684 Y147.546 E-.06395
G1 X91.684 Y146.784 E-.2898
G1 X91.693 Y146.773 E-.00545
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.961 J.746 P1  F30000
G1 X96.334 Y140.792 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X96.334 Y137.105 E.01283
; WIPE_START
G1 F24000
G1 X96.334 Y139.105 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.211 J-.116 P1  F30000
G1 X96.184 Y140.671 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X96.184 Y128.139 E.04361
G1 X96.034 Y128.103 E.00054
G1 X96.034 Y140.462 E.04301
G1 X95.916 Y140.365 E.00053
G1 X95.884 Y140.405 E.00018
G1 X95.884 Y128.02 E.0431
G3 X95.734 Y127.884 I.156 J-.323 E.00071
G1 X95.734 Y140.59 E.04421
G1 X95.584 Y140.775 E.00083
G1 X95.584 Y127.685 E.04555
G1 X95.434 Y127.283 E.00149
G1 X95.434 Y140.961 E.0476
G1 X95.284 Y141.146 E.00083
G1 X95.284 Y124.052 E.05948
G3 X95.134 Y123.666 I3.785 J-1.694 E.00144
G1 X95.134 Y126.874 E.01116
G1 X95.134 Y127.03 F30000
G1 F3600
G1 X95.134 Y141.331 E.04976
G1 X94.984 Y141.516 E.00083
G1 X94.984 Y127.238 E.04968
G1 X94.834 Y127.36 E.00067
G1 X94.834 Y141.701 E.04991
G1 X94.684 Y141.886 E.00083
G1 X94.684 Y127.482 E.05013
G1 X94.534 Y127.603 E.00067
G1 X94.534 Y142.072 E.05035
G1 X94.384 Y142.257 E.00083
G1 X94.384 Y127.725 E.05057
G1 X94.234 Y127.846 E.00067
G1 X94.234 Y142.442 E.05079
G1 X94.084 Y142.627 E.00083
G1 X94.084 Y127.968 E.05101
G1 X93.934 Y128.089 E.00067
G1 X93.934 Y142.812 E.05123
G1 X93.784 Y142.997 E.00083
G1 X93.784 Y128.211 E.05145
G1 X93.634 Y128.333 E.00067
G1 X93.634 Y143.183 E.05168
G1 X93.484 Y143.368 E.00083
G1 X93.484 Y128.454 E.0519
G1 X93.334 Y128.576 E.00067
G1 X93.334 Y143.553 E.05212
G1 X93.184 Y143.738 E.00083
G1 X93.184 Y128.697 E.05234
G1 X93.034 Y128.819 E.00067
G1 X93.034 Y143.923 E.05256
G1 X92.884 Y144.108 E.00083
G1 X92.884 Y128.94 E.05278
G1 X92.734 Y129.062 E.00067
G1 X92.734 Y144.294 E.053
G1 X92.584 Y144.479 E.00083
G1 X92.584 Y129.184 E.05323
G1 X92.434 Y129.305 E.00067
G1 X92.434 Y144.664 E.05345
G1 X92.284 Y144.849 E.00083
G1 X92.284 Y129.427 E.05367
G1 X92.134 Y129.548 E.00067
G1 X92.134 Y145.034 E.05389
G1 X91.984 Y145.22 E.00083
G1 X91.984 Y129.67 E.05411
G1 X91.834 Y129.791 E.00067
G1 X91.834 Y145.405 E.05433
G1 X91.684 Y145.59 E.00083
G1 X91.684 Y129.913 E.05455
G1 X91.534 Y130.035 E.00067
G1 X91.534 Y145.775 E.05477
G1 X91.384 Y145.96 E.00083
G1 X91.384 Y136.717 E.03216
G1 X91.234 Y137.327 F30000
G1 F3600
G1 X91.234 Y146.145 E.03069
G1 X91.084 Y146.331 E.00083
G1 X91.084 Y137.936 E.02921
G1 X90.934 Y138.545 F30000
G1 F3600
G1 X90.934 Y146.516 E.02774
G1 X90.784 Y146.701 E.00083
G1 X90.784 Y139.036 E.02667
G1 X90.634 Y139.322 E.00112
G1 X90.634 Y146.886 E.02632
G1 X90.484 Y147.071 E.00083
G1 X90.484 Y139.607 E.02597
G1 X90.334 Y139.893 E.00112
G1 X90.334 Y147.107 E.0251
M73 P87 R3
G1 X90.184 Y147.083 E.00053
G1 X90.184 Y140.179 E.02403
G1 X90.034 Y140.465 E.00112
G1 X90.034 Y147.106 E.02311
G1 X89.884 Y147.129 E.00053
G1 X89.884 Y140.751 E.0222
G3 X89.734 Y140.97 I-.52 J-.194 E.00093
G1 X89.734 Y147.153 E.02152
G1 X89.584 Y147.177 E.00053
G1 X89.584 Y141.139 E.02101
G1 X89.434 Y141.309 E.00079
G1 X89.434 Y147.2 E.0205
G2 X89.284 Y147.237 I-.019 J.249 E.00055
G1 X89.284 Y141.478 E.02004
G1 X89.134 Y141.647 E.00079
G1 X89.134 Y147.313 E.01972
G1 X88.984 Y147.39 E.00059
G1 X88.984 Y141.816 E.0194
G1 X88.834 Y141.985 E.00079
G1 X88.834 Y147.466 E.01907
G1 X88.684 Y147.542 E.00059
G1 X88.684 Y142.154 E.01875
G1 X88.534 Y142.323 E.00079
G1 X88.534 Y147.625 E.01845
G1 X88.384 Y147.775 E.00074
G1 X88.384 Y142.492 E.01838
G1 X88.234 Y142.662 E.00079
G1 X88.234 Y147.925 E.01832
G1 X88.084 Y148.075 E.00074
G1 X88.084 Y142.791 E.01839
G1 X87.934 Y142.895 E.00063
G1 X87.934 Y148.225 E.01855
G1 X87.784 Y148.518 E.00114
G1 X87.784 Y142.998 E.01921
G1 X87.634 Y143.102 E.00063
G1 X87.634 Y148.962 E.02039
G1 X87.484 Y149.654 F30000
G1 F3600
G1 X87.484 Y143.205 E.02244
G1 X87.334 Y143.309 E.00063
G1 X87.334 Y149.586 E.02184
G1 X87.184 Y149.586 E.00052
G1 X87.184 Y143.413 E.02148
G1 X87.034 Y143.516 E.00063
G1 X87.034 Y149.586 E.02112
G1 X86.884 Y149.586 E.00052
G1 X86.884 Y143.62 E.02076
G1 X86.734 Y143.723 E.00063
G1 X86.734 Y149.586 E.0204
G1 X86.584 Y149.586 E.00052
G1 X86.584 Y143.827 E.02004
G1 X86.434 Y143.93 E.00063
G1 X86.434 Y149.586 E.01968
G1 X86.284 Y149.586 E.00052
G1 X86.284 Y144.034 E.01932
G1 X86.134 Y144.137 E.00063
G1 X86.134 Y149.586 E.01896
G1 X85.984 Y149.586 E.00052
G1 X85.984 Y144.194 E.01876
G1 X85.834 Y144.251 E.00056
G1 X85.834 Y149.586 E.01857
G1 X85.684 Y149.586 E.00052
G1 X85.684 Y144.308 E.01837
G1 X85.534 Y144.365 E.00056
G1 X85.534 Y149.586 E.01817
G1 X85.384 Y149.586 E.00052
G1 X85.384 Y144.422 E.01797
G1 X85.234 Y144.479 E.00056
G1 X85.234 Y149.586 E.01777
G1 X85.084 Y149.586 E.00052
G1 X85.084 Y144.536 E.01757
G1 X84.934 Y144.593 E.00056
G1 X84.934 Y149.586 E.01738
G1 X84.784 Y149.586 E.00052
G1 X84.784 Y144.65 E.01718
G1 X84.634 Y144.707 E.00056
G1 X84.634 Y149.586 E.01698
G1 X84.484 Y149.586 E.00052
G1 X84.484 Y144.764 E.01678
G1 X84.334 Y144.821 E.00056
G1 X84.334 Y149.586 E.01658
G1 X84.184 Y149.586 E.00052
G1 X84.184 Y144.878 E.01638
G1 X84.034 Y144.935 E.00056
G1 X84.034 Y149.586 E.01619
G1 X83.884 Y149.586 E.00052
G1 X83.884 Y144.991 E.01599
G3 X83.734 Y145.026 I-.146 J-.286 E.00054
G1 X83.734 Y149.586 E.01587
G1 X83.584 Y149.586 E.00052
G1 X83.584 Y145.045 E.0158
G1 X83.434 Y145.063 E.00053
G1 X83.434 Y149.586 E.01574
G1 X83.284 Y149.586 E.00052
G1 X83.284 Y145.081 E.01568
G1 X83.134 Y145.099 E.00053
G1 X83.134 Y149.586 E.01561
G1 X82.984 Y149.586 E.00052
G1 X82.984 Y145.117 E.01555
G1 X82.834 Y145.135 E.00053
G1 X82.834 Y149.586 E.01549
G1 X82.684 Y149.586 E.00052
G1 X82.684 Y145.154 E.01542
G1 X82.534 Y145.172 E.00053
G1 X82.534 Y149.586 E.01536
G1 X82.384 Y149.586 E.00052
G1 X82.384 Y145.19 E.0153
G1 X82.234 Y145.208 E.00053
G1 X82.234 Y149.586 E.01523
G1 X82.084 Y149.586 E.00052
G1 X82.084 Y145.226 E.01517
G1 X81.934 Y145.245 E.00053
G1 X81.934 Y149.586 E.01511
G1 X81.784 Y149.586 E.00052
G1 X81.784 Y145.195 E.01528
; WIPE_START
G1 F24000
G1 X81.784 Y147.195 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1 J.694 P1  F30000
G1 X91.384 Y133.357 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X91.384 Y130.156 E.01114
G1 X91.234 Y130.278 E.00067
G1 X91.234 Y132.747 E.00859
G1 X91.084 Y132.138 F30000
G1 F3600
G1 X91.084 Y130.399 E.00605
G1 X90.934 Y130.521 E.00067
G1 X90.934 Y131.324 E.0028
G1 X90.784 Y131.038 E.00112
G1 X90.784 Y130.532 E.00176
G1 X90.634 Y130.347 E.00083
G1 X90.634 Y130.898 E.00192
; WIPE_START
G1 F24000
G1 X90.634 Y130.347 E-.20928
G1 X90.784 Y130.532 E-.09048
G1 X90.784 Y131.038 E-.19242
G1 X90.934 Y131.324 E-.12265
G1 X90.934 Y130.942 E-.14516
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.749 J.959 P1  F30000
G1 X97.084 Y126.143 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.084 Y123.99 E.00749
G1 X96.934 Y123.99 E.00052
G1 X96.934 Y125.567 E.00549
G1 X96.784 Y125.313 E.00103
G1 X96.784 Y123.99 E.0046
G1 X96.634 Y123.99 E.00052
G1 X96.634 Y125.081 E.00379
G1 X96.484 Y124.856 E.00094
G1 X96.484 Y123.99 E.00301
G1 X96.334 Y123.99 E.00052
G1 X96.334 Y124.635 E.00224
G1 X96.184 Y124.415 E.00093
G1 X96.184 Y123.99 E.00148
G1 X96.034 Y123.99 E.00052
G1 X96.034 Y124.304 E.00109
; WIPE_START
G1 F24000
G1 X96.034 Y123.99 E-.11913
G1 X96.184 Y123.99 E-.057
G1 X96.184 Y124.415 E-.16152
G1 X96.334 Y124.635 E-.10106
G1 X96.334 Y123.99 E-.24497
G1 X96.484 Y123.99 E-.057
G1 X96.484 Y124.041 E-.01932
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.883 J.837 P1  F30000
G1 X97.084 Y123.408 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.084 Y115.707 E.0268
G1 X96.934 Y115.482 E.00094
G1 X96.934 Y123.34 E.02734
G1 X96.784 Y123.34 E.00052
G1 X96.784 Y115.275 E.02806
G1 X96.634 Y115.088 E.00084
G1 X96.634 Y123.34 E.02872
G1 X96.484 Y123.34 E.00052
G1 X96.484 Y114.901 E.02937
G2 X96.334 Y114.768 I-.357 J.253 E.0007
G1 X96.334 Y123.34 E.02983
G1 X96.184 Y123.34 E.00052
G1 X96.184 Y112.39 E.03811
G1 X96.034 Y112.35 E.00054
G1 X96.034 Y123.34 E.03824
G1 X95.884 Y123.34 E.00052
G1 X95.884 Y112.311 E.03838
G1 X95.734 Y112.271 E.00054
G1 X95.734 Y123.34 E.03852
G1 X95.584 Y123.34 E.00052
G1 X95.584 Y112.232 E.03865
G1 X95.434 Y112.192 E.00054
G1 X95.434 Y123.34 E.03879
G1 X95.284 Y123.34 E.00052
G1 X95.284 Y112.153 E.03893
G1 X95.134 Y112.114 E.00054
G1 X95.134 Y123.408 E.0393
; WIPE_START
G1 F24000
G1 X95.134 Y121.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J-.035 P1  F30000
G1 X94.984 Y126.69 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X94.984 Y112.074 E.05086
G1 X94.834 Y112.035 E.00054
G1 X94.834 Y126.398 E.04998
G1 X94.684 Y126.519 E.00067
G1 X94.684 Y111.995 E.05054
G1 X94.534 Y111.956 E.00054
G1 X94.534 Y126.641 E.0511
G1 X94.384 Y126.762 E.00067
G1 X94.384 Y111.917 E.05166
G1 X94.234 Y111.877 E.00054
G1 X94.234 Y126.884 E.05222
G1 X94.084 Y127.005 E.00067
G1 X94.084 Y111.838 E.05278
G1 X93.934 Y111.798 E.00054
G1 X93.934 Y127.126 E.05334
G1 X93.784 Y127.248 E.00067
G1 X93.784 Y111.759 E.0539
G1 X93.634 Y111.72 E.00054
G1 X93.634 Y127.369 E.05446
G1 X93.484 Y127.491 E.00067
G1 X93.484 Y111.68 E.05502
G1 X93.334 Y111.641 E.00054
G1 X93.334 Y127.612 E.05558
G1 X93.184 Y127.734 E.00067
G1 X93.184 Y111.601 E.05614
G1 X93.034 Y111.562 E.00054
G1 X93.034 Y127.855 E.0567
G1 X92.884 Y127.977 E.00067
G1 X92.884 Y111.522 E.05726
G1 X92.734 Y111.483 E.00054
G1 X92.734 Y128.098 E.05782
G1 X92.584 Y128.22 E.00067
G1 X92.584 Y111.444 E.05838
G1 X92.434 Y111.404 E.00054
G1 X92.434 Y128.341 E.05894
G1 X92.284 Y128.463 E.00067
G1 X92.284 Y111.365 E.0595
G1 X92.134 Y111.325 E.00054
G1 X92.134 Y128.584 E.06006
G1 X91.984 Y128.705 E.00067
G1 X91.984 Y111.286 E.06062
G1 X91.834 Y111.247 E.00054
G1 X91.834 Y128.827 E.06118
G1 X91.684 Y128.948 E.00067
G1 X91.684 Y111.207 E.06174
G1 X91.534 Y111.168 E.00054
G1 X91.534 Y129.07 E.0623
G1 X91.384 Y129.191 E.00067
G1 X91.384 Y111.128 E.06286
G1 X91.234 Y111.089 E.00054
G1 X91.234 Y129.313 E.06342
G1 X91.084 Y129.434 E.00067
G1 X91.084 Y110.98 E.06422
; WIPE_START
G1 F24000
G1 X91.084 Y112.98 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.205 J-.171 P1  F30000
G1 X90.934 Y114.034 Z1.8
G1 Z1.4
M73 P88 R3
G1 E.8 F1800
G1 F3600
G1 X90.934 Y129.556 E.05401
G1 X90.784 Y129.677 E.00067
G1 X90.784 Y114.643 E.05232
G1 X90.634 Y115.252 F30000
G1 F3600
G1 X90.634 Y129.885 E.05092
G1 X90.484 Y130.612 F30000
G1 F3600
G1 X90.484 Y130.162 E.00157
G1 X90.365 Y130.016 E.00065
G1 X90.484 Y129.92 E.00053
G1 X90.484 Y116.104 E.04808
G1 X90.334 Y116.39 E.00112
M73 P89 R2
G1 X90.334 Y130.181 E.04799
G1 X90.184 Y129.895 E.00112
G1 X90.184 Y116.676 E.046
G1 X90.034 Y116.961 E.00112
G1 X90.034 Y129.609 E.04401
G1 X89.884 Y129.324 E.00112
G1 X89.884 Y117.247 E.04202
M73 P90 R2
G1 X89.734 Y117.533 E.00112
G1 X89.734 Y129.104 E.04026
G1 X89.584 Y128.935 E.00079
G1 X89.584 Y117.819 E.03868
G1 X89.434 Y118.105 E.00112
G1 X89.434 Y128.766 E.0371
G1 X89.284 Y128.596 E.00079
G1 X89.284 Y118.295 E.03585
G1 X89.134 Y118.464 E.00079
G1 X89.134 Y128.427 E.03467
G1 X88.984 Y128.258 E.00079
G1 X88.984 Y118.633 E.03349
G1 X88.834 Y118.803 E.00079
G1 X88.834 Y128.089 E.03232
G1 X88.684 Y127.92 E.00079
G1 X88.684 Y118.972 E.03114
G1 X88.534 Y119.141 E.00079
G1 X88.534 Y127.751 E.02996
G1 X88.384 Y127.582 E.00079
G1 X88.384 Y119.31 E.02878
G1 X88.234 Y119.479 E.00079
G1 X88.234 Y127.413 E.02761
G2 X88.084 Y127.283 I-.339 J.241 E.0007
G1 X88.084 Y119.648 E.02657
G1 X87.934 Y119.817 E.00079
G1 X87.934 Y127.179 E.02562
G1 X87.784 Y127.076 E.00063
G1 X87.784 Y119.961 E.02476
G1 X87.634 Y120.064 E.00063
G1 X87.634 Y126.972 E.02404
G1 X87.484 Y126.869 E.00063
G1 X87.484 Y120.168 E.02332
G1 X87.334 Y120.271 E.00063
G1 X87.334 Y126.765 E.0226
G1 X87.184 Y126.662 E.00063
G1 X87.184 Y120.375 E.02188
G1 X87.034 Y120.478 E.00063
G1 X87.034 Y126.558 E.02116
G1 X86.884 Y126.454 E.00063
G1 X86.884 Y120.582 E.02044
G1 X86.734 Y120.685 E.00063
G1 X86.734 Y126.351 E.01971
G1 X86.584 Y126.247 E.00063
G1 X86.584 Y120.789 E.01899
G1 X86.434 Y120.892 E.00063
G1 X86.434 Y126.144 E.01827
G1 X86.284 Y126.04 E.00063
G1 X86.284 Y120.996 E.01755
G1 X86.134 Y121.099 E.00063
G1 X86.134 Y125.937 E.01683
G1 X85.984 Y125.88 E.00056
G1 X85.984 Y121.203 E.01628
G3 X85.834 Y121.285 I-.242 J-.264 E.0006
G1 X85.834 Y125.823 E.01579
G1 X85.684 Y125.766 E.00056
G1 X85.684 Y121.342 E.0154
G1 X85.534 Y121.399 E.00056
G1 X85.534 Y125.709 E.015
G1 X85.384 Y125.652 E.00056
G1 X85.384 Y121.456 E.0146
G1 X85.234 Y121.513 E.00056
G1 X85.234 Y125.595 E.01421
G1 X85.084 Y125.538 E.00056
G1 X85.084 Y121.57 E.01381
G1 X84.934 Y121.627 E.00056
G1 X84.934 Y125.481 E.01341
G1 X84.784 Y125.424 E.00056
G1 X84.784 Y121.684 E.01302
G1 X84.634 Y121.741 E.00056
G1 X84.634 Y125.367 E.01262
G1 X84.484 Y125.311 E.00056
G1 X84.484 Y121.798 E.01222
G1 X84.334 Y121.855 E.00056
G1 X84.334 Y125.254 E.01183
G1 X84.184 Y125.197 E.00056
G1 X84.184 Y121.912 E.01143
G1 X84.034 Y121.969 E.00056
G1 X84.034 Y125.14 E.01103
G1 X83.884 Y125.083 E.00056
G1 X83.884 Y122.026 E.01064
G1 X83.734 Y122.083 E.00056
G1 X83.734 Y125.048 E.01032
G1 X83.584 Y125.03 E.00053
G1 X83.584 Y122.11 E.01016
G1 X83.434 Y122.128 E.00053
G1 X83.434 Y125.011 E.01003
G1 X83.284 Y124.993 E.00053
G1 X83.284 Y122.146 E.00991
G1 X83.134 Y122.165 E.00053
G1 X83.134 Y124.975 E.00978
G1 X82.984 Y124.957 E.00053
G1 X82.984 Y122.183 E.00965
G1 X82.834 Y122.201 E.00053
G1 X82.834 Y124.939 E.00953
G1 X82.684 Y124.92 E.00053
G1 X82.684 Y122.219 E.0094
G1 X82.534 Y122.238 E.00053
G1 X82.534 Y124.902 E.00927
G1 X82.384 Y124.884 E.00053
G1 X82.384 Y122.256 E.00915
G1 X82.234 Y122.274 E.00053
G1 X82.234 Y124.866 E.00902
G1 X82.084 Y124.848 E.00053
G1 X82.084 Y122.292 E.00889
G1 X81.934 Y122.31 E.00053
G1 X81.934 Y124.83 E.00877
G1 X81.784 Y124.811 E.00053
G1 X81.784 Y122.261 E.00888
; WIPE_START
G1 F24000
G1 X81.784 Y124.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.769 J.943 P1  F30000
G1 X99.034 Y138.315 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.034 Y139.868 E.0054
G1 X98.884 Y139.868 E.00052
G1 X98.884 Y138.627 E.00432
G1 X98.734 Y138.748 E.00067
G1 X98.734 Y139.868 E.0039
G1 X98.584 Y139.868 E.00052
G1 X98.584 Y138.858 E.00351
G1 X98.434 Y138.924 E.00057
G1 X98.434 Y139.868 E.00329
G1 X98.284 Y139.868 E.00052
G1 X98.284 Y138.99 E.00306
G3 X98.134 Y139.014 I-.114 J-.233 E.00054
G1 X98.134 Y139.868 E.00297
G1 X97.984 Y139.868 E.00052
G1 X97.984 Y139.031 E.00291
G1 X97.834 Y139.049 E.00053
G1 X97.834 Y139.868 E.00285
G1 X97.684 Y139.868 E.00052
G1 X97.684 Y139.027 E.00293
G1 X97.534 Y139.001 E.00053
G1 X97.534 Y139.868 E.00302
G1 X97.384 Y139.868 E.00052
G1 X97.384 Y138.962 E.00315
G1 X97.234 Y138.884 E.00059
G1 X97.234 Y139.826 E.00328
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X97.234 Y138.884 E-.35773
G1 X97.384 Y138.962 E-.0642
G1 X97.384 Y139.852 E-.33807
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 S100
; filament end gcode 
M106 P3 S0

G1 E-1.2
M620 S1A
M204 S9000

G17
G2 Z1.8 I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift

G1 Z4.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0
M104 S220
G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.527962 F50
G1 E6.07156 F523
G1 E0.527962 F50
G1 E6.07156 F523
G1 E0.527962 F50
G1 E6.07156 F523
G1 E0.527962 F50
G1 E6.07156 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z4.6 F3000

M204 S10000


M621 S1A
M106 S255
M106 P2 S178
G1 X155.5 Y219.5 F30000
G1 Z5
G1 Z1.6
G1 E2 F1800

; filament start gcode
M106 P3 S255

G4 S0
G1  X155.000 Y219.500 
G1  Y219.000 
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X155.500 Y219.500  
; CP TOOLCHANGE WIPE
G1  X189.625  E1.2970 F1584
M73 P91 R2
G1  Y220.833  E0.0507
G1  X155.375  E1.3017 F1800
G1  Y222.167  E0.0507
G1  X189.625  E1.3017 F2198
G1  Y223.500  E0.0507
G1  X155.375  E1.3017 F4200
G1  Y224.833  E0.0507
G1  X189.625  E1.3017 F4250
G1  Y226.167  E0.0507
G1  X155.375  E1.3017 F4300
G1  Y227.500  E0.0507
G1  X189.625  E1.3017 F4350
G1  Y228.833  E0.0507
G1  X155.375  E1.3017 F4400
G1  Y230.167  E0.0507
G1  X189.625  E1.3017 F4450
M73 P92 R2
G1  Y231.500  E0.0507
G1  X155.375  E1.3017 F4500
G1  Y232.833  E0.0507
G1  X189.625  E1.3017 F4550
G1  Y234.167  E0.0507
G1  X155.375  E1.3017 F4600
G1  Y235.500  E0.0507
G1  X189.625  E1.3017 F4650
G1  Y236.833  E0.0507
G1  X155.375  E1.3017 F4700
G1  Y238.167  E0.0507
G1  X189.625  E1.3017 F4750
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F24000
G1 X187.625 Y238.167 E-.76
; WIPE_END
M73 P92 R1
G1 E-.04 F1800
G17
G3 Z2 I1.058 J-.601 P1  F30000
G1 X114.999 Y110.27 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X114.778 Y110.27 E.00575
G1 X114.778 Y104.806 E.14179
G1 X114.999 Y104.806 E.00575
G1 X114.999 Y110.21 E.14023
M204 S10000
; WIPE_START
G1 F24000
G1 X114.778 Y110.27 E-.0872
G1 X114.778 Y108.499 E-.6728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.167 J.346 P1  F30000
G1 X116.775 Y115.234 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
M73 P93 R1
G1 F12000
G1 X116.143 Y113.754 E.04177
G1 X115.769 Y112.265 E.03986
G3 X115.644 Y111.148 I7.213 J-1.371 E.02919
G1 X115.764 Y111.146 E.00311
G1 X115.888 Y112.251 E.02886
G1 X116.295 Y113.832 E.04235
G1 X116.678 Y114.742 E.02563
G1 X117.019 Y115.356 E.01822
G1 X115.214 Y115.356 E.04685
G1 X115.214 Y115.234 E.00315
G1 X116.715 Y115.234 E.03897
M204 S10000
; WIPE_START
G1 F24000
G1 X116.143 Y113.754 E-.60302
G1 X116.042 Y113.354 E-.15698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.61 J-1.053 P1  F30000
G1 X113.551 Y114.798 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.903 Y114.678 E.01082
G1 X113.903 Y111.171 E.10227
G1 X113.985 Y111.171 E.00239
G1 X113.985 Y115.224 E.11818
G1 X113.78 Y115.287 E.00623
G2 X113.155 Y114.457 I-5.177 J3.249 E.03032
G1 X112.982 Y114.32 E.00644
G1 X113.026 Y114.243 E.0026
G3 X113.516 Y114.749 I-1.662 J2.099 E.02059
M204 S10000
; WIPE_START
G1 F24000
G1 X113.903 Y114.678 E-.14935
G1 X113.903 Y113.071 E-.61065
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.19 J-.254 P1  F30000
G1 X109.901 Y131.821 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X111.649 Y131.821 E.05097
G1 X111.649 Y131.899 E.00227
G1 X109.819 Y131.899 E.05336
G1 X109.819 Y118.821 E.38135
G1 X111.649 Y118.821 E.05336
G1 X111.649 Y118.899 E.00227
G1 X109.901 Y118.899 E.05097
G1 X109.901 Y131.761 E.37505
M204 S10000
; WIPE_START
G1 F24000
G1 X111.649 Y131.821 E-.66463
G1 X111.649 Y131.899 E-.02964
G1 X111.476 Y131.899 E-.06573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.141 J-.422 P1  F30000
G1 X105.153 Y114.799 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X105.503 Y114.679 E.01079
G1 X105.503 Y111.171 E.1023
G1 X105.583 Y111.171 E.00233
G1 X105.583 Y115.227 E.11828
G1 X105.38 Y115.289 E.00617
G2 X104.754 Y114.457 I-5.255 J3.308 E.0304
G1 X104.582 Y114.321 E.00638
G1 X104.627 Y114.244 E.00261
G3 X105.117 Y114.751 I-1.775 J2.208 E.02061
M204 S10000
; WIPE_START
G1 F24000
G1 X105.503 Y114.679 E-.14896
G1 X105.503 Y113.071 E-.61104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.303 J1.179 P1  F30000
G1 X107.453 Y113.572 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G1 X107.566 Y113.56 E.00295
G3 X108.039 Y113.922 I-.088 J.605 E.01613
G1 X108.141 Y114.24 E.00868
G1 X108.155 Y114.645 E.0105
G1 X108.058 Y115.007 E.00972
G1 X107.935 Y115.208 E.00613
G3 X107.563 Y115.41 I-.419 J-.327 E.01129
G3 X107.087 Y115.048 I.076 J-.594 E.01625
G1 X106.982 Y114.732 E.00865
G1 X106.971 Y114.325 E.01057
G1 X107.067 Y113.965 E.00967
G3 X107.399 Y113.599 I.685 J.287 E.01309
M204 S10000
G1 X107.412 Y113.404 F30000
M204 S5000
G1 F12000
G3 X107.139 Y113.176 I.177 J-.489 E.00942
G1 X106.991 Y112.882 E.00856
G1 X106.906 Y112.41 E.01243
G1 X106.959 Y111.894 E.01347
G1 X107.103 Y111.548 E.00973
G3 X107.507 Y111.238 I.566 J.321 E.01358
G3 X107.685 Y111.251 I.065 J.346 E.00467
G3 X108.089 Y111.67 I-.345 J.737 E.01546
G1 X108.206 Y112.076 E.01098
G1 X108.206 Y112.599 E.01355
G1 X108.078 Y113.026 E.01158
G1 X107.915 Y113.271 E.00763
G3 X107.645 Y113.432 I-.389 J-.346 E.0083
G3 X107.469 Y113.421 I-.056 J-.517 E.00458
M204 S10000
G1 X107.253 Y113.514 F30000
M204 S5000
G1 F12000
G1 X106.99 Y113.164 E.01137
G1 X106.836 Y112.771 E.01095
G1 X106.785 Y112.338 E.01132
G1 X106.841 Y111.878 E.01202
G1 X107.006 Y111.483 E.01111
G1 X107.192 Y111.262 E.0075
G3 X107.616 Y111.122 I.388 J.465 E.01185
G3 X107.94 Y111.266 I-.08 J.617 E.00932
G1 X108.111 Y111.466 E.00684
G1 X108.268 Y111.812 E.00985
G1 X108.342 Y112.288 E.01251
G1 X108.289 Y112.782 E.01291
G1 X108.123 Y113.189 E.01141
G1 X107.883 Y113.498 E.01016
G1 X108.133 Y113.849 E.01119
G1 X108.253 Y114.194 E.00947
G1 X108.274 Y114.631 E.01136
G1 X108.174 Y115.037 E.01086
G1 X108.011 Y115.301 E.00806
G3 X107.121 Y115.311 I-.449 J-.346 E.02656
G1 X106.982 Y115.105 E.00645
G1 X106.867 Y114.754 E.0096
G1 X106.853 Y114.317 E.01134
G1 X106.96 Y113.916 E.01077
G3 X107.21 Y113.556 I1.223 J.584 E.01143
M204 S10000
; WIPE_START
G1 F24000
G1 X106.99 Y113.164 E-.17099
G1 X106.836 Y112.771 E-.16037
G1 X106.785 Y112.338 E-.16578
G1 X106.841 Y111.878 E-.17598
G1 X106.929 Y111.667 E-.08688
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.14 J-.427 P1  F30000
G1 X106.456 Y110.405 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X99.852 Y103.791 E.24255
G1 X100.009 Y103.635 E.00573
G1 X100.596 Y104.224 E.02159
G1 X106.613 Y110.249 E.22098
G1 X106.499 Y110.362 E.00418
M204 S10000
; WIPE_START
G1 F24000
G1 X105.076 Y108.956 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.419 J-1.142 P1  F30000
G1 X96.35 Y112.16 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X91.144 Y110.792 E.1397
G1 X91.2 Y110.578 E.00574
G1 X92.487 Y110.917 E.03453
G1 X96.407 Y111.946 E.10519
G1 X96.366 Y112.102 E.00419
M204 S10000
; WIPE_START
G1 F24000
G1 X94.426 Y111.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.402 J1.148 P1  F30000
G1 X99.079 Y113.246 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X98.923 Y113.536 E.00854
G1 X98.815 Y114.059 E.01386
G1 X98.836 Y114.715 E.01705
G1 X98.975 Y115.188 E.01279
G1 X99.13 Y115.42 E.00725
G2 X99.753 Y115.41 I.307 J-.246 E.01865
G1 X99.905 Y115.192 E.00689
G1 X100.037 Y114.842 E.0097
G1 X100.134 Y114.165 E.01776
G1 X100.14 Y113.132 E.0268
G1 X100.034 Y112.241 E.02329
G1 X99.846 Y111.72 E.01438
G2 X99.496 Y111.402 I-.609 J.319 E.01253
G2 X99.073 Y111.562 I-.105 J.36 E.01257
G1 X98.958 Y111.779 E.00637
G1 X98.898 Y112.085 E.00809
G1 X98.767 Y112.074 E.0034
G1 X98.78 Y111.98 E.00246
G1 X98.907 Y111.604 E.0103
G3 X99.409 Y111.272 I.509 J.223 E.01651
G1 X99.517 Y111.285 E.00283
G3 X99.822 Y111.484 I-.155 J.572 E.00961
G1 X100.008 Y111.782 E.00912
G1 X100.15 Y112.208 E.01165
G1 X100.267 Y113.8 E.04141
G1 X100.148 Y114.893 E.02855
G1 X100.003 Y115.26 E.01023
G1 X99.829 Y115.503 E.00775
G3 X99.005 Y115.455 I-.394 J-.34 E.02476
G1 X98.839 Y115.17 E.00854
G1 X98.714 Y114.692 E.01284
G1 X98.722 Y113.844 E.022
G1 X98.862 Y113.38 E.01258
G1 X99.037 Y113.113 E.00829
G3 X99.592 Y113.012 I.333 J.255 E.01607
G1 X99.498 Y113.094 E.00326
G2 X99.195 Y113.127 I-.119 J.313 E.00821
G1 X99.121 Y113.203 E.00277
M204 S10000
; WIPE_START
G1 F24000
G1 X98.923 Y113.536 E-.14704
G1 X98.815 Y114.059 E-.20295
G1 X98.836 Y114.715 E-.24962
G1 X98.955 Y115.12 E-.16039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.077 J-1.215 P1  F30000
G1 X97.053 Y114.999 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.403 Y114.879 E.01079
G1 X97.403 Y111.369 E.10235
G1 X97.483 Y111.369 E.00233
G1 X97.483 Y115.427 E.11834
G1 X97.281 Y115.489 E.00616
G2 X96.653 Y114.657 I-5.133 J3.218 E.03042
G1 X96.482 Y114.523 E.00634
G1 X96.527 Y114.446 E.00259
G3 X97.017 Y114.951 I-1.711 J2.153 E.02058
M204 S10000
; WIPE_START
G1 F24000
G1 X97.403 Y114.879 E-.14892
G1 X97.403 Y113.271 E-.61108
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.215 J.074 P1  F30000
G1 X98.291 Y127.763 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G3 X98.037 Y127.576 I.161 J-.483 E.00831
G1 X97.899 Y127.331 E.0073
G1 X97.745 Y126.524 E.02133
G1 X97.766 Y124.61 E.04968
G1 X97.884 Y124.07 E.01432
G1 X98.022 Y123.816 E.00751
G3 X98.399 Y123.569 I.482 J.325 E.01202
G3 X98.732 Y123.651 I.045 J.534 E.00906
G3 X99.054 Y124.141 I-.79 J.871 E.01538
G1 X99.174 Y124.859 E.01888
G1 X99.15 Y126.753 E.04918
G1 X99.029 Y127.288 E.01422
G1 X98.87 Y127.57 E.0084
G3 X98.349 Y127.778 I-.419 J-.29 E.01544
M204 S10000
G1 X98.257 Y127.871 F30000
M204 S5000
G1 F12000
G3 X97.944 Y127.646 I.2 J-.608 E.01016
G3 X97.742 Y127.239 I.977 J-.737 E.01186
G1 X97.635 Y126.649 E.01557
G1 X97.596 Y125.5 E.02984
G1 X97.659 Y124.5 E.02599
G1 X97.782 Y124.008 E.01318
G3 X98.156 Y123.528 I.999 J.393 E.01602
G3 X98.651 Y123.479 I.307 J.583 E.01323
G3 X98.97 Y123.72 I-.239 J.648 E.01053
G3 X99.196 Y124.197 I-1.139 J.831 E.01378
G1 X99.292 Y124.833 E.01669
G1 X99.317 Y126.027 E.031
G1 X99.243 Y126.943 E.02383
G1 X99.134 Y127.348 E.01089
G3 X98.761 Y127.826 I-1.035 J-.423 E.01595
G3 X98.315 Y127.887 I-.304 J-.563 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X98.092 Y127.791 E-.09238
G1 X97.944 Y127.646 E-.07854
G1 X97.79 Y127.377 E-.11804
G1 X97.742 Y127.239 E-.05529
G1 X97.635 Y126.649 E-.22792
G1 X97.619 Y126.155 E-.18784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.995 J-.701 P1  F30000
G1 X96.517 Y127.718 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X96.718 Y127.496 I-.198 J-.381 E.00794
G1 X96.838 Y127.173 E.00893
G1 X96.873 Y126.622 E.01433
G1 X96.751 Y126.078 E.01447
M73 P94 R1
G1 X96.617 Y125.786 E.00833
G2 X95.708 Y124.382 I-45.773 J28.62 E.04342
G3 X95.392 Y123.604 I7.62 J-3.551 E.02179
G1 X97.001 Y123.604 E.04176
G1 X97.001 Y123.726 E.00315
G1 X95.547 Y123.726 E.03774
G2 X96.212 Y124.925 I4.869 J-1.915 E.03568
G3 X96.721 Y125.726 I-6.887 J4.937 E.02465
G1 X96.959 Y126.376 E.01796
G1 X96.992 Y126.926 E.01429
G1 X96.899 Y127.386 E.01219
G1 X96.746 Y127.671 E.00839
G3 X95.832 Y127.594 I-.432 J-.34 E.02817
G3 X95.644 Y126.897 I1.369 J-.742 E.0189
G1 X95.766 Y126.891 E.00317
G1 X95.836 Y127.309 E.01101
G1 X95.95 Y127.557 E.00709
G2 X96.462 Y127.742 I.368 J-.221 E.01528
M204 S10000
; WIPE_START
G1 F24000
G1 X96.61 Y127.65 E-.06613
G1 X96.718 Y127.496 E-.07158
G1 X96.838 Y127.173 E-.13078
G1 X96.873 Y126.622 E-.20979
G1 X96.751 Y126.078 E-.21183
G1 X96.674 Y125.911 E-.06988
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.619 J-1.048 P1  F30000
G1 X94.933 Y126.939 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X90.877 Y130.227 E.1355
G1 X90.737 Y130.055 E.00575
G1 X94.795 Y126.769 E.1355
G1 X94.895 Y126.893 E.00413
M204 S10000
; WIPE_START
G1 F24000
G1 X93.356 Y128.17 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.189 J.259 P1  F30000
G1 X96.126 Y140.877 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X90.985 Y147.227 E.21204
G1 X90.811 Y147.087 E.00579
G1 X95.954 Y140.738 E.21205
G1 X96.003 Y140.777 E.00162
G1 X96.08 Y140.84 E.00257
M204 S10000
; WIPE_START
G1 F24000
G1 X94.833 Y142.403 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.089 J.544 P1  F30000
G1 X96.916 Y138.23 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X97.357 Y138.536 E.01393
G2 X98.641 Y138.33 I.508 J-.933 E.03633
G1 X98.828 Y138.067 E.00837
G1 X98.935 Y137.733 E.00911
G1 X98.947 Y137.253 E.01245
G1 X98.839 Y136.834 E.01125
G2 X98.171 Y136.161 I-1.177 J.502 E.0252
G1 X97.827 Y136.09 E.00911
G1 X97.377 Y136.125 E.01172
G1 X97.082 Y136.245 E.00825
G2 X96.614 Y136.933 I.616 J.922 E.02214
G1 X96.494 Y136.922 E.00314
G1 X96.521 Y136.784 E.00365
G1 X96.673 Y136.473 E.00897
G1 X96.904 Y136.225 E.00881
G1 X97.173 Y136.069 E.00806
G1 X97.582 Y135.975 E.01091
G1 X97.995 Y135.991 E.01072
G3 X98.758 Y136.466 I-.311 J1.349 E.02374
G1 X98.958 Y136.815 E.01042
G1 X99.067 Y137.249 E.01164
G1 X99.05 Y137.76 E.01324
G1 X98.932 Y138.117 E.00978
G1 X98.721 Y138.419 E.00955
G3 X97.826 Y138.784 I-.893 J-.91 E.02572
G1 X97.506 Y138.728 E.00843
G1 X96.75 Y138.336 E.0221
G1 X96.865 Y138.262 E.00355
M204 S10000
; WIPE_START
G1 F24000
G1 X97.357 Y138.536 E-.21377
G1 X97.651 Y138.644 E-.11918
G1 X97.954 Y138.664 E-.11511
G1 X98.258 Y138.595 E-.11868
G1 X98.505 Y138.453 E-.1082
G1 X98.641 Y138.33 E-.0698
G1 X98.664 Y138.297 E-.01525
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.924 J-.792 P1  F30000
G1 X97.093 Y140.132 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X98.865 Y140.132 E.04601
G1 X98.865 Y140.254 E.00315
G1 X96.991 Y140.254 E.04864
G1 X96.637 Y138.408 E.04878
G1 X96.746 Y138.339 E.00335
G1 X97.081 Y140.073 E.04586
M204 S10000
; WIPE_START
G1 F24000
G1 X98.865 Y140.132 E-.6784
G1 X98.865 Y140.254 E-.04616
G1 X98.772 Y140.254 E-.03543
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.092 J1.213 P1  F30000
G1 X105.493 Y140.763 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X105.599 Y140.871 E.00394
G1 X99.473 Y146.907 E.2232
G1 X99.316 Y146.747 E.00581
G1 X105.444 Y140.713 E.22319
G1 X105.451 Y140.72 E.00025
M204 S10000
; WIPE_START
G1 F24000
G1 X105.599 Y140.871 E-.08043
G1 X104.325 Y142.126 E-.67957
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.085 J.551 P1  F30000
G1 X106.297 Y138.245 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X106.243 Y138.159 I.814 J-.571 E.00263
G1 X106.354 Y138.122 E.00303
G1 X106.385 Y138.184 E.00178
G2 X107.776 Y138.24 I.718 J-.534 E.04141
G1 X107.951 Y137.965 E.00845
G1 X108.049 Y137.576 E.0104
G1 X108.037 Y137.122 E.01179
G1 X107.906 Y136.701 E.01145
G2 X107.288 Y136.138 I-1.008 J.487 E.02223
G1 X106.957 Y136.088 E.00868
G1 X106.594 Y136.135 E.00948
G1 X106.315 Y136.261 E.00795
G1 X106.047 Y136.505 E.00941
G1 X105.923 Y136.696 E.0059
G1 X105.748 Y137.215 E.01422
G1 X105.677 Y137.96 E.01941
G1 X105.731 Y138.861 E.02343
G1 X105.894 Y139.488 E.01682
G1 X106.095 Y139.848 E.01069
G1 X106.33 Y140.075 E.00848
G1 X106.596 Y140.209 E.00773
G1 X106.973 Y140.27 E.00991
G1 X107.316 Y140.23 E.00898
G2 X107.929 Y139.555 I-.212 J-.808 E.02501
G1 X108.049 Y139.57 E.00314
G1 X107.997 Y139.77 E.00536
G1 X107.833 Y140.037 E.00813
G3 X107.111 Y140.383 I-.831 J-.807 E.02123
G1 X106.715 Y140.361 E.01029
G1 X106.413 Y140.261 E.00824
G1 X106.123 Y140.055 E.00923
G1 X106.009 Y139.928 E.00444
G1 X105.788 Y139.543 E.01151
G1 X105.593 Y138.721 E.02191
G1 X105.633 Y137.193 E.03968
G1 X105.794 Y136.688 E.01375
G1 X105.955 Y136.434 E.00781
G1 X106.256 Y136.159 E.01059
G1 X106.551 Y136.024 E.0084
G1 X106.916 Y135.97 E.00959
G1 X107.301 Y136.019 E.01005
G1 X107.587 Y136.149 E.00816
G1 X107.697 Y136.232 E.00357
G3 X108.008 Y136.638 I-.894 J1.009 E.01336
G1 X108.154 Y137.102 E.01262
G1 X108.165 Y137.589 E.01263
G1 X108.069 Y137.984 E.01055
G1 X107.89 Y138.291 E.00924
G3 X106.332 Y138.293 I-.779 J-.617 E.04643
M204 S10000
; WIPE_START
G1 F24000
G1 X106.243 Y138.159 E-.06117
G1 X106.354 Y138.122 E-.04441
G1 X106.385 Y138.184 E-.02613
G1 X106.564 Y138.37 E-.09827
G1 X106.791 Y138.498 E-.0993
G1 X107.046 Y138.552 E-.09906
G1 X107.304 Y138.531 E-.09807
G1 X107.545 Y138.437 E-.09835
G1 X107.776 Y138.24 E-.11558
G1 X107.804 Y138.196 E-.01965
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.273 J1.186 P1  F30000
G1 X116.217 Y140.132 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X115.574 Y139.282 E.02766
G3 X114.423 Y136.044 I5.959 J-3.943 E.09006
G1 X114.547 Y136.042 E.00323
G1 X114.622 Y136.657 E.01609
G1 X114.733 Y137.126 E.01249
G1 X115.051 Y138.061 E.02564
G1 X115.296 Y138.572 E.01472
G1 X115.831 Y139.436 E.02636
G1 X116.349 Y140.057 E.02099
G1 X116.259 Y140.254 E.00562
G1 X113.756 Y140.254 E.06496
G1 X113.756 Y140.132 E.00315
G1 X116.157 Y140.132 E.06231
M204 S10000
; WIPE_START
G1 F24000
G1 X115.574 Y139.282 E-.39175
G1 X115.189 Y138.625 E-.28924
G1 X115.102 Y138.436 E-.07901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.079 J-.563 P1  F30000
G1 X113.59 Y141.331 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X109.095 Y146.883 E.18538
G1 X108.923 Y146.743 E.00575
G1 X113.417 Y141.191 E.18536
G1 X113.544 Y141.294 E.00423
M204 S10000
; WIPE_START
G1 F24000
G1 X112.298 Y142.859 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.144 J.414 P1  F30000
G1 X117.875 Y127.435 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.245 Y128.217 E.0293
G1 X116.636 Y128.635 E.02152
G1 X115.937 Y128.868 E.02148
G1 X115.2 Y128.892 E.02151
G1 X114.488 Y128.707 E.02145
G1 X113.854 Y128.332 E.0215
G1 X112.967 Y127.38 E.03795
G1 X112.967 Y128.817 E.04192
G1 X112.887 Y128.817 E.00233
G1 X112.887 Y121.471 E.21421
G1 X112.967 Y121.471 E.00233
G1 X112.967 Y126.331 E.14172
G1 X113.082 Y127.073 E.0219
G1 X113.423 Y127.761 E.02239
G1 X113.956 Y128.316 E.02243
G1 X114.631 Y128.683 E.02241
G1 X115.384 Y128.829 E.02238
G1 X116.149 Y128.742 E.02243
G1 X116.848 Y128.43 E.02233
G1 X117.422 Y127.919 E.02241
G1 X117.831 Y127.237 E.02317
G1 X117.831 Y121.471 E.16814
G1 X117.909 Y121.471 E.00227
G1 X117.909 Y127.235 E.16809
G1 X118.339 Y127.848 E.02182
G1 X118.903 Y128.284 E.02079
G1 X119.567 Y128.536 E.02072
G1 X120.28 Y128.585 E.02083
G1 X120.974 Y128.42 E.02078
G1 X121.588 Y128.06 E.02076
G1 X122.071 Y127.536 E.02078
G1 X122.378 Y126.894 E.02077
G1 X122.483 Y126.205 E.02031
G1 X122.483 Y121.471 E.13804
G1 X122.563 Y121.471 E.00233
G1 X122.563 Y126.174 E.13714
G1 X122.463 Y126.872 E.02057
G1 X122.181 Y127.506 E.02023
G1 X121.735 Y128.035 E.02016
G1 X121.16 Y128.42 E.02017
G1 X120.499 Y128.632 E.02026
G1 X119.808 Y128.652 E.02015
G1 X119.137 Y128.481 E.02019
G3 X118.541 Y128.131 I16.924 J-29.559 E.02016
G1 X117.917 Y127.479 E.02633
M204 S10000
; WIPE_START
G1 F24000
G1 X117.245 Y128.217 E-.37959
G1 X116.636 Y128.635 E-.28044
G1 X116.387 Y128.718 E-.09998
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.178 J1.204 P1  F30000
G1 X125.467 Y127.38 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X125.467 Y128.817 E.04192
G1 X125.387 Y128.817 E.00233
G1 X125.387 Y121.471 E.21421
G1 X125.467 Y121.471 E.00233
G1 X125.467 Y126.331 E.14172
G1 X125.582 Y127.073 E.0219
G1 X125.923 Y127.761 E.02239
G1 X126.456 Y128.316 E.02243
G1 X127.131 Y128.683 E.02241
G1 X127.884 Y128.829 E.02238
G1 X128.647 Y128.742 E.02237
G1 X129.35 Y128.43 E.02244
G1 X129.925 Y127.918 E.02244
G1 X130.329 Y127.237 E.0231
G1 X130.329 Y121.471 E.16812
G1 X130.409 Y121.471 E.00233
G1 X130.409 Y127.235 E.16809
G1 X130.839 Y127.848 E.02182
G1 X131.403 Y128.284 E.0208
G1 X132.069 Y128.536 E.02078
G1 X132.778 Y128.585 E.0207
G1 X133.474 Y128.42 E.02086
G1 X134.088 Y128.06 E.02076
G1 X134.571 Y127.536 E.02078
G1 X134.878 Y126.894 E.02077
G1 X134.983 Y126.205 E.02031
G1 X134.983 Y121.471 E.13804
G1 X135.061 Y121.471 E.00227
G1 X135.061 Y126.174 E.13715
G1 X134.963 Y126.873 E.02056
G1 X134.681 Y127.506 E.02023
G1 X134.235 Y128.035 E.02016
G1 X133.658 Y128.42 E.02023
G1 X133.001 Y128.632 E.02015
G1 X132.308 Y128.652 E.02021
G1 X131.637 Y128.481 E.02019
G3 X131.041 Y128.131 I16.89 J-29.501 E.02015
G1 X130.378 Y127.435 E.02804
G1 X129.745 Y128.217 E.02935
G1 X129.138 Y128.635 E.02148
G1 X128.437 Y128.868 E.02153
G1 X127.702 Y128.892 E.02145
G1 X126.986 Y128.707 E.02156
G1 X126.354 Y128.332 E.02144
G1 X125.508 Y127.423 E.0362
M204 S10000
; WIPE_START
G1 F24000
G1 X125.467 Y128.817 E-.52981
G1 X125.387 Y128.817 E-.0304
G1 X125.387 Y128.291 E-.19979
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.198 J-.214 P1  F30000
G1 X123.616 Y138.204 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G1 X123.273 Y138.258 E.00902
G1 X122.927 Y138.211 E.00906
G1 X122.625 Y138.071 E.00864
G1 X122.37 Y137.848 E.00877
G3 X122.3 Y136.576 I.821 J-.684 E.03543
G1 X122.52 Y136.337 E.00845
G1 X122.805 Y136.166 E.00862
G1 X123.141 Y136.081 E.00899
G1 X123.485 Y136.095 E.00894
G1 X123.815 Y136.212 E.0091
G3 X124.164 Y137.835 I-.498 J.956 E.04919
G1 X123.924 Y138.055 E.00845
G1 X123.67 Y138.178 E.00732
M204 S10000
G1 X123.151 Y138.383 F30000
M204 S5000
G1 F12000
G3 X123.81 Y138.544 I.061 J1.175 E.01785
G3 X123.092 Y138.391 I-.551 J.825 E.14229
M204 S10000
G1 X123.768 Y138.313 F30000
M204 S5000
G1 F12000
G1 X124.162 Y138.725 E.0148
G1 X124.311 Y139.021 E.00859
G1 X124.368 Y139.348 E.00861
G1 X124.328 Y139.676 E.00856
G1 X124.192 Y139.978 E.0086
G1 X123.975 Y140.225 E.00855
G1 X123.695 Y140.399 E.00856
G3 X123.049 Y140.471 I-.466 J-1.259 E.01704
G1 X122.742 Y140.362 E.00845
G1 X122.473 Y140.167 E.00862
G1 X122.277 Y139.905 E.00849
G1 X122.166 Y139.592 E.00862
G1 X122.149 Y139.263 E.00854
G1 X122.227 Y138.947 E.00846
G1 X122.402 Y138.66 E.00872
G1 X122.742 Y138.326 E.01236
G1 X122.288 Y137.934 E.01556
G1 X122.099 Y137.631 E.00928
G1 X122.011 Y137.296 E.00899
G1 X122.023 Y136.954 E.00888
G1 X122.137 Y136.625 E.00903
G1 X122.342 Y136.341 E.0091
G1 X122.635 Y136.119 E.00955
G1 X122.987 Y135.986 E.00974
G1 X123.38 Y135.964 E.01022
G1 X123.742 Y136.049 E.00966
G1 X124.073 Y136.242 E.00996
G1 X124.307 Y136.494 E.00892
G1 X124.466 Y136.815 E.0093
G1 X124.519 Y137.155 E.00893
G1 X124.473 Y137.494 E.00887
G1 X124.327 Y137.812 E.0091
G3 X123.82 Y138.283 I-1.45 J-1.053 E.01807
M204 S10000
; WIPE_START
G1 F24000
G1 X124.162 Y138.725 E-.21273
G1 X124.311 Y139.021 E-.12573
G1 X124.368 Y139.348 E-.12611
G1 X124.328 Y139.676 E-.12539
G1 X124.192 Y139.978 E-.12588
G1 X124.115 Y140.065 E-.04417
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.695 J-.999 P1  F30000
G1 X122.497 Y141.191 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X122.67 Y141.331 E.00579
G1 X119.065 Y145.783 E.14866
G1 X118.893 Y145.643 E.00575
G1 X122.459 Y141.238 E.14709
M204 S10000
; WIPE_START
G1 F24000
G1 X122.67 Y141.331 E-.08781
G1 X121.557 Y142.706 E-.67219
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.192 J1.202 P1  F30000
G1 X130.946 Y141.21 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X131.128 Y141.331 E.00568
G1 X128.757 Y144.864 E.11042
G1 X128.573 Y144.741 E.00574
G1 X130.913 Y141.259 E.10887
M204 S10000
; WIPE_START
G1 F24000
G1 X131.128 Y141.331 E-.08624
G1 X130.14 Y142.804 E-.67376
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.142 J.419 P1  F30000
G1 X131.931 Y137.926 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X132.014 Y138.025 E.00336
G1 X131.914 Y138.086 E.00303
G1 X131.854 Y138.014 E.00243
G1 X131.592 Y137.843 E.00812
G1 X131.335 Y137.769 E.00695
G2 X130.571 Y137.995 I-.105 J1.053 E.0212
G1 X130.352 Y138.253 E.00878
G1 X130.222 Y138.561 E.00868
G1 X130.17 Y139.018 E.01195
G1 X130.222 Y139.439 E.01101
G1 X130.36 Y139.759 E.00903
G1 X130.581 Y140.016 E.00879
G1 X130.846 Y140.184 E.00814
G1 X131.141 Y140.263 E.00793
G1 X131.516 Y140.251 E.00974
G1 X131.825 Y140.143 E.00851
G2 X132.19 Y139.841 I-.622 J-1.123 E.01236
G1 X132.384 Y139.507 E.01
G1 X132.505 Y139.034 E.01267
G1 X132.548 Y138.29 E.01935
G1 X132.488 Y137.422 E.02259
G1 X132.377 Y136.973 E.01199
G1 X132.171 Y136.562 E.01195
G1 X131.921 Y136.308 E.00923
G1 X131.634 Y136.154 E.00845
G1 X131.294 Y136.09 E.00899
G1 X130.911 Y136.125 E.00997
G2 X130.297 Y136.8 I.21 J.808 E.02506
G1 X130.168 Y136.784 E.00337
G3 X130.908 Y136.006 I.979 J.19 E.02945
G1 X131.308 Y135.972 E.01041
G1 X131.675 Y136.043 E.00969
G1 X132.024 Y136.234 E.01033
G1 X132.278 Y136.51 E.00972
G1 X132.492 Y136.937 E.0124
G1 X132.61 Y137.423 E.01299
G1 X132.635 Y138.952 E.03969
G1 X132.491 Y139.555 E.01609
G1 X132.27 Y139.93 E.01128
G1 X131.995 Y140.179 E.00962
G1 X131.83 Y140.272 E.00493
G1 X131.495 Y140.374 E.00909
G1 X131.087 Y140.374 E.01058
G1 X130.758 Y140.273 E.00894
G1 X130.477 Y140.081 E.00882
G1 X130.234 Y139.775 E.01014
G1 X130.09 Y139.385 E.0108
G1 X130.053 Y138.876 E.01323
G1 X130.139 Y138.425 E.01191
G1 X130.318 Y138.096 E.00971
G1 X130.578 Y137.841 E.00948
G1 X130.865 Y137.696 E.00834
G1 X131.2 Y137.644 E.0088
G1 X131.509 Y137.686 E.00809
G1 X131.646 Y137.738 E.00379
G1 X131.881 Y137.893 E.0073
M204 S10000
; WIPE_START
G1 F24000
G1 X132.014 Y138.025 E-.07129
G1 X131.914 Y138.086 E-.04439
G1 X131.854 Y138.014 E-.03552
G1 X131.592 Y137.843 E-.11887
G1 X131.335 Y137.769 E-.10173
G1 X131.032 Y137.776 E-.11506
G1 X130.805 Y137.846 E-.09036
G1 X130.571 Y137.995 E-.10545
G1 X130.439 Y138.15 E-.07733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.136 J.436 P1  F30000
G1 X137.821 Y118.899 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X136.069 Y118.899 E.05109
G1 X136.069 Y118.821 E.00227
G1 X137.901 Y118.821 E.05342
G1 X137.901 Y131.899 E.38135
G1 X136.069 Y131.899 E.05342
G1 X136.069 Y131.821 E.00227
G1 X137.821 Y131.821 E.05109
G1 X137.821 Y118.959 E.37505
M204 S10000
; WIPE_START
G1 F24000
G1 X136.069 Y118.899 E-.66615
G1 X136.069 Y118.821 E-.02964
G1 X136.238 Y118.821 E-.06421
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.189 J.259 P1  F30000
G1 X140.905 Y140.259 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G3 X140.733 Y140.168 I.078 J-.356 E.00514
G3 X140.416 Y139.452 I1.37 J-1.033 E.02047
G1 X140.325 Y138.614 E.02189
G1 X140.34 Y137.513 E.02857
G1 X140.463 Y136.72 E.02084
G1 X140.577 Y136.407 E.00863
G3 X140.876 Y136.101 I.541 J.229 E.01136
G3 X141.234 Y136.194 I.097 J.363 E.01005
G3 X141.549 Y136.91 I-1.348 J1.02 E.02048
G1 X141.64 Y137.756 E.02207
G1 X141.63 Y138.838 E.02809
G1 X141.521 Y139.561 E.01896
G1 X141.356 Y140.003 E.01225
G1 X141.229 Y140.171 E.00547
G3 X140.965 Y140.267 I-.246 J-.268 E.0075
M204 S10000
G1 X140.879 Y140.376 F30000
M204 S5000
G1 F12000
G3 X140.594 Y140.192 I.105 J-.477 E.009
G1 X140.426 Y139.894 E.00888
G1 X140.302 Y139.487 E.01104
G1 X140.201 Y137.841 E.04281
G1 X140.338 Y136.719 E.02932
G1 X140.471 Y136.353 E.0101
G1 X140.618 Y136.133 E.00687
G3 X141.143 Y135.997 I.366 J.327 E.0149
G3 X141.369 Y136.162 I-.294 J.637 E.00732
G1 X141.54 Y136.466 E.00903
G1 X141.663 Y136.875 E.01109
G1 X141.765 Y138.527 E.04295
G1 X141.62 Y139.651 E.02941
G1 X141.474 Y140.036 E.01068
G3 X141.038 Y140.385 I-.576 J-.273 E.01501
G3 X140.938 Y140.386 I-.054 J-.485 E.00259
M204 S10000
; WIPE_START
G1 F24000
G1 X140.763 Y140.337 E-.06902
G1 X140.594 Y140.192 E-.08478
G1 X140.426 Y139.894 E-.13001
G1 X140.302 Y139.487 E-.16162
G1 X140.251 Y138.661 E-.31458
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.636 J-1.038 P1  F30000
G1 X138.557 Y139.699 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.907 Y139.579 E.01079
G1 X138.907 Y136.069 E.10235
G1 X138.985 Y136.069 E.00227
G1 X138.985 Y140.121 E.11816
G1 X138.782 Y140.183 E.00618
G2 X138.157 Y139.358 I-5.291 J3.36 E.0302
G1 X137.982 Y139.222 E.00647
G1 X138.027 Y139.144 E.00261
G3 X138.521 Y139.651 I-1.761 J2.212 E.02069
M204 S10000
; WIPE_START
G1 F24000
G1 X138.907 Y139.579 E-.14904
G1 X138.907 Y137.971 E-.61096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.144 J.415 P1  F30000
G1 X140.113 Y141.296 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G1 X140.298 Y141.306 E.00481
G1 X140.335 Y141.308 E.00096
G1 X140.146 Y144.643 E.08669
G1 X139.926 Y144.631 E.00572
G1 X140.11 Y141.356 E.08512
M204 S10000
; WIPE_START
G1 F24000
G1 X140.298 Y141.306 E-.07412
G1 X140.335 Y141.308 E-.01403
G1 X140.235 Y143.073 E-.67185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.113 J1.212 P1  F30000
G1 X151.861 Y144.155 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X150.275 Y141.333 E.08401
G1 X150.468 Y141.225 E.00577
G1 X150.939 Y142.064 E.02497
G1 X152.053 Y144.047 E.05903
G1 X151.913 Y144.126 E.00417
M204 S10000
; WIPE_START
G1 F24000
G1 X150.901 Y142.401 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.158 J-.375 P1  F30000
G1 X149.834 Y139.105 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X149.882 Y139.13 E.00142
G3 X150.807 Y139.923 I-2.144 J3.437 E.03173
G1 X150.649 Y139.981 E.00437
G1 X150.067 Y139.397 E.0214
G1 X149.78 Y139.223 E.00871
G1 X149.809 Y139.159 E.00181
M204 S10000
; WIPE_START
G1 F24000
G1 X149.882 Y139.13 E-.02986
G1 X150.131 Y139.294 E-.11344
G1 X150.364 Y139.48 E-.1133
G1 X150.807 Y139.923 E-.23777
G1 X150.649 Y139.981 E-.06399
G1 X150.274 Y139.606 E-.20165
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.528 J1.096 P1  F30000
G1 X150.878 Y139.896 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X150.878 Y136.048 E.09987
G1 X150.999 Y136.048 E.00315
G1 X150.999 Y139.851 E.0987
G1 X150.934 Y139.876 E.00181
M204 S10000
; WIPE_START
G1 F24000
G1 X150.905 Y137.876 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.738 J-.968 P1  F30000
G1 X148.219 Y139.924 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X148.065 Y139.981 E.00428
G1 X147.483 Y139.397 E.0214
G1 X147.196 Y139.222 E.00872
G1 X147.249 Y139.105 E.00334
G1 X147.296 Y139.13 E.0014
G3 X148.18 Y139.878 I-2.072 J3.343 E.03017
M204 S10000
G1 X148.413 Y139.852 F30000
M204 S5000
G1 F12000
G1 X148.292 Y139.897 E.00336
G1 X148.292 Y136.048 E.09987
G1 X148.413 Y136.048 E.00315
G1 X148.413 Y139.792 E.09714
M204 S10000
; WIPE_START
G1 F24000
G1 X148.292 Y139.897 E-.06106
G1 X148.292 Y138.057 E-.69894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.024 J.657 P1  F30000
G1 X151.859 Y132.499 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.209 Y132.379 E.01079
G1 X152.209 Y128.871 E.1023
G1 X152.291 Y128.871 E.00239
G1 X152.291 Y132.913 E.11787
G1 X152.082 Y132.977 E.00636
G2 X151.459 Y132.158 I-4.892 J3.078 E.03005
G1 X151.284 Y132.022 E.00647
G1 X151.329 Y131.944 E.00263
G3 X151.823 Y132.451 I-1.724 J2.176 E.02071
M204 S10000
; WIPE_START
G1 F24000
G1 X152.209 Y132.379 E-.14897
G1 X152.209 Y130.771 E-.61103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.018 J.667 P1  F30000
G1 X153.466 Y128.85 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G1 X155.071 Y128.85 E.04165
G1 X155.071 Y128.97 E.0031
G1 X153.563 Y128.97 E.03913
G1 X153.885 Y129.638 E.01925
G1 X154.595 Y130.622 E.03147
G1 X154.985 Y131.263 E.01948
G1 X155.131 Y131.67 E.01123
G1 X155.184 Y132.138 E.01222
G1 X155.131 Y132.501 E.00951
G1 X154.97 Y132.848 E.00995
G3 X153.816 Y133.039 I-.666 J-.446 E.03401
G1 X153.622 Y132.818 E.00764
G1 X153.477 Y132.493 E.00922
G1 X153.433 Y132.149 E.009
G1 X153.549 Y132.149 E.00299
G2 X153.855 Y132.918 I1.096 J.008 E.02203
G2 X154.878 Y132.771 I.45 J-.5 E.03057
G1 X155.011 Y132.49 E.00807
G2 X155.059 Y131.945 I-1.451 J-.403 E.01428
G1 X154.953 Y131.499 E.0119
G1 X154.872 Y131.303 E.00551
G1 X154.082 Y130.143 E.0364
G1 X153.593 Y129.317 E.02493
G3 X153.476 Y128.91 I1.784 J-.732 E.01103
M204 S10000
; WIPE_START
G1 F24000
G1 X155.071 Y128.85 E-.60683
G1 X155.071 Y128.97 E-.0454
G1 X154.788 Y128.97 E-.10777
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.113 J.493 P1  F30000
G1 X156.153 Y132.051 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X156.291 Y131.879 E.00572
G1 X158.235 Y133.453 E.06492
G1 X161.032 Y135.719 E.09341
G1 X160.893 Y135.891 E.00575
G1 X156.199 Y132.089 E.15676
M204 S10000
; WIPE_START
G1 F24000
G1 X156.291 Y131.879 E-.08681
G1 X157.668 Y132.994 E-.67319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.207 J-.152 P1  F30000
G1 X156.27 Y121.865 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X159.676 Y122.055 E.08855
G1 X159.663 Y122.276 E.00574
G1 X156.258 Y122.085 E.08851
G1 X156.266 Y121.925 E.00416
M204 S10000
; WIPE_START
G1 F24000
G1 X158.265 Y122.001 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.143 J-1.209 P1  F30000
G1 X154.756 Y122.415 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X155.144 Y123.393 I-.978 J.955 E.02805
G1 X155.086 Y123.793 E.01048
G1 X154.948 Y124.081 E.00828
G3 X153.741 Y124.077 I-.602 J-.393 E.03717
G3 X153.535 Y123.473 I1.023 J-.686 E.01675
G1 X153.656 Y123.462 E.00315
G2 X153.997 Y124.18 I1.086 J-.076 E.02112
G2 X154.895 Y123.942 I.347 J-.505 E.02737
G1 X154.998 Y123.662 E.00773
G1 X155.023 Y123.257 E.01055
G1 X154.962 Y122.938 E.00842
G2 X154.342 Y122.405 I-.808 J.313 E.02209
G1 X154.336 Y122.334 E.00185
G2 X154.979 Y121.975 I.035 J-.691 E.02014
G1 X155.11 Y121.66 E.00886
G1 X155.159 Y121.189 E.01229
G2 X154.786 Y120.23 I-1.417 J-.001 E.02734
G2 X153.826 Y120.366 I-.423 J.468 E.0287
G2 X153.617 Y120.967 I1.243 J.768 E.01666
G1 X153.503 Y120.953 E.00298
G1 X153.588 Y120.574 E.01009
G1 X153.732 Y120.291 E.00823
G3 X154.476 Y119.956 I.639 J.425 E.02232
G3 X154.874 Y120.155 I-.123 J.743 E.01172
G1 X155.087 Y120.428 E.00899
G1 X155.227 Y120.784 E.00993
G1 X155.278 Y121.292 E.01325
G1 X155.208 Y121.749 E.012
G1 X155.053 Y122.078 E.00943
G1 X154.795 Y122.37 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X154.971 Y122.687 E-.13789
G1 X155.1 Y122.982 E-.12228
G1 X155.144 Y123.393 E-.1572
G1 X155.086 Y123.793 E-.15352
G1 X154.948 Y124.081 E-.12123
G1 X154.829 Y124.214 E-.06786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.215 J-1.198 P1  F30000
G1 X151.955 Y123.699 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.305 Y123.579 E.01079
G1 X152.305 Y120.071 E.1023
G1 X152.383 Y120.071 E.00227
G1 X152.383 Y124.124 E.11818
G1 X152.18 Y124.186 E.00618
G2 X151.555 Y123.357 I-5.179 J3.25 E.03033
G1 X151.382 Y123.222 E.00639
G1 X151.428 Y123.143 E.00265
G3 X151.919 Y123.651 I-1.828 J2.26 E.02065
M204 S10000
; WIPE_START
G1 F24000
G1 X152.305 Y123.579 E-.14904
G1 X152.305 Y121.971 E-.61096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.156 J-.379 P1  F30000
G1 X149.953 Y114.798 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X150.305 Y114.678 E.01082
G1 X150.305 Y111.171 E.10227
G1 X150.387 Y111.171 E.00239
G1 X150.387 Y115.22 E.11805
G1 X150.18 Y115.283 E.0063
G2 X149.557 Y114.456 I-5.224 J3.291 E.03022
G1 X149.382 Y114.321 E.00644
G1 X149.427 Y114.243 E.00264
G3 X149.918 Y114.749 I-1.71 J2.147 E.02062
M204 S10000
; WIPE_START
G1 F24000
G1 X150.305 Y114.678 E-.14942
G1 X150.305 Y113.072 E-.61058
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.588 J1.065 P1  F30000
G1 X151.528 Y112.396 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G1 X152.861 Y115.36 E.08435
G1 X152.75 Y115.411 E.00316
G1 X151.474 Y112.574 E.0807
G1 X151.474 Y112.274 E.00779
G1 X152.884 Y112.274 E.03659
G1 X152.884 Y111.15 E.02917
G1 X153.025 Y111.15 E.00367
G1 X153.025 Y112.274 E.02917
G1 X153.369 Y112.274 E.00893
G1 X153.369 Y112.396 E.00315
G1 X153.025 Y112.396 E.00893
G1 X153.025 Y113.972 E.0409
G1 X152.884 Y113.972 E.00367
G1 X152.884 Y112.396 E.0409
G1 X151.588 Y112.396 E.03363
M204 S10000
; WIPE_START
G1 F24000
G1 X152.377 Y114.234 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.646 J1.031 P1  F30000
G1 X159.362 Y109.859 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X154.678 Y112.176 E.1356
G1 X154.58 Y111.977 E.00575
G1 X159.265 Y109.663 E.1356
G1 X159.336 Y109.805 E.00413
M204 S10000
; WIPE_START
G1 F24000
G1 X157.553 Y110.713 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.023 J-1.217 P1  F30000
G1 X142.376 Y110.423 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X142.234 Y110.254 E.00572
G1 X150.694 Y103.155 E.28661
G1 X150.834 Y103.322 E.00566
G1 X142.422 Y110.384 E.28505
M204 S10000
; WIPE_START
G1 F24000
G1 X142.234 Y110.254 E-.08687
G1 X143.591 Y109.116 E-.67313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.144 J-.416 P1  F30000
G1 X141.366 Y115.234 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X142.531 Y115.234 E.03025
G1 X142.531 Y115.356 E.00315
G1 X141.26 Y115.356 E.03301
M73 P95 R1
G1 X141.022 Y113.473 E.04925
G1 X141.136 Y113.42 E.00327
G1 X141.358 Y115.175 E.0459
M204 S10000
; WIPE_START
G1 F24000
G1 X142.531 Y115.234 E-.44635
G1 X142.531 Y115.356 E-.04616
G1 X141.828 Y115.356 E-.26749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.215 J.073 P1  F30000
G1 X141.923 Y113.764 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X142.214 Y113.636 I.021 J-.346 E.00857
G1 X142.333 Y113.48 E.0051
G1 X142.479 Y113.143 E.00953
G1 X142.549 Y112.565 E.0151
G1 X142.497 Y112.02 E.01421
G1 X142.348 Y111.592 E.01178
G2 X142.08 Y111.254 I-.748 J.318 E.01133
G2 X141.473 Y111.37 I-.235 J.418 E.01744
G1 X141.329 Y111.601 E.00705
G1 X141.219 Y112.023 E.01131
G1 X141.098 Y112.015 E.00313
G1 X141.238 Y111.518 E.01339
G1 X141.402 Y111.27 E.00772
G3 X141.935 Y111.082 I.43 J.371 E.01534
G3 X142.276 Y111.27 I-.081 J.551 E.01033
G3 X142.572 Y111.835 I-1.146 J.961 E.0167
G1 X142.67 Y112.531 E.01822
G1 X142.59 Y113.183 E.01704
G1 X142.428 Y113.553 E.01049
G3 X141.941 Y113.886 I-.57 J-.311 E.0159
G3 X141.701 Y113.812 I.005 J-.44 E.0066
G1 X141.204 Y113.389 E.01696
G1 X141.37 Y113.312 E.00477
G1 X141.717 Y113.68 E.01314
G2 X141.863 Y113.755 I.226 J-.263 E.00429
M204 S10000
; WIPE_START
G1 F24000
G1 X142.017 Y113.759 E-.05829
G1 X142.108 Y113.722 E-.03734
G1 X142.214 Y113.636 E-.05187
G1 X142.333 Y113.48 E-.07465
G1 X142.479 Y113.143 E-.13947
G1 X142.549 Y112.565 E-.22114
G1 X142.505 Y112.101 E-.17724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.805 J-.913 P1  F30000
G1 X139.447 Y114.798 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.799 Y114.678 E.01082
G1 X139.799 Y111.171 E.10227
G1 X139.881 Y111.171 E.00239
G1 X139.881 Y115.233 E.11844
G1 X139.679 Y115.293 E.00614
G2 X139.052 Y114.457 I-5.266 J3.297 E.03051
G1 X138.88 Y114.322 E.00637
G1 X138.926 Y114.244 E.00264
G3 X139.412 Y114.749 I-1.71 J2.129 E.0205
M204 S10000
; WIPE_START
G1 F24000
G1 X139.799 Y114.678 E-.14934
G1 X139.799 Y113.071 E-.61066
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.186 J-1.203 P1  F30000
G1 X129.255 Y114.699 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X129.605 Y114.579 E.01079
G1 X129.605 Y111.069 E.10235
G1 X129.685 Y111.069 E.00233
G1 X129.685 Y115.124 E.11823
G1 X129.48 Y115.187 E.00623
G2 X128.855 Y114.357 I-5.18 J3.251 E.03034
G1 X128.682 Y114.222 E.00639
G1 X128.727 Y114.144 E.00261
G3 X129.219 Y114.651 I-1.77 J2.211 E.02064
M204 S10000
; WIPE_START
G1 F24000
G1 X129.605 Y114.579 E-.149
G1 X129.605 Y112.971 E-.611
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.887 J.833 P1  F30000
G1 X131.763 Y115.269 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G2 X132.067 Y115.111 I-.018 J-.407 E.0092
G1 X132.187 Y114.903 E.00621
G1 X132.263 Y114.571 E.00883
G1 X132.384 Y114.581 E.00315
G1 X132.288 Y114.964 E.01025
G3 X131.915 Y115.365 I-.663 J-.244 E.01459
G3 X131.347 Y115.204 I-.158 J-.524 E.01617
G3 X131.05 Y114.633 I1.037 J-.903 E.01685
G1 X130.875 Y113.17 E.03824
G1 X130.993 Y111.811 E.03541
G1 X131.147 Y111.391 E.0116
G3 X131.492 Y111.023 I.873 J.473 E.01323
G3 X131.907 Y111.007 I.227 J.532 E.01102
G3 X132.193 Y111.266 I-.271 J.587 E.01015
G1 X132.356 Y111.619 E.01009
G1 X132.468 Y112.334 E.01878
G1 X132.394 Y113.017 E.01783
G1 X132.238 Y113.383 E.01032
G3 X131.57 Y113.68 I-.567 J-.374 E.02002
G1 X131.631 Y113.567 E.00334
G2 X132.139 Y113.321 I.073 J-.498 E.01555
G1 X132.282 Y112.977 E.00967
G1 X132.351 Y112.386 E.01546
G1 X132.291 Y111.843 E.01418
G2 X131.96 Y111.177 I-1.316 J.239 E.01957
G2 X131.43 Y111.209 I-.246 J.32 E.01503
G2 X131.241 Y111.47 I.973 J.906 E.00839
G1 X131.104 Y111.861 E.01074
G1 X131.009 Y112.557 E.01823
G1 X131.014 Y113.661 E.02867
G1 X131.136 Y114.499 E.02198
G1 X131.279 Y114.897 E.01098
G1 X131.43 Y115.121 E.007
G2 X131.703 Y115.267 I.315 J-.258 E.00824
M204 S10000
; WIPE_START
G1 F24000
G1 X131.877 Y115.254 E-.06645
G1 X131.968 Y115.206 E-.03922
G1 X132.067 Y115.111 E-.05229
G1 X132.187 Y114.903 E-.09098
G1 X132.263 Y114.571 E-.12933
G1 X132.384 Y114.581 E-.04611
G1 X132.288 Y114.964 E-.15015
G1 X132.153 Y115.192 E-.10072
G1 X132.041 Y115.3 E-.05875
G1 X131.981 Y115.331 E-.02601
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.198 J-.212 P1  F30000
G1 X131.08 Y110.244 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X132.774 Y103.801 E.1729
G1 X132.987 Y103.856 E.00574
G1 X131.294 Y110.3 E.17291
G1 X131.138 Y110.259 E.00418
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.629 Y108.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I-.142 J-1.209 P1  F30000
G1 X114.999 Y110.27 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F10480
G1 X114.778 Y110.27 E.00575
G1 X114.778 Y104.806 E.14179
G1 X114.999 Y104.806 E.00575
G1 X114.999 Y110.21 E.14023
M204 S10000
; WIPE_START
G1 F24000
G1 X114.778 Y110.27 E-.0872
G1 X114.778 Y108.499 E-.6728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.167 J.346 P1  F30000
G1 X116.775 Y115.234 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X116.143 Y113.754 E.04177
G1 X115.769 Y112.265 E.03986
G3 X115.644 Y111.148 I7.213 J-1.371 E.02919
G1 X115.764 Y111.146 E.00311
G1 X115.888 Y112.251 E.02885
G2 X116.295 Y113.832 I490.672 J-125.45 E.04236
G1 X116.678 Y114.742 E.02563
G1 X117.019 Y115.356 E.01822
G1 X115.214 Y115.356 E.04685
G1 X115.214 Y115.234 E.00315
G1 X116.715 Y115.234 E.03897
M204 S10000
; WIPE_START
G1 F24000
G1 X116.143 Y113.754 E-.60302
G1 X116.042 Y113.354 E-.15698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.61 J-1.053 P1  F30000
G1 X113.551 Y114.798 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X113.903 Y114.678 E.01082
G1 X113.903 Y111.171 E.10227
G1 X113.985 Y111.171 E.00239
G1 X113.985 Y115.224 E.11818
G1 X113.78 Y115.287 E.00623
G2 X113.155 Y114.457 I-5.177 J3.249 E.03032
G1 X112.982 Y114.32 E.00644
G1 X113.026 Y114.243 E.0026
G3 X113.516 Y114.749 I-1.662 J2.099 E.02059
M204 S10000
; WIPE_START
G1 F24000
G1 X113.903 Y114.678 E-.14935
G1 X113.903 Y113.071 E-.61065
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.19 J-.254 P1  F30000
G1 X109.901 Y131.821 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X111.649 Y131.821 E.05097
G1 X111.649 Y131.899 E.00227
G1 X109.819 Y131.899 E.05336
G1 X109.819 Y118.821 E.38135
G1 X111.649 Y118.821 E.05336
G1 X111.649 Y118.899 E.00227
G1 X109.901 Y118.899 E.05097
G1 X109.901 Y131.761 E.37505
M204 S10000
; WIPE_START
G1 F24000
G1 X111.649 Y131.821 E-.66463
G1 X111.649 Y131.899 E-.02964
G1 X111.476 Y131.899 E-.06573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.141 J-.422 P1  F30000
G1 X105.153 Y114.799 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X105.503 Y114.679 E.01079
G1 X105.503 Y111.171 E.1023
G1 X105.583 Y111.171 E.00233
G1 X105.583 Y115.227 E.11828
G1 X105.38 Y115.289 E.00617
G2 X104.754 Y114.457 I-5.255 J3.308 E.0304
G1 X104.582 Y114.321 E.00638
G1 X104.627 Y114.244 E.00261
G3 X105.117 Y114.751 I-1.775 J2.208 E.02061
M204 S10000
; WIPE_START
G1 F24000
G1 X105.503 Y114.679 E-.14896
G1 X105.503 Y113.071 E-.61104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.292 J1.182 P1  F30000
G1 X107.509 Y113.566 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G1 X107.566 Y113.56 E.00148
G3 X108.039 Y113.922 I-.087 J.605 E.01614
G1 X108.141 Y114.24 E.00868
G1 X108.155 Y114.645 E.0105
G1 X108.058 Y115.007 E.00972
G1 X107.935 Y115.208 E.00613
G3 X107.564 Y115.41 I-.419 J-.327 E.01128
G3 X107.087 Y115.048 I.075 J-.594 E.01626
G1 X106.982 Y114.732 E.00865
G1 X106.971 Y114.325 E.01057
G1 X107.067 Y113.965 E.00967
G3 X107.453 Y113.583 I.593 J.214 E.01457
M204 S10000
G1 X107.412 Y113.404 F30000
M204 S5000
G1 F10480
G3 X107.139 Y113.176 I.176 J-.489 E.00942
G1 X106.991 Y112.882 E.00856
G1 X106.906 Y112.41 E.01243
G1 X106.959 Y111.894 E.01347
G1 X107.103 Y111.548 E.00973
G3 X107.517 Y111.237 I.558 J.313 E.01383
G3 X107.685 Y111.251 I.059 J.328 E.00442
G3 X108.089 Y111.67 I-.345 J.737 E.01546
G1 X108.206 Y112.076 E.01098
G1 X108.206 Y112.599 E.01355
G1 X108.078 Y113.026 E.01158
G1 X107.915 Y113.271 E.00763
G3 X107.646 Y113.432 I-.388 J-.346 E.00828
G3 X107.469 Y113.421 I-.057 J-.517 E.0046
M204 S10000
G1 X107.253 Y113.514 F30000
M204 S5000
G1 F10480
G1 X106.99 Y113.164 E.01137
G1 X106.836 Y112.771 E.01095
G1 X106.785 Y112.338 E.01132
G1 X106.841 Y111.878 E.01202
G1 X107.006 Y111.483 E.01111
G1 X107.192 Y111.262 E.0075
G3 X107.564 Y111.121 I.393 J.475 E.0105
G3 X107.94 Y111.266 I-.012 J.59 E.01067
G1 X108.111 Y111.466 E.00684
G1 X108.268 Y111.812 E.00985
G1 X108.342 Y112.288 E.01251
G1 X108.289 Y112.782 E.01291
G1 X108.123 Y113.189 E.01141
G1 X107.883 Y113.498 E.01016
G1 X108.133 Y113.849 E.01119
G1 X108.253 Y114.194 E.00947
G1 X108.274 Y114.631 E.01136
G1 X108.174 Y115.037 E.01086
G1 X108.011 Y115.301 E.00806
G3 X107.121 Y115.311 I-.449 J-.346 E.02656
G1 X106.982 Y115.105 E.00645
G1 X106.867 Y114.754 E.0096
G1 X106.853 Y114.317 E.01134
G1 X106.96 Y113.916 E.01077
G3 X107.211 Y113.556 I1.227 J.586 E.01143
M204 S10000
; WIPE_START
G1 F24000
G1 X106.99 Y113.164 E-.17096
G1 X106.836 Y112.771 E-.16035
G1 X106.785 Y112.338 E-.16578
G1 X106.841 Y111.878 E-.17598
G1 X106.929 Y111.667 E-.08693
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.139 J-.428 P1  F30000
G1 X106.455 Y110.406 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X99.852 Y103.791 E.24255
G1 X100.009 Y103.635 E.00574
G1 X100.307 Y103.935 E.01098
G1 X106.613 Y110.249 E.23158
G1 X106.498 Y110.363 E.00422
M204 S10000
; WIPE_START
G1 F24000
G1 X105.076 Y108.957 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.927 J-.788 P1  F30000
G1 X99.46 Y115.567 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G2 X99.753 Y115.41 I-.022 J-.393 E.00892
G1 X99.905 Y115.192 E.00689
G1 X100.037 Y114.842 E.0097
G1 X100.134 Y114.165 E.01776
G1 X100.14 Y113.132 E.0268
G1 X100.034 Y112.241 E.02329
G1 X99.846 Y111.72 E.01438
G2 X99.495 Y111.402 I-.609 J.32 E.01255
G2 X99.073 Y111.562 I-.104 J.363 E.01254
G1 X98.958 Y111.779 E.00637
G1 X98.898 Y112.085 E.00809
G1 X98.767 Y112.074 E.0034
G1 X98.78 Y111.98 E.00246
G1 X98.907 Y111.604 E.0103
G3 X99.251 Y111.288 I.573 J.278 E.01241
G3 X99.469 Y111.279 I.128 J.454 E.00571
G3 X99.822 Y111.484 I-.116 J.607 E.0108
G1 X100.008 Y111.782 E.00912
G1 X100.15 Y112.208 E.01165
G1 X100.267 Y113.8 E.04141
G1 X100.148 Y114.893 E.02855
G1 X100.003 Y115.26 E.01022
G1 X99.829 Y115.503 E.00775
G3 X99.005 Y115.455 I-.394 J-.34 E.02476
G1 X98.839 Y115.17 E.00854
G1 X98.714 Y114.692 E.01284
G1 X98.722 Y113.844 E.022
G1 X98.862 Y113.38 E.01258
G1 X99.037 Y113.113 E.00829
G3 X99.592 Y113.012 I.333 J.255 E.01607
G1 X99.498 Y113.094 E.00326
G2 X99.195 Y113.127 I-.12 J.313 E.00821
G1 X99.079 Y113.246 E.00432
G1 X98.923 Y113.536 E.00854
G1 X98.815 Y114.059 E.01386
G1 X98.836 Y114.715 E.01705
G1 X98.975 Y115.188 E.01279
G1 X99.13 Y115.42 E.00725
G2 X99.4 Y115.566 I.307 J-.246 E.00817
M204 S10000
; WIPE_START
G1 F24000
G1 X99.562 Y115.548 E-.0621
G1 X99.753 Y115.41 E-.08953
G1 X99.905 Y115.192 E-.1009
G1 X100.037 Y114.842 E-.142
G1 X100.134 Y114.165 E-.25998
G1 X100.136 Y113.887 E-.10548
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.413 J-1.145 P1  F30000
G1 X97.053 Y114.999 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X97.403 Y114.879 E.01079
G1 X97.403 Y111.369 E.10235
G1 X97.483 Y111.369 E.00233
G1 X97.483 Y115.427 E.11834
G1 X97.281 Y115.489 E.00616
G2 X96.653 Y114.657 I-5.182 J3.254 E.03042
G1 X96.482 Y114.523 E.00634
G1 X96.527 Y114.446 E.00259
G3 X97.017 Y114.951 I-1.711 J2.153 E.02058
M204 S10000
; WIPE_START
G1 F24000
G1 X97.403 Y114.879 E-.14892
G1 X97.403 Y113.271 E-.61108
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.884 J-.837 P1  F30000
G1 X96.35 Y112.16 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G1 X91.144 Y110.792 E.1397
G1 X91.2 Y110.578 E.00574
G1 X91.899 Y110.762 E.01875
G1 X96.407 Y111.946 E.12097
G1 X96.366 Y112.102 E.00419
M204 S10000
; WIPE_START
G1 F24000
G1 X94.426 Y111.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.184 J.283 P1  F30000
G1 X98.291 Y127.763 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G3 X98.037 Y127.576 I.161 J-.483 E.00831
G1 X97.899 Y127.331 E.0073
G1 X97.745 Y126.524 E.02133
G1 X97.766 Y124.61 E.04968
G1 X97.884 Y124.07 E.01432
G1 X98.022 Y123.816 E.00751
G3 X98.435 Y123.567 I.458 J.293 E.01296
G3 X98.732 Y123.651 I.01 J.535 E.00813
G3 X99.054 Y124.141 I-.79 J.871 E.01538
G1 X99.174 Y124.859 E.01888
G1 X99.15 Y126.753 E.04918
G1 X99.029 Y127.288 E.01422
G1 X98.87 Y127.57 E.0084
G3 X98.349 Y127.778 I-.419 J-.29 E.01544
M204 S10000
G1 X98.257 Y127.871 F30000
M204 S5000
G1 F10480
G3 X97.944 Y127.646 I.2 J-.608 E.01016
G3 X97.742 Y127.239 I.977 J-.737 E.01186
G1 X97.635 Y126.649 E.01557
G1 X97.596 Y125.5 E.02984
G1 X97.659 Y124.5 E.02599
G1 X97.782 Y124.008 E.01318
G3 X98.156 Y123.528 I.999 J.393 E.01602
G3 X98.592 Y123.467 I.3 J.557 E.01164
G3 X98.97 Y123.72 I-.194 J.7 E.01202
G3 X99.196 Y124.197 I-1.154 J.839 E.01378
G1 X99.292 Y124.833 E.01669
G1 X99.317 Y126.027 E.031
G1 X99.243 Y126.943 E.02383
G1 X99.134 Y127.348 E.01089
G3 X98.761 Y127.826 I-1.035 J-.423 E.01595
G3 X98.315 Y127.887 I-.304 J-.563 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X98.092 Y127.791 E-.09238
G1 X97.944 Y127.646 E-.07854
G1 X97.79 Y127.377 E-.11804
G1 X97.742 Y127.239 E-.05528
G1 X97.635 Y126.649 E-.22792
G1 X97.619 Y126.155 E-.18784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.995 J-.701 P1  F30000
G1 X96.517 Y127.718 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G2 X96.718 Y127.496 I-.198 J-.381 E.00794
G1 X96.838 Y127.173 E.00893
G1 X96.873 Y126.622 E.01433
G1 X96.751 Y126.078 E.01447
G1 X96.617 Y125.786 E.00833
G2 X95.708 Y124.382 I-45.781 J28.625 E.04342
G3 X95.392 Y123.604 I7.621 J-3.552 E.02179
G1 X97.001 Y123.604 E.04176
G1 X97.001 Y123.726 E.00315
G1 X95.547 Y123.726 E.03774
G2 X96.212 Y124.925 I4.87 J-1.915 E.03568
G3 X96.721 Y125.726 I-6.887 J4.938 E.02465
G1 X96.959 Y126.376 E.01796
G1 X96.992 Y126.926 E.01429
G1 X96.899 Y127.386 E.01219
G1 X96.746 Y127.671 E.00839
G3 X95.832 Y127.594 I-.432 J-.34 E.02817
G3 X95.644 Y126.897 I1.369 J-.742 E.0189
G1 X95.766 Y126.891 E.00317
G1 X95.836 Y127.309 E.01101
G1 X95.95 Y127.557 E.00709
G2 X96.462 Y127.742 I.368 J-.221 E.01528
M204 S10000
; WIPE_START
G1 F24000
G1 X96.61 Y127.65 E-.06613
G1 X96.718 Y127.496 E-.07158
G1 X96.838 Y127.173 E-.13078
G1 X96.873 Y126.622 E-.20979
G1 X96.751 Y126.078 E-.21183
G1 X96.674 Y125.911 E-.06988
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.62 J-1.047 P1  F30000
G1 X94.934 Y126.941 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X90.877 Y130.227 E.1355
G1 X90.737 Y130.055 E.00575
G1 X94.795 Y126.769 E.1355
G1 X94.897 Y126.895 E.00419
M204 S10000
; WIPE_START
G1 F24000
G1 X93.357 Y128.171 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.189 J.259 P1  F30000
G1 X96.127 Y140.877 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X90.985 Y147.227 E.21205
G1 X90.811 Y147.087 E.00579
G1 X95.954 Y140.738 E.21205
G1 X96.08 Y140.839 E.00419
M204 S10000
; WIPE_START
G1 F24000
G1 X94.833 Y142.403 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.089 J.544 P1  F30000
G1 X96.916 Y138.23 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X97.357 Y138.536 E.01393
G2 X98.641 Y138.33 I.508 J-.933 E.03633
G1 X98.828 Y138.067 E.00837
G1 X98.935 Y137.733 E.0091
G1 X98.947 Y137.253 E.01245
G1 X98.839 Y136.834 E.01125
G2 X98.171 Y136.162 I-1.177 J.502 E.0252
G1 X97.827 Y136.09 E.00912
G1 X97.377 Y136.125 E.01172
G1 X97.082 Y136.245 E.00825
G2 X96.614 Y136.933 I.616 J.922 E.02214
G1 X96.494 Y136.922 E.00314
G1 X96.521 Y136.784 E.00365
G1 X96.673 Y136.473 E.00897
G1 X96.904 Y136.225 E.00881
G1 X97.173 Y136.069 E.00806
G1 X97.582 Y135.975 E.01091
G1 X97.832 Y135.985 E.00649
G3 X98.475 Y136.19 I-.001 J1.11 E.01779
G1 X98.758 Y136.466 E.01025
G1 X98.958 Y136.815 E.01042
G1 X99.067 Y137.249 E.01164
G1 X99.05 Y137.76 E.01324
G1 X98.932 Y138.117 E.00978
G1 X98.721 Y138.419 E.00955
G3 X97.826 Y138.784 I-.893 J-.91 E.02572
G1 X97.506 Y138.728 E.00843
G1 X96.75 Y138.336 E.0221
G1 X96.865 Y138.262 E.00355
M204 S10000
; WIPE_START
G1 F24000
G1 X97.357 Y138.536 E-.21377
G1 X97.651 Y138.644 E-.11918
G1 X97.954 Y138.664 E-.11511
G1 X98.258 Y138.595 E-.11868
G1 X98.505 Y138.453 E-.1082
G1 X98.641 Y138.33 E-.0698
G1 X98.664 Y138.297 E-.01525
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.924 J-.792 P1  F30000
G1 X97.093 Y140.132 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X98.865 Y140.132 E.04601
G1 X98.865 Y140.254 E.00315
G1 X96.991 Y140.254 E.04864
G1 X96.637 Y138.408 E.04878
G1 X96.746 Y138.339 E.00335
G1 X97.081 Y140.073 E.04586
M204 S10000
; WIPE_START
G1 F24000
G1 X98.865 Y140.132 E-.6784
G1 X98.865 Y140.254 E-.04616
G1 X98.772 Y140.254 E-.03543
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.11 J1.212 P1  F30000
G1 X105.599 Y140.871 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X99.473 Y146.907 E.2232
G1 X99.316 Y146.747 E.00581
G1 X105.444 Y140.713 E.2232
G1 X105.557 Y140.828 E.00418
M204 S10000
; WIPE_START
G1 F24000
G1 X104.142 Y142.242 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.071 J.577 P1  F30000
G1 X106.297 Y138.245 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G3 X106.243 Y138.159 I.814 J-.571 E.00263
G1 X106.354 Y138.122 E.00303
G1 X106.385 Y138.184 E.00178
G2 X107.793 Y138.217 I.717 J-.532 E.04213
G1 X107.951 Y137.964 E.00774
G1 X108.049 Y137.576 E.01038
G1 X108.037 Y137.122 E.01179
G1 X107.906 Y136.701 E.01145
G2 X107.288 Y136.138 I-1.008 J.487 E.02223
G1 X106.957 Y136.088 E.00868
G1 X106.594 Y136.135 E.00948
G1 X106.315 Y136.261 E.00795
G1 X106.047 Y136.505 E.00941
G1 X105.923 Y136.696 E.0059
G1 X105.748 Y137.215 E.01422
G1 X105.677 Y137.96 E.01941
G1 X105.731 Y138.861 E.02343
G1 X105.894 Y139.488 E.01682
G1 X106.095 Y139.848 E.01069
G1 X106.33 Y140.075 E.00848
G1 X106.596 Y140.209 E.00773
G1 X106.973 Y140.27 E.00991
G1 X107.316 Y140.23 E.00898
G2 X107.929 Y139.555 I-.212 J-.808 E.02501
G1 X108.049 Y139.57 E.00314
G1 X107.997 Y139.77 E.00536
G1 X107.833 Y140.037 E.00813
G3 X107.111 Y140.383 I-.831 J-.807 E.02123
G1 X106.715 Y140.361 E.01029
G1 X106.413 Y140.261 E.00824
G1 X106.123 Y140.055 E.00923
G1 X106.009 Y139.928 E.00444
G1 X105.788 Y139.543 E.01151
G1 X105.593 Y138.721 E.02191
G1 X105.633 Y137.193 E.03968
G1 X105.794 Y136.688 E.01375
G1 X105.955 Y136.434 E.00781
G1 X106.256 Y136.159 E.01059
G1 X106.551 Y136.024 E.00841
G1 X106.913 Y135.97 E.0095
G1 X107.066 Y135.989 E.00401
G1 X107.301 Y136.019 E.00614
G1 X107.587 Y136.149 E.00816
G1 X107.697 Y136.232 E.00357
G3 X108.008 Y136.638 I-.894 J1.009 E.01336
G1 X108.154 Y137.102 E.01262
G1 X108.165 Y137.589 E.01263
G1 X108.069 Y137.984 E.01055
G1 X107.89 Y138.291 E.00924
G3 X106.332 Y138.293 I-.779 J-.617 E.04643
M204 S10000
; WIPE_START
G1 F24000
G1 X106.243 Y138.159 E-.06117
G1 X106.354 Y138.122 E-.04441
G1 X106.385 Y138.184 E-.02613
G1 X106.564 Y138.37 E-.09827
G1 X106.791 Y138.498 E-.09931
G1 X107.046 Y138.552 E-.09906
G1 X107.304 Y138.531 E-.09808
G1 X107.546 Y138.436 E-.09876
G1 X107.793 Y138.217 E-.12564
G1 X107.806 Y138.197 E-.00918
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.273 J1.186 P1  F30000
G1 X116.217 Y140.132 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X115.574 Y139.282 E.02766
G3 X114.423 Y136.044 I5.959 J-3.943 E.09006
G1 X114.547 Y136.042 E.00323
G1 X114.583 Y136.337 E.00771
G2 X114.733 Y137.126 I3.547 J-.264 E.02088
G1 X115.051 Y138.061 E.02564
G1 X115.296 Y138.572 E.01472
G1 X115.831 Y139.436 E.02636
G1 X116.349 Y140.057 E.02099
G1 X116.259 Y140.254 E.00562
G1 X113.756 Y140.254 E.06496
G1 X113.756 Y140.132 E.00315
G1 X116.157 Y140.132 E.06231
M204 S10000
; WIPE_START
G1 F24000
G1 X115.574 Y139.282 E-.39175
G1 X115.189 Y138.625 E-.28923
G1 X115.102 Y138.436 E-.07901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.079 J-.563 P1  F30000
G1 X113.59 Y141.331 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X109.095 Y146.883 E.18538
G1 X108.923 Y146.743 E.00575
G1 X113.417 Y141.191 E.18537
G1 X113.544 Y141.294 E.00423
M204 S10000
; WIPE_START
G1 F24000
G1 X112.298 Y142.858 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.144 J.414 P1  F30000
G1 X117.875 Y127.435 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X117.245 Y128.217 E.0293
G1 X116.636 Y128.635 E.02152
G1 X115.937 Y128.868 E.02148
G1 X115.2 Y128.892 E.02151
G1 X114.488 Y128.707 E.02145
G1 X113.854 Y128.332 E.0215
G1 X112.967 Y127.38 E.03795
G1 X112.967 Y128.817 E.04192
G1 X112.887 Y128.817 E.00233
G1 X112.887 Y121.471 E.21421
G1 X112.967 Y121.471 E.00233
G1 X112.967 Y126.331 E.14172
G1 X113.082 Y127.073 E.0219
G1 X113.423 Y127.761 E.02239
G1 X113.956 Y128.316 E.02243
G1 X114.631 Y128.683 E.02241
G1 X115.384 Y128.829 E.02238
G1 X116.149 Y128.742 E.02243
G1 X116.848 Y128.43 E.02233
G1 X117.422 Y127.919 E.02241
G1 X117.831 Y127.237 E.02317
G1 X117.831 Y121.471 E.16814
G1 X117.909 Y121.471 E.00227
G1 X117.909 Y127.235 E.16809
G1 X118.339 Y127.848 E.02182
G1 X118.903 Y128.284 E.02079
G1 X119.567 Y128.536 E.02072
G1 X120.28 Y128.585 E.02083
G1 X120.974 Y128.42 E.02078
G1 X121.588 Y128.06 E.02076
G1 X122.071 Y127.536 E.02078
G1 X122.378 Y126.894 E.02077
G1 X122.483 Y126.205 E.02031
G1 X122.483 Y121.471 E.13804
G1 X122.563 Y121.471 E.00233
G1 X122.563 Y126.174 E.13714
G1 X122.463 Y126.872 E.02057
G1 X122.181 Y127.506 E.02023
G1 X121.735 Y128.035 E.02016
G1 X121.16 Y128.42 E.02017
G1 X120.499 Y128.632 E.02026
G1 X119.808 Y128.652 E.02015
G1 X119.137 Y128.481 E.02019
G3 X118.54 Y128.131 I40.575 J-69.875 E.02017
G1 X117.917 Y127.479 E.02632
M204 S10000
; WIPE_START
G1 F24000
G1 X117.245 Y128.217 E-.37959
G1 X116.636 Y128.635 E-.28044
G1 X116.387 Y128.718 E-.09998
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.178 J1.204 P1  F30000
G1 X125.467 Y127.38 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X125.467 Y128.817 E.04192
G1 X125.387 Y128.817 E.00233
G1 X125.387 Y121.471 E.21421
G1 X125.467 Y121.471 E.00233
G1 X125.467 Y126.331 E.14172
G1 X125.582 Y127.073 E.0219
G1 X125.923 Y127.761 E.02239
G1 X126.456 Y128.316 E.02243
G1 X127.131 Y128.683 E.02241
G1 X127.884 Y128.829 E.02238
G1 X128.647 Y128.742 E.02237
G1 X129.35 Y128.43 E.02244
G1 X129.925 Y127.918 E.02244
G1 X130.329 Y127.237 E.0231
G1 X130.329 Y121.471 E.16812
G1 X130.409 Y121.471 E.00233
G1 X130.409 Y127.235 E.16809
G1 X130.839 Y127.848 E.02182
G1 X131.403 Y128.284 E.0208
G1 X132.069 Y128.536 E.02078
G1 X132.778 Y128.585 E.0207
G1 X133.474 Y128.42 E.02085
G1 X134.088 Y128.06 E.02076
G1 X134.571 Y127.536 E.02078
G1 X134.878 Y126.894 E.02077
G1 X134.983 Y126.205 E.02031
G1 X134.983 Y121.471 E.13804
G1 X135.061 Y121.471 E.00227
G1 X135.061 Y126.174 E.13715
G1 X134.963 Y126.873 E.02056
G1 X134.681 Y127.506 E.02023
G1 X134.235 Y128.035 E.02016
G1 X133.658 Y128.42 E.02023
G1 X133.001 Y128.632 E.02015
G1 X132.308 Y128.652 E.02021
G1 X131.637 Y128.481 E.02019
G3 X131.041 Y128.131 I40.456 J-69.671 E.02017
G1 X130.378 Y127.435 E.02802
G1 X129.745 Y128.217 E.02935
G1 X129.138 Y128.635 E.02148
G1 X128.437 Y128.868 E.02153
G1 X127.702 Y128.892 E.02145
G1 X126.986 Y128.707 E.02156
G1 X126.354 Y128.332 E.02144
G1 X125.508 Y127.423 E.0362
M204 S10000
; WIPE_START
G1 F24000
G1 X125.467 Y128.817 E-.52981
G1 X125.387 Y128.817 E-.0304
G1 X125.387 Y128.291 E-.19979
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.198 J-.214 P1  F30000
G1 X123.616 Y138.204 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G1 X123.273 Y138.258 E.00902
G1 X122.927 Y138.211 E.00906
G1 X122.625 Y138.071 E.00864
G1 X122.37 Y137.848 E.00877
G3 X122.3 Y136.576 I.821 J-.684 E.03543
G1 X122.52 Y136.337 E.00845
G1 X122.805 Y136.166 E.00862
G1 X122.945 Y136.131 E.00375
G1 X123.141 Y136.081 E.00523
G1 X123.485 Y136.095 E.00894
G1 X123.815 Y136.212 E.0091
G3 X124.164 Y137.835 I-.498 J.956 E.04919
G1 X123.924 Y138.055 E.00845
G1 X123.67 Y138.178 E.00732
M204 S10000
G1 X123.809 Y138.546 F30000
M204 S5000
G1 F10480
G3 X124.247 Y139.279 I-.552 J.828 E.0229
G3 X122.876 Y138.45 I-.99 J.089 E.11371
G3 X123.2 Y138.38 I.346 J.82 E.00866
G3 X123.758 Y138.514 I.056 J.994 E.01509
M204 S10000
G1 X123.768 Y138.313 F30000
M204 S5000
G1 F10480
G1 X124.162 Y138.725 E.0148
G1 X124.311 Y139.021 E.00859
G1 X124.368 Y139.348 E.00861
G1 X124.328 Y139.676 E.00856
G1 X124.192 Y139.978 E.0086
G1 X123.975 Y140.225 E.00855
G1 X123.695 Y140.399 E.00856
G3 X123.378 Y140.483 I-9.308 J-34.709 E.00851
G1 X123.049 Y140.471 E.00855
G1 X122.742 Y140.362 E.00845
G1 X122.473 Y140.167 E.00862
G1 X122.277 Y139.905 E.00849
G1 X122.166 Y139.592 E.00862
G1 X122.149 Y139.263 E.00854
G1 X122.227 Y138.947 E.00846
G1 X122.402 Y138.66 E.00872
G1 X122.742 Y138.326 E.01236
G1 X122.288 Y137.934 E.01556
G1 X122.099 Y137.631 E.00928
G1 X122.011 Y137.296 E.00899
G1 X122.023 Y136.954 E.00888
G1 X122.137 Y136.625 E.00903
G1 X122.342 Y136.341 E.0091
G1 X122.635 Y136.119 E.00955
G1 X122.987 Y135.986 E.00974
G1 X123.374 Y135.963 E.01006
G1 X123.742 Y136.049 E.00982
M73 P96 R1
G1 X124.073 Y136.242 E.00995
G1 X124.307 Y136.494 E.00892
G1 X124.466 Y136.815 E.0093
G1 X124.519 Y137.155 E.00893
G1 X124.473 Y137.494 E.00887
G1 X124.327 Y137.812 E.0091
G3 X123.82 Y138.283 I-1.45 J-1.053 E.01807
M204 S10000
; WIPE_START
G1 F24000
G1 X124.162 Y138.725 E-.21273
G1 X124.311 Y139.021 E-.12573
G1 X124.368 Y139.348 E-.12611
G1 X124.328 Y139.676 E-.12539
G1 X124.192 Y139.978 E-.12588
G1 X124.115 Y140.065 E-.04417
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.695 J-.999 P1  F30000
G1 X122.497 Y141.191 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X122.67 Y141.331 E.00579
G1 X119.065 Y145.783 E.14866
G1 X118.893 Y145.643 E.00575
G1 X122.459 Y141.238 E.14709
M204 S10000
; WIPE_START
G1 F24000
G1 X122.67 Y141.331 E-.0878
G1 X121.557 Y142.706 E-.6722
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.192 J1.202 P1  F30000
G1 X130.946 Y141.21 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X131.087 Y141.304 E.00439
G1 X131.13 Y141.333 E.00135
G1 X128.757 Y144.865 E.11042
G1 X128.573 Y144.741 E.00574
G1 X130.913 Y141.259 E.10887
M204 S10000
; WIPE_START
G1 F24000
G1 X131.087 Y141.304 E-.06825
G1 X131.13 Y141.333 E-.01971
G1 X130.144 Y142.801 E-.67204
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.143 J.419 P1  F30000
G1 X131.931 Y137.926 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X132.014 Y138.025 E.00336
G1 X131.914 Y138.086 E.00303
G1 X131.854 Y138.014 E.00243
G1 X131.592 Y137.843 E.00812
G1 X131.335 Y137.769 E.00695
G1 X131.158 Y137.773 E.0046
G2 X130.571 Y137.995 I.029 J.966 E.01658
G1 X130.352 Y138.253 E.00878
G1 X130.222 Y138.561 E.00868
G1 X130.17 Y139.018 E.01195
G1 X130.222 Y139.439 E.01101
G1 X130.36 Y139.759 E.00903
G1 X130.581 Y140.016 E.00879
G1 X130.846 Y140.184 E.00814
G1 X131.141 Y140.263 E.00793
G1 X131.516 Y140.251 E.00974
G1 X131.825 Y140.143 E.00851
G2 X132.19 Y139.841 I-.622 J-1.123 E.01236
G1 X132.384 Y139.507 E.01
G1 X132.505 Y139.034 E.01267
G1 X132.548 Y138.29 E.01935
G1 X132.488 Y137.422 E.02259
G1 X132.377 Y136.973 E.01199
G1 X132.171 Y136.562 E.01195
G1 X131.921 Y136.308 E.00923
G1 X131.634 Y136.154 E.00845
G1 X131.294 Y136.09 E.00899
G1 X130.911 Y136.125 E.00997
G2 X130.297 Y136.8 I.21 J.808 E.02506
G1 X130.168 Y136.784 E.00337
G3 X130.908 Y136.005 I.979 J.19 E.02945
G1 X131.306 Y135.972 E.01036
G1 X131.45 Y136 E.00381
G1 X131.675 Y136.043 E.00593
G1 X132.024 Y136.235 E.01033
G1 X132.278 Y136.51 E.00972
G1 X132.492 Y136.937 E.0124
G1 X132.61 Y137.423 E.01299
G1 X132.635 Y138.952 E.03969
G1 X132.491 Y139.555 E.01609
G1 X132.27 Y139.93 E.01128
G1 X131.995 Y140.179 E.00962
G1 X131.83 Y140.272 E.00493
G1 X131.495 Y140.374 E.00909
G1 X131.087 Y140.374 E.01057
G1 X130.758 Y140.273 E.00893
G1 X130.477 Y140.081 E.00884
G1 X130.234 Y139.775 E.01014
G1 X130.09 Y139.385 E.0108
G1 X130.053 Y138.876 E.01323
G1 X130.139 Y138.425 E.01191
G1 X130.318 Y138.096 E.00971
G1 X130.578 Y137.841 E.00948
G1 X130.865 Y137.696 E.00834
G1 X131.2 Y137.644 E.0088
G1 X131.509 Y137.686 E.00809
G1 X131.646 Y137.738 E.00379
G1 X131.881 Y137.893 E.0073
M204 S10000
; WIPE_START
G1 F24000
G1 X132.014 Y138.025 E-.07129
G1 X131.914 Y138.086 E-.04439
G1 X131.854 Y138.014 E-.03552
G1 X131.592 Y137.843 E-.11886
G1 X131.335 Y137.769 E-.10173
G1 X131.158 Y137.773 E-.06735
G1 X131.032 Y137.776 E-.04771
G1 X130.805 Y137.846 E-.09036
G1 X130.571 Y137.995 E-.10545
G1 X130.439 Y138.15 E-.07733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.136 J.436 P1  F30000
G1 X137.821 Y118.899 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X136.069 Y118.899 E.05109
G1 X136.069 Y118.821 E.00227
G1 X137.901 Y118.821 E.05342
G1 X137.901 Y131.899 E.38135
G1 X136.069 Y131.899 E.05342
G1 X136.069 Y131.821 E.00227
G1 X137.821 Y131.821 E.05109
G1 X137.821 Y118.959 E.37505
M204 S10000
; WIPE_START
G1 F24000
G1 X136.069 Y118.899 E-.66615
G1 X136.069 Y118.821 E-.02964
G1 X136.238 Y118.821 E-.06421
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.189 J.259 P1  F30000
G1 X140.906 Y140.259 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G3 X140.733 Y140.168 I.077 J-.356 E.00514
G3 X140.416 Y139.452 I1.369 J-1.033 E.02048
G1 X140.325 Y138.614 E.02189
G1 X140.34 Y137.513 E.02857
G1 X140.463 Y136.72 E.02084
G1 X140.577 Y136.407 E.00863
G3 X140.927 Y136.095 I.518 J.228 E.01255
G1 X140.927 Y136.095 E0
G3 X141.234 Y136.194 I.064 J.326 E.00876
G3 X141.549 Y136.91 I-1.347 J1.02 E.02048
G1 X141.64 Y137.756 E.02207
G1 X141.63 Y138.838 E.02809
G1 X141.521 Y139.561 E.01896
G1 X141.356 Y140.003 E.01225
G1 X141.229 Y140.171 E.00547
G3 X140.965 Y140.267 I-.246 J-.268 E.00749
M204 S10000
G1 X141.038 Y140.385 F30000
M204 S5000
G1 F10480
G3 X140.594 Y140.192 I-.054 J-.485 E.01314
G1 X140.426 Y139.894 E.00888
G1 X140.302 Y139.487 E.01104
G1 X140.201 Y137.841 E.04281
G1 X140.338 Y136.719 E.02932
G1 X140.471 Y136.353 E.0101
G1 X140.618 Y136.133 E.00687
G3 X141.089 Y135.987 I.355 J.31 E.01345
G3 X141.369 Y136.162 I-.083 J.443 E.00878
G1 X141.54 Y136.466 E.00903
G1 X141.663 Y136.875 E.01109
G1 X141.765 Y138.527 E.04295
G1 X141.62 Y139.651 E.02941
G1 X141.474 Y140.036 E.01068
G3 X141.096 Y140.369 I-.576 J-.273 E.01346
M204 S10000
; WIPE_START
G1 F24000
G1 X140.879 Y140.377 E-.0824
G1 X140.764 Y140.337 E-.04626
G1 X140.594 Y140.192 E-.08498
G1 X140.426 Y139.894 E-.13001
G1 X140.302 Y139.487 E-.16162
G1 X140.261 Y138.818 E-.25474
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.559 J-1.081 P1  F30000
G1 X138.557 Y139.699 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X138.907 Y139.579 E.01079
G1 X138.907 Y136.069 E.10235
G1 X138.985 Y136.069 E.00227
G1 X138.985 Y140.121 E.11816
G1 X138.782 Y140.183 E.00618
G2 X138.157 Y139.358 I-5.291 J3.36 E.0302
G1 X137.982 Y139.222 E.00647
G1 X138.027 Y139.144 E.00261
G3 X138.521 Y139.651 I-1.761 J2.212 E.02069
M204 S10000
; WIPE_START
G1 F24000
G1 X138.907 Y139.579 E-.14904
G1 X138.907 Y137.971 E-.61096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.144 J.415 P1  F30000
G1 X140.113 Y141.296 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G1 X140.149 Y141.298 E.00093
G1 X140.335 Y141.309 E.00484
G1 X140.146 Y144.643 E.08667
G1 X139.926 Y144.631 E.00572
G1 X140.11 Y141.356 E.08512
M204 S10000
; WIPE_START
G1 F24000
G1 X140.149 Y141.298 E-.0266
G1 X140.335 Y141.309 E-.07084
G1 X140.237 Y143.05 E-.66255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.115 J1.211 P1  F30000
G1 X151.861 Y144.155 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X150.275 Y141.333 E.08401
G1 X150.468 Y141.225 E.00577
G1 X150.714 Y141.662 E.01302
G1 X152.053 Y144.047 E.07098
G1 X151.913 Y144.126 E.00417
M204 S10000
; WIPE_START
G1 F24000
G1 X150.901 Y142.401 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.158 J-.375 P1  F30000
G1 X149.834 Y139.105 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X149.882 Y139.13 E.00142
G3 X150.807 Y139.923 I-2.144 J3.437 E.03173
G1 X150.649 Y139.981 E.00436
G2 X150.067 Y139.397 I-167.601 J166.675 E.02141
G1 X149.78 Y139.223 E.0087
G1 X149.809 Y139.159 E.00181
M204 S10000
; WIPE_START
G1 F24000
G1 X149.882 Y139.13 E-.02986
G1 X150.131 Y139.294 E-.11343
G1 X150.364 Y139.48 E-.1133
G1 X150.807 Y139.923 E-.23777
G1 X150.649 Y139.981 E-.06384
G1 X150.274 Y139.605 E-.2018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.529 J1.096 P1  F30000
G1 X150.878 Y139.896 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X150.878 Y136.048 E.09987
G1 X150.999 Y136.048 E.00315
G1 X150.999 Y139.851 E.0987
G1 X150.934 Y139.876 E.00181
M204 S10000
; WIPE_START
G1 F24000
G1 X150.905 Y137.876 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.738 J-.968 P1  F30000
G1 X148.219 Y139.924 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X148.065 Y139.981 E.00428
G3 X147.483 Y139.397 I331.644 J-331.058 E.02139
G1 X147.196 Y139.222 E.00872
G1 X147.249 Y139.105 E.00334
M73 P96 R0
G1 X147.296 Y139.13 E.0014
G3 X148.18 Y139.878 I-2.072 J3.343 E.03017
M204 S10000
G1 X148.413 Y139.852 F30000
M204 S5000
G1 F10480
G1 X148.292 Y139.897 E.00336
G1 X148.292 Y136.048 E.09987
G1 X148.413 Y136.048 E.00315
G1 X148.413 Y139.792 E.09714
M204 S10000
; WIPE_START
G1 F24000
G1 X148.292 Y139.897 E-.06106
G1 X148.292 Y138.057 E-.69894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.024 J.657 P1  F30000
G1 X151.859 Y132.499 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X152.209 Y132.379 E.01079
G1 X152.209 Y128.871 E.1023
G1 X152.291 Y128.871 E.00239
G1 X152.291 Y132.913 E.11787
G1 X152.082 Y132.977 E.00636
G2 X151.459 Y132.158 I-4.892 J3.079 E.03005
G1 X151.284 Y132.022 E.00647
G1 X151.329 Y131.944 E.00263
G3 X151.823 Y132.451 I-1.724 J2.176 E.02071
M204 S10000
; WIPE_START
G1 F24000
G1 X152.209 Y132.379 E-.14897
G1 X152.209 Y130.771 E-.61103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.973 J.731 P1  F30000
G1 X153.563 Y128.97 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G1 X153.885 Y129.638 E.01925
G1 X154.595 Y130.622 E.03147
G1 X154.985 Y131.263 E.01948
G1 X155.131 Y131.67 E.01123
G1 X155.184 Y132.138 E.01222
G1 X155.131 Y132.501 E.00951
G1 X154.97 Y132.848 E.00995
G3 X153.816 Y133.039 I-.666 J-.446 E.03401
G1 X153.622 Y132.818 E.00764
G1 X153.477 Y132.493 E.00922
G1 X153.433 Y132.149 E.009
G1 X153.549 Y132.149 E.00299
G2 X153.856 Y132.918 I1.096 J.008 E.02203
G2 X154.878 Y132.771 I.45 J-.5 E.03057
G1 X155.011 Y132.49 E.00807
G2 X155.059 Y131.945 I-1.451 J-.403 E.01428
G1 X154.953 Y131.499 E.0119
G1 X154.872 Y131.303 E.00551
G1 X154.082 Y130.143 E.0364
G1 X153.593 Y129.317 E.02493
G3 X153.466 Y128.85 I1.784 J-.732 E.01258
G1 X155.071 Y128.85 E.04165
G1 X155.071 Y128.97 E.0031
G1 X153.623 Y128.97 E.03758
M204 S10000
; WIPE_START
G1 F24000
G1 X153.885 Y129.638 E-.27281
G1 X154.595 Y130.622 E-.46083
G1 X154.631 Y130.681 E-.02635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.814 J.904 P1  F30000
G1 X156.153 Y132.051 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X156.291 Y131.879 E.00572
G1 X157.399 Y132.776 E.03698
G1 X161.032 Y135.719 E.12135
G1 X160.893 Y135.891 E.00575
G1 X156.199 Y132.089 E.15676
M204 S10000
; WIPE_START
G1 F24000
G1 X156.291 Y131.879 E-.08681
G1 X157.399 Y132.776 E-.54153
G1 X157.668 Y132.994 E-.13165
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.207 J-.152 P1  F30000
G1 X156.27 Y121.865 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X158.265 Y121.976 E.05187
G1 X159.676 Y122.054 E.03668
G1 X159.663 Y122.276 E.00577
G1 X156.258 Y122.085 E.08851
G1 X156.266 Y121.925 E.00416
M204 S10000
; WIPE_START
G1 F24000
G1 X158.265 Y121.976 E-.75977
G1 X158.266 Y121.976 E-.00023
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.151 J-1.208 P1  F30000
G1 X154.756 Y122.415 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G3 X155.144 Y123.393 I-.978 J.955 E.02805
G1 X155.086 Y123.793 E.01048
G1 X154.948 Y124.081 E.00828
G3 X153.741 Y124.077 I-.602 J-.393 E.03717
G3 X153.535 Y123.473 I1.023 J-.686 E.01675
G1 X153.656 Y123.462 E.00315
G2 X153.997 Y124.18 I1.086 J-.076 E.02112
G2 X154.895 Y123.942 I.347 J-.505 E.02737
G1 X154.998 Y123.662 E.00773
G1 X155.023 Y123.257 E.01055
G1 X154.962 Y122.938 E.00842
G2 X154.342 Y122.405 I-.808 J.313 E.02209
G1 X154.336 Y122.334 E.00185
G2 X154.979 Y121.975 I.035 J-.691 E.02014
G1 X155.11 Y121.66 E.00886
G1 X155.159 Y121.189 E.01229
G2 X154.786 Y120.23 I-1.417 J-.001 E.02734
G2 X153.826 Y120.366 I-.423 J.468 E.0287
G2 X153.617 Y120.967 I1.243 J.768 E.01666
G1 X153.503 Y120.953 E.00298
G1 X153.588 Y120.574 E.01009
G1 X153.732 Y120.291 E.00823
G3 X154.391 Y119.955 I.627 J.414 E.02009
G3 X154.874 Y120.155 I-.041 J.781 E.01381
G1 X155.087 Y120.428 E.00899
G1 X155.227 Y120.784 E.00993
G1 X155.278 Y121.292 E.01325
G1 X155.208 Y121.749 E.012
G1 X155.053 Y122.078 E.00943
G1 X154.795 Y122.37 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X154.971 Y122.687 E-.13789
G1 X155.1 Y122.982 E-.12228
G1 X155.144 Y123.393 E-.1572
G1 X155.086 Y123.793 E-.15352
G1 X154.948 Y124.081 E-.12123
G1 X154.829 Y124.214 E-.06786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.215 J-1.198 P1  F30000
G1 X151.955 Y123.699 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X152.305 Y123.579 E.01079
G1 X152.305 Y120.071 E.1023
G1 X152.383 Y120.071 E.00227
G1 X152.383 Y124.124 E.11818
G1 X152.18 Y124.186 E.00618
G2 X151.555 Y123.357 I-5.179 J3.25 E.03033
G1 X151.382 Y123.222 E.00639
G1 X151.428 Y123.143 E.00265
G3 X151.919 Y123.651 I-1.828 J2.26 E.02065
M204 S10000
; WIPE_START
G1 F24000
G1 X152.305 Y123.579 E-.14904
G1 X152.305 Y121.971 E-.61096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.156 J-.379 P1  F30000
G1 X149.953 Y114.798 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X150.305 Y114.678 E.01082
G1 X150.305 Y111.171 E.10227
G1 X150.387 Y111.171 E.00239
G1 X150.387 Y115.22 E.11805
G1 X150.18 Y115.283 E.0063
G2 X149.557 Y114.456 I-5.224 J3.291 E.03022
G1 X149.382 Y114.321 E.00644
G1 X149.427 Y114.243 E.00264
G3 X149.918 Y114.749 I-1.71 J2.147 E.02062
M204 S10000
; WIPE_START
G1 F24000
G1 X150.305 Y114.678 E-.14942
G1 X150.305 Y113.072 E-.61058
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.588 J1.065 P1  F30000
G1 X151.528 Y112.396 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G1 X152.861 Y115.36 E.08435
G1 X152.75 Y115.411 E.00316
G1 X151.474 Y112.574 E.0807
G1 X151.474 Y112.274 E.00779
G1 X152.884 Y112.274 E.03659
G1 X152.884 Y111.15 E.02917
G1 X153.025 Y111.15 E.00367
G1 X153.025 Y112.274 E.02917
G1 X153.369 Y112.274 E.00893
G1 X153.369 Y112.396 E.00315
G1 X153.025 Y112.396 E.00893
G1 X153.025 Y113.972 E.0409
G1 X152.884 Y113.972 E.00367
G1 X152.884 Y112.396 E.0409
G1 X151.588 Y112.396 E.03363
M204 S10000
; WIPE_START
G1 F24000
G1 X152.377 Y114.234 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.811 J.907 P1  F30000
G1 X154.679 Y112.176 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X154.58 Y111.977 E.00575
G1 X159.265 Y109.663 E.1356
G1 X159.34 Y109.814 E.0044
G1 X159.363 Y109.861 E.00135
G1 X154.732 Y112.149 E.13404
M204 S10000
; WIPE_START
G1 F24000
G1 X154.58 Y111.977 E-.08726
G1 X156.168 Y111.193 E-.67274
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.068 J-1.215 P1  F30000
G1 X142.376 Y110.423 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X142.234 Y110.254 E.00572
G1 X150.694 Y103.155 E.28661
G1 X150.803 Y103.285 E.00439
G1 X150.836 Y103.324 E.00133
G1 X142.422 Y110.384 E.28505
M204 S10000
; WIPE_START
G1 F24000
G1 X142.234 Y110.254 E-.08686
G1 X143.591 Y109.116 E-.67314
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.144 J-.416 P1  F30000
G1 X141.366 Y115.234 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X142.531 Y115.234 E.03025
G1 X142.531 Y115.356 E.00315
G1 X141.26 Y115.356 E.03301
G1 X141.022 Y113.473 E.04925
G1 X141.136 Y113.42 E.00327
G1 X141.358 Y115.175 E.0459
M204 S10000
; WIPE_START
G1 F24000
G1 X142.531 Y115.234 E-.44635
G1 X142.531 Y115.356 E-.04616
G1 X141.828 Y115.356 E-.26749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.215 J.074 P1  F30000
G1 X141.924 Y113.764 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G2 X142.214 Y113.636 I.02 J-.347 E.00853
G1 X142.333 Y113.48 E.0051
G1 X142.479 Y113.143 E.00953
G1 X142.549 Y112.565 E.0151
G1 X142.497 Y112.02 E.01421
G1 X142.348 Y111.592 E.01178
G2 X142.08 Y111.254 I-.748 J.318 E.01133
G2 X141.473 Y111.37 I-.235 J.418 E.01744
G1 X141.329 Y111.601 E.00705
G1 X141.219 Y112.023 E.01131
G1 X141.098 Y112.015 E.00313
G1 X141.238 Y111.518 E.01339
G1 X141.402 Y111.27 E.00772
G3 X141.891 Y111.076 I.43 J.371 E.0142
G3 X142.276 Y111.27 I-.045 J.568 E.01147
G3 X142.572 Y111.835 I-1.146 J.961 E.0167
G1 X142.67 Y112.531 E.01822
G1 X142.59 Y113.183 E.01704
G1 X142.428 Y113.553 E.01049
G3 X141.941 Y113.886 I-.57 J-.311 E.0159
G3 X141.701 Y113.812 I.005 J-.44 E.0066
G1 X141.204 Y113.389 E.01696
G1 X141.37 Y113.312 E.00477
G1 X141.717 Y113.68 E.01314
G2 X141.865 Y113.755 I.226 J-.264 E.00432
M204 S10000
; WIPE_START
G1 F24000
G1 X142.019 Y113.757 E-.05887
G1 X142.108 Y113.722 E-.03623
G1 X142.214 Y113.636 E-.05181
G1 X142.333 Y113.48 E-.07463
G1 X142.479 Y113.143 E-.13947
G1 X142.549 Y112.565 E-.22114
G1 X142.505 Y112.1 E-.17785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.805 J-.912 P1  F30000
G1 X139.447 Y114.798 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F10480
G1 X139.799 Y114.678 E.01082
G1 X139.799 Y111.171 E.10227
G1 X139.881 Y111.171 E.00239
G1 X139.881 Y115.233 E.11844
G1 X139.679 Y115.293 E.00614
G2 X139.052 Y114.457 I-5.266 J3.297 E.03051
G1 X138.88 Y114.322 E.00637
G1 X138.926 Y114.244 E.00264
G3 X139.412 Y114.749 I-1.71 J2.129 E.0205
M204 S10000
; WIPE_START
G1 F24000
G1 X139.799 Y114.678 E-.14934
G1 X139.799 Y113.071 E-.61066
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.186 J-1.203 P1  F30000
G1 X129.255 Y114.699 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X129.605 Y114.579 E.01079
G1 X129.605 Y111.069 E.10235
G1 X129.685 Y111.069 E.00233
G1 X129.685 Y115.124 E.11823
G1 X129.48 Y115.187 E.00623
G2 X128.855 Y114.357 I-5.18 J3.251 E.03034
G1 X128.682 Y114.222 E.00639
G1 X128.727 Y114.144 E.00261
G3 X129.219 Y114.651 I-1.77 J2.211 E.02064
M204 S10000
; WIPE_START
G1 F24000
G1 X129.605 Y114.579 E-.149
G1 X129.605 Y112.971 E-.611
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.887 J.833 P1  F30000
G1 X131.763 Y115.269 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F10480
G2 X132.067 Y115.111 I-.018 J-.407 E.0092
G1 X132.187 Y114.903 E.00621
G1 X132.263 Y114.571 E.00883
G1 X132.384 Y114.581 E.00315
G1 X132.288 Y114.964 E.01025
G3 X131.915 Y115.365 I-.663 J-.244 E.01459
G3 X131.347 Y115.204 I-.158 J-.524 E.01617
G3 X131.05 Y114.633 I1.037 J-.903 E.01686
G1 X130.875 Y113.17 E.03824
G1 X130.993 Y111.811 E.03541
G1 X131.147 Y111.391 E.0116
G3 X131.492 Y111.023 I.873 J.473 E.01323
G3 X131.826 Y110.987 I.225 J.519 E.00886
G3 X132.193 Y111.266 I-.154 J.583 E.01226
G1 X132.356 Y111.619 E.01009
G1 X132.468 Y112.334 E.01878
G1 X132.394 Y113.017 E.01783
G1 X132.238 Y113.383 E.01032
G3 X131.57 Y113.68 I-.567 J-.374 E.02002
G1 X131.631 Y113.567 E.00334
G2 X132.139 Y113.321 I.073 J-.498 E.01555
G1 X132.282 Y112.977 E.00967
G1 X132.351 Y112.386 E.01546
G1 X132.291 Y111.843 E.01418
G2 X131.96 Y111.176 I-1.325 J.243 E.01956
G2 X131.43 Y111.209 I-.246 J.32 E.01503
G2 X131.24 Y111.47 I.974 J.907 E.00839
G1 X131.104 Y111.861 E.01073
G1 X131.009 Y112.557 E.01823
G1 X131.014 Y113.661 E.02867
G1 X131.136 Y114.499 E.02198
G1 X131.279 Y114.896 E.01095
G1 X131.43 Y115.121 E.00702
G2 X131.703 Y115.267 I.315 J-.258 E.00825
M204 S10000
; WIPE_START
G1 F24000
G1 X131.877 Y115.254 E-.06657
G1 X131.969 Y115.206 E-.03922
G1 X132.067 Y115.111 E-.05215
G1 X132.187 Y114.903 E-.09096
G1 X132.263 Y114.571 E-.12933
G1 X132.384 Y114.581 E-.04611
G1 X132.288 Y114.964 E-.15015
G1 X132.153 Y115.192 E-.10072
G1 X132.041 Y115.3 E-.05875
G1 X131.981 Y115.331 E-.02603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.198 J-.212 P1  F30000
G1 X131.08 Y110.244 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F10480
G1 X132.774 Y103.8 E.17291
G1 X132.987 Y103.856 E.00574
G1 X131.294 Y110.3 E.17291
G1 X131.138 Y110.259 E.00418
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.629 Y108.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/10
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I-.125 J-1.211 P1  F30000
G1 X96.407 Y111.946 Z2.2
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X96.35 Y112.16 E.00575
G1 X91.144 Y110.792 E.1397
G1 X91.2 Y110.578 E.00574
G1 X91.311 Y110.607 E.00298
G1 X96.349 Y111.931 E.13519
M204 S10000
G1 X95.76 Y111.986 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X96.378 Y111.986 E.00215
G1 X95.917 Y111.836 F30000
G1 F3600
G1 X95.189 Y111.836 E.00253
G1 X94.618 Y111.686 F30000
G1 F3600
G1 X95.346 Y111.686 E.00253
G1 X94.775 Y111.536 F30000
G1 F3600
G1 X94.047 Y111.536 E.00253
G1 X93.476 Y111.386 F30000
G1 F3600
G1 X94.203 Y111.386 E.00253
G1 X93.632 Y111.236 F30000
G1 F3600
G1 X92.905 Y111.236 E.00253
G1 X92.334 Y111.086 F30000
G1 F3600
G1 X93.061 Y111.086 E.00253
G1 X92.49 Y110.936 F30000
G1 F3600
G1 X91.763 Y110.936 E.00253
G1 X91.192 Y110.786 F30000
G1 F3600
G1 X91.919 Y110.786 E.00253
; WIPE_START
G1 F24000
G1 X91.192 Y110.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.026 J1.217 P1  F30000
G1 X114.999 Y110.27 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X114.778 Y110.27 E.00575
G1 X114.778 Y104.806 E.14179
G1 X114.999 Y104.806 E.00575
G1 X114.999 Y110.21 E.14023
M204 S10000
G1 X114.981 Y110.036 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X114.864 Y110.036 E.00041
G1 X114.864 Y109.886 E.00052
G1 X114.914 Y109.886 E.00017
G1 X114.914 Y109.736 E.00052
G1 X114.864 Y109.736 E.00017
G1 X114.864 Y109.586 E.00052
G1 X114.914 Y109.586 E.00017
G1 X114.914 Y109.436 E.00052
G1 X114.864 Y109.436 E.00017
G1 X114.864 Y109.286 E.00052
G1 X114.914 Y109.286 E.00017
G1 X114.914 Y109.136 E.00052
G1 X114.864 Y109.136 E.00017
G1 X114.864 Y108.986 E.00052
G1 X114.914 Y108.986 E.00017
G1 X114.914 Y108.836 E.00052
G1 X114.864 Y108.836 E.00017
G1 X114.864 Y108.686 E.00052
G1 X114.914 Y108.686 E.00017
G1 X114.914 Y108.536 E.00052
G1 X114.864 Y108.536 E.00017
G1 X114.864 Y108.386 E.00052
G1 X114.914 Y108.386 E.00017
G1 X114.914 Y108.236 E.00052
G1 X114.864 Y108.236 E.00017
G1 X114.864 Y108.086 E.00052
G1 X114.914 Y108.086 E.00017
G1 X114.914 Y107.936 E.00052
G1 X114.864 Y107.936 E.00017
G1 X114.864 Y107.786 E.00052
G1 X114.914 Y107.786 E.00017
G1 X114.914 Y107.636 E.00052
G1 X114.864 Y107.636 E.00017
G1 X114.864 Y107.486 E.00052
G1 X114.914 Y107.486 E.00017
G1 X114.914 Y107.336 E.00052
G1 X114.864 Y107.336 E.00017
G1 X114.864 Y107.186 E.00052
G1 X114.914 Y107.186 E.00017
G1 X114.914 Y107.036 E.00052
G1 X114.864 Y107.036 E.00017
G1 X114.864 Y106.886 E.00052
G1 X114.914 Y106.886 E.00017
G1 X114.914 Y106.736 E.00052
G1 X114.864 Y106.736 E.00017
G1 X114.864 Y106.586 E.00052
G1 X114.914 Y106.586 E.00017
G1 X114.914 Y106.436 E.00052
G1 X114.864 Y106.436 E.00017
G1 X114.864 Y106.286 E.00052
G1 X114.914 Y106.286 E.00017
G1 X114.914 Y106.136 E.00052
G1 X114.864 Y106.136 E.00017
G1 X114.864 Y105.986 E.00052
G1 X114.914 Y105.986 E.00017
G1 X114.914 Y105.836 E.00052
G1 X114.864 Y105.836 E.00017
G1 X114.864 Y105.686 E.00052
G1 X114.914 Y105.686 E.00017
G1 X114.914 Y105.536 E.00052
G1 X114.864 Y105.536 E.00017
G1 X114.864 Y105.386 E.00052
G1 X114.914 Y105.386 E.00017
G1 X114.914 Y105.236 E.00052
G1 X114.864 Y105.236 E.00017
G1 X114.864 Y105.086 E.00052
G1 X114.914 Y105.086 E.00017
G1 X114.914 Y104.936 E.00052
G1 X114.796 Y104.936 E.00041
; WIPE_START
G1 F24000
G1 X114.914 Y104.936 E-.04466
G1 X114.914 Y105.086 E-.057
G1 X114.864 Y105.086 E-.01901
G1 X114.864 Y105.236 E-.057
G1 X114.914 Y105.236 E-.01901
G1 X114.914 Y105.386 E-.057
G1 X114.864 Y105.386 E-.01901
G1 X114.864 Y105.536 E-.057
G1 X114.914 Y105.536 E-.01901
G1 X114.914 Y105.686 E-.057
G1 X114.864 Y105.686 E-.01901
G1 X114.864 Y105.836 E-.057
G1 X114.914 Y105.836 E-.01901
G1 X114.914 Y105.986 E-.057
G1 X114.864 Y105.986 E-.01901
G1 X114.864 Y106.136 E-.057
G1 X114.914 Y106.136 E-.01901
G1 X114.914 Y106.286 E-.057
G1 X114.864 Y106.286 E-.01901
G1 X114.864 Y106.368 E-.03125
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.19 J.257 P1  F30000
G1 X116.775 Y115.234 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X116.143 Y113.754 E.04177
G1 X115.769 Y112.265 E.03986
G3 X115.644 Y111.148 I7.213 J-1.371 E.02919
G1 X115.764 Y111.146 E.00311
G1 X115.888 Y112.251 E.02885
G2 X116.233 Y113.592 I12.685 J-2.548 E.03595
G1 X116.295 Y113.832 E.00642
G1 X116.678 Y114.742 E.02563
G1 X117.019 Y115.356 E.01822
G1 X115.214 Y115.356 E.04685
G1 X115.214 Y115.234 E.00315
G1 X116.715 Y115.234 E.03897
M204 S10000
; WIPE_START
G1 F24000
G1 X116.143 Y113.754 E-.60302
G1 X116.042 Y113.354 E-.15698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.61 J-1.053 P1  F30000
G1 X113.551 Y114.798 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.903 Y114.678 E.01082
G1 X113.903 Y111.171 E.10227
G1 X113.985 Y111.171 E.00239
G1 X113.985 Y115.224 E.11818
G1 X113.78 Y115.287 E.00623
G2 X113.155 Y114.457 I-5.177 J3.249 E.03032
G1 X112.982 Y114.32 E.00644
G1 X113.026 Y114.243 E.0026
G3 X113.516 Y114.749 I-1.662 J2.099 E.02059
M204 S10000
G1 X113.987 Y115.136 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X113.758 Y115.136 E.0008
G1 X113.657 Y114.986 E.00063
G1 X113.92 Y114.986 E.00091
G1 X113.92 Y114.836 E.00052
G1 X113.456 Y114.836 E.00161
; WIPE_START
G1 F24000
G1 X113.92 Y114.836 E-.27406
G1 X113.92 Y114.986 E-.08863
G1 X113.657 Y114.986 E-.15506
G1 X113.758 Y115.136 E-.10667
G1 X113.987 Y115.136 E-.13558
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.182 J-.29 P1  F30000
G1 X109.901 Y131.821 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X111.649 Y131.821 E.05097
G1 X111.649 Y131.899 E.00227
G1 X109.819 Y131.899 E.05336
G1 X109.819 Y118.821 E.38135
G1 X111.649 Y118.821 E.05336
G1 X111.649 Y118.899 E.00227
G1 X109.901 Y118.899 E.05097
G1 X109.901 Y131.761 E.37505
M204 S10000
; WIPE_START
G1 F24000
G1 X111.649 Y131.821 E-.66463
G1 X111.649 Y131.899 E-.02964
G1 X111.476 Y131.899 E-.06573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.141 J-.422 P1  F30000
G1 X105.153 Y114.799 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X105.503 Y114.679 E.01079
G1 X105.503 Y111.171 E.1023
G1 X105.583 Y111.171 E.00233
G1 X105.583 Y115.227 E.11828
G1 X105.38 Y115.289 E.00617
G2 X104.754 Y114.457 I-5.255 J3.308 E.0304
G1 X104.582 Y114.321 E.00638
G1 X104.627 Y114.244 E.00261
G3 X105.117 Y114.751 I-1.775 J2.208 E.02061
M204 S10000
G1 X105.585 Y115.136 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X105.356 Y115.136 E.0008
G1 X105.255 Y114.986 E.00063
G1 X105.518 Y114.986 E.00091
G1 X105.518 Y114.836 E.00052
G1 X105.054 Y114.836 E.00161
; WIPE_START
G1 F24000
G1 X105.518 Y114.836 E-.2741
G1 X105.518 Y114.986 E-.08864
G1 X105.255 Y114.986 E-.15506
G1 X105.356 Y115.136 E-.10676
G1 X105.585 Y115.136 E-.13544
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.781 J.933 P1  F30000
G1 X107.453 Y113.573 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X107.67 Y113.574 I.106 J.524 E.00569
G3 X108.039 Y113.922 I-.272 J.657 E.01345
G1 X108.141 Y114.24 E.00868
G1 X108.155 Y114.645 E.0105
G1 X108.058 Y115.007 E.00972
G1 X107.935 Y115.208 E.00613
G3 X107.564 Y115.41 I-.419 J-.327 E.01128
G3 X107.087 Y115.048 I.075 J-.594 E.01626
G1 X106.982 Y114.732 E.00865
G1 X106.971 Y114.325 E.01057
G1 X107.067 Y113.965 E.00967
G3 X107.399 Y113.599 I.685 J.288 E.01308
M204 S10000
G1 X107.647 Y113.431 F30000
M204 S5000
G1 F12000
G3 X107.139 Y113.176 I-.059 J-.516 E.01561
G1 X106.991 Y112.882 E.00856
G1 X106.906 Y112.41 E.01243
G1 X106.959 Y111.894 E.01347
G1 X107.103 Y111.548 E.00973
G3 X107.507 Y111.238 I.566 J.321 E.01358
G3 X107.685 Y111.251 I.065 J.347 E.00467
G3 X108.089 Y111.67 I-.345 J.737 E.01546
G1 X108.206 Y112.076 E.01098
G1 X108.206 Y112.599 E.01355
G1 X108.078 Y113.026 E.01158
G1 X107.915 Y113.271 E.00763
M73 P97 R0
G3 X107.704 Y113.414 I-.387 J-.344 E.00668
M204 S10000
G1 X107.253 Y113.514 F30000
M204 S5000
G1 F12000
G1 X106.99 Y113.164 E.01137
G1 X106.836 Y112.771 E.01095
G1 X106.785 Y112.338 E.01132
G1 X106.841 Y111.878 E.01202
G1 X107.006 Y111.483 E.01111
G1 X107.192 Y111.262 E.0075
G3 X107.661 Y111.125 I.392 J.473 E.01302
G3 X108.111 Y111.466 I-.205 J.74 E.01502
G1 X108.268 Y111.812 E.00985
G1 X108.342 Y112.288 E.01251
G1 X108.289 Y112.782 E.01291
G1 X108.123 Y113.189 E.01141
G1 X107.883 Y113.498 E.01016
G1 X108.133 Y113.849 E.01119
G1 X108.253 Y114.194 E.00947
G1 X108.274 Y114.631 E.01136
G1 X108.174 Y115.037 E.01086
G1 X108.011 Y115.301 E.00806
G3 X107.121 Y115.311 I-.449 J-.346 E.02656
G1 X106.982 Y115.105 E.00645
G1 X106.867 Y114.754 E.0096
G1 X106.853 Y114.317 E.01134
G1 X106.96 Y113.916 E.01077
G3 X107.211 Y113.556 I1.224 J.584 E.01143
M204 S10000
G1 X107.255 Y113.486 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X107.869 Y113.486 E.00214
; WIPE_START
G1 F24000
G1 X107.255 Y113.486 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.178 J-.306 P1  F30000
G1 X106.455 Y110.406 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X99.852 Y103.791 E.24255
G1 X100.009 Y103.635 E.00574
G1 X100.019 Y103.645 E.00038
G1 X106.613 Y110.249 E.24218
G1 X106.498 Y110.363 E.00422
M204 S10000
G1 X106.525 Y110.186 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X106.357 Y110.186 E.00058
G1 X106.207 Y110.036 E.00074
G1 X106.279 Y110.036 E.00025
G1 X106.13 Y109.886 E.00074
G1 X106.058 Y109.886 E.00025
G1 X105.908 Y109.736 E.00074
G1 X105.98 Y109.736 E.00025
G1 X105.83 Y109.586 E.00074
G1 X105.758 Y109.586 E.00025
G1 X105.608 Y109.436 E.00074
G1 X105.68 Y109.436 E.00025
G1 X105.53 Y109.286 E.00074
G1 X105.459 Y109.286 E.00025
G1 X105.309 Y109.136 E.00074
G1 X105.381 Y109.136 E.00025
G1 X105.231 Y108.986 E.00074
G1 X105.159 Y108.986 E.00025
G1 X105.009 Y108.836 E.00074
G1 X105.081 Y108.836 E.00025
G1 X104.931 Y108.686 E.00074
G1 X104.86 Y108.686 E.00025
G1 X104.71 Y108.536 E.00074
G1 X104.781 Y108.536 E.00025
G1 X104.632 Y108.386 E.00074
G1 X104.56 Y108.386 E.00025
G1 X104.41 Y108.236 E.00074
G1 X104.482 Y108.236 E.00025
G1 X104.332 Y108.086 E.00074
G1 X104.261 Y108.086 E.00025
G1 X104.111 Y107.936 E.00074
G1 X104.182 Y107.936 E.00025
G1 X104.033 Y107.786 E.00074
G1 X103.961 Y107.786 E.00025
G1 X103.812 Y107.636 E.00074
G1 X103.883 Y107.636 E.00025
G1 X103.733 Y107.486 E.00074
G1 X103.662 Y107.486 E.00025
G1 X103.512 Y107.336 E.00074
G1 X103.583 Y107.336 E.00025
G1 X103.433 Y107.186 E.00074
G1 X103.362 Y107.186 E.00025
G1 X103.213 Y107.036 E.00074
G1 X103.284 Y107.036 E.00025
G1 X103.134 Y106.886 E.00074
G1 X103.063 Y106.886 E.00025
G1 X102.913 Y106.736 E.00074
G1 X102.984 Y106.736 E.00025
G1 X102.834 Y106.586 E.00074
G1 X102.763 Y106.586 E.00025
G1 X102.614 Y106.436 E.00074
G1 X102.684 Y106.436 E.00025
G1 X102.535 Y106.286 E.00074
G1 X102.464 Y106.286 E.00025
G1 X102.314 Y106.136 E.00074
G1 X102.385 Y106.136 E.00025
G1 X102.235 Y105.986 E.00074
G1 X102.164 Y105.986 E.00025
G1 X102.015 Y105.836 E.00074
G1 X102.085 Y105.836 E.00025
G1 X101.936 Y105.686 E.00074
G1 X101.865 Y105.686 E.00025
G1 X101.715 Y105.536 E.00074
G1 X101.786 Y105.536 E.00025
G1 X101.636 Y105.386 E.00074
G1 X101.565 Y105.386 E.00025
G1 X101.416 Y105.236 E.00074
G1 X101.486 Y105.236 E.00025
G1 X101.336 Y105.086 E.00074
G1 X101.266 Y105.086 E.00025
G1 X101.116 Y104.936 E.00074
G1 X101.187 Y104.936 E.00024
G1 X101.037 Y104.786 E.00074
G1 X100.966 Y104.786 E.00024
G1 X100.817 Y104.636 E.00074
G1 X100.887 Y104.636 E.00024
G1 X100.737 Y104.486 E.00074
G1 X100.667 Y104.486 E.00024
G1 X100.517 Y104.336 E.00074
G1 X100.587 Y104.336 E.00024
G1 X100.438 Y104.186 E.00074
G1 X100.368 Y104.186 E.00024
G1 X100.218 Y104.036 E.00074
G1 X100.288 Y104.036 E.00024
G1 X100.138 Y103.886 E.00074
G1 X99.973 Y103.886 E.00058
; WIPE_START
G1 F24000
G1 X100.138 Y103.886 E-.06287
G1 X100.288 Y104.036 E-.08055
G1 X100.218 Y104.036 E-.02664
G1 X100.368 Y104.186 E-.08054
G1 X100.438 Y104.186 E-.02666
G1 X100.587 Y104.336 E-.08055
G1 X100.517 Y104.336 E-.02668
G1 X100.667 Y104.486 E-.08054
G1 X100.737 Y104.486 E-.0267
G1 X100.887 Y104.636 E-.08055
G1 X100.817 Y104.636 E-.02672
G1 X100.966 Y104.786 E-.08054
G1 X101.037 Y104.786 E-.02673
G1 X101.137 Y104.886 E-.05373
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.202 J-.189 P1  F30000
G1 X99.46 Y115.567 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X99.753 Y115.41 I-.022 J-.393 E.00892
G1 X99.905 Y115.192 E.00689
G1 X100.037 Y114.842 E.0097
G1 X100.134 Y114.165 E.01776
G1 X100.14 Y113.132 E.0268
G1 X100.034 Y112.241 E.02329
G1 X99.846 Y111.72 E.01438
G2 X99.495 Y111.402 I-.609 J.32 E.01253
G2 X99.073 Y111.562 I-.105 J.361 E.01256
G1 X98.958 Y111.779 E.00637
G1 X98.898 Y112.085 E.00809
G1 X98.767 Y112.074 E.0034
G1 X98.78 Y111.98 E.00246
G1 X98.907 Y111.604 E.0103
G3 X99.251 Y111.288 I.573 J.278 E.01241
G3 X99.414 Y111.272 I.115 J.335 E.00429
G3 X99.822 Y111.484 I-.056 J.607 E.01224
G1 X100.008 Y111.782 E.00912
G1 X100.15 Y112.208 E.01165
G1 X100.267 Y113.8 E.04141
G1 X100.148 Y114.893 E.02855
G1 X100.003 Y115.26 E.01022
G1 X99.829 Y115.503 E.00775
G3 X99.005 Y115.455 I-.394 J-.34 E.02476
G1 X98.839 Y115.17 E.00854
G1 X98.714 Y114.692 E.01284
G1 X98.722 Y113.844 E.022
G1 X98.862 Y113.38 E.01258
G1 X99.037 Y113.113 E.00829
G3 X99.592 Y113.012 I.333 J.255 E.01607
G1 X99.498 Y113.094 E.00326
G2 X99.195 Y113.127 I-.12 J.313 E.00821
G1 X99.079 Y113.246 E.00432
G1 X98.923 Y113.536 E.00854
G1 X98.815 Y114.059 E.01386
G1 X98.836 Y114.715 E.01705
G1 X98.975 Y115.188 E.01279
G1 X99.13 Y115.42 E.00725
G2 X99.4 Y115.566 I.307 J-.247 E.00817
M204 S10000
; WIPE_START
G1 F24000
G1 X99.562 Y115.548 E-.06204
G1 X99.753 Y115.41 E-.08958
G1 X99.905 Y115.192 E-.1009
G1 X100.037 Y114.842 E-.142
G1 X100.134 Y114.165 E-.25998
G1 X100.136 Y113.887 E-.10549
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.413 J-1.145 P1  F30000
G1 X97.053 Y114.999 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.403 Y114.879 E.01079
G1 X97.403 Y111.369 E.10235
G1 X97.483 Y111.369 E.00233
G1 X97.483 Y115.427 E.11834
G1 X97.28 Y115.489 E.00616
G2 X96.653 Y114.657 I-5.232 J3.29 E.03042
G1 X96.482 Y114.523 E.00634
G1 X96.527 Y114.446 E.00259
G3 X97.017 Y114.951 I-1.711 J2.153 E.02058
M204 S10000
G1 X97.485 Y115.286 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X97.223 Y115.286 E.00091
G2 X97.12 Y115.136 I-.938 J.529 E.00063
G1 X97.418 Y115.136 E.00103
G1 X97.418 Y114.986 E.00052
G1 X97.084 Y114.986 E.00116
; WIPE_START
G1 F24000
G1 X97.418 Y114.986 E-.20716
G1 X97.418 Y115.136 E-.09303
G1 X97.12 Y115.136 E-.18438
G1 X97.223 Y115.286 E-.11257
G1 X97.485 Y115.286 E-.16286
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.214 J.078 P1  F30000
G1 X98.291 Y127.763 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X98.037 Y127.576 I.161 J-.483 E.00831
G1 X97.899 Y127.331 E.0073
G1 X97.745 Y126.524 E.02133
G1 X97.766 Y124.61 E.04968
G1 X97.884 Y124.07 E.01432
G1 X98.022 Y123.816 E.00751
G3 X98.399 Y123.569 I.482 J.325 E.01202
G3 X98.732 Y123.651 I.04 J.552 E.00905
G3 X99.054 Y124.141 I-.79 J.871 E.01538
G1 X99.174 Y124.859 E.01888
G1 X99.15 Y126.753 E.04918
G1 X99.029 Y127.288 E.01422
G1 X98.87 Y127.57 E.0084
G3 X98.349 Y127.778 I-.419 J-.29 E.01544
M204 S10000
G1 X98.257 Y127.871 F30000
M204 S5000
G1 F12000
G3 X97.944 Y127.646 I.2 J-.608 E.01016
G3 X97.742 Y127.239 I.977 J-.737 E.01186
G1 X97.635 Y126.649 E.01557
G1 X97.596 Y125.5 E.02984
G1 X97.659 Y124.5 E.02599
G1 X97.782 Y124.008 E.01318
G3 X98.156 Y123.528 I.999 J.393 E.01602
G3 X98.505 Y123.449 I.335 J.676 E.00935
G3 X98.97 Y123.72 I-.103 J.712 E.01432
G3 X99.196 Y124.197 I-1.17 J.846 E.01378
G1 X99.292 Y124.833 E.01669
G1 X99.317 Y126.027 E.031
G1 X99.243 Y126.943 E.02383
G1 X99.134 Y127.348 E.01089
G3 X98.761 Y127.826 I-1.035 J-.423 E.01595
G3 X98.315 Y127.887 I-.304 J-.563 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X98.092 Y127.791 E-.09238
G1 X97.944 Y127.646 E-.07854
G1 X97.79 Y127.377 E-.11804
G1 X97.742 Y127.239 E-.05528
G1 X97.635 Y126.649 E-.22792
G1 X97.619 Y126.155 E-.18784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.995 J-.701 P1  F30000
G1 X96.517 Y127.718 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X96.718 Y127.496 I-.198 J-.381 E.00794
G1 X96.838 Y127.173 E.00893
G1 X96.873 Y126.622 E.01433
G1 X96.751 Y126.078 E.01447
G1 X96.617 Y125.786 E.00833
G2 X95.708 Y124.382 I-45.781 J28.625 E.04342
G3 X95.392 Y123.604 I7.62 J-3.551 E.02179
G1 X97.001 Y123.604 E.04176
G1 X97.001 Y123.726 E.00315
G1 X95.547 Y123.726 E.03774
G2 X96.212 Y124.925 I4.87 J-1.915 E.03568
G3 X96.721 Y125.726 I-6.887 J4.938 E.02465
G1 X96.959 Y126.376 E.01796
G1 X96.992 Y126.926 E.01429
G1 X96.899 Y127.386 E.01219
G1 X96.746 Y127.671 E.00839
G3 X95.832 Y127.594 I-.432 J-.34 E.02817
G3 X95.644 Y126.897 I1.369 J-.742 E.0189
G1 X95.766 Y126.891 E.00317
G1 X95.836 Y127.309 E.01101
G1 X95.95 Y127.557 E.00709
G2 X96.462 Y127.742 I.368 J-.221 E.01528
M204 S10000
; WIPE_START
G1 F24000
G1 X96.61 Y127.65 E-.06613
G1 X96.718 Y127.496 E-.07158
G1 X96.838 Y127.173 E-.13078
G1 X96.873 Y126.622 E-.20979
G1 X96.751 Y126.078 E-.21183
G1 X96.674 Y125.911 E-.06988
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.62 J-1.047 P1  F30000
G1 X94.934 Y126.941 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X90.877 Y130.227 E.1355
G1 X90.737 Y130.055 E.00575
G1 X94.795 Y126.769 E.1355
G1 X94.897 Y126.895 E.00419
M204 S10000
; WIPE_START
G1 F24000
G1 X93.357 Y128.171 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.772 J-.941 P1  F30000
G1 X91.145 Y129.986 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X90.958 Y129.986 E.00065
G1 X91.144 Y129.836 E.00083
G1 X91.223 Y129.836 E.00028
G1 X91.408 Y129.686 E.00083
G1 X91.329 Y129.686 E.00028
G1 X91.514 Y129.536 E.00083
G1 X91.594 Y129.536 E.00028
G1 X91.779 Y129.386 E.00083
G1 X91.699 Y129.386 E.00028
G1 X91.885 Y129.236 E.00083
G1 X91.964 Y129.236 E.00028
G1 X92.149 Y129.086 E.00083
G1 X92.07 Y129.086 E.00028
G1 X92.255 Y128.936 E.00083
G1 X92.335 Y128.936 E.00028
G1 X92.52 Y128.786 E.00083
G1 X92.44 Y128.786 E.00028
G1 X92.626 Y128.636 E.00083
G1 X92.705 Y128.636 E.00028
G1 X92.89 Y128.486 E.00083
G1 X92.811 Y128.486 E.00028
G1 X92.996 Y128.336 E.00083
G1 X93.076 Y128.336 E.00028
G1 X93.261 Y128.186 E.00083
G1 X93.181 Y128.186 E.00028
G1 X93.367 Y128.036 E.00083
G1 X93.446 Y128.036 E.00028
G1 X93.631 Y127.886 E.00083
G1 X93.552 Y127.886 E.00028
G1 X93.737 Y127.736 E.00083
G1 X93.817 Y127.736 E.00028
G1 X94.002 Y127.586 E.00083
G1 X93.922 Y127.586 E.00028
G1 X94.108 Y127.436 E.00083
G1 X94.187 Y127.436 E.00028
G1 X94.372 Y127.286 E.00083
G1 X94.293 Y127.286 E.00028
G1 X94.478 Y127.136 E.00083
G1 X94.558 Y127.136 E.00028
G1 X94.743 Y126.986 E.00083
G1 X94.556 Y126.986 E.00065
; WIPE_START
G1 F24000
G1 X94.743 Y126.986 E-.07098
G1 X94.558 Y127.136 E-.09058
G1 X94.478 Y127.136 E-.03022
G1 X94.293 Y127.286 E-.09058
G1 X94.372 Y127.286 E-.03022
G1 X94.187 Y127.436 E-.09058
G1 X94.108 Y127.436 E-.03022
G1 X93.922 Y127.586 E-.09058
G1 X94.002 Y127.586 E-.03022
G1 X93.817 Y127.736 E-.09058
G1 X93.737 Y127.736 E-.03022
G1 X93.563 Y127.877 E-.08501
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.194 J.235 P1  F30000
G1 X96.127 Y140.877 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X90.985 Y147.227 E.21205
G1 X90.811 Y147.087 E.00579
G1 X95.954 Y140.737 E.21206
G1 X96.08 Y140.839 E.00419
M204 S10000
; WIPE_START
G1 F24000
G1 X94.833 Y142.403 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.926 J-.79 P1  F30000
G1 X90.839 Y147.086 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X90.988 Y147.086 E.00052
G1 X91.11 Y146.936 E.00067
G1 X91.044 Y146.936 E.00023
G1 X91.165 Y146.786 E.00067
G1 X91.231 Y146.786 E.00023
G1 X91.353 Y146.636 E.00067
G1 X91.287 Y146.636 E.00023
G1 X91.408 Y146.486 E.00067
G1 X91.474 Y146.486 E.00023
G1 X91.596 Y146.336 E.00067
G1 X91.53 Y146.336 E.00023
G1 X91.651 Y146.186 E.00067
G1 X91.717 Y146.186 E.00023
G1 X91.839 Y146.036 E.00067
G1 X91.773 Y146.036 E.00023
G1 X91.894 Y145.886 E.00067
G1 X91.96 Y145.886 E.00023
G1 X92.082 Y145.736 E.00067
G1 X92.016 Y145.736 E.00023
G1 X92.137 Y145.586 E.00067
G1 X92.203 Y145.586 E.00023
G1 X92.325 Y145.436 E.00067
G1 X92.259 Y145.436 E.00023
G1 X92.38 Y145.286 E.00067
G1 X92.446 Y145.286 E.00023
G1 X92.568 Y145.136 E.00067
G1 X92.502 Y145.136 E.00023
G1 X92.623 Y144.986 E.00067
G1 X92.689 Y144.986 E.00023
G1 X92.81 Y144.836 E.00067
G1 X92.745 Y144.836 E.00023
G1 X92.866 Y144.686 E.00067
G1 X92.932 Y144.686 E.00023
G1 X93.053 Y144.536 E.00067
G1 X92.988 Y144.536 E.00023
G1 X93.109 Y144.386 E.00067
G1 X93.175 Y144.386 E.00023
G1 X93.296 Y144.236 E.00067
G1 X93.231 Y144.236 E.00023
G1 X93.352 Y144.086 E.00067
G1 X93.418 Y144.086 E.00023
G1 X93.539 Y143.936 E.00067
G1 X93.474 Y143.936 E.00023
G1 X93.595 Y143.786 E.00067
G1 X93.661 Y143.786 E.00023
G1 X93.782 Y143.636 E.00067
G1 X93.717 Y143.636 E.00023
G1 X93.838 Y143.486 E.00067
G1 X93.904 Y143.486 E.00023
G1 X94.025 Y143.336 E.00067
G1 X93.96 Y143.336 E.00023
G1 X94.081 Y143.186 E.00067
G1 X94.147 Y143.186 E.00023
G1 X94.268 Y143.036 E.00067
G1 X94.203 Y143.036 E.00023
G1 X94.324 Y142.886 E.00067
G1 X94.389 Y142.886 E.00023
G1 X94.511 Y142.736 E.00067
G1 X94.446 Y142.736 E.00023
G1 X94.567 Y142.586 E.00067
G1 X94.632 Y142.586 E.00023
G1 X94.754 Y142.436 E.00067
G1 X94.689 Y142.436 E.00023
G1 X94.81 Y142.286 E.00067
G1 X94.875 Y142.286 E.00023
G1 X94.997 Y142.136 E.00067
G1 X94.932 Y142.136 E.00023
G1 X95.053 Y141.986 E.00067
G1 X95.118 Y141.986 E.00023
G1 X95.24 Y141.836 E.00067
G1 X95.175 Y141.836 E.00023
G1 X95.296 Y141.686 E.00067
G1 X95.361 Y141.686 E.00023
G1 X95.483 Y141.536 E.00067
G1 X95.418 Y141.536 E.00023
G1 X95.539 Y141.386 E.00067
G1 X95.604 Y141.386 E.00022
G1 X95.726 Y141.236 E.00067
G1 X95.661 Y141.236 E.00022
G1 X95.782 Y141.086 E.00067
G1 X95.847 Y141.086 E.00022
G1 X95.968 Y140.936 E.00067
G1 X95.817 Y140.936 E.00053
; WIPE_START
G1 F24000
G1 X95.968 Y140.936 E-.05752
G1 X95.847 Y141.086 E-.07334
G1 X95.782 Y141.086 E-.02452
G1 X95.661 Y141.236 E-.07335
G1 X95.726 Y141.236 E-.02454
G1 X95.604 Y141.386 E-.07334
G1 X95.539 Y141.386 E-.02456
G1 X95.418 Y141.536 E-.07335
G1 X95.483 Y141.536 E-.02458
G1 X95.361 Y141.686 E-.07334
G1 X95.296 Y141.686 E-.02459
G1 X95.175 Y141.836 E-.07335
G1 X95.24 Y141.836 E-.02461
G1 X95.118 Y141.986 E-.07334
G1 X95.053 Y141.986 E-.02463
G1 X95.025 Y142.021 E-.01701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.089 J.543 P1  F30000
G1 X96.916 Y138.23 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X97.357 Y138.536 E.01393
G2 X98.641 Y138.33 I.508 J-.933 E.03633
G1 X98.828 Y138.067 E.00837
G1 X98.935 Y137.733 E.0091
G1 X98.947 Y137.253 E.01245
G1 X98.839 Y136.834 E.01125
G2 X98.171 Y136.161 I-1.177 J.502 E.0252
G1 X97.827 Y136.09 E.00911
G1 X97.377 Y136.125 E.01172
G1 X97.082 Y136.245 E.00825
G2 X96.614 Y136.933 I.616 J.922 E.02214
G1 X96.494 Y136.922 E.00314
G1 X96.521 Y136.784 E.00365
G1 X96.673 Y136.473 E.00897
G1 X96.904 Y136.225 E.00881
G1 X97.173 Y136.069 E.00806
G1 X97.582 Y135.975 E.01091
G1 X97.649 Y135.978 E.00173
G1 X97.997 Y135.991 E.00904
G3 X98.758 Y136.466 I-.315 J1.352 E.0237
G1 X98.958 Y136.815 E.01042
G1 X99.067 Y137.249 E.01164
G1 X99.05 Y137.76 E.01324
G1 X98.932 Y138.117 E.00978
G1 X98.721 Y138.419 E.00955
G3 X97.826 Y138.784 I-.893 J-.91 E.02572
G1 X97.506 Y138.728 E.00843
G1 X96.75 Y138.336 E.0221
G1 X96.865 Y138.262 E.00355
M204 S10000
; WIPE_START
G1 F24000
G1 X97.357 Y138.536 E-.21377
G1 X97.651 Y138.644 E-.11918
G1 X97.954 Y138.664 E-.11511
G1 X98.258 Y138.595 E-.11869
G1 X98.505 Y138.453 E-.1082
G1 X98.641 Y138.33 E-.06979
G1 X98.664 Y138.297 E-.01525
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.924 J-.792 P1  F30000
G1 X97.093 Y140.132 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X98.865 Y140.132 E.04601
G1 X98.865 Y140.254 E.00315
G1 X96.991 Y140.254 E.04864
G1 X96.637 Y138.408 E.04878
G1 X96.746 Y138.339 E.00335
G1 X97.081 Y140.073 E.04586
M204 S10000
; WIPE_START
G1 F24000
G1 X98.865 Y140.132 E-.6784
G1 X98.865 Y140.254 E-.04616
G1 X98.772 Y140.254 E-.03543
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.084 J1.214 P1  F30000
G1 X105.444 Y140.713 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X105.599 Y140.871 E.00574
G1 X99.473 Y146.907 E.2232
G1 X99.316 Y146.747 E.00581
G1 X105.402 Y140.755 E.22164
M204 S10000
; WIPE_START
G1 F24000
G1 X105.599 Y140.871 E-.08705
G1 X104.338 Y142.114 E-.67295
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.827 J-.893 P1  F30000
G1 X99.455 Y146.636 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X99.626 Y146.636 E.00059
G1 X99.778 Y146.486 E.00074
G1 X99.704 Y146.486 E.00026
G1 X99.856 Y146.336 E.00074
G1 X99.93 Y146.336 E.00026
G1 X100.083 Y146.186 E.00074
G1 X100.008 Y146.186 E.00026
G1 X100.161 Y146.036 E.00074
G1 X100.235 Y146.036 E.00026
G1 X100.387 Y145.886 E.00074
G1 X100.313 Y145.886 E.00026
G1 X100.465 Y145.736 E.00074
G1 X100.539 Y145.736 E.00026
G1 X100.692 Y145.586 E.00074
G1 X100.618 Y145.586 E.00026
G1 X100.77 Y145.436 E.00074
G1 X100.844 Y145.436 E.00026
G1 X100.996 Y145.286 E.00074
G1 X100.922 Y145.286 E.00026
G1 X101.075 Y145.136 E.00074
G1 X101.148 Y145.136 E.00026
G1 X101.301 Y144.986 E.00074
G1 X101.227 Y144.986 E.00026
G1 X101.379 Y144.836 E.00074
G1 X101.453 Y144.836 E.00026
G1 X101.605 Y144.686 E.00074
G1 X101.532 Y144.686 E.00026
G1 X101.684 Y144.536 E.00074
G1 X101.757 Y144.536 E.00025
G1 X101.91 Y144.386 E.00074
G1 X101.836 Y144.386 E.00025
G1 X101.989 Y144.236 E.00074
G1 X102.062 Y144.236 E.00025
G1 X102.214 Y144.086 E.00074
G1 X102.141 Y144.086 E.00025
G1 X102.293 Y143.936 E.00074
G1 X102.366 Y143.936 E.00025
G1 X102.519 Y143.786 E.00074
G1 X102.446 Y143.786 E.00025
G1 X102.598 Y143.636 E.00074
G1 X102.671 Y143.636 E.00025
G1 X102.823 Y143.486 E.00074
G1 X102.75 Y143.486 E.00025
G1 X102.903 Y143.336 E.00074
G1 X102.975 Y143.336 E.00025
G1 X103.127 Y143.186 E.00074
G1 X103.055 Y143.186 E.00025
G1 X103.207 Y143.036 E.00074
G1 X103.28 Y143.036 E.00025
G1 X103.432 Y142.886 E.00074
G1 X103.36 Y142.886 E.00025
G1 X103.512 Y142.736 E.00074
G1 X103.584 Y142.736 E.00025
G1 X103.736 Y142.586 E.00074
G1 X103.664 Y142.586 E.00025
G1 X103.817 Y142.436 E.00074
G1 X103.889 Y142.436 E.00025
G1 X104.041 Y142.286 E.00074
G1 X103.969 Y142.286 E.00025
G1 X104.121 Y142.136 E.00074
G1 X104.193 Y142.136 E.00025
G1 X104.345 Y141.986 E.00074
G1 X104.274 Y141.986 E.00025
G1 X104.426 Y141.836 E.00074
G1 X104.498 Y141.836 E.00025
G1 X104.65 Y141.686 E.00074
G1 X104.578 Y141.686 E.00025
G1 X104.731 Y141.536 E.00074
G1 X104.802 Y141.536 E.00025
G1 X104.954 Y141.386 E.00074
G1 X104.883 Y141.386 E.00025
G1 X105.035 Y141.236 E.00074
G1 X105.107 Y141.236 E.00025
G1 X105.259 Y141.086 E.00074
G1 X105.188 Y141.086 E.00025
G1 X105.34 Y140.936 E.00074
G1 X105.507 Y140.936 E.00058
; WIPE_START
G1 F24000
G1 X105.34 Y140.936 E-.06351
G1 X105.188 Y141.086 E-.08124
G1 X105.259 Y141.086 E-.027
G1 X105.107 Y141.236 E-.08121
G1 X105.035 Y141.236 E-.02704
G1 X104.883 Y141.386 E-.08124
G1 X104.954 Y141.386 E-.02707
G1 X104.802 Y141.536 E-.08121
G1 X104.731 Y141.536 E-.02711
G1 X104.578 Y141.686 E-.08124
G1 X104.65 Y141.686 E-.02714
G1 X104.498 Y141.836 E-.08121
G1 X104.426 Y141.836 E-.02718
G1 X104.339 Y141.922 E-.04659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.074 J.572 P1  F30000
G1 X106.297 Y138.245 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X106.243 Y138.159 I.814 J-.571 E.00263
G1 X106.354 Y138.122 E.00303
G1 X106.385 Y138.184 E.00178
G2 X107.793 Y138.218 I.717 J-.532 E.0421
G1 X107.951 Y137.964 E.00777
G1 X108.049 Y137.576 E.01038
G1 X108.037 Y137.122 E.01179
G1 X107.906 Y136.701 E.01145
G2 X107.288 Y136.138 I-1.008 J.487 E.02223
G1 X106.957 Y136.088 E.00868
G1 X106.594 Y136.135 E.00948
G1 X106.315 Y136.261 E.00795
G1 X106.047 Y136.505 E.00941
G1 X105.923 Y136.696 E.0059
G1 X105.748 Y137.215 E.01422
G1 X105.677 Y137.96 E.01941
G1 X105.731 Y138.861 E.02343
G1 X105.894 Y139.488 E.01683
G1 X106.096 Y139.849 E.01072
G1 X106.33 Y140.075 E.00844
G1 X106.596 Y140.209 E.00773
G1 X106.973 Y140.27 E.00991
G1 X107.316 Y140.23 E.00898
G2 X107.929 Y139.555 I-.212 J-.808 E.02501
G1 X108.049 Y139.57 E.00314
G1 X107.997 Y139.77 E.00536
G1 X107.833 Y140.037 E.00813
G3 X107.111 Y140.383 I-.831 J-.807 E.02123
G1 X106.715 Y140.361 E.01029
G1 X106.413 Y140.261 E.00824
G1 X106.123 Y140.055 E.00923
G1 X106.009 Y139.928 E.00444
G1 X105.788 Y139.543 E.01151
G1 X105.593 Y138.721 E.02191
G1 X105.633 Y137.193 E.03968
G1 X105.794 Y136.688 E.01375
G1 X105.955 Y136.434 E.00781
G1 X106.256 Y136.159 E.01059
G1 X106.551 Y136.024 E.00841
G1 X106.913 Y135.97 E.00949
G1 X107.241 Y136.012 E.00859
G1 X107.301 Y136.019 E.00156
G1 X107.587 Y136.149 E.00816
G1 X107.697 Y136.232 E.00357
G3 X108.008 Y136.638 I-.894 J1.009 E.01336
G1 X108.154 Y137.102 E.01262
G1 X108.165 Y137.589 E.01263
G1 X108.069 Y137.984 E.01055
G1 X107.89 Y138.291 E.00924
G3 X106.332 Y138.293 I-.779 J-.617 E.04643
M204 S10000
; WIPE_START
G1 F24000
G1 X106.243 Y138.159 E-.06117
G1 X106.354 Y138.122 E-.04441
G1 X106.385 Y138.184 E-.02613
G1 X106.564 Y138.37 E-.09827
G1 X106.791 Y138.498 E-.09931
G1 X107.046 Y138.552 E-.09906
G1 X107.304 Y138.531 E-.09808
G1 X107.545 Y138.437 E-.09835
G1 X107.743 Y138.278 E-.0964
G1 X107.793 Y138.218 E-.02972
G1 X107.805 Y138.198 E-.0091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.273 J1.186 P1  F30000
G1 X116.217 Y140.132 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X115.574 Y139.282 E.02766
G3 X114.423 Y136.044 I5.959 J-3.943 E.09006
G1 X114.547 Y136.042 E.00323
G1 X114.622 Y136.66 E.01617
G1 X114.733 Y137.126 E.01241
G1 X115.051 Y138.061 E.02564
G1 X115.296 Y138.572 E.01472
G1 X115.831 Y139.436 E.02636
G1 X116.349 Y140.057 E.02099
G1 X116.259 Y140.254 E.00562
G1 X113.756 Y140.254 E.06496
G1 X113.756 Y140.132 E.00315
G1 X116.157 Y140.132 E.06231
M204 S10000
; WIPE_START
G1 F24000
G1 X115.574 Y139.282 E-.39175
G1 X115.189 Y138.625 E-.28923
G1 X115.102 Y138.436 E-.07901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.079 J-.563 P1  F30000
G1 X113.59 Y141.331 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X109.095 Y146.883 E.18539
G1 X108.923 Y146.743 E.00575
G1 X113.417 Y141.191 E.18537
G1 X113.544 Y141.294 E.00423
M204 S10000
; WIPE_START
G1 F24000
G1 X112.298 Y142.858 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.95 J-.761 P1  F30000
G1 X109.271 Y146.636 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X109.12 Y146.636 E.00053
G1 X109.241 Y146.486 E.00067
G1 X109.306 Y146.486 E.00022
G1 X109.427 Y146.336 E.00067
G1 X109.363 Y146.336 E.00022
G1 X109.484 Y146.186 E.00067
G1 X109.549 Y146.186 E.00023
G1 X109.67 Y146.036 E.00067
G1 X109.605 Y146.036 E.00023
G1 X109.727 Y145.886 E.00067
G1 X109.792 Y145.886 E.00023
G1 X109.913 Y145.736 E.00067
G1 X109.848 Y145.736 E.00023
G1 X109.97 Y145.586 E.00067
G1 X110.035 Y145.586 E.00023
G1 X110.156 Y145.436 E.00067
G1 X110.091 Y145.436 E.00023
G1 X110.213 Y145.286 E.00067
G1 X110.278 Y145.286 E.00023
G1 X110.399 Y145.136 E.00067
G1 X110.334 Y145.136 E.00023
G1 X110.455 Y144.986 E.00067
G1 X110.52 Y144.986 E.00023
G1 X110.642 Y144.836 E.00067
G1 X110.577 Y144.836 E.00023
G1 X110.698 Y144.686 E.00067
G1 X110.763 Y144.686 E.00023
G1 X110.885 Y144.536 E.00067
G1 X110.82 Y144.536 E.00023
G1 X110.941 Y144.386 E.00067
G1 X111.006 Y144.386 E.00023
G1 X111.128 Y144.236 E.00067
G1 X111.062 Y144.236 E.00023
G1 X111.184 Y144.086 E.00067
G1 X111.249 Y144.086 E.00023
G1 X111.371 Y143.936 E.00067
G1 X111.305 Y143.936 E.00023
G1 X111.427 Y143.786 E.00067
G1 X111.492 Y143.786 E.00023
G1 X111.614 Y143.636 E.00067
G1 X111.548 Y143.636 E.00023
G1 X111.67 Y143.486 E.00067
G1 X111.735 Y143.486 E.00023
G1 X111.857 Y143.336 E.00067
G1 X111.791 Y143.336 E.00023
G1 X111.912 Y143.186 E.00067
G1 X111.978 Y143.186 E.00023
G1 X112.1 Y143.036 E.00067
G1 X112.034 Y143.036 E.00023
G1 X112.155 Y142.886 E.00067
G1 X112.221 Y142.886 E.00023
G1 X112.342 Y142.736 E.00067
G1 X112.277 Y142.736 E.00023
G1 X112.398 Y142.586 E.00067
G1 X112.464 Y142.586 E.00023
G1 X112.585 Y142.436 E.00067
G1 X112.519 Y142.436 E.00023
G1 X112.641 Y142.286 E.00067
G1 X112.707 Y142.286 E.00023
G1 X112.828 Y142.136 E.00067
G1 X112.762 Y142.136 E.00023
G1 X112.884 Y141.986 E.00067
G1 X112.95 Y141.986 E.00023
G1 X113.071 Y141.836 E.00067
G1 X113.005 Y141.836 E.00023
G1 X113.127 Y141.686 E.00067
G1 X113.193 Y141.686 E.00023
G1 X113.314 Y141.536 E.00067
G1 X113.248 Y141.536 E.00023
G1 X113.369 Y141.386 E.00067
G1 X113.523 Y141.386 E.00053
; WIPE_START
G1 F24000
G1 X113.369 Y141.386 E-.0582
G1 X113.248 Y141.536 E-.07333
G1 X113.314 Y141.536 E-.02518
G1 X113.193 Y141.686 E-.07335
G1 X113.127 Y141.686 E-.02516
G1 X113.005 Y141.836 E-.07333
G1 X113.071 Y141.836 E-.02514
G1 X112.95 Y141.986 E-.07335
G1 X112.884 Y141.986 E-.02512
G1 X112.762 Y142.136 E-.07333
G1 X112.828 Y142.136 E-.0251
G1 X112.707 Y142.286 E-.07335
G1 X112.641 Y142.286 E-.02508
G1 X112.519 Y142.436 E-.07333
G1 X112.585 Y142.436 E-.02506
G1 X112.565 Y142.462 E-.01258
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.147 J.406 P1  F30000
G1 X117.875 Y127.435 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X117.245 Y128.217 E.0293
G1 X116.636 Y128.635 E.02152
G1 X115.937 Y128.868 E.02148
G1 X115.2 Y128.892 E.02151
G1 X114.488 Y128.707 E.02145
G1 X113.854 Y128.332 E.0215
G1 X112.967 Y127.379 E.03795
G1 X112.967 Y128.817 E.04192
G1 X112.887 Y128.817 E.00233
G1 X112.887 Y121.471 E.21421
G1 X112.967 Y121.471 E.00233
G1 X112.967 Y126.331 E.14172
G1 X113.082 Y127.073 E.0219
G1 X113.423 Y127.761 E.02239
G1 X113.956 Y128.316 E.02243
G1 X114.631 Y128.683 E.02241
G1 X115.384 Y128.829 E.02238
G1 X116.149 Y128.742 E.02243
G1 X116.848 Y128.43 E.02233
G1 X117.422 Y127.919 E.02241
G1 X117.831 Y127.237 E.02317
G1 X117.831 Y121.471 E.16814
G1 X117.909 Y121.471 E.00227
G1 X117.909 Y127.235 E.16809
G1 X118.339 Y127.848 E.02182
G1 X118.903 Y128.284 E.02079
G1 X119.567 Y128.536 E.02072
G1 X120.28 Y128.585 E.02083
G1 X120.974 Y128.42 E.02078
G1 X121.588 Y128.06 E.02076
G1 X122.071 Y127.536 E.02078
G1 X122.378 Y126.894 E.02077
G1 X122.483 Y126.205 E.02031
G1 X122.483 Y121.471 E.13804
G1 X122.563 Y121.471 E.00233
G1 X122.563 Y126.174 E.13714
G1 X122.463 Y126.872 E.02057
G1 X122.181 Y127.506 E.02023
G1 X121.735 Y128.035 E.02016
G1 X121.16 Y128.42 E.02017
G1 X120.499 Y128.632 E.02026
G1 X119.808 Y128.652 E.02015
G1 X119.137 Y128.481 E.02019
G3 X118.54 Y128.131 I64.093 J-109.962 E.02018
G1 X117.917 Y127.479 E.02631
M204 S10000
G1 X117.709 Y127.436 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X118.053 Y127.436 E.0012
; WIPE_START
G1 F24000
G1 X117.709 Y127.436 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.042 J-1.216 P1  F30000
G1 X113.339 Y127.586 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3600
G1 X113.248 Y127.586 E.00032
G1 X113.108 Y127.436 E.00071
G1 X113.189 Y127.436 E.00028
G1 X113.115 Y127.286 E.00058
G1 X112.968 Y127.286 E.00051
G1 X112.952 Y127.268 E.00009
G1 X112.952 Y127.136 E.00046
G1 X113.041 Y127.136 E.00031
G3 X113.003 Y126.986 I.219 J-.135 E.00055
G1 X112.952 Y126.986 E.00018
G1 X112.952 Y126.836 E.00052
G1 X112.979 Y126.836 E.0001
G1 X112.956 Y126.686 E.00053
G1 X112.884 Y126.686 E.00025
; WIPE_START
G1 F24000
G1 X112.956 Y126.686 E-.03541
G1 X112.979 Y126.836 E-.07473
G1 X112.952 Y126.836 E-.01367
G1 X112.952 Y126.986 E-.07384
G1 X113.003 Y126.986 E-.02516
G1 X113.041 Y127.136 E-.07616
G1 X112.952 Y127.136 E-.04382
G1 X112.952 Y127.268 E-.06497
G1 X112.968 Y127.286 E-.01211
G1 X113.115 Y127.286 E-.07213
G1 X113.189 Y127.436 E-.0824
G1 X113.108 Y127.436 E-.03992
G1 X113.248 Y127.586 E-.10091
G1 X113.339 Y127.586 E-.04479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.021 J1.217 P1  F30000
G1 X125.467 Y127.38 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X125.467 Y128.817 E.04192
G1 X125.387 Y128.817 E.00233
G1 X125.387 Y121.471 E.21421
G1 X125.467 Y121.471 E.00233
G1 X125.467 Y126.331 E.14172
G1 X125.582 Y127.073 E.0219
G1 X125.923 Y127.761 E.02239
G1 X126.456 Y128.316 E.02243
G1 X127.131 Y128.683 E.02241
G1 X127.884 Y128.829 E.02238
G1 X128.647 Y128.742 E.02237
G1 X129.35 Y128.43 E.02244
G1 X129.925 Y127.918 E.02244
G1 X130.329 Y127.237 E.0231
G1 X130.329 Y121.471 E.16812
G1 X130.409 Y121.471 E.00233
G1 X130.409 Y127.235 E.16809
G1 X130.839 Y127.848 E.02182
G1 X131.403 Y128.284 E.0208
G1 X132.069 Y128.536 E.02078
G1 X132.778 Y128.585 E.02071
G1 X133.474 Y128.42 E.02084
G1 X134.088 Y128.06 E.02076
G1 X134.571 Y127.536 E.02078
G1 X134.878 Y126.894 E.02077
G1 X134.983 Y126.205 E.02031
G1 X134.983 Y121.471 E.13804
G1 X135.061 Y121.471 E.00227
G1 X135.061 Y126.174 E.13715
G1 X134.963 Y126.873 E.02056
G1 X134.681 Y127.506 E.02023
G1 X134.235 Y128.035 E.02016
G1 X133.658 Y128.42 E.02023
G1 X133.001 Y128.632 E.02015
G1 X132.308 Y128.652 E.02021
G1 X131.637 Y128.481 E.02019
G3 X131.04 Y128.131 I64.178 J-110.106 E.02017
G1 X130.378 Y127.435 E.02801
G1 X129.745 Y128.217 E.02935
G1 X129.138 Y128.635 E.02148
G1 X128.437 Y128.868 E.02153
G1 X127.702 Y128.892 E.02145
G1 X126.986 Y128.707 E.02156
G1 X126.354 Y128.332 E.02144
G1 X125.508 Y127.423 E.0362
M204 S10000
; WIPE_START
G1 F24000
G1 X125.467 Y128.817 E-.5298
G1 X125.387 Y128.817 E-.0304
G1 X125.387 Y128.291 E-.1998
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.213 J1.198 P1  F30000
G1 X130.208 Y127.436 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X130.553 Y127.436 E.0012
; WIPE_START
G1 F24000
G1 X130.208 Y127.436 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.042 J-1.216 P1  F30000
G1 X125.839 Y127.586 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3600
G1 X125.748 Y127.586 E.00032
G1 X125.608 Y127.436 E.00071
G1 X125.689 Y127.436 E.00028
G1 X125.615 Y127.286 E.00058
G1 X125.468 Y127.286 E.00051
G1 X125.452 Y127.268 E.00009
G1 X125.452 Y127.136 E.00046
G1 X125.541 Y127.136 E.00031
G3 X125.503 Y126.986 I.219 J-.135 E.00055
G1 X125.452 Y126.986 E.00018
G1 X125.452 Y126.836 E.00052
G1 X125.479 Y126.836 E.0001
G1 X125.456 Y126.686 E.00053
G1 X125.384 Y126.686 E.00025
; WIPE_START
G1 F24000
G1 X125.456 Y126.686 E-.03541
G1 X125.479 Y126.836 E-.07471
G1 X125.452 Y126.836 E-.01367
G1 X125.452 Y126.986 E-.07383
G1 X125.503 Y126.986 E-.02516
G1 X125.541 Y127.136 E-.07615
G1 X125.452 Y127.136 E-.04381
G1 X125.452 Y127.268 E-.065
G1 X125.468 Y127.286 E-.01206
G1 X125.615 Y127.286 E-.07216
G1 X125.689 Y127.436 E-.08238
G1 X125.608 Y127.436 E-.03995
G1 X125.748 Y127.586 E-.10089
G1 X125.839 Y127.586 E-.04481
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.191 J-.249 P1  F30000
G1 X123.616 Y138.204 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X123.273 Y138.258 E.00902
G1 X122.927 Y138.211 E.00906
G1 X122.625 Y138.071 E.00864
G1 X122.37 Y137.848 E.00877
G3 X122.3 Y136.576 I.821 J-.684 E.03543
G1 X122.52 Y136.337 E.00845
G1 X122.805 Y136.166 E.00862
G1 X123.058 Y136.102 E.00676
G1 X123.141 Y136.081 E.00223
G1 X123.485 Y136.095 E.00894
G1 X123.815 Y136.212 E.0091
G3 X124.164 Y137.835 I-.498 J.956 E.04919
G1 X123.924 Y138.055 E.00845
G1 X123.67 Y138.178 E.00732
M204 S10000
G1 X123.81 Y138.544 F30000
M204 S5000
G1 F12000
G3 X124.027 Y138.742 I-.548 J.821 E.00765
G3 X123.231 Y138.379 I-.767 J.628 E.13819
G3 X123.759 Y138.513 I.03 J.987 E.01431
M204 S10000
G1 X123.768 Y138.313 F30000
M204 S5000
G1 F12000
G1 X124.162 Y138.725 E.0148
G1 X124.311 Y139.021 E.00859
G1 X124.368 Y139.348 E.00861
G1 X124.328 Y139.676 E.00856
G1 X124.192 Y139.978 E.0086
G1 X123.975 Y140.225 E.00855
G1 X123.695 Y140.399 E.00856
G1 X123.378 Y140.483 E.00852
G1 X123.049 Y140.471 E.00854
G1 X122.742 Y140.362 E.00845
G1 X122.473 Y140.167 E.00862
G1 X122.277 Y139.905 E.00849
G1 X122.166 Y139.592 E.00862
G1 X122.149 Y139.263 E.00854
G1 X122.227 Y138.947 E.00846
G1 X122.402 Y138.66 E.00872
G1 X122.742 Y138.326 E.01236
G1 X122.288 Y137.934 E.01556
G1 X122.099 Y137.631 E.00928
G1 X122.011 Y137.296 E.00899
G1 X122.023 Y136.954 E.00888
G1 X122.137 Y136.625 E.00903
G1 X122.342 Y136.341 E.0091
G1 X122.635 Y136.119 E.00955
G1 X122.986 Y135.986 E.00974
G1 X123.377 Y135.965 E.01015
G1 X123.742 Y136.049 E.00973
G1 X124.073 Y136.242 E.00995
G1 X124.307 Y136.494 E.00892
G1 X124.466 Y136.815 E.0093
G1 X124.519 Y137.155 E.00893
G1 X124.473 Y137.494 E.00887
G1 X124.327 Y137.812 E.0091
G3 X123.82 Y138.283 I-1.45 J-1.053 E.01807
M204 S10000
G1 X123.454 Y138.386 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X123.813 Y138.386 E.00125
G1 X123.062 Y138.386 F30000
G1 F3600
G1 X122.803 Y138.386 E.0009
G1 X122.869 Y138.322 E.00032
G1 X122.769 Y138.236 E.00046
G1 X122.977 Y138.236 E.00072
; WIPE_START
G1 F24000
G1 X122.769 Y138.236 E-.22946
G1 X122.869 Y138.322 E-.14522
G1 X122.803 Y138.386 E-.10068
G1 X123.062 Y138.386 E-.28463
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.193 J-.24 P1  F30000
G1 X122.497 Y141.191 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X122.67 Y141.331 E.00579
G1 X119.065 Y145.783 E.14867
G1 X118.893 Y145.643 E.00575
G1 X122.459 Y141.238 E.1471
M204 S10000
; WIPE_START
G1 F24000
G1 X122.67 Y141.331 E-.08779
G1 X121.557 Y142.706 E-.67221
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.904 J-.815 P1  F30000
G1 X118.963 Y145.586 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X119.114 Y145.586 E.00053
G1 X119.235 Y145.436 E.00067
G1 X119.171 Y145.436 E.00022
G1 X119.292 Y145.286 E.00067
G1 X119.357 Y145.286 E.00022
G1 X119.478 Y145.136 E.00067
G1 X119.414 Y145.136 E.00023
G1 X119.535 Y144.986 E.00067
G1 X119.6 Y144.986 E.00023
G1 X119.721 Y144.836 E.00067
G1 X119.657 Y144.836 E.00023
G1 X119.778 Y144.686 E.00067
G1 X119.843 Y144.686 E.00023
G1 X119.964 Y144.536 E.00067
G1 X119.899 Y144.536 E.00023
G1 X120.021 Y144.386 E.00067
G1 X120.086 Y144.386 E.00023
G1 X120.207 Y144.236 E.00067
G1 X120.142 Y144.236 E.00023
G1 X120.264 Y144.086 E.00067
G1 X120.329 Y144.086 E.00023
G1 X120.45 Y143.936 E.00067
G1 X120.385 Y143.936 E.00023
G1 X120.507 Y143.786 E.00067
G1 X120.572 Y143.786 E.00023
G1 X120.693 Y143.636 E.00067
G1 X120.628 Y143.636 E.00023
G1 X120.749 Y143.486 E.00067
G1 X120.815 Y143.486 E.00023
G1 X120.936 Y143.336 E.00067
G1 X120.871 Y143.336 E.00023
G1 X120.992 Y143.186 E.00067
G1 X121.058 Y143.186 E.00023
G1 X121.179 Y143.036 E.00067
G1 X121.114 Y143.036 E.00023
G1 X121.235 Y142.886 E.00067
G1 X121.301 Y142.886 E.00023
G1 X121.422 Y142.736 E.00067
G1 X121.357 Y142.736 E.00023
G1 X121.478 Y142.586 E.00067
G1 X121.544 Y142.586 E.00023
G1 X121.665 Y142.436 E.00067
G1 X121.599 Y142.436 E.00023
G1 X121.721 Y142.286 E.00067
G1 X121.787 Y142.286 E.00023
G1 X121.908 Y142.136 E.00067
G1 X121.842 Y142.136 E.00023
G1 X121.964 Y141.986 E.00067
G1 X122.03 Y141.986 E.00023
G1 X122.151 Y141.836 E.00067
G1 X122.085 Y141.836 E.00023
G1 X122.207 Y141.686 E.00067
G1 X122.273 Y141.686 E.00023
G1 X122.394 Y141.536 E.00067
G1 X122.328 Y141.536 E.00023
G1 X122.449 Y141.386 E.00067
G1 X122.603 Y141.386 E.00053
; WIPE_START
G1 F24000
G1 X122.449 Y141.386 E-.0582
G1 X122.328 Y141.536 E-.07334
G1 X122.394 Y141.536 E-.02517
G1 X122.273 Y141.686 E-.07335
G1 X122.207 Y141.686 E-.02514
G1 X122.085 Y141.836 E-.07334
G1 X122.151 Y141.836 E-.02512
G1 X122.03 Y141.986 E-.07335
G1 X121.964 Y141.986 E-.0251
G1 X121.842 Y142.136 E-.07334
G1 X121.908 Y142.136 E-.02507
G1 X121.787 Y142.286 E-.07335
G1 X121.721 Y142.286 E-.02505
G1 X121.599 Y142.436 E-.07334
G1 X121.665 Y142.436 E-.02502
G1 X121.644 Y142.462 E-.01273
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.162 J1.206 P1  F30000
G1 X130.946 Y141.21 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X131.13 Y141.333 E.00574
G1 X128.757 Y144.865 E.11042
G1 X128.573 Y144.741 E.00574
G1 X130.913 Y141.259 E.10887
M204 S10000
; WIPE_START
G1 F24000
G1 X131.13 Y141.333 E-.08708
G1 X130.142 Y142.803 E-.67292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.005 J-.687 P1  F30000
G1 X128.855 Y144.686 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X128.714 Y144.686 E.00049
G1 X128.815 Y144.536 E.00063
G1 X128.875 Y144.536 E.00021
G1 X128.975 Y144.386 E.00063
G1 X128.915 Y144.386 E.00021
G1 X129.016 Y144.236 E.00063
G1 X129.076 Y144.236 E.00021
G1 X129.177 Y144.086 E.00063
G1 X129.117 Y144.086 E.00021
G1 X129.218 Y143.936 E.00063
G1 X129.278 Y143.936 E.00021
G1 X129.378 Y143.786 E.00063
G1 X129.319 Y143.786 E.00021
G1 X129.419 Y143.636 E.00063
G1 X129.479 Y143.636 E.00021
G1 X129.58 Y143.486 E.00063
G1 X129.52 Y143.486 E.00021
G1 X129.621 Y143.336 E.00063
G1 X129.681 Y143.336 E.00021
G1 X129.782 Y143.186 E.00063
G1 X129.722 Y143.186 E.00021
G1 X129.823 Y143.036 E.00063
G1 X129.882 Y143.036 E.00021
G1 X129.983 Y142.886 E.00063
G1 X129.923 Y142.886 E.00021
G1 X130.024 Y142.736 E.00063
G1 X130.084 Y142.736 E.00021
G1 X130.185 Y142.586 E.00063
G1 X130.125 Y142.586 E.00021
G1 X130.226 Y142.436 E.00063
G1 X130.285 Y142.436 E.00021
G1 X130.386 Y142.286 E.00063
G1 X130.326 Y142.286 E.00021
G1 X130.427 Y142.136 E.00063
G1 X130.487 Y142.136 E.00021
G1 X130.588 Y141.986 E.00063
G1 X130.528 Y141.986 E.00021
G1 X130.629 Y141.836 E.00063
G1 X130.689 Y141.836 E.00021
G1 X130.789 Y141.686 E.00063
G1 X130.73 Y141.686 E.00021
G1 X130.83 Y141.536 E.00063
G1 X130.89 Y141.536 E.00021
G1 X130.991 Y141.386 E.00063
G1 X130.85 Y141.386 E.00049
; WIPE_START
G1 F24000
G1 X130.991 Y141.386 E-.05363
G1 X130.89 Y141.536 E-.06867
G1 X130.83 Y141.536 E-.02273
G1 X130.73 Y141.686 E-.06867
G1 X130.789 Y141.686 E-.02273
G1 X130.689 Y141.836 E-.06867
G1 X130.629 Y141.836 E-.02273
G1 X130.528 Y141.986 E-.06867
G1 X130.588 Y141.986 E-.02273
G1 X130.487 Y142.136 E-.06867
G1 X130.427 Y142.136 E-.02273
G1 X130.326 Y142.286 E-.06867
G1 X130.386 Y142.286 E-.02273
G1 X130.285 Y142.436 E-.06867
M73 P98 R0
G1 X130.226 Y142.436 E-.02273
G1 X130.128 Y142.581 E-.06657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.135 J.44 P1  F30000
G1 X131.931 Y137.926 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X132.014 Y138.025 E.00336
G1 X131.914 Y138.086 E.00303
G1 X131.854 Y138.014 E.00243
G1 X131.592 Y137.843 E.00812
G1 X131.335 Y137.769 E.00695
G1 X131.257 Y137.771 E.00203
G2 X130.571 Y137.995 I-.053 J.999 E.01915
G1 X130.352 Y138.253 E.00878
G1 X130.222 Y138.561 E.00868
G1 X130.17 Y139.018 E.01195
G1 X130.222 Y139.439 E.01101
G1 X130.36 Y139.759 E.00903
G1 X130.581 Y140.016 E.00879
G1 X130.846 Y140.184 E.00814
G1 X131.141 Y140.263 E.00793
G1 X131.516 Y140.251 E.00974
G1 X131.825 Y140.143 E.00851
G2 X132.19 Y139.841 I-.622 J-1.123 E.01236
G1 X132.384 Y139.507 E.01
G1 X132.505 Y139.034 E.01267
G1 X132.548 Y138.29 E.01935
G1 X132.488 Y137.422 E.02259
G1 X132.377 Y136.973 E.01199
G1 X132.171 Y136.562 E.01195
G1 X131.921 Y136.308 E.00923
G1 X131.634 Y136.154 E.00845
G1 X131.294 Y136.09 E.00899
G1 X130.911 Y136.125 E.00997
G2 X130.297 Y136.8 I.21 J.808 E.02506
G1 X130.168 Y136.784 E.00337
G3 X130.908 Y136.005 I.979 J.19 E.02945
G1 X131.306 Y135.972 E.01036
G1 X131.619 Y136.033 E.00825
G1 X131.675 Y136.043 E.00148
G1 X132.024 Y136.235 E.01033
G1 X132.278 Y136.51 E.00972
G1 X132.492 Y136.937 E.0124
G1 X132.61 Y137.423 E.01299
G1 X132.635 Y138.952 E.03969
G1 X132.491 Y139.555 E.01609
G1 X132.27 Y139.93 E.01129
G1 X131.995 Y140.179 E.00962
G1 X131.83 Y140.272 E.00493
G1 X131.495 Y140.374 E.00909
G1 X131.087 Y140.374 E.01057
G1 X130.759 Y140.273 E.00891
G1 X130.477 Y140.081 E.00886
G1 X130.234 Y139.775 E.01014
G1 X130.09 Y139.385 E.0108
G1 X130.053 Y138.876 E.01323
G1 X130.139 Y138.425 E.01191
G1 X130.318 Y138.096 E.00971
G1 X130.578 Y137.841 E.00948
G1 X130.865 Y137.696 E.00834
G1 X131.2 Y137.644 E.0088
G1 X131.509 Y137.686 E.00809
G1 X131.646 Y137.738 E.00379
G1 X131.881 Y137.893 E.0073
M204 S10000
; WIPE_START
G1 F24000
G1 X132.014 Y138.025 E-.07129
G1 X131.914 Y138.086 E-.04439
G1 X131.854 Y138.014 E-.03552
G1 X131.592 Y137.843 E-.11886
G1 X131.335 Y137.769 E-.10173
G1 X131.257 Y137.771 E-.02979
G1 X131.032 Y137.776 E-.08527
G1 X130.805 Y137.846 E-.09036
G1 X130.571 Y137.995 E-.10544
G1 X130.439 Y138.15 E-.07734
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.792 J.924 P1  F30000
G1 X137.821 Y131.821 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X137.821 Y118.899 E.3768
G1 X136.069 Y118.899 E.05109
G1 X136.069 Y118.821 E.00227
G1 X137.901 Y118.821 E.05342
G1 X137.901 Y131.899 E.38135
G1 X136.069 Y131.899 E.05342
G1 X136.069 Y131.821 E.00227
G1 X137.761 Y131.821 E.04934
M204 S10000
; WIPE_START
G1 F24000
G1 X137.77 Y129.821 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.166 J.35 P1  F30000
G1 X140.906 Y140.259 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F12000
G3 X140.733 Y140.168 I.077 J-.356 E.00514
G3 X140.416 Y139.452 I1.369 J-1.033 E.02048
G1 X140.325 Y138.614 E.02189
G1 X140.34 Y137.513 E.02857
G1 X140.463 Y136.72 E.02084
G1 X140.577 Y136.407 E.00863
G3 X140.875 Y136.101 I.541 J.23 E.01135
G3 X141.234 Y136.194 I.093 J.38 E.01003
G3 X141.549 Y136.91 I-1.347 J1.02 E.02048
G1 X141.64 Y137.756 E.02207
G1 X141.63 Y138.838 E.02809
G1 X141.521 Y139.561 E.01896
G1 X141.356 Y140.003 E.01225
G1 X141.23 Y140.171 E.00547
G3 X140.965 Y140.267 I-.247 J-.268 E.00749
M204 S10000
G1 X140.879 Y140.376 F30000
M204 S5000
G1 F12000
G3 X140.594 Y140.192 I.105 J-.477 E.009
G1 X140.426 Y139.894 E.00888
G1 X140.302 Y139.487 E.01104
G1 X140.201 Y137.841 E.04281
G1 X140.338 Y136.719 E.02932
G1 X140.471 Y136.353 E.0101
G1 X140.618 Y136.133 E.00687
G3 X141.009 Y135.972 I.358 J.314 E.01136
G3 X141.369 Y136.162 I-.017 J.469 E.01092
G1 X141.54 Y136.466 E.00903
G1 X141.663 Y136.875 E.01109
G1 X141.765 Y138.527 E.04295
G1 X141.62 Y139.651 E.02941
G1 X141.474 Y140.036 E.01068
G3 X141.038 Y140.385 I-.576 J-.273 E.01501
G3 X140.939 Y140.385 I-.053 J-.486 E.00258
M204 S10000
; WIPE_START
G1 F24000
G1 X140.765 Y140.337 E-.06862
G1 X140.594 Y140.192 E-.08518
G1 X140.426 Y139.894 E-.13001
G1 X140.302 Y139.487 E-.16162
G1 X140.251 Y138.661 E-.31458
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.636 J-1.038 P1  F30000
G1 X138.557 Y139.699 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.907 Y139.579 E.01079
G1 X138.907 Y136.069 E.10235
G1 X138.985 Y136.069 E.00227
G1 X138.985 Y140.121 E.11816
G1 X138.782 Y140.183 E.00618
G2 X138.157 Y139.358 I-5.291 J3.36 E.0302
G1 X137.982 Y139.222 E.00647
G1 X138.027 Y139.144 E.00261
G3 X138.521 Y139.651 I-1.761 J2.212 E.02069
M204 S10000
G1 X138.987 Y140.036 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X138.761 Y140.036 E.00079
G1 X138.659 Y139.886 E.00063
G1 X138.92 Y139.886 E.00091
G1 X138.92 Y139.736 E.00052
G1 X138.457 Y139.736 E.00161
; WIPE_START
G1 F24000
G1 X138.92 Y139.736 E-.2745
G1 X138.92 Y139.886 E-.08907
G1 X138.659 Y139.886 E-.15453
G1 X138.761 Y140.036 E-.10752
G1 X138.987 Y140.036 E-.13439
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.836 J.885 P1  F30000
G1 X140.335 Y141.309 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X140.146 Y144.643 E.08667
G1 X139.926 Y144.631 E.00572
G1 X140.113 Y141.297 E.08667
G1 X140.275 Y141.306 E.00421
M204 S10000
; WIPE_START
G1 F24000
G1 X140.198 Y143.304 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.215 J-.063 P1  F30000
G1 X140.134 Y144.536 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X140.017 Y144.536 E.00041
G1 X140.026 Y144.386 E.00052
G1 X140.075 Y144.386 E.00017
G1 X140.084 Y144.236 E.00052
G1 X140.034 Y144.236 E.00017
G1 X140.043 Y144.086 E.00052
G1 X140.092 Y144.086 E.00017
G1 X140.101 Y143.936 E.00052
G1 X140.051 Y143.936 E.00017
G1 X140.059 Y143.786 E.00052
G1 X140.109 Y143.786 E.00017
G1 X140.118 Y143.636 E.00052
G1 X140.068 Y143.636 E.00017
G1 X140.076 Y143.486 E.00052
G1 X140.126 Y143.486 E.00017
G1 X140.135 Y143.336 E.00052
G1 X140.085 Y143.336 E.00017
G1 X140.093 Y143.186 E.00052
G1 X140.143 Y143.186 E.00017
G1 X140.152 Y143.036 E.00052
G1 X140.101 Y143.036 E.00017
G1 X140.11 Y142.886 E.00052
G1 X140.16 Y142.886 E.00017
G1 X140.168 Y142.736 E.00052
G1 X140.118 Y142.736 E.00017
G1 X140.127 Y142.586 E.00052
G1 X140.177 Y142.586 E.00017
G1 X140.185 Y142.436 E.00052
G1 X140.135 Y142.436 E.00018
G1 X140.144 Y142.286 E.00052
G1 X140.194 Y142.286 E.00018
G1 X140.202 Y142.136 E.00052
G1 X140.152 Y142.136 E.00018
G1 X140.16 Y141.986 E.00052
G1 X140.211 Y141.986 E.00018
G1 X140.219 Y141.836 E.00052
G1 X140.169 Y141.836 E.00018
G1 X140.177 Y141.686 E.00052
G1 X140.228 Y141.686 E.00018
G1 X140.236 Y141.536 E.00052
G1 X140.118 Y141.536 E.00041
; WIPE_START
G1 F24000
G1 X140.236 Y141.536 E-.04501
G1 X140.228 Y141.686 E-.05709
G1 X140.177 Y141.686 E-.01929
G1 X140.169 Y141.836 E-.05709
G1 X140.219 Y141.836 E-.01925
G1 X140.211 Y141.986 E-.05709
G1 X140.16 Y141.986 E-.01922
G1 X140.152 Y142.136 E-.05709
G1 X140.202 Y142.136 E-.01919
G1 X140.194 Y142.286 E-.05709
G1 X140.144 Y142.286 E-.01916
G1 X140.135 Y142.436 E-.05709
G1 X140.185 Y142.436 E-.01913
G1 X140.177 Y142.586 E-.05709
G1 X140.127 Y142.586 E-.0191
G1 X140.118 Y142.736 E-.05709
G1 X140.168 Y142.736 E-.01907
G1 X140.16 Y142.886 E-.05709
G1 X140.11 Y142.886 E-.01904
G1 X140.106 Y142.961 E-.02871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.427 J1.14 P1  F30000
G1 X148.219 Y139.924 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X148.069 Y139.98 E.00416
G2 X147.483 Y139.397 I-9.741 J9.223 E.02145
G1 X147.196 Y139.222 E.00872
G1 X147.249 Y139.105 E.00334
G1 X147.296 Y139.13 E.0014
G3 X148.18 Y139.878 I-2.072 J3.343 E.03017
M204 S10000
G1 X148.413 Y139.852 F30000
M204 S5000
G1 F12000
G1 X148.292 Y139.897 E.00336
G1 X148.292 Y136.048 E.09987
G1 X148.413 Y136.048 E.00315
G1 X148.413 Y139.792 E.09714
M204 S10000
; WIPE_START
G1 F24000
G1 X148.292 Y139.897 E-.06106
G1 X148.292 Y138.057 E-.69894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.05 J.615 P1  F30000
G1 X151.861 Y144.155 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X150.275 Y141.333 E.08401
G1 X150.468 Y141.225 E.00577
G1 X150.489 Y141.261 E.00107
G1 X152.053 Y144.047 E.08293
G1 X151.913 Y144.126 E.00417
M204 S10000
G1 X151.759 Y143.936 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X151.893 Y143.936 E.00047
G1 X151.808 Y143.786 E.0006
G1 X151.752 Y143.786 E.0002
G1 X151.667 Y143.636 E.0006
G1 X151.724 Y143.636 E.0002
G1 X151.64 Y143.486 E.0006
G1 X151.583 Y143.486 E.0002
G1 X151.499 Y143.336 E.0006
G1 X151.556 Y143.336 E.0002
G1 X151.471 Y143.186 E.0006
G1 X151.414 Y143.186 E.0002
G1 X151.33 Y143.036 E.0006
G1 X151.387 Y143.036 E.0002
G1 X151.303 Y142.886 E.0006
G1 X151.246 Y142.886 E.0002
G1 X151.161 Y142.736 E.0006
G1 X151.219 Y142.736 E.0002
G1 X151.134 Y142.586 E.0006
G1 X151.077 Y142.586 E.0002
G1 X150.993 Y142.436 E.0006
G1 X151.05 Y142.436 E.0002
G1 X150.966 Y142.286 E.0006
G1 X150.908 Y142.286 E.0002
G1 X150.824 Y142.136 E.0006
G1 X150.882 Y142.136 E.0002
G1 X150.798 Y141.986 E.0006
G1 X150.74 Y141.986 E.0002
G1 X150.655 Y141.836 E.0006
G1 X150.713 Y141.836 E.0002
G1 X150.629 Y141.686 E.0006
G1 X150.571 Y141.686 E.0002
G1 X150.487 Y141.536 E.0006
G1 X150.545 Y141.536 E.0002
G1 X150.461 Y141.386 E.0006
G1 X150.325 Y141.386 E.00047
; WIPE_START
G1 F24000
G1 X150.461 Y141.386 E-.05153
G1 X150.545 Y141.536 E-.06537
G1 X150.487 Y141.536 E-.02206
G1 X150.571 Y141.686 E-.06539
G1 X150.629 Y141.686 E-.02203
G1 X150.713 Y141.836 E-.06537
G1 X150.655 Y141.836 E-.02199
G1 X150.74 Y141.986 E-.06539
G1 X150.798 Y141.986 E-.02196
G1 X150.882 Y142.136 E-.06537
G1 X150.824 Y142.136 E-.02192
G1 X150.908 Y142.286 E-.06539
G1 X150.966 Y142.286 E-.02189
G1 X151.05 Y142.436 E-.06537
G1 X150.993 Y142.436 E-.02185
G1 X151.077 Y142.586 E-.06539
G1 X151.134 Y142.586 E-.02181
G1 X151.147 Y142.609 E-.00991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.187 J-.268 P1  F30000
G1 X150.524 Y139.843 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X150.067 Y139.397 I-8.807 J8.563 E.01658
G1 X149.78 Y139.223 E.0087
G1 X149.834 Y139.105 E.00337
G1 X149.882 Y139.13 E.00142
G3 X150.807 Y139.923 I-2.144 J3.437 E.03173
G1 X150.654 Y139.98 E.00423
G2 X150.565 Y139.887 I-8.937 J8.427 E.00333
M204 S10000
G1 X150.878 Y139.896 F30000
M204 S5000
G1 F12000
G1 X150.878 Y136.048 E.09987
G1 X150.999 Y136.048 E.00315
G1 X150.999 Y139.851 E.0987
G1 X150.934 Y139.876 E.00181
M204 S10000
; WIPE_START
G1 F24000
G1 X150.905 Y137.876 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.198 J.213 P1  F30000
G1 X151.859 Y132.499 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.209 Y132.379 E.01079
G1 X152.209 Y128.871 E.1023
G1 X152.291 Y128.871 E.00239
G1 X152.291 Y132.913 E.11787
G1 X152.082 Y132.977 E.00636
G2 X151.459 Y132.158 I-4.892 J3.079 E.03005
G1 X151.284 Y132.022 E.00647
G1 X151.329 Y131.944 E.00263
G3 X151.823 Y132.451 I-1.724 J2.176 E.02071
M204 S10000
G1 X152.293 Y132.836 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X152.066 Y132.836 E.00079
G1 X151.965 Y132.686 E.00063
G1 X152.226 Y132.686 E.00091
G1 X152.226 Y132.536 E.00052
G1 X151.762 Y132.536 E.00161
; WIPE_START
G1 F24000
G1 X152.226 Y132.536 E-.27467
G1 X152.226 Y132.686 E-.08885
G1 X151.965 Y132.686 E-.1546
G1 X152.066 Y132.836 E-.1071
G1 X152.293 Y132.836 E-.13478
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.243 J1.193 P1  F30000
G1 X156.153 Y132.051 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X156.291 Y131.879 E.00572
G1 X156.562 Y132.099 E.00905
G1 X161.032 Y135.719 E.14929
G1 X160.893 Y135.891 E.00575
G1 X156.199 Y132.089 E.15676
M204 S10000
; WIPE_START
G1 F24000
G1 X156.291 Y131.879 E-.08681
G1 X156.562 Y132.099 E-.13249
G1 X157.668 Y132.994 E-.5407
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.813 J.906 P1  F30000
G1 X160.669 Y135.686 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X160.856 Y135.686 E.00065
G1 X160.67 Y135.536 E.00083
G1 X160.591 Y135.536 E.00028
G1 X160.406 Y135.386 E.00083
G1 X160.485 Y135.386 E.00028
G1 X160.3 Y135.236 E.00083
G1 X160.221 Y135.236 E.00028
G1 X160.035 Y135.086 E.00083
G1 X160.115 Y135.086 E.00028
G1 X159.929 Y134.936 E.00083
G1 X159.85 Y134.936 E.00028
G1 X159.665 Y134.786 E.00083
G1 X159.744 Y134.786 E.00027
G1 X159.559 Y134.636 E.00083
G1 X159.48 Y134.636 E.00027
G1 X159.295 Y134.486 E.00083
G1 X159.374 Y134.486 E.00027
G1 X159.188 Y134.336 E.00083
G1 X159.11 Y134.336 E.00027
G1 X158.924 Y134.186 E.00083
G1 X159.003 Y134.186 E.00027
G1 X158.818 Y134.036 E.00083
G1 X158.739 Y134.036 E.00027
G1 X158.554 Y133.886 E.00083
G1 X158.633 Y133.886 E.00027
G1 X158.447 Y133.736 E.00083
G1 X158.369 Y133.736 E.00027
G1 X158.184 Y133.586 E.00083
G1 X158.262 Y133.586 E.00027
G1 X158.077 Y133.436 E.00083
G1 X157.999 Y133.436 E.00027
G1 X157.813 Y133.286 E.00083
G1 X157.892 Y133.286 E.00027
G1 X157.707 Y133.136 E.00083
G1 X157.628 Y133.136 E.00027
G1 X157.443 Y132.986 E.00083
G1 X157.521 Y132.986 E.00027
G1 X157.336 Y132.836 E.00083
G1 X157.258 Y132.836 E.00027
G1 X157.073 Y132.686 E.00083
G1 X157.151 Y132.686 E.00027
G1 X156.966 Y132.536 E.00083
G1 X156.888 Y132.536 E.00027
G1 X156.702 Y132.386 E.00083
G1 X156.78 Y132.386 E.00027
G1 X156.595 Y132.236 E.00083
G1 X156.517 Y132.236 E.00027
G1 X156.332 Y132.086 E.00083
G1 X156.517 Y132.086 E.00064
; WIPE_START
G1 F24000
G1 X156.332 Y132.086 E-.07031
G1 X156.517 Y132.236 E-.09055
G1 X156.595 Y132.236 E-.02958
G1 X156.78 Y132.386 E-.09057
G1 X156.702 Y132.386 E-.0296
G1 X156.888 Y132.536 E-.09055
G1 X156.966 Y132.536 E-.02963
G1 X157.151 Y132.686 E-.09057
G1 X157.073 Y132.686 E-.02966
G1 X157.258 Y132.836 E-.09055
G1 X157.336 Y132.836 E-.02968
G1 X157.518 Y132.983 E-.08873
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.867 J-.854 P1  F30000
G1 X153.563 Y128.97 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X153.885 Y129.638 E.01926
G1 X154.595 Y130.622 E.03147
G1 X154.985 Y131.263 E.01948
G1 X155.131 Y131.67 E.01123
G1 X155.184 Y132.138 E.01222
G1 X155.131 Y132.501 E.00951
G1 X154.97 Y132.848 E.00995
G3 X153.816 Y133.039 I-.666 J-.446 E.03401
G1 X153.622 Y132.818 E.00764
G1 X153.477 Y132.493 E.00922
G1 X153.433 Y132.149 E.009
G1 X153.549 Y132.149 E.00299
G2 X153.856 Y132.918 I1.096 J.008 E.02203
G2 X154.878 Y132.771 I.45 J-.5 E.03057
G1 X155.011 Y132.49 E.00807
G2 X155.059 Y131.945 I-1.451 J-.403 E.01428
G1 X154.953 Y131.499 E.0119
G1 X154.872 Y131.303 E.00551
G1 X154.082 Y130.143 E.0364
G1 X153.593 Y129.317 E.02493
G3 X153.466 Y128.85 I1.784 J-.732 E.01258
G1 X155.071 Y128.85 E.04165
G1 X155.071 Y128.97 E.0031
G1 X153.623 Y128.97 E.0376
M204 S10000
; WIPE_START
G1 F24000
G1 X153.885 Y129.638 E-.27293
G1 X154.595 Y130.622 E-.4608
G1 X154.631 Y130.681 E-.02627
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.136 J-.436 P1  F30000
G1 X151.955 Y123.699 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.305 Y123.579 E.01079
G1 X152.305 Y120.071 E.1023
G1 X152.383 Y120.071 E.00227
G1 X152.383 Y124.124 E.11818
G1 X152.18 Y124.186 E.00618
G2 X151.555 Y123.357 I-5.179 J3.25 E.03033
G1 X151.382 Y123.222 E.00639
G1 X151.428 Y123.143 E.00265
G3 X151.919 Y123.651 I-1.828 J2.26 E.02065
M204 S10000
G1 X152.385 Y123.986 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X152.124 Y123.986 E.00091
G2 X152.022 Y123.836 I-.931 J.522 E.00063
G1 X152.318 Y123.836 E.00103
G1 X152.318 Y123.686 E.00052
G1 X151.986 Y123.686 E.00116
; WIPE_START
G1 F24000
G1 X152.318 Y123.686 E-.20692
G1 X152.318 Y123.836 E-.09347
G1 X152.022 Y123.836 E-.18401
G1 X152.124 Y123.986 E-.11297
G1 X152.385 Y123.986 E-.16262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.672 J1.014 P1  F30000
G1 X154.756 Y122.415 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X155.144 Y123.393 I-.978 J.955 E.02805
G1 X155.086 Y123.793 E.01048
G1 X154.948 Y124.081 E.00828
G3 X153.741 Y124.077 I-.602 J-.393 E.03717
G3 X153.535 Y123.473 I1.023 J-.686 E.01675
G1 X153.656 Y123.462 E.00315
G2 X153.997 Y124.18 I1.086 J-.076 E.02112
G2 X154.895 Y123.942 I.347 J-.505 E.02737
G1 X154.998 Y123.662 E.00773
G1 X155.023 Y123.257 E.01055
G1 X154.962 Y122.938 E.00842
G2 X154.342 Y122.405 I-.808 J.313 E.02209
G1 X154.336 Y122.334 E.00185
G2 X154.979 Y121.975 I.035 J-.691 E.02014
G1 X155.11 Y121.66 E.00886
G1 X155.159 Y121.189 E.01229
G2 X154.786 Y120.23 I-1.417 J-.001 E.02734
G2 X153.826 Y120.366 I-.423 J.468 E.0287
G2 X153.617 Y120.967 I1.243 J.768 E.01666
G1 X153.503 Y120.953 E.00298
G1 X153.588 Y120.574 E.01009
G1 X153.732 Y120.291 E.00823
G3 X154.28 Y119.953 I.643 J.428 E.01723
G3 X154.874 Y120.155 I.058 J.804 E.01671
G1 X155.087 Y120.428 E.00899
G1 X155.227 Y120.784 E.00993
G1 X155.278 Y121.292 E.01325
G1 X155.208 Y121.749 E.012
G1 X155.053 Y122.078 E.00943
G1 X154.795 Y122.37 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X154.971 Y122.687 E-.13789
G1 X155.1 Y122.982 E-.12228
G1 X155.144 Y123.393 E-.1572
G1 X155.086 Y123.793 E-.15352
G1 X154.948 Y124.081 E-.12123
G1 X154.829 Y124.214 E-.06786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.037 J.636 P1  F30000
G1 X156.27 Y121.865 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X156.808 Y121.895 E.01401
G1 X159.676 Y122.054 E.07454
G1 X159.663 Y122.276 E.00577
G1 X156.258 Y122.085 E.08851
G1 X156.266 Y121.925 E.00416
M204 S10000
; WIPE_START
G1 F24000
G1 X156.808 Y121.895 E-.20632
G1 X158.263 Y121.975 E-.55368
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.096 J1.213 P1  F30000
G1 X159.031 Y122.036 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X156.279 Y122.036 E.00958
; WIPE_START
G1 F24000
G1 X158.279 Y122.036 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.798 J-.918 P1  F30000
G1 X149.953 Y114.798 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X150.305 Y114.678 E.01082
G1 X150.305 Y111.171 E.10227
G1 X150.387 Y111.171 E.00239
G1 X150.387 Y115.22 E.11805
G1 X150.18 Y115.283 E.0063
G2 X149.557 Y114.456 I-5.224 J3.291 E.03022
G1 X149.382 Y114.321 E.00644
G1 X149.427 Y114.243 E.00264
G3 X149.918 Y114.749 I-1.71 J2.147 E.02062
M204 S10000
G1 X150.389 Y115.136 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X150.16 Y115.136 E.0008
G1 X150.059 Y114.986 E.00063
G1 X150.322 Y114.986 E.00091
G1 X150.322 Y114.836 E.00052
G1 X149.858 Y114.836 E.00161
; WIPE_START
G1 F24000
G1 X150.322 Y114.836 E-.2741
G1 X150.322 Y114.986 E-.08864
G1 X150.059 Y114.986 E-.15506
G1 X150.16 Y115.136 E-.10676
G1 X150.389 Y115.136 E-.13544
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.124 J.467 P1  F30000
G1 X151.528 Y112.396 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X152.861 Y115.36 E.08435
G1 X152.75 Y115.411 E.00316
G1 X151.474 Y112.574 E.0807
G1 X151.474 Y112.274 E.00779
G1 X152.884 Y112.274 E.03659
G1 X152.884 Y111.15 E.02917
G1 X153.025 Y111.15 E.00367
G1 X153.025 Y112.274 E.02917
G1 X153.369 Y112.274 E.00893
G1 X153.369 Y112.396 E.00315
G1 X153.025 Y112.396 E.00893
G1 X153.025 Y113.972 E.0409
G1 X152.884 Y113.972 E.00367
G1 X152.884 Y112.396 E.0409
G1 X151.588 Y112.396 E.03363
M204 S10000
; WIPE_START
G1 F24000
G1 X152.377 Y114.234 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.811 J.907 P1  F30000
G1 X154.679 Y112.176 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X154.58 Y111.977 E.00575
G1 X159.265 Y109.663 E.1356
G1 X159.363 Y109.861 E.00575
G1 X154.732 Y112.149 E.13404
M204 S10000
G1 X155.021 Y111.986 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X154.755 Y111.986 E.00092
G1 X155.059 Y111.836 E.00118
G1 X155.172 Y111.836 E.00039
G1 X155.476 Y111.686 E.00118
G1 X155.363 Y111.686 E.00039
G1 X155.666 Y111.536 E.00118
G1 X155.78 Y111.536 E.00039
G1 X156.083 Y111.386 E.00118
G1 X155.97 Y111.386 E.00039
G1 X156.274 Y111.236 E.00118
G1 X156.387 Y111.236 E.00039
G1 X156.69 Y111.086 E.00118
G1 X156.577 Y111.086 E.00039
G1 X156.881 Y110.936 E.00118
G1 X156.994 Y110.936 E.00039
G1 X157.298 Y110.786 E.00118
G1 X157.184 Y110.786 E.00039
G1 X157.488 Y110.636 E.00118
G1 X157.601 Y110.636 E.00039
G1 X157.905 Y110.486 E.00118
G1 X157.792 Y110.486 E.00039
G1 X158.095 Y110.336 E.00118
G1 X158.209 Y110.336 E.00039
G1 X158.512 Y110.186 E.00118
G1 X158.399 Y110.186 E.00039
G1 X158.703 Y110.036 E.00118
G1 X158.816 Y110.036 E.00039
G1 X159.119 Y109.886 E.00118
G1 X158.854 Y109.886 E.00092
; WIPE_START
G1 F24000
G1 X159.119 Y109.886 E-.10096
G1 X158.816 Y110.036 E-.12869
G1 X158.703 Y110.036 E-.04305
G1 X158.399 Y110.186 E-.12869
G1 X158.512 Y110.186 E-.04305
G1 X158.209 Y110.336 E-.12869
G1 X158.095 Y110.336 E-.04305
G1 X157.792 Y110.486 E-.12869
G1 X157.831 Y110.486 E-.01512
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.005 J-1.217 P1  F30000
G1 X142.376 Y110.423 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X142.234 Y110.254 E.00572
G1 X150.694 Y103.155 E.28661
G1 X150.836 Y103.324 E.00572
G1 X142.422 Y110.384 E.28505
M204 S10000
G1 X142.629 Y110.186 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X142.448 Y110.186 E.00063
G1 X142.627 Y110.036 E.00081
G1 X142.703 Y110.036 E.00027
G1 X142.882 Y109.886 E.00081
G1 X142.806 Y109.886 E.00027
G1 X142.985 Y109.736 E.00081
G1 X143.061 Y109.736 E.00027
G1 X143.239 Y109.586 E.00081
G1 X143.163 Y109.586 E.00027
G1 X143.342 Y109.436 E.00081
G1 X143.418 Y109.436 E.00027
G1 X143.597 Y109.286 E.00081
G1 X143.521 Y109.286 E.00027
G1 X143.7 Y109.136 E.00081
G1 X143.776 Y109.136 E.00027
G1 X143.955 Y108.986 E.00081
G1 X143.878 Y108.986 E.00027
G1 X144.057 Y108.836 E.00081
G1 X144.133 Y108.836 E.00027
G1 X144.312 Y108.686 E.00081
G1 X144.236 Y108.686 E.00027
G1 X144.415 Y108.536 E.00081
G1 X144.491 Y108.536 E.00027
G1 X144.67 Y108.386 E.00081
G1 X144.593 Y108.386 E.00027
G1 X144.772 Y108.236 E.00081
G1 X144.848 Y108.236 E.00027
G1 X145.027 Y108.086 E.00081
G1 X144.951 Y108.086 E.00027
G1 X145.13 Y107.936 E.00081
G1 X145.206 Y107.936 E.00027
G1 X145.385 Y107.786 E.00081
G1 X145.308 Y107.786 E.00027
G1 X145.487 Y107.636 E.00081
G1 X145.563 Y107.636 E.00027
G1 X145.742 Y107.486 E.00081
G1 X145.666 Y107.486 E.00027
G1 X145.845 Y107.336 E.00081
G1 X145.921 Y107.336 E.00027
G1 X146.1 Y107.186 E.00081
G1 X146.024 Y107.186 E.00027
G1 X146.202 Y107.036 E.00081
G1 X146.279 Y107.036 E.00027
G1 X146.457 Y106.886 E.00081
G1 X146.381 Y106.886 E.00027
G1 X146.56 Y106.736 E.00081
G1 X146.636 Y106.736 E.00027
G1 X146.815 Y106.586 E.00081
G1 X146.739 Y106.586 E.00027
G1 X146.917 Y106.436 E.00081
G1 X146.994 Y106.436 E.00027
G1 X147.172 Y106.286 E.00081
G1 X147.096 Y106.286 E.00027
G1 X147.275 Y106.136 E.00081
G1 X147.351 Y106.136 E.00027
G1 X147.53 Y105.986 E.00081
G1 X147.454 Y105.986 E.00027
G1 X147.632 Y105.836 E.00081
G1 X147.709 Y105.836 E.00027
G1 X147.887 Y105.686 E.00081
G1 X147.811 Y105.686 E.00027
G1 X147.99 Y105.536 E.00081
G1 X148.066 Y105.536 E.00027
G1 X148.245 Y105.386 E.00081
G1 X148.169 Y105.386 E.00027
G1 X148.348 Y105.236 E.00081
G1 X148.424 Y105.236 E.00027
G1 X148.602 Y105.086 E.00081
G1 X148.526 Y105.086 E.00027
G1 X148.705 Y104.936 E.00081
G1 X148.781 Y104.936 E.00027
G1 X148.96 Y104.786 E.00081
G1 X148.884 Y104.786 E.00027
G1 X149.063 Y104.636 E.00081
G1 X149.139 Y104.636 E.00027
G1 X149.318 Y104.486 E.00081
G1 X149.241 Y104.486 E.00027
G1 X149.42 Y104.336 E.00081
G1 X149.496 Y104.336 E.00027
G1 X149.675 Y104.186 E.00081
G1 X149.599 Y104.186 E.00027
G1 X149.778 Y104.036 E.00081
G1 X149.854 Y104.036 E.00027
G1 X150.033 Y103.886 E.00081
G1 X149.956 Y103.886 E.00027
G1 X150.135 Y103.736 E.00081
G1 X150.211 Y103.736 E.00027
G1 X150.39 Y103.586 E.00081
G1 X150.314 Y103.586 E.00027
G1 X150.493 Y103.436 E.00081
G1 X150.569 Y103.436 E.00027
G1 X150.715 Y103.314 E.00066
G1 X150.692 Y103.286 E.00013
G1 X150.566 Y103.286 E.00044
; WIPE_START
G1 F24000
G1 X150.692 Y103.286 E-.04757
G1 X150.715 Y103.314 E-.01368
G1 X150.569 Y103.436 E-.0724
G1 X150.493 Y103.436 E-.02896
G1 X150.314 Y103.586 E-.08868
G1 X150.39 Y103.586 E-.02896
G1 X150.211 Y103.736 E-.08868
G1 X150.135 Y103.736 E-.02896
G1 X149.956 Y103.886 E-.08868
G1 X150.033 Y103.886 E-.02896
G1 X149.854 Y104.036 E-.08868
G1 X149.778 Y104.036 E-.02896
G1 X149.599 Y104.186 E-.08868
G1 X149.675 Y104.186 E-.02896
G1 X149.657 Y104.202 E-.0092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.973 J-.731 P1  F30000
G1 X141.366 Y115.234 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X142.531 Y115.234 E.03025
G1 X142.531 Y115.356 E.00315
G1 X141.26 Y115.356 E.03301
G1 X141.022 Y113.473 E.04925
G1 X141.136 Y113.42 E.00327
G1 X141.358 Y115.175 E.0459
M204 S10000
; WIPE_START
G1 F24000
G1 X142.531 Y115.234 E-.44635
G1 X142.531 Y115.356 E-.04616
G1 X141.828 Y115.356 E-.26749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.215 J.072 P1  F30000
G1 X141.922 Y113.764 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X142.214 Y113.636 I.021 J-.347 E.00858
G1 X142.333 Y113.48 E.0051
G1 X142.479 Y113.143 E.00953
G1 X142.549 Y112.565 E.0151
G1 X142.497 Y112.02 E.01421
G1 X142.348 Y111.592 E.01178
G2 X142.08 Y111.254 I-.748 J.317 E.01133
G2 X141.473 Y111.37 I-.235 J.418 E.01744
G1 X141.329 Y111.601 E.00705
G1 X141.219 Y112.023 E.01131
G1 X141.098 Y112.015 E.00313
G1 X141.238 Y111.518 E.01339
G1 X141.402 Y111.27 E.00772
G3 X142.014 Y111.094 I.444 J.394 E.01745
G3 X142.276 Y111.27 I-.177 J.547 E.00828
G3 X142.572 Y111.835 I-1.146 J.961 E.0167
G1 X142.67 Y112.531 E.01822
G1 X142.59 Y113.183 E.01704
G1 X142.428 Y113.553 E.01049
G3 X141.941 Y113.886 I-.57 J-.311 E.0159
G3 X141.701 Y113.812 I.005 J-.44 E.0066
G1 X141.204 Y113.389 E.01696
G1 X141.37 Y113.312 E.00477
G1 X141.717 Y113.68 E.01314
G2 X141.863 Y113.755 I.226 J-.264 E.00428
M204 S10000
; WIPE_START
G1 F24000
G1 X142.017 Y113.758 E-.05865
G1 X142.108 Y113.722 E-.03716
G1 X142.214 Y113.636 E-.05181
G1 X142.333 Y113.48 E-.07463
G1 X142.479 Y113.143 E-.13947
G1 X142.549 Y112.565 E-.22114
G1 X142.505 Y112.101 E-.17714
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.805 J-.913 P1  F30000
G1 X139.447 Y114.798 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.799 Y114.678 E.01082
G1 X139.799 Y111.171 E.10227
G1 X139.881 Y111.171 E.00239
G1 X139.881 Y115.233 E.11844
G1 X139.679 Y115.293 E.00614
G2 X139.052 Y114.457 I-5.266 J3.297 E.03051
G1 X138.88 Y114.322 E.00637
G1 X138.926 Y114.244 E.00264
G3 X139.412 Y114.749 I-1.71 J2.129 E.0205
M204 S10000
G1 X139.883 Y115.136 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X139.652 Y115.136 E.0008
G1 X139.552 Y114.986 E.00063
G1 X139.816 Y114.986 E.00092
G1 X139.816 Y114.836 E.00052
G1 X139.351 Y114.836 E.00162
; WIPE_START
G1 F24000
G1 X139.816 Y114.836 E-.27387
G1 X139.816 Y114.986 E-.08835
G1 X139.552 Y114.986 E-.1554
G1 X139.652 Y115.136 E-.10626
G1 X139.883 Y115.136 E-.13612
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.05 J-1.216 P1  F30000
G1 X129.255 Y114.699 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X129.605 Y114.579 E.01079
G1 X129.605 Y111.069 E.10235
G1 X129.685 Y111.069 E.00233
G1 X129.685 Y115.124 E.11823
G1 X129.48 Y115.187 E.00623
G2 X128.855 Y114.357 I-5.18 J3.251 E.03034
G1 X128.682 Y114.222 E.00639
G1 X128.727 Y114.144 E.00261
G3 X129.219 Y114.651 I-1.77 J2.211 E.02064
M204 S10000
G1 X129.687 Y114.986 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X129.424 Y114.986 E.00092
G2 X129.322 Y114.836 I-.93 J.522 E.00063
G1 X129.62 Y114.836 E.00103
G1 X129.62 Y114.686 E.00052
G1 X129.286 Y114.686 E.00116
; WIPE_START
G1 F24000
G1 X129.62 Y114.686 E-.20715
G1 X129.62 Y114.836 E-.09302
G1 X129.322 Y114.836 E-.18435
G1 X129.424 Y114.986 E-.11242
G1 X129.687 Y114.986 E-.16307
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.164 J1.206 P1  F30000
G1 X131.763 Y115.269 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X132.067 Y115.111 I-.018 J-.407 E.0092
G1 X132.187 Y114.903 E.00621
G1 X132.263 Y114.571 E.00883
G1 X132.384 Y114.581 E.00315
G1 X132.288 Y114.964 E.01025
G3 X131.915 Y115.365 I-.663 J-.244 E.01459
G3 X131.347 Y115.204 I-.158 J-.524 E.01618
G3 X131.05 Y114.633 I1.037 J-.903 E.01685
G1 X130.875 Y113.17 E.03824
G1 X130.993 Y111.811 E.03541
G1 X131.147 Y111.391 E.0116
G3 X131.492 Y111.023 I.873 J.473 E.01323
G3 X131.898 Y111.005 I.226 J.525 E.01079
G3 X132.193 Y111.266 I-.329 J.67 E.01033
G1 X132.356 Y111.619 E.01009
G1 X132.468 Y112.334 E.01878
G1 X132.394 Y113.017 E.01783
G1 X132.238 Y113.383 E.01032
G3 X131.57 Y113.68 I-.567 J-.374 E.02002
G1 X131.631 Y113.567 E.00334
G2 X132.139 Y113.321 I.073 J-.498 E.01555
G1 X132.282 Y112.977 E.00967
G1 X132.351 Y112.386 E.01546
G1 X132.291 Y111.843 E.01418
G2 X131.96 Y111.177 I-1.333 J.248 E.01956
G2 X131.43 Y111.209 I-.246 J.32 E.01503
G2 X131.24 Y111.47 I.974 J.907 E.00839
G1 X131.104 Y111.861 E.01073
G1 X131.009 Y112.557 E.01823
G1 X131.014 Y113.661 E.02867
G1 X131.136 Y114.499 E.02198
G1 X131.279 Y114.896 E.01093
G1 X131.43 Y115.12 E.00703
G2 X131.703 Y115.267 I.315 J-.258 E.00826
M204 S10000
; WIPE_START
G1 F24000
G1 X131.877 Y115.254 E-.06658
G1 X131.969 Y115.206 E-.03922
G1 X132.067 Y115.111 E-.05215
G1 X132.187 Y114.903 E-.09096
G1 X132.263 Y114.571 E-.12933
G1 X132.384 Y114.581 E-.04611
G1 X132.288 Y114.964 E-.15015
G1 X132.153 Y115.192 E-.10072
G1 X132.041 Y115.3 E-.05875
G1 X131.981 Y115.331 E-.02603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.198 J-.212 P1  F30000
G1 X131.08 Y110.244 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X132.774 Y103.8 E.17291
G1 X132.988 Y103.856 E.00574
G1 X131.294 Y110.3 E.17291
G1 X131.138 Y110.259 E.00418
M204 S10000
G1 X131.114 Y110.186 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X131.235 Y110.186 E.00042
G1 X131.275 Y110.036 E.00054
G1 X131.223 Y110.036 E.00018
G1 X131.263 Y109.886 E.00054
G1 X131.314 Y109.886 E.00018
G1 X131.353 Y109.736 E.00054
G1 X131.302 Y109.736 E.00018
G1 X131.342 Y109.586 E.00054
G1 X131.393 Y109.586 E.00018
G1 X131.432 Y109.436 E.00054
G1 X131.381 Y109.436 E.00018
G1 X131.42 Y109.286 E.00054
G1 X131.472 Y109.286 E.00018
G1 X131.511 Y109.136 E.00054
G1 X131.46 Y109.136 E.00018
G1 X131.499 Y108.986 E.00054
G1 X131.55 Y108.986 E.00018
G1 X131.59 Y108.836 E.00054
G1 X131.539 Y108.836 E.00018
G1 X131.578 Y108.686 E.00054
G1 X131.629 Y108.686 E.00018
G1 X131.669 Y108.536 E.00054
G1 X131.617 Y108.536 E.00018
G1 X131.657 Y108.386 E.00054
G1 X131.708 Y108.386 E.00018
G1 X131.748 Y108.236 E.00054
G1 X131.696 Y108.236 E.00018
G1 X131.736 Y108.086 E.00054
G1 X131.787 Y108.086 E.00018
G1 X131.826 Y107.936 E.00054
G1 X131.775 Y107.936 E.00018
G1 X131.815 Y107.786 E.00054
G1 X131.866 Y107.786 E.00018
G1 X131.905 Y107.636 E.00054
G1 X131.854 Y107.636 E.00018
G1 X131.893 Y107.486 E.00054
G1 X131.945 Y107.486 E.00018
G1 X131.984 Y107.336 E.00054
G1 X131.933 Y107.336 E.00018
G1 X131.972 Y107.186 E.00054
G1 X132.024 Y107.186 E.00018
G1 X132.063 Y107.036 E.00054
G1 X132.012 Y107.036 E.00018
G1 X132.051 Y106.886 E.00054
G1 X132.102 Y106.886 E.00018
G1 X132.142 Y106.736 E.00054
G1 X132.091 Y106.736 E.00018
G1 X132.13 Y106.586 E.00054
G1 X132.181 Y106.586 E.00018
G1 X132.221 Y106.436 E.00054
G1 X132.169 Y106.436 E.00018
G1 X132.209 Y106.286 E.00054
G1 X132.26 Y106.286 E.00018
G1 X132.3 Y106.136 E.00054
G1 X132.248 Y106.136 E.00018
G1 X132.288 Y105.986 E.00054
M73 P99 R0
G1 X132.339 Y105.986 E.00018
G1 X132.378 Y105.836 E.00054
G1 X132.327 Y105.836 E.00018
G1 X132.367 Y105.686 E.00054
G1 X132.418 Y105.686 E.00018
G1 X132.457 Y105.536 E.00054
G1 X132.406 Y105.536 E.00018
G1 X132.445 Y105.386 E.00054
G1 X132.497 Y105.386 E.00018
G1 X132.536 Y105.236 E.00054
G1 X132.485 Y105.236 E.00018
G1 X132.524 Y105.086 E.00054
G1 X132.576 Y105.086 E.00018
G1 X132.615 Y104.936 E.00054
G1 X132.564 Y104.936 E.00018
G1 X132.603 Y104.786 E.00054
G1 X132.654 Y104.786 E.00018
G1 X132.694 Y104.636 E.00054
G1 X132.643 Y104.636 E.00018
G1 X132.682 Y104.486 E.00054
G1 X132.733 Y104.486 E.00018
G1 X132.773 Y104.336 E.00054
G1 X132.721 Y104.336 E.00018
G1 X132.761 Y104.186 E.00054
G1 X132.812 Y104.186 E.00018
G1 X132.852 Y104.036 E.00054
G1 X132.731 Y104.036 E.00042
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X132.852 Y104.036 E-.04601
G1 X132.812 Y104.186 E-.05894
G1 X132.761 Y104.186 E-.01949
G1 X132.721 Y104.336 E-.05894
G1 X132.773 Y104.336 E-.01949
G1 X132.733 Y104.486 E-.05894
G1 X132.682 Y104.486 E-.01949
G1 X132.643 Y104.636 E-.05894
G1 X132.694 Y104.636 E-.01949
G1 X132.654 Y104.786 E-.05894
G1 X132.603 Y104.786 E-.01949
G1 X132.564 Y104.936 E-.05894
G1 X132.615 Y104.936 E-.01949
G1 X132.576 Y105.086 E-.05894
G1 X132.524 Y105.086 E-.01949
G1 X132.485 Y105.236 E-.05894
G1 X132.536 Y105.236 E-.01949
G1 X132.497 Y105.386 E-.05894
G1 X132.445 Y105.386 E-.01949
G1 X132.44 Y105.407 E-.00816
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20230118 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z2.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000
M991 S0 P-1 ;end smooth timelapse at safe pos
M400 S2 ;wait for last picture to be taken

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z102 F600
    G1 Z100

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power

M73 P100 R0
; EXECUTABLE_BLOCK_END

