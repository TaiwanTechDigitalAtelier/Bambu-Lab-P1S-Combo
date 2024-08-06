; HEADER_BLOCK_START
; BambuStudio 01.06.01.02
; model printing time: 18m 32s; total estimated time: 24m 33s
; total layer number: 15
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
; different_settings_to_system = brim_type;ironing_flow;ironing_speed;ironing_type;top_surface_speed;filament_flow_ratio;filament_flow_ratio;
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
; filament_flow_ratio = 0.95,0.95
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
; flush_multiplier = 1.5
; flush_volumes_matrix = 0,361,581,0
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
; top_shell_layers = 3
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
M73 P0 R24
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
M73 P17 R20
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
M73 P18 R20
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
M73 P19 R19
G1 X76 F15000
M73 P20 R19
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
    G29 A X73.7087 Y118.668 I119.719 J126.261
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
M73 P21 R19
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
M73 P22 R19
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
M73 P22 R18
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
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
; layer num/total_layer_count: 1/15
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
M73 P23 R18
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
G1  Y224.000  E0.0190
G1  X189.000  E1.2542
G1  Y224.500  E0.0190
G1  X156.000  E1.2542
G1  Y225.000  E0.0190
G1  X189.000  E1.2542
G1  Y225.500  E0.0190
G1  X156.000  E1.2542
M73 P24 R18
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
G1  Y235.000  E0.0190
G1  X189.000  E1.2542
G1  Y235.500  E0.0190
G1  X156.000  E1.2542
M73 P25 R18
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
M73 P26 R18
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
G3 Z.6 I1.005 J-.686 P1  F30000
G1 X76.129 Y129.785 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
M73 P26 R17
G1 F3000
G1 X76.188 Y129.632 E.00593
G3 X92.009 Y118.283 I17.515 J7.715 E.73752
G3 X94.301 Y118.218 I1.928 J27.236 E.0828
G3 X75.761 Y130.684 I-.598 J19.129 E3.48047
G1 X76.106 Y129.841 E.03288
G1 X75.705 Y129.614 F30000
; FEATURE: Outer wall
G1 F3000
M73 P27 R17
G1 X75.769 Y129.448 E.00642
G3 X90.815 Y117.965 I17.933 J7.899 E.71318
G3 X94.328 Y117.761 I2.882 J19.284 E.12722
G3 X75.333 Y130.524 I-.625 J19.586 E3.56316
G1 X75.683 Y129.669 E.03337
; WIPE_START
G1 F24000
G1 X75.769 Y129.448 E-.09031
G1 X76.272 Y128.4 E-.44145
G1 X76.562 Y127.874 E-.22824
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.24 J1.193 P1  F30000
G1 X105.021 Y122.144 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500279
G1 F6300
G1 X107.166 Y124.289 E.10961
G3 X109.536 Y127.305 I-13.801 J13.281 E.13881
G1 X103.72 Y121.492 E.29709
G2 X102.244 Y120.661 I-7.741 J12.014 E.06122
G1 X110.414 Y128.83 E.4174
G1 X110.871 Y129.79 E.03841
G1 X110.97 Y130.033 E.00945
G1 X101.027 Y120.09 E.50798
G2 X99.968 Y119.678 I-4 J8.715 E.04107
G1 X111.38 Y131.09 E.58305
G3 X111.693 Y132.05 I-7.932 J3.118 E.0365
G1 X99.014 Y119.371 E.64782
G2 X98.13 Y119.133 I-2.399 J7.174 E.03309
G1 X111.936 Y132.94 E.70541
G1 X112.109 Y133.76 E.03026
G1 X97.299 Y118.95 E.75668
M73 P28 R17
G1 X96.511 Y118.808 E.02894
G1 X112.242 Y134.539 E.80377
G3 X112.345 Y135.289 I-6.261 J1.238 E.02734
G1 X95.774 Y118.718 E.84664
G2 X95.061 Y118.652 I-.915 J5.973 E.02589
G1 X112.408 Y135.999 E.88631
G3 X112.443 Y136.68 I-5.723 J.631 E.02466
G1 X94.374 Y118.611 E.9232
G2 X93.721 Y118.605 I-.376 J5.615 E.02359
G1 X112.462 Y137.347 E.95755
G3 X112.444 Y137.975 I-5.304 J.159 E.02273
G1 X93.078 Y118.609 E.98947
G1 X92.467 Y118.645 E.0221
G1 X112.418 Y138.595 E1.01931
G1 X112.365 Y139.189 E.02154
G1 X91.867 Y118.691 E1.0473
G1 X91.289 Y118.76 E.02103
G1 X112.3 Y139.772 E1.07355
G1 X112.216 Y140.335 E.02056
G1 X90.723 Y118.841 E1.09818
G1 X90.174 Y118.939 E.02013
G1 X112.121 Y140.886 E1.12131
G1 X112.008 Y141.42 E.01973
G1 X89.637 Y119.049 E1.14301
G1 X89.116 Y119.175 E.01936
G1 X111.886 Y141.945 E1.16338
G1 X111.747 Y142.453 E.01903
G1 X88.603 Y119.309 E1.18248
G1 X88.108 Y119.46 E.01872
G1 X111.602 Y142.954 E1.20037
G1 X111.439 Y143.438 E.01843
G1 X87.617 Y119.616 E1.21712
G1 X87.145 Y119.791 E.01818
G1 X111.273 Y143.919 E1.23277
G1 X111.087 Y144.379 E.01794
G1 X86.674 Y119.966 E1.24733
G2 X86.224 Y120.163 I1.437 J3.888 E.01775
G1 X110.9 Y144.839 E1.26077
G3 X110.695 Y145.281 I-3.823 J-1.509 E.0176
G1 X85.775 Y120.361 E1.27322
G2 X85.341 Y120.574 I1.579 J3.762 E.01747
G1 X110.486 Y145.719 E1.28472
G3 X110.265 Y146.145 I-3.702 J-1.644 E.01735
G1 X84.914 Y120.794 E1.29529
G2 X84.495 Y121.021 I1.707 J3.645 E.01724
G1 X110.036 Y146.562 E1.30497
G3 X109.801 Y146.975 I-3.592 J-1.768 E.01715
G1 X84.088 Y121.261 E1.31377
G2 X83.682 Y121.502 I1.827 J3.54 E.01706
G1 X109.551 Y147.371 E1.32172
G1 X109.301 Y147.768 E.01694
G1 X83.296 Y121.763 E1.32867
G1 X82.909 Y122.023 E.01683
G1 X109.033 Y148.147 E1.33477
G1 X108.763 Y148.524 E.01675
G1 X82.535 Y122.296 E1.34005
G1 X82.169 Y122.576 E.01667
G1 X108.484 Y148.892 E1.34453
G1 X108.194 Y149.249 E.01661
G1 X81.807 Y122.861 E1.34822
M73 P29 R17
G1 X81.459 Y123.16 E.01657
G1 X107.904 Y149.605 E1.35114
G1 X107.595 Y149.943 E.01654
G1 X81.112 Y123.46 E1.3531
G2 X80.78 Y123.775 I2.489 J2.951 E.01654
G1 X107.286 Y150.281 E1.35425
G3 X106.965 Y150.607 I-2.908 J-2.538 E.01653
G1 X80.452 Y124.094 E1.35464
G2 X80.131 Y124.42 I2.587 J2.865 E.01653
G1 X106.637 Y150.925 E1.35425
G3 X106.305 Y151.241 I-2.822 J-2.637 E.01654
G1 X79.822 Y124.757 E1.3531
G1 X79.513 Y125.095 E.01654
G1 X105.958 Y151.54 E1.35114
G1 X105.611 Y151.839 E.01657
G1 X79.223 Y125.452 E1.34822
G1 X78.933 Y125.809 E.01661
G1 X105.249 Y152.124 E1.34453
G1 X104.882 Y152.404 E.01667
G1 X78.654 Y126.176 E1.34005
G1 X78.384 Y126.553 E.01675
G1 X104.508 Y152.677 E1.33477
G1 X104.122 Y152.938 E.01683
G1 X78.117 Y126.933 E1.32867
G1 X77.866 Y127.329 E.01694
G1 X103.735 Y153.198 E1.32171
G3 X103.329 Y153.439 I-2.234 J-3.3 E.01706
G1 X77.616 Y127.726 E1.31377
G2 X77.382 Y128.138 I3.357 J2.18 E.01715
G1 X102.923 Y153.679 E1.30497
G3 X102.504 Y153.907 I-2.126 J-3.418 E.01724
G1 X77.152 Y128.555 E1.29529
G2 X76.931 Y128.981 I3.483 J2.071 E.01735
G1 X102.076 Y154.126 E1.28472
G3 X101.642 Y154.339 I-2.012 J-3.547 E.01747
G1 X76.723 Y129.419 E1.27322
G2 X76.517 Y129.861 I3.617 J1.95 E.0176
G1 X101.193 Y154.537 E1.26077
G3 X100.744 Y154.734 I-1.887 J-3.691 E.01775
G1 X76.331 Y130.321 E1.24733
G1 X76.144 Y130.781 E.01794
G1 X100.272 Y154.909 E1.23277
G1 X99.8 Y155.084 E.01818
G1 X75.979 Y131.263 E1.21712
G1 X75.815 Y131.746 E.01843
G1 X99.309 Y155.24 E1.20037
G1 X98.814 Y155.391 E.01872
G1 X75.67 Y132.248 E1.18248
G1 X75.531 Y132.756 E.01903
G1 X98.301 Y155.526 E1.16338
G1 X97.78 Y155.651 E.01936
G1 X75.409 Y133.28 E1.14301
G1 X75.296 Y133.814 E.01973
G1 X97.243 Y155.761 E1.12131
G1 X96.695 Y155.86 E.02013
G1 X75.201 Y134.366 E1.09818
M73 P30 R17
G1 X75.117 Y134.928 E.02056
G1 X96.128 Y155.94 E1.07355
G1 X95.551 Y156.009 E.02103
G1 X75.053 Y135.511 E1.04729
G1 X75 Y136.105 E.02154
G1 X94.95 Y156.055 E1.01931
G1 X94.339 Y156.091 E.0221
G1 X74.973 Y136.725 E.98947
G2 X74.955 Y137.354 I5.265 J.469 E.02273
G1 X93.697 Y156.096 E.95759
G3 X93.044 Y156.089 I-.272 J-5.507 E.02362
G1 X74.975 Y138.02 E.9232
G2 X75.009 Y138.702 I5.758 J.05 E.02466
G1 X92.356 Y156.049 E.8863
G3 X91.643 Y155.982 I.202 J-6.04 E.02589
G1 X75.072 Y139.412 E.84664
G2 X75.175 Y140.161 I6.364 J-.488 E.02734
G1 X90.906 Y155.893 E.80377
G1 X90.118 Y155.751 E.02894
G1 X75.308 Y140.941 E.75668
G1 X75.481 Y141.761 E.03027
G1 X89.287 Y155.567 E.70541
G3 X88.404 Y155.331 I1.55 J-7.559 E.03305
G1 X75.724 Y142.651 E.64785
G2 X76.037 Y143.61 I8.244 J-2.158 E.0365
G1 X87.449 Y155.022 E.58305
G3 X86.39 Y154.61 I2.942 J-9.127 E.04107
G1 X76.448 Y144.668 E.50798
G1 X76.546 Y144.91 E.00945
G1 X77.003 Y145.87 E.03842
G1 X85.173 Y154.04 E.4174
G3 X83.689 Y153.203 I12.587 J-24.049 E.06155
G1 X77.881 Y147.395 E.29673
G2 X80.251 Y150.412 I15.427 J-9.68 E.13885
G1 X82.396 Y152.557 E.10958
; WIPE_START
G1 F24000
G1 X80.982 Y151.142 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.549 J1.086 P1  F30000
G1 X139.022 Y121.816 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P30 R16
G1 F3000
G3 X149.377 Y117.596 I12.085 J14.842 E.40972
G3 X151.669 Y117.526 I1.979 J27.233 E.0828
G1 X151.669 Y117.526 E0
G3 X138.975 Y121.854 I-.562 J19.131 E3.84731
G1 X138.733 Y121.462 F30000
; FEATURE: Outer wall
G1 F3000
G3 X148.183 Y117.28 I12.373 J15.195 E.37755
G3 X151.695 Y117.07 I2.918 J19.281 E.12722
G3 X138.687 Y121.499 I-.589 J19.586 E3.93846
; WIPE_START
G1 F24000
G1 X139.657 Y120.757 E-.46423
M73 P31 R16
G1 X140.301 Y120.321 E-.29577
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.062 J1.215 P1  F30000
G1 X162.43 Y121.458 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500291
G1 F6300
G1 X164.546 Y123.573 E.10811
G3 X166.939 Y126.613 I-13.035 J12.723 E.14002
G1 X161.094 Y120.783 E.29825
G2 X159.65 Y119.971 I-7.56 J11.759 E.05989
G1 X167.815 Y128.137 E.41721
G3 X168.372 Y129.34 I-9.86 J5.292 E.04794
G1 X158.433 Y119.401 E.50782
G2 X157.374 Y118.989 I-4.001 J8.715 E.04108
G1 X168.783 Y130.398 E.58292
G3 X169.096 Y131.358 I-7.933 J3.117 E.03649
G1 X156.419 Y118.68 E.64775
G2 X155.535 Y118.443 I-2.439 J7.329 E.03308
G1 X169.34 Y132.248 E.70534
G1 X169.514 Y133.069 E.03034
G1 X154.703 Y118.259 E.75673
G1 X153.917 Y118.119 E.02887
G1 X169.646 Y133.848 E.80369
G3 X169.748 Y134.597 I-6.255 J1.231 E.02731
G1 X153.179 Y118.028 E.84657
G2 X152.465 Y117.961 I-.922 J5.982 E.02592
G1 X169.813 Y135.309 E.88636
G3 X169.847 Y135.989 I-5.717 J.624 E.02463
G1 X151.779 Y117.922 E.92314
G2 X151.126 Y117.915 I-.384 J5.622 E.02362
G1 X169.866 Y136.655 E.95751
G1 X169.848 Y137.284 E.02275
G1 X150.482 Y117.918 E.98952
G1 X149.872 Y117.955 E.02206
G1 X169.821 Y137.904 E1.01928
G1 X169.769 Y138.499 E.02158
G1 X149.271 Y118 E1.04736
G1 X148.694 Y118.07 E.021
G1 X169.704 Y139.081 E1.07351
G1 X169.621 Y139.644 E.02059
G1 X148.127 Y118.15 E1.09825
G1 X147.579 Y118.249 E.0201
G1 X169.525 Y140.195 E1.12128
G1 X169.413 Y140.73 E.01975
G1 X147.041 Y118.358 E1.14308
G1 X146.521 Y118.485 E.01934
G1 X169.29 Y141.254 E1.16336
G1 X169.152 Y141.762 E.01905
G1 X146.007 Y118.618 E1.18255
G1 X145.513 Y118.77 E.0187
G1 X169.006 Y142.263 E1.20036
G1 X168.843 Y142.747 E.01845
G1 X145.02 Y118.925 E1.21719
G1 X144.55 Y119.101 E.01816
G1 X168.677 Y143.228 E1.23275
G1 X168.491 Y143.689 E.01796
G1 X144.079 Y119.277 E1.24732
G2 X143.628 Y119.473 I1.428 J3.894 E.01777
G1 X168.305 Y144.15 E1.26084
G3 X168.099 Y144.59 I-3.816 J-1.517 E.01759
G1 X143.18 Y119.671 E1.27321
G2 X142.745 Y119.884 I1.57 J3.769 E.01748
G1 X167.891 Y145.029 E1.28479
G3 X167.669 Y145.455 I-3.695 J-1.652 E.01734
G1 X142.318 Y120.104 E1.29529
M73 P32 R16
G2 X141.898 Y120.33 I1.7 J3.653 E.01726
G1 X167.44 Y145.872 E1.30504
G3 X167.205 Y146.284 I-3.586 J-1.777 E.01714
G1 X141.492 Y120.571 E1.31377
G1 X141.086 Y120.812 E.01705
G1 X166.955 Y146.681 E1.32175
G1 X166.706 Y147.078 E.01695
G1 X140.7 Y121.072 E1.32875
G1 X140.314 Y121.333 E.01683
G1 X166.437 Y147.457 E1.33476
G1 X166.168 Y147.834 E.01675
G1 X139.939 Y121.605 E1.34012
G1 X139.573 Y121.886 E.01667
G1 X165.888 Y148.201 E1.34453
G1 X165.599 Y148.558 E.01662
G1 X139.21 Y122.17 E1.3483
G1 X138.863 Y122.47 E.01657
G1 X165.307 Y148.914 E1.35114
G1 X164.999 Y149.252 E.01654
G1 X138.517 Y122.77 E1.3531
G2 X138.184 Y123.084 I2.481 J2.958 E.01654
G1 X164.691 Y149.591 E1.35433
G3 X164.369 Y149.916 I-2.901 J-2.547 E.01653
G1 X137.857 Y123.404 E1.35464
G2 X137.535 Y123.729 I2.58 J2.872 E.01653
G1 X164.041 Y150.235 E1.35433
G3 X163.709 Y150.55 I-2.814 J-2.644 E.01654
G1 X137.227 Y124.067 E1.3531
G1 X136.918 Y124.406 E.01654
G1 X163.362 Y150.85 E1.35114
G1 X163.015 Y151.15 E.01657
G1 X136.627 Y124.761 E1.3483
G1 X136.338 Y125.119 E.01662
G1 X162.652 Y151.434 E1.34453
G1 X162.286 Y151.714 E.01667
G1 X136.058 Y125.486 E1.34012
G1 X135.788 Y125.863 E.01675
G1 X161.912 Y151.987 E1.33476
G1 X161.526 Y152.248 E.01683
G1 X135.52 Y126.242 E1.32875
G1 X135.27 Y126.639 E.01695
G1 X161.139 Y152.508 E1.32175
G1 X160.733 Y152.749 E.01705
G1 X135.021 Y127.036 E1.31376
G2 X134.785 Y127.448 I3.349 J2.188 E.01714
G1 X160.327 Y152.989 E1.30504
G3 X159.907 Y153.216 I-2.12 J-3.426 E.01726
G1 X134.556 Y127.865 E1.29528
G2 X134.335 Y128.291 I3.474 J2.078 E.01734
G1 X159.48 Y153.436 E1.28479
G3 X159.046 Y153.648 I-1.966 J-3.481 E.01749
G1 X134.127 Y128.729 E1.2732
G2 X133.921 Y129.17 I3.61 J1.958 E.01759
G1 X158.597 Y153.846 E1.2608
G3 X158.147 Y154.043 I-1.92 J-3.773 E.01775
G1 X133.735 Y129.631 E1.24731
G1 X133.549 Y130.092 E.01796
G1 X157.676 Y154.219 E1.23275
G1 X157.205 Y154.395 E.01816
G1 X133.383 Y130.572 E1.21719
M73 P33 R16
G1 X133.22 Y131.057 E.01845
G1 X156.713 Y154.55 E1.20036
G1 X156.218 Y154.702 E.0187
G1 X133.074 Y131.557 E1.18255
G1 X132.936 Y132.066 E.01905
G1 X155.705 Y154.835 E1.16336
G1 X155.185 Y154.962 E.01934
G1 X132.813 Y132.59 E1.14308
G1 X132.701 Y133.125 E.01975
G1 X154.646 Y155.07 E1.12128
G1 X154.099 Y155.17 E.0201
G1 X132.605 Y133.675 E1.09824
G1 X132.521 Y134.239 E.02059
G1 X153.532 Y155.249 E1.07351
G1 X152.955 Y155.319 E.021
G1 X132.456 Y134.821 E1.04735
G1 X132.405 Y135.416 E.02158
G1 X152.353 Y155.365 E1.01927
G1 X151.744 Y155.402 E.02206
G1 X132.377 Y136.035 E.98952
G1 X132.36 Y136.665 E.02275
G1 X151.101 Y155.405 E.95755
G3 X150.446 Y155.398 I-.265 J-5.516 E.02365
G1 X132.379 Y137.331 E.92314
G2 X132.413 Y138.011 I5.751 J.057 E.02463
G1 X149.76 Y155.359 E.88636
G3 X149.046 Y155.292 I.208 J-6.049 E.02592
G1 X132.477 Y138.723 E.84657
G2 X132.579 Y139.471 I12.282 J-1.288 E.0273
G1 X148.309 Y155.201 E.80369
G1 X147.522 Y155.061 E.02887
G1 X132.712 Y140.251 E.75673
G1 X132.886 Y141.072 E.03034
G1 X146.691 Y154.876 E.70533
G3 X145.807 Y154.639 I1.555 J-7.565 E.03308
G1 X133.129 Y141.962 E.64774
G2 X133.442 Y142.922 I8.244 J-2.157 E.03649
G1 X144.851 Y154.33 E.58291
G3 X143.792 Y153.918 I2.943 J-9.128 E.04108
G1 X133.853 Y143.98 E.50781
G2 X134.41 Y145.183 I10.42 J-4.09 E.04794
G1 X142.576 Y153.349 E.4172
G3 X141.088 Y152.507 I11.438 J-21.97 E.06177
G1 X135.287 Y146.707 E.29637
G2 X137.68 Y149.747 I15.431 J-9.686 E.14005
G1 X139.795 Y151.862 E.10805
M106 S255
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.381 Y150.448 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/15
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
G3 Z.6 I-1.054 J.608 P1  F30000
G1 X189.5 Y239 Z.6
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X155.500 Y239.000  E1.2922 F5400
M73 P34 R16
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
G3 Z.8 I.852 J-.869 P1  F30000
G1 X75.906 Y129.655 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X75.954 Y129.529 E.00433
G3 X84.344 Y120.363 I17.748 J7.821 E.40674
G3 X94.416 Y117.969 I9.353 J16.963 E.337
G3 X75.522 Y130.595 I-.714 J19.381 E3.13778
G1 X75.884 Y129.711 E.03071
G1 X75.543 Y129.508 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P34 R15
G1 F12000
G1 X75.595 Y129.371 E.00436
G3 X84.154 Y120.019 I18.106 J7.978 E.38439
G3 X94.439 Y117.578 I9.541 J17.305 E.31874
G3 X75.154 Y130.458 I-.738 J19.772 E2.96493
G1 X75.52 Y129.563 E.0288
M204 S10000
; WIPE_START
G1 F24000
G1 X75.595 Y129.371 E-.07839
M73 P35 R15
G1 X76.102 Y128.314 E-.44574
G1 X76.402 Y127.77 E-.23587
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.875 J.846 P1  F30000
G1 X78.416 Y125.685 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420385
G1 F15000
G1 X80.039 Y124.062 E.06843
G3 X83.145 Y121.49 I13.296 J12.894 E.12049
G1 X77.831 Y126.804 E.22407
G2 X77.023 Y128.145 I10.898 J7.475 E.04672
G1 X84.524 Y120.645 E.31626
G1 X85.606 Y120.097 E.03618
G1 X76.466 Y129.236 E.3854
G2 X76.051 Y130.185 I7.788 J3.973 E.03091
G1 X86.558 Y119.678 E.44306
G1 X87.407 Y119.363 E.02701
G1 X75.725 Y131.046 E.49264
G2 X75.458 Y131.846 I6.609 J2.645 E.02516
G1 X88.195 Y119.109 E.53706
G3 X88.94 Y118.898 I2.152 J6.172 E.0231
G1 X75.258 Y132.58 E.57694
G2 X75.092 Y133.28 I5.81 J1.744 E.02144
G1 X89.643 Y118.728 E.6136
G3 X90.305 Y118.601 I1.404 J5.507 E.02009
G1 X74.95 Y133.956 E.64748
G2 X74.854 Y134.585 I5.254 J1.117 E.01898
G1 X90.951 Y118.488 E.67876
G1 X91.557 Y118.416 E.0182
G1 X74.768 Y135.205 E.70794
G1 X74.716 Y135.791 E.01754
G1 X92.154 Y118.353 E.7353
G1 X92.721 Y118.319 E.01695
G1 X74.674 Y136.367 E.76103
G1 X74.657 Y136.917 E.01641
G1 X93.279 Y118.295 E.78525
G1 X93.81 Y118.298 E.01582
G1 X74.648 Y137.461 E.80803
G1 X74.663 Y137.979 E.01547
G1 X94.34 Y118.302 E.82975
G3 X94.848 Y118.328 I.003 J4.78 E.01515
G1 X74.679 Y138.497 E.85045
G1 X74.723 Y138.987 E.01467
G1 X95.352 Y118.358 E.86985
G3 X95.831 Y118.412 I-.216 J4.067 E.0144
G1 X74.767 Y139.477 E.88824
G2 X74.829 Y139.948 I4.001 J-.292 E.01418
G1 X96.308 Y118.469 E.90571
G3 X96.772 Y118.54 I-.36 J3.941 E.01399
G1 X74.899 Y140.413 E.92233
G2 X74.976 Y140.869 I3.887 J-.422 E.01382
G1 X97.224 Y118.621 E.93816
G3 X97.675 Y118.704 I-.477 J3.836 E.01367
G1 X75.069 Y141.31 E.95324
G1 X75.162 Y141.751 E.01344
G1 X98.105 Y118.808 E.96745
G1 X98.535 Y118.912 E.01319
G1 X75.272 Y142.174 E.98091
G1 X75.387 Y142.593 E.01296
G1 X98.953 Y119.027 E.99374
G1 X99.362 Y119.152 E.01275
G1 X75.506 Y143.008 E1.00596
G1 X75.641 Y143.407 E.01256
G1 X99.771 Y119.277 E1.01751
G3 X100.162 Y119.419 I-1.005 J3.368 E.01242
G1 X75.776 Y143.806 E1.02833
G2 X75.921 Y144.195 I3.346 J-1.03 E.01238
G1 X100.552 Y119.564 E1.03861
G3 X100.938 Y119.712 I-1.053 J3.327 E.01233
G1 X76.075 Y144.574 E1.0484
G1 X76.229 Y144.954 E.01222
G1 X101.308 Y119.875 E1.05753
G1 X101.679 Y120.038 E.01207
G1 X76.397 Y145.32 E1.06605
G1 X76.57 Y145.681 E.01194
G1 X102.043 Y120.208 E1.07413
G1 X102.395 Y120.389 E.01182
G1 X76.742 Y146.043 E1.08174
G2 X76.931 Y146.387 I2.997 J-1.42 E.01173
G1 X102.748 Y120.57 E1.08864
G3 X103.092 Y120.761 I-1.43 J2.99 E.01172
G1 X77.121 Y146.732 E1.09513
G2 X77.312 Y147.074 I2.983 J-1.44 E.01171
G1 X103.427 Y120.959 E1.10122
G1 X103.763 Y121.157 E.01162
G1 X77.519 Y147.401 E1.10666
G1 X77.725 Y147.729 E.01154
G1 X104.088 Y121.366 E1.11166
G1 X104.407 Y121.581 E.01147
G1 X77.934 Y148.053 E1.11628
G1 X78.157 Y148.364 E.01141
G1 X104.726 Y121.796 E1.12033
G3 X105.034 Y122.022 I-1.752 J2.705 E.01139
G1 X78.381 Y148.675 E1.1239
G2 X78.607 Y148.982 I2.702 J-1.754 E.01139
G1 X105.336 Y122.253 E1.12711
G1 X105.639 Y122.484 E.01136
G1 X78.846 Y149.277 E1.12979
G1 X79.085 Y149.571 E.01132
G1 X105.93 Y122.727 E1.13198
G1 X106.217 Y122.974 E.01129
G1 X79.328 Y149.862 E1.13383
G1 X79.583 Y150.141 E.01127
G1 X106.503 Y123.221 E1.13516
G3 X106.778 Y123.48 I-2.044 J2.446 E.01127
G1 X79.838 Y150.42 E1.136
G2 X80.097 Y150.695 I2.445 J-2.044 E.01127
G1 X107.049 Y123.743 E1.1365
G1 X107.32 Y124.006 E.01126
G1 X80.368 Y150.958 E1.1365
G1 X80.639 Y151.221 E.01126
G1 X107.579 Y124.28 E1.136
G1 X107.834 Y124.559 E.01127
G1 X80.914 Y151.48 E1.13516
G1 X81.201 Y151.727 E.01129
G1 X108.089 Y124.838 E1.13383
G3 X108.332 Y125.129 I-2.33 J2.192 E.01131
G1 X81.487 Y151.974 E1.13198
G2 X81.778 Y152.217 I2.191 J-2.331 E.01131
G1 X108.571 Y125.424 E1.12979
G1 X108.81 Y125.718 E.01132
G1 X82.081 Y152.448 E1.12711
G1 X82.384 Y152.679 E.01136
G1 X109.037 Y126.026 E1.1239
G1 X109.26 Y126.336 E.01141
G1 X82.691 Y152.905 E1.12033
G1 X83.01 Y153.12 E.01147
G1 X109.483 Y126.647 E1.11628
G3 X109.692 Y126.972 I-2.63 J1.927 E.01152
G1 X83.329 Y153.335 E1.11166
G2 X83.654 Y153.543 I1.922 J-2.635 E.01153
G1 X109.899 Y127.299 E1.10666
G1 X110.105 Y127.626 E.01154
G1 X83.99 Y153.742 E1.10122
G1 X84.326 Y153.94 E.01162
G1 X110.297 Y127.969 E1.09513
G1 X110.486 Y128.313 E.01172
G1 X84.669 Y154.13 E1.08864
M73 P36 R15
G1 X85.022 Y154.311 E.01182
G1 X110.675 Y128.658 E1.08174
G1 X110.848 Y129.019 E.01194
G1 X85.375 Y154.492 E1.07413
G2 X85.739 Y154.662 I1.615 J-2.979 E.01198
G1 X111.02 Y129.381 E1.06605
G3 X111.188 Y129.746 I-2.995 J1.601 E.012
G1 X86.109 Y154.825 E1.05753
G1 X86.48 Y154.989 E.01207
G1 X111.342 Y130.126 E1.0484
G1 X111.496 Y130.506 E.01222
G1 X86.866 Y155.136 E1.03861
G1 X87.255 Y155.281 E.01238
G1 X111.642 Y130.894 E1.02833
G1 X111.776 Y131.293 E.01256
G1 X87.652 Y155.418 E1.01729
G1 X88.058 Y155.545 E.01271
G1 X111.911 Y131.692 E1.00582
G3 X112.03 Y132.107 I-3.434 J1.211 E.01287
G1 X88.465 Y155.672 E.99369
G2 X88.883 Y155.788 I1.097 J-3.129 E.01293
G1 X112.145 Y132.526 E.98091
G3 X112.256 Y132.949 I-3.508 J1.145 E.01305
G1 X89.313 Y155.892 E.96745
G1 X89.743 Y155.996 E.01319
G1 X112.349 Y133.39 E.95324
G1 X112.441 Y133.831 E.01344
G1 X90.193 Y156.08 E.93816
G1 X90.646 Y156.161 E.01371
G1 X112.519 Y134.288 E.92233
G1 X112.588 Y134.752 E.014
G1 X91.109 Y156.231 E.90571
G1 X91.586 Y156.288 E.01432
G1 X112.651 Y135.224 E.88824
G1 X112.694 Y135.714 E.01467
G1 X92.066 Y156.342 E.86985
G1 X92.57 Y156.372 E.01505
G1 X112.738 Y136.204 E.85045
G3 X112.754 Y136.721 I-4.353 J.397 E.01545
G1 X93.074 Y156.402 E.82989
G2 X93.603 Y156.406 I.3 J-4.461 E.0158
G1 X112.77 Y137.24 E.8082
G3 X112.76 Y137.783 I-4.583 J.191 E.01621
G1 X94.137 Y156.406 E.78529
G2 X94.696 Y156.381 I.068 J-4.721 E.01669
G1 X112.744 Y138.333 E.76103
G3 X112.701 Y138.91 I-4.878 J-.071 E.01725
G1 X95.263 Y156.347 E.7353
G2 X95.86 Y156.285 I-.231 J-5.058 E.0179
G1 X112.649 Y139.496 E.70794
G3 X112.563 Y140.116 I-5.265 J-.414 E.01867
G1 X96.466 Y156.212 E.67876
G2 X97.113 Y156.1 I-.627 J-5.505 E.01958
G1 X112.467 Y140.745 E.64747
G1 X112.32 Y141.427 E.0208
G1 X97.774 Y155.972 E.61336
G1 X98.478 Y155.802 E.02159
G1 X112.16 Y142.12 E.57694
G1 X111.959 Y142.855 E.0227
G1 X99.223 Y155.591 E.53706
G2 X100.01 Y155.338 I-1.74 J-6.758 E.02467
G1 X111.693 Y143.655 E.49264
G3 X111.366 Y144.515 I-7.41 J-2.319 E.02745
G1 X100.859 Y155.022 E.44306
G1 X101.811 Y154.604 E.03102
G1 X110.951 Y145.464 E.3854
G3 X110.394 Y146.555 I-9.469 J-4.148 E.03655
G1 X102.894 Y154.055 E.31626
G2 X104.272 Y153.21 I-13.895 J-24.222 E.04822
G1 X109.586 Y147.897 E.22407
G3 X107.39 Y150.626 I-15.656 J-10.346 E.10462
G1 X105.417 Y152.599 E.08318
; WIPE_START
G1 F24000
G1 X106.832 Y151.185 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.825 J.894 P1  F30000
G1 X138.862 Y121.619 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X141.716 Y119.69 I12.244 J15.04 E.11092
G3 X151.783 Y117.277 I9.385 J16.946 E.337
G3 X138.815 Y121.657 I-.677 J19.382 E3.46865
G1 X138.614 Y121.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X141.526 Y119.347 I12.492 J15.344 E.10483
G3 X151.806 Y116.886 I9.574 J17.287 E.31874
G3 X138.567 Y121.353 I-.7 J19.773 E3.27765
M204 S10000
; WIPE_START
G1 F24000
G1 X139.546 Y120.602 E-.4685
G1 X140.181 Y120.173 E-.2915
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.903 J-.816 P1  F30000
G1 X135.821 Y124.995 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420374
G1 F15000
G1 X137.418 Y123.398 E.06734
G3 X140.552 Y120.797 I13.338 J12.887 E.12167
G1 X135.231 Y126.118 E.22437
G2 X134.427 Y127.457 I10.874 J7.449 E.04659
G1 X141.927 Y119.956 E.31627
G1 X143.01 Y119.407 E.0362
G1 X133.87 Y128.547 E.38539
G2 X133.455 Y129.496 I7.792 J3.976 E.03091
G1 X143.962 Y118.989 E.44305
G1 X144.814 Y118.671 E.02712
G1 X133.128 Y130.357 E.49276
G2 X132.861 Y131.158 I6.615 J2.651 E.02518
G1 X145.6 Y118.419 E.53716
G3 X146.344 Y118.208 I2.143 J6.163 E.02306
G1 X132.662 Y131.89 E.57691
G2 X132.496 Y132.59 I5.818 J1.753 E.02148
G1 X147.05 Y118.036 E.61369
G3 X147.71 Y117.91 I1.393 J5.497 E.02005
G1 X132.355 Y133.265 E.64745
G2 X132.259 Y133.895 I5.261 J1.127 E.01902
G1 X148.355 Y117.799 E.67873
G1 X148.962 Y117.725 E.01824
G1 X132.172 Y134.516 E.70801
G1 X132.121 Y135.101 E.0175
G1 X149.558 Y117.663 E.73527
G1 X150.126 Y117.629 E.01699
G1 X132.078 Y135.677 E.76106
G1 X132.066 Y136.223 E.01627
G1 X150.683 Y117.606 E.78502
G1 X151.215 Y117.608 E.01585
G1 X132.054 Y136.769 E.80793
G2 X132.067 Y137.289 I4.898 J.135 E.01553
G1 X151.746 Y117.61 E.82979
G3 X152.252 Y117.638 I-.007 J4.772 E.01512
G1 X132.084 Y137.807 E.85044
G2 X132.127 Y138.297 I4.155 J-.122 E.01468
G1 X152.757 Y117.667 E.86989
G3 X153.236 Y117.722 I-.227 J4.061 E.01437
G1 X132.172 Y138.786 E.88819
G2 X132.233 Y139.258 I4.01 J-.282 E.01421
G1 X153.713 Y117.778 E.90574
G3 X154.176 Y117.85 I-.37 J3.932 E.01396
G1 X132.303 Y139.722 E.92228
G2 X132.379 Y140.18 I3.894 J-.412 E.01384
G1 X154.629 Y117.93 E.93819
G3 X155.078 Y118.015 I-.487 J3.828 E.01364
G1 X132.473 Y140.62 E.95319
G1 X132.567 Y141.06 E.01342
G1 X155.509 Y118.118 E.9674
G1 X155.94 Y118.221 E.0132
G1 X132.676 Y141.484 E.98093
G1 X132.791 Y141.903 E.01294
G1 X156.357 Y118.337 E.99368
G1 X156.767 Y118.462 E.01276
G1 X132.91 Y142.319 E1.00597
G1 X133.045 Y142.717 E.01254
G1 X157.176 Y118.586 E1.01753
G3 X157.567 Y118.729 I-1.015 J3.36 E.0124
G1 X133.181 Y143.115 E1.02827
G2 X133.325 Y143.505 I3.354 J-1.02 E.01239
G1 X157.956 Y118.873 E1.03863
G3 X158.341 Y119.022 I-1.061 J3.317 E.01231
G1 X133.479 Y143.884 E1.04834
G1 X133.634 Y144.263 E.01221
G1 X158.712 Y119.185 E1.05747
G1 X159.084 Y119.347 E.01208
G1 X133.801 Y144.63 E1.06606
G1 X133.974 Y144.991 E.01193
G1 X159.446 Y119.519 E1.07407
G1 X159.8 Y119.699 E.01183
G1 X134.147 Y145.352 E1.08168
G2 X134.335 Y145.698 I3.006 J-1.411 E.01174
G1 X160.153 Y119.88 E1.08865
G3 X160.496 Y120.071 I-1.439 J2.981 E.0117
G1 X134.525 Y146.041 E1.09507
G1 X134.715 Y146.385 E.01171
G1 X160.832 Y120.268 E1.10122
G1 X161.168 Y120.466 E.01163
G1 X134.923 Y146.711 E1.10667
G1 X135.13 Y147.038 E.01153
G1 X161.492 Y120.676 E1.1116
G1 X161.811 Y120.89 E.01147
G1 X135.338 Y147.363 E1.11628
G1 X135.562 Y147.674 E.0114
G1 X162.131 Y121.105 E1.12033
G3 X162.437 Y121.332 I-1.76 J2.696 E.01138
G1 X135.785 Y147.984 E1.12383
G2 X136.011 Y148.292 I2.71 J-1.745 E.0114
G1 X162.741 Y121.562 E1.12711
G1 X163.044 Y121.793 E.01136
G1 X136.25 Y148.587 E1.12979
G1 X136.49 Y148.881 E.01131
G1 X163.334 Y122.037 E1.13192
G1 X163.621 Y122.283 E.01129
G1 X136.732 Y149.173 E1.13383
G1 X136.987 Y149.451 E.01126
G1 X163.908 Y122.53 E1.13516
G3 X164.182 Y122.79 I-2.052 J2.437 E.01126
G1 X137.243 Y149.729 E1.13594
G2 X137.501 Y150.005 I2.454 J-2.036 E.01127
G1 X164.454 Y123.052 E1.1365
M73 P37 R15
G1 X164.725 Y123.315 E.01126
G1 X137.772 Y150.267 E1.1365
G1 X138.043 Y150.53 E.01126
G1 X164.983 Y123.59 E1.13594
G1 X165.238 Y123.869 E.01126
G1 X138.317 Y150.79 E1.13517
G1 X138.605 Y151.036 E.01129
G1 X165.494 Y124.147 E1.13383
G3 X165.736 Y124.439 I-2.339 J2.184 E.01131
G1 X138.892 Y151.283 E1.13192
G2 X139.182 Y151.527 I2.199 J-2.321 E.0113
G1 X165.975 Y124.733 E1.12979
G1 X166.215 Y125.027 E.01131
G1 X139.485 Y151.757 E1.12711
G1 X139.788 Y151.988 E.01136
G1 X166.441 Y125.336 E1.12383
G1 X166.664 Y125.646 E.0114
G1 X140.095 Y152.215 E1.12033
G1 X140.414 Y152.429 E.01147
G1 X166.888 Y125.956 E1.11628
G3 X167.096 Y126.282 I-2.636 J1.917 E.01153
G1 X140.734 Y152.644 E1.1116
G2 X141.058 Y152.853 I1.93 J-2.626 E.01152
G1 X167.303 Y126.608 E1.10667
G1 X167.51 Y126.935 E.01153
G1 X141.394 Y153.051 E1.10122
G1 X141.73 Y153.249 E.01163
G1 X167.7 Y127.279 E1.09507
G1 X167.891 Y127.622 E.01171
G1 X142.073 Y153.44 E1.08865
G1 X142.426 Y153.621 E.01183
G1 X168.079 Y127.968 E1.08168
G1 X168.252 Y128.329 E.01193
G1 X142.779 Y153.801 E1.07407
G2 X143.142 Y153.972 I1.623 J-2.97 E.01196
G1 X168.424 Y128.69 E1.06606
G3 X168.592 Y129.056 I-3.004 J1.593 E.01202
G1 X143.513 Y154.135 E1.05747
G1 X143.884 Y154.297 E.01208
G1 X168.746 Y129.435 E1.04834
G1 X168.901 Y129.815 E.01221
G1 X144.269 Y154.446 E1.03863
G1 X144.659 Y154.59 E.01239
G1 X169.045 Y130.204 E1.02827
G1 X169.181 Y130.603 E.01254
G1 X145.049 Y154.734 E1.01753
G1 X145.459 Y154.858 E.01276
G1 X169.316 Y131.001 E1.00597
G3 X169.434 Y131.417 I-3.445 J1.203 E.01289
G1 X145.868 Y154.982 E.99368
G2 X146.286 Y155.099 I1.188 J-3.459 E.01293
G1 X169.549 Y131.835 E.98093
G3 X169.659 Y132.259 I-3.518 J1.136 E.01307
G1 X146.717 Y155.202 E.9674
G1 X147.147 Y155.305 E.0132
G1 X169.753 Y132.7 E.95319
G1 X169.846 Y133.14 E.01342
G1 X147.597 Y155.389 E.93819
G1 X148.05 Y155.47 E.01373
G1 X169.922 Y133.597 E.92228
G1 X169.992 Y134.061 E.01398
G1 X148.512 Y155.541 E.90574
G1 X148.99 Y155.597 E.01434
G1 X170.054 Y134.533 E.88819
G1 X170.098 Y135.023 E.01465
G1 X149.468 Y155.653 E.86989
G1 X149.973 Y155.682 E.01508
G1 X170.142 Y135.513 E.85044
G1 X170.158 Y136.03 E.01544
G1 X150.478 Y155.711 E.82984
G2 X151.007 Y155.716 I.309 J-4.451 E.01577
G1 X170.175 Y136.548 E.80825
G3 X170.164 Y137.092 I-4.593 J.183 E.01624
G1 X151.541 Y155.715 E.78525
G2 X152.099 Y155.691 I.077 J-4.712 E.01665
G1 X170.149 Y137.641 E.76109
G3 X170.105 Y138.219 I-4.887 J-.08 E.01728
G1 X152.668 Y155.656 E.73527
G2 X153.263 Y155.594 I-.222 J-5.047 E.01786
G1 X170.054 Y138.804 E.70801
G3 X169.967 Y139.424 I-5.273 J-.422 E.0187
G1 X153.871 Y155.521 E.67873
G2 X154.516 Y155.409 I-.618 J-5.494 E.01954
G1 X169.871 Y140.055 E.64745
G1 X169.73 Y140.729 E.02054
G1 X155.176 Y155.283 E.61369
G1 X155.882 Y155.111 E.02166
G1 X169.564 Y141.429 E.57691
G1 X169.365 Y142.162 E.02263
G1 X156.626 Y154.901 E.53717
G2 X157.412 Y154.649 I-1.732 J-6.751 E.02463
G1 X169.098 Y142.963 E.49276
G3 X168.771 Y143.823 I-7.414 J-2.323 E.02746
G1 X158.264 Y154.331 E.44305
G1 X159.216 Y153.912 E.03101
G1 X168.356 Y144.773 E.38539
G3 X167.789 Y145.873 I-8.681 J-3.773 E.03691
G1 X160.299 Y153.363 E.31586
G1 X161.32 Y152.761 E.03535
G1 X161.673 Y152.522 E.01272
G1 X166.994 Y147.201 E.22437
G3 X164.819 Y149.91 I-15.7 J-10.379 E.10374
G1 X162.819 Y151.911 E.08436
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.233 Y150.497 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/15
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
G3 Z.8 I-1.17 J.334 P1  F30000
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
G3 Z1 I.852 J-.869 P1  F30000
G1 X75.922 Y129.617 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X75.955 Y129.53 E.003
G3 X80.616 Y123.038 I17.746 J7.822 E.25883
G3 X94.516 Y117.975 I13.08 J14.297 E.48809
G3 X75.523 Y130.595 I-.814 J19.377 E3.13452
G1 X75.899 Y129.673 E.03204
G1 X75.559 Y129.47 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P38 R15
G1 F12000
G1 X75.596 Y129.372 E.00313
G3 X79.509 Y123.566 I18.105 J7.98 E.20966
G3 X94.539 Y117.583 I14.217 J13.848 E.49629
G3 X75.155 Y130.459 I-.837 J19.768 E2.96208
G1 X75.536 Y129.525 E.03002
M204 S10000
; WIPE_START
G1 F24000
G1 X75.596 Y129.372 E-.0627
G1 X76.102 Y128.314 E-.44572
G1 X76.422 Y127.734 E-.25158
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.187 J.266 P1  F30000
G1 X82 Y152.599 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420385
G1 F15000
G1 X80.027 Y150.626 E.08318
G3 X77.897 Y148 I15.523 J-14.771 E.10093
G1 X77.831 Y147.897 E.00366
G1 X83.145 Y153.21 E.22407
G2 X84.505 Y154.045 I7.717 J-11.04 E.04761
G1 X84.524 Y154.055 E.00063
G1 X77.023 Y146.555 E.31626
G3 X76.466 Y145.464 I8.912 J-5.239 E.03655
G1 X85.606 Y154.604 E.3854
G1 X86.558 Y155.022 E.03102
G1 X76.051 Y144.515 E.44306
G3 X75.725 Y143.655 I7.083 J-3.179 E.02745
G1 X87.407 Y155.338 E.49264
G2 X88.195 Y155.591 I2.527 J-6.504 E.02467
G1 X75.458 Y142.855 E.53706
G1 X75.258 Y142.12 E.0227
G1 X88.94 Y155.802 E.57694
G1 X89.643 Y155.972 E.02159
G1 X75.092 Y141.421 E.6136
G1 X74.95 Y140.745 E.0206
G1 X90.305 Y156.1 E.64748
G2 X90.951 Y156.212 I1.273 J-5.391 E.01958
G1 X74.854 Y140.116 E.67876
G3 X74.768 Y139.496 I5.178 J-1.034 E.01867
G1 X91.557 Y156.285 E.70794
G2 X92.154 Y156.347 I.828 J-4.995 E.0179
G1 X74.716 Y138.91 E.7353
G3 X74.674 Y138.333 I4.836 J-.648 E.01725
G1 X92.721 Y156.381 E.76103
G2 X93.28 Y156.406 I.491 J-4.696 E.01669
G1 X74.657 Y137.783 E.78529
G3 X74.648 Y137.24 I4.573 J-.352 E.01621
G1 X93.814 Y156.406 E.8082
G2 X94.344 Y156.402 I.23 J-4.465 E.0158
G1 X74.663 Y136.721 E.82989
G3 X74.679 Y136.204 I4.367 J-.121 E.01545
G1 X94.848 Y156.372 E.85045
G1 X95.352 Y156.342 E.01505
G1 X74.723 Y135.714 E.86985
G1 X74.767 Y135.224 E.01467
G1 X95.831 Y156.288 E.88824
G1 X96.308 Y156.231 E.01432
G1 X74.829 Y134.752 E.90571
G1 X74.899 Y134.288 E.014
G1 X96.772 Y156.161 E.92233
G1 X97.224 Y156.08 E.01371
G1 X74.976 Y133.831 E.93816
G1 X75.069 Y133.39 E.01344
G1 X97.675 Y155.996 E.95324
G1 X98.105 Y155.892 E.01319
G1 X75.162 Y132.949 E.96745
G3 X75.272 Y132.526 I3.62 J.722 E.01305
G1 X98.535 Y155.788 E.98091
G2 X98.953 Y155.673 I-.761 J-3.584 E.01295
G1 X75.387 Y132.107 E.99374
G3 X75.506 Y131.692 I3.554 J.797 E.01287
G1 X99.362 Y155.548 E1.00596
G1 X99.771 Y155.423 E.01275
G1 X75.641 Y131.293 E1.01751
G1 X75.776 Y130.894 E.01256
G1 X100.162 Y155.281 E1.02833
G1 X100.552 Y155.136 E.01238
G1 X75.921 Y130.506 E1.03861
G1 X76.075 Y130.126 E.01222
G1 X100.938 Y154.989 E1.0484
G1 X101.308 Y154.825 E.01207
G1 X76.229 Y129.746 E1.05753
G3 X76.397 Y129.381 I3.163 J1.235 E.012
G1 X101.679 Y154.662 E1.06605
G2 X102.043 Y154.492 I-1.251 J-3.149 E.01198
G1 X76.57 Y129.019 E1.07413
G1 X76.742 Y128.658 E.01194
G1 X102.395 Y154.311 E1.08174
G1 X102.748 Y154.13 E.01182
G1 X76.931 Y128.313 E1.08864
G1 X77.121 Y127.969 E.01172
G1 X103.092 Y153.94 E1.09513
G1 X103.427 Y153.742 E.01162
G1 X77.312 Y127.626 E1.10122
G1 X77.519 Y127.299 E.01154
G1 X103.763 Y153.543 E1.10666
G2 X104.088 Y153.335 I-1.596 J-2.843 E.01153
G1 X77.725 Y126.972 E1.11166
G3 X77.934 Y126.647 I2.838 J1.602 E.01152
G1 X104.407 Y153.12 E1.11628
G1 X104.726 Y152.905 E.01147
G1 X78.158 Y126.336 E1.12033
G1 X78.381 Y126.026 E.01141
G1 X105.034 Y152.679 E1.1239
G1 X105.336 Y152.448 E.01136
G1 X78.607 Y125.718 E1.12711
G1 X78.846 Y125.424 E.01132
G1 X105.639 Y152.217 E1.12979
G2 X105.93 Y151.974 I-1.9 J-2.573 E.01131
G1 X79.085 Y125.129 E1.13198
G3 X79.328 Y124.838 I2.572 J1.901 E.01131
G1 X106.217 Y151.727 E1.13383
G1 X106.503 Y151.48 E.01129
G1 X79.583 Y124.559 E1.13516
G1 X79.838 Y124.28 E.01127
G1 X106.778 Y151.221 E1.136
G1 X107.049 Y150.958 E.01126
G1 X80.097 Y124.006 E1.1365
G1 X80.368 Y123.743 E.01126
G1 X107.32 Y150.695 E1.1365
G2 X107.579 Y150.42 I-2.186 J-2.319 E.01127
G1 X80.639 Y123.48 E1.136
G3 X80.914 Y123.221 I2.319 J2.187 E.01127
G1 X107.834 Y150.141 E1.13516
G1 X108.089 Y149.862 E.01127
G1 X81.201 Y122.974 E1.13383
G1 X81.487 Y122.727 E.01129
G1 X108.332 Y149.571 E1.13198
M73 P38 R14
G1 X108.571 Y149.277 E.01132
G1 X81.778 Y122.484 E1.12979
G1 X82.081 Y122.253 E.01136
G1 X108.81 Y148.982 E1.12711
G2 X109.037 Y148.675 I-2.476 J-2.062 E.01139
G1 X82.384 Y122.022 E1.1239
M73 P39 R14
G3 X82.691 Y121.796 I2.059 J2.479 E.01139
G1 X109.26 Y148.364 E1.12033
G1 X109.483 Y148.053 E.01141
G1 X83.01 Y121.581 E1.11628
G1 X83.329 Y121.366 E.01147
G1 X109.692 Y147.729 E1.11166
G1 X109.899 Y147.401 E.01154
G1 X83.654 Y121.157 E1.10666
G1 X83.99 Y120.959 E.01162
G1 X110.105 Y147.074 E1.10122
G2 X110.297 Y146.732 I-2.791 J-1.782 E.01171
G1 X84.326 Y120.761 E1.09513
G3 X84.669 Y120.57 I1.774 J2.799 E.01172
G1 X110.486 Y146.387 E1.08864
G2 X110.675 Y146.043 I-2.809 J-1.765 E.01173
G1 X85.022 Y120.389 E1.08174
G1 X85.375 Y120.208 E.01182
G1 X110.848 Y145.681 E1.07413
G1 X111.02 Y145.32 E.01194
G1 X85.739 Y120.038 E1.06605
G1 X86.109 Y119.875 E.01207
G1 X111.188 Y144.954 E1.05753
G1 X111.342 Y144.574 E.01222
G1 X86.48 Y119.712 E1.0484
G3 X86.866 Y119.564 I1.438 J3.178 E.01233
G1 X111.496 Y144.195 E1.03861
G2 X111.642 Y143.806 I-3.201 J-1.418 E.01238
G1 X87.255 Y119.419 E1.02833
G3 X87.646 Y119.277 I1.396 J3.226 E.01242
G1 X111.776 Y143.407 E1.01751
G1 X111.911 Y143.008 E.01256
G1 X88.055 Y119.152 E1.00596
G1 X88.464 Y119.027 E.01275
G1 X112.03 Y142.593 E.99374
G1 X112.145 Y142.174 E.01296
G1 X88.883 Y118.912 E.98091
G1 X89.313 Y118.808 E.01319
G1 X112.256 Y141.751 E.96745
G1 X112.349 Y141.31 E.01344
G1 X89.743 Y118.704 E.95324
G3 X90.193 Y118.621 I.928 J3.755 E.01367
G1 X112.441 Y140.869 E.93816
G2 X112.519 Y140.413 I-3.809 J-.878 E.01382
G1 X90.646 Y118.54 E.92233
G3 X91.109 Y118.469 I.824 J3.871 E.01399
G1 X112.588 Y139.948 E.90571
G2 X112.651 Y139.477 I-3.938 J-.763 E.01418
G1 X91.586 Y118.412 E.88824
G3 X92.066 Y118.358 I.696 J4.015 E.0144
G1 X112.694 Y138.987 E.86985
G1 X112.738 Y138.497 E.01467
G1 X92.57 Y118.328 E.85045
G1 X93.074 Y118.298 E.01505
G1 X112.754 Y137.979 E.82989
G1 X112.77 Y137.461 E.01547
G1 X93.608 Y118.299 E.808
G1 X94.147 Y118.304 E.01608
G1 X112.76 Y136.917 E.78486
G1 X112.744 Y136.367 E.01641
G1 X94.696 Y118.319 E.76103
G1 X95.263 Y118.353 E.01695
G1 X112.701 Y135.791 E.7353
G1 X112.649 Y135.205 E.01754
G1 X95.86 Y118.416 E.70794
G1 X96.466 Y118.488 E.0182
G1 X112.563 Y134.585 E.67876
G2 X112.468 Y133.956 I-5.348 J.488 E.01898
G1 X97.113 Y118.601 E.64748
G3 X97.774 Y118.728 I-.743 J5.634 E.02009
G1 X112.325 Y133.28 E.6136
G2 X112.16 Y132.58 I-5.975 J1.045 E.02144
G1 X98.478 Y118.898 E.57694
G3 X99.223 Y119.109 I-1.407 J6.383 E.0231
G1 X111.959 Y131.846 E.53706
G2 X111.693 Y131.046 I-6.876 J1.845 E.02516
G1 X100.01 Y119.363 E.49264
G1 X100.859 Y119.678 E.02701
G1 X111.366 Y130.185 E.44306
G2 X110.951 Y129.236 I-8.204 J3.024 E.03091
G1 X101.811 Y120.097 E.3854
G1 X102.894 Y120.645 E.03618
G1 X110.394 Y128.145 E.31626
G2 X109.586 Y126.804 I-11.706 J6.134 E.04672
G1 X104.272 Y121.49 E.22407
G3 X106.578 Y123.285 I-11.22 J16.788 E.08719
G3 X109.001 Y125.685 I-79.756 J82.957 E.1017
; WIPE_START
G1 F24000
G1 X107.58 Y124.278 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.103 J1.213 P1  F30000
G1 X138.862 Y121.62 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X151.884 Y117.283 I12.237 J15.025 E.45112
G3 X137.993 Y122.372 I-.778 J19.378 E3.43033
G3 X138.816 Y121.658 I13.107 J14.272 E.03504
G1 X138.617 Y121.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X151.906 Y116.892 I12.514 J15.404 E.42641
G3 X136.888 Y122.902 I-.8 J19.77 E3.20668
G3 X138.57 Y121.357 I14.243 J13.821 E.06809
M204 S10000
; WIPE_START
G1 F24000
G1 X139.546 Y120.602 E-.46846
G1 X140.181 Y120.173 E-.29154
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.22 J1.197 P1  F30000
G1 X166.399 Y124.988 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420395
G1 F15000
G2 X163.954 Y122.569 I-73.622 J71.982 E.10254
G2 X161.679 Y120.802 I-13.629 J15.193 E.08598
G1 X166.987 Y126.109 E.22381
G3 X167.797 Y127.454 I-10.924 J7.504 E.04684
G1 X160.299 Y119.955 E.31619
G1 X159.215 Y119.405 E.03625
G1 X168.355 Y128.545 E.38542
G3 X168.77 Y129.494 I-7.785 J3.97 E.0309
G1 X158.265 Y118.989 E.443
G1 X157.416 Y118.674 E.02699
G1 X169.096 Y130.354 E.49252
G3 X169.362 Y131.153 I-6.607 J2.64 E.02514
G1 X156.628 Y118.419 E.53697
G2 X155.882 Y118.207 I-2.161 J6.18 E.02314
G1 X169.564 Y131.89 E.57698
G3 X169.729 Y132.588 I-5.801 J1.735 E.02141
G1 X155.18 Y118.039 E.61352
G2 X154.517 Y117.91 I-1.415 J5.517 E.02013
G1 X169.872 Y133.265 E.64749
G1 X169.967 Y133.894 E.01897
G1 X153.87 Y117.797 E.67881
G1 X153.265 Y117.726 E.01815
G1 X170.052 Y134.513 E.70789
G1 X170.106 Y135.1 E.01758
G1 X152.667 Y117.662 E.73535
G1 X152.101 Y117.629 E.01692
G1 X170.147 Y135.676 E.76099
G1 X170.165 Y136.227 E.01644
G1 X151.551 Y117.614 E.78489
G1 X151.013 Y117.609 E.01605
G1 X170.173 Y136.769 E.80795
G1 X170.159 Y137.288 E.01549
G1 X150.477 Y117.607 E.82994
G1 X149.974 Y117.638 E.01503
G1 X170.141 Y137.805 E.85041
G1 X170.098 Y138.296 E.0147
G1 X149.471 Y117.669 E.86982
G2 X148.99 Y117.722 I.206 J4.078 E.01443
G1 X170.056 Y138.787 E.88829
G3 X169.992 Y139.257 I-3.993 J-.302 E.01415
G1 X148.514 Y117.779 E.90568
G2 X148.05 Y117.849 I.35 J3.95 E.01402
G1 X169.923 Y139.722 E.92239
G3 X169.845 Y140.178 I-3.878 J-.431 E.01379
G1 X147.598 Y117.931 E.93814
G2 X147.146 Y118.013 I.467 J3.842 E.01369
G1 X169.753 Y140.62 E.95329
G1 X169.661 Y141.061 E.01345
G1 X146.717 Y118.117 E.96751
G1 X146.288 Y118.222 E.01317
G1 X169.549 Y141.483 E.9809
G1 X169.435 Y141.903 E.01297
G1 X145.868 Y118.336 E.99379
G1 X145.46 Y118.462 E.01274
G1 X169.315 Y142.317 E1.00594
G1 X169.181 Y142.716 E.01257
G1 X145.051 Y118.587 E1.0175
G2 X144.659 Y118.729 I.996 J3.378 E.01244
G1 X169.046 Y143.116 E1.02839
G3 X168.9 Y143.504 I-3.338 J-1.039 E.01236
G1 X144.27 Y118.874 E1.0386
G2 X143.883 Y119.021 I1.043 J3.333 E.01235
G1 X168.747 Y143.884 E1.04845
G1 X168.593 Y144.264 E.01223
G1 X143.513 Y119.184 E1.05759
G1 X143.143 Y119.348 E.01207
G1 X168.424 Y144.629 E1.06605
G1 X168.252 Y144.991 E.01195
G1 X142.778 Y119.517 E1.07419
G1 X142.426 Y119.699 E.01182
G1 X168.079 Y145.352 E1.08176
G1 X167.89 Y145.697 E.01172
G1 X142.074 Y119.88 E1.08864
G2 X141.729 Y120.07 I1.421 J2.998 E.01173
G1 X167.701 Y146.041 E1.0952
G3 X167.509 Y146.383 I-2.974 J-1.448 E.01169
G1 X141.394 Y120.268 E1.10122
G1 X141.059 Y120.467 E.01162
G1 X167.303 Y146.711 E1.10666
G1 X167.097 Y147.039 E.01154
G1 X140.733 Y120.675 E1.11172
G1 X140.415 Y120.89 E.01146
G1 X166.886 Y147.362 E1.11628
G1 X166.664 Y147.673 E.01141
G1 X140.096 Y121.106 E1.12033
M73 P40 R14
G2 X139.788 Y121.331 I1.743 J2.714 E.0114
G1 X166.441 Y147.985 E1.12396
G3 X166.214 Y148.291 I-2.695 J-1.764 E.01138
G1 X139.485 Y121.562 E1.12711
G1 X139.183 Y121.794 E.01135
G1 X165.975 Y148.586 E1.12979
G1 X165.737 Y148.881 E.01132
G1 X138.891 Y122.036 E1.13205
G1 X138.605 Y122.283 E.01128
G1 X165.493 Y149.171 E1.13383
G1 X165.238 Y149.451 E.01127
G1 X138.319 Y122.531 E1.13516
G2 X138.043 Y122.789 I2.035 J2.453 E.01127
G1 X164.984 Y149.73 E1.13607
G3 X164.724 Y150.004 I-2.437 J-2.053 E.01127
G1 X137.772 Y123.052 E1.1365
G1 X137.502 Y123.316 E.01126
G1 X164.453 Y150.267 E1.1365
G1 X164.183 Y150.531 E.01126
G1 X137.242 Y123.59 E1.13607
G1 X136.987 Y123.869 E.01127
G1 X163.907 Y150.789 E1.13516
G1 X163.621 Y151.036 E.01128
G1 X136.733 Y124.148 E1.13383
G2 X136.489 Y124.438 I2.32 J2.2 E.0113
G1 X163.335 Y151.284 E1.13204
G3 X163.042 Y151.526 I-2.184 J-2.341 E.01131
G1 X136.25 Y124.733 E1.12979
G1 X136.012 Y125.029 E.01132
G1 X162.74 Y151.757 E1.12711
G1 X162.438 Y151.989 E.01135
G1 X135.784 Y125.335 E1.12396
G1 X135.562 Y125.646 E.01141
G1 X162.129 Y152.214 E1.12033
G1 X161.811 Y152.429 E.01146
G1 X135.339 Y125.958 E1.11628
G2 X135.129 Y126.281 I2.62 J1.934 E.01151
G1 X161.492 Y152.645 E1.11172
G3 X161.166 Y152.852 I-1.914 J-2.644 E.01154
G1 X134.923 Y126.609 E1.10666
G1 X134.717 Y126.937 E.01154
G1 X160.831 Y153.051 E1.10122
G1 X160.496 Y153.25 E.01162
G1 X134.525 Y127.278 E1.09519
G1 X134.335 Y127.623 E.01172
G1 X160.152 Y153.439 E1.08864
G1 X159.799 Y153.621 E.01182
G1 X134.146 Y127.968 E1.08176
G2 X133.974 Y128.329 I2.958 J1.636 E.01194
G1 X159.447 Y153.802 E1.07419
G3 X159.082 Y153.971 I-1.607 J-2.989 E.012
G1 X133.802 Y128.691 E1.06605
G2 X133.632 Y129.055 I2.986 J1.609 E.01199
G1 X158.712 Y154.135 E1.05759
G1 X158.342 Y154.299 E.01207
G1 X133.479 Y129.436 E1.04845
G1 X133.326 Y129.816 E.01223
G1 X157.955 Y154.446 E1.0386
G1 X157.567 Y154.591 E.01237
G1 X133.179 Y130.204 E1.02838
G1 X133.045 Y130.603 E.01257
G1 X157.174 Y154.732 E1.0175
G1 X156.766 Y154.858 E.01274
G1 X132.911 Y131.003 E1.00594
G2 X132.791 Y131.416 I3.425 J1.219 E.01285
G1 X156.358 Y154.983 E.99379
G3 X155.938 Y155.098 I-1.171 J-3.479 E.01298
G1 X132.677 Y131.836 E.98089
G2 X132.565 Y132.258 I3.499 J1.153 E.01302
G1 X155.509 Y155.202 E.96751
G1 X155.079 Y155.307 E.01317
G1 X132.473 Y132.7 E.95329
G1 X132.381 Y133.142 E.01345
G1 X154.628 Y155.389 E.93814
G1 X154.176 Y155.471 E.01369
G1 X132.302 Y133.597 E.92239
G1 X132.234 Y134.063 E.01402
G1 X153.711 Y155.54 E.90568
G1 X153.235 Y155.598 E.0143
G1 X132.17 Y134.533 E.88829
G1 X132.127 Y135.024 E.0147
G1 X152.754 Y155.651 E.86982
G1 X152.251 Y155.682 E.01503
G1 X132.084 Y135.515 E.85041
G2 X132.067 Y136.031 I4.342 J.405 E.01542
G1 X151.748 Y155.712 E.82993
G3 X151.218 Y155.716 I-.291 J-4.473 E.01584
G1 X132.053 Y136.551 E.80816
G2 X132.061 Y137.093 I4.574 J.2 E.01618
G1 X150.685 Y155.717 E.78533
G3 X150.125 Y155.69 I-.059 J-4.732 E.01673
G1 X132.079 Y137.644 E.76099
G2 X132.12 Y138.22 I4.869 J-.063 E.01721
G1 X149.558 Y155.658 E.73535
G3 X148.961 Y155.594 I.24 J-5.069 E.01794
G1 X132.174 Y138.807 E.70789
G2 X132.259 Y139.426 I5.256 J-.406 E.01863
G1 X148.356 Y155.523 E.6788
G3 X147.708 Y155.409 I.635 J-5.513 E.01962
G1 X132.354 Y140.055 E.64749
G2 X132.497 Y140.731 I5.779 J-.868 E.02064
G1 X147.046 Y155.281 E.61352
G1 X146.344 Y155.112 E.02153
G1 X132.661 Y141.43 E.57697
G1 X132.864 Y142.166 E.02278
G1 X145.598 Y154.9 E.53697
G3 X144.81 Y154.646 I1.749 J-6.769 E.02471
G1 X133.13 Y142.966 E.49252
G2 X133.456 Y143.826 I7.405 J-2.315 E.02743
G1 X143.961 Y154.331 E.443
G1 X143.011 Y153.915 E.03094
G1 X133.871 Y144.775 E.38542
G2 X134.428 Y145.866 I9.472 J-4.152 E.03657
G1 X141.927 Y153.364 E.31619
G3 X140.546 Y152.518 I6.444 J-12.056 E.04831
G1 X135.239 Y147.211 E.22379
G1 X135.321 Y147.34 E.00455
G2 X137.457 Y149.962 I17.629 J-12.177 E.10095
G1 X139.402 Y151.907 E.08202
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X137.987 Y150.493 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/15
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
G3 Z1 I-1.052 J.612 P1  F30000
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
G3 Z1.2 I.852 J-.869 P1  F30000
G1 X75.939 Y129.576 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X75.956 Y129.53 E.00156
G3 X78.29 Y125.58 I17.746 J7.823 E.1479
G3 X94.616 Y117.981 I15.429 J11.812 E.60207
G3 X75.523 Y130.595 I-.914 J19.372 E3.13128
G1 X75.916 Y129.631 E.03348
G1 X75.575 Y129.428 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X75.597 Y129.372 E.00179
M73 P41 R14
G3 X77.295 Y126.295 I18.105 J7.981 E.10483
G3 X94.639 Y117.589 I16.401 J11.046 E.60419
G3 X75.156 Y130.459 I-.937 J19.764 E2.95908
G1 X75.553 Y129.484 E.03136
M204 S10000
; WIPE_START
G1 F24000
G1 X75.597 Y129.372 E-.04568
G1 X76.102 Y128.314 E-.44571
G1 X76.444 Y127.694 E-.26862
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.214 J-.08 P1  F30000
G1 X75.451 Y142.771 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X75.984 Y144.309 I22.205 J-6.83 E.05234
G1 X86.753 Y155.079 E.48974
G2 X88.419 Y155.644 I5.596 J-13.756 E.05661
G1 X112.002 Y132.061 E1.07246
G3 X112.589 Y134.858 I-19.162 J5.476 E.09198
G1 X96.202 Y118.472 E.74519
G2 X95.007 Y118.353 I-1.599 J10.011 E.03865
G1 X74.708 Y138.651 E.92309
G3 X74.765 Y135.414 I33.046 J-1.041 E.10414
G1 X95.645 Y156.295 E.94957
G1 X95.417 Y156.322 E.0074
G1 X112.672 Y139.067 E.78469
G3 X112.151 Y142.096 I-32.842 J-4.092 E.09887
G1 X88.962 Y118.908 E1.05451
G2 X85.542 Y120.141 I8.268 J28.296 E.11698
G1 X76.515 Y129.168 E.41051
G1 X76.412 Y129.385 E.00775
G1 X101.674 Y154.648 E1.14883
G2 X106.32 Y151.618 I-9.597 J-19.792 E.17884
G1 X79.44 Y124.738 E1.22239
G3 X83.591 Y121.212 I16.585 J15.318 E.17554
G1 X109.842 Y147.463 E1.1938
G2 X110.654 Y146.053 I-11.481 J-7.546 E.05237
G1 X102.663 Y120.543 F30000
G1 F15476.087
G2 X101.194 Y119.841 I-6.651 J12.021 E.05237
G1 X76.198 Y144.837 E1.13673
G1 X78.13 Y148.3 F30000
G1 F15476.087
G2 X79.12 Y149.591 I11.373 J-7.699 E.05237
G1 X105.949 Y122.763 E1.22005
G3 X109.574 Y126.813 I-14.726 J16.829 E.17524
G1 X83.175 Y153.212 E1.20054
G3 X81.857 Y152.258 I7.387 J-11.583 E.05237
; WIPE_START
G1 F24000
G1 X83.175 Y153.212 E-.6185
G1 X83.438 Y152.949 E-.1415
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.599 J1.059 P1  F30000
G1 X138.866 Y121.624 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X151.984 Y117.289 I12.258 J15.078 E.4542
G3 X135.672 Y124.918 I-.878 J19.374 E3.31616
G3 X138.819 Y121.662 I15.452 J11.783 E.14594
G1 X138.615 Y121.316 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X152.006 Y116.897 I12.485 J15.334 E.42949
G3 X134.678 Y125.635 I-.9 J19.765 E3.09885
G3 X138.568 Y121.354 I16.422 J11.015 E.17292
M204 S10000
; WIPE_START
G1 F24000
G1 X139.546 Y120.602 E-.46847
G1 X140.181 Y120.173 E-.29153
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.963 J-.744 P1  F30000
G1 X134.169 Y127.957 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X134.98 Y126.546 I12.295 J6.128 E.05237
G1 X161.231 Y152.797 E1.19378
G2 X165.381 Y149.271 I-12.352 J-18.748 E.17555
G1 X138.502 Y122.392 E1.22236
G3 X143.148 Y119.362 I14.201 J16.7 E.17884
G1 X168.41 Y144.624 E1.14878
G1 X168.307 Y144.84 E.0077
G1 X159.279 Y153.868 E.41056
G3 X155.859 Y155.101 I-11.53 J-26.613 E.11697
G1 X132.671 Y131.913 E1.0545
G2 X132.15 Y134.942 I32.017 J7.077 E.09885
G1 X149.403 Y117.688 E.78463
G2 X149.176 Y117.714 I.109 J1.926 E.00735
G1 X170.057 Y138.595 E.94957
G2 X170.114 Y135.357 I-33.797 J-2.211 E.10418
G1 X149.814 Y155.657 E.92318
G3 X148.621 Y155.539 I.402 J-10.105 E.03855
G1 X132.232 Y139.15 E.74532
G2 X132.819 Y141.948 I19.769 J-2.689 E.09201
G1 X156.401 Y118.366 E1.07239
G3 X158.069 Y118.931 I-3.923 J14.337 E.05666
G1 X168.838 Y129.7 E.48973
G3 X169.369 Y131.238 I-21.22 J8.196 E.05234
G1 X168.623 Y129.172 F30000
G1 F15476.087
G1 X143.627 Y154.168 E1.13671
G3 X142.158 Y153.467 I5.175 J-12.725 E.05237
G1 X164.603 Y123.217 F30000
G1 F15476.087
G3 X165.7 Y124.419 I-16.048 J15.76 E.05234
G1 X138.872 Y151.247 E1.22002
G3 X135.247 Y147.196 I14.649 J-16.756 E.17524
G1 X161.646 Y120.797 E1.20049
G3 X162.964 Y121.751 I-7.377 J11.584 E.05237
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X161.646 Y120.797 E-.6185
G1 X161.382 Y121.061 E-.1415
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/15
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
G3 Z1.2 I-1.184 J.282 P1  F30000
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
M73 P42 R14
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
G3 Z1.4 I.853 J-.868 P1  F30000
G1 X75.957 Y129.531 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X75.957 Y129.53 E.00003
G3 X76.451 Y128.493 I17.746 J7.823 E.03697
G3 X94.716 Y117.987 I17.245 J8.851 E.71633
G3 X75.524 Y130.596 I-1.014 J19.367 E3.12813
G1 X75.934 Y129.587 E.03501
G1 X75.593 Y129.384 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X75.598 Y129.372 E.00037
G3 X76.102 Y128.314 I18.104 J7.981 E.03494
G3 X94.739 Y117.595 I17.593 J9.029 E.67704
G3 X75.157 Y130.459 I-1.037 J19.758 E2.95607
G1 X75.571 Y129.44 E.03278
M204 S10000
; WIPE_START
G1 F24000
G1 X75.598 Y129.372 E-.02758
G1 X76.102 Y128.314 E-.4457
G1 X76.467 Y127.653 E-.28672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.214 J-.082 P1  F30000
G1 X75.451 Y142.771 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X75.984 Y144.309 I22.205 J-6.83 E.05234
G1 X86.753 Y155.079 E.48974
G2 X88.419 Y155.644 I5.596 J-13.756 E.05661
G1 X112.002 Y132.061 E1.07246
G3 X112.589 Y134.858 I-19.162 J5.476 E.09198
G1 X96.202 Y118.472 E.74519
G2 X95.007 Y118.353 I-1.599 J10.012 E.03865
G1 X74.708 Y138.651 E.92309
G3 X74.765 Y135.414 I33.047 J-1.041 E.10414
G1 X95.645 Y156.295 E.94957
G1 X95.417 Y156.322 E.0074
G1 X112.672 Y139.067 E.78469
G3 X112.151 Y142.096 I-32.842 J-4.092 E.09887
G1 X88.962 Y118.908 E1.05451
G2 X85.542 Y120.141 I8.268 J28.295 E.11698
G1 X76.515 Y129.168 E.41051
G1 X76.412 Y129.385 E.00775
G1 X101.674 Y154.648 E1.14883
G2 X106.32 Y151.618 I-9.597 J-19.792 E.17884
G1 X79.44 Y124.738 E1.22239
G3 X83.591 Y121.212 I16.585 J15.318 E.17554
G1 X109.842 Y147.463 E1.1938
G2 X110.654 Y146.053 I-11.481 J-7.546 E.05237
G1 X102.663 Y120.543 F30000
G1 F15476.087
G2 X101.194 Y119.841 I-6.651 J12.021 E.05237
G1 X76.198 Y144.837 E1.13673
G1 X78.13 Y148.3 F30000
G1 F15476.087
G2 X79.12 Y149.591 I11.373 J-7.699 E.05237
G1 X105.949 Y122.763 E1.22005
G3 X109.574 Y126.813 I-14.726 J16.829 E.17524
G1 X83.175 Y153.212 E1.20054
G3 X81.857 Y152.258 I7.387 J-11.583 E.05237
; WIPE_START
G1 F24000
G1 X83.175 Y153.212 E-.6185
G1 X83.438 Y152.949 E-.1415
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.599 J1.059 P1  F30000
G1 X138.863 Y121.621 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X152.084 Y117.294 I12.237 J15.032 E.45752
G3 X133.839 Y127.835 I-.977 J19.369 E3.20208
G3 X138.816 Y121.659 I17.261 J8.818 E.25688
G1 X138.614 Y121.316 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.615 Y121.317 E.00004
G3 X152.106 Y116.903 I12.485 J15.336 E.43245
G3 X133.49 Y127.656 I-1 J19.76 E3.02596
G3 X137.728 Y122.084 I17.61 J8.996 E.20964
G1 X138.569 Y121.356 E.03313
M204 S10000
; WIPE_START
G1 F24000
G1 X138.615 Y121.317 E-.02308
G1 X139.546 Y120.602 E-.44569
G1 X140.18 Y120.173 E-.29124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.963 J-.744 P1  F30000
G1 X134.169 Y127.957 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X134.98 Y126.546 I12.295 J6.128 E.05237
G1 X161.231 Y152.797 E1.19378
G2 X165.381 Y149.271 I-12.352 J-18.748 E.17555
G1 X138.502 Y122.392 E1.22236
G3 X143.148 Y119.362 I14.201 J16.7 E.17884
G1 X168.41 Y144.624 E1.14878
G1 X168.307 Y144.84 E.0077
G1 X159.279 Y153.868 E.41056
G3 X155.859 Y155.101 I-11.53 J-26.613 E.11697
G1 X132.671 Y131.913 E1.0545
G2 X132.15 Y134.942 I32.017 J7.077 E.09885
G1 X149.403 Y117.688 E.78463
G2 X149.176 Y117.714 I.109 J1.926 E.00735
G1 X170.057 Y138.595 E.94957
G2 X170.114 Y135.357 I-33.797 J-2.211 E.10418
G1 X149.814 Y155.657 E.92318
G3 X148.621 Y155.539 I.402 J-10.105 E.03855
G1 X132.232 Y139.15 E.74532
G2 X132.819 Y141.948 I19.769 J-2.689 E.09201
G1 X156.401 Y118.366 E1.07239
G3 X158.069 Y118.931 I-3.923 J14.337 E.05666
G1 X168.838 Y129.7 E.48973
G3 X169.369 Y131.238 I-21.22 J8.196 E.05234
G1 X168.623 Y129.172 F30000
G1 F15476.087
G1 X143.627 Y154.168 E1.13671
G3 X142.158 Y153.467 I5.175 J-12.725 E.05237
G1 X164.603 Y123.217 F30000
G1 F15476.087
G3 X165.7 Y124.419 I-16.048 J15.76 E.05234
G1 X138.872 Y151.247 E1.22002
G3 X135.247 Y147.196 I14.649 J-16.756 E.17524
G1 X161.646 Y120.797 E1.20049
G3 X162.964 Y121.751 I-7.377 J11.584 E.05237
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P43 R14
G1 F24000
G1 X161.646 Y120.797 E-.6185
G1 X161.382 Y121.061 E-.1415
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/15
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
G3 Z1.4 I-1.184 J.282 P1  F30000
G1 X189.5 Y239 Z1.4
M73 P43 R13
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
G3 Z1.6 I.853 J-.868 P1  F30000
G1 X75.97 Y129.502 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X76.452 Y128.493 E.03596
G3 X94.816 Y117.993 I17.262 J8.881 E.71938
G3 X75.945 Y129.557 I-1.114 J19.361 E3.16093
G1 X75.616 Y129.334 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.102 Y128.314 E.03366
G3 X94.839 Y117.601 I17.594 J9.032 E.68001
G3 X75.157 Y130.459 I-1.137 J19.753 E2.95311
G3 X75.591 Y129.388 I18.54 J6.886 E.03443
M204 S10000
; WIPE_START
G1 F24000
G1 X76.102 Y128.314 E-.45216
G1 X76.494 Y127.604 E-.30784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.793 J.923 P1  F30000
G1 X80.859 Y123.855 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X79.728 Y125.026 I9.301 J10.107 E.05237
G1 X106.031 Y151.329 E1.19616
G2 X109.547 Y147.168 I-14.408 J-15.739 E.17563
G1 X83.888 Y121.509 E1.16687
G1 X94.624 Y118.33 F30000
G1 F15476.087
G2 X75.138 Y141.565 I-.863 J19.065 E1.12692
G1 X75.138 Y141.565 E0
G2 X94.873 Y118.345 I18.569 J-4.214 E2.71126
G1 X94.684 Y118.334 E.0061
G1 X102.357 Y120.844 F30000
G1 F15476.087
G2 X101.275 Y120.322 I-4.947 J8.861 E.03867
G1 X100.885 Y120.15 E.01369
G1 X76.51 Y144.525 E1.10847
G2 X76.748 Y145.073 I4.736 J-1.723 E.01922
G1 X85.983 Y154.309 E.42
G2 X88.745 Y155.318 I8.216 J-18.205 E.09465
G1 X111.671 Y132.392 E1.04256
G3 X112.105 Y134.374 I-18.519 J5.092 E.06527
G1 X96.683 Y118.952 E.70133
G2 X94.849 Y118.751 I-3.963 J27.682 E.05932
G1 X94.622 Y118.738 E.00733
G1 X75.094 Y138.266 E.88804
G3 X75.14 Y135.79 I19.389 J-.876 E.07968
G1 X95.274 Y155.924 E.91562
G2 X95.882 Y155.857 I-.261 J-5.156 E.01968
G1 X112.223 Y139.516 E.74312
G3 X111.819 Y141.765 I-24.448 J-3.231 E.0735
G1 X89.3 Y119.245 E1.02409
G2 X84.587 Y121.097 I4.844 J19.257 E.16327
G1 X77.465 Y128.218 E.32386
G2 X76.717 Y129.691 I12.039 J7.041 E.05315
G1 X101.365 Y154.339 E1.1209
G3 X100.496 Y154.707 I-3.535 J-7.144 E.03039
G1 X99.855 Y154.945 E.02198
G1 X82.148 Y151.967 F30000
G1 F15476.087
G2 X83.468 Y152.919 I8.678 J-10.65 E.05237
G1 X109.279 Y127.108 E1.17378
G2 X105.66 Y123.051 I-17.809 J12.244 E.17528
G1 X79.41 Y149.302 E1.19376
G3 X78.422 Y148.008 I10.399 J-8.969 E.05237
; WIPE_START
G1 F24000
G1 X79.41 Y149.302 E-.61849
G1 X79.673 Y149.038 E-.14151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.511 J1.104 P1  F30000
G1 X138.867 Y121.626 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X152.184 Y117.3 I12.252 J15.058 E.46062
G3 X133.346 Y128.874 I-1.077 J19.363 E3.16185
G3 X138.82 Y121.664 I17.772 J7.81 E.2938
G1 X138.612 Y121.318 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.616 Y121.317 E.0001
G3 X152.206 Y116.909 I12.485 J15.338 E.43543
G3 X132.548 Y129.804 I-1.1 J19.755 E2.95311
G3 X137.728 Y122.084 I18.553 J6.851 E.27952
G1 X138.567 Y121.357 E.03306
M204 S10000
; WIPE_START
G1 F24000
G1 X138.616 Y121.317 E-.02388
G1 X139.546 Y120.602 E-.44568
G1 X140.179 Y120.174 E-.29044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.275 J1.186 P1  F30000
G1 X144.967 Y119.064 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.457 Y119.671 I4.357 J13.026 E.05237
G1 X168.104 Y144.318 E1.12085
G3 X167.358 Y145.789 I-13.143 J-5.739 E.05305
G1 X160.23 Y152.917 E.32419
G3 X155.522 Y154.764 I-9.927 J-18.377 E.163
G1 X133.003 Y132.245 E1.02409
G2 X132.597 Y134.494 I193.037 J36.01 E.07349
G1 X148.938 Y118.153 E.74311
G3 X149.549 Y118.087 I.865 J5.115 E.01978
G1 X169.681 Y138.219 E.91554
G2 X169.727 Y135.744 I-19.181 J-1.592 E.07966
G1 X150.199 Y155.272 E.88805
G1 X150 Y155.26 E.00641
G3 X148.139 Y155.057 I1.214 J-19.734 E.06021
G1 X132.717 Y139.635 E.70134
G2 X133.15 Y141.617 I38.056 J-7.283 E.06524
G1 X156.074 Y118.693 E1.04249
G1 X156.289 Y118.758 E.00721
G3 X158.839 Y119.701 I-5.347 J18.372 E.08752
G1 X168.074 Y128.936 E.41997
G3 X168.31 Y129.485 I-4.501 J2.263 E.01921
G1 X143.936 Y153.859 E1.10846
M73 P44 R13
G3 X142.463 Y153.166 I6.619 J-15.964 E.05236
G1 X160.934 Y152.5 F30000
G1 F15476.087
G1 X135.275 Y126.841 E1.16684
G3 X138.791 Y122.681 I17.89 J11.551 E.17563
G1 X165.093 Y148.983 E1.19613
G1 X164.644 Y149.476 E.02143
G3 X163.964 Y150.155 I-6.059 J-5.389 E.03094
G1 X164.315 Y123.505 F30000
G1 F15476.087
G3 X165.411 Y124.708 I-15.374 J15.107 E.05234
G1 X139.161 Y150.958 E1.19373
G3 X135.542 Y146.901 I12.126 J-14.459 E.17543
G1 X161.352 Y121.091 E1.17374
G3 X162.673 Y122.041 I-7.349 J11.604 E.05237
G1 X152.164 Y117.648 F30000
G1 F15476.087
G1 X152.302 Y117.656 E.00446
G3 X170.054 Y134.696 I-1.215 J19.032 E.86001
G1 X170.054 Y134.696 E0
G3 X149.977 Y155.667 I-18.992 J1.914 E1.06072
G1 X149.977 Y155.667 E0
G3 X134.697 Y146.321 I1.13 J-19.011 E.59963
G1 X134.697 Y146.321 E0
G3 X132.746 Y141.682 I16.482 J-9.662 E.16231
G1 X132.746 Y141.682 E0
G3 X133.086 Y130.527 I18.965 J-5.004 E.36387
G1 X133.086 Y130.527 E0
G3 X152.104 Y117.644 I18.097 J6.237 E.79219
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.513 Y117.62 E-.60476
G1 X150.105 Y117.645 E-.15524
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/15
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
G3 Z1.6 I-1.158 J.376 P1  F30000
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
G3 Z1.8 I.853 J-.868 P1  F30000
G1 X75.994 Y129.452 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X76.451 Y128.493 E.03417
G3 X94.916 Y117.999 I17.264 J8.885 E.72261
G3 X75.957 Y129.53 I-1.214 J19.355 E3.15863
G1 X75.968 Y129.506 E.00087
G1 X75.64 Y129.283 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.102 Y128.314 E.032
G3 X94.939 Y117.607 I17.594 J9.031 E.683
G3 X75.598 Y129.372 I-1.237 J19.747 E2.98506
G1 X75.615 Y129.338 E.00115
M204 S10000
; WIPE_START
G1 F24000
G1 X76.102 Y128.314 E-.43103
G1 X76.52 Y127.555 E-.32897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.79 J.926 P1  F30000
G1 X80.859 Y123.855 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X79.728 Y125.026 I9.301 J10.107 E.05237
G1 X106.031 Y151.329 E1.19616
G2 X109.547 Y147.168 I-14.408 J-15.739 E.17563
G1 X83.888 Y121.509 E1.16687
G1 X94.355 Y118.314 F30000
G1 F15476.087
G2 X92.264 Y118.362 I-.503 J23.954 E.06727
G2 X94.415 Y118.318 I1.463 J18.988 E3.77852
G1 X102.357 Y120.844 F30000
G1 F15476.087
G2 X101.275 Y120.322 I-4.947 J8.861 E.03867
G1 X100.885 Y120.15 E.01369
G1 X76.51 Y144.525 E1.10847
G2 X76.748 Y145.073 I4.736 J-1.723 E.01922
G1 X85.983 Y154.309 E.42
G2 X88.745 Y155.318 I8.216 J-18.204 E.09465
G1 X111.671 Y132.392 E1.04256
G3 X112.105 Y134.374 I-18.519 J5.092 E.06527
G1 X96.683 Y118.952 E.70133
G2 X94.622 Y118.738 I-3.744 J25.958 E.06665
G1 X75.094 Y138.266 E.88804
G3 X75.14 Y135.79 I19.389 J-.876 E.07968
G1 X95.274 Y155.924 E.91562
G2 X95.882 Y155.857 I-.261 J-5.156 E.01968
G1 X112.223 Y139.516 E.74312
G3 X111.819 Y141.765 I-189.192 J-32.827 E.07348
G1 X89.3 Y119.245 E1.02409
G2 X84.587 Y121.097 I4.844 J19.257 E.16327
G1 X77.465 Y128.218 E.32386
G2 X76.717 Y129.691 I15.43 J8.763 E.05313
G1 X101.365 Y154.339 E1.1209
G3 X100.496 Y154.707 I-3.535 J-7.144 E.03039
G1 X99.855 Y154.945 E.02198
G1 X82.148 Y151.967 F30000
G1 F15476.087
G2 X83.468 Y152.919 I8.677 J-10.648 E.05237
G1 X109.279 Y127.108 E1.17378
G2 X105.66 Y123.051 I-17.809 J12.244 E.17528
G1 X79.41 Y149.302 E1.19376
G3 X78.422 Y148.008 I10.399 J-8.969 E.05237
; WIPE_START
G1 F24000
G1 X79.41 Y149.302 E-.61849
G1 X79.673 Y149.038 E-.14151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.511 J1.104 P1  F30000
G1 X138.863 Y121.621 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X152.284 Y117.306 I12.237 J15.032 E.46396
G3 X133.839 Y127.835 I-1.178 J19.358 E3.1956
G3 X138.817 Y121.659 I17.261 J8.818 E.25688
G1 X138.611 Y121.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.619 Y121.322 E.00026
G3 X152.306 Y116.915 I12.5 J15.362 E.43832
G3 X132.987 Y128.716 I-1.2 J19.749 E2.98506
G3 X137.732 Y122.088 I18.132 J7.968 E.24454
G1 X138.566 Y121.359 E.03299
M204 S10000
; WIPE_START
G1 F24000
G1 X138.619 Y121.322 E-.02478
G1 X139.546 Y120.602 E-.44563
G1 X140.177 Y120.176 E-.28959
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.275 J1.185 P1  F30000
G1 X144.967 Y119.064 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.457 Y119.671 I4.357 J13.025 E.05237
G1 X168.104 Y144.318 E1.12084
G3 X167.358 Y145.789 I-13.143 J-5.739 E.05305
G1 X160.23 Y152.917 E.32419
G3 X155.522 Y154.764 I-9.175 J-16.462 E.16309
G1 X133.003 Y132.245 E1.02409
G2 X132.597 Y134.494 I20.626 J4.885 E.07352
G1 X148.938 Y118.153 E.74311
G3 X149.549 Y118.087 I.865 J5.115 E.01978
G1 X169.681 Y138.219 E.91554
G2 X169.727 Y135.744 I-19.181 J-1.592 E.07966
G1 X150.199 Y155.272 E.88805
G1 X149.963 Y155.258 E.00762
G3 X148.139 Y155.057 I1.262 J-19.809 E.059
G1 X132.717 Y139.635 E.70134
G2 X133.15 Y141.617 I38.056 J-7.283 E.06524
G1 X156.074 Y118.693 E1.04249
G1 X156.289 Y118.758 E.00721
G3 X158.839 Y119.701 I-5.347 J18.372 E.08752
G1 X168.074 Y128.936 E.41997
G3 X168.31 Y129.485 I-4.501 J2.263 E.01921
G1 X143.936 Y153.859 E1.10846
M73 P45 R13
G3 X142.463 Y153.166 I6.497 J-15.704 E.05236
G1 X160.934 Y152.5 F30000
G1 F15476.087
G1 X135.275 Y126.841 E1.16684
G3 X138.791 Y122.681 I15.37 J9.422 E.17582
G1 X165.093 Y148.983 E1.19613
G1 X164.644 Y149.476 E.02143
G3 X163.964 Y150.155 I-6.059 J-5.389 E.03094
G1 X164.315 Y123.505 F30000
G1 F15476.087
G3 X165.411 Y124.708 I-15.372 J15.106 E.05234
G1 X139.161 Y150.958 E1.19373
G3 X135.542 Y146.901 I12.126 J-14.458 E.17543
G1 X161.352 Y121.091 E1.17374
G3 X162.673 Y122.041 I-7.349 J11.604 E.05237
G1 X152.555 Y117.67 F30000
G1 F15476.087
G3 X170.054 Y134.696 I-1.526 J19.074 E.85139
G1 X170.054 Y134.696 E0
G3 X149.939 Y155.665 I-18.942 J1.962 E1.06282
G1 X149.939 Y155.665 E0
G3 X134.697 Y146.321 I1.261 J-19.161 E.59799
G1 X134.697 Y146.321 E0
G3 X132.746 Y141.682 I16.748 J-9.774 E.16229
G1 X132.746 Y141.682 E0
G3 X133.086 Y130.527 I18.369 J-5.022 E.36419
G1 X133.086 Y130.527 E0
G3 X152.495 Y117.667 I18.098 J6.237 E.80481
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.513 Y117.62 E-.7537
G1 X150.496 Y117.621 E-.0063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/15
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I-1.159 J.372 P1  F30000
G1 X189.5 Y239 Z1.8
G1 Z1.6
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
; layer #9
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
G3 Z2 I.853 J-.868 P1  F30000
G1 X76.019 Y129.401 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X76.451 Y128.493 E.03236
G3 X77.62 Y126.514 I17.257 J8.857 E.07395
G1 X78.29 Y125.58 E.03697
G3 X95.016 Y118.005 I15.426 J11.808 E.61496
G1 X95.431 Y118.029 E.01337
G3 X75.957 Y129.531 I-1.723 J19.321 E3.14272
G1 X75.993 Y129.455 E.00268
G1 X75.665 Y129.232 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.102 Y128.314 E.03032
G3 X77.295 Y126.295 I17.606 J9.037 E.06988
G1 X77.979 Y125.342 E.03494
G3 X95.039 Y117.613 I15.738 J12.047 E.58106
G1 X95.466 Y117.638 E.01273
G3 X75.598 Y129.372 I-1.757 J19.712 E2.96998
G1 X75.639 Y129.287 E.00283
M204 S10000
; WIPE_START
G1 F24000
G1 X76.102 Y128.314 E-.4096
G1 X76.548 Y127.506 E-.3504
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.787 J.929 P1  F30000
G1 X80.859 Y123.855 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X79.728 Y125.026 I9.301 J10.107 E.05237
G1 X106.031 Y151.329 E1.19616
G2 X109.547 Y147.168 I-14.408 J-15.739 E.17563
G1 X83.888 Y121.509 E1.16687
G1 X94.535 Y118.325 F30000
G1 F15476.087
G2 X90.898 Y118.51 I-.799 J20.175 E.11727
G2 X94.595 Y118.328 I2.776 J18.842 E3.72874
G1 X102.357 Y120.844 F30000
G1 F15476.087
G2 X101.253 Y120.312 I-5.039 J9.04 E.03944
G1 X100.885 Y120.15 E.01293
G1 X76.51 Y144.525 E1.10847
G2 X76.748 Y145.073 I4.736 J-1.723 E.01922
G1 X85.983 Y154.309 E.42
G2 X88.745 Y155.318 I8.216 J-18.205 E.09465
G1 X111.671 Y132.392 E1.04256
G3 X112.105 Y134.374 I-18.518 J5.092 E.06527
G1 X96.683 Y118.952 E.70133
G2 X94.622 Y118.738 I-3.744 J25.957 E.06665
G1 X75.094 Y138.266 E.88804
G3 X75.14 Y135.79 I19.389 J-.876 E.07968
G1 X95.274 Y155.924 E.91562
G2 X95.882 Y155.857 I-.261 J-5.156 E.01968
G1 X112.223 Y139.516 E.74312
G3 X111.819 Y141.765 I-189.22 J-32.832 E.07348
G1 X89.3 Y119.245 E1.02409
G2 X84.587 Y121.097 I4.844 J19.257 E.16327
G1 X77.465 Y128.218 E.32386
G2 X76.717 Y129.691 I15.43 J8.763 E.05313
G1 X101.365 Y154.339 E1.1209
G3 X100.496 Y154.707 I-3.535 J-7.144 E.03039
G1 X99.855 Y154.945 E.02198
G1 X82.148 Y151.967 F30000
G1 F15476.087
G2 X83.468 Y152.919 I8.678 J-10.65 E.05237
G1 X109.279 Y127.108 E1.17378
G2 X105.66 Y123.051 I-17.809 J12.244 E.17528
G1 X79.41 Y149.302 E1.19376
G3 X78.422 Y148.008 I10.399 J-8.969 E.05237
; WIPE_START
G1 F24000
G1 X79.41 Y149.302 E-.61849
G1 X79.673 Y149.038 E-.14151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.511 J1.104 P1  F30000
G1 X138.863 Y121.621 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X151.651 Y117.27 I12.25 J15.035 E.44367
G1 X152.384 Y117.312 E.0236
G1 X152.799 Y117.336 E.01337
G3 X138.817 Y121.659 I-1.686 J19.32 E3.43575
G1 X138.609 Y121.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.615 Y121.317 E.00022
G3 X151.662 Y116.878 I12.498 J15.339 E.41929
G1 X152.406 Y116.92 E.0222
G1 X152.833 Y116.945 E.01273
G3 X137.728 Y122.084 I-1.72 J19.711 E3.21379
G1 X138.564 Y121.36 E.03293
M204 S10000
; WIPE_START
G1 F24000
G1 X138.615 Y121.317 E-.02556
G1 X139.546 Y120.602 E-.44569
G1 X140.175 Y120.177 E-.28875
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.275 J1.185 P1  F30000
G1 X144.967 Y119.064 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.457 Y119.671 I4.357 J13.025 E.05237
G1 X168.104 Y144.318 E1.12084
G3 X167.358 Y145.789 I-13.143 J-5.739 E.05305
G1 X160.23 Y152.917 E.32419
G3 X155.522 Y154.764 I-9.196 J-16.514 E.16309
G1 X133.003 Y132.245 E1.02409
G2 X132.597 Y134.494 I193.037 J36.01 E.07349
G1 X148.938 Y118.153 E.74311
G3 X149.549 Y118.087 I.865 J5.115 E.01978
G1 X169.681 Y138.219 E.91554
G2 X169.727 Y135.744 I-19.181 J-1.592 E.07966
G1 X150.199 Y155.272 E.88805
G1 X149.963 Y155.258 E.00762
G3 X148.139 Y155.057 I1.262 J-19.809 E.059
G1 X132.717 Y139.635 E.70134
G2 X133.15 Y141.617 I38.056 J-7.283 E.06524
G1 X156.074 Y118.693 E1.04249
G1 X156.289 Y118.758 E.00721
G3 X158.839 Y119.701 I-5.347 J18.372 E.08752
G1 X168.074 Y128.936 E.41997
G3 X168.31 Y129.485 I-4.501 J2.263 E.01921
G1 X143.936 Y153.859 E1.10846
G3 X142.463 Y153.166 I6.497 J-15.704 E.05236
M73 P46 R13
G1 X160.934 Y152.5 F30000
G1 F15476.087
G1 X135.275 Y126.841 E1.16684
G3 X138.791 Y122.681 I15.887 J9.859 E.17578
G1 X165.093 Y148.983 E1.19613
G1 X164.644 Y149.476 E.02143
G3 X163.964 Y150.155 I-6.059 J-5.389 E.03094
G1 X164.315 Y123.505 F30000
G1 F15476.087
G3 X165.411 Y124.708 I-15.374 J15.107 E.05234
G1 X139.161 Y150.958 E1.19373
G3 X135.542 Y146.901 I13.797 J-15.948 E.17531
G1 X161.352 Y121.091 E1.17374
G3 X162.673 Y122.041 I-7.349 J11.604 E.05237
G1 X152.555 Y117.67 F30000
G1 F15476.087
G3 X170.054 Y134.696 I-1.451 J18.996 E.85213
G1 X170.054 Y134.696 E0
G3 X149.939 Y155.665 I-18.992 J1.914 E1.06193
G1 X149.939 Y155.665 E0
G3 X134.697 Y146.321 I1.182 J-19.032 E.59835
G1 X134.697 Y146.321 E0
G3 X132.746 Y141.682 I16.482 J-9.662 E.16231
G1 X132.746 Y141.682 E0
G3 X133.086 Y130.527 I18.965 J-5.004 E.36387
G1 X133.086 Y130.527 E0
G3 X152.495 Y117.667 I18.031 J6.136 E.80551
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.513 Y117.62 E-.7537
G1 X150.496 Y117.621 E-.0063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/15
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
G3 Z2 I-1.159 J.372 P1  F30000
G1 X189.5 Y239 Z2
G1 Z1.8
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
; layer #10
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
G3 Z2.2 I.853 J-.867 P1  F30000
G1 X76.043 Y129.35 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X76.457 Y128.496 E.03054
G3 X95.116 Y118.01 I17.253 J8.858 E.72906
G1 X95.431 Y118.029 E.01015
G3 X96.573 Y156.535 I-1.723 J19.321 E1.81169
G3 X75.963 Y129.533 I-2.862 J-19.182 E1.33085
G1 X76.019 Y129.405 E.00449
G1 X75.689 Y129.182 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.108 Y128.317 E.02863
G3 X95.139 Y117.619 I17.602 J9.037 E.68883
G1 X95.466 Y117.638 E.00975
G3 X96.631 Y156.923 I-1.757 J19.712 E1.71212
G3 X75.604 Y129.375 I-2.92 J-19.57 E1.2577
G1 X75.665 Y129.237 E.00451
M204 S10000
; WIPE_START
G1 F24000
G1 X76.108 Y128.317 E-.38809
G1 X76.576 Y127.457 E-.37191
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.783 J.931 P1  F30000
G1 X80.859 Y123.855 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X79.728 Y125.026 I9.301 J10.107 E.05237
G1 X106.031 Y151.329 E1.19616
G2 X109.547 Y147.168 I-14.408 J-15.739 E.17563
G1 X83.888 Y121.509 E1.16687
G1 X94.387 Y118.316 F30000
G1 F15476.087
G2 X92.264 Y118.362 I-.568 J23.034 E.06829
G2 X94.447 Y118.32 I1.456 J18.988 E3.77738
G1 X102.357 Y120.844 F30000
G1 F15476.087
G2 X100.885 Y120.15 I-7.357 J13.689 E.05236
G1 X76.51 Y144.525 E1.10847
G2 X76.748 Y145.073 I4.736 J-1.723 E.01922
G1 X85.983 Y154.309 E.42
G2 X88.745 Y155.318 I8.216 J-18.205 E.09465
G1 X111.671 Y132.392 E1.04256
G3 X112.105 Y134.374 I-18.518 J5.092 E.06527
G1 X96.683 Y118.952 E.70133
G2 X94.622 Y118.738 I-3.744 J25.958 E.06665
G1 X75.094 Y138.266 E.88804
G3 X75.14 Y135.79 I19.389 J-.876 E.07968
G1 X95.274 Y155.924 E.91562
G2 X95.882 Y155.857 I-.261 J-5.156 E.01968
G1 X112.223 Y139.516 E.74312
G3 X111.819 Y141.765 I-189.22 J-32.832 E.07348
G1 X89.3 Y119.245 E1.02409
G2 X84.587 Y121.097 I4.33 J17.95 E.16334
G1 X77.465 Y128.218 E.32386
G2 X76.717 Y129.691 I15.429 J8.763 E.05313
G1 X101.365 Y154.339 E1.1209
G3 X100.496 Y154.707 I-3.535 J-7.144 E.03039
G1 X99.855 Y154.945 E.02198
G1 X82.148 Y151.967 F30000
G1 F15476.087
G2 X83.468 Y152.919 I8.678 J-10.65 E.05237
G1 X109.279 Y127.108 E1.17378
G2 X105.66 Y123.051 I-17.809 J12.244 E.17528
G1 X79.41 Y149.302 E1.19376
G3 X78.422 Y148.008 I10.399 J-8.969 E.05237
; WIPE_START
G1 F24000
G1 X79.41 Y149.302 E-.61849
G1 X79.673 Y149.038 E-.14151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.511 J1.104 P1  F30000
G1 X138.863 Y121.621 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X151.651 Y117.27 I12.25 J15.035 E.44367
G1 X152.484 Y117.317 E.02682
G1 X152.799 Y117.336 E.01015
G3 X138.817 Y121.659 I-1.686 J19.32 E3.43575
G1 X138.607 Y121.322 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.615 Y121.317 E.00028
G3 X151.662 Y116.878 I12.498 J15.339 E.41929
G1 X152.506 Y116.926 E.02519
G1 X152.833 Y116.945 E.00975
G3 X137.728 Y122.084 I-1.72 J19.711 E3.21379
G1 X138.562 Y121.361 E.03287
M204 S10000
; WIPE_START
G1 F24000
G1 X138.615 Y121.317 E-.0264
G1 X139.546 Y120.602 E-.44569
G1 X140.173 Y120.178 E-.28791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.275 J1.185 P1  F30000
G1 X144.967 Y119.064 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.457 Y119.671 I4.357 J13.026 E.05237
G1 X168.104 Y144.318 E1.12085
G3 X167.358 Y145.789 I-13.143 J-5.739 E.05305
G1 X160.23 Y152.917 E.32419
G3 X155.522 Y154.764 I-9.916 J-18.349 E.163
G1 X133.003 Y132.245 E1.02409
G2 X132.597 Y134.494 I193.037 J36.01 E.07349
G1 X148.938 Y118.153 E.74311
G3 X149.549 Y118.087 I.865 J5.115 E.01978
G1 X169.681 Y138.219 E.91554
G2 X169.727 Y135.744 I-19.181 J-1.592 E.07966
G1 X150.199 Y155.272 E.88805
G1 X150 Y155.26 E.00641
G3 X148.139 Y155.057 I1.214 J-19.734 E.06021
G1 X132.717 Y139.635 E.70134
G2 X133.15 Y141.617 I38.056 J-7.283 E.06524
G1 X156.074 Y118.693 E1.04249
G3 X158.839 Y119.701 I-5.353 J18.969 E.09473
G1 X168.074 Y128.936 E.41997
G3 X168.31 Y129.485 I-4.501 J2.263 E.01921
G1 X143.936 Y153.859 E1.10846
G3 X142.463 Y153.166 I6.497 J-15.704 E.05236
G1 X160.934 Y152.5 F30000
G1 F15476.087
G1 X135.275 Y126.841 E1.16684
G3 X138.791 Y122.681 I15.37 J9.422 E.17582
G1 X165.093 Y148.983 E1.19613
M73 P47 R13
G1 X164.644 Y149.476 E.02143
G3 X163.964 Y150.155 I-6.059 J-5.389 E.03094
G1 X164.315 Y123.505 F30000
G1 F15476.087
G3 X165.411 Y124.708 I-15.372 J15.106 E.05234
G1 X139.161 Y150.958 E1.19373
G3 X135.542 Y146.901 I12.126 J-14.459 E.17543
G1 X161.352 Y121.091 E1.17374
G3 X162.673 Y122.041 I-7.349 J11.604 E.05237
G1 X152.555 Y117.67 F30000
G1 F15476.087
G3 X170.054 Y134.696 I-1.526 J19.074 E.85139
G1 X170.054 Y134.696 E0
G3 X149.977 Y155.667 I-18.992 J1.914 E1.06072
G1 X149.977 Y155.667 E0
G3 X134.697 Y146.321 I1.223 J-19.162 E.5992
G1 X134.697 Y146.321 E0
G3 X132.746 Y141.682 I16.482 J-9.662 E.16231
G1 X132.746 Y141.682 E0
G3 X133.086 Y130.527 I18.965 J-5.004 E.36387
G1 X133.086 Y130.527 E0
M73 P47 R12
G3 X152.495 Y117.667 I18.031 J6.136 E.80551
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.513 Y117.62 E-.7537
G1 X150.496 Y117.621 E-.0063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/15
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
G3 Z2.2 I-1.159 J.372 P1  F30000
G1 X189.5 Y239 Z2.2
G1 Z2
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
; layer #11
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
G3 Z2.4 I.854 J-.867 P1  F30000
G1 X76.067 Y129.3 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X76.455 Y128.494 E.02875
G3 X95.216 Y118.016 I17.254 J8.858 E.73236
G1 X95.431 Y118.029 E.00692
G3 X96.573 Y156.535 I-1.732 J19.321 E1.81119
G3 X75.96 Y129.532 I-2.864 J-19.182 E1.33094
G1 X76.042 Y129.355 E.00628
G1 X75.713 Y129.131 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.106 Y128.315 E.02698
G3 X95.239 Y117.625 I17.603 J9.037 E.69189
G1 X95.466 Y117.638 E.00676
G3 X96.631 Y156.923 I-1.767 J19.712 E1.71164
G3 X75.602 Y129.374 I-2.922 J-19.57 E1.25779
G1 X75.688 Y129.186 E.00616
M204 S10000
; WIPE_START
G1 F24000
G1 X76.106 Y128.315 E-.36699
G1 X76.602 Y127.408 E-.39301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.193 J-.238 P1  F30000
G1 X74.496 Y137.96 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.403006
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X74.989 Y140.757 E.14306
G2 X76.129 Y144.61 I18.077 J-3.25 E.20287
G1 X74.705 Y136.535 E.41313
G1 X74.714 Y136.223 E.01572
G1 X74.814 Y135.1 E.05682
G1 X74.859 Y134.8 E.01527
G1 X76.869 Y146.2 E.5832
G2 X77.533 Y147.356 I10.075 J-5.016 E.06722
G1 X75.087 Y133.482 E.7098
G3 X75.352 Y132.375 I9.459 J1.677 E.05738
G1 X78.161 Y148.306 E.815
G2 X78.764 Y149.117 I7.139 J-4.675 E.05097
G1 X75.641 Y131.407 E.90602
G3 X75.948 Y130.538 I7.479 J2.148 E.04649
G1 X79.35 Y149.832 E.98707
G1 X79.919 Y150.455 E.04253
G1 X76.268 Y129.747 E1.05938
G3 X76.603 Y129.035 I6.166 J2.462 E.03966
G1 X80.478 Y151.014 E1.1244
G2 X81.029 Y151.531 I4.634 J-4.386 E.0381
G1 X76.944 Y128.364 E1.18517
G1 X77.293 Y127.732 E.03637
G1 X81.572 Y151.998 E1.24142
G2 X82.106 Y152.421 I3.827 J-4.292 E.03435
G1 X77.651 Y127.157 E1.29248
G3 X78.013 Y126.6 I4.871 J2.77 E.03347
G1 X82.637 Y152.824 E1.3416
G1 X83.159 Y153.176 E.03171
G1 X78.382 Y126.085 E1.38592
G3 X78.756 Y125.593 I4.335 J2.898 E.03115
G1 X83.679 Y153.516 E1.42848
G1 X84.193 Y153.819 E.03004
G1 X79.134 Y125.127 E1.46782
G3 X79.516 Y124.687 I3.902 J3.001 E.0294
G1 X84.703 Y154.106 E1.50506
G1 X85.209 Y154.366 E.02864
G1 X79.902 Y124.265 E1.53991
G3 X80.291 Y123.868 I3.543 J3.086 E.02807
G1 X85.712 Y154.611 E1.57276
G1 X86.211 Y154.83 E.02746
G1 X80.684 Y123.487 E1.60351
G3 X81.081 Y123.125 I3.242 J3.158 E.02703
G1 X86.708 Y155.039 E1.63265
G1 X87.2 Y155.222 E.02646
G1 X81.48 Y122.781 E1.65961
G3 X81.882 Y122.451 I2.984 J3.22 E.02622
G1 X87.691 Y155.399 E1.68558
G1 X88.177 Y155.548 E.02561
G1 X82.287 Y122.141 E1.70901
G3 X82.694 Y121.838 I2.759 J3.273 E.02557
G1 X88.664 Y155.696 E1.73213
G2 X89.144 Y155.814 I1.235 J-3.993 E.02496
G1 X83.105 Y121.561 E1.75233
G1 X83.516 Y121.284 E.02498
G1 X89.625 Y155.93 E1.77244
G2 X90.102 Y156.026 I1.046 J-3.97 E.02452
G1 X83.932 Y121.035 E1.79007
G1 X84.349 Y120.789 E.02438
G1 X90.577 Y156.111 E1.80703
G2 X91.05 Y156.187 I.877 J-3.951 E.02417
G1 X84.768 Y120.561 E1.82262
G1 X85.19 Y120.344 E.02389
G1 X91.52 Y156.243 E1.83656
G1 X91.99 Y156.299 E.02384
G1 X85.613 Y120.133 E1.8502
G1 X86.04 Y119.945 E.0235
G1 X92.455 Y156.329 E1.86132
G1 X92.92 Y156.356 E.02346
G1 X86.467 Y119.757 E1.87235
G3 X86.897 Y119.591 I1.616 J3.546 E.02327
G1 X93.382 Y156.37 E1.88154
G1 X93.842 Y156.37 E.02318
G1 X87.329 Y119.431 E1.88974
M73 P48 R12
G3 X87.762 Y119.28 I1.491 J3.576 E.02314
G1 X94.302 Y156.368 E1.89739
G1 X94.757 Y156.341 E.02298
G1 X88.199 Y119.146 E1.90282
G1 X88.635 Y119.013 E.02299
G1 X95.212 Y156.314 E1.90826
G2 X95.665 Y156.271 I-.134 J-3.833 E.02291
G1 X89.076 Y118.903 E1.91171
G1 X89.517 Y118.796 E.02287
G1 X96.115 Y156.217 E1.91441
G2 X96.565 Y156.161 I-.251 J-3.82 E.02286
G1 X89.962 Y118.709 E1.916
G1 X90.407 Y118.624 E.02282
G1 X97.011 Y156.081 E1.91622
G1 X97.457 Y156.001 E.02282
G1 X90.852 Y118.54 E1.91643
G3 X91.302 Y118.483 I.64 J3.245 E.02287
G1 X97.9 Y155.904 E1.91441
G1 X98.341 Y155.798 E.02287
G1 X91.752 Y118.429 E1.91171
G3 X92.205 Y118.387 I.587 J3.79 E.02291
G1 X98.782 Y155.687 E1.90826
G1 X99.218 Y155.554 E.02299
G1 X92.66 Y118.36 E1.90282
G1 X93.115 Y118.333 E.02298
G1 X99.655 Y155.421 E1.89739
G2 X100.088 Y155.27 I-1.057 J-3.727 E.02314
G1 X93.575 Y118.331 E1.88974
G1 X94.035 Y118.331 E.02318
G1 X100.52 Y155.109 E1.88154
G2 X100.951 Y154.943 I-1.186 J-3.713 E.02327
G1 X94.497 Y118.344 E1.87235
G1 X94.962 Y118.372 E.02346
G1 X101.377 Y154.755 E1.86132
G1 X101.804 Y154.567 E.0235
G1 X95.429 Y118.412 E1.84965
G1 X95.898 Y118.463 E.02377
G1 X102.227 Y154.356 E1.83625
G1 X102.649 Y154.14 E.02389
G1 X96.367 Y118.515 E1.82254
G3 X96.84 Y118.589 I-.304 J3.48 E.02415
G1 X103.069 Y153.911 E1.80703
G1 X103.485 Y153.665 E.02438
G1 X97.315 Y118.674 E1.79007
G3 X97.792 Y118.77 I-.569 J4.066 E.02452
G1 X103.901 Y153.416 E1.77245
M73 P49 R12
G1 X104.313 Y153.139 E.02498
G1 X98.273 Y118.886 E1.75234
G3 X98.754 Y119.004 I-.754 J4.11 E.02496
G1 X104.724 Y152.862 E1.73213
G2 X105.13 Y152.559 I-2.352 J-3.577 E.02557
G1 X99.24 Y119.153 E1.70902
G1 X99.726 Y119.301 E.02561
G1 X105.536 Y152.25 E1.68559
G2 X105.937 Y151.919 I-2.581 J-3.55 E.02622
G1 X100.217 Y119.479 E1.65961
G1 X100.709 Y119.662 E.02646
G1 X106.337 Y151.575 E1.63266
G2 X106.733 Y151.214 I-2.846 J-3.52 E.02703
G1 X101.206 Y119.87 E1.60351
G1 X101.705 Y120.09 E.02746
G1 X107.126 Y150.833 E1.57277
G2 X107.516 Y150.435 I-3.153 J-3.483 E.02807
G1 X102.208 Y120.334 E1.53992
G1 X102.714 Y120.594 E.02864
G1 X107.901 Y150.014 E1.50507
G2 X108.284 Y149.573 I-3.52 J-3.442 E.0294
G1 X103.225 Y120.881 E1.46783
G1 X103.738 Y121.185 E.03004
G1 X108.662 Y149.107 E1.42849
G2 X109.035 Y148.615 I-3.962 J-3.39 E.03115
G1 X104.258 Y121.524 E1.38593
G1 X104.78 Y121.876 E.03171
G1 X109.404 Y148.1 E1.34161
G2 X109.766 Y147.544 I-4.509 J-3.327 E.03347
G1 X105.311 Y122.279 E1.29249
G3 X105.846 Y122.702 I-3.293 J4.715 E.03435
G1 X110.124 Y146.968 E1.24144
G1 X110.473 Y146.336 E.03637
G1 X106.388 Y123.169 E1.18518
G3 X106.939 Y123.687 I-4.082 J4.903 E.0381
G1 X110.815 Y145.666 E1.12441
G2 X111.149 Y144.954 I-5.833 J-3.174 E.03966
G1 X107.498 Y124.246 E1.05939
M73 P50 R12
G1 X108.068 Y124.868 E.04253
G1 X111.47 Y144.163 E.98708
G2 X111.776 Y143.293 I-7.173 J-3.018 E.04649
G1 X108.654 Y125.583 E.90604
G3 X109.257 Y126.395 I-6.537 J5.487 E.05097
G1 X112.066 Y142.326 E.81502
G2 X112.331 Y141.219 I-9.195 J-2.784 E.05738
G1 X109.884 Y127.344 E.70982
G3 X110.548 Y128.5 I-9.41 J6.171 E.06722
G1 X112.558 Y139.901 E.58323
G1 X112.603 Y139.601 E.01528
G1 X112.703 Y138.477 E.05682
G1 X112.712 Y138.166 E.01569
G1 X111.288 Y130.09 E.41317
G3 X112.427 Y133.941 I-16.926 J7.1 E.20275
G1 X112.921 Y136.741 E.14324
; WIPE_START
G1 F24000
G1 X112.574 Y134.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.544 J1.088 P1  F30000
G1 X138.862 Y121.62 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X139.775 Y120.921 E.03697
G3 X140.727 Y120.277 I11.337 J15.736 E.03697
G1 X141.716 Y119.69 E.03697
G3 X152.584 Y117.323 I9.381 J16.939 E.36278
G1 X152.799 Y117.336 E.00692
G3 X138.816 Y121.658 I-1.687 J19.321 E3.43598
G1 X138.624 Y121.309 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.546 Y120.603 E.03459
G3 X140.517 Y119.945 I11.566 J16.054 E.03494
G1 X141.526 Y119.347 E.03494
G3 X152.606 Y116.932 I9.57 J17.28 E.34262
G1 X152.833 Y116.945 E.00676
G3 X138.577 Y121.347 I-1.721 J19.712 E3.24749
M204 S10000
; WIPE_START
G1 F24000
G1 X139.546 Y120.603 E-.46404
G1 X140.191 Y120.166 E-.29596
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.892 J-.828 P1  F30000
M73 P51 R12
G1 X137.125 Y123.472 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.402918
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X135.296 Y126.083 E.16054
G2 X133.685 Y129.022 I17.824 J11.682 E.16896
G1 X133.541 Y129.38 E.01943
G1 X138.278 Y122.614 E.41594
G3 X139.593 Y121.526 I9.83 J10.537 E.08603
G1 X132.942 Y131.025 E.58402
G1 X132.59 Y132.317 E.06745
M73 P51 R11
G1 X140.691 Y120.747 E.71131
G3 X141.66 Y120.153 I5.49 J7.866 E.05727
G1 X132.364 Y133.43 E.8162
G1 X132.217 Y134.43 E.05091
G1 X142.541 Y119.685 E.90645
G3 X143.373 Y119.286 I3.318 J5.855 E.04651
G1 X132.137 Y135.333 E.98651
G2 X132.1 Y136.176 I7.085 J.737 E.04252
G1 X144.158 Y118.955 E1.05874
G1 X144.907 Y118.675 E.04025
G1 X132.094 Y136.974 E1.12498
G1 X132.118 Y137.73 E.03807
G1 X145.616 Y118.452 E1.18515
G3 X146.307 Y118.255 I2.003 J5.721 E.03619
G1 X132.176 Y138.435 E1.24064
G2 X132.249 Y139.121 I5.811 J-.272 E.03474
G1 X146.973 Y118.093 E1.29277
G3 X147.616 Y117.964 I1.402 J5.351 E.03302
G1 X132.348 Y139.77 E1.34057
G2 X132.463 Y140.396 I5.326 J-.657 E.03204
G1 X148.25 Y117.849 E1.38609
G3 X148.855 Y117.775 I.929 J5.059 E.03071
G1 X132.591 Y141.001 E1.4279
G2 X132.74 Y141.579 I4.939 J-.964 E.03004
G1 X149.456 Y117.706 E1.46761
G1 X150.033 Y117.671 E.02915
G1 X132.896 Y142.145 E1.50463
G2 X133.072 Y142.683 I4.622 J-1.215 E.02853
G1 X150.607 Y117.641 E1.53953
G1 X151.161 Y117.64 E.02788
G1 X133.253 Y143.215 E1.57227
G2 X133.452 Y143.72 I4.357 J-1.424 E.02737
G1 X151.711 Y117.643 E1.60314
G1 X152.243 Y117.674 E.02681
G1 X133.655 Y144.219 E1.63194
G2 X133.874 Y144.697 I4.134 J-1.602 E.02647
G1 X152.767 Y117.715 E1.6588
G1 X153.281 Y117.77 E.02604
G1 X134.098 Y145.166 E1.68423
G2 X134.334 Y145.62 I3.939 J-1.754 E.02575
G1 X153.795 Y117.826 E1.70872
G3 X154.291 Y117.907 I-.346 J3.647 E.02532
G1 X134.578 Y146.061 E1.73081
G2 X134.828 Y146.494 I3.773 J-1.889 E.02518
G1 X154.783 Y117.995 E1.75204
G3 X155.264 Y118.097 I-.62 J4.108 E.0248
G1 X135.09 Y146.908 E1.77124
G2 X135.353 Y147.322 I3.619 J-2.006 E.02472
G1 X155.738 Y118.21 E1.78973
G3 X156.207 Y118.33 I-.773 J4.012 E.0244
G1 X135.634 Y147.711 E1.80631
G1 X135.914 Y148.101 E.02416
G1 X156.663 Y118.468 E1.82173
G1 X157.119 Y118.606 E.024
G1 X136.205 Y148.474 E1.83618
G1 X136.503 Y148.839 E.02371
G1 X157.56 Y118.766 E1.84882
G1 X158 Y118.928 E.02358
G1 X136.804 Y149.198 E1.86091
G1 X137.118 Y149.539 E.02336
G1 X158.431 Y119.101 E1.87126
G1 X158.854 Y119.287 E.02326
G1 X137.432 Y149.881 E1.88086
G2 X137.759 Y150.204 I2.883 J-2.594 E.02315
G1 X159.277 Y119.473 E1.88926
G1 X159.684 Y119.681 E.02303
G1 X138.088 Y150.523 E1.89607
G2 X138.424 Y150.833 I2.784 J-2.671 E.02303
G1 X160.091 Y119.889 E1.90237
G3 X160.49 Y120.11 I-1.66 J3.466 E.02295
G1 X138.769 Y151.13 E1.90703
G1 X139.115 Y151.426 E.02292
G1 X160.881 Y120.34 E1.9111
G3 X161.272 Y120.572 I-1.761 J3.405 E.02289
G1 X139.474 Y151.703 E1.91384
G1 X139.834 Y151.977 E.02283
G1 X161.648 Y120.825 E1.91519
G1 X162.024 Y121.077 E.02281
G1 X140.207 Y152.235 E1.91555
G1 X140.58 Y152.491 E.02281
G1 X162.391 Y121.342 E1.91495
G1 X162.752 Y121.617 E.02283
G1 X140.954 Y152.747 E1.91382
M73 P52 R11
G2 X141.344 Y152.98 I1.887 J-2.721 E.02289
G1 X163.111 Y121.893 E1.9111
G1 X163.456 Y122.19 E.02292
G1 X141.736 Y153.21 E1.90703
G2 X142.134 Y153.431 I2.058 J-3.246 E.02295
G1 X163.802 Y122.486 E1.90237
G3 X164.137 Y122.797 I-2.449 J2.982 E.02303
G1 X142.542 Y153.639 E1.89607
G1 X142.949 Y153.847 E.02303
G1 X164.467 Y123.116 E1.88926
G3 X164.794 Y123.438 I-2.555 J2.916 E.02315
G1 X143.371 Y154.033 E1.88087
G1 X143.794 Y154.218 E.02326
G1 X165.107 Y123.78 E1.87126
G1 X165.421 Y124.122 E.02336
G1 X144.226 Y154.391 E1.86091
G1 X144.665 Y154.554 E.02358
G1 X165.723 Y124.481 E1.84882
G1 X166.02 Y124.846 E.02371
G1 X145.107 Y154.713 E1.83618
G1 X145.563 Y154.851 E.024
G1 X166.312 Y125.219 E1.82173
G1 X166.592 Y125.608 E.02416
G1 X146.019 Y154.99 E1.80631
G2 X146.488 Y155.109 I1.242 J-3.892 E.0244
G1 X166.872 Y125.997 E1.78974
G3 X167.135 Y126.412 I-3.358 J2.422 E.02472
G1 X146.961 Y155.223 E1.77125
G2 X147.443 Y155.325 I1.101 J-4.006 E.0248
G1 X167.398 Y126.826 E1.75205
G3 X167.648 Y127.259 I-3.522 J2.321 E.02518
G1 X147.934 Y155.412 E1.73081
G2 X148.43 Y155.495 I.943 J-4.129 E.02529
G1 X167.892 Y127.7 E1.70878
G3 X168.127 Y128.154 I-3.706 J2.209 E.02575
G1 X148.941 Y155.555 E1.68456
G1 X149.452 Y155.615 E.02591
G1 X168.352 Y128.623 E1.65941
G3 X168.57 Y129.1 I-3.914 J2.079 E.02647
G1 X149.983 Y155.646 E1.63195
G1 X150.514 Y155.676 E.02681
G1 X168.774 Y129.599 E1.60315
M73 P53 R11
G3 X168.973 Y130.105 I-4.158 J1.929 E.02737
G1 X151.065 Y155.679 E1.57227
G1 X151.619 Y155.678 E.02788
G1 X169.153 Y130.636 E1.53954
G3 X169.33 Y131.174 I-4.445 J1.753 E.02853
G1 X152.192 Y155.649 E1.50464
G1 X152.77 Y155.613 E.02915
G1 X169.486 Y131.741 E1.46762
G3 X169.634 Y132.318 I-4.789 J1.541 E.03004
G1 X153.371 Y155.545 E1.42791
G2 X153.976 Y155.47 I-.324 J-5.137 E.03071
G1 X169.763 Y132.924 E1.3861
G3 X169.878 Y133.549 I-5.211 J1.282 E.03204
G1 X154.609 Y155.355 E1.34058
G2 X155.252 Y155.227 I-.759 J-5.48 E.03302
G1 X169.976 Y134.199 E1.29277
G3 X170.049 Y134.884 I-5.738 J.957 E.03474
G1 X155.919 Y155.065 E1.24065
G2 X156.609 Y154.868 I-1.312 J-5.916 E.03619
G1 X170.108 Y135.59 E1.18516
G1 X170.132 Y136.346 E.03807
G1 X157.319 Y154.645 E1.12499
G1 X158.067 Y154.365 E.04025
G1 X170.126 Y137.143 E1.05875
G3 X170.089 Y137.986 I-7.122 J.107 E.04252
G1 X158.853 Y154.033 E.98653
G2 X159.68 Y153.641 I-2.889 J-7.167 E.04613
G1 X170.009 Y138.89 E.90689
G1 X169.862 Y139.89 E.05091
G1 X160.565 Y153.167 E.81622
G2 X161.534 Y152.573 I-4.523 J-8.463 E.05727
G1 X169.636 Y141.002 E.71133
G1 X169.284 Y142.294 E.06745
G1 X162.632 Y151.794 E.58404
G2 X163.947 Y150.706 I-8.515 J-11.626 E.08602
G1 X168.685 Y143.939 E.41597
G3 X166.93 Y147.235 I-16.991 J-6.932 E.18835
G1 X165.1 Y149.849 E.16067
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P54 R11
G1 F24000
G1 X166.247 Y148.21 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/15
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I-1.179 J.302 P1  F30000
G1 X189.5 Y239 Z2.4
G1 Z2.2
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
; layer #12
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
G3 Z2.6 I.854 J-.867 P1  F30000
G1 X76.09 Y129.251 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X76.452 Y128.493 E.02702
G3 X88.596 Y118.639 I17.256 J8.855 E.51762
G1 X89.713 Y118.368 E.03697
G3 X95.316 Y118.022 I4.027 J19.665 E.18111
G1 X95.431 Y118.029 E.0037
G3 X75.958 Y129.531 I-1.723 J19.319 E3.14227
G1 X76.064 Y129.305 E.00802
G1 X75.736 Y129.083 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.104 Y128.314 E.02537
G3 X88.492 Y118.26 I17.604 J9.031 E.48916
G1 X89.632 Y117.985 E.03494
G3 X95.339 Y117.631 I4.107 J20.053 E.17088
G1 X95.466 Y117.638 E.00378
G3 X75.6 Y129.373 I-1.758 J19.707 E2.96922
G1 X75.711 Y129.137 E.00778
M204 S10000
; WIPE_START
G1 F24000
G1 X76.104 Y128.314 E-.34646
G1 X76.628 Y127.361 E-.41354
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.19 J.253 P1  F30000
G1 X82 Y152.599 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420385
G1 F15000
G1 X80.027 Y150.626 E.08318
M73 P55 R11
G3 X77.897 Y148 I15.523 J-14.771 E.10093
G1 X77.831 Y147.897 E.00366
G1 X83.145 Y153.21 E.22407
G2 X84.505 Y154.045 I7.717 J-11.04 E.04761
G1 X84.524 Y154.055 E.00063
G1 X77.023 Y146.555 E.31626
G3 X76.466 Y145.464 I8.913 J-5.239 E.03655
G1 X85.606 Y154.604 E.3854
G1 X86.558 Y155.022 E.03102
G1 X76.051 Y144.515 E.44306
G3 X75.725 Y143.655 I7.083 J-3.179 E.02745
G1 X87.407 Y155.338 E.49264
G2 X88.195 Y155.591 I2.527 J-6.505 E.02467
G1 X75.458 Y142.855 E.53706
G1 X75.258 Y142.12 E.0227
G1 X88.938 Y155.8 E.57686
G1 X89.636 Y155.965 E.0214
M73 P55 R10
G1 X75.092 Y141.421 E.6133
G1 X74.95 Y140.745 E.0206
G1 X90.305 Y156.1 E.64748
G2 X90.951 Y156.212 I1.273 J-5.392 E.01958
G1 X74.854 Y140.116 E.67877
G3 X74.768 Y139.496 I5.178 J-1.034 E.01867
G1 X91.557 Y156.285 E.70794
G2 X92.154 Y156.347 I.828 J-4.996 E.0179
G1 X74.716 Y138.91 E.7353
G3 X74.674 Y138.333 I4.836 J-.648 E.01725
G1 X92.721 Y156.381 E.76103
G2 X93.28 Y156.406 I.491 J-4.696 E.01669
G1 X74.657 Y137.783 E.78529
G3 X74.648 Y137.24 I4.573 J-.352 E.01621
G1 X93.814 Y156.406 E.8082
G2 X94.344 Y156.402 I.23 J-4.464 E.0158
G1 X74.663 Y136.721 E.82989
G3 X74.679 Y136.204 I4.367 J-.121 E.01545
G1 X94.848 Y156.372 E.85045
G1 X95.352 Y156.342 E.01505
G1 X74.723 Y135.714 E.86985
G1 X74.767 Y135.224 E.01467
G1 X95.831 Y156.288 E.88824
G1 X96.308 Y156.231 E.01432
G1 X74.829 Y134.752 E.90571
G1 X74.899 Y134.288 E.014
G1 X96.772 Y156.161 E.92233
G1 X97.224 Y156.08 E.01371
G1 X74.976 Y133.831 E.93816
G1 X75.069 Y133.39 E.01344
G1 X97.675 Y155.996 E.95324
G1 X98.105 Y155.892 E.01319
G1 X75.162 Y132.949 E.96745
G3 X75.272 Y132.526 I3.62 J.722 E.01305
G1 X98.535 Y155.788 E.98091
G2 X98.953 Y155.673 I-.761 J-3.585 E.01295
G1 X75.387 Y132.107 E.99374
G3 X75.506 Y131.692 I3.554 J.797 E.01287
G1 X99.362 Y155.548 E1.00596
G1 X99.771 Y155.423 E.01275
G1 X75.641 Y131.293 E1.01751
G1 X75.776 Y130.894 E.01256
G1 X100.162 Y155.281 E1.02833
G1 X100.552 Y155.136 E.01238
G1 X75.921 Y130.506 E1.03861
G1 X76.075 Y130.126 E.01222
G1 X100.938 Y154.989 E1.0484
G1 X101.308 Y154.825 E.01207
G1 X76.229 Y129.746 E1.05753
G3 X76.397 Y129.381 I3.163 J1.235 E.012
G1 X101.679 Y154.662 E1.06605
G2 X102.043 Y154.492 I-1.251 J-3.149 E.01198
G1 X76.57 Y129.019 E1.07413
G1 X76.742 Y128.658 E.01194
G1 X102.395 Y154.311 E1.08174
G1 X102.748 Y154.13 E.01182
G1 X76.931 Y128.313 E1.08864
G1 X77.121 Y127.969 E.01172
G1 X103.092 Y153.94 E1.09513
G1 X103.427 Y153.742 E.01162
G1 X77.312 Y127.626 E1.10122
G1 X77.519 Y127.299 E.01154
G1 X103.763 Y153.543 E1.10666
G2 X104.088 Y153.335 I-1.596 J-2.843 E.01153
G1 X77.725 Y126.972 E1.11166
G3 X77.934 Y126.647 I2.838 J1.602 E.01152
G1 X104.407 Y153.12 E1.11628
G1 X104.726 Y152.905 E.01147
G1 X78.158 Y126.336 E1.12033
G1 X78.381 Y126.026 E.01141
G1 X105.034 Y152.679 E1.1239
G1 X105.336 Y152.448 E.01136
G1 X78.607 Y125.718 E1.12711
G1 X78.846 Y125.424 E.01132
G1 X105.639 Y152.217 E1.12979
G2 X105.93 Y151.974 I-1.9 J-2.573 E.01131
G1 X79.085 Y125.129 E1.13198
G3 X79.328 Y124.838 I2.572 J1.901 E.01131
G1 X106.217 Y151.727 E1.13383
G1 X106.503 Y151.48 E.01129
G1 X79.583 Y124.559 E1.13516
G1 X79.838 Y124.28 E.01127
G1 X106.778 Y151.221 E1.136
G1 X107.049 Y150.958 E.01126
G1 X80.097 Y124.006 E1.1365
G1 X80.368 Y123.743 E.01126
G1 X107.32 Y150.695 E1.1365
G2 X107.579 Y150.42 I-2.186 J-2.319 E.01127
G1 X80.639 Y123.48 E1.136
G3 X80.914 Y123.221 I2.319 J2.187 E.01127
G1 X107.834 Y150.141 E1.13516
G1 X108.089 Y149.862 E.01127
G1 X81.201 Y122.974 E1.13383
G1 X81.487 Y122.727 E.01129
G1 X108.332 Y149.571 E1.13198
G1 X108.571 Y149.277 E.01132
G1 X81.778 Y122.484 E1.12979
G1 X82.081 Y122.253 E.01136
G1 X108.81 Y148.982 E1.12711
G2 X109.037 Y148.675 I-2.476 J-2.062 E.01139
G1 X82.384 Y122.022 E1.1239
G3 X82.691 Y121.796 I2.059 J2.479 E.01139
G1 X109.26 Y148.364 E1.12033
G1 X109.483 Y148.053 E.01141
G1 X83.01 Y121.581 E1.11628
G1 X83.329 Y121.366 E.01147
G1 X109.692 Y147.729 E1.11166
G1 X109.899 Y147.401 E.01154
G1 X83.654 Y121.157 E1.10666
G1 X83.99 Y120.959 E.01162
G1 X110.105 Y147.074 E1.10122
G2 X110.297 Y146.732 I-2.79 J-1.782 E.01171
G1 X84.326 Y120.761 E1.09513
G3 X84.669 Y120.57 I1.774 J2.799 E.01172
G1 X110.486 Y146.387 E1.08864
G2 X110.675 Y146.043 I-2.808 J-1.764 E.01173
G1 X85.022 Y120.389 E1.08174
G1 X85.375 Y120.208 E.01182
G1 X110.848 Y145.681 E1.07413
G1 X111.02 Y145.32 E.01194
G1 X85.739 Y120.038 E1.06605
G1 X86.109 Y119.875 E.01207
G1 X111.188 Y144.954 E1.05753
G1 X111.342 Y144.574 E.01222
G1 X86.48 Y119.712 E1.0484
G3 X86.866 Y119.564 I1.438 J3.178 E.01233
G1 X111.496 Y144.195 E1.03861
G2 X111.642 Y143.806 I-3.201 J-1.418 E.01238
G1 X87.255 Y119.419 E1.02833
G3 X87.646 Y119.277 I1.396 J3.226 E.01242
G1 X111.776 Y143.407 E1.01751
G1 X111.911 Y143.008 E.01256
G1 X88.055 Y119.152 E1.00596
G1 X88.464 Y119.027 E.01275
G1 X112.03 Y142.593 E.99374
G1 X112.145 Y142.174 E.01296
G1 X88.883 Y118.912 E.98091
G1 X89.313 Y118.808 E.01319
G1 X112.255 Y141.751 E.96744
G1 X112.346 Y141.308 E.01348
G1 X89.746 Y118.708 E.95299
G1 X90.196 Y118.624 E.01366
G1 X112.437 Y140.865 E.93783
G2 X112.519 Y140.413 I-4.15 J-.983 E.01371
G1 X90.647 Y118.541 E.92228
G3 X91.109 Y118.469 I.783 J3.534 E.01396
G1 X112.588 Y139.948 E.90571
M73 P56 R10
G2 X112.651 Y139.477 I-3.938 J-.763 E.01418
G1 X91.586 Y118.412 E.88824
G3 X92.066 Y118.358 I.696 J4.014 E.0144
G1 X112.694 Y138.987 E.86985
G1 X112.738 Y138.497 E.01467
G1 X92.57 Y118.328 E.85045
G1 X93.074 Y118.298 E.01505
G1 X112.754 Y137.979 E.82989
G1 X112.77 Y137.461 E.01547
G1 X93.603 Y118.294 E.8082
G1 X94.137 Y118.294 E.01592
G1 X112.76 Y136.917 E.78529
G1 X112.744 Y136.367 E.01641
G1 X94.696 Y118.319 E.76103
G1 X95.263 Y118.353 E.01695
G1 X112.701 Y135.791 E.7353
G1 X112.649 Y135.205 E.01754
G1 X95.864 Y118.42 E.70777
G1 X96.466 Y118.488 E.01807
G1 X112.563 Y134.585 E.67875
G2 X112.468 Y133.956 I-5.349 J.488 E.01898
G1 X97.113 Y118.601 E.64748
G3 X97.774 Y118.728 I-.743 J5.634 E.02009
G1 X112.325 Y133.28 E.6136
G2 X112.16 Y132.58 I-5.975 J1.045 E.02144
G1 X98.478 Y118.898 E.57694
G3 X99.223 Y119.109 I-1.407 J6.383 E.0231
G1 X111.959 Y131.846 E.53706
G2 X111.693 Y131.046 I-6.877 J1.845 E.02516
G1 X100.01 Y119.363 E.49264
G1 X100.859 Y119.678 E.02701
G1 X111.366 Y130.185 E.44306
G2 X110.951 Y129.236 I-8.203 J3.024 E.03091
G1 X101.811 Y120.097 E.3854
G1 X102.894 Y120.645 E.03618
G1 X110.394 Y128.145 E.31626
G2 X109.586 Y126.804 I-11.705 J6.134 E.04672
G1 X104.272 Y121.49 E.22407
G3 X106.577 Y123.284 I-11.364 J16.975 E.08714
G3 X109.001 Y125.685 I-79.8 J83.004 E.10175
; WIPE_START
G1 F24000
G1 X107.58 Y124.278 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.103 J1.213 P1  F30000
G1 X138.864 Y121.619 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.775 Y120.921 E.0369
G3 X151.651 Y117.27 I11.338 J15.734 E.4067
G1 X152.684 Y117.329 E.03327
G1 X152.799 Y117.336 E.0037
G3 X138.818 Y121.657 I-1.686 J19.32 E3.43583
G1 X138.604 Y121.325 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.615 Y121.317 E.00041
G3 X151.662 Y116.878 I12.498 J15.339 E.41929
G1 X152.706 Y116.938 E.03116
G1 X152.833 Y116.945 E.00377
G3 X137.728 Y122.084 I-1.72 J19.711 E3.21379
G1 X138.559 Y121.364 E.03274
M204 S10000
; WIPE_START
G1 F24000
G1 X138.615 Y121.317 E-.02804
G1 X139.546 Y120.602 E-.44569
G1 X140.17 Y120.18 E-.28627
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.219 J1.197 P1  F30000
G1 X166.399 Y124.988 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420395
G1 F15000
G2 X163.954 Y122.569 I-73.622 J71.982 E.10254
G2 X161.679 Y120.802 I-13.629 J15.193 E.08598
G1 X166.987 Y126.109 E.22381
G3 X167.797 Y127.454 I-10.924 J7.504 E.04684
G1 X160.299 Y119.955 E.31619
G1 X159.215 Y119.405 E.03625
G1 X168.355 Y128.545 E.38542
G3 X168.77 Y129.494 I-7.785 J3.97 E.0309
G1 X158.265 Y118.989 E.443
G1 X157.416 Y118.674 E.02699
G1 X169.096 Y130.354 E.49252
G3 X169.362 Y131.153 I-6.605 J2.64 E.02514
G1 X156.628 Y118.419 E.53697
G2 X155.882 Y118.207 I-2.161 J6.179 E.02314
G1 X169.564 Y131.89 E.57698
G3 X169.729 Y132.588 I-5.801 J1.735 E.02141
G1 X155.18 Y118.039 E.61352
G2 X154.517 Y117.91 I-1.415 J5.517 E.02013
G1 X169.872 Y133.265 E.64749
G1 X169.967 Y133.894 E.01897
G1 X153.87 Y117.797 E.6788
G1 X153.269 Y117.73 E.01803
G1 X170.052 Y134.513 E.70772
G1 X170.106 Y135.1 E.01758
G1 X152.668 Y117.663 E.73532
G2 X152.101 Y117.629 I-.592 J5.241 E.01695
G1 X170.147 Y135.676 E.76099
G1 X170.165 Y136.227 E.01644
G1 X151.541 Y117.603 E.78534
G1 X151.008 Y117.604 E.01589
G1 X170.173 Y136.769 E.80816
G1 X170.159 Y137.288 E.01549
G1 X150.477 Y117.607 E.82994
G1 X149.974 Y117.638 E.01503
G1 X170.141 Y137.805 E.85041
G1 X170.098 Y138.296 E.0147
G1 X149.471 Y117.669 E.86982
G2 X148.99 Y117.722 I.206 J4.078 E.01443
G1 X170.056 Y138.787 E.88829
G3 X169.992 Y139.257 I-3.992 J-.302 E.01415
G1 X148.514 Y117.779 E.90568
G2 X148.05 Y117.849 I.35 J3.949 E.01402
G1 X169.923 Y139.722 E.92239
G3 X169.845 Y140.178 I-3.878 J-.431 E.01379
G1 X147.598 Y117.931 E.93814
G2 X147.146 Y118.013 I.468 J3.844 E.01369
G1 X169.753 Y140.62 E.95329
G1 X169.661 Y141.061 E.01345
G1 X146.717 Y118.117 E.96751
G1 X146.288 Y118.222 E.01317
G1 X169.549 Y141.483 E.9809
G1 X169.435 Y141.903 E.01297
G1 X145.868 Y118.336 E.99379
G1 X145.46 Y118.462 E.01274
G1 X169.315 Y142.317 E1.00594
G1 X169.181 Y142.716 E.01257
G1 X145.051 Y118.587 E1.0175
G2 X144.659 Y118.729 I.995 J3.376 E.01244
G1 X169.046 Y143.116 E1.02838
G3 X168.9 Y143.504 I-3.338 J-1.039 E.01236
G1 X144.27 Y118.874 E1.0386
G2 X143.883 Y119.021 I1.043 J3.333 E.01235
G1 X168.747 Y143.884 E1.04845
G1 X168.593 Y144.264 E.01223
G1 X143.513 Y119.184 E1.05759
G1 X143.143 Y119.348 E.01207
G1 X168.424 Y144.629 E1.06605
G1 X168.252 Y144.991 E.01195
G1 X142.778 Y119.517 E1.07419
G1 X142.426 Y119.699 E.01182
G1 X168.079 Y145.352 E1.08176
G1 X167.89 Y145.697 E.01172
G1 X142.074 Y119.88 E1.08864
G2 X141.729 Y120.07 I1.421 J2.998 E.01173
G1 X167.701 Y146.041 E1.0952
G3 X167.509 Y146.383 I-2.974 J-1.448 E.01169
G1 X141.394 Y120.268 E1.10122
G1 X141.059 Y120.467 E.01162
G1 X167.303 Y146.711 E1.10666
G1 X167.097 Y147.039 E.01154
G1 X140.733 Y120.675 E1.11172
G1 X140.415 Y120.89 E.01146
G1 X166.886 Y147.362 E1.11628
G1 X166.664 Y147.673 E.01141
G1 X140.096 Y121.106 E1.12033
G2 X139.788 Y121.331 I1.743 J2.713 E.0114
G1 X166.441 Y147.985 E1.12396
G3 X166.214 Y148.291 I-2.694 J-1.763 E.01138
G1 X139.485 Y121.562 E1.12711
G1 X139.183 Y121.794 E.01135
G1 X165.975 Y148.586 E1.12979
G1 X165.737 Y148.881 E.01132
G1 X138.891 Y122.036 E1.13204
G1 X138.605 Y122.283 E.01128
G1 X165.493 Y149.171 E1.13383
G1 X165.238 Y149.451 E.01127
G1 X138.319 Y122.531 E1.13516
G2 X138.043 Y122.789 I2.035 J2.453 E.01127
G1 X164.984 Y149.73 E1.13607
G3 X164.72 Y150 I-2.635 J-2.311 E.01126
G1 X137.772 Y123.052 E1.13634
G1 X137.502 Y123.316 E.01126
G1 X164.451 Y150.265 E1.1364
G1 X164.182 Y150.53 E.01126
G1 X137.242 Y123.59 E1.13603
G1 X136.987 Y123.869 E.01127
G1 X163.907 Y150.789 E1.13516
G1 X163.621 Y151.036 E.01128
G1 X136.733 Y124.148 E1.13383
G2 X136.489 Y124.438 I2.32 J2.2 E.0113
G1 X163.335 Y151.284 E1.13204
G3 X163.042 Y151.526 I-2.183 J-2.34 E.01131
G1 X136.25 Y124.733 E1.12979
G1 X136.012 Y125.029 E.01132
G1 X162.74 Y151.757 E1.12711
G1 X162.438 Y151.989 E.01135
G1 X135.784 Y125.335 E1.12396
G1 X135.562 Y125.646 E.01141
G1 X162.129 Y152.214 E1.12033
G1 X161.811 Y152.429 E.01146
G1 X135.339 Y125.958 E1.11628
G2 X135.129 Y126.281 I2.621 J1.935 E.01151
G1 X161.492 Y152.645 E1.11172
G3 X161.166 Y152.852 I-1.914 J-2.644 E.01154
G1 X134.923 Y126.609 E1.10666
G1 X134.717 Y126.937 E.01154
G1 X160.831 Y153.051 E1.10122
G1 X160.496 Y153.25 E.01162
G1 X134.525 Y127.278 E1.09519
G1 X134.335 Y127.623 E.01172
G1 X160.148 Y153.435 E1.08848
G1 X159.797 Y153.619 E.0118
G1 X134.146 Y127.968 E1.08167
G2 X133.974 Y128.329 I2.954 J1.634 E.01194
G1 X159.447 Y153.802 E1.07417
M73 P57 R10
G3 X159.082 Y153.971 I-1.491 J-2.728 E.01199
G1 X133.802 Y128.691 E1.06605
G2 X133.632 Y129.055 I2.986 J1.609 E.01199
G1 X158.712 Y154.135 E1.05759
G1 X158.342 Y154.299 E.01207
G1 X133.479 Y129.436 E1.04845
G1 X133.326 Y129.816 E.01223
G1 X157.955 Y154.446 E1.0386
G1 X157.567 Y154.591 E.01237
G1 X133.179 Y130.204 E1.02838
G1 X133.045 Y130.603 E.01257
G1 X157.174 Y154.732 E1.0175
G1 X156.766 Y154.858 E.01274
G1 X132.911 Y131.003 E1.00594
G2 X132.791 Y131.416 I3.425 J1.219 E.01285
G1 X156.358 Y154.983 E.99379
G3 X155.938 Y155.098 I-1.171 J-3.479 E.01298
G1 X132.677 Y131.836 E.98089
G2 X132.565 Y132.258 I3.5 J1.153 E.01302
G1 X155.509 Y155.202 E.96751
G1 X155.079 Y155.307 E.01317
G1 X132.473 Y132.7 E.95329
G1 X132.381 Y133.142 E.01345
G1 X154.628 Y155.389 E.93814
G1 X154.176 Y155.471 E.01369
G1 X132.302 Y133.597 E.92239
G1 X132.234 Y134.063 E.01402
G1 X153.711 Y155.54 E.90568
G1 X153.235 Y155.598 E.0143
G1 X132.17 Y134.533 E.88829
G1 X132.127 Y135.024 E.0147
G1 X152.754 Y155.651 E.86982
G1 X152.251 Y155.682 E.01503
G1 X132.084 Y135.515 E.85041
G2 X132.067 Y136.031 I4.342 J.405 E.01542
G1 X151.748 Y155.712 E.82993
G3 X151.218 Y155.716 I-.291 J-4.472 E.01584
G1 X132.053 Y136.551 E.80816
G2 X132.061 Y137.093 I4.573 J.2 E.01618
G1 X150.685 Y155.717 E.78533
G3 X150.125 Y155.69 I-.059 J-4.732 E.01673
G1 X132.079 Y137.644 E.76099
G2 X132.12 Y138.22 I4.87 J-.063 E.01721
G1 X149.558 Y155.658 E.73535
G3 X148.961 Y155.594 I.24 J-5.069 E.01794
G1 X132.174 Y138.807 E.70789
G2 X132.259 Y139.426 I5.256 J-.406 E.01863
G1 X148.356 Y155.523 E.6788
G3 X147.708 Y155.409 I.634 J-5.509 E.01962
G1 X132.354 Y140.055 E.64749
G2 X132.497 Y140.731 I5.776 J-.867 E.02064
G1 X147.046 Y155.281 E.61352
G1 X146.344 Y155.112 E.02153
G1 X132.661 Y141.43 E.57698
G1 X132.864 Y142.166 E.02278
G1 X145.598 Y154.9 E.53697
G3 X144.81 Y154.646 I1.749 J-6.769 E.02471
G1 X133.13 Y142.966 E.49252
G2 X133.456 Y143.826 I7.406 J-2.315 E.02743
G1 X143.961 Y154.331 E.443
G1 X143.011 Y153.915 E.03094
G1 X133.871 Y144.775 E.38542
G2 X134.428 Y145.866 I9.472 J-4.152 E.03657
G1 X141.927 Y153.364 E.31619
G3 X140.546 Y152.518 I6.444 J-12.056 E.04831
G1 X135.239 Y147.211 E.22379
G1 X135.321 Y147.34 E.00455
G2 X137.457 Y149.962 I17.63 J-12.177 E.10095
G1 X139.402 Y151.907 E.08202
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X137.987 Y150.493 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/15
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I-1.052 J.612 P1  F30000
G1 X189.5 Y239 Z2.6
G1 Z2.4
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
; layer #13
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
G3 Z2.8 I.853 J-.868 P1  F30000
G1 X85.913 Y139.218 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X89.149 Y139.215 E.10405
G1 X89.15 Y141.283 E.06649
G1 X86.64 Y141.283 E.08069
G1 X86.951 Y140.421 E.02948
G1 X85.917 Y139.705 E.04043
G1 X85.884 Y139.535 E.00557
G1 X85.908 Y139.278 E.00832
; WIPE_START
G1 F24000
G1 X87.907 Y139.239 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.075 J-.57 P1  F30000
G1 X84.298 Y132.424 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X87.544 Y132.424 E.1044
G1 X87.546 Y134.349 E.0619
G1 X87.541 Y134.494 E.00468
G2 X85.035 Y134.492 I-1.355 J102.428 E.08057
G1 X85.345 Y133.629 E.02949
G1 X84.312 Y132.914 E.04042
G1 X84.299 Y132.851 E.00205
G3 X84.293 Y132.484 I2.282 J-.224 E.01182
; WIPE_START
G1 F24000
G1 X86.293 Y132.447 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.375 J-1.158 P1  F30000
G1 X75.758 Y129.036 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.101 Y128.313 E.02383
G3 X91.951 Y117.638 I17.603 J9.033 E.59405
G3 X95.433 Y117.637 I1.753 J22.084 E.10382
G3 X75.596 Y129.372 I-1.73 J19.71 E2.97007
G1 X75.732 Y129.09 E.00932
M204 S10000
G1 X76.042 Y129.237 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.33556
G1 F15000
G1 X76.409 Y128.466 E.01975
G3 X83.331 Y153.797 I17.299 J8.884 E2.15823
G1 X82.371 Y153.151 E.02674
G1 X81.455 Y152.452 E.02664
G1 X80.582 Y151.699 E.02664
G1 X79.755 Y150.896 E.02664
G1 X78.977 Y150.046 E.02664
G1 X78.251 Y149.151 E.02664
G1 X77.579 Y148.214 E.02664
G1 X76.962 Y147.236 E.02674
G1 X76.407 Y146.23 E.02654
M73 P58 R10
G1 X75.91 Y145.186 E.02675
G1 X75.478 Y144.122 E.02654
G1 X75.111 Y143.034 E.02654
G1 X74.806 Y141.922 E.02664
G1 X74.568 Y140.79 E.02674
G1 X74.398 Y139.65 E.02665
G1 X74.295 Y138.502 E.02664
G1 X74.261 Y137.35 E.02664
G3 X75.911 Y129.51 I19.447 J0 E.18653
G1 X76.016 Y129.291 E.00561
; WIPE_START
G1 F24000
G1 X76.409 Y128.466 E-.34743
G1 X76.933 Y127.515 E-.41257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.965 J.741 P1  F30000
G1 X86.097 Y139.442 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.252182
G1 F15000
G1 X86.542 Y139.81 E.00954
; WIPE_START
G1 F24000
G1 X86.097 Y139.442 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.375 J1.158 P1  F30000
G1 X88.927 Y140.359 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
G1 X88.225 Y141.061 E.02958
G1 X87.691 Y141.061
G1 X88.927 Y139.825 E.05204
G1 X88.781 Y139.438
G1 X87.158 Y141.061 E.06836
G1 X87.143 Y140.542
G1 X88.247 Y139.439 E.0465
G1 X87.713 Y139.439
G1 X86.981 Y140.171 E.03085
M204 S10000
G1 X86.673 Y139.421 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.341564
G1 F15000
G1 X87.052 Y139.592 E.00981
; LINE_WIDTH: 0.38499
G1 X87.031 Y139.645 E.00154
; LINE_WIDTH: 0.339865
G1 X87.01 Y139.698 E.00134
; LINE_WIDTH: 0.29474
G1 X86.988 Y139.751 E.00114
; LINE_WIDTH: 0.249617
G1 X86.799 Y139.959 E.00459
; LINE_WIDTH: 0.222872
G1 X86.801 Y139.976 E.00024
; LINE_WIDTH: 0.197053
G1 X86.802 Y139.993 E.0002
; LINE_WIDTH: 0.171235
G1 X86.816 Y140.025 E.00035
; LINE_WIDTH: 0.108951
G2 X86.88 Y140.099 I.103 J-.024 E.00053
; WIPE_START
G1 F24000
G1 X86.816 Y140.025 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.215 J-.07 P1  F30000
G1 X86.482 Y134.271 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
G1 X87.323 Y133.43 E.0354
G1 X87.322 Y132.897
G1 X85.95 Y134.27 E.05782
G1 X85.417 Y134.27
G1 X87.04 Y132.646 E.06839
G1 X86.507 Y132.646
G1 X85.611 Y133.542 E.03774
G1 X85.296 Y133.324
G1 X85.974 Y132.646 E.02855
G1 X85.44 Y132.646
G1 X84.981 Y133.106 E.01936
M204 S10000
G1 X84.678 Y132.628 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171308
G1 F15000
G1 X84.753 Y132.809 E.002
; LINE_WIDTH: 0.124195
G1 X84.829 Y132.991 E.00126
G1 X84.879 Y133.034 E.00043
; WIPE_START
G1 F24000
G1 X84.829 Y132.991 E-.19129
G1 X84.753 Y132.809 E-.56871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.606 J1.055 P1  F30000
G1 X110.148 Y147.401 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
G1 X103.759 Y153.79 E.26914
M204 S10000
G1 X102.545 Y154.471 F30000
M204 S2000
G1 F6000
G1 X110.847 Y146.168 E.34974
G1 X111.335 Y145.147
G1 X101.521 Y154.962 E.41343
G1 X100.61 Y155.339
G1 X111.702 Y144.247 E.46725
G1 X111.993 Y143.422
G1 X99.773 Y155.643 E.51478
G1 X99.005 Y155.877
G1 X112.233 Y142.649 E.55723
G1 X112.434 Y141.915
G1 X98.284 Y156.065 E.59606
G1 X97.588 Y156.228
G1 X112.579 Y141.237 E.63149
G1 X112.707 Y140.576
G1 X96.938 Y156.345 E.66426
G1 X96.306 Y156.443
G1 X112.8 Y139.949 E.69482
G1 X112.874 Y139.342
G1 X95.701 Y156.515 E.7234
G1 X95.116 Y156.567
G1 X112.926 Y138.757 E.75023
G1 X112.958 Y138.191
G1 X94.549 Y156.6 E.77548
G1 X94 Y156.616
G1 X112.975 Y137.642 E.79931
G1 X112.976 Y137.107
G1 X93.467 Y156.616 E.82183
G1 X92.945 Y156.605
G1 X112.961 Y136.589 E.84317
G1 X112.938 Y136.078
G1 X92.441 Y156.575 E.86341
G1 X91.941 Y156.542
G1 X112.894 Y135.589 E.88264
G1 X112.851 Y135.099
G1 X91.465 Y156.485 E.90088
G1 X90.988 Y156.428
G1 X112.783 Y134.634 E.91809
G1 X112.714 Y134.17
G1 X90.53 Y156.354 E.93449
G1 X90.078 Y156.272
G1 X112.632 Y133.718 E.95011
G1 X112.54 Y133.277
G1 X89.631 Y156.186 E.96501
G1 X89.202 Y156.082
G1 X112.447 Y132.837 E.9792
G1 X112.333 Y132.417
G1 X88.772 Y155.978 E.9925
G1 X88.357 Y155.86
G1 X112.219 Y131.998 E1.00518
G1 X112.097 Y131.586
G1 X87.948 Y155.736 E1.01728
G1 X87.54 Y155.611
G1 X111.963 Y131.188 E1.02881
G1 X111.828 Y130.789
G1 X87.151 Y155.467 E1.03952
G1 X86.762 Y155.322
G1 X111.681 Y130.403 E1.04973
G1 X111.527 Y130.023
G1 X86.377 Y155.173 E1.05944
G1 X86.007 Y155.01
G1 X111.374 Y129.644 E1.06855
G1 X111.205 Y129.28
G1 X85.637 Y154.847 E1.07703
G1 X85.274 Y154.677
G1 X111.032 Y128.918 E1.08506
G1 X110.86 Y128.557
G1 X84.922 Y154.496 E1.09266
G1 X84.569 Y154.315
G1 X110.671 Y128.213 E1.09954
G1 X110.482 Y127.869
G1 X84.226 Y154.125 E1.10602
G1 X83.891 Y153.927
G1 X110.291 Y127.527 E1.11211
G1 X110.085 Y127.2
G1 X83.555 Y153.729 E1.11754
G1 X83.23 Y153.521
G1 X109.878 Y126.873 E1.12255
G1 X109.67 Y126.548
G1 X82.911 Y153.307 E1.1272
G1 X82.593 Y153.092
G1 X109.447 Y126.237 E1.13124
G1 X109.225 Y125.927
G1 X82.284 Y152.867 E1.13486
G1 X81.982 Y152.636
G1 X109 Y125.618 E1.13813
G1 X108.761 Y125.324
G1 X81.679 Y152.405 E1.1408
G1 X81.387 Y152.165
G1 X108.522 Y125.029 E1.14306
G1 X108.281 Y124.737
G1 X81.1 Y151.918 E1.14499
G1 X80.814 Y151.671
G1 X108.027 Y124.458 E1.14633
G1 X107.772 Y124.18
G1 X80.537 Y151.415 E1.14726
G1 X80.266 Y151.152
G1 X107.516 Y123.903 E1.14787
G1 X107.245 Y123.64
G1 X79.996 Y150.889 E1.14787
G1 X79.734 Y150.618
G1 X88.846 Y141.505 E.38385
G1 X88.313 Y141.506
G1 X79.479 Y150.339 E.37211
G1 X79.225 Y150.061
G1 X87.78 Y141.506 E.36038
G1 X87.246 Y141.506
G1 X78.978 Y149.774 E.34828
G1 X78.74 Y149.479
G1 X86.713 Y141.506 E.33588
G1 X86.405 Y141.281
G1 X78.501 Y149.185 E.33296
G1 X78.27 Y148.882
G1 X86.661 Y140.491 E.35346
G1 X86.346 Y140.273
G1 X78.048 Y148.571 E.34957
M73 P59 R10
G1 X77.825 Y148.261
G1 X86.031 Y140.055 E.34567
G1 X85.733 Y139.82
G1 X77.611 Y147.942 E.34213
G1 X77.404 Y147.615
G1 X85.678 Y139.341 E.34854
M204 S10000
; WIPE_START
G1 F24000
G1 X84.264 Y140.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.054 J1.216 P1  F30000
G1 X89.372 Y140.98 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X106.975 Y123.377 E.74151
G1 X106.703 Y123.115
G1 X89.372 Y140.447 E.73008
G1 X89.371 Y139.914
G1 X106.417 Y122.869 E.71803
G1 X106.13 Y122.622
G1 X89.371 Y139.381 E.70597
G1 X89.226 Y138.993
M73 P59 R9
G1 X105.843 Y122.375 E.70001
G1 X105.541 Y122.145
G1 X88.693 Y138.993 E.70973
G1 X88.159 Y138.993
G1 X105.239 Y121.914 E.71946
G1 X104.936 Y121.683
G1 X87.626 Y138.993 E.72916
G1 X87.093 Y138.993
G1 X104.617 Y121.469 E.7382
G1 X104.298 Y121.254
G1 X86.559 Y138.993 E.74725
G1 X86.026 Y138.993
G1 X103.979 Y121.04 E.75627
G1 X103.644 Y120.842
G1 X77.198 Y147.288 E1.114
G1 X77.002 Y146.951
G1 X103.308 Y120.644 E1.10816
G1 X102.971 Y120.448
G1 X76.812 Y146.607 E1.10193
G1 X76.623 Y146.264
G1 X102.618 Y120.268 E1.09507
G1 X102.266 Y120.087
G1 X76.445 Y145.908 E1.08771
G1 X76.273 Y145.547
G1 X87.106 Y134.714 E.45633
G1 X86.572 Y134.714
G1 X76.101 Y145.186 E.44111
G1 X75.944 Y144.809
G1 X86.039 Y134.714 E.42527
G1 X85.506 Y134.714
G1 X75.79 Y144.43 E.40929
G1 X75.636 Y144.05
G1 X84.972 Y134.714 E.39328
G1 X84.876 Y134.277
G1 X75.502 Y143.652 E.39488
G1 X75.367 Y143.253
G1 X84.976 Y133.644 E.40479
G1 X84.661 Y133.426
G1 X75.239 Y142.848 E.39692
G1 X75.124 Y142.429
G1 X84.346 Y133.208 E.38846
G1 X84.089 Y132.932
G1 X75.01 Y142.01 E.38245
G1 X74.91 Y141.577
G1 X84.092 Y132.395 E.38678
M204 S10000
; WIPE_START
G1 F24000
G1 X82.678 Y133.809 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.058 J1.216 P1  F30000
G1 X87.768 Y134.052 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X101.909 Y119.91 E.5957
G1 X101.539 Y119.747
G1 X87.768 Y133.519 E.58012
G1 X87.767 Y132.986
G1 X101.169 Y119.584 E.56455
G1 X100.791 Y119.429
G1 X87.767 Y132.453 E.54865
G1 X87.485 Y132.201
G1 X100.402 Y119.284 E.54412
G1 X100.013 Y119.14
G1 X86.952 Y132.201 E.55021
G1 X86.419 Y132.201
G1 X99.612 Y119.008 E.55575
G1 X99.203 Y118.884
G1 X85.885 Y132.201 E.56101
G1 X85.352 Y132.201
G1 X98.795 Y118.759 E.56627
G1 X98.365 Y118.655
M73 P60 R9
G1 X84.819 Y132.202 E.57065
G1 X84.275 Y132.211
G1 X97.936 Y118.551 E.57544
G1 X97.497 Y118.456
G1 X74.817 Y141.136 E.95539
G1 X74.728 Y140.692
G1 X97.045 Y118.375 E.94011
G1 X96.593 Y118.294
G1 X74.659 Y140.228 E.92398
G1 X74.589 Y139.764
G1 X96.119 Y118.235 E.90692
G1 X95.642 Y118.178
G1 X74.538 Y139.282 E.889
G1 X74.495 Y138.793
G1 X95.151 Y118.136 E.87016
G1 X94.648 Y118.106
G1 X74.462 Y138.292 E.85033
G1 X74.447 Y137.774
G1 X94.137 Y118.084 E.82943
G1 X93.603 Y118.084
G1 X74.437 Y137.25 E.80738
G1 X74.453 Y136.701
G1 X93.066 Y118.088 E.78405
G1 X92.499 Y118.122
G1 X74.473 Y136.148 E.75932
G1 X74.526 Y135.562
G1 X91.928 Y118.16 E.73306
G1 X91.322 Y118.232
G1 X74.584 Y134.97 E.70508
G1 X74.678 Y134.343
G1 X90.706 Y118.315 E.67518
G1 X90.056 Y118.432
G1 X74.789 Y133.699 E.64312
G1 X74.931 Y133.023
G1 X89.379 Y118.576 E.6086
G1 X88.675 Y118.746
G1 X75.114 Y132.307 E.57126
G1 X75.329 Y131.559
G1 X87.912 Y118.976 E.53005
G1 X87.103 Y119.251
G1 X75.602 Y130.753 E.48451
G1 X75.952 Y129.869
G1 X86.229 Y119.592 E.4329
G1 X85.254 Y120.034
G1 X76.398 Y128.89 E.37305
M204 S10000
G1 X76.997 Y127.758 F30000
M204 S2000
G1 F6000
G1 X84.113 Y120.642 E.29976
M204 S10000
G1 X82.655 Y121.566 F30000
M204 S2000
G1 F6000
G1 X77.933 Y126.289 E.19892
M204 S10000
; WIPE_START
G1 F24000
G1 X79.347 Y124.874 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.744 J.963 P1  F30000
G1 X109.606 Y148.238 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881708
G1 F15000
G1 X109.446 Y148.428 E.00089
; LINE_WIDTH: 0.127688
G1 X109.285 Y148.617 E.00166
; LINE_WIDTH: 0.167204
G1 X109.124 Y148.806 E.00244
; LINE_WIDTH: 0.206721
G1 X108.963 Y148.996 E.00321
; LINE_WIDTH: 0.246238
G1 X108.71 Y149.277 E.00609
; LINE_WIDTH: 0.285542
G1 X108.456 Y149.559 E.00727
; LINE_WIDTH: 0.324847
G1 X108.202 Y149.841 E.00844
; LINE_WIDTH: 0.364152
G1 X107.81 Y150.25 E.01438
; LINE_WIDTH: 0.406138
G3 X106.612 Y151.455 I-20.914 J-19.612 E.04876
; LINE_WIDTH: 0.397758
G1 X106.196 Y151.841 E.01591
; LINE_WIDTH: 0.355716
G1 X105.78 Y152.227 E.01402
; LINE_WIDTH: 0.313675
G1 X105.565 Y152.415 E.0061
; LINE_WIDTH: 0.275687
G1 X105.351 Y152.602 E.00524
; LINE_WIDTH: 0.237698
G1 X105.136 Y152.79 E.00439
; LINE_WIDTH: 0.19971
G1 X104.922 Y152.978 E.00353
; LINE_WIDTH: 0.16172
G1 X104.765 Y153.106 E.0019
; LINE_WIDTH: 0.124945
G1 X104.609 Y153.235 E.00131
G1 X110.484 Y146.825 F30000
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X110.372 Y146.975 E.00067
; LINE_WIDTH: 0.137615
G1 X110.259 Y147.125 E.0014
; LINE_WIDTH: 0.187061
G1 X110.087 Y147.34 E.00314
; WIPE_START
G1 F24000
G1 X110.259 Y147.125 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.926 J-.79 P1  F30000
G1 X86.638 Y119.417 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.160178
G1 F15000
G1 X86.464 Y119.536 E.00195
; LINE_WIDTH: 0.186368
G1 X86.291 Y119.655 E.00238
G1 X84.65 Y120.344 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X84.537 Y120.427 E.0005
; LINE_WIDTH: 0.128064
G1 X84.424 Y120.509 E.00094
; LINE_WIDTH: 0.167958
G1 X84.299 Y120.606 E.00157
; LINE_WIDTH: 0.196268
G1 X84.174 Y120.703 E.00192
G1 X83.378 Y121.082 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X83.157 Y121.263 E.00102
; LINE_WIDTH: 0.135641
G1 X82.936 Y121.445 E.00209
; LINE_WIDTH: 0.183113
G1 X82.716 Y121.627 E.00316
G1 X81.371 Y122.553 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X81.047 Y122.854 E.00158
; LINE_WIDTH: 0.143111
G2 X79.911 Y123.955 I18.003 J19.714 E.01252
; LINE_WIDTH: 0.168936
G1 X79.516 Y124.367 E.00568
; LINE_WIDTH: 0.143579
G1 X79.122 Y124.78 E.00454
; LINE_WIDTH: 0.118222
G1 X78.913 Y125.012 E.00186
G1 X77.994 Y126.349 F30000
; LINE_WIDTH: 0.233595
G1 F15000
G1 X77.769 Y126.614 E.00523
; LINE_WIDTH: 0.192596
G1 X77.666 Y126.742 E.00194
; LINE_WIDTH: 0.157788
G1 X77.563 Y126.871 E.00149
; LINE_WIDTH: 0.122979
G1 X77.461 Y126.999 E.00104
G1 X77.058 Y127.819 F30000
; LINE_WIDTH: 0.221577
G1 F15000
G1 X76.94 Y127.976 E.00277
; LINE_WIDTH: 0.177108
G1 X76.822 Y128.133 E.00208
; LINE_WIDTH: 0.132639
G1 X76.705 Y128.29 E.00139
G1 X76.46 Y128.951 F30000
; LINE_WIDTH: 0.215569
G1 F15000
G1 X76.367 Y129.084 E.00221
; LINE_WIDTH: 0.173102
G1 X76.273 Y129.216 E.00167
; LINE_WIDTH: 0.130636
G1 X76.18 Y129.348 E.00112
; WIPE_START
G1 F24000
G1 X76.273 Y129.216 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.843 J.877 P1  F30000
G1 X102.483 Y154.409 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.218574
G1 F15000
G1 X102.34 Y154.514 E.00246
; LINE_WIDTH: 0.175106
G1 X102.197 Y154.618 E.00185
; LINE_WIDTH: 0.131638
G1 X102.053 Y154.723 E.00124
G1 X103.698 Y153.729 F30000
; LINE_WIDTH: 0.224579
G1 F15000
G1 X103.525 Y153.863 E.00314
; LINE_WIDTH: 0.179109
G1 X103.351 Y153.997 E.00236
; LINE_WIDTH: 0.133639
G1 X103.178 Y154.132 E.00157
; WIPE_START
G1 F24000
G1 X103.351 Y153.997 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.829 J-.891 P1  F30000
G1 X89.443 Y141.051 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0997727
G1 F15000
G1 X89.352 Y141.266 E.00105
; WIPE_START
G1 F24000
G1 X89.443 Y141.051 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.627 J-1.043 P1  F30000
G1 X86.031 Y138.998 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.146108
G1 F15000
G1 X85.892 Y138.952 E.00119
G1 X85.761 Y139.049 E.00133
G1 X85.65 Y139.194 E.00149
; LINE_WIDTH: 0.177653
G1 X85.61 Y139.273 E.00094
; WIPE_START
G1 F24000
G1 X85.65 Y139.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.181 J-.294 P1  F30000
G1 X84.087 Y132.907 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.106378
G1 F15000
G3 X84.01 Y132.743 I2.484 J-1.258 E.00091
G1 X84.268 Y132.879 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X87.505 Y132.879 E.01151
G1 X87.505 Y132.729 E.00053
G1 X84.335 Y132.729 E.01127
G1 X84.336 Y132.579 E.00053
G1 X87.505 Y132.579 E.01127
G1 X87.505 Y132.429 E.00053
G1 X84.269 Y132.429 E.0115
; WIPE_START
G1 F24000
G1 X86.269 Y132.429 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.215 J-.065 P1  F30000
G1 X85.875 Y139.779 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X89.11 Y139.779 E.0115
G1 X89.11 Y139.629 E.00053
G1 X85.94 Y139.629 E.01127
G1 X85.941 Y139.479 E.00053
G1 X89.11 Y139.479 E.01127
G1 X89.11 Y139.329 E.00053
G1 X85.941 Y139.329 E.01127
G1 X85.942 Y139.179 E.00053
G1 X89.178 Y139.179 E.0115
; WIPE_START
G1 F24000
G1 X87.178 Y139.179 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.731 J.973 P1  F30000
G1 X93.367 Y134.529 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X90.842 Y134.529 E.00897
G1 X90.842 Y134.379 E.00053
G1 X93.301 Y134.379 E.00874
G1 X93.301 Y134.229 E.00053
G1 X90.842 Y134.229 E.00874
G1 X90.842 Y134.079 E.00053
G1 X93.301 Y134.079 E.00874
G1 X93.301 Y133.929 E.00053
G1 X90.842 Y133.929 E.00874
G1 X90.842 Y133.779 E.00053
G1 X93.301 Y133.779 E.00874
G1 X93.301 Y133.629 E.00053
G1 X90.842 Y133.629 E.00874
G1 X90.842 Y133.479 E.00053
G1 X93.301 Y133.479 E.00874
G1 X93.301 Y133.329 E.00053
M73 P61 R9
G1 X90.842 Y133.329 E.00874
G1 X90.842 Y133.179 E.00053
G1 X93.301 Y133.179 E.00874
G1 X93.302 Y133.029 E.00053
G1 X90.842 Y133.029 E.00874
G1 X90.842 Y132.879 E.00053
G1 X93.302 Y132.879 E.00874
G1 X93.302 Y132.729 E.00053
G1 X90.842 Y132.729 E.00874
G1 X90.842 Y132.579 E.00053
G1 X93.302 Y132.579 E.00874
G1 X93.302 Y132.429 E.00053
G1 X90.775 Y132.429 E.00898
; WIPE_START
G1 F24000
G1 X92.775 Y132.429 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.742 J-.965 P1  F30000
G1 X82.439 Y140.379 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X79.645 Y140.379 E.00993
G1 X79.645 Y140.229 E.00053
G1 X82.537 Y140.229 E.01028
G2 X82.654 Y140.079 I-.403 J-.434 E.00068
G1 X79.645 Y140.079 E.0107
G1 X79.645 Y139.929 E.00053
G1 X82.719 Y139.929 E.01093
G2 X82.74 Y139.779 I-.546 J-.153 E.00054
G1 X79.645 Y139.779 E.011
G1 X79.645 Y139.629 E.00053
G1 X82.729 Y139.629 E.01096
G1 X82.71 Y139.558 E.00026
G2 X82.68 Y139.479 I-.28 J.061 E.0003
G1 X79.645 Y139.479 E.01079
G1 X79.645 Y139.329 E.00053
G1 X82.583 Y139.329 E.01044
G2 X82.376 Y139.179 I-.421 J.363 E.00092
G1 X79.577 Y139.179 E.00995
; WIPE_START
G1 F24000
G1 X81.577 Y139.179 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.041 J-.631 P1  F30000
G1 X79.577 Y142.479 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X82.323 Y142.479 E.00976
G2 X82.439 Y142.329 I-.508 J-.514 E.00068
G1 X79.645 Y142.329 E.00993
G1 X79.645 Y142.179 E.00053
G1 X82.497 Y142.179 E.01014
G2 X82.511 Y142.029 I-.476 J-.121 E.00054
G1 X79.645 Y142.029 E.01019
G1 X79.645 Y141.879 E.00053
G1 X82.491 Y141.879 E.01012
G1 X82.483 Y141.849 E.00011
G2 X82.43 Y141.729 I-.381 J.097 E.00047
G1 X79.645 Y141.729 E.0099
G1 X79.645 Y141.579 E.00053
G1 X82.399 Y141.579 E.00979
; WIPE_START
G1 F24000
G1 X80.399 Y141.579 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.94 J.773 P1  F30000
G1 X91.995 Y155.679 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X95.422 Y155.679 E.01218
; WIPE_START
G1 F24000
G1 X93.422 Y155.679 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.057 J1.216 P1  F30000
G1 X96.596 Y155.529 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X90.821 Y155.529 E.02053
G1 X89.987 Y155.379 F30000
G1 F3600
G1 X97.43 Y155.379 E.02646
G1 X98.069 Y155.229 F30000
G1 F3600
G1 X89.348 Y155.229 E.031
G1 X88.754 Y155.079 F30000
G1 F3600
G1 X98.663 Y155.079 E.03522
G1 X99.154 Y154.929 F30000
G1 F3600
G1 X88.263 Y154.929 E.03872
G1 X87.779 Y154.779 F30000
G1 F3600
G1 X99.638 Y154.779 E.04216
G1 X100.042 Y154.629 F30000
G1 F3600
G1 X87.569 Y154.629 E.04434
G1 X87.165 Y154.479 E.00153
G1 X100.252 Y154.479 E.04652
G2 X100.648 Y154.329 I-1.066 J-3.407 E.0015
G1 X86.77 Y154.329 E.04933
G1 X86.429 Y154.179 E.00132
G1 X100.988 Y154.179 E.05175
G1 X101.329 Y154.029 E.00132
G1 X86.089 Y154.029 E.05417
G3 X85.758 Y153.879 I1.098 J-2.858 E.00129
G1 X101.659 Y153.879 E.05652
G1 X101.951 Y153.729 E.00117
G1 X85.466 Y153.729 E.0586
G1 X85.174 Y153.579 E.00117
G1 X102.244 Y153.579 E.06068
G1 X102.536 Y153.429 E.00117
G1 X84.881 Y153.429 E.06276
G3 X84.624 Y153.279 I1.135 J-2.247 E.00106
G1 X102.794 Y153.279 E.06459
G1 X103.048 Y153.129 E.00105
G1 X84.37 Y153.129 E.06639
G1 X84.116 Y152.979 E.00105
G1 X103.302 Y152.979 E.0682
G2 X103.549 Y152.829 I-1.141 J-2.159 E.00103
G1 X83.868 Y152.829 E.06996
G1 X83.646 Y152.679 E.00095
G1 X103.772 Y152.679 E.07154
G1 X103.994 Y152.529 E.00095
G1 X83.423 Y152.529 E.07312
G1 X83.2 Y152.379 E.00095
G1 X104.217 Y152.379 E.07471
G2 X104.435 Y152.229 I-1.155 J-1.915 E.00094
G1 X82.982 Y152.229 E.07626
G1 X82.786 Y152.079 E.00088
G1 X104.632 Y152.079 E.07766
G1 X104.828 Y151.929 E.00088
G1 X82.589 Y151.929 E.07905
G1 X82.393 Y151.779 E.00088
G1 X105.025 Y151.779 E.08045
G1 X105.221 Y151.629 E.00088
G1 X82.196 Y151.629 E.08185
G3 X82.017 Y151.479 I1.174 J-1.586 E.00083
G1 X105.401 Y151.479 E.08312
G1 X105.575 Y151.329 E.00082
G1 X81.843 Y151.329 E.08436
G1 X81.669 Y151.179 E.00082
G1 X105.749 Y151.179 E.0856
G1 X105.923 Y151.029 E.00082
G1 X81.495 Y151.029 E.08683
G3 X81.321 Y150.879 I1.176 J-1.535 E.00082
G1 X106.096 Y150.879 E.08807
G1 X106.251 Y150.729 E.00077
G1 X81.167 Y150.729 E.08916
G1 X81.012 Y150.579 E.00077
G1 X106.405 Y150.579 E.09026
G1 X106.56 Y150.429 E.00077
G1 X80.858 Y150.429 E.09136
G1 X80.703 Y150.279 E.00077
G1 X106.714 Y150.279 E.09246
G1 X106.869 Y150.129 E.00077
G1 X80.549 Y150.129 E.09356
G1 X80.411 Y149.979 E.00072
G1 X107.006 Y149.979 E.09454
G1 X107.143 Y149.829 E.00072
G1 X80.274 Y149.829 E.09551
G1 X80.137 Y149.679 E.00072
G1 X107.28 Y149.679 E.09649
G1 X107.418 Y149.529 E.00072
G1 X80 Y149.529 E.09746
G1 X79.862 Y149.379 E.00072
G1 X107.555 Y149.379 E.09844
G2 X107.682 Y149.229 I-1.2 J-1.148 E.0007
G1 X79.735 Y149.229 E.09934
G1 X79.613 Y149.079 E.00069
G1 X107.804 Y149.079 E.10021
G1 X107.926 Y148.929 E.00069
G1 X79.492 Y148.929 E.10107
G1 X79.37 Y148.779 E.00069
G1 X108.047 Y148.779 E.10194
G1 X108.169 Y148.629 E.00069
G1 X79.248 Y148.629 E.1028
G1 X79.127 Y148.479 E.00069
G1 X108.291 Y148.479 E.10367
G1 X108.398 Y148.329 E.00066
G1 X79.019 Y148.329 E.10443
G1 X78.911 Y148.179 E.00066
G1 X108.506 Y148.179 E.1052
G1 X108.613 Y148.029 E.00066
G1 X78.804 Y148.029 E.10596
G1 X78.696 Y147.879 E.00066
G1 X108.721 Y147.879 E.10673
G1 X108.829 Y147.729 E.00066
G1 X78.589 Y147.729 E.10749
G3 X78.483 Y147.579 I1.211 J-.969 E.00065
G1 X108.935 Y147.579 E.10825
G1 X109.029 Y147.429 E.00063
G1 X78.388 Y147.429 E.10892
G1 X78.293 Y147.279 E.00063
G1 X109.124 Y147.279 E.10959
G1 X109.219 Y147.129 E.00063
G1 X78.198 Y147.129 E.11027
G1 X78.104 Y146.979 E.00063
G1 X109.314 Y146.979 E.11094
G1 X109.408 Y146.829 E.00063
G1 X78.009 Y146.829 E.11161
G1 X77.914 Y146.679 E.00063
G1 X109.503 Y146.679 E.11229
G1 X109.586 Y146.529 E.00061
G1 X77.832 Y146.529 E.11288
M73 P62 R9
G1 X77.749 Y146.379 E.00061
G1 X109.668 Y146.379 E.11346
G1 X109.751 Y146.229 E.00061
G1 X77.666 Y146.229 E.11405
G1 X77.584 Y146.079 E.00061
G1 X109.834 Y146.079 E.11464
G1 X109.917 Y145.929 E.00061
G1 X77.501 Y145.929 E.11523
G1 X77.418 Y145.779 E.00061
G1 X109.999 Y145.779 E.11582
G2 X110.075 Y145.629 I-1.226 J-.71 E.0006
G1 X77.343 Y145.629 E.11635
G1 X77.271 Y145.479 E.00059
G1 X110.146 Y145.479 E.11686
G1 X110.218 Y145.329 E.00059
G1 X77.2 Y145.329 E.11737
G1 X77.128 Y145.179 E.00059
G1 X110.289 Y145.179 E.11788
G1 X110.36 Y145.029 E.00059
G1 X77.057 Y145.029 E.11838
G1 X76.985 Y144.879 E.00059
G1 X110.432 Y144.879 E.11889
G2 X110.502 Y144.729 I-1.228 J-.668 E.00059
G1 X79.645 Y144.729 E.10969
G1 X79.645 Y144.579 E.00053
G1 X110.563 Y144.579 E.1099
G1 X110.624 Y144.429 E.00058
G1 X79.645 Y144.429 E.11012
G1 X79.645 Y144.279 E.00053
G1 X110.685 Y144.279 E.11034
G1 X110.746 Y144.129 E.00058
G1 X79.645 Y144.129 E.11055
G1 X79.645 Y143.979 E.00053
G1 X110.806 Y143.979 E.11077
G1 X110.867 Y143.829 E.00058
G1 X79.577 Y143.829 E.11123
G1 X79.577 Y143.679 F30000
G1 F3600
G1 X110.924 Y143.679 E.11143
G1 X110.975 Y143.529 E.00056
G1 X82.716 Y143.529 E.10045
G2 X82.994 Y143.379 I-.743 J-1.709 E.00112
G1 X98.82 Y143.379 E.05626
G1 X98.82 Y143.229 E.00053
G1 X83.199 Y143.229 E.05553
G2 X83.358 Y143.079 I-2.987 J-3.341 E.00078
G1 X98.82 Y143.079 E.05496
G1 X98.82 Y142.929 E.00053
G1 X83.489 Y142.924 E.0545
G2 X83.585 Y142.779 I-.67 J-.548 E.00062
G1 X98.82 Y142.779 E.05416
G1 X98.82 Y142.629 E.00053
G1 X83.665 Y142.629 E.05387
G2 X83.726 Y142.479 I-.916 J-.46 E.00058
G1 X98.82 Y142.479 E.05366
G1 X98.82 Y142.329 E.00053
G1 X97.35 Y142.329 E.00523
G2 X97.599 Y142.179 I-.617 J-1.305 E.00103
G1 X98.82 Y142.179 E.00434
G1 X98.82 Y142.029 E.00053
M73 P63 R9
G1 X97.756 Y142.029 E.00378
G2 X97.866 Y141.879 I-.776 J-.687 E.00066
G1 X98.82 Y141.879 E.00339
G1 X98.82 Y141.729 E.00053
G1 X97.942 Y141.729 E.00312
G2 X97.997 Y141.579 I-.877 J-.405 E.00057
G1 X98.82 Y141.579 E.00293
G1 X98.82 Y141.429 E.00053
G1 X98.041 Y141.429 E.00277
G2 X98.064 Y141.279 I-.655 J-.178 E.00054
G1 X98.82 Y141.279 E.00269
G1 X98.82 Y141.129 E.00053
G1 X98.064 Y141.129 E.00269
G1 X98.064 Y140.979 E.00053
G1 X98.82 Y140.979 E.00269
G1 X98.82 Y140.829 E.00053
G1 X98.064 Y140.829 E.00269
G1 X98.064 Y140.679 E.00053
G1 X98.82 Y140.679 E.00269
G1 X98.82 Y140.529 E.00053
M73 P63 R8
G1 X98.064 Y140.529 E.00269
G1 X98.064 Y140.379 E.00053
G1 X98.82 Y140.379 E.00269
G1 X98.82 Y140.229 E.00053
G1 X98.064 Y140.229 E.00269
G1 X98.064 Y140.079 E.00053
G1 X98.82 Y140.079 E.00269
G1 X98.82 Y139.929 E.00053
G1 X98.064 Y139.929 E.00269
G1 X98.064 Y139.779 E.00053
G1 X98.82 Y139.779 E.00269
G1 X98.82 Y139.629 E.00053
G1 X98.064 Y139.629 E.00269
G1 X98.064 Y139.479 E.00053
G1 X98.82 Y139.479 E.00269
G1 X98.82 Y139.329 E.00053
G1 X98.064 Y139.329 E.00269
G1 X98.064 Y139.179 E.00053
G1 X98.82 Y139.179 E.00269
G1 X98.82 Y139.029 E.00053
G1 X98.064 Y139.029 E.00269
G1 X98.064 Y138.879 E.00053
G1 X98.82 Y138.879 E.00269
G1 X98.82 Y138.729 E.00053
G1 X98.064 Y138.729 E.00269
G1 X98.064 Y138.579 E.00053
G1 X98.82 Y138.579 E.00269
G1 X98.82 Y138.429 E.00053
G1 X98.064 Y138.429 E.00269
G1 X98.064 Y138.279 E.00053
G1 X98.888 Y138.279 E.00293
; WIPE_START
G1 F24000
G1 X98.064 Y138.279 E-.31288
G1 X98.064 Y138.429 E-.057
G1 X98.82 Y138.429 E-.28724
G1 X98.82 Y138.579 E-.057
G1 X98.7 Y138.579 E-.04588
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.007 J-.683 P1  F30000
G1 X96.867 Y141.279 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X95.249 Y141.279 E.00575
G1 X95.249 Y141.129 E.00053
G1 X96.799 Y141.129 E.00551
G1 X96.799 Y140.979 E.00053
G1 X95.249 Y140.979 E.00551
G1 X95.249 Y140.829 E.00053
G1 X96.799 Y140.829 E.00551
G1 X96.799 Y140.679 E.00053
G1 X95.249 Y140.679 E.00551
G1 X95.249 Y140.529 E.00053
G1 X96.799 Y140.529 E.00551
G1 X96.799 Y140.379 E.00053
G1 X95.249 Y140.379 E.00551
G1 X95.249 Y140.229 E.00053
G1 X96.799 Y140.229 E.00551
G1 X96.799 Y140.079 E.00053
G1 X95.249 Y140.079 E.00551
G1 X95.249 Y139.929 E.00053
G1 X96.799 Y139.929 E.00551
G1 X96.799 Y139.779 E.00053
G1 X95.249 Y139.779 E.00551
G1 X95.249 Y139.629 E.00053
G1 X96.799 Y139.629 E.00551
G1 X96.799 Y139.479 E.00053
G1 X95.249 Y139.479 E.00551
G1 X95.249 Y139.329 E.00053
G1 X96.799 Y139.329 E.00551
G1 X96.799 Y139.179 E.00053
G1 X95.249 Y139.179 E.00551
G1 X95.249 Y139.029 E.00053
G1 X96.799 Y139.029 E.00551
G1 X96.799 Y138.879 E.00053
G1 X95.249 Y138.879 E.00551
G1 X95.249 Y138.729 E.00053
G1 X96.799 Y138.729 E.00551
G1 X96.799 Y138.579 E.00053
G1 X95.25 Y138.579 E.00551
G1 X95.25 Y138.429 E.00053
G1 X96.799 Y138.429 E.00551
G1 X96.799 Y138.279 E.00053
G1 X95.182 Y138.279 E.00575
; WIPE_START
G1 F24000
G1 X96.799 Y138.279 E-.61454
G1 X96.799 Y138.429 E-.057
G1 X96.566 Y138.429 E-.08846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.913 J-.805 P1  F30000
G1 X94.053 Y141.279 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X92.414 Y141.279 E.00583
G1 X92.414 Y141.129 E.00053
G1 X93.986 Y141.129 E.00559
G1 X93.986 Y140.979 E.00053
G1 X92.415 Y140.979 E.00559
G1 X92.415 Y140.829 E.00053
G1 X93.986 Y140.829 E.00559
G1 X93.986 Y140.679 E.00053
G1 X92.415 Y140.679 E.00559
G1 X92.415 Y140.529 E.00053
G1 X93.986 Y140.529 E.00559
G1 X93.986 Y140.379 E.00053
G1 X92.415 Y140.379 E.00559
G1 X92.415 Y140.229 E.00053
G1 X93.986 Y140.229 E.00559
G1 X93.986 Y140.079 E.00053
G1 X92.415 Y140.079 E.00559
G1 X92.415 Y139.929 E.00053
G1 X93.986 Y139.929 E.00559
G1 X93.986 Y139.779 E.00053
G1 X92.415 Y139.779 E.00559
G1 X92.415 Y139.629 E.00053
G1 X93.986 Y139.629 E.00559
G1 X93.986 Y139.479 E.00053
G1 X92.415 Y139.479 E.00559
G1 X92.415 Y139.329 E.00053
G1 X93.986 Y139.329 E.00559
G1 X93.986 Y139.179 E.00053
G1 X92.415 Y139.179 E.00559
G1 X92.415 Y139.029 E.00053
G1 X93.986 Y139.029 E.00559
G1 X93.986 Y138.879 E.00053
G1 X92.415 Y138.879 E.00559
G1 X92.415 Y138.729 E.00053
G1 X93.986 Y138.729 E.00559
G1 X93.986 Y138.579 E.00053
G1 X92.415 Y138.579 E.00559
G1 X92.415 Y138.429 E.00053
G1 X93.986 Y138.429 E.00559
G1 X93.986 Y138.279 E.00053
G1 X92.347 Y138.279 E.00583
; WIPE_START
G1 F24000
G1 X93.986 Y138.279 E-.62276
G1 X93.986 Y138.429 E-.057
G1 X93.775 Y138.429 E-.08024
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.019 J-.666 P1  F30000
G1 X91.224 Y142.329 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X89.598 Y142.329 E.00578
G2 X89.841 Y142.179 I-1.495 J-2.692 E.00101
G1 X91.157 Y142.179 E.00468
G1 X91.157 Y142.029 E.00053
G1 X89.995 Y142.029 E.00413
G2 X90.107 Y141.879 I-1.288 J-1.072 E.00066
G1 X91.157 Y141.879 E.00373
G1 X91.157 Y141.729 E.00053
G1 X90.186 Y141.729 E.00345
G2 X90.24 Y141.579 I-.724 J-.349 E.00057
G1 X91.157 Y141.579 E.00326
G1 X91.157 Y141.429 E.00053
G1 X90.28 Y141.429 E.00312
G2 X90.3 Y141.279 I-.787 J-.183 E.00054
G1 X91.157 Y141.279 E.00304
G1 X91.157 Y141.129 E.00053
G1 X90.302 Y141.129 E.00304
G1 X90.302 Y140.979 E.00053
G1 X91.157 Y140.979 E.00304
G1 X91.157 Y140.829 E.00053
G1 X90.302 Y140.829 E.00304
G1 X90.302 Y140.679 E.00053
G1 X91.157 Y140.679 E.00304
G1 X91.157 Y140.529 E.00053
G1 X90.302 Y140.529 E.00304
G1 X90.302 Y140.379 E.00053
G1 X91.157 Y140.379 E.00304
G1 X91.157 Y140.229 E.00053
G1 X90.302 Y140.229 E.00304
G1 X90.302 Y140.079 E.00053
G1 X91.157 Y140.079 E.00304
G1 X91.157 Y139.929 E.00053
G1 X90.302 Y139.929 E.00304
G1 X90.302 Y139.779 E.00053
G1 X91.157 Y139.779 E.00304
G1 X91.157 Y139.629 E.00053
G1 X90.302 Y139.629 E.00304
G1 X90.302 Y139.479 E.00053
G1 X91.157 Y139.479 E.00304
G1 X91.157 Y139.329 E.00053
G1 X90.302 Y139.329 E.00304
G1 X90.302 Y139.179 E.00053
G1 X91.157 Y139.179 E.00304
G1 X91.157 Y139.029 E.00053
G1 X90.302 Y139.029 E.00304
G1 X90.302 Y138.879 E.00053
G1 X91.157 Y138.879 E.00304
G1 X91.157 Y138.729 E.00053
G1 X90.301 Y138.729 E.00304
G1 X90.301 Y138.579 E.00053
G1 X91.157 Y138.579 E.00304
G1 X91.157 Y138.429 E.00053
G1 X90.301 Y138.429 E.00304
G1 X90.301 Y138.279 E.00053
G1 X91.224 Y138.279 E.00328
; WIPE_START
G1 F24000
G1 X90.301 Y138.279 E-.35079
G1 X90.301 Y138.429 E-.057
G1 X91.157 Y138.429 E-.32512
G1 X91.157 Y138.501 E-.0271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.651 J-1.028 P1  F30000
G1 X85.111 Y142.329 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X83.77 Y142.329 E.00476
G1 X83.799 Y142.179 E.00054
G1 X85.093 Y142.179 E.0046
G1 X85.147 Y142.029 E.00057
G1 X83.812 Y142.029 E.00475
G1 X83.809 Y141.879 E.00053
G1 X85.201 Y141.879 E.00495
G1 X85.255 Y141.729 E.00057
G1 X83.807 Y141.729 E.00515
G2 X83.794 Y141.579 I-3.881 J.268 E.00054
G1 X85.309 Y141.579 E.00539
G1 X85.363 Y141.429 E.00057
G1 X83.765 Y141.429 E.00568
G1 X83.724 Y141.279 E.00055
G1 X89.112 Y141.279 E.01915
G1 X89.111 Y141.129 E.00053
G1 X83.665 Y141.129 E.01936
G2 X83.589 Y140.979 I-1.922 J.888 E.0006
G1 X89.178 Y140.979 E.01987
G1 X89.178 Y140.829 F30000
G1 F3600
G1 X83.629 Y140.829 E.01972
G2 X83.751 Y140.679 I-.884 J-.843 E.00069
G1 X85.298 Y140.679 E.0055
G3 X85.115 Y140.529 I.715 J-1.058 E.00084
G1 X83.849 Y140.529 E.0045
G1 X83.927 Y140.379 E.0006
G1 X84.988 Y140.379 E.00377
G3 X84.895 Y140.229 I1.481 J-1.02 E.00063
G1 X83.985 Y140.229 E.00323
G2 X84.026 Y140.079 I-.861 J-.312 E.00055
G1 X84.829 Y140.079 E.00285
G3 X84.786 Y139.929 I3.725 J-1.153 E.00055
G1 X84.05 Y139.929 E.00262
G2 X84.059 Y139.779 I-.769 J-.122 E.00054
G1 X84.759 Y139.779 E.00249
G3 X84.75 Y139.629 I1.082 J-.139 E.00053
G1 X84.059 Y139.629 E.00246
G2 X84.048 Y139.479 I-.819 J-.017 E.00054
G1 X84.749 Y139.479 E.00249
G1 X84.748 Y139.329 E.00053
G1 X84.024 Y139.329 E.00257
G2 X83.987 Y139.179 I-1.138 J.204 E.00055
G1 X84.759 Y139.179 E.00275
G1 X84.761 Y139.163 E.00006
G3 X84.78 Y139.029 I.998 J.081 E.00048
G1 X83.932 Y139.029 E.00302
G1 X83.923 Y139.007 E.00009
G2 X83.858 Y138.879 I-.76 J.312 E.00051
G1 X84.822 Y138.879 E.00343
G3 X84.884 Y138.729 I2.468 J.94 E.00058
G1 X83.769 Y138.729 E.00396
G2 X83.674 Y138.603 I-.548 J.312 E.00057
M73 P64 R8
G1 X83.652 Y138.579 E.00011
G1 X84.974 Y138.579 E.0047
G3 X85.096 Y138.429 I.725 J.465 E.00069
G1 X83.504 Y138.429 E.00566
G2 X83.296 Y138.279 I-1.691 J2.12 E.00091
G1 X85.39 Y138.279 E.00744
; WIPE_START
G1 F24000
G1 X83.39 Y138.279 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.038 J-.636 P1  F30000
G1 X79.439 Y144.729 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X76.915 Y144.729 E.00897
G1 X76.854 Y144.579 E.00058
G1 X78.888 Y144.579 E.00723
G1 X78.516 Y144.429 E.00142
G1 X76.793 Y144.429 E.00612
G1 X76.733 Y144.279 E.00058
G1 X78.354 Y144.279 E.00577
G1 X78.354 Y144.129 E.00053
G1 X76.672 Y144.129 E.00598
G1 X76.611 Y143.979 E.00058
G1 X78.354 Y143.979 E.0062
G1 X78.354 Y143.829 E.00053
G1 X76.55 Y143.829 E.00641
G3 X76.493 Y143.679 I1.235 J-.554 E.00057
G1 X78.354 Y143.679 E.00662
G1 X78.354 Y143.529 E.00053
G1 X76.442 Y143.529 E.0068
G1 X76.392 Y143.379 E.00056
G1 X78.354 Y143.379 E.00698
G1 X78.354 Y143.229 E.00053
G1 X76.27 Y143.229 E.00741
; WIPE_START
G1 F24000
G1 X78.27 Y143.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.259 J1.189 P1  F30000
G1 X78.957 Y143.379 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X79.495 Y143.379 E.00191
G1 X79.495 Y143.229 E.00053
G1 X78.586 Y143.229 E.00323
G1 X79.562 Y143.079 F30000
G1 F3600
G1 X76.29 Y143.079 E.01163
G1 X76.24 Y142.929 E.00056
G1 X79.495 Y142.929 E.01157
G1 X79.495 Y142.779 E.00053
G1 X76.189 Y142.779 E.01175
G1 X76.143 Y142.629 E.00056
G1 X79.207 Y142.629 E.01089
G1 X78.835 Y142.479 E.00142
G1 X76.102 Y142.479 E.00971
G1 X76.061 Y142.329 E.00055
G1 X78.463 Y142.329 E.00854
G1 X78.354 Y142.285 E.00042
G1 X78.354 Y142.179 E.00038
G1 X76.02 Y142.179 E.0083
G1 X75.979 Y142.029 E.00055
G1 X78.354 Y142.029 E.00844
G1 X78.354 Y141.879 E.00053
G1 X75.938 Y141.879 E.00859
G1 X75.897 Y141.729 E.00055
G1 X78.354 Y141.729 E.00873
G1 X78.354 Y141.579 E.00053
G1 X75.861 Y141.579 E.00886
G1 X75.83 Y141.429 E.00054
G1 X78.354 Y141.429 E.00897
G1 X78.354 Y141.279 E.00053
G1 X75.798 Y141.279 E.00909
G1 X75.767 Y141.129 E.00054
G1 X78.354 Y141.129 E.0092
G1 X78.354 Y140.979 E.00053
G1 X75.735 Y140.979 E.00931
G1 X75.703 Y140.829 E.00054
G1 X78.354 Y140.829 E.00942
G1 X78.354 Y140.679 E.00053
G1 X75.672 Y140.679 E.00954
G3 X75.644 Y140.529 I1.25 J-.307 E.00054
G1 X78.354 Y140.529 E.00963
G1 X78.354 Y140.379 E.00053
G1 X75.622 Y140.379 E.00971
G1 X75.6 Y140.229 E.00054
G1 X78.354 Y140.229 E.00979
G1 X78.354 Y140.079 E.00053
G1 X75.577 Y140.079 E.00987
G1 X75.555 Y139.929 E.00054
G1 X78.354 Y139.929 E.00995
G1 X78.354 Y139.779 E.00053
G1 X75.532 Y139.779 E.01003
G1 X75.51 Y139.629 E.00054
G1 X78.354 Y139.629 E.01011
G1 X78.354 Y139.479 E.00053
G1 X75.49 Y139.479 E.01018
G1 X75.477 Y139.329 E.00054
G1 X78.354 Y139.329 E.01023
G1 X78.354 Y139.179 E.00053
G1 X75.463 Y139.179 E.01028
G1 X75.45 Y139.029 E.00054
G1 X78.354 Y139.029 E.01032
G1 X78.354 Y138.879 E.00053
G1 X75.437 Y138.879 E.01037
G1 X75.423 Y138.729 E.00054
G1 X78.354 Y138.729 E.01042
G1 X78.354 Y138.579 E.00053
G1 X75.41 Y138.579 E.01047
G1 X75.397 Y138.429 E.00054
G1 X78.354 Y138.429 E.01051
G1 X78.354 Y138.279 E.00053
G1 X75.392 Y138.279 E.01053
G1 X75.388 Y138.129 E.00053
G1 X100.277 Y138.129 E.08847
; WIPE_START
G1 F24000
G1 X98.277 Y138.129 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.153 J.388 P1  F30000
G1 X100.043 Y143.379 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X111.026 Y143.379 E.03904
G1 X111.076 Y143.229 E.00056
G1 X100.111 Y143.229 E.03898
G1 X100.111 Y143.079 E.00053
G1 X111.127 Y143.079 E.03916
G1 X111.178 Y142.929 E.00056
G1 X100.111 Y142.929 E.03934
G1 X100.111 Y142.779 E.00053
G1 X111.228 Y142.779 E.03952
G2 X111.274 Y142.629 I-1.241 J-.46 E.00056
G1 X100.111 Y142.629 E.03968
G1 X100.111 Y142.479 E.00053
G1 X111.315 Y142.479 E.03983
G1 X111.356 Y142.329 E.00055
G1 X109.748 Y142.329 E.00572
G1 X109.748 Y142.179 E.00053
G1 X111.397 Y142.179 E.00586
G1 X111.438 Y142.029 E.00055
G1 X109.748 Y142.029 E.00601
G1 X109.748 Y141.879 E.00053
G1 X111.479 Y141.879 E.00615
G1 X111.52 Y141.729 E.00055
G1 X109.748 Y141.729 E.0063
G1 X109.748 Y141.579 E.00053
G1 X111.556 Y141.579 E.00643
G1 X111.588 Y141.429 E.00054
G1 X109.748 Y141.429 E.00654
G1 X109.748 Y141.279 E.00053
G1 X111.619 Y141.279 E.00665
G1 X111.651 Y141.129 E.00054
G1 X109.748 Y141.129 E.00676
G1 X109.748 Y140.979 E.00053
G1 X111.682 Y140.979 E.00687
G1 X111.714 Y140.829 E.00054
G1 X109.748 Y140.829 E.00699
G1 X109.748 Y140.679 E.00053
G1 X111.745 Y140.679 E.0071
G2 X111.773 Y140.529 I-1.25 J-.307 E.00054
G1 X109.748 Y140.529 E.0072
G1 X109.748 Y140.379 E.00053
G1 X111.795 Y140.379 E.00728
G1 X111.818 Y140.229 E.00054
G1 X109.748 Y140.229 E.00736
G1 X109.748 Y140.079 E.00053
G1 X111.84 Y140.079 E.00744
G1 X111.863 Y139.929 E.00054
G1 X109.748 Y139.929 E.00752
G1 X109.748 Y139.779 E.00053
G1 X111.885 Y139.779 E.00759
G1 X111.907 Y139.629 E.00054
G1 X109.748 Y139.629 E.00767
G1 X109.748 Y139.479 E.00053
G1 X111.927 Y139.479 E.00775
G1 X111.941 Y139.329 E.00054
G1 X109.748 Y139.329 E.00779
G1 X109.748 Y139.314 E.00005
G2 X109.741 Y139.179 I-1.153 J-.005 E.00048
G1 X111.954 Y139.179 E.00787
G1 X111.967 Y139.029 E.00054
G1 X109.719 Y139.029 E.00799
G2 X109.676 Y138.879 I-1.026 J.209 E.00055
G1 X111.981 Y138.879 E.00819
G1 X111.994 Y138.729 E.00054
G1 X109.612 Y138.729 E.00847
G2 X109.525 Y138.579 I-1.141 J.567 E.00062
G1 X112.008 Y138.579 E.00883
G1 X112.02 Y138.429 E.00054
G1 X109.403 Y138.429 E.0093
G2 X109.231 Y138.279 I-.903 J.86 E.00081
G1 X112.092 Y138.279 E.01017
; WIPE_START
G1 F24000
G1 X110.092 Y138.279 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.144 J-.415 P1  F30000
G1 X108.625 Y142.329 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X105.819 Y142.329 E.00998
G1 X105.819 Y142.179 E.00053
G1 X108.557 Y142.179 E.00974
G1 X108.557 Y142.029 E.00053
G1 X105.819 Y142.029 E.00974
G1 X105.819 Y141.879 E.00053
G1 X108.558 Y141.879 E.00974
G1 X108.558 Y141.729 E.00053
G1 X105.818 Y141.729 E.00974
G1 X105.818 Y141.579 E.00053
G1 X108.558 Y141.579 E.00974
G1 X108.558 Y141.429 E.00053
G1 X105.818 Y141.429 E.00974
G1 X105.818 Y141.279 E.00053
G1 X108.558 Y141.279 E.00974
G1 X108.558 Y141.129 E.00053
G1 X105.818 Y141.129 E.00974
G1 X105.818 Y140.979 E.00053
G1 X108.558 Y140.979 E.00974
G1 X108.558 Y140.829 E.00053
G1 X105.818 Y140.829 E.00974
G1 X105.818 Y140.679 E.00053
G1 X108.558 Y140.679 E.00974
G1 X108.558 Y140.529 E.00053
G1 X105.818 Y140.529 E.00974
G1 X105.818 Y140.379 E.00053
G1 X108.558 Y140.379 E.00974
G1 X108.558 Y140.229 E.00053
G1 X105.818 Y140.229 E.00974
G1 X105.818 Y140.079 E.00053
G1 X108.558 Y140.079 E.00974
G1 X108.558 Y139.929 E.00053
G1 X105.818 Y139.929 E.00974
G1 X105.818 Y139.779 E.00053
G1 X108.558 Y139.779 E.00974
G1 X108.558 Y139.629 E.00053
G1 X105.818 Y139.629 E.00974
G1 X105.818 Y139.479 E.00053
G1 X108.558 Y139.479 E.00974
G1 X108.558 Y139.329 E.00053
G1 X105.818 Y139.329 E.00974
G1 X105.818 Y139.188 E.0005
G1 X108.626 Y139.179 E.00998
; WIPE_START
G1 F24000
G1 X106.626 Y139.185 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.036 J-.639 P1  F30000
G1 X104.687 Y142.329 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X103.135 Y142.329 E.00552
G2 X103.372 Y142.179 I-.604 J-1.219 E.001
G1 X104.619 Y142.179 E.00443
G1 X104.619 Y142.029 E.00053
G1 X103.53 Y142.029 E.00387
G2 X103.641 Y141.879 I-1.219 J-1.021 E.00066
G1 X104.619 Y141.879 E.00348
G1 X104.619 Y141.729 E.00053
G1 X103.72 Y141.729 E.0032
G2 X103.779 Y141.579 I-.649 J-.342 E.00057
G1 X104.619 Y141.579 E.00299
G1 X104.619 Y141.429 E.00053
G1 X103.812 Y141.429 E.00287
G2 X103.834 Y141.279 I-.728 J-.184 E.00054
G1 X104.619 Y141.279 E.00279
G1 X104.619 Y141.129 E.00053
G1 X103.838 Y141.129 E.00278
G1 X103.838 Y140.979 E.00053
G1 X104.619 Y140.979 E.00278
G1 X104.619 Y140.829 E.00053
G1 X103.838 Y140.829 E.00278
G1 X103.838 Y140.679 E.00053
G1 X104.619 Y140.679 E.00278
G1 X104.619 Y140.529 E.00053
G1 X103.838 Y140.529 E.00278
G1 X103.838 Y140.379 E.00053
G1 X104.619 Y140.379 E.00278
G1 X104.619 Y140.229 E.00053
G1 X103.838 Y140.229 E.00278
G1 X103.838 Y140.079 E.00053
G1 X104.619 Y140.079 E.00278
G1 X104.619 Y139.929 E.00053
G1 X103.838 Y139.929 E.00278
G1 X103.838 Y139.779 E.00053
G1 X104.619 Y139.779 E.00278
G1 X104.619 Y139.629 E.00053
G1 X103.838 Y139.629 E.00278
G1 X103.837 Y139.479 E.00053
G1 X104.619 Y139.479 E.00278
G1 X104.621 Y139.329 E.00053
G1 X103.837 Y139.329 E.00279
G1 X103.831 Y139.179 E.00053
G1 X104.625 Y139.179 E.00283
G3 X104.65 Y139.029 I.936 J.074 E.00054
G1 X103.808 Y139.028 E.00299
G2 X103.765 Y138.879 I-1.085 J.234 E.00055
G1 X104.691 Y138.879 E.00329
G3 X104.754 Y138.729 I1.056 J.357 E.00058
G1 X103.703 Y138.729 E.00374
G2 X103.615 Y138.579 I-.984 J.48 E.00062
G1 X104.843 Y138.579 E.00437
G3 X104.964 Y138.429 I1.212 J.855 E.00069
G1 X103.493 Y138.429 E.00523
G2 X103.321 Y138.279 I-1.833 J1.924 E.00081
G1 X105.26 Y138.279 E.00689
; WIPE_START
G1 F24000
G1 X103.321 Y138.279 E-.7368
G1 X103.367 Y138.32 E-.0232
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.329 J-1.172 P1  F30000
G1 X102.691 Y138.129 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X112.029 Y138.129 E.0332
G1 X112.034 Y137.979 E.00053
G1 X75.383 Y137.979 E.13028
G1 X75.379 Y137.829 E.00053
G1 X112.038 Y137.829 E.13031
G1 X112.043 Y137.679 E.00053
G1 X75.375 Y137.679 E.13034
G1 X75.37 Y137.529 E.00053
G1 X112.047 Y137.529 E.13037
G1 X112.052 Y137.379 E.00053
G1 X75.366 Y137.379 E.13041
G3 X75.368 Y137.229 I1.265 J-.052 E.00053
G1 X112.049 Y137.229 E.13039
G1 X112.044 Y137.079 E.00053
G1 X75.373 Y137.079 E.13036
G1 X75.377 Y136.929 E.00053
G1 X112.04 Y136.929 E.13032
G1 X112.036 Y136.779 E.00053
G1 X75.382 Y136.779 E.13029
G1 X75.386 Y136.629 E.00053
G1 X89.552 Y136.629 E.05035
G1 X89.552 Y136.479 E.00053
G1 X79.721 Y136.479 E.03495
G1 X79.721 Y136.329 E.00053
G1 X89.552 Y136.329 E.03495
G1 X89.552 Y136.179 E.00053
G1 X79.721 Y136.179 E.03495
G1 X79.721 Y136.029 E.00053
G1 X89.552 Y136.029 E.03495
G1 X89.552 Y135.879 E.00053
G1 X79.721 Y135.879 E.03495
G1 X79.721 Y135.729 E.00053
G1 X89.552 Y135.729 E.03495
G1 X89.552 Y135.579 E.00053
G1 X87.873 Y135.579 E.00597
G2 X88.18 Y135.429 I-.266 J-.935 E.00122
G1 X89.552 Y135.429 E.00488
G1 X89.552 Y135.279 E.00053
G1 X88.353 Y135.279 E.00426
G2 X88.475 Y135.129 I-1.129 J-1.044 E.00069
G1 X89.552 Y135.129 E.00383
G1 X89.552 Y134.979 E.00053
G1 X88.562 Y134.979 E.00352
G2 X88.622 Y134.829 I-1.052 J-.507 E.00057
G1 X89.552 Y134.829 E.00331
G1 X89.552 Y134.679 E.00053
G1 X88.664 Y134.679 E.00316
G2 X88.693 Y134.529 I-.395 J-.154 E.00055
G1 X89.552 Y134.529 E.00305
G1 X89.552 Y134.379 E.00053
G1 X88.698 Y134.379 E.00303
G1 X88.699 Y134.229 E.00053
G1 X89.552 Y134.229 E.00303
G1 X89.552 Y134.079 E.00053
G1 X88.698 Y134.079 E.00303
G1 X88.698 Y133.929 E.00053
G1 X89.552 Y133.929 E.00303
G1 X89.552 Y133.779 E.00053
G1 X88.698 Y133.779 E.00303
G1 X88.698 Y133.629 E.00053
G1 X89.552 Y133.629 E.00304
G1 X89.552 Y133.479 E.00053
G1 X88.698 Y133.479 E.00304
G1 X88.698 Y133.329 E.00053
G1 X89.552 Y133.329 E.00304
G1 X89.552 Y133.179 E.00053
G1 X88.698 Y133.179 E.00304
G1 X88.698 Y133.029 E.00053
G1 X89.552 Y133.029 E.00304
M73 P65 R8
G1 X89.552 Y132.879 E.00053
G1 X88.697 Y132.879 E.00304
G1 X88.697 Y132.729 E.00053
G1 X89.552 Y132.729 E.00304
G1 X89.552 Y132.579 E.00053
G1 X88.697 Y132.579 E.00304
G1 X88.697 Y132.429 E.00053
G1 X89.552 Y132.429 E.00304
G1 X89.552 Y132.279 E.00053
G1 X88.697 Y132.279 E.00304
G1 X88.697 Y132.129 E.00053
G1 X89.552 Y132.129 E.00304
G1 X89.552 Y131.979 E.00053
G1 X88.697 Y131.979 E.00304
G1 X88.697 Y131.829 E.00053
G1 X89.552 Y131.829 E.00304
G1 X89.552 Y131.679 E.00053
G1 X88.696 Y131.679 E.00304
G1 X88.696 Y131.529 E.00053
G1 X89.552 Y131.529 E.00304
G1 X89.552 Y131.379 E.00053
G1 X88.629 Y131.379 E.00328
; WIPE_START
G1 F24000
G1 X89.552 Y131.379 E-.35081
G1 X89.552 Y131.529 E-.057
G1 X88.696 Y131.529 E-.32513
G1 X88.696 Y131.601 E-.02707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.125 J.465 P1  F30000
G1 X90.775 Y136.629 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X112.031 Y136.629 E.07556
G1 X112.027 Y136.479 E.00053
G1 X90.842 Y136.479 E.0753
G1 X90.842 Y136.329 E.00053
G1 X112.022 Y136.329 E.07529
G2 X112.013 Y136.179 I-1.269 J.005 E.00053
G1 X90.842 Y136.179 E.07525
G1 X90.842 Y136.029 E.00053
G1 X111.999 Y136.029 E.07521
G1 X111.986 Y135.879 E.00054
G1 X90.842 Y135.879 E.07516
G1 X90.842 Y135.729 E.00053
G1 X111.973 Y135.729 E.07511
G1 X111.959 Y135.579 E.00054
G1 X93.759 Y135.579 E.06469
G2 X94.05 Y135.429 I-.749 J-1.808 E.00116
G1 X111.946 Y135.429 E.06361
G1 X111.933 Y135.279 E.00054
G1 X94.223 Y135.279 E.06295
G2 X94.345 Y135.129 I-1.346 J-1.215 E.00069
G1 X111.916 Y135.129 E.06246
G1 X111.894 Y134.979 E.00054
G1 X94.433 Y134.979 E.06207
G2 X94.496 Y134.829 I-.907 J-.469 E.00058
G1 X111.871 Y134.829 E.06176
G1 X111.849 Y134.679 E.00054
G1 X94.537 Y134.679 E.06154
G1 X94.564 Y134.529 E.00054
G1 X111.826 Y134.529 E.06136
G1 X111.804 Y134.379 E.00054
G1 X94.57 Y134.379 E.06126
G1 X94.57 Y134.229 E.00053
G1 X111.782 Y134.229 E.06118
G2 X111.758 Y134.079 I-1.276 J.127 E.00054
G1 X94.57 Y134.079 E.0611
G1 X94.569 Y133.929 E.00053
G1 X111.726 Y133.929 E.06099
G1 X111.695 Y133.779 E.00054
G1 X94.569 Y133.779 E.06087
G1 X94.569 Y133.629 E.00053
G1 X111.663 Y133.629 E.06076
G1 X111.631 Y133.479 E.00054
G1 X94.569 Y133.479 E.06065
G1 X94.569 Y133.329 E.00053
G1 X111.6 Y133.329 E.06054
G1 X111.568 Y133.179 E.00054
G1 X94.569 Y133.179 E.06043
G1 X94.569 Y133.029 E.00053
G1 X111.536 Y133.029 E.06031
G1 X111.495 Y132.879 E.00055
G1 X94.568 Y132.879 E.06017
G1 X94.568 Y132.729 E.00053
G1 X111.454 Y132.729 E.06002
G1 X111.413 Y132.579 E.00055
G1 X94.568 Y132.579 E.05988
G2 X94.564 Y132.429 I-1.321 J-.038 E.00053
G1 X111.372 Y132.429 E.05975
G1 X111.331 Y132.279 E.00055
G1 X94.547 Y132.279 E.05966
G2 X94.511 Y132.129 I-.673 J.079 E.00055
G1 X111.29 Y132.129 E.05964
G2 X111.248 Y131.979 I-1.284 J.278 E.00055
G1 X94.454 Y131.979 E.0597
G2 X94.373 Y131.829 I-1.085 J.489 E.00061
G1 X111.197 Y131.829 E.0598
G1 X111.147 Y131.679 E.00056
G1 X94.262 Y131.679 E.06002
G2 X94.107 Y131.529 I-.969 J.847 E.00077
G1 X111.096 Y131.529 E.06039
G1 X111.045 Y131.379 E.00056
G1 X93.676 Y131.379 E.06174
; WIPE_START
G1 F24000
G1 X95.676 Y131.379 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.558 J-1.082 P1  F30000
G1 X87.534 Y135.579 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X79.721 Y135.579 E.02777
G1 X79.721 Y135.429 E.00053
G1 X83.473 Y135.429 E.01334
G1 X83.527 Y135.279 E.00057
G1 X79.721 Y135.279 E.01353
G1 X79.721 Y135.129 E.00053
G1 X83.581 Y135.129 E.01372
G1 X83.635 Y134.979 E.00057
G1 X79.721 Y134.979 E.01391
G1 X79.721 Y134.829 E.00053
G1 X83.689 Y134.829 E.0141
G1 X83.742 Y134.679 E.00057
G1 X79.721 Y134.679 E.0143
G1 X79.721 Y134.529 E.00053
G1 X87.507 Y134.529 E.02768
G1 X87.506 Y134.379 E.00053
G1 X79.721 Y134.379 E.02768
G1 X79.721 Y134.229 E.00053
G1 X87.573 Y134.229 E.02791
G1 X87.573 Y134.079 F30000
G1 F3600
G1 X79.721 Y134.079 E.02791
G1 X79.721 Y133.929 E.00053
G1 X83.761 Y133.929 E.01436
G3 X83.555 Y133.779 I.588 J-1.021 E.00091
G1 X79.721 Y133.779 E.01363
G1 X79.721 Y133.629 E.00053
G1 X83.416 Y133.629 E.01314
G3 X83.315 Y133.479 I.629 J-.534 E.00064
G1 X79.721 Y133.479 E.01278
G1 X79.721 Y133.329 E.00053
G1 X83.24 Y133.329 E.01251
G3 X83.191 Y133.179 I1.503 J-.576 E.00056
G1 X79.721 Y133.179 E.01234
G1 X79.721 Y133.029 E.00053
G1 X83.16 Y133.029 E.01223
G3 X83.145 Y132.879 I2.237 J-.293 E.00054
G1 X79.721 Y132.879 E.01217
G1 X79.721 Y132.729 E.00053
G1 X83.145 Y132.729 E.01217
G1 X83.145 Y132.579 E.00053
G1 X79.721 Y132.579 E.01217
G1 X79.721 Y132.429 E.00053
G1 X83.149 Y132.429 E.01219
G1 X83.169 Y132.279 E.00054
G1 X82.427 Y132.279 E.00264
G1 X82.48 Y132.129 E.00057
G1 X83.203 Y132.129 E.00257
G3 X83.26 Y131.979 I1.239 J.388 E.00057
G1 X82.534 Y131.979 E.00258
G1 X82.587 Y131.829 E.00057
G1 X83.341 Y131.829 E.00268
G3 X83.452 Y131.679 I1.076 J.682 E.00066
G1 X82.641 Y131.679 E.00288
G1 X82.694 Y131.529 E.00057
G1 X83.606 Y131.529 E.00324
G3 X83.845 Y131.379 I1.189 J1.627 E.001
G1 X82.676 Y131.379 E.00416
; WIPE_START
G1 F24000
M73 P66 R8
G1 X83.845 Y131.379 E-.44423
G1 X83.606 Y131.529 E-.10713
G1 X83.057 Y131.529 E-.20864
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.895 J-.825 P1  F30000
G1 X78.498 Y136.479 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X75.391 Y136.479 E.01104
G1 X75.395 Y136.329 E.00053
G1 X78.43 Y136.329 E.01079
G1 X78.43 Y136.179 E.00053
G1 X75.405 Y136.179 E.01076
G1 X75.418 Y136.029 E.00054
G1 X78.43 Y136.029 E.01071
G1 X78.43 Y135.879 E.00053
G1 X75.431 Y135.879 E.01066
G1 X75.445 Y135.729 E.00054
G1 X78.43 Y135.729 E.01061
G1 X78.43 Y135.579 E.00053
G1 X75.458 Y135.579 E.01056
G1 X75.471 Y135.429 E.00054
G1 X78.43 Y135.429 E.01052
G1 X78.43 Y135.279 E.00053
G1 X75.485 Y135.279 E.01047
G3 X75.501 Y135.129 I1.272 J.064 E.00054
G1 X78.43 Y135.129 E.01041
G1 X78.43 Y134.979 E.00053
G1 X75.524 Y134.979 E.01033
G1 X75.546 Y134.829 E.00054
G1 X78.43 Y134.829 E.01025
G1 X78.43 Y134.679 E.00053
G1 X75.568 Y134.679 E.01017
G1 X75.591 Y134.529 E.00054
G1 X78.43 Y134.529 E.01009
G1 X78.43 Y134.379 E.00053
G1 X75.613 Y134.379 E.01001
G1 X75.636 Y134.229 E.00054
G1 X78.43 Y134.229 E.00993
G1 X78.43 Y134.079 E.00053
G1 X75.66 Y134.079 E.00985
G1 X75.691 Y133.929 E.00054
G1 X78.43 Y133.929 E.00974
G1 X78.43 Y133.779 E.00053
G1 X75.723 Y133.779 E.00962
G1 X75.754 Y133.629 E.00054
G1 X78.43 Y133.629 E.00951
G1 X78.43 Y133.479 E.00053
G1 X75.786 Y133.479 E.0094
G1 X75.817 Y133.329 E.00054
G1 X78.43 Y133.329 E.00929
G1 X78.43 Y133.179 E.00053
G1 X75.849 Y133.179 E.00918
G3 X75.881 Y133.029 I1.282 J.198 E.00055
G1 X78.43 Y133.029 E.00906
G1 X78.43 Y132.879 E.00053
G1 X75.922 Y132.879 E.00891
G1 X75.963 Y132.729 E.00055
G1 X78.43 Y132.729 E.00877
G1 X78.43 Y132.579 E.00053
G1 X76.004 Y132.579 E.00862
G1 X76.045 Y132.429 E.00055
G1 X78.43 Y132.429 E.00848
G1 X78.43 Y132.279 E.00053
G1 X76.086 Y132.279 E.00833
G1 X76.127 Y132.129 E.00055
G1 X78.43 Y132.129 E.00819
G1 X78.43 Y131.979 E.00053
G1 X76.169 Y131.979 E.00804
G1 X76.22 Y131.829 E.00056
G1 X78.43 Y131.829 E.00786
G1 X78.43 Y131.679 E.00053
G1 X76.271 Y131.679 E.00768
G1 X76.321 Y131.529 E.00056
G1 X78.43 Y131.529 E.0075
G1 X78.43 Y131.379 E.00053
G1 X76.372 Y131.379 E.00732
G1 X76.423 Y131.229 E.00056
G1 X110.995 Y131.229 E.12289
G1 X110.944 Y131.079 E.00056
G1 X76.473 Y131.079 E.12253
G3 X76.526 Y130.929 I1.29 J.371 E.00057
G1 X110.891 Y130.929 E.12216
G1 X110.83 Y130.779 E.00058
G1 X76.587 Y130.779 E.12172
G1 X76.648 Y130.629 E.00058
G1 X110.769 Y130.629 E.12129
G1 X110.708 Y130.479 E.00058
G1 X76.709 Y130.479 E.12086
G1 X76.77 Y130.329 E.00058
G1 X110.648 Y130.329 E.12043
G1 X110.587 Y130.179 E.00058
G1 X76.831 Y130.179 E.11999
G1 X76.891 Y130.029 E.00058
G1 X110.526 Y130.029 E.11956
G2 X110.46 Y129.879 I-1.297 J.483 E.00058
G1 X76.958 Y129.879 E.11909
G1 X77.029 Y129.729 E.00059
G1 X110.388 Y129.729 E.11858
G1 X110.317 Y129.579 E.00059
G1 X77.1 Y129.579 E.11807
G1 X77.172 Y129.429 E.00059
G1 X110.245 Y129.429 E.11757
G1 X110.174 Y129.279 E.00059
G1 X77.243 Y129.279 E.11706
G1 X77.315 Y129.129 E.00059
G1 X110.102 Y129.129 E.11655
G1 X110.031 Y128.979 E.00059
G1 X77.386 Y128.979 E.11604
G1 X77.469 Y128.829 E.00061
G1 X109.949 Y128.829 E.11546
G1 X109.866 Y128.679 E.00061
G1 X77.551 Y128.679 E.11487
G1 X77.634 Y128.529 E.00061
G1 X109.783 Y128.529 E.11428
G1 X109.701 Y128.379 E.00061
G1 X77.717 Y128.379 E.11369
G1 X77.799 Y128.229 E.00061
G1 X109.618 Y128.229 E.1131
G1 X109.535 Y128.079 E.00061
G1 X77.882 Y128.079 E.11252
G3 X77.972 Y127.929 I1.309 J.684 E.00062
G1 X109.445 Y127.929 E.11188
G1 X109.35 Y127.779 E.00063
G1 X78.067 Y127.779 E.1112
G1 X78.162 Y127.629 E.00063
G1 X109.256 Y127.629 E.11053
G1 X109.161 Y127.479 E.00063
G1 X78.256 Y127.479 E.10986
G1 X78.351 Y127.329 E.00063
G1 X109.066 Y127.329 E.10918
G1 X108.972 Y127.179 E.00063
G1 X78.446 Y127.179 E.10851
G3 X78.547 Y127.029 I1.314 J.776 E.00064
G1 X108.871 Y127.029 E.10779
G1 X108.763 Y126.879 E.00066
G1 X78.654 Y126.879 E.10703
G1 X78.762 Y126.729 E.00066
G1 X108.655 Y126.729 E.10626
G1 X108.548 Y126.579 E.00066
G1 X78.87 Y126.579 E.1055
G1 X78.977 Y126.429 E.00066
G1 X108.44 Y126.429 E.10473
G1 X108.333 Y126.279 E.00066
G1 X79.085 Y126.279 E.10397
G3 X79.201 Y126.129 I1.322 J.903 E.00067
G1 X108.216 Y126.129 E.10314
G1 X108.095 Y125.979 E.00069
G1 X79.323 Y125.979 E.10228
G1 X79.444 Y125.829 E.00069
G1 X107.973 Y125.829 E.10141
G1 X107.851 Y125.679 E.00069
G1 X79.566 Y125.679 E.10055
G1 X79.688 Y125.529 E.00069
G1 X107.73 Y125.529 E.09968
G1 X107.608 Y125.379 E.00069
G1 X79.809 Y125.379 E.09881
G1 X79.946 Y125.229 E.00072
G1 X107.471 Y125.229 E.09784
G1 X107.334 Y125.079 E.00072
G1 X80.083 Y125.079 E.09687
G1 X80.221 Y124.929 E.00072
G1 X107.197 Y124.929 E.09589
G1 X107.059 Y124.779 E.00072
G1 X80.358 Y124.779 E.09492
G1 X80.495 Y124.629 E.00072
G1 X106.922 Y124.629 E.09394
G2 X106.774 Y124.479 I-1.338 J1.172 E.00075
M73 P67 R8
G1 X80.643 Y124.479 E.09289
G1 X80.798 Y124.329 E.00077
G1 X106.62 Y124.329 E.09179
G1 X106.465 Y124.179 E.00077
G1 X80.952 Y124.179 E.09069
G1 X81.107 Y124.029 E.00077
G1 X106.311 Y124.029 E.08959
G1 X106.156 Y123.879 E.00077
G1 X81.261 Y123.879 E.08849
G3 X81.427 Y123.729 I1.347 J1.321 E.0008
G1 X105.991 Y123.729 E.08732
G1 X105.816 Y123.579 E.00082
G1 X81.601 Y123.579 E.08608
G1 X81.775 Y123.429 E.00082
G1 X105.642 Y123.429 E.08484
G1 X105.468 Y123.279 E.00082
G1 X81.949 Y123.279 E.0836
G1 X82.123 Y123.129 E.00082
G1 X105.294 Y123.129 E.08237
G2 X105.101 Y122.979 I-1.36 J1.551 E.00087
G1 X82.316 Y122.979 E.08099
G1 X82.512 Y122.829 E.00088
G1 X104.905 Y122.829 E.0796
G1 X104.708 Y122.679 E.00088
G1 X82.709 Y122.679 E.0782
M73 P67 R7
G1 X82.905 Y122.529 E.00088
G1 X104.512 Y122.529 E.0768
G2 X104.304 Y122.379 I-1.368 J1.678 E.00091
G1 X83.114 Y122.379 E.07532
G1 X83.336 Y122.229 E.00095
G1 X104.081 Y122.229 E.07374
G1 X103.858 Y122.079 E.00095
G1 X83.559 Y122.079 E.07216
G1 X83.782 Y121.929 E.00095
G1 X103.636 Y121.929 E.07057
G1 X103.565 Y121.882 E.0003
G2 X103.401 Y121.779 I-.946 J1.336 E.00069
G1 X84.017 Y121.779 E.0689
G1 X84.271 Y121.629 E.00105
G1 X103.147 Y121.629 E.0671
G1 X102.893 Y121.479 E.00105
G1 X84.525 Y121.479 E.06529
G1 X84.779 Y121.329 E.00105
G1 X102.639 Y121.329 E.06349
G2 X102.357 Y121.179 I-1.405 J2.294 E.00113
G1 X85.06 Y121.179 E.06149
G1 X85.352 Y121.029 E.00117
G1 X102.065 Y121.029 E.05941
G1 X101.773 Y120.879 E.00117
G1 X85.644 Y120.879 E.05733
G3 X85.956 Y120.729 I1.42 J2.55 E.00123
G1 X101.461 Y120.729 E.05512
G1 X101.121 Y120.579 E.00132
G1 X86.296 Y120.579 E.0527
G1 X86.637 Y120.429 E.00132
G1 X100.78 Y120.429 E.05028
G2 X100.41 Y120.279 I-1.449 J3.049 E.00142
G1 X87.008 Y120.279 E.04764
G1 X87.412 Y120.129 E.00153
M73 P68 R7
G1 X100.006 Y120.129 E.04477
G1 X99.602 Y119.979 E.00153
G1 X87.622 Y119.979 E.04259
G1 X88.072 Y119.829 F30000
G1 F3600
G1 X99.346 Y119.829 E.04008
G1 X98.855 Y119.679 F30000
G1 F3600
G1 X88.563 Y119.679 E.03658
G1 X89.106 Y119.529 F30000
G1 F3600
G1 X98.311 Y119.529 E.03272
G1 X97.69 Y119.379 F30000
G1 F3600
G1 X89.727 Y119.379 E.02831
G1 X90.496 Y119.229 F30000
G1 F3600
G1 X96.921 Y119.229 E.02284
; WIPE_START
G1 F24000
G1 X94.921 Y119.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.182 J1.203 P1  F30000
G1 X95.913 Y119.079 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X91.504 Y119.079 E.01567
; WIPE_START
G1 F24000
G1 X93.504 Y119.079 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.167 J.344 P1  F30000
G1 X100.043 Y141.279 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X102.57 Y141.279 E.00898
G1 X102.57 Y141.129 E.00053
G1 X100.111 Y141.129 E.00874
G1 X100.111 Y140.979 E.00053
G1 X102.57 Y140.979 E.00874
G1 X102.57 Y140.829 E.00053
G1 X100.111 Y140.829 E.00874
G1 X100.111 Y140.679 E.00053
G1 X102.57 Y140.679 E.00874
G1 X102.57 Y140.529 E.00053
G1 X100.111 Y140.529 E.00874
G1 X100.111 Y140.379 E.00053
G1 X102.57 Y140.379 E.00874
G1 X102.57 Y140.229 E.00053
G1 X100.111 Y140.229 E.00874
G1 X100.111 Y140.079 E.00053
G1 X102.57 Y140.079 E.00874
G1 X102.57 Y139.929 E.00053
G1 X100.111 Y139.929 E.00874
G1 X100.111 Y139.779 E.00053
G1 X102.57 Y139.779 E.00874
G1 X102.57 Y139.629 E.00053
G1 X100.111 Y139.629 E.00874
G1 X100.111 Y139.479 E.00053
G1 X102.57 Y139.479 E.00874
G1 X102.57 Y139.329 E.00053
G1 X100.111 Y139.329 E.00874
G1 X100.111 Y139.179 E.00053
G1 X102.637 Y139.179 E.00898
; WIPE_START
G1 F24000
G1 X100.637 Y139.179 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.057 J1.216 P1  F30000
G1 X145.766 Y137.077 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.527 Y135.552 E.13051
G1 X149.534 Y139.123 E.11483
G1 X149.542 Y143.809 E.1507
G1 X145.779 Y143.817 E.12102
G1 X145.766 Y137.137 E.21478
; WIPE_START
G1 F24000
G1 X147.609 Y136.361 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.501 J1.109 P1  F30000
G1 X152.616 Y138.625 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X155.728 Y139.873 E.10783
G1 X156.382 Y140.136 E.02268
G1 X156.389 Y143.797 E.11773
G1 X152.626 Y143.804 E.12102
G1 X152.616 Y138.685 E.16461
; WIPE_START
G1 F24000
G1 X154.484 Y139.398 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.199 J-.208 P1  F30000
G1 X152.596 Y128.516 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X156.36 Y128.509 E.12104
G1 X156.374 Y135.91 E.23799
G1 X156.376 Y136.767 E.02756
G1 X152.609 Y135.256 E.1305
G1 X152.597 Y128.576 E.2148
; WIPE_START
G1 F24000
G1 X154.596 Y128.54 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.002 J-1.217 P1  F30000
G1 X145.75 Y128.529 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X149.514 Y128.522 E.12102
G1 X149.52 Y131.683 E.10166
G1 X149.52 Y132.183 E.01606
G1 X145.759 Y133.707 E.1305
G1 X145.75 Y128.589 E.16459
; WIPE_START
G1 F24000
G1 X147.75 Y128.553 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.754 J-.955 P1  F30000
G1 X138.603 Y121.326 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.613 Y121.314 E.00048
G3 X149.319 Y116.951 I12.494 J15.341 E.34943
G3 X152.8 Y116.943 I1.795 J22.08 E.10382
G3 X137.726 Y122.082 I-1.693 J19.713 E3.21469
G1 X138.557 Y121.365 E.03268
M204 S10000
; WIPE_START
G1 F24000
G1 X138.613 Y121.314 E-.02886
G1 X139.546 Y120.602 E-.44572
G1 X140.168 Y120.182 E-.28542
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.991 J.706 P1  F30000
G1 X148.763 Y132.25 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X149.297 Y131.715 E.02251
G1 X149.296 Y131.183
G1 X147.866 Y132.613 E.06025
G1 X146.969 Y132.977
G1 X149.295 Y130.651 E.09799
G1 X149.294 Y130.119
G1 X146.072 Y133.341 E.13572
G1 X145.98 Y132.899
G1 X149.293 Y129.586 E.13955
G1 X149.292 Y129.054
G1 X145.979 Y132.367 E.13955
G1 X145.978 Y131.834
G1 X149.068 Y128.745 E.13014
G1 X148.534 Y128.746
G1 X145.977 Y131.302 E.10767
G1 X145.977 Y130.77
G1 X147.999 Y128.747 E.08521
G1 X147.465 Y128.748
G1 X145.976 Y130.238 E.06274
G1 X145.975 Y129.705
G1 X146.931 Y128.749 E.04028
G1 X146.396 Y128.75
G1 X145.974 Y129.173 E.01781
M204 S10000
; WIPE_START
G1 F24000
G1 X146.396 Y128.75 E-.22723
G1 X146.931 Y128.749 E-.20303
G1 X146.317 Y129.363 E-.32974
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.646 J1.031 P1  F30000
G1 X156.151 Y135.527 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X155.501 Y136.177 E.02737
G1 X155.121 Y136.024
G1 X156.15 Y134.994 E.04336
G1 X156.149 Y134.462
G1 X154.74 Y135.871 E.05935
G1 X154.36 Y135.719
G1 X156.148 Y133.93 E.07534
G1 X156.147 Y133.398
G1 X153.979 Y135.566 E.09133
G1 X153.598 Y135.413
G1 X156.146 Y132.865 E.10732
G1 X156.145 Y132.333
G1 X153.218 Y135.261 E.12331
G1 X152.837 Y135.108
G1 X156.144 Y131.801 E.1393
G1 X156.143 Y131.269
G1 X152.831 Y134.581 E.13955
G1 X152.829 Y134.049
G1 X156.142 Y130.736 E.13955
G1 X156.141 Y130.204
G1 X152.828 Y133.517 E.13955
G1 X152.827 Y132.985
G1 X156.14 Y129.672 E.13955
G1 X156.139 Y129.139
G1 X152.826 Y132.452 E.13955
G1 X152.825 Y131.92
G1 X156.013 Y128.732 E.13429
G1 X155.479 Y128.733
G1 X152.824 Y131.388 E.11183
G1 X152.823 Y130.856
G1 X154.945 Y128.734 E.08937
G1 X154.411 Y128.735
G1 X152.822 Y130.323 E.06691
G1 X152.821 Y129.791
M73 P69 R7
G1 X153.876 Y128.736 E.04444
G1 X153.342 Y128.737
G1 X152.82 Y129.259 E.02198
M204 S10000
; WIPE_START
G1 F24000
G1 X153.342 Y128.737 E-.2804
G1 X153.876 Y128.736 E-.20302
G1 X153.362 Y129.251 E-.27657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.192 J.244 P1  F30000
G1 X156.165 Y142.979 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X155.568 Y143.576 E.02516
G1 X155.034 Y143.577
G1 X156.164 Y142.446 E.04762
G1 X156.163 Y141.914
G1 X154.499 Y143.578 E.07009
G1 X153.965 Y143.579
G1 X156.162 Y141.382 E.09255
G1 X156.161 Y140.849
G1 X153.431 Y143.58 E.11502
G1 X152.897 Y143.581
G1 X156.16 Y140.317 E.13748
G1 X155.802 Y140.142
G1 X152.847 Y143.097 E.12448
G1 X152.846 Y142.565
G1 X155.421 Y139.99 E.1085
G1 X155.041 Y139.837
G1 X152.845 Y142.033 E.09251
G1 X152.844 Y141.501
G1 X154.66 Y139.684 E.07652
G1 X154.279 Y139.532
G1 X152.843 Y140.969 E.06053
G1 X152.841 Y140.436
G1 X153.899 Y139.379 E.04454
G1 X153.518 Y139.226
G1 X152.84 Y139.904 E.02855
M204 S10000
; WIPE_START
G1 F24000
G1 X153.518 Y139.226 E-.36426
G1 X153.899 Y139.379 E-.15583
G1 X153.452 Y139.825 E-.23992
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.748 J-.96 P1  F30000
G1 X148.622 Y143.589 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X149.318 Y142.893 E.02931
G1 X149.317 Y142.361
G1 X148.088 Y143.59 E.05177
G1 X147.554 Y143.591
G1 X149.316 Y141.828 E.07424
G1 X149.315 Y141.296
G1 X147.02 Y143.592 E.0967
G1 X146.485 Y143.593
G1 X149.314 Y140.764 E.11917
G1 X149.313 Y140.232
G1 X146.001 Y143.544 E.13954
G1 X146 Y143.012
G1 X149.312 Y139.699 E.13954
G1 X149.311 Y139.167
G1 X145.999 Y142.48 E.13954
G1 X145.998 Y141.947
G1 X149.31 Y138.635 E.13954
G1 X149.309 Y138.103
G1 X145.997 Y141.415 E.13954
G1 X145.996 Y140.883
G1 X149.308 Y137.57 E.13955
G1 X149.307 Y137.038
G1 X145.994 Y140.351 E.13955
G1 X145.993 Y139.819
G1 X149.306 Y136.506 E.13955
G1 X149.305 Y135.974
G1 X145.992 Y139.286 E.13955
G1 X145.991 Y138.754
G1 X148.562 Y136.183 E.10829
G1 X147.665 Y136.547
G1 X145.99 Y138.222 E.07055
G1 X145.989 Y137.69
G1 X146.768 Y136.911 E.03281
M204 S10000
; WIPE_START
G1 F24000
G1 X145.989 Y137.69 E-.41852
G1 X145.99 Y138.222 E-.20225
G1 X146.249 Y137.963 E-.13924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.048 J-1.216 P1  F30000
G1 X131.687 Y137.383 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.335546
G1 F15000
G1 X131.666 Y136.692 E.01599
G3 X133.332 Y144.537 I19.443 J-.031 E2.63715
G1 X132.895 Y143.466 E.02674
G1 X132.524 Y142.374 E.02664
G1 X132.218 Y141.263 E.02664
G1 X131.98 Y140.14 E.02654
G1 X131.806 Y138.992 E.02684
G1 X131.702 Y137.848 E.02654
G1 X131.689 Y137.443 E.00937
; WIPE_START
G1 F24000
G1 X131.666 Y136.692 E-.28563
G1 X131.697 Y135.544 E-.43633
G1 X131.706 Y135.445 E-.03804
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.593 J1.063 P1  F30000
G1 X162.165 Y152.444 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
G1 X166.89 Y147.719 E.19905
M204 S10000
G1 X167.828 Y146.247 F30000
M204 S2000
G1 F6000
G1 X160.704 Y153.371 E.30008
M204 S10000
G1 X159.563 Y153.979 F30000
M204 S2000
G1 F6000
G1 X168.425 Y145.117 E.37332
G1 X168.871 Y144.138
G1 X158.589 Y154.42 E.43312
G1 X157.716 Y154.76
G1 X169.222 Y143.254 E.48469
G1 X169.492 Y142.45
G1 X156.908 Y155.034 E.53009
G1 X156.146 Y155.263
G1 X169.708 Y141.701 E.57129
G1 X169.892 Y140.984
G1 X155.441 Y155.435 E.60875
G1 X154.765 Y155.578
G1 X170.032 Y140.31 E.64314
G1 X170.144 Y139.665
G1 X154.113 Y155.696 E.67531
G1 X153.498 Y155.778
G1 X170.236 Y139.04 E.7051
G1 X170.296 Y138.446
G1 X152.891 Y155.851 E.73318
G1 X152.321 Y155.888
G1 X170.347 Y137.862 E.75934
G1 X170.368 Y137.308
G1 X151.753 Y155.923 E.78416
G1 X151.217 Y155.926
G1 X170.384 Y136.759 E.80739
G1 X170.375 Y136.234
G1 X150.683 Y155.927 E.82953
G1 X150.173 Y155.904
G1 X170.359 Y135.717 E.85034
G1 X170.327 Y135.216
G1 X149.668 Y155.875 E.87025
G1 X149.179 Y155.831
G1 X170.283 Y134.727 E.889
G1 X170.233 Y134.244
G1 X148.701 Y155.775 E.907
G1 X148.228 Y155.715
G1 X170.163 Y133.781 E.92399
G1 X170.093 Y133.317
G1 X147.775 Y155.635 E.94011
G1 X147.322 Y155.554
G1 X170.004 Y132.872 E.95546
G1 X169.911 Y132.433
G1 X146.885 Y155.458 E.96995
G1 X146.455 Y155.355
G1 X169.812 Y131.998 E.98392
G1 X169.697 Y131.58
G1 X146.027 Y155.25 E.9971
G1 X145.618 Y155.126
G1 X169.582 Y131.162 E1.00949
G1 X169.455 Y130.756
G1 X156.611 Y143.599 E.54103
G1 X156.61 Y143.067
G1 X169.319 Y130.358 E.53537
G1 X169.184 Y129.96
G1 X156.609 Y142.535 E.52971
G1 X156.608 Y142.002
G1 X169.032 Y129.579 E.52334
G1 X168.877 Y129.2
G1 X156.607 Y141.47 E.51687
G1 X156.606 Y140.938
G1 X168.721 Y128.823 E.51033
G1 X168.548 Y128.462
G1 X156.605 Y140.405 E.50311
G1 X156.524 Y139.953
G1 X168.376 Y128.102 E.49923
G1 X168.199 Y127.745
G1 X156.144 Y139.8 E.50782
G1 X155.763 Y139.648
G1 X168.009 Y127.402 E.51585
G1 X167.819 Y127.059
G1 X155.383 Y139.495 E.52387
G1 X155.002 Y139.342
G1 X167.623 Y126.721 E.53167
G1 X167.417 Y126.395
G1 X154.621 Y139.19 E.53899
G1 X154.241 Y139.037
G1 X156.301 Y136.977 E.08679
G1 X155.921 Y136.824
G1 X153.86 Y138.884 E.08679
G1 X153.48 Y138.732
G1 X155.54 Y136.671 E.08679
G1 X155.159 Y136.519
G1 X153.099 Y138.579 E.08679
G1 X152.719 Y138.426
G1 X154.779 Y136.366 E.08679
M204 S10000
G1 X156.598 Y136.68 F30000
M204 S2000
G1 F6000
G1 X167.21 Y126.068 E.447
G1 X166.997 Y125.748
G1 X156.597 Y136.147 E.43808
G1 X156.596 Y135.615
G1 X166.773 Y125.438 E.42871
G1 X166.55 Y125.128
G1 X156.595 Y135.083 E.41935
G1 X156.594 Y134.551
G1 X166.321 Y124.824 E.40973
G1 X166.081 Y124.53
G1 X156.593 Y134.018 E.39968
G1 X156.592 Y133.486
G1 X165.842 Y124.236 E.38964
G1 X165.597 Y123.948
M73 P70 R7
G1 X156.591 Y132.954 E.37936
G1 X156.59 Y132.421
G1 X165.342 Y123.67 E.36865
G1 X165.086 Y123.392
G1 X156.589 Y131.889 E.35793
G1 X156.588 Y131.357
G1 X164.826 Y123.119 E.347
G1 X164.555 Y122.857
G1 X156.587 Y130.825 E.33562
G1 X156.586 Y130.292
G1 X164.283 Y122.595 E.32424
G1 X164.007 Y122.338
G1 X156.585 Y129.76 E.31266
G1 X156.584 Y129.228
G1 X163.721 Y122.091 E.30062
G1 X163.434 Y121.845
G1 X156.583 Y128.696 E.28857
G1 X156.459 Y128.286
G1 X163.142 Y121.603 E.28152
G1 X162.839 Y121.373
G1 X155.925 Y128.287 E.29126
G1 X155.391 Y128.288
G1 X162.536 Y121.143 E.30101
G1 X162.229 Y120.917
G1 X154.856 Y128.289 E.31056
G1 X154.322 Y128.29
G1 X161.909 Y120.703 E.31962
G1 X161.59 Y120.489
G1 X153.788 Y128.291 E.32868
G1 X153.253 Y128.292
G1 X161.266 Y120.28 E.33752
G1 X160.93 Y120.082
G1 X152.719 Y128.293 E.34588
M204 S10000
; WIPE_START
G1 F24000
G1 X154.133 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.208 J.145 P1  F30000
G1 X156.191 Y144.019 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X145.208 Y155.002 E.46263
G1 X144.808 Y154.869
G1 X155.657 Y144.02 E.45701
G1 X155.122 Y144.021
G1 X144.418 Y154.725 E.4509
G1 X144.029 Y154.582
G1 X154.588 Y144.022 E.4448
G1 X154.054 Y144.023
G1 X143.652 Y154.425 E.43817
G1 X143.281 Y154.263
G1 X153.52 Y144.024 E.43128
G1 X152.985 Y144.025
G1 X142.91 Y154.1 E.4244
G1 X142.555 Y153.922
G1 X152.451 Y144.026 E.41687
G1 X152.403 Y143.541
G1 X142.202 Y153.742 E.42971
G1 X141.849 Y153.562
G1 X152.402 Y143.009 E.44453
G1 X152.401 Y142.477
G1 X141.513 Y153.365 E.45865
G1 X141.177 Y153.167
G1 X152.4 Y141.945 E.47275
G1 X152.399 Y141.412
G1 X140.842 Y152.969 E.48683
G1 X140.523 Y152.755
G1 X149.245 Y144.032 E.36744
G1 X148.711 Y144.033
G1 X140.203 Y152.541 E.35838
G1 X139.885 Y152.326
G1 X148.177 Y144.034 E.34927
G1 X147.643 Y144.035
G1 X139.582 Y152.096 E.33953
G1 X139.28 Y151.865
G1 X147.108 Y144.036 E.32978
G1 X146.574 Y144.037
G1 X138.978 Y151.634 E.31999
G1 X138.691 Y151.387
G1 X146.04 Y144.038 E.30957
G1 X145.557 Y143.988
G1 X138.404 Y151.141 E.30132
G1 X138.118 Y150.894
G1 X145.556 Y143.456 E.31333
G1 X145.555 Y142.924
G1 X137.846 Y150.632 E.32471
G1 X137.575 Y150.37
G1 X145.554 Y142.391 E.33608
G1 X145.553 Y141.859
G1 X137.305 Y150.107 E.34745
G1 X137.049 Y149.829
G1 X145.552 Y141.327 E.35816
G1 X145.551 Y140.795
G1 X136.794 Y149.551 E.36887
G1 X136.539 Y149.273
G1 X145.55 Y140.262 E.37958
G1 X145.548 Y139.73
G1 X136.299 Y148.98 E.38962
G1 X136.06 Y148.686
G1 X145.547 Y139.198 E.39967
G1 X145.546 Y138.666
G1 X135.82 Y148.392 E.40971
G1 X135.597 Y148.082
G1 X145.545 Y138.134 E.41909
G1 X145.544 Y137.601
G1 X135.373 Y147.772 E.42845
G1 X135.15 Y147.462
G1 X145.543 Y137.069 E.43781
M204 S10000
G1 X149.764 Y143.514 F30000
M204 S2000
G1 F6000
G1 X152.398 Y140.88 E.11093
G1 X152.397 Y140.348
G1 X149.763 Y142.981 E.11093
G1 X149.762 Y142.449
G1 X152.395 Y139.816 E.11093
G1 X152.394 Y139.284
G1 X149.761 Y141.917 E.11093
G1 X149.76 Y141.385
G1 X152.393 Y138.751 E.11092
M204 S10000
; WIPE_START
G1 F24000
G1 X150.979 Y140.166 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.92 J.796 P1  F30000
G1 X154.398 Y136.213 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X149.759 Y140.852 E.19542
G1 X149.758 Y140.32
G1 X154.018 Y136.061 E.17943
G1 X153.637 Y135.908
G1 X149.757 Y139.788 E.16344
G1 X149.756 Y139.255
G1 X153.256 Y135.755 E.14745
G1 X152.876 Y135.603
G1 X149.755 Y138.723 E.13146
G1 X149.754 Y138.191
G1 X152.495 Y135.45 E.11547
G1 X152.387 Y135.025
G1 X149.753 Y137.659 E.11093
G1 X149.752 Y137.126
G1 X152.386 Y134.493 E.11093
G1 X152.385 Y133.961
G1 X149.751 Y136.594 E.11093
G1 X149.75 Y136.062
G1 X152.383 Y133.428 E.11093
G1 X152.382 Y132.896
G1 X149.749 Y135.53 E.11093
G1 X149.37 Y135.376
G1 X152.381 Y132.364 E.12688
G1 X152.38 Y131.832
G1 X148.472 Y135.74 E.16462
G1 X147.575 Y136.103
G1 X152.379 Y131.3 E.20236
G1 X152.378 Y130.767
G1 X146.678 Y136.467 E.24011
G1 X145.781 Y136.831
G1 X152.377 Y130.235 E.27785
G1 X152.376 Y129.703
G1 X134.943 Y147.136 E.73438
M73 P71 R7
G1 X134.736 Y146.81
G1 X148.853 Y132.693 E.59465
G1 X147.956 Y133.057
G1 X134.53 Y146.483 E.56557
G1 X134.34 Y146.14
G1 X147.059 Y133.421 E.53579
G1 X146.162 Y133.784
G1 X134.149 Y145.797 E.50602
G1 X133.961 Y145.451
G1 X145.537 Y133.875 E.48763
G1 X145.536 Y133.343
G1 X133.789 Y145.091 E.49486
G1 X133.616 Y144.73
G1 X145.535 Y132.811 E.50209
G1 X145.534 Y132.278
G1 X133.448 Y144.365 E.50912
G1 X133.294 Y143.986
G1 X145.533 Y131.746 E.51559
G1 X145.533 Y131.214
G1 X133.139 Y143.607 E.52206
G1 X132.994 Y143.219
G1 X145.532 Y130.682 E.52815
G1 X145.531 Y130.149
G1 X132.858 Y142.821 E.53381
G1 X132.723 Y142.423
G1 X145.53 Y129.617 E.53947
G1 X145.529 Y129.085
G1 X132.603 Y142.01 E.54449
G1 X132.488 Y141.592
G1 X145.528 Y128.552 E.5493
M204 S10000
G1 X149.742 Y131.804 F30000
M204 S2000
G1 F6000
G1 X152.375 Y129.171 E.11092
G1 X152.374 Y128.638
G1 X149.741 Y131.271 E.11092
G1 X149.74 Y130.739
G1 X160.594 Y119.885 E.45723
G1 X160.252 Y119.694
G1 X149.739 Y130.207 E.44285
G1 X149.738 Y129.675
G1 X159.899 Y119.514 E.42802
G1 X159.546 Y119.333
G1 X149.737 Y129.142 E.4132
G1 X149.736 Y128.61
G1 X159.184 Y119.162 E.398
G1 X158.813 Y118.999
G1 X149.513 Y128.299 E.39176
G1 X148.979 Y128.3
G1 X158.443 Y118.837 E.39864
G1 X158.059 Y118.687
G1 X148.445 Y128.301 E.405
G1 X147.911 Y128.302
G1 X157.67 Y118.543 E.4111
G1 X157.28 Y118.4
G1 X147.376 Y128.303 E.4172
G1 X146.842 Y128.304
G1 X156.873 Y118.274 E.42253
G1 X156.463 Y118.15
G1 X146.308 Y128.305 E.4278
G1 X145.774 Y128.306
G1 X156.049 Y118.031 E.43285
G1 X155.619 Y117.928
G1 X132.375 Y141.172 E.97913
G1 X132.282 Y140.732
G1 X155.189 Y117.825 E.96494
G1 X154.743 Y117.737
G1 X132.188 Y140.292 E.95012
G1 X132.108 Y139.839
G1 X154.29 Y117.656 E.93441
G1 X153.833 Y117.581
G1 X132.038 Y139.375 E.9181
G1 X131.972 Y138.909
G1 X153.356 Y117.525 E.90079
G1 X152.878 Y117.469
G1 X131.927 Y138.42 E.88256
G1 X131.883 Y137.931
G1 X152.379 Y117.435 E.86341
G1 X151.875 Y117.406
G1 X131.861 Y137.42 E.84308
G1 X131.845 Y136.903
G1 X151.354 Y117.393 E.82183
G1 X150.82 Y117.394
G1 X131.847 Y136.367 E.79921
G1 X131.863 Y135.818
G1 X150.272 Y117.409 E.77548
G1 X149.704 Y117.444
G1 X131.896 Y135.251 E.75013
G1 X131.947 Y134.667
G1 X149.12 Y117.494 E.72339
G1 X148.513 Y117.568
G1 X132.022 Y134.059 E.6947
G1 X132.114 Y133.434
G1 X147.883 Y117.665 E.66424
G1 X147.231 Y117.784
G1 X132.243 Y132.771 E.63136
G1 X132.39 Y132.092
G1 X146.536 Y117.945 E.59591
M73 P71 R6
G1 X145.816 Y118.132
G1 X132.588 Y131.36 E.55721
G1 X132.829 Y130.585
G1 X145.046 Y118.369 E.51461
G1 X144.209 Y118.672
G1 X133.122 Y129.76 E.46706
G1 X133.49 Y128.858
G1 X143.299 Y119.049 E.41319
G1 X142.274 Y119.541
G1 X133.978 Y127.837 E.34946
M204 S10000
G1 X134.677 Y126.604 F30000
M204 S2000
G1 F6000
G1 X141.058 Y120.223 E.26879
M204 S10000
G1 X134.738 Y126.665 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.227389
G1 F15000
G1 X134.639 Y126.789 E.00232
; LINE_WIDTH: 0.202178
G1 X134.54 Y126.914 E.002
; LINE_WIDTH: 0.176966
G1 X134.439 Y127.048 E.00178
; LINE_WIDTH: 0.132568
G1 X134.337 Y127.183 E.00119
G1 X134.039 Y127.897 F30000
; LINE_WIDTH: 0.218583
G1 F15000
G1 X133.944 Y128.032 E.00229
; LINE_WIDTH: 0.175112
G1 X133.849 Y128.166 E.00172
; LINE_WIDTH: 0.13164
G1 X133.754 Y128.301 E.00115
; WIPE_START
G1 F24000
G1 X133.849 Y128.166 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.862 J.859 P1  F30000
G1 X159.501 Y153.918 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.218763
G1 F15000
G1 X159.407 Y153.987 E.00162
; LINE_WIDTH: 0.210187
G1 X159.309 Y154.054 E.00157
; LINE_WIDTH: 0.169515
G1 X159.211 Y154.121 E.00119
; LINE_WIDTH: 0.128843
G1 X159.114 Y154.188 E.0008
G1 X160.643 Y153.31 F30000
; LINE_WIDTH: 0.224767
G1 F15000
G1 X160.426 Y153.479 E.00395
; LINE_WIDTH: 0.179073
G1 X160.298 Y153.572 E.00171
; LINE_WIDTH: 0.133621
G1 X160.17 Y153.666 E.00114
G1 X162.104 Y152.383 F30000
; LINE_WIDTH: 0.230778
G1 F15000
G1 X161.882 Y152.567 E.00428
; LINE_WIDTH: 0.183242
G1 X161.659 Y152.751 E.0032
; LINE_WIDTH: 0.135706
G1 X161.436 Y152.934 E.00212
G1 X165.918 Y148.988 F30000
; LINE_WIDTH: 0.0881697
G1 F15000
M73 P72 R6
G1 X165.724 Y149.204 E.00104
; LINE_WIDTH: 0.116382
G1 X165.33 Y149.616 E.00331
; LINE_WIDTH: 0.160432
G3 X164.125 Y150.83 I-21.064 J-19.715 E.01588
; LINE_WIDTH: 0.154493
G1 X163.78 Y151.15 E.00415
; LINE_WIDTH: 0.121331
G1 X163.435 Y151.471 E.00292
G1 X167.364 Y147.007 F30000
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X167.22 Y147.187 E.00083
; LINE_WIDTH: 0.137325
G1 X167.076 Y147.368 E.00172
; LINE_WIDTH: 0.186479
G1 X166.83 Y147.658 E.00431
G1 X168.117 Y145.719 F30000
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X168 Y145.875 E.0007
; LINE_WIDTH: 0.132576
G1 X167.884 Y146.03 E.00138
; LINE_WIDTH: 0.176981
G1 X167.767 Y146.186 E.00206
; WIPE_START
G1 F24000
G1 X167.884 Y146.03 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.91 J-.808 P1  F30000
G1 X143.731 Y118.858 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X143.607 Y118.942 E.00053
; LINE_WIDTH: 0.129697
G1 X143.484 Y119.027 E.00103
; LINE_WIDTH: 0.171223
G1 X143.361 Y119.112 E.00152
G1 X141.642 Y119.878 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X141.468 Y120.013 E.00079
; LINE_WIDTH: 0.133702
G1 X141.294 Y120.149 E.00158
; LINE_WIDTH: 0.179235
G1 X141.119 Y120.284 E.00238
G1 X140.207 Y120.779 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X140.04 Y120.917 E.00078
; LINE_WIDTH: 0.127436
G1 X139.872 Y121.056 E.00145
; LINE_WIDTH: 0.166705
G1 X139.586 Y121.306 E.00372
; LINE_WIDTH: 0.216636
G1 X139.3 Y121.556 E.00521
; LINE_WIDTH: 0.266566
G1 X139.015 Y121.807 E.00671
; LINE_WIDTH: 0.316498
G1 X138.599 Y122.193 E.01226
; LINE_WIDTH: 0.357467
G1 X138.184 Y122.58 E.0141
; LINE_WIDTH: 0.405767
G2 X136.595 Y124.196 I26.455 J27.605 E.06496
; LINE_WIDTH: 0.360567
G1 X136.341 Y124.477 E.00951
; LINE_WIDTH: 0.320544
G1 X136.088 Y124.759 E.00831
; LINE_WIDTH: 0.280521
G1 X135.834 Y125.041 E.00712
; LINE_WIDTH: 0.240499
G1 X135.681 Y125.222 E.0037
; LINE_WIDTH: 0.202417
G1 X135.528 Y125.403 E.00298
; LINE_WIDTH: 0.164334
G1 X135.375 Y125.583 E.00227
; LINE_WIDTH: 0.126252
G1 X135.221 Y125.764 E.00156
; WIPE_START
G1 F24000
G1 X135.375 Y125.583 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.299 J1.18 P1  F30000
G1 X145.657 Y128.19 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0913545
G1 F15000
G1 X145.412 Y128.436 E.00133
; WIPE_START
G1 F24000
G1 X145.657 Y128.19 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.217 J.003 P1  F30000
G1 X145.676 Y136.726 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.162059
G1 F15000
G1 X145.499 Y136.936 E.00259
G1 X145.557 Y137.083 E.00149
; WIPE_START
G1 F24000
G1 X145.499 Y136.936 E-.27736
G1 X145.676 Y136.726 E-.48264
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.198 J.212 P1  F30000
G1 X148.898 Y154.929 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X153.327 Y154.929 E.01574
; WIPE_START
G1 F24000
G1 X151.327 Y154.929 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.061 J1.215 P1  F30000
G1 X154.332 Y154.779 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X147.894 Y154.779 E.02289
G1 X147.129 Y154.629 F30000
G1 F3600
G1 X155.102 Y154.629 E.02834
G1 X155.718 Y154.479 F30000
G1 F3600
G1 X146.503 Y154.479 E.03276
G1 X145.964 Y154.329 F30000
G1 F3600
G1 X156.264 Y154.329 E.03661
G1 X156.752 Y154.179 F30000
G1 F3600
G1 X145.47 Y154.179 E.0401
G1 X145.024 Y154.029 F30000
G1 F3600
G1 X157.01 Y154.029 E.04261
G2 X157.414 Y153.879 I-1.062 J-3.472 E.00153
G1 X144.813 Y153.879 E.04479
G1 X144.407 Y153.729 E.00154
G1 X157.815 Y153.729 E.04766
G2 X158.189 Y153.579 I-1.077 J-3.224 E.00143
G1 X144.04 Y153.579 E.05029
G1 X143.698 Y153.429 E.00133
G1 X158.528 Y153.429 E.05272
G1 X158.866 Y153.279 E.00132
G1 X143.355 Y153.279 E.05514
G3 X143.048 Y153.129 I1.11 J-2.67 E.00122
G1 X159.181 Y153.129 E.05735
G1 X159.472 Y152.979 E.00116
G1 X142.754 Y152.979 E.05943
G1 X142.46 Y152.829 E.00117
G1 X159.763 Y152.829 E.0615
G2 X160.047 Y152.679 I-1.122 J-2.466 E.00114
G1 X142.182 Y152.679 E.0635
G1 X141.927 Y152.529 E.00105
G1 X160.299 Y152.529 E.06531
G1 X160.552 Y152.379 E.00105
G1 X141.672 Y152.379 E.06711
G1 X141.417 Y152.229 E.00105
G1 X160.805 Y152.229 E.06892
G1 X161.043 Y152.079 E.001
G1 X141.185 Y152.079 E.07059
G1 X140.962 Y151.929 E.00096
G1 X161.265 Y151.929 E.07217
G1 X161.486 Y151.779 E.00095
G1 X140.738 Y151.779 E.07375
G1 X140.515 Y151.629 E.00096
G1 X161.708 Y151.629 E.07534
G2 X161.919 Y151.479 I-1.159 J-1.85 E.00092
G1 X140.309 Y151.479 E.07682
G1 X140.112 Y151.329 E.00088
G1 X162.115 Y151.329 E.07821
G1 X162.31 Y151.179 E.00088
G1 X139.915 Y151.179 E.07961
G1 X139.717 Y151.029 E.00088
G1 X162.506 Y151.029 E.08101
G1 X162.701 Y150.879 E.00088
G1 X139.527 Y150.879 E.08238
G1 X139.353 Y150.729 E.00082
G1 X162.875 Y150.729 E.08361
G1 X163.048 Y150.579 E.00081
G1 X139.178 Y150.579 E.08485
G1 X139.003 Y150.429 E.00082
G1 X163.222 Y150.429 E.08609
G1 X163.395 Y150.279 E.00081
G1 X138.828 Y150.279 E.08733
G3 X138.665 Y150.129 I1.182 J-1.45 E.00079
G1 X163.563 Y150.129 E.0885
G1 X163.717 Y149.979 E.00076
G1 X138.51 Y149.979 E.0896
G1 X138.355 Y149.829 E.00077
G1 X163.871 Y149.829 E.0907
G1 X164.025 Y149.679 E.00076
G1 X138.2 Y149.679 E.0918
G1 X138.045 Y149.529 E.00077
G1 X164.179 Y149.529 E.0929
G2 X164.329 Y149.379 I-1.188 J-1.34 E.00075
G1 X137.899 Y149.379 E.09395
G1 X137.762 Y149.229 E.00072
G1 X164.465 Y149.229 E.09492
G1 X164.602 Y149.079 E.00072
G1 X137.624 Y149.079 E.0959
G1 X137.486 Y148.929 E.00072
G1 X164.739 Y148.929 E.09687
G1 X164.876 Y148.779 E.00072
G1 X137.348 Y148.779 E.09785
G3 X137.214 Y148.629 I1.197 J-1.208 E.00072
G1 X165.012 Y148.629 E.09881
G2 X165.136 Y148.479 I-1.203 J-1.115 E.00069
G1 X137.092 Y148.479 E.09969
G1 X136.969 Y148.329 E.00069
G1 X165.257 Y148.329 E.10055
G1 X165.378 Y148.179 E.00069
G1 X136.847 Y148.179 E.10142
G1 X136.725 Y148.029 E.00069
G1 X165.499 Y148.029 E.10228
G1 X165.621 Y147.879 E.00069
G1 X136.603 Y147.879 E.10315
G3 X136.489 Y147.729 I1.207 J-1.034 E.00067
G1 X165.739 Y147.729 E.10397
G1 X165.846 Y147.579 E.00066
G1 X136.381 Y147.579 E.10474
G1 X136.273 Y147.429 E.00066
G1 X165.953 Y147.429 E.1055
G1 X166.06 Y147.279 E.00066
G1 X136.165 Y147.279 E.10627
G1 X136.057 Y147.129 E.00066
G1 X166.167 Y147.129 E.10703
G1 X166.275 Y146.979 E.00066
G1 X135.949 Y146.979 E.1078
G3 X135.85 Y146.829 I1.214 J-.908 E.00064
G1 X166.378 Y146.829 E.10852
G1 X166.472 Y146.679 E.00063
G1 X135.755 Y146.679 E.10919
G1 X135.66 Y146.529 E.00063
G1 X166.566 Y146.529 E.10986
G1 X166.661 Y146.379 E.00063
G1 X135.565 Y146.379 E.11054
G1 X135.47 Y146.229 E.00063
G1 X166.755 Y146.229 E.11121
G1 X166.849 Y146.079 E.00063
G1 X135.375 Y146.079 E.11188
G3 X135.287 Y145.929 I1.219 J-.816 E.00062
G1 X166.941 Y145.929 E.11252
M73 P73 R6
G1 X167.023 Y145.779 E.00061
G1 X135.204 Y145.779 E.11311
G1 X135.12 Y145.629 E.00061
G1 X167.106 Y145.629 E.1137
G1 X167.188 Y145.479 E.00061
G1 X135.037 Y145.479 E.11429
G1 X134.954 Y145.329 E.00061
G1 X167.27 Y145.329 E.11487
G1 X167.353 Y145.179 E.00061
G1 X134.871 Y145.179 E.11546
G3 X134.791 Y145.029 I1.224 J-.751 E.00061
G1 X167.435 Y145.029 E.11604
G2 X167.508 Y144.879 I-1.227 J-.689 E.00059
G1 X157.544 Y144.879 E.03542
G1 X157.544 Y144.729 E.00053
G1 X167.579 Y144.729 E.03567
G1 X167.65 Y144.579 E.00059
G1 X157.543 Y144.579 E.03593
G1 X157.543 Y144.429 E.00053
G1 X167.721 Y144.429 E.03618
G1 X167.792 Y144.279 E.00059
G1 X157.543 Y144.279 E.03643
G1 X157.543 Y144.129 E.00053
G1 X167.864 Y144.129 E.03669
G2 X167.932 Y143.979 I-1.23 J-.648 E.00059
G1 X157.542 Y143.979 E.03693
G1 X157.542 Y143.829 E.00053
G1 X167.992 Y143.829 E.03715
G1 X168.053 Y143.679 E.00057
G1 X157.542 Y143.679 E.03736
G1 X157.541 Y143.529 E.00053
G1 X168.113 Y143.529 E.03758
G1 X168.174 Y143.379 E.00057
G1 X157.541 Y143.379 E.03779
G1 X157.541 Y143.229 E.00053
G1 X168.234 Y143.229 E.03801
G1 X168.295 Y143.079 E.00057
G1 X157.541 Y143.079 E.03823
G1 X157.54 Y142.929 E.00053
G1 X168.349 Y142.929 E.03842
G1 X168.4 Y142.779 E.00056
G1 X157.54 Y142.779 E.0386
G1 X157.54 Y142.629 E.00053
G1 X168.45 Y142.629 E.03878
G1 X168.501 Y142.479 E.00056
G1 X157.539 Y142.479 E.03896
G1 X157.539 Y142.329 E.00053
G1 X168.551 Y142.329 E.03914
G1 X168.601 Y142.179 E.00056
G1 X157.539 Y142.179 E.03932
G1 X157.539 Y142.029 E.00053
G1 X168.652 Y142.029 E.0395
G2 X168.695 Y141.879 I-1.766 J-.595 E.00056
G1 X157.538 Y141.879 E.03966
G1 X157.538 Y141.729 E.00053
G1 X168.736 Y141.729 E.03981
G1 X168.777 Y141.579 E.00055
G1 X157.538 Y141.579 E.03995
G1 X157.538 Y141.429 E.00053
G1 X168.817 Y141.429 E.0401
M73 P74 R6
G1 X168.858 Y141.279 E.00055
G1 X157.537 Y141.279 E.04024
G1 X157.537 Y141.129 E.00053
G1 X168.899 Y141.129 E.04039
G1 X168.939 Y140.979 E.00055
G1 X157.537 Y140.979 E.04053
G1 X157.536 Y140.829 E.00053
G1 X168.974 Y140.829 E.04066
G1 X169.005 Y140.679 E.00054
G1 X157.536 Y140.679 E.04077
G1 X157.536 Y140.529 E.00053
G1 X169.036 Y140.529 E.04088
G1 X169.067 Y140.379 E.00054
G1 X157.536 Y140.379 E.04099
G1 X157.535 Y140.229 E.00053
G1 X169.099 Y140.229 E.0411
G1 X169.13 Y140.079 E.00054
G1 X157.535 Y140.079 E.04122
G1 X157.535 Y139.929 E.00053
G1 X169.161 Y139.929 E.04133
G2 X169.187 Y139.779 I-1.251 J-.292 E.00054
G1 X157.534 Y139.779 E.04142
G1 X157.534 Y139.629 E.00053
G1 X169.209 Y139.629 E.0415
G1 X169.231 Y139.479 E.00054
G1 X157.534 Y139.479 E.04158
G1 X157.534 Y139.355 E.00044
G1 X157.469 Y139.329 E.00025
G1 X169.253 Y139.329 E.04189
G1 X169.275 Y139.179 E.00054
G1 X157.095 Y139.179 E.0433
G1 X156.721 Y139.029 E.00143
G1 X169.297 Y139.029 E.0447
G1 X169.32 Y138.879 E.00054
G1 X156.347 Y138.879 E.04611
G1 X155.973 Y138.729 E.00143
G1 X169.338 Y138.729 E.04751
G1 X169.351 Y138.579 E.00054
G1 X155.599 Y138.579 E.04888
G1 X155.226 Y138.429 E.00143
G1 X169.364 Y138.429 E.05026
G1 X169.377 Y138.279 E.00054
G1 X157.532 Y138.279 E.04211
G1 X157.531 Y138.129 E.00053
G1 X169.39 Y138.129 E.04215
G1 X169.403 Y137.979 E.00054
G1 X157.531 Y137.979 E.0422
G1 X157.531 Y137.829 E.00053
G1 X169.416 Y137.829 E.04225
G2 X169.427 Y137.679 I-1.258 J-.169 E.00053
G1 X157.53 Y137.679 E.04229
G1 X157.53 Y137.529 E.00053
G1 X169.432 Y137.529 E.04231
G1 X169.436 Y137.379 E.00053
G1 X157.53 Y137.379 E.04232
G1 X157.53 Y137.229 E.00053
G1 X169.44 Y137.229 E.04234
G1 X169.444 Y137.079 E.00053
G1 X157.529 Y137.079 E.04235
G1 X157.529 Y136.929 E.00053
G1 X169.448 Y136.929 E.04237
G1 X169.452 Y136.779 E.00053
G1 X157.529 Y136.779 E.04238
G1 X157.528 Y136.629 E.00053
G1 X169.457 Y136.625 E.0424
G1 X169.452 Y136.479 E.00052
G1 X157.528 Y136.479 E.04239
G1 X157.528 Y136.329 E.00053
G1 X169.447 Y136.329 E.04237
G1 X169.443 Y136.179 E.00053
G1 X157.528 Y136.179 E.04235
G1 X157.527 Y136.029 E.00053
G1 X169.438 Y136.029 E.04234
G1 X169.433 Y135.879 E.00053
G1 X157.527 Y135.879 E.04232
G1 X157.527 Y135.729 E.00053
G1 X169.428 Y135.729 E.04231
G1 X169.424 Y135.579 E.00053
G1 X157.527 Y135.579 E.04229
G1 X157.526 Y135.429 E.00053
G1 X169.412 Y135.429 E.04225
G1 X169.399 Y135.279 E.00054
G1 X157.526 Y135.279 E.0422
G1 X157.526 Y135.129 E.00053
G1 X169.385 Y135.129 E.04216
G1 X169.371 Y134.979 E.00054
G1 X157.525 Y134.979 E.04211
G1 X157.525 Y134.829 E.00053
G1 X169.358 Y134.829 E.04206
G1 X169.344 Y134.679 E.00054
G1 X157.525 Y134.679 E.04201
G1 X157.525 Y134.529 E.00053
G1 X169.33 Y134.529 E.04197
G2 X169.312 Y134.379 I-1.273 J.079 E.00054
G1 X157.524 Y134.379 E.0419
G1 X157.524 Y134.229 E.00053
G1 X169.29 Y134.229 E.04182
G1 X169.267 Y134.079 E.00054
G1 X157.524 Y134.079 E.04174
G1 X157.523 Y133.929 E.00053
G1 X169.244 Y133.929 E.04166
G1 X169.221 Y133.779 E.00054
G1 X157.523 Y133.779 E.04158
G1 X157.523 Y133.629 E.00053
G1 X169.199 Y133.629 E.0415
G1 X169.176 Y133.479 E.00054
G1 X157.523 Y133.479 E.04142
G1 X157.522 Y133.329 E.00053
G1 X169.15 Y133.329 E.04133
G1 X169.118 Y133.179 E.00055
G1 X157.522 Y133.179 E.04122
G1 X157.522 Y133.029 E.00053
G1 X169.087 Y133.029 E.04111
G1 X169.055 Y132.879 E.00055
G1 X157.521 Y132.879 E.041
G1 X157.521 Y132.729 E.00053
G1 X169.023 Y132.729 E.04088
G1 X168.991 Y132.579 E.00055
G1 X157.521 Y132.579 E.04077
G1 X157.521 Y132.429 E.00053
G1 X168.959 Y132.429 E.04066
G2 X168.925 Y132.279 I-1.281 J.214 E.00055
G1 X157.52 Y132.279 E.04054
G1 X157.52 Y132.129 E.00053
G1 X168.883 Y132.129 E.04039
G1 X168.842 Y131.979 E.00055
G1 X157.52 Y131.979 E.04025
G1 X157.519 Y131.829 E.00053
G1 X168.801 Y131.829 E.0401
G1 X168.76 Y131.679 E.00055
G1 X157.519 Y131.679 E.03996
G1 X157.519 Y131.529 E.00053
G1 X168.718 Y131.529 E.03981
G1 X168.677 Y131.379 E.00055
G1 X157.519 Y131.379 E.03966
G1 X157.518 Y131.229 E.00053
G1 X168.633 Y131.229 E.03951
M73 P75 R6
G1 X168.582 Y131.079 E.00056
G1 X157.518 Y131.079 E.03933
G1 X157.518 Y130.929 E.00053
G1 X168.531 Y130.929 E.03915
G1 X168.48 Y130.779 E.00056
G1 X157.517 Y130.779 E.03897
G1 X157.517 Y130.629 E.00053
G1 X168.429 Y130.629 E.03879
G1 X168.378 Y130.479 E.00056
G1 X157.517 Y130.479 E.03861
G1 X157.517 Y130.329 E.00053
G1 X168.327 Y130.329 E.03843
G2 X168.272 Y130.179 I-1.291 J.39 E.00057
G1 X157.516 Y130.179 E.03823
G1 X157.516 Y130.029 E.00053
G1 X168.211 Y130.029 E.03802
G1 X168.15 Y129.879 E.00058
G1 X157.516 Y129.879 E.0378
G1 X157.516 Y129.729 E.00053
G1 X168.088 Y129.729 E.03758
G1 X168.027 Y129.579 E.00058
G1 X157.515 Y129.579 E.03737
G1 X157.515 Y129.429 E.00053
G1 X167.966 Y129.429 E.03715
G1 X167.905 Y129.279 E.00058
G1 X157.515 Y129.279 E.03693
G1 X157.514 Y129.129 E.00053
G1 X167.836 Y129.129 E.03669
G1 X167.765 Y128.979 E.00059
G1 X157.514 Y128.979 E.03644
G1 X157.514 Y128.829 E.00053
G1 X167.693 Y128.829 E.03618
G1 X167.621 Y128.679 E.00059
G1 X157.514 Y128.679 E.03593
G1 X157.513 Y128.529 E.00053
G1 X167.549 Y128.529 E.03567
G1 X167.477 Y128.379 E.00059
G1 X157.513 Y128.379 E.03542
G1 X157.513 Y128.229 E.00053
G1 X167.404 Y128.229 E.03516
G1 X167.321 Y128.079 E.00061
G1 X157.512 Y128.079 E.03487
G1 X157.512 Y127.929 E.00053
G1 X167.238 Y127.929 E.03457
G1 X167.155 Y127.779 E.00061
G1 X157.512 Y127.779 E.03428
G1 X157.512 Y127.629 E.00053
G1 X167.072 Y127.629 E.03398
G1 X166.988 Y127.479 E.00061
G1 X157.444 Y127.479 E.03393
; WIPE_START
G1 F24000
G1 X159.444 Y127.479 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.192 J-.244 P1  F30000
G1 X157.231 Y138.279 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X154.852 Y138.279 E.00846
G1 X154.478 Y138.129 E.00143
G1 X156.676 Y138.129 E.00781
G1 X156.302 Y137.979 E.00143
G1 X154.104 Y137.979 E.00781
G1 X153.73 Y137.829 E.00143
G1 X155.928 Y137.829 E.00781
G1 X155.554 Y137.679 E.00143
G1 X153.356 Y137.679 E.00781
G1 X152.982 Y137.529 E.00143
G1 X155.18 Y137.529 E.00781
G1 X154.806 Y137.379 E.00143
G1 X152.608 Y137.379 E.00781
G1 X152.234 Y137.229 E.00143
G1 X154.432 Y137.229 E.00781
G1 X154.058 Y137.079 E.00143
G1 X151.679 Y137.079 E.00846
; WIPE_START
G1 F24000
G1 X153.679 Y137.079 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.174 J-.321 P1  F30000
G1 X151.542 Y144.879 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X150.697 Y144.879 E.003
G1 X150.697 Y144.729 E.00053
G1 X151.475 Y144.729 E.00276
G1 X151.474 Y144.579 E.00053
G1 X150.697 Y144.579 E.00276
G1 X150.696 Y144.429 E.00053
G1 X151.474 Y144.429 E.00276
M73 P75 R5
G1 X151.474 Y144.279 E.00053
G1 X150.696 Y144.279 E.00276
G1 X150.696 Y144.129 E.00053
G1 X151.474 Y144.129 E.00276
G1 X151.473 Y143.979 E.00053
G1 X150.695 Y143.979 E.00276
G1 X150.695 Y143.829 E.00053
G1 X151.473 Y143.829 E.00276
G1 X151.473 Y143.679 E.00053
G1 X150.695 Y143.679 E.00276
G1 X150.695 Y143.529 E.00053
G1 X151.472 Y143.529 E.00276
G1 X151.472 Y143.379 E.00053
G1 X150.694 Y143.379 E.00276
G1 X150.694 Y143.229 E.00053
G1 X151.472 Y143.229 E.00276
G1 X151.471 Y143.079 E.00053
G1 X150.694 Y143.079 E.00276
G1 X150.693 Y142.929 E.00053
G1 X151.471 Y142.929 E.00276
G1 X151.471 Y142.779 E.00053
G1 X150.693 Y142.779 E.00276
G1 X150.693 Y142.629 E.00053
G1 X151.471 Y142.629 E.00276
G1 X151.47 Y142.479 E.00053
G1 X150.693 Y142.479 E.00276
G1 X150.692 Y142.329 E.00053
G1 X151.47 Y142.329 E.00276
G1 X151.47 Y142.179 E.00053
G1 X150.692 Y142.179 E.00276
G1 X150.692 Y142.029 E.00053
G1 X151.469 Y142.029 E.00276
G1 X151.469 Y141.879 E.00053
G1 X150.691 Y141.879 E.00276
G1 X150.691 Y141.729 E.00053
G1 X151.469 Y141.729 E.00276
G1 X151.469 Y141.579 E.00053
G1 X150.691 Y141.579 E.00276
G1 X150.691 Y141.429 E.00053
G1 X151.468 Y141.429 E.00276
G1 X151.468 Y141.279 E.00053
G1 X150.69 Y141.279 E.00276
G1 X150.69 Y141.129 E.00053
G1 X151.468 Y141.129 E.00276
G1 X151.467 Y140.979 E.00053
G1 X150.69 Y140.979 E.00276
G1 X150.69 Y140.829 E.00053
G1 X151.467 Y140.829 E.00276
G1 X151.467 Y140.679 E.00053
G1 X150.689 Y140.679 E.00276
G1 X150.689 Y140.529 E.00053
G1 X151.466 Y140.529 E.00276
G1 X151.466 Y140.379 E.00053
G1 X150.689 Y140.379 E.00276
G1 X150.688 Y140.229 E.00053
G1 X151.466 Y140.229 E.00276
G1 X151.466 Y140.079 E.00053
G1 X150.688 Y140.079 E.00276
G1 X150.688 Y139.929 E.00053
G1 X151.465 Y139.929 E.00276
G1 X151.465 Y139.779 E.00053
G1 X150.688 Y139.779 E.00276
G1 X150.687 Y139.629 E.00053
G1 X151.465 Y139.629 E.00276
G1 X151.464 Y139.479 E.00053
G1 X150.687 Y139.479 E.00276
G1 X150.687 Y139.329 E.00053
G1 X151.464 Y139.329 E.00276
G1 X151.464 Y139.179 E.00053
G1 X150.686 Y139.179 E.00276
G1 X150.686 Y139.029 E.00053
G1 X151.464 Y139.029 E.00276
G1 X151.463 Y138.879 E.00053
G1 X150.686 Y138.879 E.00276
G1 X150.686 Y138.729 E.00053
G1 X151.463 Y138.729 E.00276
G1 X151.463 Y138.579 E.00053
G1 X150.685 Y138.579 E.00276
G1 X150.685 Y138.429 E.00053
G1 X151.462 Y138.429 E.00276
G1 X151.462 Y138.279 E.00053
G1 X150.685 Y138.279 E.00276
G1 X150.684 Y138.129 E.00053
G1 X151.462 Y138.129 E.00276
G1 X151.461 Y137.979 E.00053
G1 X150.684 Y137.979 E.00276
G1 X150.684 Y137.829 E.00053
G1 X151.461 Y137.829 E.00276
G1 X151.461 Y137.679 E.00053
G1 X150.684 Y137.679 E.00276
G1 X150.683 Y137.529 E.00053
G1 X151.461 Y137.529 E.00276
G1 X151.46 Y137.379 E.00053
G1 X150.683 Y137.379 E.00276
G1 X150.683 Y137.229 E.00053
G1 X151.46 Y137.229 E.00276
G1 X151.46 Y137.079 E.00053
G1 X150.682 Y137.079 E.00276
G1 X150.682 Y136.929 E.00053
G1 X153.684 Y136.929 E.01067
G1 X153.311 Y136.779 E.00143
G1 X150.682 Y136.779 E.00934
G1 X150.682 Y136.629 E.00053
G1 X152.937 Y136.629 E.00802
G1 X152.563 Y136.479 E.00143
G1 X150.681 Y136.479 E.00669
G1 X150.681 Y136.329 E.00053
G1 X152.189 Y136.329 E.00536
G1 X151.815 Y136.179 E.00143
G1 X150.681 Y136.179 E.00403
G1 X150.68 Y136.029 E.00053
G1 X151.458 Y136.029 E.00276
G1 X151.458 Y135.879 E.00053
G1 X150.68 Y135.879 E.00276
G1 X150.68 Y135.729 E.00053
G1 X151.458 Y135.729 E.00276
G1 X151.457 Y135.579 E.00053
G1 X150.68 Y135.579 E.00276
G1 X150.679 Y135.429 E.00053
G1 X151.457 Y135.429 E.00276
G1 X151.457 Y135.279 E.00053
G1 X150.679 Y135.279 E.00276
G1 X150.679 Y135.129 E.00053
G1 X151.456 Y135.129 E.00276
G1 X151.456 Y134.979 E.00053
G1 X150.679 Y134.979 E.00276
G1 X150.678 Y134.829 E.00053
G1 X151.456 Y134.829 E.00276
G1 X151.455 Y134.679 E.00053
G1 X150.678 Y134.679 E.00276
G1 X150.678 Y134.529 E.00053
G1 X151.455 Y134.529 E.00276
G1 X151.455 Y134.379 E.00053
G1 X150.677 Y134.379 E.00276
G1 X150.677 Y134.229 E.00053
G1 X151.455 Y134.229 E.00276
G1 X151.454 Y134.079 E.00053
G1 X150.609 Y134.079 E.003
; WIPE_START
G1 F24000
G1 X151.454 Y134.079 E-.32111
G1 X151.455 Y134.229 E-.057
G1 X150.677 Y134.229 E-.29546
G1 X150.677 Y134.379 E-.057
G1 X150.755 Y134.379 E-.02943
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.054 J-.608 P1  F30000
G1 X144.696 Y144.879 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X134.719 Y144.879 E.03546
G1 X134.647 Y144.729 E.00059
G1 X144.628 Y144.729 E.03548
G1 X144.628 Y144.579 E.00053
G1 X134.576 Y144.579 E.03573
G1 X134.504 Y144.429 E.00059
G1 X144.627 Y144.429 E.03599
G1 X144.627 Y144.279 E.00053
G1 X134.432 Y144.279 E.03624
G1 X134.36 Y144.129 E.00059
G1 X144.627 Y144.129 E.03649
G1 X144.626 Y143.979 E.00053
G1 X134.296 Y143.979 E.03672
G1 X134.235 Y143.829 E.00058
G1 X144.626 Y143.829 E.03694
G1 X144.626 Y143.679 E.00053
G1 X134.174 Y143.679 E.03715
G1 X134.112 Y143.529 E.00058
G1 X144.625 Y143.529 E.03737
G1 X144.625 Y143.379 E.00053
G1 X134.051 Y143.379 E.03759
G1 X133.99 Y143.229 E.00058
G1 X144.625 Y143.229 E.0378
G1 X144.625 Y143.079 E.00053
G1 X133.929 Y143.079 E.03802
G1 X133.878 Y142.929 E.00056
G1 X144.624 Y142.929 E.0382
G1 X144.624 Y142.779 E.00053
G1 X133.827 Y142.779 E.03838
G1 X133.776 Y142.629 E.00056
G1 X144.624 Y142.629 E.03856
G1 X144.623 Y142.479 E.00053
G1 X133.725 Y142.479 E.03874
G1 X133.674 Y142.329 E.00056
G1 X144.623 Y142.329 E.03892
G1 X144.623 Y142.179 E.00053
G1 X133.623 Y142.179 E.0391
G3 X133.573 Y142.029 I1.239 J-.493 E.00056
G1 X144.623 Y142.029 E.03928
G1 X144.622 Y141.879 E.00053
G1 X133.532 Y141.879 E.03942
G1 X133.491 Y141.729 E.00055
G1 X144.622 Y141.729 E.03957
G1 X144.622 Y141.579 E.00053
G1 X133.449 Y141.579 E.03971
G1 X133.408 Y141.429 E.00055
G1 X144.621 Y141.429 E.03986
G1 X144.621 Y141.279 E.00053
G1 X133.367 Y141.279 E.04001
G1 X133.325 Y141.129 E.00055
G1 X144.621 Y141.129 E.04015
G1 X144.621 Y140.979 E.00053
G1 X133.286 Y140.979 E.04029
G1 X133.254 Y140.829 E.00055
G1 X144.62 Y140.829 E.0404
G1 X144.62 Y140.679 E.00053
G1 X133.222 Y140.679 E.04052
G1 X133.19 Y140.529 E.00055
G1 X144.62 Y140.529 E.04063
G1 X144.619 Y140.379 E.00053
G1 X133.158 Y140.379 E.04074
G1 X133.126 Y140.229 E.00055
G1 X144.619 Y140.229 E.04085
G1 X144.619 Y140.079 E.00053
G1 X133.094 Y140.079 E.04097
G1 X133.063 Y139.929 E.00054
G1 X144.618 Y139.929 E.04108
G1 X144.618 Y139.779 E.00053
G1 X133.04 Y139.779 E.04116
G1 X133.018 Y139.629 E.00054
G1 X144.618 Y139.629 E.04123
M73 P76 R5
G1 X144.618 Y139.479 E.00053
G1 X132.995 Y139.479 E.04131
G1 X132.972 Y139.329 E.00054
G1 X144.617 Y139.329 E.04139
G1 X144.617 Y139.179 E.00053
G1 X132.95 Y139.179 E.04147
G1 X132.927 Y139.029 E.00054
G1 X144.617 Y139.029 E.04155
G1 X144.616 Y138.879 E.00053
G1 X132.904 Y138.879 E.04163
G3 X132.89 Y138.729 I1.256 J-.198 E.00054
G1 X144.616 Y138.729 E.04168
G1 X144.616 Y138.579 E.00053
G1 X132.876 Y138.579 E.04173
G1 X132.862 Y138.429 E.00054
G1 X144.616 Y138.429 E.04178
G1 X144.615 Y138.279 E.00053
G1 X132.849 Y138.279 E.04183
G1 X132.835 Y138.129 E.00054
G1 X144.615 Y138.129 E.04187
G1 X144.615 Y137.979 E.00053
G1 X132.821 Y137.979 E.04192
G1 X132.808 Y137.829 E.00054
G1 X144.614 Y137.829 E.04197
G1 X144.614 Y137.679 E.00053
G1 X132.8 Y137.679 E.04199
G1 X132.795 Y137.529 E.00053
G1 X144.614 Y137.529 E.04201
G1 X144.613 Y137.379 E.00053
G1 X132.791 Y137.379 E.04203
G1 X132.786 Y137.229 E.00053
G1 X144.613 Y137.229 E.04204
G1 X144.613 Y137.079 E.00053
G1 X132.781 Y137.079 E.04206
G1 X132.776 Y136.929 E.00053
G1 X144.613 Y136.929 E.04207
G1 X144.612 Y136.779 E.00053
G1 X132.772 Y136.779 E.04209
G3 X132.771 Y136.629 I1.264 J-.082 E.00053
G1 X144.612 Y136.629 E.04209
G1 X144.612 Y136.479 E.00053
G1 X132.775 Y136.479 E.04208
G1 X132.779 Y136.329 E.00053
G1 X144.611 Y136.329 E.04206
G1 X144.611 Y136.301 E.0001
G1 X144.912 Y136.179 E.00115
G1 X132.783 Y136.179 E.04311
G1 X132.787 Y136.029 E.00053
G1 X145.282 Y136.029 E.04441
G1 X145.652 Y135.879 E.00142
G1 X132.792 Y135.879 E.04571
G1 X132.796 Y135.729 E.00053
G1 X146.022 Y135.729 E.04701
G1 X146.392 Y135.579 E.00142
G1 X132.802 Y135.579 E.04831
G1 X132.815 Y135.429 E.00054
G1 X146.762 Y135.429 E.04958
G1 X147.132 Y135.279 E.00142
G1 X144.95 Y135.279 E.00776
G1 X145.32 Y135.129 E.00142
G1 X147.502 Y135.129 E.00776
G1 X147.872 Y134.979 E.00142
G1 X145.69 Y134.979 E.00775
G1 X146.06 Y134.829 E.00142
G1 X148.241 Y134.829 E.00775
G1 X148.611 Y134.679 E.00142
G1 X146.43 Y134.679 E.00775
G1 X146.8 Y134.529 E.00142
G1 X148.981 Y134.529 E.00775
G1 X149.351 Y134.379 E.00142
G1 X147.17 Y134.379 E.00775
G1 X147.54 Y134.229 E.00142
G1 X149.721 Y134.229 E.00775
G1 X150.091 Y134.079 E.00142
G1 X147.91 Y134.079 E.00775
G1 X148.28 Y133.929 E.00142
G1 X151.454 Y133.929 E.01128
G1 X151.454 Y133.779 E.00053
G1 X148.65 Y133.779 E.00997
G1 X149.02 Y133.629 E.00142
G1 X151.453 Y133.629 E.00865
G1 X151.453 Y133.479 E.00053
G1 X149.39 Y133.479 E.00733
G1 X149.76 Y133.329 E.00142
G1 X151.453 Y133.329 E.00602
G1 X151.453 Y133.179 E.00053
G1 X150.13 Y133.179 E.0047
G1 X150.5 Y133.029 E.00142
G1 X151.452 Y133.029 E.00339
G1 X151.452 Y132.879 E.00053
G1 X150.675 Y132.879 E.00276
G1 X150.674 Y132.729 E.00053
G1 X151.452 Y132.729 E.00276
G1 X151.451 Y132.579 E.00053
G1 X150.674 Y132.579 E.00276
G1 X150.674 Y132.429 E.00053
G1 X151.451 Y132.429 E.00276
G1 X151.451 Y132.279 E.00053
G1 X150.673 Y132.279 E.00276
G1 X150.673 Y132.129 E.00053
G1 X151.451 Y132.129 E.00276
G1 X151.45 Y131.979 E.00053
G1 X150.673 Y131.979 E.00276
G1 X150.673 Y131.829 E.00053
G1 X151.45 Y131.829 E.00276
G1 X151.45 Y131.679 E.00053
G1 X150.672 Y131.679 E.00276
G1 X150.672 Y131.529 E.00053
G1 X151.449 Y131.529 E.00276
G1 X151.449 Y131.379 E.00053
G1 X150.672 Y131.379 E.00276
G1 X150.671 Y131.229 E.00053
G1 X151.449 Y131.229 E.00276
G1 X151.449 Y131.079 E.00053
G1 X150.671 Y131.079 E.00276
G1 X150.671 Y130.929 E.00053
G1 X151.448 Y130.929 E.00276
G1 X151.448 Y130.779 E.00053
G1 X150.671 Y130.779 E.00276
G1 X150.67 Y130.629 E.00053
G1 X151.448 Y130.629 E.00276
G1 X151.447 Y130.479 E.00053
G1 X150.67 Y130.479 E.00276
G1 X150.67 Y130.329 E.00053
G1 X151.447 Y130.329 E.00276
G1 X151.447 Y130.179 E.00053
G1 X150.669 Y130.179 E.00276
G1 X150.669 Y130.029 E.00053
G1 X151.447 Y130.029 E.00276
G1 X151.446 Y129.879 E.00053
G1 X150.669 Y129.879 E.00276
G1 X150.669 Y129.729 E.00053
G1 X151.446 Y129.729 E.00276
G1 X151.446 Y129.579 E.00053
G1 X150.668 Y129.579 E.00276
G1 X150.668 Y129.429 E.00053
G1 X151.445 Y129.429 E.00276
G1 X151.445 Y129.279 E.00053
G1 X150.668 Y129.279 E.00276
G1 X150.668 Y129.129 E.00053
G1 X151.445 Y129.129 E.00276
G1 X151.445 Y128.979 E.00053
G1 X150.667 Y128.979 E.00276
G1 X150.667 Y128.829 E.00053
G1 X151.444 Y128.829 E.00276
G1 X151.444 Y128.679 E.00053
G1 X150.667 Y128.679 E.00276
G1 X150.666 Y128.529 E.00053
G1 X151.444 Y128.529 E.00276
G1 X151.443 Y128.379 E.00053
G1 X150.666 Y128.379 E.00276
G1 X150.666 Y128.229 E.00053
G1 X151.443 Y128.229 E.00276
G1 X151.443 Y128.079 E.00053
G1 X150.666 Y128.079 E.00276
G1 X150.665 Y127.929 E.00053
G1 X151.443 Y127.929 E.00276
G1 X151.442 Y127.779 E.00053
G1 X150.665 Y127.779 E.00276
G1 X150.665 Y127.629 E.00053
G1 X151.442 Y127.629 E.00276
G1 X151.442 Y127.479 E.00053
G1 X150.597 Y127.479 E.003
; WIPE_START
G1 F24000
G1 X151.442 Y127.479 E-.32101
G1 X151.442 Y127.629 E-.057
G1 X150.665 Y127.629 E-.29536
G1 X150.665 Y127.779 E-.057
G1 X150.743 Y127.779 E-.02963
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.946 J-.765 P1  F30000
G1 X144.677 Y135.279 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X132.828 Y135.279 E.04212
G1 X132.841 Y135.129 E.00054
G1 X144.609 Y135.129 E.04183
G1 X144.609 Y134.979 E.00053
G1 X132.854 Y134.979 E.04178
G1 X132.867 Y134.829 E.00054
G1 X144.609 Y134.829 E.04174
G1 X144.608 Y134.679 E.00053
G1 X132.88 Y134.679 E.04169
G1 X132.893 Y134.529 E.00054
G1 X144.608 Y134.529 E.04164
G1 X144.608 Y134.379 E.00053
G1 X132.915 Y134.379 E.04156
G1 X132.937 Y134.229 E.00054
G1 X144.608 Y134.229 E.04148
G1 X144.607 Y134.079 E.00053
G1 X132.959 Y134.079 E.0414
G1 X132.981 Y133.929 E.00054
G1 X144.607 Y133.929 E.04133
G1 X144.607 Y133.779 E.00053
G1 X133.004 Y133.779 E.04125
G1 X133.026 Y133.629 E.00054
G1 X144.606 Y133.629 E.04117
G1 X144.606 Y133.479 E.00053
G1 X133.048 Y133.479 E.04109
G3 X133.077 Y133.329 I1.278 J.173 E.00054
G1 X144.606 Y133.329 E.04098
G1 X144.606 Y133.179 E.00053
G1 X133.108 Y133.179 E.04087
G1 X133.14 Y133.029 E.00054
G1 X144.605 Y133.029 E.04076
G1 X144.605 Y132.879 E.00053
G1 X133.171 Y132.879 E.04064
G1 X133.202 Y132.729 E.00054
G1 X144.605 Y132.729 E.04053
G1 X144.605 Y132.579 E.00053
G1 X133.234 Y132.579 E.04042
G1 X133.265 Y132.429 E.00054
G1 X144.604 Y132.429 E.04031
G1 X144.604 Y132.279 E.00053
G1 X133.303 Y132.279 E.04017
G1 X133.343 Y132.129 E.00055
G1 X144.604 Y132.129 E.04003
G1 X144.604 Y131.979 E.00053
G1 X133.384 Y131.979 E.03988
G1 X133.425 Y131.829 E.00055
G1 X144.603 Y131.829 E.03974
G1 X144.603 Y131.679 E.00053
G1 X133.465 Y131.679 E.03959
G1 X133.506 Y131.529 E.00055
G1 X144.603 Y131.529 E.03944
G1 X144.602 Y131.379 E.00053
G1 X133.547 Y131.379 E.0393
G1 X133.551 Y131.365 E.00005
G3 X133.594 Y131.229 I1.164 J.3 E.00051
G1 X144.602 Y131.229 E.03913
G1 X144.602 Y131.079 E.00053
G1 X133.645 Y131.079 E.03895
G1 X133.695 Y130.929 E.00056
G1 X144.602 Y130.929 E.03877
G1 X144.601 Y130.779 E.00053
G1 X133.746 Y130.779 E.03859
G1 X133.796 Y130.629 E.00056
G1 X144.601 Y130.629 E.03841
G1 X144.601 Y130.479 E.00053
G1 X133.846 Y130.479 E.03823
G1 X133.897 Y130.329 E.00056
G1 X144.601 Y130.329 E.03805
G1 X144.6 Y130.179 E.00053
M73 P77 R5
G1 X133.956 Y130.179 E.03784
G1 X134.016 Y130.029 E.00057
G1 X144.6 Y130.029 E.03762
G1 X144.6 Y129.879 E.00053
G1 X134.077 Y129.879 E.03741
G1 X134.137 Y129.729 E.00057
G1 X144.599 Y129.729 E.03719
G1 X144.599 Y129.579 E.00053
G1 X134.198 Y129.579 E.03697
G1 X134.258 Y129.429 E.00057
G1 X144.599 Y129.429 E.03676
G1 X144.599 Y129.279 E.00053
G1 X134.32 Y129.279 E.03654
G1 X134.391 Y129.129 E.00059
G1 X144.598 Y129.129 E.03628
G1 X144.598 Y128.979 E.00053
G1 X134.462 Y128.979 E.03603
G1 X134.533 Y128.829 E.00059
G1 X144.598 Y128.829 E.03578
G1 X144.598 Y128.679 E.00053
G1 X134.604 Y128.679 E.03552
G1 X134.675 Y128.529 E.00059
G1 X144.597 Y128.529 E.03527
G1 X144.597 Y128.379 E.00053
G1 X134.746 Y128.379 E.03502
G3 X134.824 Y128.229 I1.303 J.578 E.0006
G1 X144.597 Y128.229 E.03474
G1 X144.596 Y128.079 E.00053
G1 X134.906 Y128.079 E.03445
G1 X134.989 Y127.929 E.00061
G1 X144.596 Y127.929 E.03415
G1 X144.596 Y127.779 E.00053
G1 X135.071 Y127.779 E.03386
G1 X135.153 Y127.629 E.00061
G1 X144.596 Y127.629 E.03356
G1 X144.595 Y127.479 E.00053
G1 X135.236 Y127.479 E.03327
G3 X135.32 Y127.329 I1.306 J.64 E.00061
G1 X166.905 Y127.329 E.11227
G2 X166.813 Y127.179 I-1.31 J.708 E.00063
G1 X135.415 Y127.179 E.11161
G1 X135.509 Y127.029 E.00063
G1 X166.717 Y127.029 E.11094
G1 X166.622 Y126.879 E.00063
G1 X135.603 Y126.879 E.11026
G1 X135.698 Y126.729 E.00063
G1 X166.527 Y126.729 E.10959
G1 X166.432 Y126.579 E.00063
G1 X135.792 Y126.579 E.10892
G3 X135.887 Y126.429 I1.312 J.728 E.00063
G1 X166.337 Y126.429 E.10824
G2 X166.233 Y126.279 I-1.316 J.802 E.00065
G1 X135.994 Y126.279 E.10749
G1 X136.102 Y126.129 E.00066
G1 X166.125 Y126.129 E.10672
G1 X166.017 Y125.979 E.00066
G1 X136.209 Y125.979 E.10596
G1 X136.316 Y125.829 E.00066
G1 X165.909 Y125.829 E.10519
G1 X165.801 Y125.679 E.00066
G1 X136.423 Y125.679 E.10443
G3 X136.533 Y125.529 I1.319 J.849 E.00066
G1 X165.693 Y125.529 E.10365
G2 X165.573 Y125.379 I-1.324 J.932 E.00068
G1 X136.654 Y125.379 E.1028
G1 X136.775 Y125.229 E.00069
G1 X165.451 Y125.229 E.10193
G1 X165.329 Y125.079 E.00069
G1 X136.897 Y125.079 E.10107
G1 X137.018 Y124.929 E.00069
G1 X165.207 Y124.929 E.1002
G1 X165.084 Y124.779 E.00069
G1 X137.139 Y124.779 E.09934
G3 X137.269 Y124.629 I1.329 J1.017 E.00071
G1 X164.959 Y124.629 E.09843
G1 X164.822 Y124.479 E.00072
G1 X137.405 Y124.479 E.09746
G1 X137.542 Y124.329 E.00072
G1 X164.684 Y124.329 E.09648
G1 X164.546 Y124.179 E.00072
G1 X137.679 Y124.179 E.0955
G1 X137.816 Y124.029 E.00072
G1 X164.408 Y124.029 E.09453
G1 X164.271 Y123.879 E.00072
G1 X137.955 Y123.879 E.09354
G1 X138.109 Y123.729 E.00076
G1 X164.118 Y123.729 E.09245
G1 X163.963 Y123.579 E.00077
G1 X138.263 Y123.579 E.09135
G1 X138.417 Y123.429 E.00076
G1 X163.808 Y123.429 E.09025
G1 X163.653 Y123.279 E.00077
G1 X138.571 Y123.279 E.08916
G3 X138.728 Y123.129 I1.342 J1.243 E.00077
G1 X163.498 Y123.129 E.08805
G2 X163.326 Y122.979 I-1.349 J1.366 E.00081
G1 X138.901 Y122.979 E.08682
G1 X139.074 Y122.829 E.00081
G1 X163.152 Y122.829 E.08559
G1 X162.977 Y122.679 E.00082
G1 X139.248 Y122.679 E.08435
G1 X139.421 Y122.529 E.00081
G1 X162.802 Y122.529 E.08311
G2 X162.625 Y122.379 I-1.352 J1.415 E.00082
G1 X139.603 Y122.379 E.08184
G1 X139.799 Y122.229 E.00088
G1 X162.428 Y122.229 E.08044
G1 X162.231 Y122.079 E.00088
G1 X139.995 Y122.079 E.07904
G1 X140.19 Y121.929 E.00088
G1 X162.034 Y121.929 E.07765
G1 X161.836 Y121.779 E.00088
G1 X140.386 Y121.779 E.07625
G1 X140.607 Y121.629 E.00095
G1 X161.621 Y121.629 E.0747
M73 P78 R5
G1 X161.397 Y121.479 E.00096
G1 X140.829 Y121.479 E.07311
G1 X141.051 Y121.329 E.00095
G1 X161.173 Y121.329 E.07153
G1 X160.95 Y121.179 E.00096
G1 X141.273 Y121.179 E.06995
G3 X141.523 Y121.029 I1.389 J2.033 E.00104
G1 X160.705 Y121.029 E.06819
G1 X160.45 Y120.879 E.00105
G1 X141.776 Y120.879 E.06638
G1 X142.029 Y120.729 E.00105
G1 X160.195 Y120.729 E.06457
G1 X159.94 Y120.579 E.00105
G1 X142.29 Y120.579 E.06274
G1 X142.581 Y120.429 E.00116
G1 X159.646 Y120.429 E.06066
G1 X159.353 Y120.279 E.00117
G1 X142.872 Y120.279 E.05858
G1 X143.163 Y120.129 E.00116
G1 X159.059 Y120.129 E.05651
G2 X158.731 Y119.979 I-1.427 J2.685 E.00128
G1 X143.496 Y119.979 E.05416
G1 X143.835 Y119.829 E.00132
G1 X158.389 Y119.829 E.05173
G1 X158.047 Y119.679 E.00133
G1 X144.174 Y119.679 E.04931
G3 X144.573 Y119.529 I1.463 J3.288 E.00152
G1 X157.654 Y119.529 E.0465
G1 X157.248 Y119.379 E.00154
G1 X144.782 Y119.379 E.04431
G1 X145.183 Y119.229 F30000
G1 F3600
G1 X157.037 Y119.229 E.04214
G1 X156.555 Y119.079 F30000
G1 F3600
G1 X145.671 Y119.079 E.03869
G1 X146.159 Y118.929 F30000
G1 F3600
G1 X156.061 Y118.929 E.0352
G1 X155.469 Y118.779 F30000
G1 F3600
G1 X146.757 Y118.779 E.03097
G1 X147.402 Y118.629 F30000
G1 F3600
G1 X154.833 Y118.629 E.02641
G1 X153.99 Y118.479 F30000
G1 F3600
G1 X148.228 Y118.479 E.02048
; WIPE_START
G1 F24000
G1 X150.228 Y118.479 E-.76
; WIPE_END
M73 P80 R4
G1 E-.04 F1800
G17
G3 Z2.8 I.217 J-1.197 P1  F30000
G1 X149.401 Y118.329 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
G1 X152.809 Y118.329 E.01211
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.809 Y118.329 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/15
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
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
G2 Z2.8 I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift

G1 Z5.6 F1200

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
G1 E0.651648 F50
G1 E7.49395 F523
G1 E0.651648 F50
M73 P81 R4
G1 E7.49395 F523
G1 E0.651648 F50
G1 E7.49395 F523
G1 E0.651648 F50
G1 E7.49395 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
G1 E10.1308 F523
G1 E1.12565 F50
; FLUSH_END

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
M73 P82 R4
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z5.6 F3000

M204 S10000


M621 S1A
M106 S255
M106 P2 S178
G1 X155.5 Y219.5 F30000
G1 Z6
G1 Z2.6
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
M73 P83 R4
G1  X155.500 Y219.500  
; CP TOOLCHANGE WIPE
G1  X189.625  E1.2970 F1584
G1  Y220.833  E0.0507
G1  X155.375  E1.3017 F1800
G1  Y222.167  E0.0507
G1  X189.625  E1.3017 F2198
G1  Y223.500  E0.0507
G1  X155.375  E1.3017 F4200
G1  Y224.833  E0.0507
G1  X189.625  E1.3017 F4250
M73 P83 R3
G1  Y226.167  E0.0507
G1  X155.375  E1.3017 F4300
G1  Y227.500  E0.0507
G1  X189.625  E1.3017 F4350
G1  Y228.833  E0.0507
M73 P84 R3
G1  X155.375  E1.3017 F4400
G1  Y230.167  E0.0507
G1  X189.625  E1.3017 F4450
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
M73 P85 R3
G1 E-.04 F1800
G17
G3 Z3 I1.164 J-.356 P1  F30000
G1 X156.853 Y137.471 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.134 Y135.578 E.16349
G1 X152.12 Y128.041 E.24235
G1 X156.835 Y128.032 E.15163
G1 X156.85 Y135.909 E.25329
G1 X156.853 Y137.411 E.04829
G1 X157.246 Y138.051 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.743 Y135.843 E.17663
G1 X151.727 Y127.65 E.24406
G1 X157.227 Y127.64 E.16381
G1 X157.242 Y135.908 E.2463
G1 X157.246 Y137.991 E.06204
M204 S10000
; WIPE_START
G1 F24000
G1 X155.383 Y137.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.174 J-.32 P1  F30000
G1 X154.489 Y133.982 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580196
G1 F11725.818
G1 X154.482 Y130.454 E.14973
G1 X154.032 Y134.292 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X154.947 Y134.659 E.02937
G1 X154.938 Y129.936 E.14067
G1 X154.024 Y129.938 E.02724
G1 X154.032 Y134.232 E.12789
G1 X153.656 Y134.547 F30000
G1 F15000
M73 P86 R3
G1 X155.325 Y135.217 E.05359
G1 X155.315 Y129.559 E.16854
G1 X153.646 Y129.562 E.0497
G1 X153.656 Y134.487 E.14671
G1 X153.279 Y134.802 F30000
G1 F15000
G1 X155.704 Y135.775 E.07781
G1 X155.691 Y129.181 E.19641
G1 X153.268 Y129.185 E.07217
G1 X153.279 Y134.742 E.16552
G1 X152.902 Y135.057 F30000
G1 F15000
G1 X156.082 Y136.333 E.10203
G1 X156.068 Y128.803 E.22429
G1 X152.89 Y128.809 E.09463
G1 X152.902 Y134.997 E.18433
G1 X152.526 Y135.313 F30000
G1 F15000
G1 X156.46 Y136.891 E.12626
G1 X156.444 Y128.425 E.25216
G1 X152.513 Y128.433 E.1171
G1 X152.526 Y135.253 E.20315
; WIPE_START
G1 F24000
G1 X152.522 Y133.253 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.213 J-.1 P1  F30000
G1 X152.138 Y137.921 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X155.905 Y139.431 E.13049
G1 X156.857 Y139.814 E.033
G1 X156.866 Y144.271 E.14335
G1 X152.151 Y144.28 E.15161
G1 X152.139 Y137.981 E.20258
G1 X151.745 Y137.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X156.051 Y139.068 E.13818
G1 X157.249 Y139.548 E.03845
G1 X157.259 Y144.663 E.15235
G1 X151.76 Y144.673 E.1638
G1 X151.745 Y137.4 E.21663
M204 S10000
; WIPE_START
G1 F24000
G1 X153.61 Y138.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.185 J.279 P1  F30000
G1 X154.504 Y141.918 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580086
G1 F11728.218
G1 X154.503 Y141.469 E.01906
G1 X154.044 Y140.733 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X154.048 Y142.376 E.04896
G1 X154.962 Y142.375 E.02723
G1 X154.959 Y141.1 E.03797
G1 X154.1 Y140.755 E.02758
G1 X153.666 Y140.175 F30000
G1 F15000
G1 X153.671 Y142.754 E.07683
G1 X155.34 Y142.751 E.04969
G1 X155.336 Y140.845 E.05678
G1 X153.722 Y140.197 E.0518
G1 X153.288 Y139.617 F30000
G1 F15000
G1 X153.295 Y143.132 E.1047
G1 X155.717 Y143.127 E.07216
G1 X155.713 Y140.589 E.0756
G1 X153.344 Y139.639 E.07603
G1 X152.91 Y139.059 F30000
G1 F15000
G1 X152.919 Y143.51 E.13258
G1 X156.095 Y143.504 E.09462
G1 X156.089 Y140.334 E.09441
G1 X152.966 Y139.081 E.10025
G1 X152.532 Y138.501 F30000
G1 F15000
G1 X152.542 Y143.887 E.16045
G1 X156.473 Y143.88 E.11708
G1 X156.466 Y140.079 E.11322
G1 X152.587 Y138.523 E.12447
; WIPE_START
G1 F24000
G1 X154.444 Y139.268 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.858 J-.863 P1  F30000
G1 X150.001 Y134.846 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X150.009 Y139.122 E.13749
G1 X150.019 Y144.284 E.166
G1 X145.304 Y144.293 E.15161
G1 X145.289 Y136.757 E.24233
G1 X149.946 Y134.869 E.16157
G1 X150.392 Y134.265 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X150.401 Y139.121 E.14466
G1 X150.412 Y144.676 E.16544
G1 X144.913 Y144.686 E.1638
G1 X144.897 Y136.493 E.24403
G1 X150.337 Y134.287 E.17485
M204 S10000
; WIPE_START
G1 F24000
G1 X150.363 Y136.287 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.735 J-.97 P1  F30000
G1 X147.65 Y138.344 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580312
G1 F11723.286
G1 X147.657 Y141.871 E.14973
G1 X147.192 Y138.036 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X147.201 Y142.389 E.12966
G1 X148.115 Y142.387 E.02723
G1 X148.106 Y137.666 E.14065
G1 X147.248 Y138.014 E.02758
G1 X146.815 Y137.782 F30000
G1 F15000
G1 X146.824 Y142.767 E.14847
G1 X148.493 Y142.764 E.04969
G1 X148.482 Y137.106 E.16852
G1 X146.87 Y137.76 E.05181
G1 X146.437 Y137.529 F30000
G1 F15000
G1 X146.448 Y143.145 E.16729
G1 X148.871 Y143.14 E.07216
G1 X148.858 Y136.547 E.19639
G1 X146.493 Y137.506 E.07603
G1 X146.06 Y137.275 F30000
G1 F15000
G1 X146.072 Y143.523 E.1861
G1 X149.248 Y143.517 E.09462
G1 X149.234 Y135.987 E.22427
G1 X146.115 Y137.252 E.10025
G1 X145.682 Y137.021 F30000
G1 F15000
G1 X145.695 Y143.9 E.20491
G1 X149.626 Y143.893 E.11708
G1 X149.61 Y135.428 E.25214
G1 X145.738 Y136.999 E.12448
; WIPE_START
G1 F24000
G1 X147.591 Y136.247 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.758 J-.952 P1  F30000
G1 X145.285 Y134.413 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.274 Y128.054 E.20448
G1 X149.988 Y128.045 E.15161
G1 X149.995 Y131.682 E.11695
G1 X149.997 Y132.503 E.02638
G1 X145.341 Y134.39 E.16156
G1 X144.894 Y134.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.881 Y127.663 E.21839
G1 X150.38 Y127.652 E.1638
G1 X150.387 Y131.682 E.12001
G1 X150.389 Y132.767 E.03232
G1 X144.95 Y134.972 E.17484
M204 S10000
; WIPE_START
G1 F24000
G1 X144.931 Y132.972 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.837 J.883 P1  F30000
G1 X147.635 Y130.407 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580088
G1 F11728.174
G1 X147.636 Y130.856 E.01903
G1 X147.18 Y131.594 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X148.094 Y131.224 E.02937
G1 X148.092 Y129.949 E.03796
G1 X147.177 Y129.951 E.02723
G1 X147.18 Y131.534 E.04715
G1 X146.804 Y132.153 F30000
G1 F15000
G1 X148.472 Y131.477 E.05359
G1 X148.468 Y129.571 E.05677
G1 X146.8 Y129.575 E.04969
G1 X146.804 Y132.093 E.07502
G1 X146.428 Y132.713 F30000
G1 F15000
G1 X148.849 Y131.731 E.07781
G1 X148.844 Y129.194 E.07558
G1 X146.422 Y129.198 E.07216
G1 X146.428 Y132.653 E.1029
G1 X146.052 Y133.272 F30000
G1 F15000
G1 X149.227 Y131.985 E.10203
G1 X149.221 Y128.816 E.0944
G1 X146.044 Y128.822 E.09462
G1 X146.052 Y133.212 E.13077
G1 X145.676 Y133.831 F30000
G1 F15000
G1 X149.604 Y132.239 E.12626
G1 X149.597 Y128.438 E.11321
G1 X145.666 Y128.445 E.11708
G1 X145.676 Y133.771 E.15864
; WIPE_START
G1 F24000
G1 X145.672 Y131.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.012 J-.676 P1  F30000
G1 X139.091 Y121.919 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.101 Y121.913 E.00037
G3 X150.513 Y117.648 I12.012 J14.743 E.39881
G1 X151.641 Y117.646 E.03625
G3 X138.248 Y122.65 I-.528 J19.01 E3.37097
G1 X139.046 Y121.959 E.03395
G1 X139.348 Y122.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X150.526 Y118.04 I11.764 J14.439 E.3618
G1 X151.63 Y118.038 E.03289
G3 X139.302 Y122.255 I-.517 J18.618 E3.08925
M204 S10000
; WIPE_START
G1 F24000
G1 X140.224 Y121.544 E-.44232
G1 X140.917 Y121.076 E-.31768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.494 J-1.112 P1  F30000
G1 X137.994 Y122.374 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X151.899 Y117.284 I13.136 J14.347 E.48846
G3 X137.17 Y123.175 I-.793 J19.378 E3.39289
G3 X137.95 Y122.414 I13.96 J13.546 E.03504
G1 X137.729 Y122.085 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X151.921 Y116.892 I13.401 J14.637 E.46181
G3 X136.888 Y122.902 I-.816 J19.769 E3.20615
G3 X137.685 Y122.125 I14.242 J13.82 E.03315
M204 S10000
; WIPE_START
G1 F24000
G1 X138.615 Y121.316 E-.46846
G1 X139.224 Y120.849 E-.29154
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.578 J-1.071 P1  F30000
G1 X105.59 Y138.988 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X105.533 Y139.185 I.274 J.186 E.00622
G1 X105.534 Y142.151 E.08836
G1 X104.904 Y142.151 E.01874
G3 X104.909 Y139.213 I87.203 J-1.344 E.08754
G3 X105.827 Y138.347 I.924 J.061 E.04135
G1 X108.62 Y138.35 E.0832
G3 X109.463 Y139.319 I-.095 J.934 E.04212
G1 X109.463 Y142.151 E.08437
G1 X108.842 Y142.151 E.01849
G1 X108.844 Y139.155 E.08924
G2 X108.527 Y138.845 I-.336 J.025 E.01443
G1 X105.818 Y138.846 E.0807
G2 X105.628 Y138.941 I.046 J.328 E.00644
M204 S10000
G1 X105.445 Y138.741 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.152882
G1 F15000
G3 X105.736 Y138.606 I.417 J.515 E.00282
G1 X108.524 Y138.596 E.02422
G3 X108.956 Y138.766 I.015 J.594 E.00414
; LINE_WIDTH: 0.209919
G3 X109.037 Y138.867 I-1.037 J.924 E.00171
G1 X109.089 Y138.959 E.00139
; LINE_WIDTH: 0.269123
G3 X109.153 Y139.325 I-.75 J.322 E.00672
G1 X109.153 Y141.955 E.04699
; WIPE_START
G1 F24000
G1 X109.153 Y139.955 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.551 J-1.085 P1  F30000
G1 X105.219 Y141.955 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.277729
G1 F15000
G1 X105.219 Y139.466 E.04617
G3 X105.27 Y138.986 I.975 J-.139 E.00905
; LINE_WIDTH: 0.208284
G3 X105.445 Y138.741 I.624 J.26 E.00395
; WIPE_START
G1 F24000
G1 X105.35 Y138.843 E-.34807
G1 X105.27 Y138.986 E-.41193
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.031 J-1.217 P1  F30000
G1 X99.826 Y138.845 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.391 Y138.845 E.07642
G1 X102.504 Y138.845 E.00336
G3 X102.855 Y139.17 I.02 J.33 E.01593
G1 X102.855 Y141.322 E.06409
G3 X102.505 Y141.645 I-.334 J-.01 E.01583
G1 X99.826 Y141.644 E.0798
G1 X99.826 Y138.905 E.08158
M204 S10000
; WIPE_START
G1 F24000
G1 X101.825 Y138.859 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.04 J-.632 P1  F30000
G1 X99.826 Y142.151 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X99.826 Y143.205 E.03139
G1 X99.105 Y143.205 E.02145
G1 X99.105 Y138.347 E.1447
G1 X102.736 Y138.353 E.10814
G3 X103.552 Y139.334 I-.118 J.929 E.04182
G3 X103.549 Y141.285 I-35.978 J.915 E.0581
G3 X102.649 Y142.151 I-.928 J-.063 E.0408
G1 X99.886 Y142.151 E.08232
M204 S10000
G1 X99.598 Y141.898 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159349
G1 F15000
G1 X102.645 Y141.893 E.02802
G2 X102.792 Y141.859 I-.077 J-.677 E.00139
; LINE_WIDTH: 0.216029
G2 X102.993 Y141.74 I-.306 J-.749 E.00321
; LINE_WIDTH: 0.262592
G2 X103.138 Y141.542 I-.569 J-.567 E.00427
; LINE_WIDTH: 0.307329
G2 X103.193 Y141.34 I-.758 J-.317 E.00439
; LINE_WIDTH: 0.345254
G2 X103.204 Y141.145 I-1.083 J-.157 E.00466
G2 X103.201 Y139.23 I-41.123 J-.896 E.04576
G1 X103.191 Y139.135 E.00226
G2 X103.158 Y139.006 I-.791 J.132 E.0032
; LINE_WIDTH: 0.281165
G2 X103.025 Y138.791 I-.511 J.168 E.0048
; LINE_WIDTH: 0.235088
G1 X102.956 Y138.723 E.00147
G1 X102.864 Y138.668 E.00164
; LINE_WIDTH: 0.187522
G2 X102.659 Y138.604 I-.253 J.448 E.00247
; LINE_WIDTH: 0.150174
G1 X102.509 Y138.596 E.00127
G3 X99.629 Y138.596 I-1.631 J-1064.868 E.0244
; LINE_WIDTH: 0.149144
G1 X99.52 Y138.651 E.00103
; LINE_WIDTH: 0.184536
G1 X99.411 Y138.706 E.00137
; LINE_WIDTH: 0.219927
G1 X99.301 Y138.76 E.00171
G1 X99.465 Y138.543 F30000
; LINE_WIDTH: 0.371193
G1 F15000
G1 X99.465 Y141.84 E.08549
G3 X99.465 Y141.955 I-.326 J.058 E.003
G1 X99.465 Y143.009 E.02733
G1 X99.47 Y141.898 F30000
; LINE_WIDTH: 0.381166
G1 F15000
G1 X99.502 Y141.898 E.00085
; LINE_WIDTH: 0.336547
G1 X99.534 Y141.898 E.00074
; LINE_WIDTH: 0.291928
G1 X99.566 Y141.898 E.00063
; LINE_WIDTH: 0.24731
G1 X99.598 Y141.898 E.00051
; WIPE_START
G1 F24000
G1 X99.566 Y141.898 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.135 J-1.209 P1  F30000
G1 X96.92 Y141.601 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G2 X97.085 Y141.321 I-.163 J-.284 E.01013
G1 X97.084 Y138.347 E.08858
G1 X97.779 Y138.347 E.0207
G1 X97.779 Y141.274 E.08718
G3 X96.875 Y142.151 I-.94 J-.065 E.04107
G1 X91.442 Y142.151 E.16183
M73 P87 R3
G1 X91.442 Y138.347 E.1133
G1 X92.13 Y138.347 E.02048
G1 X92.13 Y141.079 E.08138
G2 X92.214 Y141.541 I.663 J.117 E.01427
G2 X92.523 Y141.644 I.292 J-.359 E.00991
G1 X93.933 Y141.645 E.04199
G2 X94.271 Y141.251 I.008 J-.336 E.01769
G1 X94.271 Y138.347 E.08648
G1 X94.965 Y138.347 E.02066
G1 X94.964 Y141.323 E.08864
G2 X95.299 Y141.645 I.326 J-.005 E.01538
G1 X96.748 Y141.645 E.04317
G2 X96.866 Y141.626 I.009 J-.327 E.00356
M204 S10000
G1 X96.961 Y141.876 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15891
G1 F15000
G1 X96.761 Y141.898 E.00184
G3 X95.161 Y141.891 I-.665 J-32.622 E.01466
; LINE_WIDTH: 0.170486
G1 X95.021 Y141.869 E.00142
; LINE_WIDTH: 0.214371
G1 X94.306 Y141.696 E.00997
G1 X94.143 Y141.884 F30000
; LINE_WIDTH: 0.15945
G1 F15000
G3 X93.943 Y141.898 I-.374 J-4.037 E.00184
G1 X92.421 Y141.897 E.01402
G3 X92.294 Y141.888 I.008 J-.984 E.00117
; LINE_WIDTH: 0.177348
G1 X92.221 Y141.874 E.00078
; LINE_WIDTH: 0.230449
G3 X91.638 Y141.718 I.7 J-3.785 E.00895
G1 X91.638 Y140.931 F30000
; LINE_WIDTH: 0.444584
G1 F15000
G1 X91.839 Y141.699 E.02519
; LINE_WIDTH: 0.47162
G1 F14695.59
G1 X91.921 Y141.955 E.00912
G1 X91.86 Y141.955 F30000
; LINE_WIDTH: 0.341164
G1 F15000
G3 X91.786 Y141.352 I4.67 J-.877 E.01432
G3 X91.786 Y138.543 I446.252 J-1.427 E.06618
; WIPE_START
G1 F24000
G1 X91.786 Y140.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.702 J.994 P1  F30000
G1 X94.618 Y138.543 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.349193
G1 F15000
G1 X94.619 Y141.429 E.06981
G2 X94.609 Y141.955 I5.597 J.373 E.01273
G1 X96.961 Y141.876 F30000
; LINE_WIDTH: 0.206668
G1 F15000
G2 X97.07 Y141.842 I-.099 J-.503 E.00149
G1 X97.134 Y141.801 E.00097
; LINE_WIDTH: 0.241956
G1 X97.249 Y141.71 E.00231
; LINE_WIDTH: 0.282281
G2 X97.39 Y141.471 I-.379 J-.385 E.00531
; LINE_WIDTH: 0.344426
G1 X97.431 Y141.267 E.00495
G1 X97.432 Y138.543 E.06486
; WIPE_START
G1 F24000
G1 X97.431 Y140.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.065 J-1.215 P1  F30000
G1 X85.688 Y139.914 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X85.659 Y139.827 I.297 J-.146 E.00274
G3 X85.657 Y139.139 I7.008 J-.367 E.02049
G3 X85.879 Y138.86 I.342 J.045 E.01115
G1 X85.982 Y138.845 E.0031
G1 X89.395 Y138.846 E.10168
G1 X89.395 Y140.098 E.03729
G1 X86.003 Y140.098 E.10103
G3 X85.719 Y139.965 I-.019 J-.331 E.00975
M204 S10000
; WIPE_START
G1 F24000
G1 X85.659 Y139.827 E-.05727
G1 X85.657 Y139.139 E-.26128
G1 X85.682 Y139.031 E-.0421
G1 X85.769 Y138.916 E-.05494
G1 X85.879 Y138.86 E-.04674
G1 X85.982 Y138.845 E-.03955
G1 X86.661 Y138.845 E-.25812
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.847 J.873 P1  F30000
G1 X89.368 Y141.472 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X89.397 Y141.368 I-.303 J-.139 E.00323
G1 X89.395 Y140.589 E.02319
G1 X85.913 Y140.59 E.1037
G3 X85.035 Y139.672 I.063 J-.939 E.04154
G3 X85.138 Y138.859 I1.751 J-.191 E.02463
G3 X86.045 Y138.348 I.825 J.403 E.03298
G1 X90.016 Y138.348 E.11829
G1 X90.016 Y138.39 E.00126
G1 X90.017 Y141.206 E.08387
G3 X89.051 Y142.151 I-.927 J.019 E.04512
G1 X85.406 Y142.151 E.10857
G1 X85.582 Y141.662 E.01547
G1 X89.109 Y141.663 E.10507
G2 X89.338 Y141.524 I-.044 J-.331 E.00822
M204 S10000
G1 X89.512 Y141.739 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.141439
G1 F15000
G3 X89.152 Y141.906 I-.463 J-.526 E.00314
G1 X89.139 Y141.908 E.0001
G3 X85.702 Y141.907 I-1.677 J-124.84 E.02674
G1 X89.512 Y141.739 F30000
; LINE_WIDTH: 0.195818
G1 F15000
G2 X89.647 Y141.537 I-.565 J-.521 E.00294
; LINE_WIDTH: 0.241758
G2 X89.707 Y141.202 I-.716 J-.302 E.00539
; LINE_WIDTH: 0.272387
G1 X89.706 Y140.393 E.01466
G3 X89.706 Y140.294 I.226 J-.048 E.00181
G1 X89.698 Y138.65 E.0298
; LINE_WIDTH: 0.255934
G1 X89.662 Y138.632 E.00067
; LINE_WIDTH: 0.220431
G1 X89.627 Y138.615 E.00056
; LINE_WIDTH: 0.150862
G1 X89.591 Y138.597 E.00034
G2 X85.967 Y138.597 I-1.796 J135.596 E.03091
G1 X85.959 Y138.598 E.00007
G2 X85.571 Y138.738 I.015 J.647 E.00358
; LINE_WIDTH: 0.19733
G2 X85.396 Y138.988 I.413 J.476 E.00375
; LINE_WIDTH: 0.25992
G2 X85.373 Y139.887 I2.023 J.502 E.01555
; LINE_WIDTH: 0.216395
G2 X85.505 Y140.133 I.594 J-.162 E.00386
; LINE_WIDTH: 0.166772
G1 X85.546 Y140.176 E.00058
G2 X85.932 Y140.343 I.431 J-.468 E.00419
; LINE_WIDTH: 0.142897
G1 X89.591 Y140.344 E.0289
; LINE_WIDTH: 0.142168
G1 X89.628 Y140.344 E.00029
; LINE_WIDTH: 0.189339
G1 X89.664 Y140.344 E.00042
; LINE_WIDTH: 0.236509
G1 X89.701 Y140.345 E.00056
; WIPE_START
G1 F24000
G1 X89.664 Y140.344 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.333 J-1.17 P1  F30000
G1 X78.639 Y143.486 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.36 Y143.776 E.02314
G1 X79.36 Y144.463 E.02044
G1 X78.639 Y144.172 E.02314
G1 X78.639 Y143.546 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X79.36 Y143.776 E-.28739
G1 X79.36 Y144.463 E-.26079
G1 X78.843 Y144.254 E-.21182
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.211 J.116 P1  F30000
G1 X79.36 Y138.845 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X82.142 Y138.843 E.08287
G3 X82.147 Y140.67 I-.024 J.914 E.08393
G1 X79.36 Y140.668 E.08301
G1 X79.36 Y138.905 E.05252
M204 S10000
; WIPE_START
G1 F24000
G1 X81.359 Y138.86 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.922 J-.794 P1  F30000
G1 X79.36 Y141.183 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X79.36 Y142.384 E.03576
G1 X78.639 Y142.093 E.02313
G1 X78.639 Y138.347 E.11157
G1 X82.533 Y138.347 E.11599
G1 X82.699 Y138.36 E.00494
G3 X83.774 Y139.823 I-.236 J1.3 E.05963
G3 X83.184 Y140.867 I-1.536 J-.18 E.03667
G3 X83.333 Y142.646 I-1.264 J1.002 E.05635
G3 X81.86 Y143.424 I-1.458 J-.977 E.0517
G1 X79.78 Y143.425 E.06196
G1 X79.78 Y142.905 E.01548
G1 X81.974 Y142.905 E.06536
G2 X81.809 Y141.183 I-.044 J-.864 E.08332
G1 X79.42 Y141.183 E.07117
M204 S10000
G1 X79.164 Y140.925 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.166698
G1 F15000
G1 X79.132 Y140.925 E.00031
; LINE_WIDTH: 0.209906
G1 X79.1 Y140.925 E.00042
; LINE_WIDTH: 0.253113
G1 X79.069 Y140.925 E.00053
; LINE_WIDTH: 0.296321
G1 X79.037 Y140.925 E.00063
; LINE_WIDTH: 0.370822
G1 X79.005 Y140.925 E.00082
G1 X79 Y140.987 E.00161
G1 X79 Y142.027 E.02693
; WIPE_START
G1 F24000
G1 X79 Y140.987 E-.69711
G1 X79.005 Y140.925 E-.04168
G1 X79.037 Y140.925 E-.02121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.122 J.47 P1  F30000
G1 X79.976 Y143.165 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.167674
G1 F15000
G1 X81.852 Y143.164 E.01849
G2 X82.112 Y143.15 I-.007 J-2.548 E.00257
G1 X82.328 Y143.098 E.00219
G1 X82.461 Y143.044 E.00141
; LINE_WIDTH: 0.197861
G1 X82.751 Y142.857 E.00423
; LINE_WIDTH: 0.249094
G1 X82.928 Y142.671 E.00419
; LINE_WIDTH: 0.299067
G1 X83.049 Y142.474 E.00467
; LINE_WIDTH: 0.341101
G2 X83.138 Y142.219 I-1.017 J-.498 E.00639
G1 X83.143 Y142.199 E.00047
; LINE_WIDTH: 0.388932
G2 X83.162 Y142.043 I-2.541 J-.388 E.00431
G1 X83.143 Y141.748 E.00806
; LINE_WIDTH: 0.43139
G2 X83.113 Y141.603 I-2.257 J.388 E.00454
G1 X83.076 Y141.495 E.00352
; LINE_WIDTH: 0.465858
G1 F14895.809
G2 X82.867 Y141.149 I-1.317 J.559 E.01356
; LINE_WIDTH: 0.521366
G1 F13167.627
G2 X82.763 Y141.023 I-1.775 J1.369 E.00617
G1 X82.647 Y141.245 F30000
; LINE_WIDTH: 0.552706
G1 F12358.124
G1 X82.732 Y140.961 E.01193
; LINE_WIDTH: 0.518469
G1 F13247.859
G1 X82.741 Y140.933 E.00111
; LINE_WIDTH: 0.475174
G1 F14574.791
G1 X82.75 Y140.907 E.00096
; LINE_WIDTH: 0.436736
G1 F15000
G1 X82.764 Y140.878 E.00101
; LINE_WIDTH: 0.400632
G1 X82.778 Y140.848 E.00092
; LINE_WIDTH: 0.352591
G1 X82.801 Y140.805 E.00118
; LINE_WIDTH: 0.284309
G2 X83.174 Y140.414 I-2.869 J-3.102 E.01031
; LINE_WIDTH: 0.327282
G2 X83.287 Y140.232 I-.688 J-.556 E.00483
; LINE_WIDTH: 0.37941
G1 X83.34 Y140.11 E.00354
G2 X83.401 Y139.746 I-1.063 J-.366 E.00984
; LINE_WIDTH: 0.400247
G2 X83.087 Y138.925 I-1.172 J-.023 E.02543
; LINE_WIDTH: 0.364661
G1 X82.984 Y138.833 E.00351
; LINE_WIDTH: 0.343545
G2 X82.834 Y138.733 I-.566 J.69 E.00431
; LINE_WIDTH: 0.30322
G1 X82.682 Y138.669 E.00339
; LINE_WIDTH: 0.25709
G2 X82.523 Y138.628 I-.304 J.855 E.00278
; LINE_WIDTH: 0.197679
G1 X82.495 Y138.622 E.00034
G2 X82.335 Y138.605 I-.254 J1.611 E.00197
; LINE_WIDTH: 0.147325
G1 X79.164 Y138.596 E.02615
; LINE_WIDTH: 0.14812
G1 X79.054 Y138.651 E.00102
; LINE_WIDTH: 0.183188
G1 X78.945 Y138.705 E.00135
; LINE_WIDTH: 0.218255
G1 X78.836 Y138.76 E.00169
G1 X79 Y138.543 F30000
; LINE_WIDTH: 0.371367
G1 F15000
G1 X79.005 Y140.925 E.0618
G1 X79.164 Y140.925 F30000
; LINE_WIDTH: 0.164978
G1 F15000
G1 X82.119 Y140.932 E.02849
; LINE_WIDTH: 0.219948
G2 X83.034 Y140.998 I1.709 J-17.146 E.01284
; WIPE_START
G1 F24000
G1 X82.119 Y140.932 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.164 J-.355 P1  F30000
G1 X79.436 Y132.136 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.436 Y136.41 E.12731
G1 X78.715 Y136.41 E.02146
G1 X78.715 Y131.556 E.14459
G1 X82.382 Y131.556 E.10923
G1 X82.206 Y132.051 E.01565
G1 X82.175 Y132.136 E.00269
G1 X79.496 Y132.136 E.07982
M204 S10000
G1 X79.24 Y131.846 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230826
G1 F15000
G1 X79.185 Y131.869 E.00088
; LINE_WIDTH: 0.278158
G1 X79.131 Y131.893 E.0011
; LINE_WIDTH: 0.3706
G1 X79.076 Y131.917 E.00154
G1 X79.075 Y131.94 E.00059
G1 X79.075 Y136.214 E.11063
G1 X79.24 Y131.846 F30000
; LINE_WIDTH: 0.230826
G1 F15000
G1 X82.071 Y131.846 E.04202
; WIPE_START
G1 F24000
G1 X80.071 Y131.846 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.383 J1.155 P1  F30000
G1 X84.129 Y133.193 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X84.054 Y133.032 I.249 J-.215 E.00537
G3 X84.052 Y132.347 I6.973 J-.364 E.0204
G3 X84.274 Y132.069 I.342 J.045 E.01115
G1 X84.377 Y132.053 E.0031
G1 X87.79 Y132.054 E.10168
G1 X87.79 Y133.306 E.03729
G1 X84.398 Y133.306 E.10103
G3 X84.173 Y133.235 I-.02 J-.328 E.00722
M204 S10000
; WIPE_START
G1 F24000
G1 X84.075 Y133.112 E-.0594
G1 X84.054 Y133.032 E-.03166
G1 X84.052 Y132.347 E-.26012
G1 X84.077 Y132.239 E-.04212
G1 X84.164 Y132.124 E-.05489
G1 X84.274 Y132.069 E-.04675
G1 X84.377 Y132.053 E-.03953
G1 X84.97 Y132.053 E-.22554
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.64 J1.035 P1  F30000
G1 X87.79 Y133.797 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X84.308 Y133.798 E.1037
G3 X83.43 Y132.877 I.058 J-.934 E.04167
G3 X83.533 Y132.067 I1.677 J-.199 E.02457
G3 X84.335 Y131.556 I.81 J.386 E.02986
G1 X88.411 Y131.556 E.12142
G1 X88.414 Y134.364 E.08364
G3 X87.33 Y135.359 I-.948 J.056 E.05016
G1 X83.801 Y135.359 E.10512
G1 X83.977 Y134.871 E.01547
G1 X87.504 Y134.871 E.10507
G2 X87.792 Y134.576 I-.044 J-.331 E.01324
G1 X87.79 Y133.857 E.0214
M204 S10000
G1 X87.986 Y133.552 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.145452
G1 F15000
G1 X84.396 Y133.552 E.02908
G3 X83.929 Y133.373 I-.027 J-.627 E.00417
G1 X83.917 Y133.362 E.00013
; LINE_WIDTH: 0.213932
G3 X83.772 Y133.105 I.443 J-.42 E.00402
; LINE_WIDTH: 0.258052
G3 X83.791 Y132.195 I2.11 J-.41 E.01558
; LINE_WIDTH: 0.200119
G3 X83.951 Y131.962 I.605 J.242 E.00354
; LINE_WIDTH: 0.151106
G3 X84.34 Y131.806 I.437 J.528 E.00364
G1 X87.986 Y131.805 E.03116
G1 X88.022 Y131.823 E.00034
; LINE_WIDTH: 0.220339
G1 X88.057 Y131.841 E.00056
; LINE_WIDTH: 0.255828
G1 X88.093 Y131.858 E.00067
; LINE_WIDTH: 0.273364
G3 X88.101 Y134.476 I-220.463 J1.958 E.04766
; LINE_WIDTH: 0.236244
G3 X88.039 Y134.752 I-.83 J-.041 E.00433
; LINE_WIDTH: 0.195487
G3 X87.908 Y134.947 I-.711 J-.338 E.00284
; LINE_WIDTH: 0.141302
G3 X87.544 Y135.114 I-.516 J-.641 E.00314
G1 X87.534 Y135.116 E.00008
G3 X84.097 Y135.115 I-1.659 J-135.262 E.02671
; WIPE_START
G1 F24000
G1 X86.097 Y135.116 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.776 J.937 P1  F30000
G1 X87.986 Y133.552 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.142152
G1 F15000
G1 X88.023 Y133.552 E.00029
; LINE_WIDTH: 0.189661
G1 X88.06 Y133.553 E.00042
; LINE_WIDTH: 0.23717
G1 X88.096 Y133.553 E.00056
; WIPE_START
G1 F24000
G1 X88.06 Y133.553 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.296 J1.18 P1  F30000
G1 X93.518 Y132.182 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X93.587 Y132.379 I-.265 J.202 E.00631
G1 X93.586 Y134.542 E.06442
G3 X93.262 Y134.852 I-.326 J-.016 E.01473
G1 X90.557 Y134.853 E.08056
G1 X90.557 Y132.054 E.08337
G1 X93.221 Y132.053 E.07936
G3 X93.478 Y132.138 I.032 J.332 E.00828
M204 S10000
; WIPE_START
G1 F24000
G1 X93.557 Y132.243 E-.04991
G1 X93.587 Y132.379 E-.05302
G1 X93.586 Y134.108 E-.65707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.465 J-1.125 P1  F30000
G1 X90.557 Y135.36 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X90.557 Y136.413 E.03139
G1 X89.837 Y136.413 E.02146
G1 X89.837 Y131.556 E.1447
G1 X93.414 Y131.556 E.10655
G3 X94.283 Y132.509 I-.064 J.931 E.04241
G1 X94.285 Y134.394 E.05616
G3 X93.273 Y135.36 I-.936 J.032 E.04704
G1 X90.617 Y135.36 E.0791
M204 S10000
G1 X90.329 Y135.106 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159549
G1 F15000
G1 X93.435 Y135.093 E.02861
G2 X93.562 Y135.052 I-.221 J-.896 E.00123
; LINE_WIDTH: 0.224329
G1 X93.593 Y135.037 E.0005
G2 X93.744 Y134.93 I-.319 J-.603 E.00266
; LINE_WIDTH: 0.267709
G1 X93.767 Y134.902 E.00063
G2 X93.873 Y134.742 I-.828 J-.664 E.00343
; LINE_WIDTH: 0.307757
G2 X93.925 Y134.561 I-.906 J-.353 E.00394
; LINE_WIDTH: 0.346565
G2 X93.935 Y134.386 I-1.322 J-.17 E.0042
G1 X93.935 Y132.519 E.04478
G2 X93.89 Y132.215 I-.937 J-.017 E.00741
; LINE_WIDTH: 0.286496
G1 X93.795 Y132.042 E.00379
; LINE_WIDTH: 0.243581
G1 X93.747 Y131.986 E.00117
G2 X93.628 Y131.892 I-.966 J1.1 E.00241
; LINE_WIDTH: 0.191578
G1 X93.592 Y131.873 E.00048
G2 X93.395 Y131.813 I-.308 J.659 E.00243
; LINE_WIDTH: 0.148748
G1 X90.361 Y131.805 E.02536
; LINE_WIDTH: 0.149016
G1 X90.252 Y131.859 E.00103
; LINE_WIDTH: 0.184386
G1 X90.142 Y131.914 E.00137
; LINE_WIDTH: 0.219755
G1 X90.033 Y131.969 E.00171
G1 X90.197 Y131.752 F30000
; LINE_WIDTH: 0.371346
G1 F15000
G1 X90.197 Y135.049 E.08553
G3 X90.197 Y135.164 I-.326 J.057 E.003
G1 X90.197 Y136.217 E.02734
G1 X90.202 Y135.106 F30000
; LINE_WIDTH: 0.381279
G1 F15000
G1 X90.234 Y135.106 E.00085
; LINE_WIDTH: 0.336598
G1 X90.266 Y135.106 E.00074
; LINE_WIDTH: 0.291918
G1 X90.298 Y135.106 E.00063
; LINE_WIDTH: 0.247237
G1 X90.329 Y135.106 E.00051
; WIPE_START
G1 F24000
G1 X90.298 Y135.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.441 J-1.134 P1  F30000
G1 X76.306 Y129.672 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X76.789 Y128.666 E.03589
G3 X93.145 Y118.337 I16.92 J8.68 E.65257
G3 X99.549 Y119.254 I.564 J18.889 E.20906
G1 X99.801 Y119.331 E.00845
G3 X76.285 Y129.728 I-6.091 J18.015 E2.93438
G1 X76.827 Y129.491 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X77.138 Y128.845 E.02135
G3 X93.157 Y118.729 I16.572 J8.501 E.59201
G3 X99.435 Y119.629 I.552 J18.502 E.18985
G1 X99.675 Y119.702 E.00748
G3 X76.663 Y129.842 I-5.966 J17.644 E2.66348
G1 X76.802 Y129.545 E.00975
M204 S10000
; WIPE_START
G1 F24000
G1 X77.138 Y128.845 E-.29521
G1 X77.668 Y127.877 E-.41952
G1 X77.732 Y127.776 E-.04528
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.93 J.785 P1  F30000
G1 X100.997 Y155.321 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X79.791 Y123.839 I-7.295 J-17.969 E1.70087
G3 X94.531 Y117.976 I13.92 J13.536 E.52549
G3 X101.053 Y155.299 I-.83 J19.376 E1.69009
G1 X101.144 Y155.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X79.509 Y123.566 I-7.443 J-18.332 E1.60736
G3 X94.554 Y117.584 I14.202 J13.81 E.4968
G3 X101.2 Y155.662 I-.853 J19.767 E1.597
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X100.047 Y156.098 E-.46843
G1 X99.313 Y156.322 E-.29157
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/15
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I.796 J.92 P1  F30000
G1 X139.109 Y121.905 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X139.995 Y121.227 E.03588
G3 X150.513 Y117.648 I11.118 J15.429 E.36255
G1 X151.641 Y117.646 E.03625
G3 X139.063 Y121.943 I-.528 J19.01 E3.40566
G1 X139.348 Y122.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X150.526 Y118.04 I11.764 J14.439 E.3618
G1 X151.63 Y118.038 E.03289
G3 X139.302 Y122.255 I-.517 J18.618 E3.08925
M204 S10000
; WIPE_START
G1 F24000
G1 X140.224 Y121.544 E-.44233
G1 X140.917 Y121.076 E-.31767
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.493 J-1.112 P1  F30000
G1 X137.993 Y122.373 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X152.293 Y117.307 I13.107 J14.28 E.50124
G3 X133.839 Y127.835 I-1.187 J19.357 E3.19529
G3 X137.949 Y122.413 I17.261 J8.818 E.21991
G1 X137.728 Y122.084 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X151.662 Y116.878 I13.385 J14.571 E.45423
G1 X152.316 Y116.915 E.01951
G1 X152.833 Y116.945 E.01543
G3 X137.684 Y122.125 I-1.72 J19.711 E3.21201
M204 S10000
; WIPE_START
G1 F24000
G1 X138.615 Y121.316 E-.46847
G1 X139.224 Y120.849 E-.29153
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.111 J.497 P1  F30000
G1 X145.285 Y134.413 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.274 Y128.054 E.20448
G1 X149.988 Y128.045 E.15161
G1 X149.992 Y129.86 E.05836
G1 X149.997 Y132.503 E.08497
G1 X145.341 Y134.39 E.16156
G1 X144.894 Y134.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.881 Y127.663 E.21839
G1 X150.38 Y127.652 E.1638
G1 X150.384 Y129.86 E.06574
G1 X150.389 Y132.767 E.08659
G1 X144.95 Y134.972 E.17484
M204 S10000
; WIPE_START
G1 F24000
G1 X144.931 Y132.972 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.736 J.969 P1  F30000
G1 X147.636 Y130.916 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580126
G1 F11727.345
G1 X147.635 Y130.467 E.01904
G1 X147.18 Y131.594 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X148.094 Y131.224 E.02937
G1 X148.092 Y129.949 E.03796
G1 X147.177 Y129.951 E.02723
G1 X147.18 Y131.534 E.04715
G1 X146.804 Y132.153 F30000
G1 F15000
M73 P87 R2
G1 X148.472 Y131.477 E.05359
G1 X148.468 Y129.571 E.05677
G1 X146.8 Y129.575 E.04969
G1 X146.804 Y132.093 E.07502
G1 X146.428 Y132.713 F30000
G1 F15000
G1 X148.849 Y131.731 E.07781
G1 X148.844 Y129.194 E.07558
G1 X146.422 Y129.198 E.07216
G1 X146.428 Y132.653 E.1029
G1 X146.052 Y133.272 F30000
G1 F15000
G1 X149.227 Y131.985 E.10203
G1 X149.221 Y128.816 E.0944
G1 X146.044 Y128.822 E.09462
G1 X146.052 Y133.212 E.13077
G1 X145.676 Y133.831 F30000
G1 F15000
G1 X149.604 Y132.239 E.12626
G1 X149.597 Y128.438 E.11321
G1 X145.666 Y128.445 E.11708
G1 X145.676 Y133.771 E.15864
; WIPE_START
G1 F24000
G1 X145.672 Y131.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.553 J1.084 P1  F30000
G1 X156.853 Y137.471 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X152.134 Y135.578 E.16349
G1 X152.12 Y128.041 E.24235
G1 X156.835 Y128.032 E.15163
G1 X156.843 Y132.265 E.1361
G1 X156.853 Y137.411 E.16548
G1 X157.246 Y138.051 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.743 Y135.843 E.17663
G1 X151.727 Y127.65 E.24406
G1 X157.227 Y127.64 E.16381
G1 X157.235 Y132.264 E.13775
G1 X157.246 Y137.991 E.17059
M204 S10000
; WIPE_START
G1 F24000
G1 X155.383 Y137.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.174 J-.32 P1  F30000
G1 X154.489 Y133.982 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580196
G1 F11725.818
G1 X154.482 Y130.454 E.14973
G1 X154.032 Y134.292 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X154.947 Y134.659 E.02937
G1 X154.938 Y129.936 E.14067
G1 X154.024 Y129.938 E.02724
G1 X154.032 Y134.232 E.12789
G1 X153.656 Y134.547 F30000
G1 F15000
G1 X155.325 Y135.217 E.05359
G1 X155.315 Y129.559 E.16854
G1 X153.646 Y129.562 E.0497
G1 X153.656 Y134.487 E.14671
G1 X153.279 Y134.802 F30000
G1 F15000
G1 X155.704 Y135.775 E.07781
M73 P88 R2
G1 X155.691 Y129.181 E.19641
G1 X153.268 Y129.185 E.07217
G1 X153.279 Y134.742 E.16552
G1 X152.902 Y135.057 F30000
G1 F15000
G1 X156.082 Y136.333 E.10203
G1 X156.068 Y128.803 E.22429
G1 X152.89 Y128.809 E.09463
G1 X152.902 Y134.997 E.18433
G1 X152.526 Y135.313 F30000
G1 F15000
G1 X156.46 Y136.891 E.12626
G1 X156.444 Y128.425 E.25216
G1 X152.513 Y128.433 E.1171
G1 X152.526 Y135.253 E.20315
; WIPE_START
G1 F24000
G1 X152.522 Y133.253 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.213 J-.1 P1  F30000
G1 X152.138 Y137.921 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.93 Y138.639 E.06208
G1 X156.857 Y139.814 E.10142
G1 X156.866 Y144.271 E.14335
G1 X152.151 Y144.28 E.15161
G1 X152.139 Y137.981 E.20258
G1 X151.745 Y137.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X154.076 Y138.275 E.07481
G1 X157.249 Y139.548 E.10183
G1 X157.259 Y144.663 E.15235
G1 X151.76 Y144.673 E.1638
G1 X151.745 Y137.4 E.21663
M204 S10000
; WIPE_START
G1 F24000
G1 X153.618 Y138.103 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.185 J.275 P1  F30000
G1 X154.504 Y141.918 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580086
G1 F11728.218
G1 X154.503 Y141.469 E.01906
G1 X154.044 Y140.733 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X154.048 Y142.376 E.04896
G1 X154.962 Y142.375 E.02723
G1 X154.959 Y141.1 E.03797
G1 X154.1 Y140.755 E.02758
G1 X153.666 Y140.175 F30000
G1 F15000
G1 X153.671 Y142.754 E.07683
G1 X155.34 Y142.751 E.04969
G1 X155.336 Y140.845 E.05678
G1 X153.722 Y140.197 E.0518
G1 X153.288 Y139.617 F30000
G1 F15000
G1 X153.295 Y143.132 E.1047
G1 X155.717 Y143.127 E.07216
G1 X155.713 Y140.589 E.0756
G1 X153.344 Y139.639 E.07603
G1 X152.91 Y139.059 F30000
G1 F15000
G1 X152.919 Y143.51 E.13258
G1 X156.095 Y143.504 E.09462
G1 X156.089 Y140.334 E.09441
G1 X152.966 Y139.081 E.10025
G1 X152.532 Y138.501 F30000
G1 F15000
G1 X152.542 Y143.887 E.16045
G1 X156.473 Y143.88 E.11708
G1 X156.466 Y140.079 E.11322
G1 X152.587 Y138.523 E.12447
; WIPE_START
G1 F24000
G1 X154.444 Y139.268 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.858 J-.863 P1  F30000
G1 X150.001 Y134.846 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X150.009 Y138.789 E.12677
G1 X150.019 Y144.284 E.17672
G1 X145.304 Y144.293 E.15161
G1 X145.289 Y136.757 E.24233
G1 X149.946 Y134.869 E.16157
G1 X150.392 Y134.265 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X150.401 Y138.788 E.13473
G1 X150.412 Y144.676 E.17538
G1 X144.913 Y144.686 E.1638
G1 X144.897 Y136.493 E.24403
G1 X150.337 Y134.287 E.17485
M204 S10000
; WIPE_START
G1 F24000
G1 X150.365 Y136.287 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.097 J-.526 P1  F30000
G1 X147.657 Y141.931 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580074
G1 F11728.48
G1 X147.65 Y138.404 E.14967
G1 X147.192 Y138.036 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X147.201 Y142.389 E.12966
G1 X148.115 Y142.387 E.02723
G1 X148.106 Y137.666 E.14065
G1 X147.248 Y138.014 E.02758
G1 X146.815 Y137.782 F30000
G1 F15000
G1 X146.824 Y142.767 E.14847
G1 X148.493 Y142.764 E.04969
G1 X148.482 Y137.106 E.16852
G1 X146.87 Y137.76 E.05181
G1 X146.437 Y137.529 F30000
G1 F15000
G1 X146.448 Y143.145 E.16728
G1 X148.871 Y143.14 E.07216
G1 X148.858 Y136.547 E.19639
G1 X146.493 Y137.506 E.07603
G1 X146.06 Y137.275 F30000
G1 F15000
G1 X146.072 Y143.523 E.1861
G1 X149.248 Y143.517 E.09462
G1 X149.234 Y135.987 E.22427
G1 X146.115 Y137.252 E.10025
G1 X145.682 Y137.021 F30000
G1 F15000
G1 X145.695 Y143.9 E.20491
G1 X149.626 Y143.893 E.11708
G1 X149.61 Y135.428 E.25214
G1 X145.738 Y136.999 E.12448
; WIPE_START
G1 F24000
G1 X147.591 Y136.247 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.077 J-1.215 P1  F30000
G1 X105.683 Y138.898 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G2 X105.533 Y139.132 I.183 J.283 E.00855
G1 X105.534 Y142.151 E.08992
G1 X104.904 Y142.151 E.01874
G1 X104.907 Y139.231 E.08699
G3 X106.012 Y138.347 I.967 J.077 E.04722
G1 X108.579 Y138.348 E.07646
G3 X109.463 Y139.3 I-.058 J.94 E.04271
G1 X109.463 Y142.151 E.08494
G1 X108.842 Y142.151 E.01849
G1 X108.843 Y139.147 E.0895
G2 X108.505 Y138.844 I-.331 J.03 E.01489
G1 X105.885 Y138.844 E.07803
G2 X105.737 Y138.87 I-.019 J.336 E.00453
M204 S10000
G1 X105.397 Y138.785 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151656
G1 F15000
G3 X105.744 Y138.603 I.425 J.389 E.00343
G1 X108.51 Y138.596 E.02376
G3 X108.733 Y138.63 I.023 J.606 E.00195
G1 X108.796 Y138.657 E.0006
; LINE_WIDTH: 0.196351
G3 X109.088 Y138.957 I-.267 J.553 E.00517
G1 X109.096 Y138.974 E.00023
; LINE_WIDTH: 0.269616
G3 X109.153 Y139.309 I-.683 J.288 E.00614
G1 X109.153 Y141.955 E.04739
; WIPE_START
G1 F24000
G1 X109.153 Y139.955 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.552 J-1.085 P1  F30000
G1 X105.219 Y141.955 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.275666
G1 F15000
G1 X105.22 Y139.248 E.04976
G3 X105.233 Y139.102 I1.452 J.059 E.00271
G1 X105.241 Y139.071 E.00058
; LINE_WIDTH: 0.219229
G3 X105.381 Y138.802 I.712 J.201 E.00425
G1 X105.397 Y138.785 E.00033
; WIPE_START
G1 F24000
G1 X105.381 Y138.802 E-.05474
G1 X105.298 Y138.927 E-.34545
G1 X105.241 Y139.071 E-.3598
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.051 J-1.216 P1  F30000
G1 X99.826 Y138.845 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.509 Y138.845 E.07994
G3 X102.853 Y139.142 I.022 J.322 E.01501
G1 X102.855 Y141.33 E.06518
G3 X102.449 Y141.644 I-.341 J-.021 E.0173
G1 X99.826 Y141.644 E.07815
G1 X99.826 Y138.905 E.08158
M204 S10000
; WIPE_START
G1 F24000
G1 X101.825 Y138.861 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.04 J-.632 P1  F30000
G1 X99.826 Y142.151 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X99.826 Y143.205 E.03139
G1 X99.105 Y143.205 E.02145
G1 X99.105 Y138.347 E.1447
G1 X102.683 Y138.347 E.10657
G3 X103.552 Y139.315 I-.071 J.938 E.04277
G3 X103.55 Y141.253 I-58.676 J.92 E.05773
G3 X102.592 Y142.151 I-.929 J-.03 E.04346
G1 X99.886 Y142.151 E.08063
M204 S10000
G1 X99.598 Y141.898 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159862
G1 F15000
G1 X102.658 Y141.892 E.02827
G2 X102.845 Y141.839 I-.213 J-1.102 E.0018
; LINE_WIDTH: 0.225449
G1 X102.856 Y141.833 E.00017
G2 X103.006 Y141.727 I-.354 J-.657 E.00266
; LINE_WIDTH: 0.264869
G2 X103.135 Y141.549 I-.559 J-.541 E.00387
; LINE_WIDTH: 0.307963
G1 X103.149 Y141.513 E.00081
G2 X103.192 Y141.351 I-1.013 J-.357 E.00352
; LINE_WIDTH: 0.346471
G2 X103.204 Y141.082 I-1.474 J-.2 E.00645
G2 X103.2 Y139.228 I-35.796 J-.852 E.04448
G2 X103.172 Y139.05 I-.638 J.01 E.00432
; LINE_WIDTH: 0.299398
G1 X103.091 Y138.873 E.00395
; LINE_WIDTH: 0.25519
G1 X103.051 Y138.817 E.00115
G2 X102.947 Y138.718 I-1.464 J1.435 E.0024
; LINE_WIDTH: 0.211776
G1 X102.92 Y138.699 E.00044
G2 X102.773 Y138.629 I-.467 J.785 E.00218
; LINE_WIDTH: 0.150332
G2 X102.516 Y138.596 I-.221 J.722 E.00221
G1 X99.629 Y138.596 E.02449
; LINE_WIDTH: 0.148936
G1 X99.52 Y138.651 E.00102
; LINE_WIDTH: 0.184278
G1 X99.411 Y138.706 E.00137
; LINE_WIDTH: 0.219619
G1 X99.301 Y138.76 E.00171
G1 X99.465 Y138.543 F30000
; LINE_WIDTH: 0.371193
G1 F15000
G1 X99.465 Y141.84 E.08549
G3 X99.465 Y141.955 I-.326 J.057 E.003
G1 X99.465 Y143.009 E.02733
G1 X99.47 Y141.898 F30000
; LINE_WIDTH: 0.381136
G1 F15000
G1 X99.502 Y141.898 E.00085
; LINE_WIDTH: 0.33649
G1 X99.534 Y141.898 E.00074
; LINE_WIDTH: 0.291843
G1 X99.566 Y141.898 E.00063
; LINE_WIDTH: 0.247197
G1 X99.598 Y141.898 E.00051
; WIPE_START
G1 F24000
G1 X99.566 Y141.898 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.135 J-1.209 P1  F30000
G1 X96.918 Y141.602 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G2 X97.084 Y141.331 I-.162 J-.286 E.0099
G1 X97.084 Y138.347 E.08887
G1 X97.779 Y138.347 E.02071
G1 X97.779 Y141.255 E.08661
G3 X96.895 Y142.15 I-.952 J-.056 E.04094
G1 X91.442 Y142.151 E.16242
G1 X91.442 Y138.347 E.1133
G1 X92.13 Y138.347 E.02048
G1 X92.13 Y141.048 E.08044
G1 X92.132 Y141.373 E.00966
G2 X92.402 Y141.642 I.327 J-.058 E.01209
G1 X93.925 Y141.645 E.04537
G2 X94.272 Y141.291 I.016 J-.332 E.01667
G1 X94.271 Y138.347 E.08767
G1 X94.965 Y138.347 E.02066
G1 X94.965 Y141.33 E.08884
G2 X95.303 Y141.645 I.327 J-.012 E.01529
G1 X96.74 Y141.645 E.04279
G2 X96.863 Y141.627 I.016 J-.328 E.00375
M204 S10000
G1 X96.887 Y141.89 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.20047
G1 F15000
G2 X97.01 Y141.865 I-.165 J-1.133 E.00157
G1 X97.124 Y141.807 E.00159
; LINE_WIDTH: 0.250203
G1 X97.211 Y141.747 E.00173
G1 X97.297 Y141.652 E.0021
; LINE_WIDTH: 0.284361
G1 X97.382 Y141.492 E.00346
; LINE_WIDTH: 0.344444
G2 X97.432 Y141.243 I-.805 J-.289 E.00607
G1 X97.432 Y138.543 E.06429
; WIPE_START
G1 F24000
G1 X97.432 Y140.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.705 J-.992 P1  F30000
G1 X94.618 Y138.543 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.347296
G1 F15000
G2 X94.622 Y141.954 I244.327 J1.41 E.08201
G1 X94.918 Y141.685 F30000
; LINE_WIDTH: 0.237268
G1 F15000
G1 X94.234 Y141.863 E.01085
; LINE_WIDTH: 0.225638
G1 X94.169 Y141.876 E.00096
; LINE_WIDTH: 0.159595
G1 X94.104 Y141.889 E.00061
G3 X93.933 Y141.898 I-.335 J-4.838 E.00157
G1 X92.354 Y141.895 E.01455
; LINE_WIDTH: 0.162915
G1 X92.271 Y141.882 E.0008
; LINE_WIDTH: 0.210024
G3 X91.638 Y141.737 I.513 J-3.676 E.00859
G1 X91.898 Y141.955 F30000
; LINE_WIDTH: 0.426062
G1 F15000
G1 X91.818 Y141.615 E.01059
; LINE_WIDTH: 0.402092
G1 X91.804 Y141.535 E.0023
; LINE_WIDTH: 0.340015
G3 X91.786 Y141.049 I5.634 J-.459 E.01142
G1 X91.786 Y138.543 E.0588
; WIPE_START
G1 F24000
G1 X91.786 Y140.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.514 J1.103 P1  F30000
G1 X94.293 Y141.711 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.201365
G1 F15000
G1 X95.049 Y141.875 E.00968
; LINE_WIDTH: 0.157451
G1 X95.292 Y141.897 E.00221
G2 X96.745 Y141.897 I.726 J-39.715 E.01315
G1 X96.887 Y141.89 E.00128
; WIPE_START
G1 F24000
G1 X96.745 Y141.897 E-.05848
G1 X95.292 Y141.897 E-.60066
G1 X95.049 Y141.875 E-.10086
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.242 J-1.193 P1  F30000
G1 X85.735 Y139.982 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X85.659 Y139.823 I.259 J-.221 E.0053
G3 X85.657 Y139.139 I6.808 J-.364 E.02039
G3 X85.867 Y138.864 I.346 J.046 E.01081
G1 X85.977 Y138.845 E.0033
G1 X89.395 Y138.846 E.10183
G1 X89.395 Y140.098 E.03729
G1 X86.043 Y140.098 E.09987
G3 X85.777 Y140.024 I-.049 J-.337 E.00844
M204 S10000
; WIPE_START
G1 F24000
G1 X85.68 Y139.904 E-.05888
G1 X85.659 Y139.823 E-.03151
G1 X85.657 Y139.139 E-.25996
G1 X85.682 Y139.031 E-.0424
G1 X85.767 Y138.918 E-.05365
G1 X85.867 Y138.864 E-.04324
G1 X85.977 Y138.845 E-.04214
G1 X86.577 Y138.845 E-.22822
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.848 J.873 P1  F30000
G1 X89.335 Y141.526 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X89.397 Y141.366 I-.273 J-.197 E.00516
G1 X89.395 Y140.589 E.02314
G1 X85.901 Y140.589 E.10406
G3 X85.035 Y139.657 I.08 J-.944 E.04158
G3 X85.164 Y138.811 I1.536 J-.199 E.02584
G3 X85.882 Y138.35 I.785 J.435 E.02647
G1 X90.016 Y138.348 E.12315
G1 X90.017 Y141.145 E.08334
G3 X89.05 Y142.151 I-.932 J.071 E.0469
G1 X85.406 Y142.151 E.10855
G1 X85.582 Y141.662 E.01547
G1 X89.107 Y141.663 E.10501
G2 X89.296 Y141.571 I-.045 J-.334 E.00636
M204 S10000
G1 X89.554 Y141.692 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.211986
G1 F15000
G1 X89.575 Y141.664 E.00046
G2 X89.689 Y141.405 I-.538 J-.392 E.00381
; LINE_WIDTH: 0.270922
G1 X89.691 Y141.391 E.00026
G2 X89.706 Y140.393 I-7.776 J-.61 E.01798
G3 X89.706 Y140.294 I.226 J-.048 E.0018
G1 X89.698 Y138.65 E.02961
; LINE_WIDTH: 0.255266
G1 X89.662 Y138.632 E.00066
; LINE_WIDTH: 0.219853
G1 X89.627 Y138.615 E.00055
; LINE_WIDTH: 0.151141
G1 X89.591 Y138.597 E.00034
G1 X85.951 Y138.598 E.03112
G2 X85.536 Y138.775 I.016 J.613 E.00395
; LINE_WIDTH: 0.209287
G2 X85.366 Y139.082 I.384 J.413 E.00469
; LINE_WIDTH: 0.262754
G1 X85.359 Y139.116 E.00061
G2 X85.389 Y139.931 I2.371 J.322 E.01423
; LINE_WIDTH: 0.206005
G1 X85.433 Y140.034 E.00144
G2 X85.562 Y140.19 I.537 J-.309 E.00262
; LINE_WIDTH: 0.144268
G2 X86.041 Y140.344 I.421 J-.49 E.00414
G1 X89.591 Y140.344 E.02842
; LINE_WIDTH: 0.142262
G1 X89.628 Y140.344 E.00029
; LINE_WIDTH: 0.189426
G1 X89.664 Y140.345 E.00042
; LINE_WIDTH: 0.23659
G1 X89.701 Y140.345 E.00056
G1 X89.554 Y141.692 F30000
; LINE_WIDTH: 0.142104
G1 F15000
G3 X89.155 Y141.905 I-.474 J-.407 E.00362
G1 X85.702 Y141.907 E.02705
; WIPE_START
G1 F24000
G1 X87.702 Y141.905 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.051 J.613 P1  F30000
G1 X93.425 Y132.098 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X93.587 Y132.376 I-.184 J.293 E.00995
G1 X93.587 Y134.495 E.06313
G3 X93.255 Y134.852 I-.328 J.028 E.01638
G1 X90.557 Y134.853 E.08035
G1 X90.557 Y132.054 E.08337
G1 X93.164 Y132.054 E.07764
G3 X93.372 Y132.07 I.077 J.337 E.00632
M204 S10000
; WIPE_START
G1 F24000
G1 X93.504 Y132.159 E-.06053
G1 X93.551 Y132.228 E-.03159
G1 X93.587 Y132.376 E-.05778
G1 X93.587 Y133.981 E-.6101
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.504 J-1.108 P1  F30000
G1 X90.557 Y135.36 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X90.557 Y136.413 E.03139
G1 X89.837 Y136.413 E.02146
G1 X89.837 Y131.556 E.1447
G1 X93.416 Y131.556 E.10661
G3 X94.284 Y132.539 I-.067 J.934 E.04328
G1 X94.285 Y134.405 E.05557
G3 X93.3 Y135.36 I-.933 J.023 E.04588
G1 X90.617 Y135.36 E.07992
M204 S10000
G1 X90.329 Y135.106 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159931
G1 F15000
G1 X93.265 Y135.106 E.02713
G1 X93.451 Y135.089 E.00173
G2 X93.573 Y135.047 I-.367 J-1.261 E.00119
; LINE_WIDTH: 0.223942
G1 X93.596 Y135.035 E.00038
G2 X93.725 Y134.945 I-.252 J-.494 E.00226
; LINE_WIDTH: 0.265567
G2 X93.871 Y134.744 I-.401 J-.445 E.0044
; LINE_WIDTH: 0.315404
G1 X93.883 Y134.718 E.00061
G2 X93.933 Y134.48 I-.707 J-.274 E.00525
; LINE_WIDTH: 0.346118
G1 X93.936 Y134.393 E.0021
G2 X93.933 Y132.452 I-43.319 J-.91 E.04649
G1 X93.891 Y132.219 E.00568
; LINE_WIDTH: 0.282442
G2 X93.764 Y132.007 I-.545 J.181 E.00471
; LINE_WIDTH: 0.237486
G1 X93.711 Y131.952 E.00118
G2 X93.604 Y131.88 I-.636 J.823 E.00198
; LINE_WIDTH: 0.190982
G1 X93.559 Y131.856 E.00059
G2 X93.396 Y131.812 I-.511 J1.568 E.00198
; LINE_WIDTH: 0.150572
G1 X90.361 Y131.805 E.02581
; LINE_WIDTH: 0.148906
G1 X90.252 Y131.859 E.00102
; LINE_WIDTH: 0.184242
G1 X90.142 Y131.914 E.00137
; LINE_WIDTH: 0.219577
G1 X90.033 Y131.969 E.00171
G1 X90.197 Y131.752 F30000
; LINE_WIDTH: 0.371348
G1 F15000
G1 X90.197 Y135.049 E.08553
G3 X90.197 Y135.163 I-.326 J.057 E.003
G1 X90.197 Y136.217 E.02734
G1 X90.202 Y135.106 F30000
; LINE_WIDTH: 0.381278
G1 F15000
G1 X90.234 Y135.106 E.00085
; LINE_WIDTH: 0.336593
G1 X90.266 Y135.106 E.00074
; LINE_WIDTH: 0.291909
G1 X90.298 Y135.106 E.00063
; LINE_WIDTH: 0.247225
G1 X90.329 Y135.106 E.00051
; WIPE_START
G1 F24000
G1 X90.298 Y135.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.361 J-1.162 P1  F30000
G1 X84.13 Y133.19 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X84.054 Y133.032 I.259 J-.221 E.0053
G3 X84.052 Y132.348 I6.804 J-.364 E.02039
G3 X84.262 Y132.072 I.346 J.046 E.01081
G1 X84.372 Y132.053 E.00331
G1 X87.79 Y132.054 E.10183
G1 X87.79 Y133.306 E.03729
G1 X84.438 Y133.306 E.09987
G3 X84.172 Y133.232 I-.049 J-.337 E.00844
M204 S10000
; WIPE_START
G1 F24000
G1 X84.075 Y133.112 E-.05886
G1 X84.054 Y133.032 E-.0315
G1 X84.052 Y132.348 E-.25997
G1 X84.077 Y132.239 E-.04241
G1 X84.162 Y132.126 E-.05365
G1 X84.262 Y132.072 E-.04323
G1 X84.372 Y132.053 E-.04216
G1 X84.972 Y132.053 E-.22822
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.641 J1.035 P1  F30000
G1 X87.79 Y133.798 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X84.296 Y133.797 E.10406
G3 X83.43 Y132.865 I.08 J-.944 E.04158
G3 X83.559 Y132.019 I1.536 J-.199 E.02584
G3 X84.277 Y131.558 I.785 J.435 E.02647
G1 X88.411 Y131.556 E.12315
G1 X88.413 Y134.37 E.08383
G3 X87.338 Y135.359 I-.943 J.054 E.04974
G1 X83.801 Y135.359 E.10537
G1 X83.977 Y134.871 E.01547
G1 X87.502 Y134.871 E.10501
G2 X87.792 Y134.574 I-.045 J-.334 E.01331
G1 X87.79 Y133.858 E.02135
M204 S10000
G1 X87.986 Y133.552 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.144262
G1 F15000
G1 X84.436 Y133.552 E.02842
G3 X83.957 Y133.398 I-.058 J-.644 E.00414
; LINE_WIDTH: 0.205998
G3 X83.828 Y133.242 I.409 J-.466 E.00262
G1 X83.784 Y133.14 E.00144
; LINE_WIDTH: 0.262753
G3 X83.754 Y132.324 I2.341 J-.493 E.01424
G1 X83.761 Y132.29 E.00061
; LINE_WIDTH: 0.209294
G3 X83.931 Y131.983 I.554 J.106 E.00469
; LINE_WIDTH: 0.151137
G3 X84.346 Y131.806 I.431 J.436 E.00395
G1 X87.986 Y131.805 E.03112
G1 X88.022 Y131.823 E.00034
; LINE_WIDTH: 0.219848
G1 X88.057 Y131.841 E.00055
; LINE_WIDTH: 0.25526
G1 X88.093 Y131.858 E.00066
; LINE_WIDTH: 0.27348
G1 X88.102 Y133.502 E.02994
G2 X88.101 Y133.601 I.226 J.051 E.00182
; LINE_WIDTH: 0.267845
G1 X88.102 Y134.365 E.01358
G3 X88.081 Y134.623 I-1.368 J.014 E.00461
; LINE_WIDTH: 0.211087
G3 X87.976 Y134.862 I-.626 J-.131 E.00348
G1 X87.948 Y134.9 E.00063
; LINE_WIDTH: 0.142075
G1 X87.786 Y135.034 E.00165
G1 X87.533 Y135.116 E.00208
G1 X84.097 Y135.115 E.02692
; WIPE_START
G1 F24000
G1 X86.097 Y135.116 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.776 J.937 P1  F30000
G1 X87.986 Y133.552 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.142242
G1 F15000
G1 X88.023 Y133.552 E.00029
; LINE_WIDTH: 0.189629
G1 X88.059 Y133.553 E.00042
; LINE_WIDTH: 0.237015
G1 X88.096 Y133.553 E.00056
; WIPE_START
G1 F24000
G1 X88.059 Y133.553 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.197 J-1.201 P1  F30000
G1 X79.436 Y132.136 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.436 Y136.41 E.12731
G1 X78.715 Y136.41 E.02146
G1 X78.715 Y131.556 E.14459
G1 X82.382 Y131.556 E.10923
G1 X82.325 Y131.717 E.00511
G1 X82.175 Y132.136 E.01323
G1 X79.496 Y132.136 E.07982
M204 S10000
G1 X79.24 Y131.846 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230826
G1 F15000
G1 X79.185 Y131.869 E.00088
; LINE_WIDTH: 0.278158
G1 X79.131 Y131.893 E.0011
; LINE_WIDTH: 0.3706
G1 X79.076 Y131.917 E.00154
G1 X79.075 Y131.94 E.00059
G1 X79.075 Y136.214 E.11063
G1 X79.24 Y131.846 F30000
; LINE_WIDTH: 0.230826
G1 F15000
G1 X82.071 Y131.846 E.04202
; WIPE_START
G1 F24000
G1 X80.071 Y131.846 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.208 J-.149 P1  F30000
G1 X78.639 Y143.486 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.36 Y143.776 E.02314
G1 X79.36 Y144.463 E.02044
G1 X78.639 Y144.172 E.02314
G1 X78.639 Y143.546 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X79.36 Y143.776 E-.28739
G1 X79.36 Y144.463 E-.26079
G1 X78.843 Y144.254 E-.21182
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.211 J.116 P1  F30000
G1 X79.36 Y138.845 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X82.148 Y138.842 E.08305
G3 X82.145 Y140.67 I-.03 J.914 E.08383
G1 X79.36 Y140.668 E.08298
G1 X79.36 Y138.905 E.05252
M204 S10000
; WIPE_START
G1 F24000
G1 X81.359 Y138.86 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.922 J-.794 P1  F30000
G1 X79.36 Y141.183 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X79.36 Y142.384 E.03576
G1 X78.639 Y142.093 E.02313
G1 X78.639 Y138.347 E.11157
G1 X82.643 Y138.354 E.11924
G3 X83.775 Y139.709 I-.174 J1.296 E.05776
G3 X83.395 Y140.662 I-1.371 J.006 E.03131
G1 X83.181 Y140.867 E.00882
G3 X83.258 Y142.756 I-1.217 J.995 E.06042
G3 X81.837 Y143.424 I-1.383 J-1.096 E.04847
G1 X79.78 Y143.425 E.06128
G1 X79.78 Y142.905 E.01548
G1 X81.978 Y142.905 E.06548
G2 X81.877 Y141.183 I-.038 J-.862 E.08147
G1 X79.42 Y141.183 E.07318
M204 S10000
G1 X79.164 Y140.925 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.166708
G1 F15000
G1 X79.132 Y140.925 E.00031
; LINE_WIDTH: 0.209914
G1 X79.1 Y140.925 E.00042
; LINE_WIDTH: 0.253119
G1 X79.069 Y140.925 E.00053
; LINE_WIDTH: 0.296324
G1 X79.037 Y140.925 E.00063
; LINE_WIDTH: 0.37095
G1 X79.005 Y140.925 E.00082
G1 X79 Y140.864 E.00161
G1 X79 Y138.543 E.06012
G1 X78.836 Y138.76 F30000
; LINE_WIDTH: 0.218347
G1 F15000
G1 X78.945 Y138.705 E.00169
; LINE_WIDTH: 0.183262
G1 X79.054 Y138.651 E.00136
; LINE_WIDTH: 0.148176
G1 X79.164 Y138.596 E.00102
; LINE_WIDTH: 0.148593
G1 X82.159 Y138.595 E.025
G1 X82.459 Y138.617 E.00251
; LINE_WIDTH: 0.21589
G1 X82.57 Y138.637 E.00155
; LINE_WIDTH: 0.260426
G3 X82.735 Y138.69 I-.338 J1.333 E.00297
; LINE_WIDTH: 0.309074
G1 X82.853 Y138.745 E.00275
; LINE_WIDTH: 0.342714
G1 X82.965 Y138.817 E.00315
; LINE_WIDTH: 0.361673
G1 X83.062 Y138.902 E.00324
; LINE_WIDTH: 0.400331
G3 X83.4 Y139.808 I-.825 J.824 E.02818
; LINE_WIDTH: 0.375919
G3 X83.279 Y140.249 I-1.109 J-.069 E.0121
; LINE_WIDTH: 0.321635
G3 X83.16 Y140.433 I-1.606 J-.904 E.00483
; LINE_WIDTH: 0.277462
G3 X82.908 Y140.698 I-2.132 J-1.776 E.00679
G1 X82.83 Y140.768 E.00193
; LINE_WIDTH: 0.322787
G2 X82.799 Y140.815 I.089 J.092 E.00125
; LINE_WIDTH: 0.371628
G1 X82.776 Y140.853 E.00115
; LINE_WIDTH: 0.411932
G1 X82.754 Y140.891 E.00129
; LINE_WIDTH: 0.454994
G1 X82.742 Y140.922 E.00107
; LINE_WIDTH: 0.488213
G1 F14148.003
G1 X82.735 Y140.943 E.0008
; LINE_WIDTH: 0.521432
G1 F13165.828
G1 X82.728 Y140.965 E.00086
; LINE_WIDTH: 0.547986
G1 F12473.622
G1 X82.723 Y140.982 E.00071
G1 X82.68 Y140.978 F30000
; LINE_WIDTH: 0.538285
G1 F12717.903
G1 X82.723 Y140.982 E.0017
G1 X82.817 Y141.088 E.00556
; LINE_WIDTH: 0.479275
G1 F14437.813
G3 X83.034 Y141.4 I-1.485 J1.265 E.0131
; LINE_WIDTH: 0.436518
G1 F15000
G1 X83.048 Y141.428 E.00099
G3 X83.143 Y141.747 I-1.042 J.481 E.01038
; LINE_WIDTH: 0.388159
G1 X83.161 Y142.065 E.00868
G3 X83.143 Y142.2 I-1.437 J-.125 E.00371
; LINE_WIDTH: 0.341689
G1 X83.106 Y142.336 E.00333
G3 X83.056 Y142.462 I-1.228 J-.421 E.00321
; LINE_WIDTH: 0.300113
G1 X82.943 Y142.65 E.00445
; LINE_WIDTH: 0.250594
G1 X82.87 Y142.741 E.00191
G3 X82.763 Y142.847 I-1.105 J-1.006 E.00248
; LINE_WIDTH: 0.201857
G1 X82.495 Y143.028 E.00406
; LINE_WIDTH: 0.168235
G1 X82.222 Y143.128 E.00288
G3 X81.832 Y143.165 I-.348 J-1.635 E.00388
G1 X79.976 Y143.165 E.01838
; WIPE_START
G1 F24000
G1 X81.832 Y143.165 E-.70548
G1 X81.976 Y143.159 E-.05452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.433 J-1.137 P1  F30000
G1 X79 Y142.027 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.371715
G1 F15000
G1 X79.005 Y140.925 E.02861
G1 X79.164 Y140.925 F30000
; LINE_WIDTH: 0.16515
M73 P89 R2
G1 F15000
G1 X82.165 Y140.936 E.02898
; LINE_WIDTH: 0.232867
G1 X82.303 Y140.944 E.00207
; LINE_WIDTH: 0.260644
G2 X83.054 Y141.032 I9.934 J-81.908 E.013
; WIPE_START
G1 F24000
G1 X82.303 Y140.944 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.11 J-.498 P1  F30000
G1 X76.792 Y128.654 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X77.331 Y127.677 E.03588
G3 X93.145 Y118.337 I16.378 J9.673 E.61635
G1 X94.272 Y118.337 E.03625
G3 X76.764 Y128.708 I-.564 J19.013 E3.15268
G1 X76.846 Y129.45 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X77.135 Y128.844 E.02001
G3 X93.157 Y118.729 I16.573 J8.506 E.59205
G1 X94.261 Y118.729 E.03289
G3 X76.66 Y129.841 I-.552 J18.621 E2.82865
G1 X76.821 Y129.504 E.01109
M204 S10000
; WIPE_START
G1 F24000
G1 X77.135 Y128.844 E-.27809
G1 X77.668 Y127.877 E-.41955
G1 X77.756 Y127.738 E-.06236
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.931 J.784 P1  F30000
G1 X100.998 Y155.323 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X76.451 Y128.493 I-7.296 J-17.969 E1.51603
G3 X94.926 Y117.999 I17.264 J8.885 E.72292
G3 X101.053 Y155.3 I-1.224 J19.355 E1.67734
G1 X101.143 Y155.682 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X77.295 Y126.295 I-7.436 J-18.336 E1.50215
G1 X77.979 Y125.342 E.03494
G3 X94.949 Y117.608 I15.737 J12.045 E.57836
G1 X95.466 Y117.638 E.01543
G3 X101.199 Y155.659 I-1.759 J19.708 E1.57021
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X100.047 Y156.098 E-.46841
G1 X99.313 Y156.322 E-.29159
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/15
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I.789 J.926 P1  F30000
G1 X139.348 Y122.217 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X150.526 Y118.04 I11.764 J14.439 E.3618
G1 X151.63 Y118.038 E.03289
G3 X139.302 Y122.255 I-.517 J18.618 E3.08925
M204 S10000
; WIPE_START
G1 F24000
G1 X140.224 Y121.544 E-.44232
G1 X140.917 Y121.076 E-.31768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.367 J-1.16 P1  F30000
G1 X137.728 Y122.084 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X151.662 Y116.878 I13.385 J14.574 E.45423
G1 X152.71 Y116.938 E.03128
G1 X152.833 Y116.945 E.00366
G3 X137.684 Y122.124 I-1.72 J19.713 E3.21245
M204 S10000
; WIPE_START
G1 F24000
G1 X138.615 Y121.316 E-.46848
G1 X139.223 Y120.849 E-.29152
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.018 J1.217 P1  F30000
G1 X162.18 Y120.514 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X167.278 Y125.612 E.21473
M204 S10000
; WIPE_START
G1 F24000
G1 X165.864 Y124.197 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.945 J.766 P1  F30000
G1 X168.145 Y127.012 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X160.756 Y119.623 E.31124
M204 S10000
; WIPE_START
G1 F24000
G1 X162.17 Y121.037 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.075 J-1.215 P1  F30000
G1 X161.668 Y121.068 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X159.631 Y119.031 E.08581
G1 X158.665 Y118.598
G1 X160.267 Y120.201 E.06749
G1 X159.165 Y119.632
G1 X157.795 Y118.261 E.05772
G1 X156.987 Y117.987
G1 X158.215 Y119.216 E.05175
G1 X157.364 Y118.897
G1 X156.223 Y117.756 E.04806
G1 X155.522 Y117.588
G1 X156.575 Y118.641 E.04435
G1 X155.829 Y118.429
G1 X154.842 Y117.442 E.04156
G1 X154.194 Y117.327
G1 X155.127 Y118.261 E.03934
G1 X154.466 Y118.133
G1 X153.577 Y117.243 E.03747
G1 X152.976 Y117.176
G1 X153.82 Y118.02 E.03555
G1 X153.216 Y117.949
G1 X152.394 Y117.127 E.03462
G1 X151.829 Y117.095
G1 X152.621 Y117.887 E.03338
G1 X152.055 Y117.855
G1 X151.286 Y117.086 E.0324
G1 X150.754 Y117.087
G1 X151.498 Y117.831 E.03135
G1 X150.966 Y117.832
G1 X150.237 Y117.103 E.03071
G1 X149.734 Y117.134
G1 X150.438 Y117.838 E.02965
G1 X149.936 Y117.868
G1 X149.237 Y117.17 E.02942
G1 X148.762 Y117.228
G1 X149.433 Y117.899 E.02829
G1 X148.956 Y117.955
G1 X148.286 Y117.285 E.02822
G1 X147.83 Y117.362
G1 X148.48 Y118.013 E.02741
G1 X148.02 Y118.085
G1 X147.378 Y117.444 E.02702
G1 X146.933 Y117.532
G1 X147.568 Y118.167 E.02677
G1 X147.121 Y118.253
G1 X146.504 Y117.636 E.026
G1 X146.075 Y117.741
G1 X146.692 Y118.358 E.026
G1 X146.264 Y118.462
G1 X145.66 Y117.858 E.02544
G1 X145.252 Y117.984
G1 X145.848 Y118.58 E.02513
G1 X145.44 Y118.706
G1 X144.844 Y118.109 E.02513
G1 X144.454 Y118.252
G1 X145.033 Y118.832 E.02441
G1 X144.645 Y118.977
G1 X144.066 Y118.397 E.02441
G1 X143.679 Y118.544
G1 X144.257 Y119.122 E.02433
G1 X143.875 Y119.273
G1 X143.31 Y118.708 E.02381
G1 X142.94 Y118.872
G1 X143.505 Y119.437 E.02381
G1 X143.136 Y119.601
G1 X142.575 Y119.04 E.02363
G1 X142.223 Y119.221
G1 X142.776 Y119.775 E.02332
G1 X142.424 Y119.956
G1 X141.871 Y119.402 E.02332
G1 X141.524 Y119.589
G1 X142.073 Y120.137 E.0231
G1 X141.734 Y120.332
G1 X141.19 Y119.788 E.02292
G1 X140.855 Y119.986
G1 X141.399 Y120.53 E.02292
G1 X141.064 Y120.729
G1 X140.525 Y120.19 E.0227
G1 X140.207 Y120.405
G1 X140.744 Y120.942 E.02262
G1 X140.426 Y121.157
G1 X139.889 Y120.62 E.02262
G1 X139.576 Y120.84
G1 X140.108 Y121.373 E.02242
G1 X139.806 Y121.604
G1 X139.274 Y121.072 E.0224
G1 X138.972 Y121.303
G1 X139.504 Y121.835 E.0224
G1 X139.203 Y122.067
G1 X138.674 Y121.539 E.02227
G1 X138.388 Y121.786
G1 X138.917 Y122.314 E.02227
G1 X138.631 Y122.562
G1 X138.102 Y122.033 E.02227
G1 X137.819 Y122.283
G1 X138.347 Y122.811 E.02221
G1 X138.077 Y123.074
G1 X137.549 Y122.547 E.02221
G1 X137.279 Y122.81
G1 X137.806 Y123.337 E.02221
G1 X137.539 Y123.602
G1 X137.011 Y123.075 E.02223
G1 X136.756 Y123.354
G1 X137.284 Y123.881 E.02223
G1 X137.03 Y124.16
G1 X136.502 Y123.633 E.02223
G1 X136.248 Y123.912
G1 X136.779 Y124.442 E.02234
G1 X136.54 Y124.737
G1 X136.01 Y124.207 E.02234
G1 X135.772 Y124.502
G1 X136.302 Y125.032 E.02234
G1 X136.067 Y125.331
G1 X135.533 Y124.797 E.02249
G1 X135.31 Y125.107
G1 X135.845 Y125.642 E.02252
G1 X135.623 Y125.953
G1 X135.088 Y125.418 E.02252
G1 X134.866 Y125.729
G1 X135.406 Y126.269 E.02273
G1 X135.2 Y126.596
G1 X134.659 Y126.055 E.02278
G1 X134.453 Y126.383
G1 X134.994 Y126.924 E.02278
G1 X134.795 Y127.258
G1 X134.247 Y126.71 E.02308
G1 X134.057 Y127.053
G1 X134.606 Y127.603 E.02313
G1 X134.417 Y127.947
G1 X133.868 Y127.398 E.02313
G1 X133.679 Y127.742
G1 X134.239 Y128.301 E.02356
G1 X134.067 Y128.663
G1 X133.507 Y128.103 E.02358
G1 X133.336 Y128.465
G1 X133.896 Y129.025 E.02358
G1 X133.739 Y129.401
G1 X133.166 Y128.828 E.02413
G1 X133.012 Y129.208
G1 X133.585 Y129.781 E.02413
G1 X133.433 Y130.163
G1 X132.859 Y129.588 E.02419
G1 X132.71 Y129.973
G1 X133.299 Y130.562 E.0248
G1 X133.165 Y130.961
G1 X132.576 Y130.372 E.0248
G1 X132.442 Y130.771
G1 X133.04 Y131.369 E.02516
G1 X132.926 Y131.788
G1 X132.318 Y131.18 E.0256
G1 X132.204 Y131.6
G1 X132.812 Y132.208 E.0256
G1 X132.717 Y132.646
G1 X132.09 Y132.019 E.02638
G1 X131.994 Y132.457
G1 X132.625 Y133.087 E.02655
G1 X132.542 Y133.537
G1 X131.902 Y132.898 E.02692
G1 X131.816 Y133.345
G1 X132.473 Y134.002 E.02767
G1 X132.406 Y134.468
G1 X131.748 Y133.81 E.02775
G1 X131.679 Y134.274
G1 X132.363 Y134.958 E.0288
G1 X132.319 Y135.448
G1 X131.63 Y134.759 E.02901
G1 X131.588 Y135.249
G1 X132.297 Y135.959 E.02987
G1 X132.282 Y136.477
G1 X131.557 Y135.752 E.03057
G1 X131.542 Y136.271
G1 X132.286 Y137.015 E.03135
G1 X132.304 Y137.565
G1 X131.534 Y136.795 E.03245
G1 X131.551 Y137.346
G1 X132.341 Y138.136 E.03329
G1 X132.395 Y138.723
G1 X131.571 Y137.899 E.0347
G1 X131.624 Y138.486
G1 X132.475 Y139.337 E.03585
G1 X132.57 Y139.965
G1 X131.682 Y139.077 E.03743
G1 X131.777 Y139.705
G1 X132.709 Y140.637 E.03928
G1 X132.87 Y141.332
G1 X131.885 Y140.347 E.04149
G1 X132.029 Y141.024
G1 X133.073 Y142.067 E.04396
G1 X133.335 Y142.863
G1 X132.208 Y141.736 E.04747
G1 X132.417 Y142.478
G1 X133.658 Y143.719 E.0523
G1 X134.071 Y144.665
G1 X132.691 Y143.286 E.0581
G1 X133.033 Y144.16
G1 X134.627 Y145.754 E.06715
M204 S10000
; WIPE_START
G1 F24000
G1 X133.213 Y144.34 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.947 J.764 P1  F30000
G1 X135.437 Y147.098 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X133.464 Y145.125 E.08313
M204 S10000
; WIPE_START
G1 F24000
G1 X134.878 Y146.539 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.656 J1.025 P1  F30000
G1 X166.731 Y126.132 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X168.731 Y128.132 E.08425
G1 X169.17 Y129.104
G1 X167.558 Y127.492 E.06791
G1 X168.125 Y128.592
G1 X169.517 Y129.984 E.05865
G1 X169.792 Y130.792
G1 X168.545 Y129.545 E.05254
G1 X168.873 Y130.407
G1 X170.005 Y131.538 E.04766
G1 X170.188 Y132.254
G1 X169.14 Y131.207 E.04411
G1 X169.343 Y131.943
G1 X170.331 Y132.931 E.04164
G1 X170.443 Y133.576
G1 X169.507 Y132.641 E.03941
G1 X169.649 Y133.316
G1 X170.538 Y134.204 E.03743
G1 X170.598 Y134.798
G1 X169.744 Y133.944 E.03596
G1 X169.828 Y134.561
G1 X170.651 Y135.385 E.0347
G1 X170.674 Y135.94
G1 X169.881 Y135.147 E.03338
G1 X169.921 Y135.72
G1 X170.691 Y136.491 E.03245
G1 X170.684 Y137.017
G1 X169.938 Y136.271 E.03143
G1 X169.944 Y136.81
G1 X170.67 Y137.536 E.03057
G1 X170.641 Y138.04
G1 X169.93 Y137.329 E.02995
G1 X169.909 Y137.842
G1 X170.598 Y138.53 E.029
G1 X170.551 Y139.017
G1 X169.867 Y138.333 E.02882
G1 X169.824 Y138.823
G1 X170.482 Y139.481 E.02774
G1 X170.414 Y139.946
G1 X169.757 Y139.289 E.02767
G1 X169.688 Y139.754
G1 X170.329 Y140.395 E.02698
G1 X170.237 Y140.836
G1 X169.607 Y140.206 E.02655
G1 X169.515 Y140.647
G1 X170.142 Y141.274 E.02644
G1 X170.028 Y141.694
G1 X169.421 Y141.086 E.0256
G1 X169.307 Y141.506
G1 X169.915 Y142.113 E.0256
G1 X169.792 Y142.524
G1 X169.193 Y141.925 E.02522
G1 X169.069 Y142.334
G1 X169.658 Y142.923 E.0248
G1 X169.523 Y143.322
G1 X168.935 Y142.733 E.0248
G1 X168.801 Y143.132
G1 X169.376 Y143.708 E.02424
G1 X169.223 Y144.088
G1 X168.65 Y143.515 E.02413
G1 X168.497 Y143.895
G1 X169.069 Y144.468 E.02413
G1 X168.9 Y144.832
G1 X168.341 Y144.272 E.02358
G1 X168.169 Y144.634
G1 X168.729 Y145.194 E.02358
G1 X168.557 Y145.556
G1 X167.998 Y144.996 E.02358
G1 X167.82 Y145.352
G1 X168.369 Y145.901 E.02313
G1 X168.18 Y146.245
G1 X167.631 Y145.696 E.02313
G1 X167.442 Y146.04
G1 X167.991 Y146.589 E.02313
G1 X167.785 Y146.917
G1 X167.244 Y146.376 E.02278
G1 X167.039 Y146.703
G1 X167.579 Y147.244 E.02278
G1 X167.373 Y147.571
G1 X166.833 Y147.031 E.02278
G1 X166.617 Y147.348
G1 X167.151 Y147.882 E.02252
G1 X166.929 Y148.193
G1 X166.394 Y147.659 E.02252
G1 X166.172 Y147.97
G1 X166.707 Y148.504 E.02252
G1 X166.469 Y148.8
G1 X165.938 Y148.269 E.02233
G1 X165.7 Y148.564
G1 X166.23 Y149.095 E.02234
G1 X165.992 Y149.389
G1 X165.462 Y148.859 E.02234
G1 X165.211 Y149.142
G1 X165.739 Y149.67 E.02223
G1 X165.485 Y149.949
G1 X164.957 Y149.421 E.02223
G1 X164.703 Y149.7
G1 X165.228 Y150.226 E.02214
G1 X164.96 Y150.49
G1 X164.436 Y149.966 E.02207
G1 X164.166 Y150.23
G1 X164.691 Y150.755 E.02213
G1 X164.423 Y151.02
G1 X163.896 Y150.493 E.0222
G1 X163.612 Y150.743
G1 X164.141 Y151.271 E.02227
G1 X163.855 Y151.519
G1 X163.326 Y150.99 E.02227
G1 X163.04 Y151.237
G1 X163.569 Y151.766 E.02227
G1 X163.272 Y152.002
G1 X162.74 Y151.47 E.0224
G1 X162.438 Y151.702
G1 X162.97 Y152.234 E.0224
G1 X162.668 Y152.465
G1 X162.136 Y151.933 E.0224
G1 X161.819 Y152.149
G1 X162.356 Y152.686 E.02262
G1 X162.038 Y152.901
G1 X161.501 Y152.364 E.02262
G1 X161.182 Y152.578
G1 X161.72 Y153.116 E.02265
G1 X161.391 Y153.321
G1 X160.847 Y152.777 E.02292
G1 X160.512 Y152.976
G1 X161.057 Y153.52 E.02292
G1 X160.722 Y153.718
G1 X160.175 Y153.171 E.02305
G1 X159.823 Y153.352
G1 X160.376 Y153.906 E.02332
G1 X160.024 Y154.087
G1 X159.471 Y153.534 E.02332
G1 X159.113 Y153.709
G1 X159.673 Y154.269 E.02359
G1 X159.308 Y154.438
G1 X158.743 Y153.873 E.02381
G1 X158.373 Y154.036
G1 X158.939 Y154.601 E.02381
G1 X158.569 Y154.765
G1 X157.993 Y154.189 E.02428
G1 X157.605 Y154.334
M73 P90 R2
G1 X158.184 Y154.913 E.02441
G1 X157.796 Y155.058
G1 X157.216 Y154.479 E.02441
G1 X156.81 Y154.606
G1 X157.407 Y155.203 E.02513
G1 X156.999 Y155.328
G1 X156.402 Y154.731 E.02513
G1 X155.988 Y154.851
G1 X156.591 Y155.454 E.02539
G1 X156.177 Y155.572
G1 X155.56 Y154.955 E.026
G1 X155.131 Y155.06
G1 X155.748 Y155.677 E.026
G1 X155.319 Y155.781
G1 X154.685 Y155.147 E.02671
G1 X154.234 Y155.229
G1 X154.875 Y155.871 E.02702
G1 X154.424 Y155.953
G1 X153.775 Y155.303 E.02735
G1 X153.299 Y155.361
G1 X153.969 Y156.031 E.02822
G1 X153.493 Y156.088
G1 X152.823 Y155.418 E.02822
G1 X152.321 Y155.449
G1 X153.017 Y156.146 E.02935
G1 X152.522 Y156.184
G1 X151.818 Y155.48 E.02965
G1 X151.293 Y155.488
G1 X152.02 Y156.215 E.03063
G1 X151.505 Y156.233
G1 X150.76 Y155.489 E.03135
G1 X150.205 Y155.467
G1 X150.972 Y156.234 E.03231
G1 X150.432 Y156.227
G1 X149.64 Y155.434 E.03338
G1 X149.047 Y155.375
G1 X149.866 Y156.194 E.03453
G1 X149.293 Y156.154
G1 X148.442 Y155.304 E.03582
G1 X147.799 Y155.194
G1 X148.689 Y156.084 E.03746
G1 X148.072 Y156
G1 X147.141 Y155.069 E.0392
G1 X146.44 Y154.901
G1 X147.423 Y155.885 E.04142
G1 X146.747 Y155.742
G1 X145.698 Y154.693 E.04419
G1 X144.914 Y154.442
G1 X146.046 Y155.574 E.04768
G1 X145.286 Y155.347
G1 X144.068 Y154.129 E.05129
G1 X143.119 Y153.714
G1 X144.483 Y155.077 E.05745
G1 X143.618 Y154.745
G1 X142.038 Y153.166 E.06653
M204 S10000
; WIPE_START
G1 F24000
G1 X143.453 Y154.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.766 J-.946 P1  F30000
G1 X140.657 Y152.318 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X142.66 Y154.321 E.08437
G1 X141.549 Y153.743
G1 X134.04 Y146.234 E.31631
M204 S10000
; WIPE_START
G1 F24000
G1 X135.454 Y147.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.101 J-1.213 P1  F30000
G1 X134.873 Y147.6 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X140.145 Y152.872 E.2221
M204 S10000
; WIPE_START
G1 F24000
G1 X138.731 Y151.458 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.197 J-.222 P1  F30000
G1 X134.382 Y128.009 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0934397
G1 F15000
G1 X134.329 Y128.08 E.00035
G1 X134.338 Y128.134 E.00022
; WIPE_START
G1 F24000
G1 X134.329 Y128.08 E-.28832
G1 X134.382 Y128.009 E-.47168
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.179 J-.3 P1  F30000
G1 X132.21 Y136.55 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0946823
G1 F15000
G1 X132.295 Y136.757 E.00092
; WIPE_START
G1 F24000
G1 X132.21 Y136.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.212 J.107 P1  F30000
G1 X132.427 Y139.001 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.125751
G1 F15000
G1 X132.325 Y138.792 E.00152
; WIPE_START
G1 F24000
G1 X132.427 Y139.001 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.214 J.091 P1  F30000
G1 X132.515 Y140.176 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.121703
G1 F15000
G1 X132.585 Y139.95 E.00147
; WIPE_START
G1 F24000
G1 X132.515 Y140.176 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.192 J.247 P1  F30000
G1 X133.526 Y145.063 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.215758
G1 F15000
G1 X133.432 Y144.93 E.00222
; LINE_WIDTH: 0.173228
G1 X133.338 Y144.797 E.00168
; LINE_WIDTH: 0.130699
G1 X133.244 Y144.664 E.00113
; WIPE_START
G1 F24000
G1 X133.338 Y144.797 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.396 J1.151 P1  F30000
G1 X134.291 Y145.125 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X134.197 Y144.992 E.00058
; LINE_WIDTH: 0.130699
G1 X134.103 Y144.86 E.00113
; LINE_WIDTH: 0.173229
G1 X134.009 Y144.727 E.00168
; WIPE_START
G1 F24000
G1 X134.103 Y144.86 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J-.001 P1  F30000
G1 X134.101 Y146.173 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.221769
G1 F15000
G1 X133.983 Y146.015 E.00279
; LINE_WIDTH: 0.177236
G1 X133.864 Y145.858 E.00209
; LINE_WIDTH: 0.132703
G1 X133.745 Y145.7 E.0014
; WIPE_START
G1 F24000
G1 X133.864 Y145.858 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.459 J1.127 P1  F30000
G1 X134.922 Y146.288 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X134.86 Y146.206 E.00037
; LINE_WIDTH: 0.113667
G1 X134.798 Y146.124 E.00057
; LINE_WIDTH: 0.139167
G1 X134.682 Y145.97 E.00147
; LINE_WIDTH: 0.180466
G1 X134.566 Y145.815 E.0021
; WIPE_START
G1 F24000
G1 X134.682 Y145.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.004 J.687 P1  F30000
G1 X136.005 Y147.903 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X135.821 Y147.686 E.00102
; LINE_WIDTH: 0.13267
G1 X135.637 Y147.47 E.00201
; LINE_WIDTH: 0.177989
G1 X135.449 Y147.25 E.00309
; LINE_WIDTH: 0.222683
G1 X135.377 Y147.159 E.00165
G1 X134.933 Y147.539 F30000
; LINE_WIDTH: 0.227772
G1 F15000
G1 X134.777 Y147.344 E.00365
; LINE_WIDTH: 0.181238
G1 X134.621 Y147.149 E.00273
; LINE_WIDTH: 0.134705
G1 X134.464 Y146.954 E.00181
; WIPE_START
G1 F24000
G1 X134.621 Y147.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.905 J.814 P1  F30000
G1 X139.052 Y152.076 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881699
G1 F15000
G1 X138.817 Y151.871 E.00111
; LINE_WIDTH: 0.127232
G1 X138.393 Y151.477 E.00386
; LINE_WIDTH: 0.171236
G1 X137.968 Y151.083 E.00587
; LINE_WIDTH: 0.224895
G3 X136.343 Y149.437 I26.957 J-28.235 E.03325
; LINE_WIDTH: 0.185302
G1 X136.015 Y149.075 E.00549
; LINE_WIDTH: 0.136737
G1 X135.688 Y148.712 E.00362
; WIPE_START
G1 F24000
G1 X136.015 Y149.075 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.712 J.987 P1  F30000
G1 X140.597 Y152.379 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.230396
G1 F15000
G1 X140.371 Y152.193 E.00433
; LINE_WIDTH: 0.182376
G1 X140.144 Y152.006 E.00325
; LINE_WIDTH: 0.134789
G1 X139.867 Y151.764 E.00267
; WIPE_START
G1 F24000
G1 X140.144 Y152.006 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.078 J.564 P1  F30000
G1 X140.831 Y153.32 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881704
G1 F15000
G1 X140.702 Y153.22 E.00059
; LINE_WIDTH: 0.123877
G1 X140.536 Y153.084 E.00137
; LINE_WIDTH: 0.159383
G1 X140.371 Y152.948 E.00197
; LINE_WIDTH: 0.194888
G1 X140.206 Y152.812 E.00257
; WIPE_START
G1 F24000
G1 X140.371 Y152.948 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.208 J1.199 P1  F30000
G1 X141.977 Y153.227 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.224388
G1 F15000
G1 X141.805 Y153.094 E.00312
; LINE_WIDTH: 0.178982
G1 X141.633 Y152.961 E.00234
; LINE_WIDTH: 0.133576
G1 X141.461 Y152.828 E.00156
; WIPE_START
G1 F24000
G1 X141.633 Y152.961 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.539 J1.091 P1  F30000
G1 X143.132 Y153.701 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.165852
G1 F15000
G1 X142.986 Y153.726 E.00143
; LINE_WIDTH: 0.21407
G1 X142.871 Y153.642 E.00192
; LINE_WIDTH: 0.172103
G1 X142.756 Y153.559 E.00145
; LINE_WIDTH: 0.130137
G1 X142.641 Y153.475 E.00098
; WIPE_START
G1 F24000
G1 X142.756 Y153.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.148 J.405 P1  F30000
G1 X143.093 Y154.513 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881699
G1 F15000
G1 X142.969 Y154.428 E.00054
; LINE_WIDTH: 0.129703
G1 X142.846 Y154.344 E.00103
; LINE_WIDTH: 0.171237
G1 X142.722 Y154.259 E.00152
; WIPE_START
G1 F24000
G1 X142.846 Y154.344 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.212 J1.198 P1  F30000
G1 X146.373 Y154.968 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.11431
G1 F15000
G1 X146.113 Y154.818 E.0017
; WIPE_START
G1 F24000
G1 X146.373 Y154.968 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.152 J1.207 P1  F30000
G1 X154.156 Y155.951 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.109079
G1 F15000
G1 X153.989 Y156.032 E.00097
; WIPE_START
G1 F24000
G1 X154.156 Y155.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.503 J1.108 P1  F30000
G1 X158.327 Y154.056 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0965101
G1 F15000
G1 X158.24 Y154.116 E.00045
G1 X158.173 Y154.103 E.00029
; WIPE_START
G1 F24000
G1 X158.24 Y154.116 E-.298
G1 X158.327 Y154.056 E-.462
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.137 J.434 P1  F30000
G1 X168.44 Y127.546 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X168.321 Y127.388 E.00071
; LINE_WIDTH: 0.132702
G1 X168.202 Y127.231 E.0014
; LINE_WIDTH: 0.177234
G1 X168.084 Y127.073 E.00209
G1 X167.619 Y127.431 F30000
; LINE_WIDTH: 0.221766
G1 F15000
G1 X167.522 Y127.302 E.00228
; LINE_WIDTH: 0.185106
G1 X167.425 Y127.172 E.00182
; LINE_WIDTH: 0.147987
G1 X167.326 Y127.042 E.00136
; LINE_WIDTH: 0.111275
G1 X167.247 Y126.942 E.00069
G1 X166.792 Y126.071 F30000
; LINE_WIDTH: 0.232205
G1 F15000
G1 X166.574 Y125.814 E.00505
; LINE_WIDTH: 0.184194
G1 X166.355 Y125.557 E.00377
; LINE_WIDTH: 0.136182
G1 X166.136 Y125.3 E.00249
; WIPE_START
G1 F24000
G1 X166.355 Y125.557 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.573 J1.074 P1  F30000
G1 X167.704 Y126.276 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X167.563 Y126.099 E.00081
; LINE_WIDTH: 0.136436
G1 X167.421 Y125.922 E.00168
; LINE_WIDTH: 0.203365
G1 X167.279 Y125.745 E.00288
G1 X167.295 Y125.603 E.00181
; WIPE_START
G1 F24000
G1 X167.279 Y125.745 E-.29388
G1 X167.421 Y125.922 E-.46612
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.002 J-.69 P1  F30000
G1 X166.393 Y124.43 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X166.143 Y124.153 E.00134
; LINE_WIDTH: 0.125121
G1 X165.892 Y123.875 E.00243
; LINE_WIDTH: 0.186705
G2 X164.266 Y122.228 I-28.595 J26.601 E.02629
; LINE_WIDTH: 0.192027
G1 X163.841 Y121.834 E.00683
; LINE_WIDTH: 0.147997
G1 X163.416 Y121.439 E.00481
; LINE_WIDTH: 0.103968
G1 X163.31 Y121.348 E.00067
G1 X162.496 Y121.66 F30000
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X162.293 Y121.482 E.00097
; LINE_WIDTH: 0.123569
G1 X162.087 Y121.302 E.00174
; LINE_WIDTH: 0.158657
G1 X161.908 Y121.155 E.00212
; LINE_WIDTH: 0.194526
G1 X161.728 Y121.008 E.00278
G1 X162.12 Y120.575 F30000
; LINE_WIDTH: 0.230394
G1 F15000
G1 X161.923 Y120.413 E.00377
; LINE_WIDTH: 0.18706
G1 X161.727 Y120.251 E.0029
; LINE_WIDTH: 0.143726
G1 X161.53 Y120.09 E.00203
; LINE_WIDTH: 0.100391
G1 X161.474 Y120.046 E.00032
G1 X160.844 Y120.539 F30000
; LINE_WIDTH: 0.0881698
G1 F15000
G1 X160.672 Y120.406 E.00078
; LINE_WIDTH: 0.133575
G1 X160.5 Y120.273 E.00156
; LINE_WIDTH: 0.178981
G1 X160.328 Y120.14 E.00234
G1 X160.695 Y119.684 F30000
; LINE_WIDTH: 0.224389
G1 F15000
G1 X160.509 Y119.54 E.00337
; LINE_WIDTH: 0.187958
G1 X160.37 Y119.439 E.00196
; LINE_WIDTH: 0.138064
G1 X160.232 Y119.339 E.00129
; WIPE_START
G1 F24000
G1 X160.37 Y119.439 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.025 J-1.217 P1  F30000
G1 X158.645 Y119.404 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.08817
G1 F15000
G1 X158.522 Y119.321 E.00053
; LINE_WIDTH: 0.129569
G1 X158.4 Y119.237 E.00101
; LINE_WIDTH: 0.170967
G1 X158.278 Y119.154 E.0015
G1 X158.603 Y118.661 F30000
; LINE_WIDTH: 0.212366
G1 F15000
G1 X158.259 Y118.426 E.00558
; WIPE_START
G1 F24000
G1 X158.603 Y118.661 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.184 J-1.203 P1  F30000
G1 X154.029 Y117.962 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0960263
G1 F15000
G1 X153.805 Y118.036 E.00099
G1 X152.895 Y117.914 F30000
; LINE_WIDTH: 0.17459
G1 F15000
G1 X152.754 Y117.848 E.00162
G1 X152.605 Y117.903 E.00165
; WIPE_START
G1 F24000
G1 X152.754 Y117.848 E-.38454
G1 X152.895 Y117.914 E-.37546
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.081 J-1.214 P1  F30000
G1 X150.631 Y117.764 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.121909
G1 F15000
G1 X150.421 Y117.855 E.00143
; WIPE_START
G1 F24000
G1 X150.631 Y117.764 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.879 J.842 P1  F30000
G1 X170.786 Y138.792 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X170.786 Y134.543 E.0151
; WIPE_START
G1 F24000
G1 X170.786 Y136.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J-.059 P1  F30000
G1 X170.636 Y133.447 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X170.636 Y139.88 E.02287
G1 X170.486 Y140.671 F30000
G1 F3600
G1 X170.486 Y132.647 E.02852
G1 X170.336 Y131.949 F30000
G1 F3600
G1 X170.336 Y141.363 E.03346
G1 X170.186 Y141.916 F30000
G1 F3600
G1 X170.186 Y131.404 E.03737
G1 X170.036 Y130.859 F30000
G1 F3600
G1 X170.036 Y142.457 E.04123
G1 X169.886 Y142.903 F30000
G1 F3600
G1 X169.886 Y130.415 E.04439
G1 X169.736 Y129.974 F30000
G1 F3600
G1 X169.736 Y136.512 E.02324
; WIPE_START
G1 F24000
G1 X169.736 Y134.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.996 J-.7 P1  F30000
G1 X169.586 Y134.298 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X169.586 Y129.745 E.01619
G1 X169.436 Y129.377 E.00141
G1 X169.436 Y133.313 E.01399
G1 X169.286 Y132.607 F30000
G1 F3600
G1 X169.286 Y129.01 E.01279
G2 X169.136 Y128.646 I-3.133 J1.082 E.0014
G1 X169.136 Y131.981 E.01185
G1 X168.986 Y131.436 F30000
G1 F3600
G1 X168.986 Y128.333 E.01103
G1 X168.836 Y128.02 E.00123
G1 X168.836 Y130.948 E.01041
G1 X168.686 Y130.507 F30000
G1 F3600
G1 X168.686 Y127.706 E.00995
G2 X168.536 Y127.424 I-2.457 J1.123 E.00114
G1 X168.536 Y129.899 E.0088
G1 X168.386 Y129.532 E.00141
G1 X168.386 Y127.153 E.00846
G1 X168.236 Y126.882 E.0011
G1 X168.236 Y129.164 E.00811
G2 X168.086 Y128.84 I-2.805 J1.102 E.00127
G1 X168.086 Y126.611 E.00792
G2 X167.936 Y126.373 I-2.084 J1.145 E.001
G1 X167.936 Y128.526 E.00765
G1 X167.786 Y128.213 E.00123
G1 X167.786 Y126.136 E.00738
G1 X167.636 Y125.9 E.001
G1 X167.636 Y127.926 E.0072
G1 X167.486 Y127.655 E.0011
G1 X167.486 Y125.663 E.00708
G2 X167.336 Y125.448 I-1.883 J1.156 E.00093
G1 X167.336 Y127.384 E.00688
G2 X167.186 Y127.114 I-2.347 J1.129 E.0011
G1 X167.186 Y125.24 E.00666
G1 X167.036 Y125.032 E.00091
G1 X167.036 Y126.878 E.00656
G1 X166.886 Y126.641 E.001
G1 X166.886 Y124.824 E.00646
G2 X166.736 Y124.621 I-1.785 J1.163 E.0009
G1 X166.736 Y126.404 E.00634
G2 X166.586 Y126.17 I-2.049 J1.147 E.00099
G1 X166.586 Y124.437 E.00616
G1 X166.436 Y124.252 E.00084
G1 X166.436 Y125.962 E.00608
G1 X166.286 Y125.754 E.00091
G1 X166.286 Y124.068 E.00599
G1 X166.136 Y123.884 E.00084
G1 X166.136 Y125.546 E.00591
G1 X165.986 Y125.337 E.00091
G1 X165.986 Y123.706 E.0058
G1 X165.836 Y123.543 E.00079
G1 X165.836 Y125.147 E.0057
G1 X165.686 Y124.963 E.00084
G1 X165.686 Y123.379 E.00563
G1 X165.536 Y123.216 E.00079
G1 X165.536 Y124.779 E.00556
G1 X165.386 Y124.595 E.00084
G1 X165.386 Y123.053 E.00548
G1 X165.236 Y122.89 E.00079
G1 X165.236 Y124.413 E.00541
G1 X165.086 Y124.25 E.00079
G1 X165.086 Y122.745 E.00535
G1 X164.936 Y122.6 E.00074
G1 X164.936 Y124.086 E.00528
G1 X164.786 Y123.923 E.00079
G1 X164.786 Y122.455 E.00522
G1 X164.636 Y122.31 E.00074
G1 X164.636 Y123.76 E.00515
G2 X164.486 Y123.598 I-1.435 J1.183 E.00078
G1 X164.486 Y122.165 E.0051
G2 X164.336 Y122.026 I-1.632 J1.622 E.00073
G1 X164.336 Y123.453 E.00507
G1 X164.186 Y123.308 E.00074
G1 X164.186 Y121.898 E.00501
G1 X164.036 Y121.769 E.0007
G1 X164.036 Y123.163 E.00496
G1 X163.886 Y123.018 E.00074
G1 X163.886 Y121.64 E.0049
G1 X163.736 Y121.511 E.0007
G1 X163.736 Y122.873 E.00484
G2 X163.586 Y122.741 I-1.188 J1.198 E.00071
G1 X163.586 Y121.383 E.00483
G2 X163.436 Y121.261 I-1.097 J1.203 E.00069
G1 X163.436 Y122.612 E.0048
G1 X163.286 Y122.483 E.0007
G1 X163.286 Y121.147 E.00475
G1 X163.136 Y121.033 E.00067
G1 X163.136 Y122.354 E.0047
G1 X162.986 Y122.226 E.0007
G1 X162.986 Y120.919 E.00464
G1 X162.836 Y120.805 E.00067
G1 X162.836 Y122.1 E.0046
G1 X162.686 Y121.985 E.00067
G1 X162.686 Y120.691 E.0046
G2 X162.536 Y120.581 I-1.001 J1.208 E.00066
G1 X162.536 Y121.871 E.00459
G1 X162.386 Y121.757 E.00067
G1 X162.386 Y120.48 E.00454
G1 X162.236 Y120.38 E.00064
G1 X162.236 Y121.643 E.00449
G1 X162.086 Y121.529 E.00067
G1 X162.086 Y120.279 E.00444
G1 X161.936 Y120.179 E.00064
G1 X161.936 Y121.419 E.00441
G1 X161.786 Y121.319 E.00064
G1 X161.786 Y120.078 E.00441
G1 X161.636 Y119.977 E.00064
G1 X161.636 Y121.218 E.00441
G1 X161.486 Y121.117 E.00064
G1 X161.486 Y119.887 E.00437
G1 X161.336 Y119.799 E.00062
G1 X161.336 Y121.017 E.00433
G1 X161.186 Y120.916 E.00064
G1 X161.186 Y119.711 E.00429
G1 X161.036 Y119.622 E.00062
G1 X161.036 Y120.818 E.00425
G1 X160.886 Y120.73 E.00062
G1 X160.886 Y119.534 E.00425
G1 X160.736 Y119.446 E.00062
G1 X160.736 Y120.641 E.00425
G1 X160.586 Y120.553 E.00062
G1 X160.586 Y119.359 E.00424
G1 X160.436 Y119.282 E.0006
G1 X160.436 Y120.465 E.0042
G1 X160.286 Y120.377 E.00062
G1 X160.286 Y119.206 E.00416
G1 X160.136 Y119.129 E.0006
G1 X160.136 Y120.289 E.00412
G2 X159.986 Y120.21 I-.739 J1.225 E.0006
G1 X159.986 Y119.053 E.00411
G1 X159.836 Y118.976 E.0006
G1 X159.836 Y120.133 E.00411
G1 X159.686 Y120.056 E.0006
G1 X159.686 Y118.899 E.00411
G1 X159.536 Y118.825 E.0006
G1 X159.536 Y119.98 E.00411
G1 X159.386 Y119.903 E.0006
G1 X159.386 Y118.759 E.00407
G1 X159.236 Y118.693 E.00058
G1 X159.234 Y119.826 E.00403
G2 X159.086 Y119.752 I-.69 J1.212 E.00059
G1 X159.086 Y118.627 E.004
G1 X158.936 Y118.562 E.00058
G1 X158.936 Y119.687 E.004
G1 X158.786 Y119.621 E.00058
G1 X158.786 Y118.496 E.004
G1 X158.636 Y118.43 E.00058
G1 X158.636 Y119.555 E.004
G1 X158.486 Y119.49 E.00058
G1 X158.486 Y118.365 E.004
G1 X158.336 Y118.309 E.00057
G1 X158.336 Y119.424 E.00396
G1 X158.186 Y119.358 E.00058
G1 X158.186 Y118.254 E.00392
G1 X158.036 Y118.199 E.00057
G1 X158.036 Y119.297 E.0039
G1 X157.886 Y119.242 E.00057
G1 X157.886 Y118.143 E.0039
G1 X157.736 Y118.088 E.00057
G1 X157.736 Y119.186 E.0039
G1 X157.586 Y119.131 E.00057
G1 X157.586 Y118.032 E.0039
G1 X157.436 Y117.977 E.00057
G1 X157.436 Y119.076 E.0039
G1 X157.286 Y119.02 E.00057
G1 X157.286 Y117.929 E.00388
G1 X157.136 Y117.883 E.00056
G1 X157.136 Y118.965 E.00384
G2 X156.986 Y118.915 I-.497 J1.239 E.00056
G1 X156.986 Y117.838 E.00383
G1 X156.836 Y117.792 E.00056
G1 X156.836 Y118.869 E.00383
G1 X156.686 Y118.824 E.00056
G1 X156.686 Y117.747 E.00383
G1 X156.536 Y117.701 E.00056
G1 X156.536 Y118.778 E.00383
G1 X156.386 Y118.733 E.00056
G1 X156.386 Y117.656 E.00383
G2 X156.236 Y117.613 I-.437 J1.242 E.00055
G1 X156.236 Y118.687 E.00382
G1 X156.086 Y118.642 E.00056
G1 X156.086 Y117.577 E.00378
G1 X155.936 Y117.541 E.00055
G1 X155.936 Y118.601 E.00377
G1 X155.786 Y118.565 E.00055
G1 X155.786 Y117.505 E.00377
G1 X155.636 Y117.469 E.00055
G1 X155.636 Y118.529 E.00377
G1 X155.486 Y118.493 E.00055
G1 X155.486 Y117.433 E.00377
G1 X155.336 Y117.397 E.00055
G1 X155.336 Y118.457 E.00377
G1 X155.186 Y118.421 E.00055
G1 X155.186 Y117.361 E.00377
G2 X155.036 Y117.332 I-.324 J1.249 E.00054
G1 X155.036 Y118.385 E.00374
G2 X154.886 Y118.352 I-.355 J1.247 E.00055
G1 X154.886 Y117.305 E.00372
G1 X154.736 Y117.279 E.00054
G1 X154.736 Y118.325 E.00372
G1 X154.586 Y118.298 E.00054
G1 X154.586 Y117.252 E.00372
G1 X154.436 Y117.225 E.00054
G1 X154.436 Y118.272 E.00372
G1 X154.286 Y118.245 E.00054
G1 X154.286 Y117.198 E.00372
G1 X154.136 Y117.172 E.00054
G1 X154.136 Y118.218 E.00372
G1 X153.986 Y118.192 E.00054
G1 X153.986 Y117.145 E.00372
G1 X153.836 Y117.128 E.00054
G1 X153.836 Y118.165 E.00369
G1 X153.686 Y118.148 E.00054
G1 X153.686 Y117.11 E.00369
G1 X153.536 Y117.093 E.00054
G1 X153.536 Y118.13 E.00369
G1 X153.386 Y118.113 E.00054
G1 X153.386 Y117.075 E.00369
G1 X153.236 Y117.057 E.00054
G1 X153.236 Y118.095 E.00369
G1 X153.086 Y118.077 E.00054
G1 X153.086 Y117.04 E.00369
G1 X152.936 Y117.022 E.00054
G1 X152.936 Y118.06 E.00369
G1 X152.786 Y118.042 E.00054
G1 X152.786 Y117.007 E.00368
G1 X152.636 Y116.999 E.00053
G1 X152.636 Y118.031 E.00367
G1 X152.486 Y118.022 E.00053
G1 X152.486 Y116.99 E.00367
G1 X152.336 Y116.981 E.00053
G1 X152.336 Y118.013 E.00367
G1 X152.186 Y118.005 E.00053
G1 X152.186 Y116.973 E.00367
G1 X152.036 Y116.964 E.00053
G1 X152.036 Y117.996 E.00367
G1 X151.886 Y117.988 E.00053
G1 X151.886 Y116.955 E.00367
G1 X151.736 Y116.947 E.00053
G1 X151.736 Y117.979 E.00367
G2 X151.586 Y117.973 I-.125 J1.261 E.00053
G1 X151.586 Y116.943 E.00366
G1 X151.436 Y116.943 E.00053
G1 X151.436 Y117.973 E.00366
G1 X151.286 Y117.974 E.00053
G1 X151.286 Y116.943 E.00366
G1 X151.136 Y116.943 E.00053
G1 X151.136 Y117.974 E.00366
G1 X150.986 Y117.974 E.00053
G1 X150.986 Y116.944 E.00366
G1 X150.836 Y116.944 E.00053
G1 X150.836 Y117.975 E.00366
G1 X150.686 Y117.975 E.00053
G1 X150.686 Y116.944 E.00366
M73 P91 R2
G1 X150.536 Y116.945 E.00053
G1 X150.536 Y117.975 E.00366
G1 X150.386 Y117.984 E.00053
G1 X150.386 Y116.951 E.00367
G1 X150.236 Y116.96 E.00053
G1 X150.236 Y117.993 E.00367
G1 X150.086 Y118.002 E.00053
G1 X150.086 Y116.97 E.00367
G1 X149.936 Y116.979 E.00053
G1 X149.936 Y118.011 E.00367
G1 X149.786 Y118.02 E.00053
G1 X149.786 Y116.988 E.00367
G1 X149.636 Y116.997 E.00053
G1 X149.636 Y118.029 E.00367
G1 X149.486 Y118.039 E.00053
G1 X149.486 Y117.006 E.00367
G1 X149.336 Y117.015 E.00053
G1 X149.336 Y118.053 E.00369
G1 X149.186 Y118.071 E.00054
G1 X149.186 Y117.033 E.00369
G1 X149.036 Y117.051 E.00054
G1 X149.036 Y118.089 E.00369
G1 X148.886 Y118.107 E.00054
G1 X148.886 Y117.069 E.00369
G1 X148.736 Y117.087 E.00054
G1 X148.736 Y118.125 E.00369
G1 X148.586 Y118.144 E.00054
G1 X148.586 Y117.106 E.00369
G1 X148.436 Y117.124 E.00054
G1 X148.436 Y118.162 E.00369
G2 X148.286 Y118.182 I.094 J1.274 E.00054
G1 X148.286 Y117.142 E.0037
G2 X148.136 Y117.162 I.092 J1.274 E.00054
G1 X148.136 Y118.209 E.00372
G1 X147.986 Y118.236 E.00054
G1 X147.986 Y117.189 E.00372
G1 X147.836 Y117.216 E.00054
G1 X147.836 Y118.264 E.00372
G1 X147.686 Y118.291 E.00054
G1 X147.686 Y117.243 E.00372
G1 X147.536 Y117.271 E.00054
G1 X147.536 Y118.318 E.00372
G1 X147.386 Y118.345 E.00054
G1 X147.386 Y117.298 E.00372
G1 X147.236 Y117.325 E.00054
G1 X147.236 Y118.373 E.00372
G1 X147.086 Y118.409 E.00055
G1 X147.086 Y117.352 E.00375
G2 X146.936 Y117.385 I.195 J1.28 E.00055
G1 X146.936 Y118.445 E.00377
G1 X146.786 Y118.482 E.00055
G1 X146.786 Y117.421 E.00377
G1 X146.636 Y117.458 E.00055
G1 X146.636 Y118.518 E.00377
G1 X146.486 Y118.555 E.00055
G1 X146.486 Y117.494 E.00377
G1 X146.336 Y117.531 E.00055
G1 X146.336 Y118.591 E.00377
G1 X146.186 Y118.628 E.00055
G1 X146.186 Y117.567 E.00377
G1 X146.036 Y117.604 E.00055
G1 X146.036 Y118.672 E.0038
G1 X145.886 Y118.718 E.00056
G1 X145.878 Y117.642 E.00382
G1 X145.736 Y117.686 E.00053
G1 X145.736 Y118.764 E.00383
G1 X145.586 Y118.81 E.00056
G1 X145.586 Y117.732 E.00383
G1 X145.436 Y117.778 E.00056
G1 X145.436 Y118.856 E.00383
G1 X145.286 Y118.902 E.00056
G1 X145.286 Y117.824 E.00383
G1 X145.136 Y117.87 E.00056
G1 X145.136 Y118.948 E.00383
G2 X144.986 Y119.002 I.373 J1.29 E.00057
G1 X144.986 Y117.917 E.00386
G1 X144.836 Y117.963 E.00056
G1 X144.836 Y119.058 E.00389
G1 X144.686 Y119.114 E.00057
G1 X144.686 Y118.014 E.00391
G1 X144.536 Y118.07 E.00057
G1 X144.536 Y119.17 E.00391
G1 X144.386 Y119.226 E.00057
G1 X144.386 Y118.126 E.00391
G1 X144.236 Y118.182 E.00057
G1 X144.236 Y119.282 E.00391
G1 X144.086 Y119.338 E.00057
G1 X144.086 Y118.238 E.00391
G1 X143.936 Y118.294 E.00057
G1 X143.936 Y119.402 E.00394
G1 X143.786 Y119.469 E.00058
G1 X143.786 Y118.35 E.00398
G2 X143.636 Y118.408 I.414 J1.293 E.00057
G1 X143.636 Y119.535 E.00401
G1 X143.486 Y119.601 E.00058
G1 X143.486 Y118.474 E.00401
G1 X143.336 Y118.541 E.00058
G1 X143.336 Y119.668 E.00401
G1 X143.186 Y119.734 E.00058
G1 X143.186 Y118.607 E.00401
G1 X143.036 Y118.674 E.00058
G1 X143.036 Y119.801 E.00401
G1 X142.886 Y119.878 E.0006
G1 X142.886 Y118.74 E.00405
G1 X142.736 Y118.807 E.00058
G1 X142.736 Y119.956 E.00409
G1 X142.586 Y120.033 E.0006
G1 X142.586 Y118.874 E.00412
G1 X142.436 Y118.951 E.0006
G1 X142.436 Y120.11 E.00412
G1 X142.286 Y120.188 E.0006
G1 X142.286 Y119.028 E.00412
G1 X142.136 Y119.106 E.0006
G1 X142.136 Y120.265 E.00412
G2 X141.986 Y120.348 I.623 J1.306 E.00061
G1 X141.986 Y119.183 E.00414
G1 X141.836 Y119.26 E.0006
G1 X141.836 Y120.437 E.00418
G1 X141.686 Y120.526 E.00062
G1 X141.686 Y119.338 E.00422
G2 X141.536 Y119.417 I.591 J1.303 E.0006
G1 X141.536 Y120.615 E.00426
G1 X141.386 Y120.704 E.00062
G1 X141.386 Y119.506 E.00426
G1 X141.236 Y119.595 E.00062
G1 X141.236 Y120.793 E.00426
G2 X141.086 Y120.883 I.688 J1.31 E.00062
G1 X141.086 Y119.684 E.00426
G1 X140.936 Y119.773 E.00062
G1 X140.936 Y120.985 E.00431
G1 X140.786 Y121.086 E.00064
G1 X140.786 Y119.862 E.00435
G1 X140.636 Y119.951 E.00062
G1 X140.636 Y121.188 E.0044
G1 X140.486 Y121.289 E.00064
G1 X140.486 Y120.045 E.00442
G1 X140.336 Y120.147 E.00064
G1 X140.336 Y121.391 E.00442
G1 X140.186 Y121.492 E.00064
G1 X140.186 Y120.248 E.00442
G1 X140.036 Y120.349 E.00064
G1 X140.036 Y121.607 E.00447
G1 X139.886 Y121.722 E.00067
G1 X139.886 Y120.451 E.00452
G1 X139.736 Y120.552 E.00064
G1 X139.736 Y121.837 E.00457
G1 X139.586 Y121.952 E.00067
G1 X139.586 Y120.654 E.00461
G1 X139.436 Y120.769 E.00067
G1 X139.436 Y122.067 E.00461
G2 X139.286 Y122.184 I.911 J1.322 E.00068
G1 X139.286 Y120.883 E.00462
G1 X139.136 Y120.998 E.00067
G1 X139.136 Y122.314 E.00467
G1 X138.986 Y122.443 E.00071
G1 X138.986 Y121.113 E.00473
G1 X138.836 Y121.228 E.00067
G1 X138.836 Y122.573 E.00478
G1 X138.686 Y122.703 E.00071
G1 X138.686 Y121.343 E.00483
G2 X138.536 Y121.47 I.994 J1.328 E.0007
G1 X138.536 Y122.833 E.00484
G2 X138.386 Y122.972 I1.095 J1.333 E.00073
G1 X138.386 Y121.6 E.00488
G1 X138.236 Y121.73 E.00071
G1 X138.236 Y123.118 E.00493
G1 X138.086 Y123.264 E.00074
G1 X138.086 Y121.859 E.00499
G1 X137.936 Y121.989 E.00071
G1 X137.936 Y123.41 E.00505
G1 X137.786 Y123.556 E.00074
G1 X137.786 Y122.119 E.00511
G2 X137.636 Y122.264 I1.143 J1.336 E.00074
G1 X137.636 Y123.707 E.00513
G1 X137.486 Y123.872 E.00079
G1 X137.486 Y122.41 E.0052
G1 X137.336 Y122.556 E.00074
G1 X137.336 Y124.036 E.00526
G1 X137.186 Y124.201 E.00079
G1 X137.186 Y122.702 E.00533
G1 X137.036 Y122.848 E.00074
G1 X137.036 Y124.366 E.00539
G2 X136.886 Y124.536 I1.363 J1.349 E.00081
G1 X136.886 Y123 E.00546
G1 X136.736 Y123.165 E.00079
G1 X136.736 Y124.722 E.00553
G1 X136.586 Y124.907 E.00085
G1 X136.586 Y123.33 E.00561
G1 X136.436 Y123.494 E.00079
G1 X136.436 Y125.093 E.00568
G1 X136.286 Y125.279 E.00085
G1 X136.286 Y123.659 E.00576
G2 X136.136 Y123.825 I1.325 J1.347 E.0008
G1 X136.136 Y125.48 E.00588
G1 X135.986 Y125.69 E.00092
G1 X135.986 Y124.01 E.00597
G1 X135.836 Y124.196 E.00085
G1 X135.836 Y125.9 E.00606
G1 X135.686 Y126.109 E.00092
G1 X135.686 Y124.382 E.00614
G1 X135.536 Y124.567 E.00085
G1 X135.536 Y126.329 E.00626
G1 X135.386 Y126.568 E.001
G1 X135.386 Y124.757 E.00644
G1 X135.236 Y124.967 E.00092
G1 X135.236 Y126.807 E.00654
G1 X135.086 Y127.045 E.001
G1 X135.086 Y125.177 E.00664
G1 X134.936 Y125.387 E.00092
G1 X134.936 Y127.298 E.0068
G1 X134.786 Y127.572 E.00111
G1 X134.786 Y125.597 E.00702
G2 X134.636 Y125.825 I1.849 J1.378 E.00097
G1 X134.636 Y127.845 E.00718
G1 X134.486 Y128.118 E.00111
G1 X134.486 Y126.063 E.0073
G1 X134.336 Y126.302 E.001
G1 X134.336 Y128.429 E.00756
G1 X134.186 Y128.745 E.00124
G1 X134.186 Y126.541 E.00784
G2 X134.036 Y126.796 I2.08 J1.392 E.00105
G1 X134.036 Y129.062 E.00805
G2 X133.886 Y129.417 I2.918 J1.441 E.00137
G1 X133.886 Y127.07 E.00834
G1 X133.736 Y127.343 E.00111
G1 X133.736 Y129.789 E.00869
G1 X133.586 Y130.161 E.00143
G1 X133.586 Y127.616 E.00904
G2 X133.436 Y127.922 I2.498 J1.416 E.00121
G1 X133.436 Y130.815 E.01028
G1 X133.286 Y131.263 F30000
G1 F3600
G1 X133.286 Y128.238 E.01075
G1 X133.136 Y128.555 E.00124
G1 X133.136 Y131.816 E.01159
G1 X132.986 Y132.384 F30000
G1 F3600
G1 X132.986 Y128.894 E.01241
G1 X132.836 Y129.265 E.00143
G1 X132.836 Y133.103 E.01364
G1 X132.686 Y133.998 F30000
G1 F3600
G1 X132.686 Y129.637 E.0155
G1 X132.635 Y129.763 E.00048
G2 X132.536 Y130.046 I2.33 J.977 E.00106
G1 X132.536 Y135.378 E.01895
; WIPE_START
G1 F24000
G1 X132.536 Y133.378 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.11 J1.212 P1  F30000
G1 X169.736 Y136.753 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X169.736 Y143.35 E.02345
G1 X169.586 Y143.749 F30000
G1 F3600
G1 X169.586 Y139.011 E.01684
G1 X169.436 Y139.997 F30000
G1 F3600
G1 X169.436 Y143.941 E.01402
G1 X169.286 Y144.313 E.00143
G1 X169.286 Y140.716 E.01278
G1 X169.136 Y141.335 F30000
G1 F3600
G1 X169.136 Y144.669 E.01185
G1 X168.986 Y144.985 E.00124
G1 X168.986 Y141.888 E.01101
G1 X168.836 Y142.369 F30000
G1 F3600
G1 X168.836 Y145.301 E.01042
G1 X168.686 Y145.618 E.00124
G1 X168.686 Y143.027 E.00921
G1 X168.653 Y143.125 E.00036
G3 X168.536 Y143.417 I-22.841 J-8.983 E.00112
G1 X168.536 Y145.893 E.0088
G1 X168.386 Y146.167 E.00111
G1 X168.386 Y143.789 E.00845
G1 X168.236 Y144.161 E.00143
G1 X168.236 Y146.44 E.0081
G3 X168.086 Y146.706 I-2.319 J-1.13 E.00109
G1 X168.086 Y144.478 E.00792
G1 X167.936 Y144.794 E.00124
G1 X167.936 Y146.945 E.00764
G1 X167.786 Y147.183 E.001
G1 X167.786 Y145.111 E.00737
G3 X167.636 Y145.391 I-2.439 J-1.123 E.00113
G1 X167.636 Y147.422 E.00722
G3 X167.486 Y147.659 I-2.073 J-1.145 E.001
G1 X167.486 Y145.665 E.00709
G1 X167.336 Y145.938 E.00111
G1 X167.336 Y147.869 E.00686
G1 X167.186 Y148.079 E.00092
G1 X167.186 Y146.202 E.00667
G1 X167.036 Y146.44 E.001
G1 X167.036 Y148.289 E.00657
G1 X166.886 Y148.499 E.00092
G1 X166.886 Y146.679 E.00647
G1 X166.736 Y146.918 E.001
G1 X166.736 Y148.696 E.00632
G1 X166.586 Y148.881 E.00085
G1 X166.586 Y147.146 E.00617
G1 X166.436 Y147.356 E.00092
G1 X166.436 Y149.067 E.00608
G1 X166.286 Y149.253 E.00085
G1 X166.286 Y147.566 E.006
G1 X166.136 Y147.776 E.00092
G1 X166.136 Y149.438 E.00591
G3 X165.986 Y149.611 I-1.529 J-1.178 E.00081
G1 X165.986 Y147.985 E.00578
G1 X165.836 Y148.17 E.00085
G1 X165.836 Y149.775 E.00571
G1 X165.686 Y149.94 E.00079
G1 X165.686 Y148.356 E.00563
G1 X165.536 Y148.541 E.00085
G1 X165.536 Y150.105 E.00556
G1 X165.386 Y150.269 E.00079
G1 X165.386 Y148.727 E.00548
G3 X165.236 Y148.904 I-1.567 J-1.176 E.00083
G1 X165.236 Y150.427 E.00541
G1 X165.086 Y150.573 E.00074
G1 X165.086 Y149.068 E.00535
G1 X164.936 Y149.233 E.00079
G1 X164.936 Y150.719 E.00528
G1 X164.786 Y150.865 E.00074
G1 X164.786 Y149.398 E.00522
G1 X164.636 Y149.562 E.00079
G1 X164.636 Y151.012 E.00515
G1 X164.486 Y151.158 E.00074
G1 X164.486 Y149.719 E.00511
G1 X164.336 Y149.865 E.00074
G1 X164.336 Y151.291 E.00507
G1 X164.186 Y151.421 E.00071
G1 X164.186 Y150.011 E.00501
G1 X164.036 Y150.157 E.00074
G1 X164.036 Y151.55 E.00495
G1 X163.886 Y151.68 E.00071
G1 X163.886 Y150.304 E.00489
G3 X163.736 Y150.447 I-1.287 J-1.192 E.00074
G1 X163.736 Y151.81 E.00484
G1 X163.586 Y151.94 E.00071
G1 X163.586 Y150.577 E.00484
G1 X163.436 Y150.707 E.00071
G1 X163.436 Y152.056 E.0048
G1 X163.286 Y152.171 E.00067
G1 X163.286 Y150.837 E.00474
G1 X163.136 Y150.966 E.00071
G1 X163.136 Y152.286 E.00469
G1 X162.986 Y152.401 E.00067
G1 X162.986 Y151.096 E.00464
G3 X162.836 Y151.218 I-1.099 J-1.203 E.00069
G1 X162.836 Y152.516 E.00461
G1 X162.686 Y152.631 E.00067
G1 X162.686 Y151.333 E.00461
G1 X162.536 Y151.448 E.00067
G1 X162.536 Y152.736 E.00458
G1 X162.386 Y152.838 E.00064
G1 X162.386 Y151.563 E.00453
G1 X162.236 Y151.678 E.00067
G1 X162.236 Y152.939 E.00448
G1 X162.086 Y153.041 E.00064
G1 X162.086 Y151.793 E.00444
G3 X161.936 Y151.898 I-.965 J-1.211 E.00065
G1 X161.936 Y153.142 E.00442
G1 X161.786 Y153.244 E.00064
G1 X161.786 Y152 E.00442
G1 X161.636 Y152.101 E.00064
G1 X161.636 Y153.342 E.00441
G1 X161.486 Y153.431 E.00062
G1 X161.486 Y152.202 E.00437
G1 X161.336 Y152.304 E.00064
G1 X161.336 Y153.52 E.00432
G1 X161.186 Y153.609 E.00062
G1 X161.186 Y152.405 E.00428
G1 X161.036 Y152.5 E.00063
G1 X161.036 Y153.698 E.00426
G1 X160.886 Y153.787 E.00062
G1 X160.886 Y152.589 E.00426
G1 X160.736 Y152.678 E.00062
G1 X160.736 Y153.876 E.00426
G3 X160.586 Y153.958 I-.77 J-1.222 E.00061
G1 X160.586 Y152.767 E.00424
G1 X160.436 Y152.856 E.00062
G1 X160.436 Y154.036 E.00419
G1 X160.286 Y154.113 E.0006
G1 X160.286 Y152.945 E.00415
G3 X160.136 Y153.031 I-.803 J-1.221 E.00062
G1 X160.136 Y154.19 E.00412
G1 X159.986 Y154.268 E.0006
G1 X159.986 Y153.108 E.00412
G1 X159.836 Y153.186 E.0006
G1 X159.836 Y154.345 E.00412
G1 X159.686 Y154.422 E.0006
G1 X159.686 Y153.263 E.00412
G1 X159.536 Y153.34 E.0006
G1 X159.536 Y154.493 E.0041
G1 X159.386 Y154.559 E.00058
G1 X159.386 Y153.418 E.00406
G1 X159.236 Y153.495 E.0006
G1 X159.236 Y154.626 E.00402
G1 X159.086 Y154.692 E.00058
G1 X159.086 Y153.565 E.00401
G1 X158.936 Y153.632 E.00058
G1 X158.936 Y154.759 E.00401
G1 X158.786 Y154.825 E.00058
G1 X158.786 Y153.698 E.00401
G1 X158.636 Y153.764 E.00058
G1 X158.636 Y154.891 E.00401
G3 X158.486 Y154.953 I-.591 J-1.233 E.00058
G1 X158.486 Y153.831 E.00399
G1 X158.336 Y153.897 E.00058
G1 X158.336 Y155.009 E.00395
G1 X158.186 Y155.065 E.00057
G1 X158.186 Y153.964 E.00391
G3 X158.036 Y154.021 I-.556 J-1.235 E.00057
G1 X158.036 Y155.121 E.00391
G1 X157.886 Y155.177 E.00057
G1 X157.886 Y154.077 E.00391
G1 X157.736 Y154.133 E.00057
G1 X157.736 Y155.233 E.00391
G1 X157.586 Y155.289 E.00057
G1 X157.586 Y154.189 E.00391
G1 X157.436 Y154.245 E.00057
G1 X157.436 Y155.343 E.0039
G1 X157.286 Y155.389 E.00056
G1 X157.286 Y154.301 E.00387
G1 X157.136 Y154.357 E.00057
G1 X157.136 Y155.435 E.00383
G1 X156.986 Y155.481 E.00056
G1 X156.986 Y154.403 E.00383
G1 X156.836 Y154.449 E.00056
G1 X156.836 Y155.527 E.00383
G1 X156.686 Y155.573 E.00056
G1 X156.686 Y154.495 E.00383
G1 X156.536 Y154.542 E.00056
G1 X156.536 Y155.62 E.00383
G1 X156.386 Y155.666 E.00056
G1 X156.386 Y154.588 E.00383
G1 X156.236 Y154.634 E.00056
G1 X156.236 Y155.705 E.00381
G1 X156.086 Y155.741 E.00055
G1 X156.086 Y154.68 E.00377
G3 X155.936 Y154.717 I-.389 J-1.245 E.00055
G1 X155.936 Y155.778 E.00377
G1 X155.786 Y155.814 E.00055
G1 X155.786 Y154.754 E.00377
G1 X155.636 Y154.79 E.00055
G1 X155.636 Y155.851 E.00377
G1 X155.486 Y155.887 E.00055
G1 X155.486 Y154.827 E.00377
G1 X155.336 Y154.863 E.00055
G1 X155.336 Y155.924 E.00377
G3 X155.186 Y155.959 I-.369 J-1.246 E.00055
G1 X155.186 Y154.9 E.00376
G1 X155.036 Y154.936 E.00055
G1 X155.036 Y155.986 E.00373
G1 X154.886 Y156.013 E.00054
G1 X154.886 Y154.966 E.00372
G1 X154.736 Y154.993 E.00054
G1 X154.736 Y156.041 E.00372
G1 X154.586 Y156.068 E.00054
G1 X154.586 Y155.021 E.00372
G1 X154.436 Y155.048 E.00054
G1 X154.436 Y156.095 E.00372
G1 X154.286 Y156.122 E.00054
G1 X154.286 Y155.075 E.00372
G1 X154.136 Y155.102 E.00054
G1 X154.136 Y156.15 E.00372
G3 X153.986 Y156.172 I-.266 J-1.253 E.00054
G1 X153.986 Y155.13 E.00371
G3 X153.836 Y155.152 I-.268 J-1.252 E.00054
G1 X153.836 Y156.19 E.00369
G1 X153.686 Y156.209 E.00054
G1 X153.686 Y155.171 E.00369
G1 X153.536 Y155.189 E.00054
G1 X153.536 Y156.227 E.00369
G1 X153.386 Y156.245 E.00054
G1 X153.386 Y155.207 E.00369
G1 X153.236 Y155.225 E.00054
G1 X153.236 Y156.263 E.00369
G1 X153.086 Y156.281 E.00054
G1 X153.086 Y155.243 E.00369
G1 X152.936 Y155.261 E.00054
G1 X152.936 Y156.299 E.00369
G3 X152.786 Y156.311 I-.17 J-1.258 E.00054
G1 X152.786 Y155.278 E.00367
G1 X152.636 Y155.287 E.00053
G1 X152.636 Y156.32 E.00367
G1 X152.486 Y156.329 E.00053
G1 X152.486 Y155.297 E.00367
G1 X152.336 Y155.306 E.00053
G1 X152.336 Y156.338 E.00367
G1 X152.186 Y156.347 E.00053
G1 X152.186 Y155.315 E.00367
G1 X152.036 Y155.324 E.00053
G1 X152.036 Y156.356 E.00367
G1 X151.886 Y156.366 E.00053
G1 X151.886 Y155.333 E.00367
G1 X151.736 Y155.342 E.00053
G1 X151.734 Y156.375 E.00367
G1 X151.586 Y156.375 E.00053
G1 X151.586 Y155.345 E.00366
G1 X151.436 Y155.345 E.00053
G1 X151.436 Y156.375 E.00366
G1 X151.286 Y156.376 E.00053
G1 X151.286 Y155.345 E.00366
G1 X151.136 Y155.346 E.00053
G1 X151.136 Y156.376 E.00366
G1 X150.986 Y156.376 E.00053
G1 X150.986 Y155.346 E.00366
G1 X150.836 Y155.346 E.00053
G1 X150.836 Y156.377 E.00366
G1 X150.686 Y156.377 E.00053
G1 X150.686 Y155.346 E.00366
G3 X150.536 Y155.343 I-.048 J-1.265 E.00053
G1 X150.536 Y156.375 E.00367
G1 X150.386 Y156.367 E.00053
G1 X150.386 Y155.335 E.00367
G1 X150.236 Y155.326 E.00053
G1 X150.236 Y156.358 E.00367
G1 X150.086 Y156.35 E.00053
G1 X150.086 Y155.317 E.00367
G1 X149.936 Y155.309 E.00053
G1 X149.936 Y156.341 E.00367
G1 X149.786 Y156.332 E.00053
G1 X149.786 Y155.3 E.00367
G1 X149.636 Y155.292 E.00053
G1 X149.636 Y156.324 E.00367
G1 X149.486 Y156.315 E.00053
G1 X149.486 Y155.283 E.00367
G1 X149.336 Y155.265 E.00054
G1 X149.336 Y156.303 E.00369
G1 X149.186 Y156.285 E.00054
G1 X149.186 Y155.248 E.00369
G1 X149.036 Y155.23 E.00054
G1 X149.036 Y156.268 E.00369
G1 X148.886 Y156.25 E.00054
G1 X148.886 Y155.212 E.00369
G1 X148.736 Y155.195 E.00054
G1 X148.736 Y156.232 E.00369
G1 X148.586 Y156.215 E.00054
G1 X148.586 Y155.177 E.00369
G1 X148.436 Y155.16 E.00054
G1 X148.436 Y156.197 E.00369
G1 X148.286 Y156.18 E.00054
G1 X148.286 Y155.136 E.00371
G1 X148.136 Y155.109 E.00054
G1 X148.136 Y156.156 E.00372
G1 X147.986 Y156.129 E.00054
G1 X147.986 Y155.083 E.00372
G1 X147.836 Y155.056 E.00054
G1 X147.836 Y156.103 E.00372
G1 X147.686 Y156.076 E.00054
G1 X147.686 Y155.029 E.00372
G1 X147.536 Y155.003 E.00054
G1 X147.536 Y156.049 E.00372
G1 X147.386 Y156.023 E.00054
G1 X147.386 Y154.976 E.00372
G3 X147.236 Y154.946 I.181 J-1.279 E.00054
G1 X147.236 Y155.996 E.00373
G1 X147.086 Y155.969 E.00054
G1 X147.086 Y154.91 E.00377
G1 X146.936 Y154.874 E.00055
G1 X146.936 Y155.933 E.00377
G1 X146.786 Y155.897 E.00055
G1 X146.786 Y154.838 E.00377
G1 X146.636 Y154.802 E.00055
G1 X146.636 Y155.861 E.00377
G1 X146.486 Y155.825 E.00055
G1 X146.486 Y154.766 E.00377
G1 X146.336 Y154.73 E.00055
G1 X146.336 Y155.789 E.00377
G1 X146.186 Y155.754 E.00055
G1 X146.186 Y154.692 E.00377
G1 X146.036 Y154.646 E.00056
G1 X146.036 Y155.718 E.00381
G3 X145.886 Y155.678 I.262 J-1.284 E.00055
G1 X145.886 Y154.601 E.00383
G1 X145.736 Y154.555 E.00056
G1 X145.736 Y155.632 E.00383
G1 X145.586 Y155.587 E.00056
G1 X145.586 Y154.51 E.00383
G1 X145.436 Y154.464 E.00056
G1 X145.436 Y155.541 E.00383
G1 X145.286 Y155.496 E.00056
G1 X145.286 Y154.419 E.00383
G3 X145.136 Y154.372 I.321 J-1.287 E.00056
G1 X145.136 Y155.45 E.00383
G1 X144.986 Y155.405 E.00056
G1 X144.986 Y154.316 E.00387
G1 X144.836 Y154.261 E.00057
G1 X144.836 Y155.359 E.0039
G1 X144.686 Y155.304 E.00057
G1 X144.686 Y154.206 E.0039
G1 X144.536 Y154.15 E.00057
G1 X144.536 Y155.249 E.0039
G1 X144.386 Y155.193 E.00057
G1 X144.386 Y154.095 E.0039
G1 X144.236 Y154.039 E.00057
G1 X144.236 Y155.138 E.0039
G1 X144.086 Y155.082 E.00057
G1 X144.086 Y153.982 E.00391
G1 X143.936 Y153.916 E.00058
G1 X143.936 Y155.027 E.00395
G1 X143.786 Y154.972 E.00057
G1 X143.786 Y153.85 E.00399
G1 X143.636 Y153.784 E.00058
G1 X143.636 Y154.909 E.004
G1 X143.486 Y154.844 E.00058
G1 X143.486 Y153.719 E.004
G1 X143.336 Y153.653 E.00058
G1 X143.336 Y154.778 E.004
G1 X143.186 Y154.712 E.00058
G1 X143.186 Y153.587 E.004
G3 X143.036 Y153.516 I.521 J-1.3 E.00059
G1 X143.036 Y154.646 E.00402
G1 X142.886 Y154.581 E.00058
G1 X142.886 Y153.44 E.00406
G1 X142.736 Y153.363 E.0006
G1 X142.736 Y154.515 E.00409
G3 X142.586 Y154.444 I.84 J-1.959 E.00059
G1 X142.586 Y153.286 E.00411
G1 X142.436 Y153.21 E.0006
G1 X142.436 Y154.367 E.00411
G1 X142.286 Y154.29 E.0006
G1 X142.286 Y153.133 E.00411
G1 X142.136 Y153.057 E.0006
G1 X142.136 Y154.214 E.00411
G1 X141.986 Y154.137 E.0006
G1 X141.986 Y152.97 E.00415
G1 X141.836 Y152.882 E.00062
G1 X141.836 Y154.06 E.00419
G1 X141.686 Y153.984 E.0006
G1 X141.686 Y152.793 E.00423
G1 X141.536 Y152.705 E.00062
G1 X141.536 Y153.901 E.00425
G1 X141.386 Y153.812 E.00062
G1 X141.386 Y152.617 E.00425
G1 X141.236 Y152.529 E.00062
G1 X141.236 Y153.724 E.00425
G1 X141.086 Y153.636 E.00062
G1 X141.086 Y152.434 E.00427
G1 X140.936 Y152.333 E.00064
G1 X140.936 Y153.548 E.00432
G1 X140.786 Y153.459 E.00062
G1 X140.786 Y152.233 E.00436
G1 X140.636 Y152.132 E.00064
G1 X140.636 Y153.371 E.0044
G3 X140.486 Y153.272 I.758 J-1.314 E.00064
G1 X140.486 Y152.032 E.00441
G1 X140.336 Y151.931 E.00064
G1 X140.336 Y153.172 E.00441
G1 X140.186 Y153.071 E.00064
G1 X140.186 Y151.825 E.00443
G1 X140.036 Y151.711 E.00067
G1 X140.036 Y152.971 E.00448
G1 X139.886 Y152.87 E.00064
G1 X139.886 Y151.597 E.00452
G1 X139.736 Y151.483 E.00067
G1 X139.736 Y152.769 E.00457
G3 X139.586 Y152.663 I.817 J-1.317 E.00065
G1 X139.586 Y151.369 E.0046
G1 X139.436 Y151.255 E.00067
G1 X139.436 Y152.549 E.0046
G1 X139.286 Y152.435 E.00067
G1 X139.286 Y151.133 E.00463
G1 X139.136 Y151.005 E.0007
G1 X139.136 Y152.321 E.00468
G1 X138.986 Y152.207 E.00067
G1 X138.986 Y150.876 E.00473
G1 X138.836 Y150.747 E.0007
G1 X138.836 Y152.093 E.00479
G3 X138.686 Y151.976 I.909 J-1.322 E.00068
G1 X138.686 Y150.618 E.00483
G1 X138.536 Y150.489 E.0007
G1 X138.536 Y151.848 E.00483
G1 X138.386 Y151.719 E.0007
G1 X138.386 Y150.346 E.00488
G1 X138.236 Y150.201 E.00074
G1 X138.236 Y151.59 E.00494
G1 X138.086 Y151.461 E.0007
G1 X138.086 Y150.056 E.005
G1 X137.936 Y149.911 E.00074
G1 X137.936 Y151.332 E.00505
G3 X137.786 Y151.199 I1.047 J-1.33 E.00071
G1 X137.786 Y149.766 E.0051
G3 X137.636 Y149.61 I1.238 J-1.342 E.00077
G1 X137.636 Y151.054 E.00513
G1 X137.486 Y150.909 E.00074
G1 X137.486 Y149.446 E.0052
G1 X137.336 Y149.283 E.00079
G1 X137.336 Y150.764 E.00526
G1 X137.186 Y150.619 E.00074
G1 X137.186 Y149.12 E.00533
G1 X137.036 Y148.956 E.00079
G1 X137.036 Y150.474 E.00539
G3 X136.886 Y150.317 I1.25 J-1.343 E.00077
G1 X136.886 Y148.781 E.00546
G1 X136.736 Y148.597 E.00084
G1 X136.736 Y150.153 E.00553
G1 X136.586 Y149.99 E.00079
G1 X136.586 Y148.412 E.00561
G1 X136.436 Y148.228 E.00084
G1 X136.436 Y149.827 E.00568
G1 X136.286 Y149.663 E.00079
G1 X136.286 Y148.044 E.00576
G3 X136.136 Y147.838 I1.665 J-1.367 E.00091
G1 X136.136 Y149.492 E.00588
G1 X135.986 Y149.307 E.00084
G1 X135.986 Y147.629 E.00597
G1 X135.836 Y147.421 E.00091
G1 X135.836 Y149.123 E.00605
G1 X135.686 Y148.939 E.00084
G1 X135.686 Y147.213 E.00614
G3 X135.536 Y146.987 I1.826 J-1.377 E.00096
G1 X135.536 Y148.755 E.00628
G3 X135.386 Y148.559 I1.573 J-1.361 E.00088
G1 X135.386 Y146.751 E.00643
G1 X135.236 Y146.514 E.001
G1 X135.236 Y148.351 E.00653
G1 X135.086 Y148.143 E.00091
G1 X135.086 Y146.277 E.00663
G3 X134.936 Y146.018 I2.108 J-1.393 E.00107
G1 X134.936 Y147.935 E.00681
G1 X134.786 Y147.726 E.00091
G1 X134.786 Y145.747 E.00704
G1 X134.636 Y145.476 E.0011
G1 X134.636 Y147.492 E.00717
G1 X134.486 Y147.256 E.001
G1 X134.486 Y145.202 E.0073
G1 X134.336 Y144.889 E.00123
G1 X134.336 Y147.019 E.00757
G1 X134.186 Y146.782 E.001
G1 X134.186 Y144.575 E.00784
G1 X134.036 Y144.262 E.00123
G1 X134.036 Y146.52 E.00803
G1 X133.886 Y146.249 E.0011
G1 X133.886 Y143.9 E.00835
G1 X133.736 Y143.532 E.00141
G1 X133.736 Y145.978 E.00869
G1 X133.586 Y145.707 E.0011
G1 X133.586 Y142.947 E.00981
G1 X133.436 Y142.506 F30000
G1 F3600
G1 X133.436 Y145.395 E.01027
G1 X133.286 Y145.082 E.00123
G1 X133.286 Y142.05 E.01078
G1 X133.136 Y141.505 F30000
G1 F3600
G1 X133.136 Y144.769 E.0116
G3 X132.986 Y144.422 I2.844 J-1.437 E.00134
G1 X132.986 Y140.927 E.01242
G1 X132.836 Y140.221 F30000
G1 F3600
G1 X132.836 Y144.054 E.01362
G1 X132.686 Y143.686 E.00141
G1 X132.686 Y139.323 E.01551
; WIPE_START
G1 F24000
G1 X132.686 Y141.323 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J-.054 P1  F30000
G1 X132.536 Y137.957 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X132.536 Y143.48 E.01963
G1 X132.386 Y143.039 F30000
G1 F3600
G1 X132.386 Y130.28 E.04535
G1 X132.236 Y130.727 F30000
G1 F3600
G1 X132.236 Y142.598 E.0422
G1 X132.086 Y142.081 F30000
G1 F3600
G1 X132.086 Y131.235 E.03856
G1 X131.936 Y131.788 F30000
M73 P91 R1
G1 F3600
G1 X131.936 Y141.537 E.03465
G1 X131.786 Y140.887 F30000
G1 F3600
G1 X131.786 Y132.429 E.03006
G1 X131.636 Y133.149 F30000
G1 F3600
G1 X131.636 Y140.175 E.02497
; WIPE_START
G1 F24000
G1 X131.636 Y138.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.204 J-.179 P1  F30000
G1 X131.486 Y139.183 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X131.486 Y134.147 E.0179
; WIPE_START
G1 F24000
G1 X131.486 Y136.147 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.09 J1.214 P1  F30000
G1 X157.246 Y138.051 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X151.743 Y135.843 E.17663
G1 X151.727 Y127.65 E.24406
G1 X157.227 Y127.64 E.16381
G1 X157.228 Y128.62 E.0292
G1 X157.246 Y137.991 E.27914
M204 S10000
; WIPE_START
G1 F24000
G1 X155.383 Y137.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.213 J.103 P1  F30000
G1 X156.183 Y127.849 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X157.021 Y128.687 E.03529
G1 X157.022 Y129.221
G1 X155.651 Y127.85 E.05775
G1 X155.119 Y127.851
G1 X157.023 Y129.755 E.08022
G1 X157.024 Y130.29
G1 X154.587 Y127.852 E.10268
G1 X154.054 Y127.853
G1 X157.025 Y130.824 E.12515
G1 X157.026 Y131.358
M73 P92 R1
G1 X153.522 Y127.854 E.14761
G1 X152.99 Y127.855
G1 X157.027 Y131.892 E.17007
G1 X157.028 Y132.427
G1 X152.457 Y127.856 E.19254
G1 X151.935 Y127.867
G1 X157.029 Y132.961 E.2146
G1 X157.03 Y133.495
G1 X151.936 Y128.401 E.2146
G1 X151.937 Y128.935
G1 X157.031 Y134.029 E.2146
G1 X157.032 Y134.564
G1 X151.938 Y129.469 E.21459
G1 X151.939 Y130.004
G1 X157.033 Y135.098 E.21459
G1 X157.034 Y135.632
G1 X151.94 Y130.538 E.21459
G1 X151.941 Y131.072
G1 X157.035 Y136.167 E.21459
G1 X157.036 Y136.701
G1 X151.942 Y131.607 E.21459
G1 X151.943 Y132.141
G1 X157.037 Y137.235 E.21459
G1 X156.996 Y137.727
G1 X151.944 Y132.675 E.21283
G1 X151.945 Y133.21
G1 X156.106 Y137.37 E.17527
G1 X155.215 Y137.013
G1 X151.946 Y133.744 E.13771
G1 X151.947 Y134.278
G1 X154.325 Y136.656 E.10016
G1 X153.434 Y136.298
G1 X151.948 Y134.812 E.0626
G1 X151.949 Y135.347
G1 X152.544 Y135.941 E.02504
M204 S10000
; WIPE_START
G1 F24000
G1 X151.949 Y135.347 E-.31951
G1 X151.948 Y134.812 E-.20303
G1 X152.39 Y135.254 E-.23746
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.611 J1.052 P1  F30000
G1 X157.136 Y138.01 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X157.136 Y127.705 E.03663
G1 X156.986 Y127.705 E.00053
G1 X156.986 Y137.877 E.03616
G1 X156.836 Y137.816 E.00057
G1 X156.836 Y127.705 E.03594
G1 X156.686 Y127.706 E.00053
G1 X156.686 Y137.756 E.03573
G1 X156.536 Y137.696 E.00057
G1 X156.536 Y127.706 E.03551
G1 X156.386 Y127.706 E.00053
G1 X156.386 Y137.636 E.0353
G1 X156.236 Y137.576 E.00057
G1 X156.236 Y127.706 E.03508
G1 X156.086 Y127.707 E.00053
G1 X156.086 Y137.516 E.03487
G1 X155.936 Y137.455 E.00057
G1 X155.936 Y127.707 E.03465
G1 X155.786 Y127.707 E.00053
G1 X155.786 Y137.395 E.03444
G1 X155.636 Y137.335 E.00057
G1 X155.636 Y127.708 E.03422
G1 X155.486 Y127.708 E.00053
G1 X155.486 Y137.275 E.03401
G1 X155.336 Y137.215 E.00057
G1 X155.336 Y127.708 E.03379
G1 X155.186 Y127.708 E.00053
G1 X155.186 Y137.155 E.03358
G1 X155.036 Y137.094 E.00057
G1 X155.036 Y127.709 E.03336
G1 X154.886 Y127.709 E.00053
G1 X154.886 Y137.034 E.03315
G1 X154.736 Y136.974 E.00057
G1 X154.736 Y127.709 E.03293
G1 X154.586 Y127.71 E.00053
G1 X154.586 Y136.914 E.03272
G1 X154.436 Y136.854 E.00057
G1 X154.436 Y127.71 E.0325
G1 X154.286 Y127.71 E.00053
G1 X154.286 Y136.793 E.03229
G1 X154.136 Y136.733 E.00057
G1 X154.136 Y127.71 E.03207
G1 X153.986 Y127.711 E.00053
G1 X153.986 Y136.673 E.03186
G1 X153.836 Y136.613 E.00057
G1 X153.836 Y127.711 E.03164
G1 X153.686 Y127.711 E.00053
G1 X153.686 Y136.553 E.03143
G1 X153.536 Y136.493 E.00057
G1 X153.536 Y127.711 E.03121
G1 X153.386 Y127.712 E.00053
G1 X153.386 Y136.432 E.031
G1 X153.236 Y136.372 E.00057
G1 X153.236 Y127.712 E.03078
G1 X153.086 Y127.712 E.00053
G1 X153.086 Y136.312 E.03057
G1 X152.936 Y136.252 E.00057
G1 X152.936 Y127.713 E.03035
G1 X152.786 Y127.713 E.00053
G1 X152.786 Y136.192 E.03014
G1 X152.636 Y136.132 E.00057
G1 X152.636 Y127.713 E.02992
G1 X152.486 Y127.713 E.00053
G1 X152.486 Y136.071 E.02971
G1 X152.336 Y136.011 E.00057
G1 X152.336 Y127.714 E.02949
G1 X152.186 Y127.714 E.00053
G1 X152.186 Y135.951 E.02928
G1 X152.036 Y135.891 E.00057
G1 X152.036 Y127.714 E.02906
G1 X151.886 Y127.715 E.00053
G1 X151.886 Y135.903 E.02911
; WIPE_START
G1 F24000
G1 X151.886 Y133.903 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.188 J-1.202 P1  F30000
G1 X144.894 Y134.995 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X144.881 Y127.663 E.21839
G1 X150.38 Y127.652 E.1638
G1 X150.38 Y128.038 E.01147
G1 X150.389 Y132.767 E.14086
G1 X144.95 Y134.972 E.17484
M204 S10000
; WIPE_START
G1 F24000
G1 X144.931 Y132.972 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.816 J.903 P1  F30000
G1 X150.173 Y128.238 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X149.796 Y127.861 E.01589
G1 X149.264 Y127.862
G1 X150.174 Y128.773 E.03836
G1 X150.175 Y129.307
G1 X148.732 Y127.863 E.06082
G1 X148.199 Y127.864
G1 X150.176 Y129.841 E.08328
G1 X150.177 Y130.375
G1 X147.667 Y127.865 E.10575
G1 X147.135 Y127.866
G1 X150.178 Y130.91 E.12821
G1 X150.179 Y131.444
G1 X146.603 Y127.867 E.15068
G1 X146.07 Y127.868
G1 X150.18 Y131.978 E.17314
G1 X150.181 Y132.512
G1 X145.538 Y127.869 E.1956
G1 X145.089 Y127.953
G1 X149.884 Y132.748 E.20199
G1 X149.504 Y132.902
G1 X145.09 Y128.487 E.18596
G1 X145.091 Y129.021
G1 X149.125 Y133.056 E.16994
G1 X148.745 Y133.209
G1 X145.092 Y129.556 E.15391
G1 X145.093 Y130.09
G1 X148.366 Y133.363 E.13789
G1 X147.986 Y133.517
G1 X145.093 Y130.624 E.12187
G1 X145.094 Y131.158
G1 X147.607 Y133.671 E.10584
G1 X147.228 Y133.825
G1 X145.095 Y131.693 E.08982
G1 X145.096 Y132.227
G1 X146.848 Y133.979 E.07379
G1 X146.469 Y134.132
G1 X145.097 Y132.761 E.05777
G1 X145.098 Y133.295
G1 X146.089 Y134.286 E.04174
G1 X145.71 Y134.44
G1 X145.099 Y133.829 E.02572
M204 S10000
; WIPE_START
G1 F24000
G1 X145.71 Y134.44 E-.32811
G1 X146.089 Y134.286 E-.15559
G1 X145.575 Y133.772 E-.2763
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.289 J1.182 P1  F30000
G1 X150.186 Y132.646 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101705
G1 F15000
G3 X149.97 Y132.662 I-.129 J-.279 E.00103
G1 X150.236 Y132.832 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X150.236 Y127.718 E.01818
G1 X150.086 Y127.718 E.00053
G1 X150.086 Y132.82 E.01813
G1 X149.936 Y132.88 E.00058
G1 X149.936 Y127.718 E.01835
G1 X149.786 Y127.719 E.00053
G1 X149.786 Y132.941 E.01856
G1 X149.636 Y133.002 E.00058
G1 X149.636 Y127.719 E.01878
G1 X149.486 Y127.719 E.00053
G1 X149.486 Y133.063 E.019
G1 X149.336 Y133.124 E.00058
G1 X149.336 Y127.719 E.01921
G1 X149.186 Y127.72 E.00053
G1 X149.186 Y133.184 E.01943
G1 X149.036 Y133.245 E.00058
G1 X149.036 Y127.72 E.01964
G1 X148.886 Y127.72 E.00053
G1 X148.886 Y133.306 E.01986
G1 X148.736 Y133.367 E.00058
G1 X148.736 Y127.721 E.02007
G1 X148.586 Y127.721 E.00053
G1 X148.586 Y133.428 E.02029
G1 X148.436 Y133.489 E.00058
G1 X148.436 Y127.721 E.0205
G1 X148.286 Y127.721 E.00053
G1 X148.286 Y133.549 E.02072
G1 X148.136 Y133.61 E.00058
G1 X148.136 Y127.722 E.02093
G1 X147.986 Y127.722 E.00053
G1 X147.986 Y133.671 E.02115
G1 X147.836 Y133.732 E.00058
G1 X147.836 Y127.722 E.02136
G1 X147.686 Y127.723 E.00053
G1 X147.686 Y133.793 E.02158
G1 X147.536 Y133.853 E.00058
G1 X147.536 Y127.723 E.02179
G1 X147.386 Y127.723 E.00053
G1 X147.386 Y133.914 E.02201
G1 X147.236 Y133.975 E.00058
G1 X147.236 Y127.723 E.02222
G1 X147.086 Y127.724 E.00053
G1 X147.086 Y134.036 E.02244
G1 X146.936 Y134.097 E.00058
G1 X146.936 Y127.724 E.02265
G1 X146.786 Y127.724 E.00053
G1 X146.786 Y134.158 E.02287
G1 X146.636 Y134.218 E.00058
G1 X146.636 Y127.724 E.02308
G1 X146.486 Y127.725 E.00053
G1 X146.486 Y134.279 E.0233
G1 X146.336 Y134.34 E.00058
G1 X146.336 Y127.725 E.02351
G1 X146.186 Y127.725 E.00053
G1 X146.186 Y134.401 E.02373
G1 X146.036 Y134.462 E.00058
G1 X146.036 Y127.726 E.02394
G1 X145.886 Y127.726 E.00053
G1 X145.886 Y134.522 E.02416
G1 X145.736 Y134.583 E.00058
G1 X145.736 Y127.726 E.02437
G1 X145.586 Y127.726 E.00053
G1 X145.586 Y134.644 E.02459
G1 X145.436 Y134.705 E.00058
G1 X145.436 Y127.727 E.0248
G1 X145.286 Y127.727 E.00053
G1 X145.286 Y134.766 E.02502
G1 X145.136 Y134.826 E.00058
G1 X145.136 Y127.727 E.02524
G1 X144.986 Y127.728 E.00053
G1 X144.986 Y134.96 E.02571
; WIPE_START
G1 F24000
G1 X144.986 Y132.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.285 J1.183 P1  F30000
G1 X150.392 Y134.265 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M73 P93 R1
G1 X150.394 Y135.144 E.02619
G1 X150.412 Y144.676 E.28392
G1 X144.913 Y144.686 E.1638
G1 X144.897 Y136.493 E.24403
G1 X150.337 Y134.287 E.17485
M204 S10000
G1 X150.186 Y135.184 F30000
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X149.751 Y134.749 E.01834
G1 X149.372 Y134.902
G1 X150.187 Y135.718 E.03436
G1 X150.188 Y136.252
G1 X148.992 Y135.056 E.05039
G1 X148.613 Y135.21
G1 X150.19 Y136.787 E.06641
G1 X150.191 Y137.321
G1 X148.234 Y135.364 E.08244
G1 X147.854 Y135.518
G1 X150.192 Y137.855 E.09846
G1 X150.193 Y138.389
G1 X147.475 Y135.672 E.11449
G1 X147.095 Y135.826
G1 X150.194 Y138.924 E.13051
G1 X150.195 Y139.458
G1 X146.716 Y135.979 E.14653
G1 X146.337 Y136.133
G1 X150.196 Y139.992 E.16256
G1 X150.197 Y140.527
G1 X145.957 Y136.287 E.17858
G1 X145.578 Y136.441
G1 X150.198 Y141.061 E.19461
G1 X150.199 Y141.595
G1 X145.198 Y136.595 E.21063
G1 X145.105 Y137.035
G1 X150.2 Y142.129 E.2146
G1 X150.201 Y142.664
G1 X145.106 Y137.569 E.21459
G1 X145.107 Y138.104
G1 X150.202 Y143.198 E.21459
G1 X150.203 Y143.732
G1 X145.108 Y138.638 E.21459
G1 X145.109 Y139.172
G1 X150.204 Y144.266 E.21459
G1 X149.873 Y144.469
G1 X145.11 Y139.707 E.20062
G1 X145.111 Y140.241
G1 X149.341 Y144.47 E.17816
G1 X148.809 Y144.471
G1 X145.113 Y140.775 E.15569
G1 X145.114 Y141.31
G1 X148.276 Y144.472 E.13323
G1 X147.744 Y144.473
G1 X145.115 Y141.844 E.11076
G1 X145.116 Y142.378
G1 X147.212 Y144.474 E.0883
G1 X146.679 Y144.475
G1 X145.117 Y142.912 E.06583
G1 X145.118 Y143.447
G1 X146.147 Y144.476 E.04337
G1 X145.615 Y144.477
G1 X145.119 Y143.981 E.0209
M204 S10000
; WIPE_START
G1 F24000
G1 X145.615 Y144.477 E-.26664
G1 X146.147 Y144.476 E-.20226
G1 X145.606 Y143.935 E-.2911
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.096 J.528 P1  F30000
G1 X150.236 Y134.326 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X150.236 Y144.611 E.03656
G1 X150.086 Y144.611 E.00053
G1 X150.086 Y134.459 E.03609
G1 X149.936 Y134.52 E.00058
G1 X149.936 Y144.612 E.03587
G1 X149.786 Y144.612 E.00053
G1 X149.786 Y134.581 E.03566
G1 X149.636 Y134.642 E.00058
G1 X149.636 Y144.612 E.03544
G1 X149.486 Y144.612 E.00053
G1 X149.486 Y134.703 E.03523
G1 X149.336 Y134.763 E.00058
G1 X149.336 Y144.613 E.03501
G1 X149.186 Y144.613 E.00053
G1 X149.186 Y134.824 E.0348
G1 X149.036 Y134.885 E.00058
G1 X149.036 Y144.613 E.03458
G1 X148.886 Y144.614 E.00053
G1 X148.886 Y134.946 E.03437
G1 X148.736 Y135.007 E.00058
G1 X148.736 Y144.614 E.03415
G1 X148.586 Y144.614 E.00053
G1 X148.586 Y135.067 E.03393
G1 X148.436 Y135.128 E.00058
G1 X148.436 Y144.614 E.03372
G1 X148.286 Y144.615 E.00053
G1 X148.286 Y135.189 E.0335
G1 X148.136 Y135.25 E.00058
G1 X148.136 Y144.615 E.03329
G1 X147.986 Y144.615 E.00053
G1 X147.986 Y135.311 E.03307
G1 X147.836 Y135.372 E.00058
G1 X147.836 Y144.615 E.03286
G1 X147.686 Y144.616 E.00053
G1 X147.686 Y135.432 E.03264
G1 X147.536 Y135.493 E.00058
G1 X147.536 Y144.616 E.03243
G1 X147.386 Y144.616 E.00053
G1 X147.386 Y135.554 E.03221
G1 X147.236 Y135.615 E.00058
G1 X147.236 Y144.617 E.032
G1 X147.086 Y144.617 E.00053
G1 X147.086 Y135.676 E.03178
G1 X146.936 Y135.737 E.00058
G1 X146.936 Y144.617 E.03157
G1 X146.786 Y144.617 E.00053
G1 X146.786 Y135.797 E.03135
G1 X146.636 Y135.858 E.00058
G1 X146.636 Y144.618 E.03114
G1 X146.486 Y144.618 E.00053
G1 X146.486 Y135.919 E.03092
G1 X146.336 Y135.98 E.00058
G1 X146.336 Y144.618 E.03071
G1 X146.186 Y144.619 E.00053
G1 X146.186 Y136.041 E.03049
G1 X146.036 Y136.102 E.00058
G1 X146.036 Y144.619 E.03028
G1 X145.886 Y144.619 E.00053
G1 X145.886 Y136.162 E.03006
G1 X145.736 Y136.223 E.00058
G1 X145.736 Y144.619 E.02985
G1 X145.586 Y144.62 E.00053
G1 X145.586 Y136.284 E.02963
G1 X145.436 Y136.345 E.00058
G1 X145.436 Y144.62 E.02942
G1 X145.286 Y144.62 E.00053
G1 X145.286 Y136.406 E.0292
G1 X145.136 Y136.467 E.00058
G1 X145.136 Y144.621 E.02898
G1 X144.986 Y144.621 E.00053
G1 X144.986 Y136.455 E.02903
; WIPE_START
G1 F24000
G1 X144.986 Y138.455 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.198 J1.201 P1  F30000
G1 X151.745 Y137.34 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X152.101 Y137.483 E.01143
G1 X157.249 Y139.548 E.1652
G1 X157.259 Y144.663 E.15235
G1 X151.76 Y144.673 E.1638
G1 X151.745 Y137.4 E.21663
M204 S10000
; WIPE_START
G1 F24000
G1 X152.101 Y137.483 E-.13894
G1 X153.618 Y138.092 E-.62106
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.688 J1.004 P1  F30000
G1 X157.043 Y140.441 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X155.788 Y139.186 E.05287
G1 X154.898 Y138.828
G1 X157.044 Y140.975 E.09042
G1 X157.045 Y141.509
G1 X154.007 Y138.471 E.12798
G1 X153.117 Y138.114
G1 X157.046 Y142.044 E.16553
G1 X157.047 Y142.578
G1 X152.226 Y137.757 E.20309
G1 X151.954 Y138.018
G1 X157.048 Y143.112 E.21459
G1 X157.049 Y143.646
G1 X151.955 Y138.552 E.21459
G1 X151.956 Y139.086
G1 X157.05 Y144.181 E.21459
G1 X156.793 Y144.456
G1 X151.957 Y139.621 E.20369
G1 X151.958 Y140.155
G1 X156.26 Y144.457 E.18123
G1 X155.728 Y144.458
G1 X151.959 Y140.689 E.15876
G1 X151.96 Y141.224
G1 X155.196 Y144.459 E.1363
G1 X154.664 Y144.46
G1 X151.961 Y141.758 E.11383
G1 X151.962 Y142.292
G1 X154.131 Y144.461 E.09136
G1 X153.599 Y144.462
G1 X151.963 Y142.827 E.0689
G1 X151.964 Y143.361
G1 X153.067 Y144.463 E.04643
G1 X152.534 Y144.464
G1 X151.965 Y143.895 E.02397
M204 S10000
; WIPE_START
G1 F24000
G1 X152.534 Y144.464 E-.30576
G1 X153.067 Y144.463 E-.20226
G1 X152.598 Y143.994 E-.25198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.856 J.865 P1  F30000
G1 X157.136 Y139.5 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X157.136 Y144.598 E.01812
G1 X156.986 Y144.598 E.00053
G1 X156.986 Y139.513 E.01808
G1 X156.836 Y139.452 E.00057
G1 X156.836 Y144.599 E.01829
G1 X156.686 Y144.599 E.00053
G1 X156.686 Y139.392 E.01851
G1 X156.536 Y139.332 E.00057
G1 X156.536 Y144.599 E.01872
G1 X156.386 Y144.599 E.00053
G1 X156.386 Y139.272 E.01894
G1 X156.236 Y139.212 E.00057
G1 X156.236 Y144.6 E.01915
G1 X156.086 Y144.6 E.00053
G1 X156.086 Y139.152 E.01937
G1 X155.936 Y139.091 E.00057
G1 X155.936 Y144.6 E.01958
G1 X155.786 Y144.601 E.00053
G1 X155.786 Y139.031 E.0198
G1 X155.636 Y138.971 E.00057
G1 X155.636 Y144.601 E.02001
G1 X155.486 Y144.601 E.00053
G1 X155.486 Y138.911 E.02023
G1 X155.336 Y138.851 E.00057
G1 X155.336 Y144.601 E.02044
G1 X155.186 Y144.602 E.00053
G1 X155.186 Y138.791 E.02066
G1 X155.036 Y138.73 E.00057
G1 X155.036 Y144.602 E.02087
G1 X154.886 Y144.602 E.00053
G1 X154.886 Y138.67 E.02109
G1 X154.736 Y138.61 E.00057
G1 X154.736 Y144.603 E.0213
G1 X154.586 Y144.603 E.00053
G1 X154.586 Y138.55 E.02152
G1 X154.436 Y138.49 E.00057
G1 X154.436 Y144.603 E.02173
G1 X154.286 Y144.603 E.00053
G1 X154.286 Y138.43 E.02195
G1 X154.136 Y138.369 E.00057
G1 X154.136 Y144.604 E.02216
G1 X153.986 Y144.604 E.00053
G1 X153.986 Y138.309 E.02238
G1 X153.836 Y138.249 E.00057
G1 X153.836 Y144.604 E.02259
G1 X153.686 Y144.604 E.00053
G1 X153.686 Y138.189 E.02281
G1 X153.536 Y138.129 E.00057
G1 X153.536 Y144.605 E.02302
M73 P94 R1
G1 X153.386 Y144.605 E.00053
G1 X153.386 Y138.068 E.02324
G1 X153.236 Y138.008 E.00057
G1 X153.236 Y144.605 E.02345
G1 X153.086 Y144.606 E.00053
G1 X153.086 Y137.948 E.02367
G1 X152.936 Y137.888 E.00057
G1 X152.936 Y144.606 E.02388
G1 X152.786 Y144.606 E.00053
G1 X152.786 Y137.828 E.0241
G1 X152.636 Y137.768 E.00057
G1 X152.636 Y144.606 E.02431
G1 X152.486 Y144.607 E.00053
G1 X152.486 Y137.707 E.02452
G1 X152.336 Y137.647 E.00057
G1 X152.336 Y144.607 E.02474
G1 X152.186 Y144.607 E.00053
G1 X152.186 Y137.587 E.02495
G1 X152.036 Y137.527 E.00057
G1 X152.036 Y144.608 E.02517
G1 X151.886 Y144.608 E.00053
G1 X151.886 Y137.394 E.02564
; WIPE_START
G1 F24000
G1 X151.886 Y139.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.014 J-1.217 P1  F30000
G1 X105.75 Y138.869 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X105.533 Y139.156 I.139 J.331 E.01123
G1 X105.534 Y142.151 E.0892
G1 X104.904 Y142.151 E.01874
G1 X104.905 Y139.299 E.08496
G3 X105.941 Y138.347 I.941 J-.015 E.04732
G1 X108.58 Y138.348 E.07861
G3 X109.463 Y139.283 I-.048 J.93 E.0423
G1 X109.463 Y142.151 E.08543
G1 X108.842 Y142.151 E.01849
G1 X108.843 Y139.13 E.08999
G2 X108.533 Y138.844 I-.329 J.046 E.01361
G1 X105.839 Y138.845 E.08023
G2 X105.807 Y138.851 I.05 J.355 E.00097
M204 S10000
G1 X105.407 Y138.775 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151427
G1 F15000
G3 X105.807 Y138.598 I.444 J.464 E.00382
G3 X108.553 Y138.596 I1.437 J73.658 E.02354
G3 X108.681 Y138.615 I-.132 J1.315 E.0011
G1 X108.793 Y138.656 E.00102
; LINE_WIDTH: 0.195609
G3 X109.085 Y138.953 I-.246 J.535 E.00514
; LINE_WIDTH: 0.269156
G3 X109.153 Y139.297 I-.585 J.293 E.00634
G1 X109.153 Y141.955 E.04751
; WIPE_START
G1 F24000
G1 X109.153 Y139.955 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.552 J-1.085 P1  F30000
G1 X105.219 Y141.955 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.274726
G1 F15000
G1 X105.22 Y139.244 E.04965
G3 X105.229 Y139.142 I.999 J.04 E.00187
G1 X105.254 Y139.029 E.00212
; LINE_WIDTH: 0.214681
G3 X105.39 Y138.793 I.684 J.236 E.00372
G1 X105.407 Y138.775 E.00034
; WIPE_START
G1 F24000
G1 X105.39 Y138.793 E-.06357
G1 X105.311 Y138.904 E-.34658
G1 X105.254 Y139.029 E-.34985
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.746 J.962 P1  F30000
G1 X109.286 Y142.154 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X109.278 Y138.844 E.01176
G2 X109.136 Y138.656 I-1.033 J.636 E.00084
G1 X109.136 Y142.086 E.01219
G1 X108.986 Y142.086 E.00053
G1 X108.986 Y138.536 E.01262
G2 X108.836 Y138.462 I-.458 J.747 E.00059
G1 X108.836 Y138.948 E.00173
G2 X108.686 Y138.821 I-.278 J.175 E.00071
G1 X108.686 Y138.423 E.00141
G2 X108.536 Y138.413 I-.143 J.957 E.00054
G1 X108.536 Y138.779 E.0013
G1 X108.386 Y138.779 E.00053
G1 X108.386 Y138.413 E.0013
G1 X108.236 Y138.413 E.00053
G1 X108.236 Y138.779 E.0013
G1 X108.086 Y138.779 E.00053
G1 X108.086 Y138.413 E.0013
G1 X107.936 Y138.413 E.00053
G1 X107.936 Y138.779 E.0013
G1 X107.786 Y138.779 E.00053
G1 X107.786 Y138.413 E.0013
G1 X107.636 Y138.413 E.00053
G1 X107.636 Y138.779 E.0013
G1 X107.486 Y138.779 E.00053
G1 X107.486 Y138.412 E.0013
G1 X107.336 Y138.412 E.00053
G1 X107.336 Y138.78 E.0013
G1 X107.186 Y138.78 E.00053
G1 X107.186 Y138.412 E.0013
G1 X107.036 Y138.412 E.00053
G1 X107.036 Y138.78 E.00131
G1 X106.886 Y138.78 E.00053
G1 X106.886 Y138.412 E.00131
G1 X106.736 Y138.412 E.00053
G1 X106.736 Y138.78 E.00131
G1 X106.586 Y138.78 E.00053
G1 X106.586 Y138.412 E.00131
G1 X106.436 Y138.412 E.00053
G1 X106.436 Y138.78 E.00131
G1 X106.286 Y138.78 E.00053
G1 X106.286 Y138.412 E.00131
G1 X106.136 Y138.412 E.00053
G1 X106.136 Y138.78 E.00131
G1 X105.986 Y138.78 E.00053
G1 X105.986 Y138.412 E.00131
G2 X105.836 Y138.415 I-.022 J3.46 E.00053
G1 X105.832 Y138.78 E.0013
G2 X105.686 Y138.823 I.012 J.31 E.00055
G1 X105.676 Y138.423 E.00142
G2 X105.536 Y138.461 I.121 J.724 E.00052
G1 X105.536 Y139.153 E.00246
; WIPE_START
G1 F24000
G1 X105.536 Y138.461 E-.26284
G1 X105.676 Y138.423 E-.05521
G1 X105.686 Y138.823 E-.15206
G1 X105.832 Y138.78 E-.058
G1 X105.836 Y138.415 E-.13882
G1 X105.986 Y138.412 E-.05701
G1 X105.986 Y138.507 E-.03606
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.201 J-.198 P1  F30000
G1 X105.386 Y142.154 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X105.386 Y138.534 E.01287
G2 X105.236 Y138.652 I.991 J1.407 E.00068
G1 X105.236 Y142.086 E.01221
G1 X105.086 Y142.086 E.00053
G1 X105.086 Y138.725 E.01195
; WIPE_START
G1 F24000
G1 X105.086 Y140.725 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.409 J-1.146 P1  F30000
G1 X99.826 Y138.845 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X102.482 Y138.845 E.07913
G3 X102.855 Y139.16 I.038 J.333 E.01628
G1 X102.855 Y141.322 E.06441
G3 X102.51 Y141.645 I-.347 J-.025 E.01548
G1 X99.826 Y141.644 E.07996
G1 X99.826 Y138.905 E.08158
M204 S10000
; WIPE_START
G1 F24000
G1 X101.825 Y138.86 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.04 J-.632 P1  F30000
G1 X99.826 Y142.151 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X99.826 Y143.205 E.03139
G1 X99.105 Y143.205 E.02145
G1 X99.105 Y138.347 E.1447
G1 X102.733 Y138.353 E.10805
G3 X103.552 Y139.295 I-.114 J.926 E.04074
G1 X103.551 Y141.246 E.0581
G3 X102.644 Y142.151 I-.927 J-.022 E.04212
G1 X99.886 Y142.151 E.08218
M204 S10000
G1 X99.598 Y141.898 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159422
G1 F15000
G1 X102.526 Y141.898 E.02695
G2 X102.802 Y141.853 I.052 J-.563 E.0026
; LINE_WIDTH: 0.219506
G1 X102.9 Y141.808 E.0015
G2 X102.997 Y141.733 I-.408 J-.636 E.00171
; LINE_WIDTH: 0.262433
G1 X103.116 Y141.582 E.00334
; LINE_WIDTH: 0.303019
G1 X103.164 Y141.473 E.00245
G2 X103.194 Y141.338 I-.87 J-.269 E.00284
; LINE_WIDTH: 0.344689
G2 X103.203 Y141.228 I-.865 J-.126 E.00263
G1 X103.203 Y139.306 E.04582
G2 X103.17 Y139.044 I-.78 J-.032 E.00631
; LINE_WIDTH: 0.298278
G1 X103.093 Y138.876 E.00372
; LINE_WIDTH: 0.256913
G1 X102.956 Y138.728 E.00341
; LINE_WIDTH: 0.21883
G1 X102.81 Y138.642 E.00236
; LINE_WIDTH: 0.151653
G2 X102.487 Y138.596 I-.26 J.662 E.00283
G1 X99.629 Y138.596 E.02454
; LINE_WIDTH: 0.149218
G1 X99.52 Y138.651 E.00103
; LINE_WIDTH: 0.184634
G1 X99.411 Y138.706 E.00137
; LINE_WIDTH: 0.220049
G1 X99.301 Y138.76 E.00171
G1 X99.465 Y138.543 F30000
; LINE_WIDTH: 0.371193
G1 F15000
G1 X99.465 Y141.84 E.08549
G3 X99.465 Y141.955 I-.326 J.058 E.003
G1 X99.465 Y143.009 E.02733
; WIPE_START
G1 F24000
G1 X99.465 Y141.955 E-.40045
G1 X99.465 Y141.84 E-.04379
G1 X99.465 Y141.009 E-.31577
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.007 P1  F30000
G1 X99.47 Y141.898 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.381178
G1 F15000
G1 X99.502 Y141.898 E.00085
; LINE_WIDTH: 0.336573
G1 X99.534 Y141.898 E.00074
; LINE_WIDTH: 0.291967
G1 X99.566 Y141.898 E.00063
; LINE_WIDTH: 0.247362
G1 X99.598 Y141.898 E.00051
; WIPE_START
G1 F24000
G1 X99.566 Y141.898 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.071 J1.215 P1  F30000
G1 X103.436 Y141.67 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X103.436 Y138.996 E.0095
G2 X103.286 Y138.723 I-.895 J.314 E.00111
G1 X103.286 Y141.773 E.01084
G3 X103.136 Y141.92 I-.813 J-.682 E.00075
G1 X103.128 Y138.571 E.0119
G2 X102.986 Y138.487 I-.512 J.706 E.00059
G1 X102.986 Y142.012 E.01253
G3 X102.836 Y142.062 I-.397 J-.944 E.00056
G1 X102.836 Y141.559 E.00178
G3 X102.686 Y141.677 I-.308 J-.239 E.00068
G1 X102.686 Y142.083 E.00144
G3 X102.536 Y142.086 I-.097 J-1.289 E.00053
G1 X102.536 Y141.708 E.00134
G1 X102.386 Y141.71 E.00053
G1 X102.386 Y142.086 E.00134
G1 X102.236 Y142.086 E.00053
G1 X102.236 Y141.71 E.00134
G1 X102.086 Y141.71 E.00053
G1 X102.086 Y142.086 E.00134
G1 X101.936 Y142.086 E.00053
G1 X101.936 Y141.71 E.00134
G1 X101.786 Y141.71 E.00053
G1 X101.786 Y142.086 E.00134
G1 X101.636 Y142.086 E.00053
G1 X101.636 Y141.71 E.00134
G1 X101.486 Y141.71 E.00053
G1 X101.486 Y142.086 E.00134
G1 X101.336 Y142.086 E.00053
G1 X101.336 Y141.71 E.00134
G1 X101.186 Y141.71 E.00053
G1 X101.186 Y142.086 E.00134
G1 X101.036 Y142.086 E.00053
G1 X101.036 Y141.709 E.00134
G1 X100.886 Y141.709 E.00053
G1 X100.886 Y142.086 E.00134
G1 X100.736 Y142.086 E.00053
G1 X100.736 Y141.709 E.00134
G1 X100.586 Y141.709 E.00053
G1 X100.586 Y142.086 E.00134
G1 X100.436 Y142.086 E.00053
G1 X100.436 Y141.709 E.00134
G1 X100.286 Y141.709 E.00053
G1 X100.286 Y142.086 E.00134
G1 X100.136 Y142.086 E.00053
G1 X100.136 Y141.709 E.00134
G1 X99.986 Y141.709 E.00053
G1 X99.986 Y142.086 E.00134
G1 X99.836 Y142.086 E.00053
G1 X99.836 Y141.642 E.00158
; WIPE_START
G1 F24000
G1 X99.836 Y142.086 E-.16899
G1 X99.986 Y142.086 E-.057
G1 X99.986 Y141.709 E-.1433
G1 X100.136 Y141.709 E-.057
G1 X100.136 Y142.086 E-.14327
G1 X100.286 Y142.086 E-.057
G1 X100.286 Y141.735 E-.13344
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.878 J.843 P1  F30000
G1 X102.836 Y139.078 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X102.836 Y138.437 E.00228
G2 X102.686 Y138.413 I-.275 J1.261 E.00054
G1 X102.686 Y138.815 E.00143
G1 X102.668 Y138.807 E.00007
G2 X102.536 Y138.782 I-.102 J.179 E.00049
G1 X102.536 Y138.411 E.00132
G1 X102.386 Y138.411 E.00053
G1 X102.386 Y138.78 E.00131
G1 X102.236 Y138.78 E.00053
G1 X102.236 Y138.411 E.00131
G1 X102.086 Y138.411 E.00053
G1 X102.086 Y138.78 E.00131
G1 X101.936 Y138.78 E.00053
G1 X101.936 Y138.412 E.00131
G1 X101.786 Y138.412 E.00053
G1 X101.786 Y138.78 E.00131
G1 X101.636 Y138.78 E.00053
G1 X101.636 Y138.412 E.00131
G1 X101.486 Y138.412 E.00053
G1 X101.486 Y138.78 E.00131
G1 X101.336 Y138.78 E.00053
G1 X101.336 Y138.412 E.00131
G1 X101.186 Y138.412 E.00053
G1 X101.186 Y138.78 E.00131
G1 X101.036 Y138.78 E.00053
G1 X101.036 Y138.412 E.00131
G1 X100.886 Y138.412 E.00053
G1 X100.886 Y138.78 E.00131
G1 X100.736 Y138.78 E.00053
G1 X100.736 Y138.412 E.00131
G1 X100.586 Y138.412 E.00053
G1 X100.586 Y138.78 E.00131
G1 X100.436 Y138.78 E.00053
G1 X100.436 Y138.412 E.00131
G1 X100.286 Y138.412 E.00053
G1 X100.286 Y138.78 E.00131
G1 X100.136 Y138.78 E.00053
G1 X100.136 Y138.412 E.00131
G1 X99.986 Y138.412 E.00053
G1 X99.986 Y138.78 E.00131
G1 X99.836 Y138.78 E.00053
G1 X99.836 Y138.412 E.00131
G1 X99.686 Y138.412 E.00053
G1 X99.686 Y143.14 E.01681
G1 X99.536 Y143.14 E.00053
G1 X99.536 Y138.412 E.01681
G1 X99.386 Y138.412 E.00053
G1 X99.386 Y143.14 E.01681
G1 X99.236 Y143.14 E.00053
G1 X99.236 Y138.345 E.01705
; WIPE_START
G1 F24000
G1 X99.236 Y140.345 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.581 J-1.07 P1  F30000
G1 X96.913 Y141.606 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X97.085 Y141.321 I-.156 J-.288 E.01037
G1 X97.084 Y138.347 E.08858
G1 X97.779 Y138.347 E.02071
G1 X97.78 Y141.235 E.08601
G3 X96.914 Y142.149 I-.937 J-.02 E.04112
G1 X91.442 Y142.151 E.16301
G1 X91.442 Y138.347 E.1133
G1 X92.13 Y138.347 E.02048
G1 X92.13 Y141.013 E.07941
G2 X92.152 Y141.437 I1.017 J.159 E.01273
G2 X92.468 Y141.644 I.291 J-.099 E.01214
G1 X93.922 Y141.645 E.0433
G2 X94.272 Y141.301 I.006 J-.344 E.01625
G1 X94.271 Y138.347 E.08798
G1 X94.964 Y138.347 E.02065
G1 X94.964 Y141.282 E.0874
G2 X95.299 Y141.645 I.326 J.035 E.01666
G1 X96.742 Y141.645 E.04299
G2 X96.858 Y141.629 I.015 J-.327 E.00349
M204 S10000
G1 X97.057 Y141.847 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231127
G1 F15000
G2 X97.196 Y141.759 I-1.081 J-1.859 E.00244
G1 X97.239 Y141.72 E.00086
; LINE_WIDTH: 0.280308
G2 X97.383 Y141.493 I-.385 J-.405 E.00509
G1 X97.386 Y141.485 E.00017
; LINE_WIDTH: 0.344481
G2 X97.432 Y141.225 I-.962 J-.303 E.00629
G1 X97.432 Y138.543 E.06388
; WIPE_START
G1 F24000
G1 X97.432 Y140.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.705 J-.992 P1  F30000
G1 X94.618 Y138.543 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.344647
G1 F15000
G2 X94.618 Y141.295 I104.295 J1.364 E.06558
G1 X94.619 Y141.331 E.00086
G2 X94.62 Y141.485 I.91 J.068 E.00369
; LINE_WIDTH: 0.385535
G1 X94.621 Y141.954 E.01269
G1 X94.906 Y141.679 F30000
; LINE_WIDTH: 0.247661
G1 F15000
G1 X93.901 Y141.954 E.01686
G1 X94.115 Y141.888 F30000
; LINE_WIDTH: 0.161412
G1 F15000
G3 X93.931 Y141.898 I-.341 J-4.613 E.00172
G3 X92.455 Y141.898 I-.737 J-34.609 E.01381
G1 X91.638 Y141.801 E.0077
G1 X91.883 Y141.955 F30000
; LINE_WIDTH: 0.379727
G1 F15000
G1 X91.806 Y141.555 E.01083
; LINE_WIDTH: 0.33901
G1 X91.792 Y141.449 E.00251
G3 X91.786 Y138.543 I103.662 J-1.671 E.06796
; WIPE_START
G1 F24000
G1 X91.79 Y140.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.503 J1.108 P1  F30000
G1 X94.315 Y141.689 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.217036
G1 F15000
G1 X95.011 Y141.867 E.00989
; LINE_WIDTH: 0.170538
G1 X95.157 Y141.89 E.00148
; LINE_WIDTH: 0.15979
G1 X95.284 Y141.897 E.00117
G2 X96.751 Y141.897 I.733 J-29.685 E.01355
G2 X97.009 Y141.865 I.023 J-.859 E.00241
G1 X97.057 Y141.847 E.00048
G1 X97.586 Y141.791 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X97.586 Y138.412 E.01201
G1 X97.436 Y138.412 E.00053
G1 X97.436 Y141.856 E.01224
G3 X97.286 Y141.968 I-.437 J-.427 E.00067
G1 X97.286 Y138.345 E.01288
G1 X97.136 Y138.345 F30000
G1 F3600
G1 X97.136 Y142.042 E.01314
G3 X96.986 Y142.079 I-.21 J-.527 E.00055
G1 X96.986 Y141.636 E.00158
G3 X96.836 Y141.702 I-.253 J-.375 E.00059
G1 X96.836 Y142.085 E.00136
G1 X96.686 Y142.085 E.00053
G1 X96.686 Y141.71 E.00133
G1 X96.536 Y141.71 E.00053
G1 X96.536 Y142.085 E.00133
G1 X96.386 Y142.085 E.00053
G1 X96.386 Y141.71 E.00133
G1 X96.236 Y141.71 E.00053
G1 X96.236 Y142.085 E.00133
G1 X96.086 Y142.085 E.00053
G1 X96.086 Y141.71 E.00133
G1 X95.936 Y141.71 E.00053
G1 X95.936 Y142.085 E.00133
G1 X95.786 Y142.085 E.00053
G1 X95.786 Y141.71 E.00133
G1 X95.636 Y141.71 E.00053
G1 X95.636 Y142.085 E.00133
G1 X95.486 Y142.085 E.00053
G1 X95.486 Y141.71 E.00133
G1 X95.336 Y141.71 E.00053
G1 X95.336 Y142.085 E.00133
G1 X95.186 Y142.085 E.00053
G1 X95.186 Y141.695 E.00139
G3 X95.036 Y141.614 I.318 J-.774 E.00061
G1 X95.036 Y142.085 E.00167
G1 X94.886 Y142.085 E.00053
G1 X94.886 Y138.412 E.01306
G1 X94.736 Y138.412 E.00053
G1 X94.736 Y142.085 E.01306
G1 X94.586 Y142.085 E.00053
G1 X94.586 Y138.412 E.01306
G1 X94.436 Y138.412 E.00053
G1 X94.436 Y142.085 E.01306
G1 X94.286 Y142.085 E.00053
G1 X94.286 Y141.509 E.00205
G3 X94.136 Y141.661 I-.35 J-.195 E.00077
G1 X94.136 Y142.085 E.00151
G1 X93.986 Y142.085 E.00053
G1 X93.986 Y141.704 E.00135
G3 X93.836 Y141.71 I-.105 J-.84 E.00053
G1 X93.836 Y142.085 E.00134
G1 X93.686 Y142.085 E.00053
G1 X93.686 Y141.71 E.00134
G1 X93.536 Y141.71 E.00053
G1 X93.536 Y142.086 E.00134
G1 X93.386 Y142.086 E.00053
G1 X93.386 Y141.71 E.00134
G1 X93.236 Y141.71 E.00053
G1 X93.236 Y142.086 E.00134
G1 X93.086 Y142.086 E.00053
G1 X93.086 Y141.71 E.00134
G1 X92.936 Y141.709 E.00053
G1 X92.936 Y142.086 E.00134
G1 X92.786 Y142.086 E.00053
G1 X92.786 Y141.709 E.00134
G1 X92.636 Y141.709 E.00053
G1 X92.636 Y142.086 E.00134
G1 X92.486 Y142.086 E.00053
G1 X92.486 Y141.709 E.00134
G3 X92.336 Y141.694 I.146 J-2.135 E.00054
G1 X92.336 Y142.086 E.00139
G1 X92.186 Y142.086 E.00053
G1 X92.186 Y141.495 E.0021
; WIPE_START
G1 F24000
G1 X92.186 Y142.086 E-.22439
G1 X92.336 Y142.086 E-.057
G1 X92.336 Y141.694 E-.149
G1 X92.486 Y141.709 E-.05731
G1 X92.486 Y142.086 E-.14307
G1 X92.636 Y142.086 E-.057
G1 X92.636 Y141.896 E-.07225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.2 J-.203 P1  F30000
G1 X92.036 Y138.345 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X92.036 Y142.086 E.0133
G1 X91.886 Y142.086 E.00053
G1 X91.886 Y138.412 E.01306
G1 X91.736 Y138.412 E.00053
G1 X91.736 Y142.086 E.01306
G1 X91.586 Y142.086 E.00053
G1 X91.586 Y138.345 E.0133
; WIPE_START
G1 F24000
G1 X91.586 Y140.345 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.687 J-1.004 P1  F30000
G1 X89.395 Y138.846 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X89.395 Y140.098 E.03729
G1 X86.022 Y140.099 E.10049
G3 X85.659 Y139.824 I-.033 J-.333 E.01491
G3 X85.657 Y139.14 I6.62 J-.364 E.02038
G3 X85.866 Y138.865 I.346 J.046 E.01077
G1 X85.972 Y138.845 E.0032
G1 X89.335 Y138.846 E.10019
M204 S10000
; WIPE_START
G1 F24000
G1 X89.395 Y140.098 E-.47628
G1 X88.649 Y140.098 E-.28372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.11 J.5 P1  F30000
G1 X89.308 Y141.562 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G2 X89.397 Y141.366 I-.243 J-.229 E.00651
G1 X89.395 Y140.589 E.02315
G1 X85.922 Y140.591 E.10344
G3 X85.034 Y139.641 I.065 J-.95 E.04262
G3 X85.171 Y138.798 I1.549 J-.182 E.02577
G3 X85.903 Y138.349 I.783 J.455 E.02666
G1 X90.016 Y138.348 E.12252
G1 X90.017 Y141.065 E.08094
G3 X89.158 Y142.153 I-.954 J.13 E.04612
G1 X85.406 Y142.151 E.11175
G1 X85.582 Y141.662 E.01548
G1 X89.112 Y141.663 E.10515
G2 X89.263 Y141.601 I-.047 J-.33 E.0049
M204 S10000
G1 X89.538 Y141.708 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.210306
G1 F15000
G2 X89.688 Y141.409 I-.496 J-.436 E.00447
; LINE_WIDTH: 0.270895
G1 X89.691 Y141.392 E.00031
G2 X89.698 Y138.65 I-65.626 J-1.526 E.04938
; LINE_WIDTH: 0.25552
G1 X89.662 Y138.632 E.00067
; LINE_WIDTH: 0.220074
G1 X89.627 Y138.615 E.00055
; LINE_WIDTH: 0.151098
G1 X89.591 Y138.597 E.00034
G1 X85.913 Y138.6 E.03144
G2 X85.553 Y138.757 I.049 J.603 E.00341
; LINE_WIDTH: 0.198687
G2 X85.395 Y138.99 I.323 J.388 E.00352
; LINE_WIDTH: 0.259091
G1 X85.359 Y139.117 E.00224
G2 X85.372 Y139.881 I2.423 J.343 E.01312
; LINE_WIDTH: 0.215881
G2 X85.516 Y140.147 I.618 J-.164 E.00417
; LINE_WIDTH: 0.14565
G1 X85.529 Y140.161 E.00016
G2 X86.019 Y140.345 I.454 J-.464 E.00437
G1 X89.591 Y140.344 E.02899
; LINE_WIDTH: 0.142154
G1 X89.628 Y140.344 E.00029
; LINE_WIDTH: 0.189377
G1 X89.664 Y140.344 E.00042
; LINE_WIDTH: 0.236599
G1 X89.701 Y140.345 E.00056
; WIPE_START
G1 F24000
G1 X89.664 Y140.344 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.212 J-.112 P1  F30000
G1 X89.538 Y141.708 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.142001
G1 F15000
G3 X89.155 Y141.906 I-.48 J-.46 E.00343
G1 X85.702 Y141.907 E.02703
; WIPE_START
G1 F24000
G1 X87.702 Y141.906 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.168 J1.205 P1  F30000
G1 X89.936 Y141.594 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X89.936 Y138.413 E.01131
G1 X89.786 Y138.413 E.00053
G1 X89.786 Y141.728 E.01179
G3 X89.636 Y141.894 I-.801 J-.573 E.0008
G1 X89.636 Y138.413 E.01238
G1 X89.486 Y138.413 E.00053
G1 X89.483 Y141.997 E.01274
G3 X89.336 Y142.049 I-.506 J-1.201 E.00056
G1 X89.336 Y141.626 E.0015
G1 X89.308 Y141.646 E.00012
G3 X89.186 Y141.708 I-.157 J-.155 E.0005
G1 X89.186 Y142.083 E.00133
G3 X89.036 Y142.088 I-.091 J-.499 E.00054
G1 X89.036 Y141.728 E.00128
G1 X88.886 Y141.728 E.00053
G1 X88.886 Y142.088 E.00128
G1 X88.736 Y142.088 E.00053
G1 X88.736 Y141.728 E.00128
G1 X88.586 Y141.728 E.00053
G1 X88.586 Y142.088 E.00128
G1 X88.436 Y142.088 E.00053
G1 X88.436 Y141.728 E.00128
G1 X88.286 Y141.728 E.00053
G1 X88.286 Y142.088 E.00128
G1 X88.136 Y142.088 E.00053
G1 X88.136 Y141.728 E.00128
G1 X87.986 Y141.728 E.00053
G1 X87.986 Y142.088 E.00128
G1 X87.836 Y142.087 E.00053
G1 X87.836 Y141.728 E.00128
G1 X87.686 Y141.728 E.00053
G1 X87.686 Y142.087 E.00128
G1 X87.536 Y142.087 E.00053
G1 X87.536 Y141.728 E.00128
G1 X87.386 Y141.728 E.00053
G1 X87.386 Y142.087 E.00128
G1 X87.236 Y142.087 E.00053
G1 X87.236 Y141.728 E.00128
G1 X87.086 Y141.728 E.00053
G1 X87.086 Y142.087 E.00128
G1 X86.936 Y142.087 E.00053
G1 X86.936 Y141.728 E.00128
G1 X86.786 Y141.728 E.00053
G1 X86.786 Y142.087 E.00128
G1 X86.636 Y142.087 E.00053
G1 X86.636 Y141.728 E.00128
G1 X86.486 Y141.727 E.00053
G1 X86.486 Y142.087 E.00128
G1 X86.336 Y142.087 E.00053
G1 X86.336 Y141.727 E.00128
G1 X86.186 Y141.727 E.00053
G1 X86.186 Y142.087 E.00128
G1 X86.036 Y142.087 E.00053
G1 X86.036 Y141.727 E.00128
G1 X85.886 Y141.727 E.00053
G1 X85.886 Y142.087 E.00128
G1 X85.736 Y142.087 E.00053
G1 X85.736 Y141.727 E.00128
G1 X85.628 Y141.727 E.00038
G1 X85.586 Y141.844 E.00044
G1 X85.586 Y142.154 E.0011
; WIPE_START
G1 F24000
G1 X85.586 Y141.844 E-.11788
G1 X85.628 Y141.727 E-.04699
G1 X85.736 Y141.727 E-.0411
G1 X85.736 Y142.087 E-.13647
G1 X85.886 Y142.087 E-.057
G1 X85.886 Y141.727 E-.13649
G1 X86.036 Y141.727 E-.057
G1 X86.036 Y142.087 E-.1365
G1 X86.116 Y142.087 E-.03057
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.512 J1.104 P1  F30000
G1 X89.336 Y140.592 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X89.336 Y140.163 E.00152
G1 X89.186 Y140.163 E.00053
G1 X89.186 Y140.524 E.00128
G1 X89.036 Y140.524 E.00053
G1 X89.036 Y140.163 E.00128
G1 X88.886 Y140.163 E.00053
G1 X88.886 Y140.525 E.00128
G1 X88.736 Y140.525 E.00053
G1 X88.736 Y140.163 E.00129
G1 X88.586 Y140.163 E.00053
G1 X88.586 Y140.525 E.00129
G1 X88.436 Y140.525 E.00053
G1 X88.436 Y140.163 E.00129
G1 X88.286 Y140.163 E.00053
G1 X88.286 Y140.525 E.00129
G1 X88.136 Y140.525 E.00053
G1 X88.136 Y140.163 E.00129
G1 X87.986 Y140.163 E.00053
G1 X87.986 Y140.525 E.00129
G1 X87.836 Y140.525 E.00053
G1 X87.836 Y140.163 E.00129
G1 X87.686 Y140.163 E.00053
G1 X87.686 Y140.525 E.00129
G1 X87.536 Y140.525 E.00053
G1 X87.536 Y140.163 E.00129
G1 X87.386 Y140.163 E.00053
G1 X87.386 Y140.525 E.00129
G1 X87.236 Y140.525 E.00053
G1 X87.236 Y140.163 E.00129
G1 X87.086 Y140.163 E.00053
G1 X87.086 Y140.525 E.00129
G1 X86.936 Y140.525 E.00053
G1 X86.936 Y140.163 E.00129
G1 X86.786 Y140.163 E.00053
G1 X86.786 Y140.525 E.00129
G1 X86.636 Y140.526 E.00053
G1 X86.636 Y140.164 E.00129
G1 X86.486 Y140.164 E.00053
G1 X86.486 Y140.526 E.00129
G1 X86.336 Y140.526 E.00053
G1 X86.336 Y140.164 E.00129
G1 X86.186 Y140.164 E.00053
G1 X86.186 Y140.526 E.00129
G1 X86.036 Y140.526 E.00053
G1 X86.036 Y140.164 E.00129
G1 X86.021 Y140.164 E.00005
G3 X85.886 Y140.15 I-.03 J-.374 E.00049
G1 X85.886 Y140.52 E.00132
G3 X85.736 Y140.496 I.08 J-.97 E.00054
M73 P95 R1
G1 X85.736 Y139.985 E.00182
; WIPE_START
G1 F24000
G1 X85.736 Y140.496 E-.1942
G1 X85.886 Y140.52 E-.05774
G1 X85.886 Y140.15 E-.14081
G1 X86.021 Y140.164 E-.05163
G1 X86.036 Y140.164 E-.00564
G1 X86.036 Y140.526 E-.13763
G1 X86.186 Y140.526 E-.057
G1 X86.186 Y140.222 E-.11536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.486 J1.116 P1  F30000
G1 X89.336 Y138.849 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X89.336 Y138.413 E.00155
G1 X89.186 Y138.413 E.00053
G1 X89.186 Y138.781 E.00131
G1 X89.036 Y138.781 E.00053
G1 X89.036 Y138.413 E.00131
G1 X88.886 Y138.413 E.00053
G1 X88.886 Y138.781 E.00131
G1 X88.736 Y138.781 E.00053
G1 X88.736 Y138.413 E.00131
G1 X88.586 Y138.413 E.00053
G1 X88.586 Y138.781 E.00131
G1 X88.436 Y138.781 E.00053
G1 X88.436 Y138.413 E.00131
G1 X88.286 Y138.413 E.00053
G1 X88.286 Y138.781 E.00131
G1 X88.136 Y138.781 E.00053
G1 X88.136 Y138.413 E.00131
G1 X87.986 Y138.413 E.00053
G1 X87.986 Y138.781 E.00131
G1 X87.836 Y138.781 E.00053
G1 X87.836 Y138.413 E.00131
G1 X87.686 Y138.413 E.00053
G1 X87.686 Y138.78 E.0013
G1 X87.536 Y138.78 E.00053
G1 X87.536 Y138.414 E.0013
G1 X87.386 Y138.414 E.00053
G1 X87.386 Y138.78 E.0013
G1 X87.236 Y138.78 E.00053
G1 X87.236 Y138.414 E.0013
G1 X87.086 Y138.414 E.00053
G1 X87.086 Y138.78 E.0013
G1 X86.936 Y138.78 E.00053
G1 X86.936 Y138.414 E.0013
G1 X86.786 Y138.414 E.00053
G1 X86.786 Y138.78 E.0013
G1 X86.636 Y138.78 E.00053
G1 X86.636 Y138.414 E.0013
G1 X86.486 Y138.414 E.00053
G1 X86.486 Y138.78 E.0013
G1 X86.336 Y138.78 E.00053
G1 X86.336 Y138.414 E.0013
G1 X86.186 Y138.414 E.00053
G1 X86.186 Y138.78 E.0013
G1 X86.036 Y138.78 E.00053
G1 X86.036 Y138.414 E.0013
G2 X85.886 Y138.416 I-.065 J.994 E.00053
G1 X85.886 Y138.795 E.00135
G2 X85.736 Y138.861 I.028 J.264 E.00059
G1 X85.736 Y138.44 E.0015
G2 X85.586 Y138.494 I.229 J.873 E.00057
G1 X85.586 Y140.441 E.00692
G3 X85.436 Y140.345 I.466 J-.895 E.00063
G1 X85.436 Y138.59 E.00624
G1 X85.422 Y138.601 E.00006
G2 X85.286 Y138.747 I.537 J.64 E.00071
G1 X85.286 Y140.191 E.00513
G3 X85.136 Y139.883 I.653 J-.509 E.00123
G1 X85.136 Y138.858 E.00364
; WIPE_START
G1 F24000
G1 X85.136 Y139.883 E-.38931
G1 X85.202 Y140.06 E-.07172
G1 X85.286 Y140.191 E-.05905
G1 X85.286 Y139.559 E-.23992
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.809 J.909 P1  F30000
G1 X93.536 Y132.219 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X93.587 Y132.368 I-.298 J.184 E.00472
G1 X93.587 Y134.524 E.06424
G3 X93.235 Y134.853 I-.346 J-.017 E.01587
G1 X90.557 Y134.852 E.07977
G1 X90.557 Y132.054 E.08336
G1 X93.213 Y132.053 E.0791
G3 X93.501 Y132.171 I.025 J.35 E.00959
M204 S10000
; WIPE_START
G1 F24000
G1 X93.587 Y132.368 E-.08148
G1 X93.587 Y134.153 E-.67852
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.45 J-1.131 P1  F30000
G1 X90.557 Y135.36 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X90.557 Y136.413 E.03139
G1 X89.837 Y136.413 E.02146
G1 X89.837 Y131.556 E.1447
G1 X93.42 Y131.556 E.10674
G3 X94.285 Y132.57 I-.077 J.941 E.04406
G1 X94.282 Y134.467 E.05651
G3 X93.349 Y135.36 I-.928 J-.036 E.04254
G1 X90.617 Y135.36 E.08136
M204 S10000
G1 X90.329 Y135.106 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159123
G1 F15000
G1 X93.371 Y135.101 E.02792
G2 X93.501 Y135.076 I-.052 J-.614 E.00122
; LINE_WIDTH: 0.205079
G2 X93.683 Y134.979 I-.153 J-.509 E.00266
; LINE_WIDTH: 0.257223
G1 X93.76 Y134.911 E.00174
G2 X93.856 Y134.779 I-1.028 J-.847 E.00276
; LINE_WIDTH: 0.303414
G1 X93.876 Y134.737 E.00096
G2 X93.928 Y134.541 I-.995 J-.365 E.00418
; LINE_WIDTH: 0.343881
G1 X93.935 Y134.448 E.00222
G2 X93.933 Y132.453 I-48.095 J-.956 E.04742
G1 X93.919 Y132.316 E.00327
G2 X93.89 Y132.216 I-.892 J.2 E.00249
; LINE_WIDTH: 0.280987
G1 X93.876 Y132.18 E.00073
G2 X93.766 Y132.008 I-.484 J.19 E.00386
; LINE_WIDTH: 0.239721
G1 X93.617 Y131.887 E.00297
; LINE_WIDTH: 0.196687
G1 X93.548 Y131.85 E.00096
G1 X93.402 Y131.813 E.00183
; LINE_WIDTH: 0.148636
G1 X93.381 Y131.809 E.00018
G2 X93.217 Y131.805 I-.114 J1.101 E.00137
G1 X90.361 Y131.805 E.02385
; LINE_WIDTH: 0.148906
G1 X90.252 Y131.859 E.00102
; LINE_WIDTH: 0.184245
G1 X90.142 Y131.914 E.00137
; LINE_WIDTH: 0.219584
G1 X90.033 Y131.969 E.00171
G1 X90.197 Y131.752 F30000
; LINE_WIDTH: 0.371347
G1 F15000
G1 X90.197 Y135.048 E.08553
G3 X90.197 Y135.163 I-.326 J.058 E.003
G1 X90.197 Y136.217 E.02734
; WIPE_START
G1 F24000
G1 X90.197 Y135.163 E-.40052
G1 X90.197 Y135.048 E-.04372
G1 X90.197 Y134.217 E-.31577
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.007 P1  F30000
G1 X90.202 Y135.106 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.381296
G1 F15000
G1 X90.234 Y135.106 E.00085
; LINE_WIDTH: 0.33663
G1 X90.266 Y135.106 E.00074
; LINE_WIDTH: 0.291964
G1 X90.298 Y135.106 E.00063
; LINE_WIDTH: 0.247298
G1 X90.329 Y135.106 E.00051
; WIPE_START
G1 F24000
G1 X90.298 Y135.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.768 J.944 P1  F30000
G1 X94.136 Y131.983 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X94.136 Y134.791 E.00998
G3 X93.986 Y135.021 I-.961 J-.464 E.00098
G1 X93.986 Y131.895 E.01111
G2 X93.836 Y131.763 I-.89 J.86 E.00071
G1 X93.836 Y135.151 E.01205
G3 X93.686 Y135.234 I-.524 J-.774 E.00061
G1 X93.686 Y131.681 E.01263
G2 X93.536 Y131.638 I-.234 J.534 E.00056
G1 X93.536 Y132.099 E.00164
G2 X93.386 Y132.011 I-.201 J.168 E.00063
G1 X93.386 Y131.621 E.00138
G1 X93.236 Y131.621 E.00053
G1 X93.236 Y131.989 E.00131
G2 X93.086 Y131.988 I-.085 J1.745 E.00053
G1 X93.086 Y131.621 E.00131
G1 X92.936 Y131.621 E.00053
G1 X92.936 Y131.988 E.00131
G1 X92.786 Y131.988 E.00053
G1 X92.786 Y131.621 E.00131
G1 X92.636 Y131.621 E.00053
G1 X92.636 Y131.988 E.00131
G1 X92.486 Y131.989 E.00053
G1 X92.486 Y131.621 E.00131
G1 X92.336 Y131.621 E.00053
G1 X92.336 Y131.989 E.00131
G1 X92.186 Y131.989 E.00053
G1 X92.186 Y131.621 E.00131
G1 X92.036 Y131.621 E.00053
G1 X92.036 Y131.989 E.00131
G1 X91.886 Y131.989 E.00053
G1 X91.886 Y131.621 E.00131
G1 X91.736 Y131.621 E.00053
G1 X91.736 Y131.989 E.00131
G1 X91.586 Y131.989 E.00053
G1 X91.586 Y131.621 E.00131
G1 X91.436 Y131.621 E.00053
G1 X91.436 Y131.989 E.00131
G1 X91.286 Y131.989 E.00053
G1 X91.286 Y131.621 E.00131
G1 X91.136 Y131.621 E.00053
G1 X91.136 Y131.989 E.00131
G1 X90.986 Y131.989 E.00053
G1 X90.986 Y131.621 E.00131
G1 X90.836 Y131.621 E.00053
G1 X90.836 Y131.989 E.00131
G1 X90.686 Y131.989 E.00053
G1 X90.686 Y131.553 E.00155
; WIPE_START
G1 F24000
G1 X90.686 Y131.989 E-.16549
G1 X90.836 Y131.989 E-.057
G1 X90.836 Y131.621 E-.13983
G1 X90.986 Y131.621 E-.057
G1 X90.986 Y131.989 E-.13981
G1 X91.136 Y131.989 E-.057
G1 X91.136 Y131.621 E-.1398
G1 X91.146 Y131.621 E-.00408
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.961 J.747 P1  F30000
G1 X93.536 Y134.692 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X93.536 Y135.278 E.00208
G3 X93.386 Y135.295 I-.157 J-.744 E.00054
G1 X93.386 Y134.898 E.00141
G3 X93.236 Y134.918 I-.166 J-.658 E.00054
G1 X93.236 Y135.295 E.00134
G1 X93.086 Y135.295 E.00053
G1 X93.086 Y134.918 E.00134
G1 X92.936 Y134.918 E.00053
G1 X92.936 Y135.295 E.00134
G1 X92.786 Y135.295 E.00053
G1 X92.786 Y134.918 E.00134
G1 X92.636 Y134.918 E.00053
G1 X92.636 Y135.295 E.00134
G1 X92.486 Y135.295 E.00053
G1 X92.486 Y134.918 E.00134
G1 X92.336 Y134.918 E.00053
G1 X92.336 Y135.295 E.00134
G1 X92.186 Y135.295 E.00053
G1 X92.186 Y134.918 E.00134
G1 X92.036 Y134.918 E.00053
G1 X92.036 Y135.295 E.00134
G1 X91.886 Y135.295 E.00053
G1 X91.886 Y134.918 E.00134
G1 X91.736 Y134.918 E.00053
G1 X91.736 Y135.295 E.00134
G1 X91.586 Y135.295 E.00053
G1 X91.586 Y134.918 E.00134
G1 X91.436 Y134.918 E.00053
G1 X91.436 Y135.295 E.00134
G1 X91.286 Y135.295 E.00053
G1 X91.286 Y134.918 E.00134
G1 X91.136 Y134.918 E.00053
G1 X91.136 Y135.295 E.00134
G1 X90.986 Y135.295 E.00053
G1 X90.986 Y134.918 E.00134
G1 X90.836 Y134.918 E.00053
G1 X90.836 Y135.295 E.00134
G1 X90.686 Y135.295 E.00053
G1 X90.686 Y134.85 E.00158
; WIPE_START
G1 F24000
G1 X90.686 Y135.295 E-.16895
G1 X90.836 Y135.295 E-.057
G1 X90.836 Y134.918 E-.14329
G1 X90.986 Y134.918 E-.057
G1 X90.986 Y135.295 E-.14328
G1 X91.136 Y135.295 E-.057
G1 X91.136 Y134.943 E-.13348
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.127 J-.459 P1  F30000
G1 X90.536 Y136.416 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X90.536 Y131.621 E.01705
G1 X90.386 Y131.621 E.00053
G1 X90.386 Y136.349 E.01681
G1 X90.236 Y136.349 E.00053
G1 X90.236 Y131.621 E.01681
G1 X90.086 Y131.621 E.00053
G1 X90.086 Y136.349 E.01681
G1 X89.936 Y136.349 E.00053
G1 X89.936 Y131.553 E.01705
; WIPE_START
G1 F24000
G1 X89.936 Y133.553 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.076 J-1.215 P1  F30000
G1 X84.127 Y133.189 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X84.054 Y133.032 I.257 J-.215 E.00523
G3 X84.052 Y132.348 I6.621 J-.364 E.02038
G3 X84.261 Y132.073 I.346 J.046 E.01078
G1 X84.367 Y132.053 E.0032
G1 X87.79 Y132.054 E.10198
G1 X87.79 Y133.306 E.03729
G1 X84.417 Y133.307 E.10049
G3 X84.17 Y133.231 I-.033 J-.333 E.00789
M204 S10000
; WIPE_START
G1 F24000
G1 X84.075 Y133.111 E-.05813
G1 X84.054 Y133.032 E-.03127
G1 X84.052 Y132.348 E-.25984
G1 X84.077 Y132.238 E-.04271
G1 X84.163 Y132.126 E-.05366
G1 X84.261 Y132.073 E-.04247
G1 X84.367 Y132.053 E-.04083
G1 X84.975 Y132.053 E-.2311
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.641 J1.034 P1  F30000
G1 X87.79 Y133.797 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X84.317 Y133.799 E.10343
G3 X83.429 Y132.85 I.065 J-.95 E.04262
G3 X83.566 Y132.007 I1.549 J-.182 E.02577
G3 X84.298 Y131.557 I.783 J.455 E.02666
G1 X88.411 Y131.556 E.12252
G1 X88.413 Y134.378 E.08406
G3 X87.417 Y135.359 I-.939 J.043 E.04695
G1 X83.801 Y135.359 E.10772
G1 X83.977 Y134.871 E.01547
G1 X87.507 Y134.871 E.10516
G2 X87.792 Y134.575 I-.047 J-.33 E.01321
G1 X87.79 Y133.857 E.02136
M204 S10000
G1 X87.986 Y133.552 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.145652
G1 F15000
G1 X84.414 Y133.553 E.02899
G3 X83.924 Y133.369 I-.036 J-.648 E.00437
G1 X83.911 Y133.355 E.00016
; LINE_WIDTH: 0.21589
G3 X83.767 Y133.089 I.474 J-.43 E.00417
; LINE_WIDTH: 0.259089
G3 X83.754 Y132.325 I2.41 J-.422 E.01312
G1 X83.79 Y132.199 E.00224
; LINE_WIDTH: 0.198684
G3 X83.948 Y131.965 I.481 J.155 E.00352
; LINE_WIDTH: 0.151097
G3 X84.308 Y131.809 I.408 J.447 E.00341
G1 X87.986 Y131.805 E.03144
G1 X88.022 Y131.823 E.00034
; LINE_WIDTH: 0.220074
G1 X88.057 Y131.841 E.00055
; LINE_WIDTH: 0.25552
G1 X88.093 Y131.858 E.00067
; LINE_WIDTH: 0.273245
G1 X88.101 Y133.502 E.02991
G2 X88.101 Y133.601 I.226 J.051 E.00181
; LINE_WIDTH: 0.267027
G1 X88.102 Y134.373 E.01367
G3 X88.08 Y134.626 I-1.305 J.013 E.00449
; LINE_WIDTH: 0.20748
G3 X87.922 Y134.929 I-.618 J-.129 E.0045
; LINE_WIDTH: 0.141704
G3 X87.536 Y135.116 I-.466 J-.471 E.00341
G1 X84.097 Y135.115 E.02684
; WIPE_START
G1 F24000
G1 X86.097 Y135.116 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.776 J.937 P1  F30000
G1 X87.986 Y133.552 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.142136
G1 F15000
G1 X88.023 Y133.552 E.00029
; LINE_WIDTH: 0.189495
G1 X88.059 Y133.553 E.00042
; LINE_WIDTH: 0.236855
G1 X88.096 Y133.553 E.00056
; WIPE_START
G1 F24000
G1 X88.059 Y133.553 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.2 J.202 P1  F30000
G1 X88.286 Y134.898 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X88.286 Y131.621 E.01165
G1 X88.136 Y131.621 E.00053
G1 X88.131 Y135.003 E.01202
G3 X87.986 Y135.136 I-.608 J-.516 E.0007
G1 X87.986 Y131.621 E.0125
G1 X87.836 Y131.621 E.00053
G1 X87.836 Y135.224 E.01281
G3 X87.686 Y135.268 I-.531 J-1.544 E.00056
G1 X87.686 Y134.866 E.00143
G3 X87.536 Y134.93 I-.223 J-.314 E.00058
G1 X87.536 Y135.297 E.0013
G1 X87.386 Y135.294 E.00053
G1 X87.386 Y134.936 E.00127
G1 X87.236 Y134.936 E.00053
G1 X87.236 Y135.294 E.00127
G1 X87.086 Y135.294 E.00053
G1 X87.086 Y134.936 E.00127
G1 X86.936 Y134.936 E.00053
G1 X86.936 Y135.294 E.00127
G1 X86.786 Y135.294 E.00053
G1 X86.786 Y134.936 E.00127
G1 X86.636 Y134.936 E.00053
G1 X86.636 Y135.294 E.00127
G1 X86.486 Y135.294 E.00053
G1 X86.486 Y134.936 E.00127
G1 X86.336 Y134.936 E.00053
G1 X86.336 Y135.294 E.00127
G1 X86.186 Y135.294 E.00053
G1 X86.186 Y134.936 E.00127
G1 X86.036 Y134.936 E.00053
G1 X86.036 Y135.294 E.00127
G1 X85.886 Y135.294 E.00053
G1 X85.886 Y134.936 E.00127
G1 X85.736 Y134.936 E.00053
G1 X85.736 Y135.294 E.00127
G1 X85.586 Y135.294 E.00053
G1 X85.586 Y134.936 E.00127
G1 X85.436 Y134.936 E.00053
G1 X85.436 Y135.294 E.00127
G1 X85.286 Y135.294 E.00053
G1 X85.286 Y134.936 E.00127
G1 X85.136 Y134.936 E.00053
G1 X85.136 Y135.294 E.00128
G1 X84.986 Y135.294 E.00053
G1 X84.986 Y134.936 E.00128
G1 X84.836 Y134.936 E.00053
G1 X84.836 Y135.294 E.00128
G1 X84.686 Y135.294 E.00053
G1 X84.686 Y134.936 E.00128
G1 X84.536 Y134.936 E.00053
G1 X84.536 Y135.294 E.00128
G1 X84.386 Y135.294 E.00053
G1 X84.386 Y134.936 E.00128
G1 X84.236 Y134.936 E.00053
G1 X84.236 Y135.294 E.00128
G1 X84.086 Y135.294 E.00053
G1 X84.086 Y134.936 E.00128
G1 X84.022 Y134.936 E.00023
G1 X83.936 Y135.177 E.00091
G1 X83.936 Y135.362 E.00066
; WIPE_START
G1 F24000
G1 X83.936 Y135.177 E-.07043
G1 X84.022 Y134.936 E-.09733
G1 X84.086 Y134.936 E-.02406
G1 X84.086 Y135.294 E-.13636
G1 X84.236 Y135.294 E-.057
G1 X84.236 Y134.936 E-.13636
G1 X84.386 Y134.936 E-.057
G1 X84.386 Y135.294 E-.13635
G1 X84.504 Y135.294 E-.04511
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.517 J1.101 P1  F30000
G1 X87.686 Y133.8 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X87.686 Y133.371 E.00152
G1 X87.536 Y133.371 E.00053
G1 X87.536 Y133.733 E.00128
G1 X87.386 Y133.733 E.00053
G1 X87.386 Y133.371 E.00128
G1 X87.236 Y133.371 E.00053
G1 X87.236 Y133.733 E.00128
G1 X87.086 Y133.733 E.00053
G1 X87.086 Y133.371 E.00129
G1 X86.936 Y133.371 E.00053
G1 X86.936 Y133.733 E.00129
G1 X86.786 Y133.733 E.00053
G1 X86.786 Y133.371 E.00129
G1 X86.636 Y133.371 E.00053
G1 X86.636 Y133.733 E.00129
G1 X86.486 Y133.733 E.00053
G1 X86.486 Y133.371 E.00129
G1 X86.336 Y133.371 E.00053
G1 X86.336 Y133.733 E.00129
G1 X86.186 Y133.733 E.00053
G1 X86.186 Y133.371 E.00129
G1 X86.036 Y133.371 E.00053
G1 X86.036 Y133.733 E.00129
G1 X85.886 Y133.733 E.00053
G1 X85.886 Y133.372 E.00129
G1 X85.736 Y133.372 E.00053
G1 X85.736 Y133.733 E.00129
G1 X85.586 Y133.733 E.00053
G1 X85.586 Y133.372 E.00129
G1 X85.436 Y133.372 E.00053
G1 X85.436 Y133.734 E.00129
G1 X85.286 Y133.734 E.00053
G1 X85.286 Y133.372 E.00129
G1 X85.136 Y133.372 E.00053
G1 X85.136 Y133.734 E.00129
G1 X84.986 Y133.734 E.00053
G1 X84.986 Y133.372 E.00129
G1 X84.836 Y133.372 E.00053
G1 X84.836 Y133.734 E.00129
G1 X84.686 Y133.734 E.00053
G1 X84.686 Y133.372 E.00129
G1 X84.536 Y133.372 E.00053
G1 X84.536 Y133.734 E.00129
G1 X84.386 Y133.734 E.00053
G1 X84.386 Y133.371 E.00129
G3 X84.236 Y133.344 I.007 J-.471 E.00054
G1 X84.236 Y133.722 E.00134
G3 X84.086 Y133.693 I.13 J-1.07 E.00054
G1 X84.086 Y133.123 E.00202
; WIPE_START
G1 F24000
G1 X84.086 Y133.693 E-.21647
G1 X84.236 Y133.722 E-.05806
G1 X84.236 Y133.344 E-.14363
G1 X84.386 Y133.371 E-.0579
G1 X84.386 Y133.734 E-.13794
G1 X84.536 Y133.734 E-.057
G1 X84.536 Y133.5 E-.089
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.507 J1.106 P1  F30000
G1 X87.686 Y132.057 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X87.686 Y131.621 E.00155
G1 X87.536 Y131.621 E.00053
G1 X87.536 Y131.989 E.00131
G1 X87.386 Y131.989 E.00053
G1 X87.386 Y131.621 E.00131
G1 X87.236 Y131.621 E.00053
G1 X87.236 Y131.989 E.00131
G1 X87.086 Y131.989 E.00053
G1 X87.086 Y131.621 E.00131
G1 X86.936 Y131.621 E.00053
G1 X86.936 Y131.989 E.00131
G1 X86.786 Y131.989 E.00053
G1 X86.786 Y131.621 E.00131
G1 X86.636 Y131.621 E.00053
G1 X86.636 Y131.989 E.00131
G1 X86.486 Y131.989 E.00053
G1 X86.486 Y131.621 E.00131
G1 X86.336 Y131.622 E.00053
G1 X86.336 Y131.989 E.00131
G1 X86.186 Y131.989 E.00053
G1 X86.186 Y131.622 E.0013
G1 X86.036 Y131.622 E.00053
G1 X86.036 Y131.989 E.0013
G1 X85.886 Y131.989 E.00053
G1 X85.886 Y131.622 E.0013
G1 X85.736 Y131.622 E.00053
G1 X85.736 Y131.989 E.0013
G1 X85.586 Y131.988 E.00053
G1 X85.586 Y131.622 E.0013
G1 X85.436 Y131.622 E.00053
G1 X85.436 Y131.988 E.0013
G1 X85.286 Y131.988 E.00053
G1 X85.286 Y131.622 E.0013
G1 X85.136 Y131.622 E.00053
G1 X85.136 Y131.988 E.0013
G1 X84.986 Y131.988 E.00053
G1 X84.986 Y131.622 E.0013
G1 X84.836 Y131.622 E.00053
G1 X84.836 Y131.988 E.0013
G1 X84.686 Y131.988 E.00053
G1 X84.686 Y131.622 E.0013
G1 X84.536 Y131.622 E.00053
G1 X84.536 Y131.988 E.0013
G1 X84.386 Y131.988 E.00053
G1 X84.386 Y131.622 E.0013
G2 X84.236 Y131.627 I-.042 J.997 E.00053
G1 X84.236 Y132.013 E.00137
G2 X84.086 Y132.12 I.045 J.221 E.00068
G1 X84.086 Y131.661 E.00163
G2 X83.936 Y131.727 I.229 J.73 E.00058
G1 X83.936 Y133.626 E.00675
G3 X83.786 Y133.516 I.421 J-.731 E.00066
G1 X83.786 Y131.837 E.00597
G2 X83.636 Y132.018 I1.265 J1.203 E.00084
G1 X83.636 Y133.451 E.00509
; WIPE_START
G1 F24000
G1 X83.636 Y132.018 E-.54465
G1 X83.786 Y131.837 E-.08922
G1 X83.786 Y132.169 E-.12613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.009 J-1.217 P1  F30000
G1 X79.436 Y132.136 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X79.436 Y136.41 E.12731
G1 X78.715 Y136.41 E.02146
G1 X78.715 Y131.556 E.14459
G1 X82.382 Y131.556 E.10923
G1 X82.175 Y132.136 E.01834
G1 X79.496 Y132.136 E.07982
M204 S10000
G1 X79.24 Y131.846 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230826
G1 F15000
G1 X79.185 Y131.869 E.00088
; LINE_WIDTH: 0.278158
G1 X79.131 Y131.893 E.0011
; LINE_WIDTH: 0.3706
G1 X79.076 Y131.917 E.00154
G1 X79.075 Y131.94 E.00059
G1 X79.075 Y136.214 E.11063
; WIPE_START
G1 F24000
G1 X79.075 Y134.214 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.214 J.084 P1  F30000
G1 X79.24 Y131.846 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.230826
G1 F15000
G1 X82.071 Y131.846 E.04202
G1 X82.286 Y131.834 F30000
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X82.286 Y131.621 E.00076
G1 X82.136 Y131.621 E.00053
G1 X82.136 Y132.053 E.00154
G1 X82.129 Y132.071 E.00007
G1 X81.986 Y132.071 E.00051
G1 X81.986 Y131.621 E.0016
G1 X81.836 Y131.621 E.00053
G1 X81.836 Y132.071 E.0016
G1 X81.686 Y132.071 E.00053
G1 X81.686 Y131.621 E.0016
G1 X81.536 Y131.621 E.00053
G1 X81.536 Y132.071 E.0016
G1 X81.386 Y132.071 E.00053
G1 X81.386 Y131.621 E.0016
G1 X81.236 Y131.621 E.00053
G1 X81.236 Y132.071 E.0016
G1 X81.086 Y132.071 E.00053
G1 X81.086 Y131.621 E.0016
G1 X80.936 Y131.621 E.00053
G1 X80.936 Y132.071 E.0016
G1 X80.786 Y132.071 E.00053
G1 X80.786 Y131.621 E.0016
G1 X80.636 Y131.621 E.00053
G1 X80.636 Y132.071 E.0016
G1 X80.486 Y132.071 E.00053
G1 X80.486 Y131.621 E.0016
G1 X80.336 Y131.621 E.00053
G1 X80.336 Y132.071 E.0016
G1 X80.186 Y132.071 E.00053
G1 X80.186 Y131.621 E.0016
G1 X80.036 Y131.621 E.00053
G1 X80.036 Y132.071 E.0016
G1 X79.886 Y132.071 E.00053
G1 X79.886 Y131.621 E.0016
G1 X79.736 Y131.621 E.00053
G1 X79.736 Y132.071 E.0016
G1 X79.586 Y132.071 E.00053
G1 X79.586 Y131.621 E.0016
G1 X79.436 Y131.621 E.00053
G1 X79.436 Y136.412 E.01703
G1 X79.286 Y136.412 F30000
G1 F3600
G1 X79.286 Y131.621 E.01703
G1 X79.136 Y131.621 E.00053
G1 X79.136 Y136.345 E.01679
G1 X78.986 Y136.345 E.00053
G1 X78.986 Y131.621 E.01679
G1 X78.836 Y131.621 E.00053
G1 X78.836 Y136.412 E.01703
; WIPE_START
G1 F24000
G1 X78.836 Y134.412 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.209 J.143 P1  F30000
G1 X79.36 Y138.845 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X82.14 Y138.843 E.08281
G3 X82.145 Y140.67 I-.03 J.913 E.08358
G1 X79.36 Y140.668 E.08295
G1 X79.36 Y138.905 E.05252
M204 S10000
; WIPE_START
G1 F24000
G1 X81.359 Y138.86 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.922 J-.794 P1  F30000
G1 X79.36 Y141.183 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X79.36 Y142.384 E.03576
G1 X78.639 Y142.093 E.02313
G1 X78.639 Y138.347 E.11157
G1 X82.543 Y138.348 E.11627
G3 X83.772 Y139.571 I-.066 J1.296 E.05658
G3 X83.437 Y140.618 I-1.357 J.142 E.03369
G1 X83.185 Y140.869 E.0106
G3 X83.302 Y142.694 I-1.26 J.997 E.05793
G3 X81.811 Y143.425 I-1.433 J-1.038 E.0515
G1 X79.78 Y143.425 E.0605
G1 X79.78 Y142.905 E.01548
G1 X82.019 Y142.904 E.06671
G2 X81.881 Y141.183 I-.08 J-.86 E.08017
G1 X79.42 Y141.183 E.07331
M204 S10000
; WIPE_START
G1 F24000
G1 X79.36 Y142.384 E-.45672
G1 X78.639 Y142.093 E-.29513
G1 X78.639 Y142.072 E-.00815
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J0 P1  F30000
G1 X78.639 Y143.486 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X79.36 Y143.776 E.02314
G1 X79.36 Y144.463 E.02044
G1 X78.639 Y144.172 E.02314
G1 X78.639 Y143.546 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X79.36 Y143.776 E-.28739
G1 X79.36 Y144.463 E-.26079
G1 X78.843 Y144.254 E-.21182
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.843 J.877 P1  F30000
G1 X79.976 Y143.165 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.169391
G1 F15000
G1 X81.805 Y143.164 E.01828
G2 X82.255 Y143.12 I.072 J-1.569 E.00453
G1 X82.455 Y143.047 E.00212
G1 X82.594 Y142.973 E.00157
; LINE_WIDTH: 0.216232
G2 X82.785 Y142.827 I-.768 J-1.205 E.0033
G1 X82.825 Y142.788 E.00076
; LINE_WIDTH: 0.264389
G1 X82.975 Y142.604 E.00414
; LINE_WIDTH: 0.313861
G1 X83.088 Y142.386 E.00527
; LINE_WIDTH: 0.353805
G2 X83.149 Y142.161 I-.96 J-.381 E.00573
G1 X83.155 Y142.122 E.00097
; LINE_WIDTH: 0.394969
G2 X83.135 Y141.703 I-1.928 J-.12 E.01168
; LINE_WIDTH: 0.444315
G2 X83.063 Y141.461 I-.929 J.145 E.00804
G1 X82.995 Y141.331 E.00466
; LINE_WIDTH: 0.484427
G1 F14269.329
G2 X82.877 Y141.162 I-1.526 J.935 E.00718
G1 X82.809 Y141.076 E.00383
; LINE_WIDTH: 0.540628
G1 F12658.039
G1 X82.726 Y140.984 E.00487
G1 X82.701 Y140.981 E.001
; LINE_WIDTH: 0.500621
G1 F13764.459
G1 X82.676 Y140.978 E.00091
; LINE_WIDTH: 0.471878
G1 F14686.751
G1 X82.646 Y140.975 E.00102
G1 X82.726 Y140.984 F30000
; LINE_WIDTH: 0.551356
G1 F12390.96
G1 X82.731 Y140.968 E.00069
; LINE_WIDTH: 0.525536
G1 F13053.856
G1 X82.74 Y140.935 E.0013
; LINE_WIDTH: 0.477198
G1 F14506.862
G1 X82.765 Y140.892 E.0017
; LINE_WIDTH: 0.430143
G1 F15000
G1 X82.79 Y140.849 E.00152
; LINE_WIDTH: 0.383088
G1 X82.815 Y140.806 E.00133
; LINE_WIDTH: 0.336033
G1 X82.84 Y140.763 E.00115
; LINE_WIDTH: 0.283526
G1 X83.042 Y140.569 E.00533
G1 X83.19 Y140.391 E.0044
; LINE_WIDTH: 0.336077
G1 X83.254 Y140.295 E.00268
G2 X83.329 Y140.141 I-5.321 J-2.676 E.00396
; LINE_WIDTH: 0.396627
G1 X83.35 Y140.077 E.00189
G2 X83.071 Y138.908 I-1.12 J-.35 E.03523
; LINE_WIDTH: 0.356107
G2 X82.905 Y138.776 I-2.238 J2.644 E.00526
; LINE_WIDTH: 0.319826
G2 X82.805 Y138.719 I-.595 J.926 E.00253
; LINE_WIDTH: 0.29152
G1 X82.677 Y138.667 E.00271
; LINE_WIDTH: 0.250158
G2 X82.535 Y138.629 I-.795 J2.718 E.00241
; LINE_WIDTH: 0.208888
G1 X82.351 Y138.606 E.00242
; LINE_WIDTH: 0.147704
G1 X79.164 Y138.596 E.02638
; LINE_WIDTH: 0.147978
G1 X79.054 Y138.651 E.00101
; LINE_WIDTH: 0.183004
G1 X78.945 Y138.705 E.00135
; LINE_WIDTH: 0.218031
G1 X78.836 Y138.76 E.00169
G1 X79 Y138.544 F30000
; LINE_WIDTH: 0.371367
G1 F15000
G1 X79.005 Y140.925 E.0618
; WIPE_START
G1 F24000
G1 X79.001 Y138.926 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J0 P1  F30000
G1 X79 Y142.027 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.370823
G1 F15000
G1 X79 Y140.987 E.02693
G1 X79.005 Y140.925 E.00161
G1 X79.037 Y140.925 E.00082
; LINE_WIDTH: 0.296337
G1 X79.069 Y140.925 E.00063
; LINE_WIDTH: 0.253135
G1 X79.1 Y140.925 E.00053
; LINE_WIDTH: 0.209932
G1 X79.132 Y140.925 E.00042
; LINE_WIDTH: 0.16673
G1 X79.164 Y140.925 E.00031
; LINE_WIDTH: 0.174796
G1 X81.883 Y140.927 E.02832
G3 X83.031 Y140.992 I-.256 J14.536 E.01198
; WIPE_START
G1 F24000
G1 X81.883 Y140.927 E-.43697
G1 X81.032 Y140.926 E-.32303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.709 J.989 P1  F30000
G1 X83.636 Y139.06 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X83.636 Y140.166 E.00393
G3 X83.486 Y140.45 I-1.103 J-.401 E.00115
G1 X83.486 Y138.934 E.00539
G2 X83.336 Y138.754 I-1.005 J.685 E.00083
G1 X83.336 Y140.722 E.007
G1 X83.336 Y141.106 F30000
G1 F3600
G1 X83.336 Y142.502 E.00496
G3 X83.186 Y142.742 I-1.095 J-.517 E.00101
G1 X83.186 Y138.626 E.01463
G2 X83.036 Y138.534 I-.502 J.649 E.00063
G1 X83.036 Y142.906 E.01554
G3 X82.886 Y143.029 I-.734 J-.746 E.00069
G1 X82.886 Y140.364 E.00947
G3 X82.736 Y140.52 I-.652 J-.478 E.00077
G1 X82.736 Y141.557 E.00369
G2 X82.586 Y141.367 I-.771 J.452 E.00087
G1 X82.586 Y140.622 E.00265
G3 X82.436 Y140.687 I-.545 J-1.043 E.00058
G1 X82.436 Y141.253 E.00201
G2 X82.286 Y141.18 I-.599 J1.045 E.00059
G1 X82.286 Y140.719 E.00164
G3 X82.136 Y140.735 I-.143 J-.638 E.00054
G1 X82.136 Y141.137 E.00143
G2 X81.986 Y141.12 I-.131 J.493 E.00054
G1 X81.986 Y140.735 E.00137
G1 X81.836 Y140.735 E.00053
G1 X81.836 Y141.118 E.00136
G1 X81.686 Y141.118 E.00053
G1 X81.686 Y140.735 E.00136
G1 X81.536 Y140.735 E.00053
G1 X81.536 Y141.118 E.00136
G1 X81.386 Y141.118 E.00053
G1 X81.386 Y140.734 E.00136
G1 X81.236 Y140.734 E.00053
G1 X81.236 Y141.118 E.00137
G1 X81.086 Y141.118 E.00053
G1 X81.086 Y140.734 E.00137
G1 X80.936 Y140.734 E.00053
G1 X80.936 Y141.118 E.00137
G1 X80.786 Y141.118 E.00053
G1 X80.786 Y140.734 E.00137
G1 X80.636 Y140.734 E.00053
G1 X80.636 Y141.118 E.00137
G1 X80.486 Y141.118 E.00053
G1 X80.486 Y140.734 E.00137
G1 X80.336 Y140.734 E.00053
G1 X80.336 Y141.118 E.00137
G1 X80.186 Y141.118 E.00053
G1 X80.186 Y140.733 E.00137
G1 X80.036 Y140.733 E.00053
G1 X80.036 Y141.118 E.00137
G1 X79.886 Y141.118 E.00053
G1 X79.886 Y140.733 E.00137
G1 X79.736 Y140.733 E.00053
G1 X79.736 Y141.118 E.00137
G1 X79.586 Y141.118 E.00053
G1 X79.586 Y140.733 E.00137
G1 X79.436 Y140.733 E.00053
G1 X79.436 Y141.186 E.00161
; WIPE_START
G1 F24000
G1 X79.436 Y140.733 E-.1722
G1 X79.586 Y140.733 E-.057
G1 X79.586 Y141.118 E-.1465
G1 X79.736 Y141.118 E-.057
G1 X79.736 Y140.733 E-.14645
G1 X79.886 Y140.733 E-.057
G1 X79.886 Y141.059 E-.12384
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.507 J1.106 P1  F30000
G1 X82.736 Y142.364 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X82.736 Y143.126 E.00271
G3 X82.586 Y143.202 I-.45 J-.699 E.0006
G1 X82.586 Y142.711 E.00175
G3 X82.436 Y142.833 I-.622 J-.615 E.00069
G1 X82.436 Y143.263 E.00153
G3 X82.286 Y143.306 I-.371 J-1.011 E.00056
G1 X82.282 Y142.912 E.0014
G3 X82.136 Y142.955 I-.258 J-.607 E.00054
G1 X82.136 Y143.336 E.00136
G3 X81.986 Y143.352 I-.184 J-1.022 E.00054
G1 X81.986 Y142.969 E.00136
G1 X81.836 Y142.969 E.00053
G1 X81.836 Y143.358 E.00138
G3 X81.686 Y143.36 I-.088 J-1.795 E.00053
G1 X81.686 Y142.969 E.00139
G1 X81.536 Y142.969 E.00053
G1 X81.536 Y143.36 E.00139
G1 X81.386 Y143.36 E.00053
G1 X81.386 Y142.969 E.00139
G1 X81.236 Y142.969 E.00053
G1 X81.236 Y143.36 E.00139
G1 X81.086 Y143.36 E.00053
G1 X81.086 Y142.969 E.00139
G1 X80.936 Y142.97 E.00053
G1 X80.936 Y143.36 E.00139
G1 X80.786 Y143.36 E.00053
G1 X80.786 Y142.97 E.00139
G1 X80.636 Y142.97 E.00053
G1 X80.636 Y143.36 E.00139
G1 X80.486 Y143.36 E.00053
G1 X80.486 Y142.97 E.00139
G1 X80.336 Y142.97 E.00053
G1 X80.336 Y143.36 E.00139
G1 X80.186 Y143.36 E.00053
G1 X80.186 Y142.97 E.00139
G1 X80.036 Y142.97 E.00053
G1 X80.036 Y143.36 E.00139
G1 X79.886 Y143.36 E.00053
G1 X79.886 Y142.902 E.00163
; WIPE_START
G1 F24000
G1 X79.886 Y143.36 E-.17377
G1 X80.036 Y143.36 E-.057
G1 X80.036 Y142.97 E-.14813
G1 X80.186 Y142.97 E-.057
G1 X80.186 Y143.36 E-.14815
G1 X80.336 Y143.36 E-.057
G1 X80.336 Y143.047 E-.11895
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.009 J.68 P1  F30000
G1 X82.886 Y139.263 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X82.886 Y138.472 E.00281
G1 X82.736 Y138.433 E.00055
G1 X82.736 Y138.99 E.00198
G2 X82.586 Y138.89 I-.761 J.976 E.00064
G1 X82.586 Y138.415 E.00169
G2 X82.436 Y138.413 I-.097 J1.293 E.00053
G1 X82.436 Y138.827 E.00147
G2 X82.286 Y138.793 I-.201 J.556 E.00055
G1 X82.286 Y138.413 E.00135
G1 X82.136 Y138.413 E.00053
G1 X82.136 Y138.776 E.00129
G2 X81.986 Y138.779 I-.064 J.465 E.00054
G1 X81.986 Y138.413 E.0013
G1 X81.836 Y138.413 E.00053
G1 X81.836 Y138.779 E.0013
G1 X81.686 Y138.779 E.00053
G1 X81.686 Y138.413 E.0013
G1 X81.536 Y138.413 E.00053
G1 X81.536 Y138.779 E.0013
G1 X81.386 Y138.779 E.00053
G1 X81.386 Y138.413 E.0013
G1 X81.236 Y138.413 E.00053
G1 X81.236 Y138.779 E.0013
G1 X81.086 Y138.779 E.00053
G1 X81.086 Y138.413 E.0013
G1 X80.936 Y138.413 E.00053
G1 X80.936 Y138.779 E.0013
G1 X80.786 Y138.779 E.00053
G1 X80.786 Y138.413 E.0013
G1 X80.636 Y138.413 E.00053
G1 X80.636 Y138.779 E.0013
G1 X80.486 Y138.779 E.00053
G1 X80.486 Y138.413 E.0013
G1 X80.336 Y138.413 E.00053
G1 X80.336 Y138.779 E.0013
G1 X80.186 Y138.779 E.00053
G1 X80.186 Y138.413 E.0013
G1 X80.036 Y138.413 E.00053
G1 X80.036 Y138.779 E.0013
G1 X79.886 Y138.779 E.00053
G1 X79.886 Y138.413 E.0013
G1 X79.736 Y138.413 E.00053
G1 X79.736 Y138.779 E.0013
G1 X79.586 Y138.779 E.00053
G1 X79.586 Y138.413 E.0013
G1 X79.436 Y138.412 E.00053
G1 X79.436 Y138.847 E.00154
G1 X79.286 Y138.345 F30000
G1 F3600
G1 X79.286 Y142.284 E.014
G1 X79.136 Y142.223 E.00057
G1 X79.136 Y138.412 E.01355
G1 X78.986 Y138.412 E.00053
G1 X78.986 Y142.163 E.01333
G1 X78.836 Y142.102 E.00057
G1 X78.836 Y138.345 E.01336
; WIPE_START
G1 F24000
G1 X78.836 Y140.345 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.21 J.133 P1  F30000
G1 X79.286 Y144.435 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X79.286 Y143.817 E.0022
G1 X79.136 Y143.756 E.00058
G1 X79.136 Y144.302 E.00194
G1 X78.986 Y144.242 E.00058
G1 X78.986 Y143.695 E.00194
G1 X78.836 Y143.635 E.00058
G1 X78.836 Y144.254 E.0022
; WIPE_START
G1 F24000
G1 X78.836 Y143.635 E-.23518
G1 X78.986 Y143.695 E-.06147
G1 X78.986 Y144.242 E-.20752
G1 X79.136 Y144.302 E-.06147
G1 X79.136 Y143.791 E-.19435
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.202 J-.19 P1  F30000
G1 X76.864 Y129.414 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X77.138 Y128.845 E.01881
G3 X93.157 Y118.729 I16.572 J8.501 E.59201
G3 X99.1 Y119.527 I.552 J18.431 E.17943
G1 X99.675 Y119.702 E.0179
G3 X76.663 Y129.842 I-5.966 J17.644 E2.66348
G1 X76.838 Y129.468 E.01229
M204 S10000
; WIPE_START
G1 F24000
G1 X77.138 Y128.845 E-.26277
G1 X77.668 Y127.877 E-.41952
G1 X77.777 Y127.704 E-.07771
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.417 J-1.143 P1  F30000
G1 X76.104 Y128.314 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X94.295 Y117.569 I17.605 J9.032 E.66386
G1 X95.343 Y117.631 E.03128
G1 X95.466 Y117.638 E.00366
G3 X76.077 Y128.368 I-1.757 J19.708 E3.00253
M204 S10000
; WIPE_START
G1 F24000
M73 P95 R0
G1 X76.669 Y127.286 E-.46845
G1 X77.078 Y126.638 E-.29155
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.238 J1.194 P1  F30000
G1 X104.68 Y121.14 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6000
G1 X109.951 Y126.411 E.22204
M204 S10000
; WIPE_START
G1 F24000
G1 X108.536 Y124.997 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.947 J.765 P1  F30000
G1 X110.781 Y127.774 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X103.272 Y120.266 E.3163
M204 S10000
; WIPE_START
G1 F24000
G1 X104.686 Y121.68 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.031 J-1.217 P1  F30000
G1 X104.166 Y121.693 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X102.159 Y119.686 E.08455
M73 P96 R0
G1 X101.202 Y119.262
G1 X102.786 Y120.846 E.06669
G1 X101.706 Y120.299
G1 X100.339 Y118.933 E.05756
G1 X99.537 Y118.664
G1 X100.756 Y119.883 E.05135
G1 X99.908 Y119.568
G1 X98.778 Y118.438 E.04759
G1 X98.075 Y118.268
G1 X99.124 Y119.318 E.04421
G1 X98.383 Y119.11
G1 X97.4 Y118.126 E.04143
G1 X96.75 Y118.009
G1 X97.68 Y118.94 E.0392
G1 X97.023 Y118.816
G1 X96.137 Y117.93 E.03733
G1 X95.535 Y117.862
G1 X96.381 Y118.707 E.03562
G1 X95.776 Y118.635
G1 X94.956 Y117.816 E.03451
G1 X94.39 Y117.782
G1 X95.184 Y118.576 E.03345
G1 X94.617 Y118.543
G1 X93.85 Y117.776 E.03229
G1 X93.317 Y117.776
G1 X94.063 Y118.522 E.03141
G1 X93.529 Y118.522
G1 X92.803 Y117.796 E.0306
G1 X92.3 Y117.826
G1 X93.005 Y118.531 E.0297
G1 X92.501 Y118.561
G1 X91.806 Y117.865 E.02931
G1 X91.329 Y117.921
G1 X92 Y118.592 E.02827
G1 X91.524 Y118.649
G1 X90.853 Y117.978 E.02827
G1 X90.399 Y118.058
G1 X91.047 Y118.706 E.02731
G1 X90.589 Y118.781
G1 X89.947 Y118.139 E.02705
G1 X89.504 Y118.229
G1 X90.137 Y118.862 E.02667
G1 X89.692 Y118.951
G1 X89.074 Y118.333 E.02603
G1 X88.645 Y118.437
G1 X89.262 Y119.055 E.02603
G1 X88.833 Y119.158
G1 X88.231 Y118.557 E.02534
G1 X87.823 Y118.681
G1 X88.42 Y119.279 E.02516
G1 X88.012 Y119.403
G1 X87.415 Y118.807 E.02511
G1 X87.027 Y118.952
G1 X87.609 Y119.534 E.02453
G1 X87.219 Y119.677
G1 X86.638 Y119.096 E.02449
G1 X86.254 Y119.245
G1 X86.829 Y119.821 E.02425
G1 X86.449 Y119.974
G1 X85.884 Y119.408 E.02383
G1 X85.513 Y119.571
G1 X86.079 Y120.137 E.02383
G1 X85.709 Y120.3
G1 X85.15 Y119.741 E.02354
G1 X84.798 Y119.922
G1 X85.352 Y120.476 E.02333
G1 X84.999 Y120.657
G1 X84.445 Y120.103 E.02333
G1 X84.101 Y120.292
G1 X84.647 Y120.838 E.023
G1 X84.31 Y121.034
G1 X83.765 Y120.49 E.02293
G1 X83.43 Y120.688
G1 X83.975 Y121.232 E.02293
G1 X83.64 Y121.431
G1 X83.103 Y120.894 E.02263
G1 X82.784 Y121.109
G1 X83.321 Y121.646 E.02263
G1 X83.003 Y121.86
G1 X82.466 Y121.323 E.02263
G1 X82.154 Y121.545
G1 X82.686 Y122.077 E.02241
G1 X82.384 Y122.308
G1 X81.852 Y121.776 E.02241
G1 X81.55 Y122.007
G1 X82.082 Y122.539 E.02241
G1 X81.782 Y122.773
G1 X81.254 Y122.244 E.02227
G1 X80.967 Y122.491
G1 X81.496 Y123.02 E.02227
G1 X81.209 Y123.267
G1 X80.681 Y122.738 E.02227
G1 X80.4 Y122.99
G1 X80.927 Y123.517 E.02221
G1 X80.656 Y123.78
G1 X80.129 Y123.253 E.02221
G1 X79.858 Y123.516
G1 X80.386 Y124.043 E.02221
G1 X80.12 Y124.31
G1 X79.592 Y123.782 E.02223
G1 X79.337 Y124.061
G1 X79.865 Y124.589 E.02223
G1 X79.61 Y124.867
G1 X79.082 Y124.339 E.02223
G1 X78.831 Y124.621
G1 X79.361 Y125.151 E.02233
G1 X79.122 Y125.445
G1 X78.592 Y124.915 E.02233
G1 X78.353 Y125.21
G1 X78.883 Y125.74 E.02233
G1 X78.65 Y126.04
G1 X78.116 Y125.506 E.02251
G1 X77.893 Y125.816
G1 X78.428 Y126.351 E.02251
G1 X78.205 Y126.661
G1 X77.67 Y126.127 E.02251
G1 X77.449 Y126.439
G1 X77.99 Y126.979 E.02277
G1 X77.783 Y127.306
G1 X77.243 Y126.766 E.02277
G1 X77.036 Y127.093
G1 X77.577 Y127.633 E.02277
G1 X77.38 Y127.97
G1 X76.831 Y127.421 E.02312
G1 X76.642 Y127.765
G1 X77.191 Y128.314 E.02312
G1 X77.001 Y128.657
G1 X76.452 Y128.108 E.02312
G1 X76.265 Y128.454
G1 X76.824 Y129.014 E.02357
G1 X76.652 Y129.375
G1 X76.093 Y128.816 E.02357
G1 X75.921 Y129.177
G1 X76.48 Y129.736 E.02357
G1 X76.325 Y130.115
G1 X75.753 Y129.542 E.02411
G1 X75.599 Y129.922
G1 X76.172 Y130.494 E.02412
G1 X76.022 Y130.878
G1 X75.445 Y130.301 E.02429
G1 X75.299 Y130.688
G1 X75.887 Y131.276 E.02478
G1 X75.752 Y131.675
G1 X75.164 Y131.086 E.02478
G1 X75.029 Y131.485
G1 X75.629 Y132.085 E.02526
G1 X75.515 Y132.503
G1 X74.908 Y131.896 E.02557
G1 X74.793 Y132.315
G1 X75.4 Y132.922 E.02557
G1 X75.307 Y133.363
G1 X74.679 Y132.734 E.02648
G1 X74.585 Y133.174
G1 X75.215 Y133.803 E.02652
G1 X75.134 Y134.256
G1 X74.492 Y133.614 E.02702
G1 X74.409 Y134.064
G1 X75.065 Y134.72 E.02763
G1 X74.999 Y135.187
G1 X74.339 Y134.528 E.02778
G1 X74.274 Y134.996
G1 X74.955 Y135.677 E.02869
G1 X74.911 Y136.166
G1 X74.228 Y135.483 E.0288
G1 X74.182 Y135.97
G1 X74.892 Y136.68 E.02993
G1 X74.877 Y137.198
G1 X74.152 Y136.474 E.03052
G1 X74.137 Y136.992
G1 X74.884 Y137.738 E.03146
G1 X74.9 Y138.288
G1 X74.131 Y137.519 E.03238
G1 X74.148 Y138.069
G1 X74.941 Y138.862 E.03341
G1 X74.993 Y139.447
G1 X74.171 Y138.625 E.03462
G1 X74.223 Y139.211
G1 X75.077 Y140.065 E.03598
G1 X75.171 Y140.693
G1 X74.284 Y139.806 E.03736
G1 X74.378 Y140.432
G1 X75.314 Y141.368 E.03941
G1 X75.479 Y142.067
G1 X74.491 Y141.078 E.04163
G1 X74.633 Y141.754
G1 X75.68 Y142.8 E.04409
G1 X75.947 Y143.601
G1 X74.816 Y142.471 E.04762
G1 X75.03 Y143.218
G1 X76.276 Y144.463 E.05247
G1 X76.696 Y145.417
G1 X75.302 Y144.023 E.0587
G1 X75.65 Y144.904
G1 X77.262 Y146.516 E.06791
M204 S10000
; WIPE_START
G1 F24000
G1 X75.848 Y145.102 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.947 J.765 P1  F30000
G1 X78.085 Y147.873 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X76.089 Y145.876 E.0841
M204 S10000
; WIPE_START
G1 F24000
G1 X77.503 Y147.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.655 J1.025 P1  F30000
G1 X109.385 Y126.912 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X111.357 Y128.883 E.08305
G1 X111.789 Y129.849
G1 X110.194 Y128.254 E.06719
G1 X110.75 Y129.343
G1 X112.131 Y130.724 E.05818
G1 X112.403 Y131.53
G1 X111.163 Y130.289 E.05225
G1 X111.486 Y131.146
G1 X112.613 Y132.272 E.04745
G1 X112.793 Y132.986
G1 X111.749 Y131.943 E.04395
G1 X111.95 Y132.676
G1 X112.935 Y133.661 E.04149
G1 X113.045 Y134.304
G1 X112.112 Y133.372 E.03929
G1 X112.252 Y134.045
G1 X113.138 Y134.931 E.03733
G1 X113.197 Y135.523
G1 X112.346 Y134.672 E.03587
G1 X112.428 Y135.287
G1 X113.249 Y136.109 E.03462
G1 X113.271 Y136.663
G1 X112.48 Y135.873 E.03332
G1 X112.518 Y136.444
G1 X113.287 Y137.213 E.03238
G1 X113.28 Y137.739
G1 X112.535 Y136.994 E.03138
G1 X112.54 Y137.532
G1 X113.264 Y138.257 E.03052
G1 X113.234 Y138.76
G1 X112.524 Y138.05 E.02991
G1 X112.503 Y138.563
G1 X113.191 Y139.25 E.02895
G1 X113.143 Y139.736
G1 X112.46 Y139.052 E.02879
G1 X112.416 Y139.542
G1 X113.074 Y140.2 E.02771
G1 X113.005 Y140.664
G1 X112.349 Y140.008 E.02763
G1 X112.279 Y140.472
G1 X112.917 Y141.11 E.02687
G1 X112.821 Y141.547
G1 X112.197 Y140.923 E.02629
G1 X112.105 Y141.363
G1 X112.726 Y141.984 E.02615
G1 X112.618 Y142.41
G1 X112.01 Y141.802 E.02557
G1 X111.896 Y142.221
G1 X112.503 Y142.828 E.02557
G1 X112.38 Y143.239
G1 X111.782 Y142.64 E.02521
G1 X111.657 Y143.049
G1 X112.245 Y143.637 E.02478
G1 X112.111 Y144.036
G1 X111.522 Y143.447 E.02478
G1 X111.388 Y143.846
G1 X111.963 Y144.421 E.02424
G1 X111.809 Y144.801
G1 X111.237 Y144.228 E.02412
G1 X111.083 Y144.608
G1 X111.655 Y145.18 E.02411
G1 X111.486 Y145.545
G1 X110.927 Y144.985 E.02357
G1 X110.755 Y145.346
G1 X111.314 Y145.906 E.02357
G1 X111.142 Y146.267
G1 X110.583 Y145.708 E.02357
G1 X110.405 Y146.063
G1 X110.954 Y146.612 E.02312
G1 X110.764 Y146.956
G1 X110.216 Y146.407 E.02312
G1 X110.026 Y146.751
G1 X110.575 Y147.299 E.02312
G1 X110.369 Y147.627
G1 X109.828 Y147.086 E.02277
G1 X109.622 Y147.413
G1 X110.163 Y147.954 E.02277
G1 X109.956 Y148.281
G1 X109.416 Y147.74 E.02277
G1 X109.2 Y148.057
G1 X109.734 Y148.592 E.02251
G1 X109.511 Y148.902
G1 X108.977 Y148.368 E.02251
G1 X108.754 Y148.678
G1 X109.288 Y149.213 E.02251
G1 X109.051 Y149.508
G1 X108.52 Y148.978 E.02233
G1 X108.282 Y149.272
G1 X108.812 Y149.802 E.02233
G1 X108.573 Y150.097
G1 X108.043 Y149.567 E.02233
G1 X107.792 Y149.849
G1 X108.32 Y150.377 E.02223
G1 X108.065 Y150.656
G1 X107.537 Y150.128 E.02223
G1 X107.283 Y150.406
G1 X107.81 Y150.934 E.02223
G1 X107.543 Y151.2
G1 X107.016 Y150.673 E.02221
G1 X106.745 Y150.935
G1 X107.273 Y151.463 E.02221
G1 X107.002 Y151.725
G1 X106.475 Y151.198 E.02221
G1 X106.191 Y151.448
G1 X106.72 Y151.977 E.02227
G1 X106.433 Y152.224
G1 X105.905 Y151.695 E.02227
G1 X105.618 Y151.942
G1 X106.147 Y152.47 E.02227
G1 X105.85 Y152.707
G1 X105.318 Y152.175 E.02241
G1 X105.016 Y152.406
G1 X105.548 Y152.938 E.02241
G1 X105.245 Y153.169
G1 X104.713 Y152.637 E.02241
G1 X104.396 Y152.852
G1 X104.933 Y153.39 E.02263
G1 X104.615 Y153.604
G1 X104.077 Y153.067 E.02263
G1 X103.758 Y153.281
G1 X104.296 Y153.819 E.02264
G1 X103.968 Y154.024
G1 X103.423 Y153.479 E.02293
G1 X103.088 Y153.677
G1 X103.632 Y154.222 E.02293
G1 X103.297 Y154.42
G1 X102.75 Y153.873 E.02304
G1 X102.398 Y154.054
G1 X102.952 Y154.608 E.02333
G1 X102.599 Y154.789
G1 X102.045 Y154.235 E.02333
G1 X101.687 Y154.41
G1 X102.247 Y154.969 E.02358
G1 X101.882 Y155.138
G1 X101.317 Y154.573 E.02383
G1 X100.947 Y154.736
G1 X101.512 Y155.301 E.02383
G1 X101.142 Y155.465
G1 X100.566 Y154.888 E.02428
G1 X100.177 Y155.033
G1 X100.757 Y155.613 E.02443
G1 X100.368 Y155.757
G1 X99.788 Y155.177 E.02443
G1 X99.382 Y155.304
G1 X99.974 Y155.896 E.02494
G1 X99.567 Y156.023
G1 X98.973 Y155.429 E.02502
G1 X98.559 Y155.548
G1 X99.161 Y156.15 E.02534
G1 X98.747 Y156.269
G1 X98.13 Y155.652 E.026
G1 X97.7 Y155.756
G1 X98.316 Y156.371 E.02591
G1 X97.884 Y156.473
G1 X97.254 Y155.843 E.02653
G1 X96.802 Y155.924
G1 X97.444 Y156.566 E.02705
G1 X96.992 Y156.647
G1 X96.343 Y155.998 E.02737
G1 X95.866 Y156.054
G1 X96.537 Y156.725 E.02827
G1 X96.061 Y156.782
G1 X95.39 Y156.111 E.02827
G1 X94.887 Y156.142
G1 X95.584 Y156.839 E.02938
G1 X95.088 Y156.877
G1 X94.383 Y156.171 E.0297
G1 X93.857 Y156.178
G1 X94.585 Y156.906 E.03067
G1 X94.069 Y156.924
G1 X93.324 Y156.178 E.03141
G1 X92.768 Y156.156
G1 X93.536 Y156.924 E.03237
G1 X92.995 Y156.916
G1 X92.201 Y156.122 E.03345
G1 X91.606 Y156.061
G1 X92.428 Y156.882 E.0346
G1 X91.854 Y156.841
G1 X91.001 Y155.989 E.03591
G1 X90.356 Y155.878
G1 X91.248 Y156.769 E.03756
G1 X90.63 Y156.684
G1 X89.696 Y155.751 E.03933
G1 X88.993 Y155.581
G1 X89.98 Y156.567 E.04156
G1 X89.301 Y156.422
G1 X88.248 Y155.369 E.04436
G1 X87.46 Y155.114
G1 X88.598 Y156.252 E.04795
G1 X87.829 Y156.016
G1 X86.609 Y154.797 E.05137
G1 X85.656 Y154.377
G1 X87.029 Y155.75 E.05781
G1 X86.16 Y155.414
G1 X84.559 Y153.813 E.06741
M204 S10000
; WIPE_START
G1 F24000
G1 X85.973 Y155.227 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.766 J-.945 P1  F30000
G1 X83.156 Y152.943 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X85.194 Y154.982 E.08587
M204 S10000
; WIPE_START
G1 F24000
G1 X83.78 Y153.567 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.148 J.404 P1  F30000
G1 X84.069 Y154.39 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X76.675 Y146.995 E.3115
M204 S10000
; WIPE_START
G1 F24000
G1 X78.089 Y148.409 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.023 J-1.217 P1  F30000
G1 X77.545 Y148.399 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F6000
G1 X82.643 Y153.497 E.21473
M204 S10000
; WIPE_START
G1 F24000
G1 X81.229 Y152.082 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.133 J.443 P1  F30000
G1 X94.351 Y118.543 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109201
G1 F15000
G1 X94.135 Y118.45 E.00123
; WIPE_START
G1 F24000
G1 X94.351 Y118.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.062 J1.215 P1  F30000
G1 X95.453 Y118.599 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.123077
G1 F15000
G1 X95.254 Y118.506 E.00139
; WIPE_START
G1 F24000
G1 X95.453 Y118.599 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.154 J1.207 P1  F30000
G1 X101.14 Y119.325 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.212557
G1 F15000
G1 X100.806 Y119.096 E.00542
; WIPE_START
G1 F24000
G1 X101.14 Y119.325 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.215 J.07 P1  F30000
G1 X101.183 Y120.069 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X101.062 Y119.986 E.00053
; LINE_WIDTH: 0.129052
G1 X100.94 Y119.903 E.001
; LINE_WIDTH: 0.169935
G1 X100.819 Y119.82 E.00147
; WIPE_START
M73 P97 R0
G1 F24000
G1 X100.94 Y119.903 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.223 J1.196 P1  F30000
G1 X103.211 Y120.327 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.224578
G1 F15000
G1 X103.129 Y120.263 E.0015
; LINE_WIDTH: 0.221394
G1 X103.007 Y120.174 E.00213
; LINE_WIDTH: 0.176986
G1 X102.885 Y120.085 E.0016
; LINE_WIDTH: 0.132578
G1 X102.763 Y119.996 E.00107
; WIPE_START
G1 F24000
G1 X102.885 Y120.085 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.116 J.485 P1  F30000
G1 X103.363 Y121.184 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X103.191 Y121.051 E.00078
; LINE_WIDTH: 0.133296
G1 X103.019 Y120.918 E.00155
; LINE_WIDTH: 0.178422
G1 X102.847 Y120.784 E.00233
; WIPE_START
G1 F24000
G1 X103.019 Y120.918 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.212 J1.198 P1  F30000
G1 X104.619 Y121.2 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.230585
G1 F15000
G1 X104.384 Y121.007 E.00452
; LINE_WIDTH: 0.181034
G1 X104.149 Y120.813 E.00332
; LINE_WIDTH: 0.131483
G1 X103.995 Y120.693 E.00136
; WIPE_START
G1 F24000
G1 X104.149 Y120.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.06 J.597 P1  F30000
G1 X104.956 Y122.246 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0884883
G1 F15000
G1 X104.703 Y122.025 E.00121
; LINE_WIDTH: 0.130038
G1 X104.545 Y121.894 E.00142
; LINE_WIDTH: 0.163554
G1 X104.386 Y121.763 E.00196
; LINE_WIDTH: 0.197069
G1 X104.227 Y121.633 E.0025
; WIPE_START
G1 F24000
G1 X104.386 Y121.763 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.726 J.976 P1  F30000
G1 X109.125 Y125.288 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X108.815 Y124.944 E.00166
; LINE_WIDTH: 0.135068
G1 X108.504 Y124.599 E.00337
; LINE_WIDTH: 0.181969
G1 X108.104 Y124.181 E.00635
; LINE_WIDTH: 0.224831
G2 X106.881 Y122.952 I-21.35 J20.021 E.02493
; LINE_WIDTH: 0.216273
G1 X106.456 Y122.558 E.00793
; LINE_WIDTH: 0.173359
G1 X106.032 Y122.163 E.00597
; LINE_WIDTH: 0.119495
G1 X105.776 Y121.94 E.00206
; WIPE_START
G1 F24000
G1 X106.032 Y122.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.996 J.699 P1  F30000
G1 X109.374 Y126.923 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.209403
G1 F15000
G1 X109.388 Y126.779 E.00191
; LINE_WIDTH: 0.228074
G1 X109.197 Y126.555 E.0043
; LINE_WIDTH: 0.181439
G1 X109.007 Y126.33 E.00322
; LINE_WIDTH: 0.134805
G1 X108.817 Y126.106 E.00213
; WIPE_START
G1 F24000
G1 X109.007 Y126.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.575 J1.073 P1  F30000
G1 X110.354 Y127.053 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X110.2 Y126.859 E.00089
; LINE_WIDTH: 0.13464
G1 X110.045 Y126.665 E.0018
; LINE_WIDTH: 0.18111
G1 X109.89 Y126.472 E.00271
; WIPE_START
G1 F24000
G1 X110.045 Y126.665 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.206 J.166 P1  F30000
G1 X110.255 Y128.192 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.221576
G1 F15000
G1 X110.148 Y128.051 E.0025
; LINE_WIDTH: 0.1803
G1 X110.042 Y127.909 E.00192
; LINE_WIDTH: 0.138648
G1 X109.934 Y127.766 E.00135
; LINE_WIDTH: 0.0973389
G1 X109.894 Y127.716 E.00027
; WIPE_START
G1 F24000
G1 X109.934 Y127.766 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.521 J1.1 P1  F30000
G1 X111.073 Y128.306 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X110.955 Y128.149 E.0007
; LINE_WIDTH: 0.132638
G1 X110.837 Y127.992 E.00139
; LINE_WIDTH: 0.177107
G1 X110.72 Y127.836 E.00208
; WIPE_START
G1 F24000
G1 X110.837 Y127.992 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.167 J.345 P1  F30000
G1 X113.119 Y135.712 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0925851
G1 F15000
G1 X113.216 Y135.519 E.00085
; WIPE_START
G1 F24000
G1 X113.119 Y135.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.024 J-.657 P1  F30000
G1 X100.901 Y154.756 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0934768
G1 F15000
G1 X100.813 Y154.815 E.00042
G1 X100.746 Y154.802 E.00027
; WIPE_START
G1 F24000
G1 X100.813 Y154.815 E-.29766
G1 X100.901 Y154.756 E-.46234
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.502 J-1.109 P1  F30000
G1 X96.724 Y156.646 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.103138
G1 F15000
G1 X96.557 Y156.727 E.00088
; WIPE_START
G1 F24000
G1 X96.724 Y156.646 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.154 J-1.207 P1  F30000
G1 X88.926 Y155.648 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.119649
G1 F15000
G1 X88.664 Y155.496 E.00184
; WIPE_START
G1 F24000
G1 X88.926 Y155.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.17 J-1.205 P1  F30000
G1 X85.637 Y155.184 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X85.534 Y155.113 E.00045
; LINE_WIDTH: 0.131423
G1 X85.431 Y155.043 E.00087
; LINE_WIDTH: 0.197835
G1 X85.328 Y154.972 E.00153
G1 X85.186 Y154.999 E.00176
G1 X85.594 Y154.44 F30000
; LINE_WIDTH: 0.215784
G1 F15000
G1 X85.453 Y154.337 E.00238
; LINE_WIDTH: 0.173246
G1 X85.313 Y154.235 E.00179
; LINE_WIDTH: 0.130707
G1 X85.172 Y154.132 E.00121
G1 X84.59 Y154.671 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X84.488 Y154.597 E.00045
; LINE_WIDTH: 0.125127
G1 X84.385 Y154.522 E.00082
; LINE_WIDTH: 0.162085
G1 X84.283 Y154.447 E.00119
; LINE_WIDTH: 0.199041
G1 X84.13 Y154.329 E.00238
G1 X84.498 Y153.874 F30000
; LINE_WIDTH: 0.224579
G1 F15000
G1 X84.325 Y153.74 E.00314
; LINE_WIDTH: 0.179109
G1 X84.152 Y153.606 E.00236
; LINE_WIDTH: 0.133639
G1 X83.979 Y153.472 E.00157
G1 X83.347 Y153.962 F30000
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X83.263 Y153.897 E.00038
; LINE_WIDTH: 0.109282
G1 X83.076 Y153.743 E.00127
; LINE_WIDTH: 0.149716
G1 X82.89 Y153.59 E.00204
; LINE_WIDTH: 0.190151
G1 X82.703 Y153.436 E.00281
G1 X83.095 Y153.004 F30000
; LINE_WIDTH: 0.230586
G1 F15000
G1 X82.902 Y152.844 E.00372
; LINE_WIDTH: 0.190878
G1 X82.705 Y152.682 E.00297
; LINE_WIDTH: 0.151641
G1 X82.518 Y152.518 E.00214
; LINE_WIDTH: 0.119905
G1 X82.33 Y152.354 E.00152
G1 X81.51 Y152.661 F30000
; LINE_WIDTH: 0.0881699
G1 F15000
G1 X81.379 Y152.546 E.00063
; LINE_WIDTH: 0.108468
G1 X80.954 Y152.151 E.003
; LINE_WIDTH: 0.151403
G1 X80.529 Y151.757 E.00497
; LINE_WIDTH: 0.202917
G3 X78.905 Y150.108 I26.989 J-28.216 E.02926
; LINE_WIDTH: 0.16002
G1 X78.665 Y149.842 E.00331
; LINE_WIDTH: 0.124095
G1 X78.426 Y149.577 E.00229
G1 X78.679 Y148.704 F30000
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X78.461 Y148.447 E.0012
; LINE_WIDTH: 0.136633
G1 X78.243 Y148.19 E.0025
; LINE_WIDTH: 0.185095
G1 X78.025 Y147.933 E.00379
G1 X77.606 Y148.339 F30000
; LINE_WIDTH: 0.233594
G1 F15000
G1 X77.529 Y148.248 E.00179
; LINE_WIDTH: 0.229837
G1 X77.391 Y148.076 E.00325
; LINE_WIDTH: 0.182614
G1 X77.254 Y147.904 E.00243
; LINE_WIDTH: 0.135392
G1 X77.116 Y147.732 E.00161
G1 X77.576 Y147.068 F30000
; LINE_WIDTH: 0.0886029
G1 F15000
G1 X77.472 Y146.938 E.0006
; LINE_WIDTH: 0.120104
G1 X77.41 Y146.856 E.00063
; LINE_WIDTH: 0.148914
G1 X77.349 Y146.774 E.00086
; LINE_WIDTH: 0.177723
G1 X77.201 Y146.577 E.00262
G1 X76.736 Y146.934 F30000
; LINE_WIDTH: 0.221577
G1 F15000
G1 X76.618 Y146.777 E.00277
; LINE_WIDTH: 0.177108
G1 X76.5 Y146.62 E.00208
; LINE_WIDTH: 0.132639
G1 X76.382 Y146.464 E.00139
G1 X76.914 Y145.875 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X76.86 Y145.798 E.00034
; LINE_WIDTH: 0.116364
G1 X76.805 Y145.721 E.00055
; LINE_WIDTH: 0.144558
G1 X76.72 Y145.6 E.00119
; LINE_WIDTH: 0.180063
G1 X76.634 Y145.478 E.00161
G1 X76.151 Y145.814 F30000
; LINE_WIDTH: 0.215568
G1 F15000
G1 X76.057 Y145.682 E.00221
; LINE_WIDTH: 0.173102
G1 X75.964 Y145.55 E.00167
; LINE_WIDTH: 0.130636
G1 X75.87 Y145.418 E.00112
; WIPE_START
G1 F24000
G1 X75.964 Y145.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.214 J.087 P1  F30000
G1 X76.077 Y143.973 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.106972
G1 F15000
G1 X75.88 Y143.668 E.00184
; WIPE_START
G1 F24000
G1 X76.077 Y143.973 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.081 J-.558 P1  F30000
G1 X74.551 Y141.018 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.105
G1 F15000
G1 X74.425 Y140.768 E.00137
; WIPE_START
G1 F24000
G1 X74.551 Y141.018 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.202 J.188 P1  F30000
G1 X74.931 Y138.586 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.13401
G1 F15000
G1 X74.829 Y138.359 E.00179
; WIPE_START
G1 F24000
G1 X74.931 Y138.586 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.001 P1  F30000
G1 X74.929 Y136.148 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.108447
G1 F15000
G1 X74.835 Y136.357 E.00118
; WIPE_START
G1 F24000
G1 X74.929 Y136.148 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.042 J1.216 P1  F30000
G1 X113.336 Y134.832 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.404829
; LAYER_HEIGHT: 0.0225
G1 F3600
G1 X113.336 Y139.869 E.0179
; WIPE_START
G1 F24000
G1 X113.336 Y137.869 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.215 J-.061 P1  F30000
G1 X113.186 Y140.867 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X113.186 Y133.833 E.025
G1 X113.036 Y133.121 F30000
G1 F3600
G1 X113.036 Y141.58 E.03007
G1 X112.886 Y142.225 F30000
G1 F3600
G1 X112.886 Y132.476 E.03466
G1 X112.736 Y131.927 F30000
G1 F3600
G1 X112.736 Y142.774 E.03856
G1 X112.586 Y143.286 F30000
G1 F3600
G1 X112.586 Y131.414 E.0422
G1 X112.436 Y130.971 F30000
G1 F3600
G1 X112.436 Y143.73 E.04535
G1 X112.286 Y144.173 F30000
G1 F3600
G1 X112.286 Y138.641 E.01966
; WIPE_START
G1 F24000
G1 X112.286 Y140.641 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.184 J-.283 P1  F30000
G1 X112.136 Y140.013 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X112.136 Y144.375 E.0155
G1 X111.986 Y144.745 E.00142
G1 X111.986 Y140.91 E.01363
G1 X111.836 Y141.622 F30000
G1 F3600
G1 X111.836 Y145.115 E.01241
G3 X111.686 Y145.457 I-2.962 J-1.092 E.00133
G1 X111.686 Y142.195 E.0116
G1 X111.536 Y142.744 F30000
G1 F3600
G1 X111.536 Y145.772 E.01077
G1 X111.386 Y146.087 E.00124
G1 X111.386 Y143.196 E.01028
G1 X111.236 Y143.64 F30000
G1 F3600
G1 X111.236 Y146.396 E.0098
G1 X111.086 Y146.668 E.0011
G1 X111.086 Y144.222 E.00869
G1 X110.936 Y144.592 E.00142
G1 X110.936 Y146.94 E.00835
G1 X110.786 Y147.212 E.0011
G1 X110.786 Y144.951 E.00804
G1 X110.636 Y145.265 E.00124
G1 X110.636 Y147.471 E.00784
G1 X110.486 Y147.709 E.001
G1 X110.486 Y145.58 E.00757
G3 X110.336 Y145.894 I-2.718 J-1.107 E.00124
G1 X110.336 Y147.946 E.0073
G1 X110.186 Y148.184 E.001
G1 X110.186 Y146.166 E.00717
G1 X110.036 Y146.438 E.0011
G1 X110.036 Y148.415 E.00703
G1 X109.886 Y148.624 E.00091
G1 X109.886 Y146.71 E.0068
G3 X109.736 Y146.966 I-2.233 J-1.135 E.00106
G1 X109.736 Y148.833 E.00664
G1 X109.586 Y149.042 E.00091
G1 X109.586 Y147.204 E.00653
G1 X109.436 Y147.442 E.001
G1 X109.436 Y149.252 E.00643
G3 X109.286 Y149.444 I-1.698 J-1.167 E.00087
G1 X109.286 Y147.679 E.00627
G3 X109.136 Y147.902 I-1.952 J-1.153 E.00096
G1 X109.136 Y149.629 E.00614
G1 X108.986 Y149.814 E.00085
G1 X108.986 Y148.111 E.00605
G1 X108.836 Y148.32 E.00091
G1 X108.836 Y149.999 E.00597
G1 X108.686 Y150.184 E.00085
G1 X108.686 Y148.529 E.00588
G1 X108.536 Y148.733 E.0009
G1 X108.536 Y150.353 E.00576
G1 X108.386 Y150.517 E.00079
G1 X108.386 Y148.918 E.00568
G1 X108.236 Y149.103 E.00085
G1 X108.236 Y150.68 E.00561
G1 X108.086 Y150.844 E.00079
G1 X108.086 Y149.288 E.00553
G1 X107.936 Y149.473 E.00085
G1 X107.936 Y151.008 E.00546
G3 X107.786 Y151.163 I-1.378 J-1.186 E.00077
G1 X107.786 Y149.646 E.00539
G1 X107.636 Y149.81 E.00079
G1 X107.636 Y151.309 E.00533
G1 X107.486 Y151.454 E.00074
G1 X107.486 Y149.974 E.00526
G1 X107.336 Y150.138 E.00079
G1 X107.336 Y151.6 E.0052
G1 X107.186 Y151.746 E.00074
G1 X107.186 Y150.302 E.00513
G3 X107.036 Y150.455 I-1.368 J-1.187 E.00076
G1 X107.036 Y151.891 E.00511
G3 X106.886 Y152.022 I-1.176 J-1.199 E.00071
G1 X106.886 Y150.601 E.00505
G1 X106.736 Y150.746 E.00074
G1 X106.736 Y152.151 E.00499
G1 X106.586 Y152.28 E.0007
G1 X106.586 Y150.892 E.00494
G1 X106.436 Y151.038 E.00074
G1 X106.436 Y152.41 E.00488
G1 X106.286 Y152.539 E.0007
G1 X106.286 Y151.179 E.00484
G1 X106.136 Y151.308 E.0007
G1 X106.136 Y152.668 E.00484
G1 X105.986 Y152.783 E.00067
G1 X105.986 Y151.437 E.00478
G1 X105.836 Y151.566 E.0007
G1 X105.836 Y152.897 E.00473
G1 X105.686 Y153.012 E.00067
G1 X105.686 Y151.696 E.00468
G1 X105.536 Y151.825 E.0007
G1 X105.536 Y153.126 E.00463
G1 X105.386 Y153.241 E.00067
G1 X105.386 Y151.944 E.00461
G1 X105.236 Y152.059 E.00067
G1 X105.236 Y153.355 E.00461
G3 X105.086 Y153.459 I-.947 J-1.212 E.00065
G1 X105.086 Y152.173 E.00457
G1 X104.936 Y152.288 E.00067
G1 X104.936 Y153.56 E.00452
G1 X104.786 Y153.661 E.00064
G1 X104.786 Y152.402 E.00447
G1 X104.636 Y152.517 E.00067
G1 X104.636 Y153.762 E.00443
G1 X104.486 Y153.863 E.00064
G1 X104.486 Y152.62 E.00442
G1 X104.336 Y152.721 E.00064
G1 X104.336 Y153.964 E.00442
G3 X104.186 Y154.061 I-.889 J-1.215 E.00063
G1 X104.186 Y152.822 E.0044
G1 X104.036 Y152.924 E.00064
G1 X104.036 Y154.149 E.00436
G1 X103.886 Y154.238 E.00062
G1 X103.886 Y153.025 E.00431
G1 X103.736 Y153.126 E.00064
G1 X103.736 Y154.326 E.00427
G1 X103.586 Y154.415 E.00062
G1 X103.586 Y153.218 E.00425
G1 X103.436 Y153.307 E.00062
G1 X103.436 Y154.503 E.00425
G1 X103.286 Y154.592 E.00062
G1 X103.286 Y153.395 E.00425
G1 X103.136 Y153.484 E.00062
G1 X103.136 Y154.673 E.00423
G1 X102.986 Y154.75 E.0006
G1 X102.986 Y153.572 E.00419
G1 X102.836 Y153.661 E.00062
G1 X102.836 Y154.827 E.00415
G1 X102.686 Y154.904 E.0006
G1 X102.686 Y153.746 E.00412
G1 X102.536 Y153.823 E.0006
G1 X102.536 Y154.981 E.00412
G1 X102.386 Y155.058 E.0006
G1 X102.386 Y153.9 E.00412
G1 X102.236 Y153.977 E.0006
G1 X102.236 Y155.135 E.00412
G3 X102.086 Y155.204 I-.659 J-1.229 E.00059
G1 X102.086 Y154.054 E.00409
G1 X101.936 Y154.131 E.0006
G1 X101.936 Y155.271 E.00405
G1 X101.786 Y155.337 E.00058
G1 X101.786 Y154.208 E.00401
G3 X101.636 Y154.277 I-.654 J-1.229 E.00059
G1 X101.636 Y155.403 E.004
G1 X101.486 Y155.469 E.00058
G1 X101.486 Y154.343 E.004
G1 X101.336 Y154.409 E.00058
G1 X101.336 Y155.535 E.004
G1 X101.186 Y155.601 E.00058
G1 X101.186 Y154.475 E.004
G1 X101.036 Y154.541 E.00058
G1 X101.036 Y155.661 E.00398
G1 X100.886 Y155.717 E.00057
G1 X100.886 Y154.607 E.00394
G1 X100.736 Y154.673 E.00058
G1 X100.736 Y155.772 E.00391
G1 X100.586 Y155.828 E.00057
G1 X100.586 Y154.729 E.00391
G1 X100.436 Y154.785 E.00057
G1 X100.436 Y155.884 E.00391
G1 X100.286 Y155.94 E.00057
G1 X100.286 Y154.84 E.00391
G1 X100.136 Y154.896 E.00057
G1 X100.136 Y155.995 E.00391
G3 X99.986 Y156.048 I-.522 J-1.238 E.00057
G1 X99.986 Y154.952 E.0039
G1 X99.836 Y155.008 E.00057
G1 X99.836 Y156.094 E.00386
G1 X99.686 Y156.14 E.00056
G1 X99.686 Y155.063 E.00383
G1 X99.536 Y155.108 E.00056
G1 X99.536 Y156.186 E.00383
G1 X99.386 Y156.232 E.00056
G1 X99.386 Y155.154 E.00383
G1 X99.236 Y155.2 E.00056
G1 X99.236 Y156.277 E.00383
G1 X99.086 Y156.323 E.00056
G1 X99.086 Y155.246 E.00383
G1 X98.936 Y155.292 E.00056
G1 X98.936 Y156.369 E.00383
G3 X98.786 Y156.407 I-.395 J-1.245 E.00055
G1 X98.786 Y155.337 E.0038
G1 X98.636 Y155.383 E.00056
G1 X98.636 Y156.443 E.00377
G1 X98.486 Y156.48 E.00055
G1 X98.486 Y155.419 E.00377
G1 X98.336 Y155.456 E.00055
G1 X98.336 Y156.516 E.00377
G1 X98.186 Y156.552 E.00055
G1 X98.186 Y155.492 E.00377
G1 X98.036 Y155.528 E.00055
G1 X98.036 Y156.588 E.00377
G1 X97.886 Y156.625 E.00055
G1 X97.886 Y155.564 E.00377
G1 X97.736 Y155.601 E.00055
G1 X97.736 Y156.659 E.00376
G1 X97.586 Y156.686 E.00054
G1 X97.586 Y155.637 E.00373
G3 X97.436 Y155.666 I-.316 J-1.25 E.00054
G1 X97.436 Y156.712 E.00372
G1 X97.286 Y156.739 E.00054
G1 X97.286 Y155.692 E.00372
G1 X97.136 Y155.719 E.00054
G1 X97.136 Y156.766 E.00372
G1 X96.986 Y156.793 E.00054
G1 X96.986 Y155.746 E.00372
G1 X96.836 Y155.773 E.00054
G1 X96.836 Y156.82 E.00372
G1 X96.686 Y156.847 E.00054
G1 X96.686 Y155.8 E.00372
G1 X96.536 Y155.827 E.00054
G1 X96.536 Y156.869 E.0037
G1 X96.386 Y156.887 E.00054
G1 X96.386 Y155.849 E.00369
G1 X96.236 Y155.867 E.00054
G1 X96.236 Y156.905 E.00369
G1 X96.086 Y156.923 E.00054
G1 X96.086 Y155.885 E.00369
G1 X95.936 Y155.903 E.00054
G1 X95.936 Y156.941 E.00369
G1 X95.786 Y156.958 E.00054
G1 X95.786 Y155.921 E.00369
G1 X95.636 Y155.939 E.00054
G1 X95.636 Y156.976 E.00369
G1 X95.486 Y156.994 E.00054
G1 X95.486 Y155.956 E.00369
G3 X95.336 Y155.972 I-.209 J-1.256 E.00054
G1 X95.336 Y157.005 E.00367
G1 X95.186 Y157.013 E.00053
G1 X95.186 Y155.981 E.00367
G1 X95.036 Y155.99 E.00053
G1 X95.036 Y157.022 E.00367
G1 X94.886 Y157.031 E.00053
G1 X94.886 Y155.999 E.00367
G1 X94.736 Y156.008 E.00053
G1 X94.736 Y157.04 E.00367
G1 X94.586 Y157.049 E.00053
G1 X94.586 Y156.017 E.00367
G1 X94.436 Y156.026 E.00053
G1 X94.436 Y157.058 E.00367
G1 X94.293 Y157.066 E.00051
G1 X94.286 Y156.035 E.00367
G3 X94.136 Y156.036 I-.087 J-1.263 E.00053
G1 X94.136 Y157.066 E.00366
G1 X93.986 Y157.066 E.00053
G1 X93.986 Y156.036 E.00366
G1 X93.836 Y156.036 E.00053
G1 X93.836 Y157.066 E.00366
G1 X93.686 Y157.066 E.00053
G1 X93.686 Y156.036 E.00366
G1 X93.536 Y156.036 E.00053
G1 X93.536 Y157.066 E.00366
G1 X93.386 Y157.066 E.00053
G1 X93.386 Y156.036 E.00366
G1 X93.236 Y156.036 E.00053
G1 X93.236 Y157.066 E.00366
G3 X93.086 Y157.064 I-.056 J-1.265 E.00053
G1 X93.086 Y156.032 E.00367
G1 X92.936 Y156.023 E.00053
G1 X92.936 Y157.055 E.00367
G1 X92.786 Y157.046 E.00053
G1 X92.786 Y156.014 E.00367
G1 X92.636 Y156.005 E.00053
G1 X92.636 Y157.037 E.00367
G1 X92.486 Y157.029 E.00053
G1 X92.486 Y155.996 E.00367
G1 X92.336 Y155.987 E.00053
G1 X92.336 Y157.02 E.00367
G1 X92.186 Y157.011 E.00053
G1 X92.186 Y155.978 E.00367
G3 X92.036 Y155.969 I.007 J-1.269 E.00053
G1 X92.036 Y157.002 E.00367
G3 X91.886 Y156.989 I.036 J-1.27 E.00054
G1 X91.886 Y155.951 E.00369
G1 X91.736 Y155.933 E.00054
G1 X91.736 Y156.971 E.00369
G1 X91.586 Y156.953 E.00054
G1 X91.586 Y155.915 E.00369
G1 X91.436 Y155.897 E.00054
G1 X91.436 Y156.935 E.00369
G1 X91.286 Y156.917 E.00054
G1 X91.286 Y155.879 E.00369
G1 X91.136 Y155.862 E.00054
G1 X91.136 Y156.899 E.00369
G1 X90.986 Y156.881 E.00054
G1 X90.986 Y155.844 E.00369
G3 X90.836 Y155.819 I.133 J-1.276 E.00054
G1 X90.836 Y156.864 E.00371
G3 X90.686 Y156.839 I.132 J-1.276 E.00054
G1 X90.686 Y155.792 E.00372
G1 X90.536 Y155.765 E.00054
G1 X90.536 Y156.812 E.00372
G1 X90.386 Y156.785 E.00054
G1 X90.386 Y155.738 E.00372
G1 X90.236 Y155.711 E.00054
G1 X90.236 Y156.758 E.00372
G1 X90.086 Y156.731 E.00054
G1 X90.086 Y155.684 E.00372
G1 X89.936 Y155.657 E.00054
G1 X89.936 Y156.704 E.00372
G1 X89.786 Y156.677 E.00054
G1 X89.786 Y155.626 E.00374
G1 X89.636 Y155.59 E.00055
G1 X89.636 Y156.65 E.00377
G1 X89.486 Y156.613 E.00055
G1 X89.486 Y155.553 E.00377
G1 X89.336 Y155.517 E.00055
G1 X89.336 Y156.577 E.00377
G1 X89.186 Y156.541 E.00055
G1 X89.186 Y155.481 E.00377
G1 X89.036 Y155.445 E.00055
G1 X89.036 Y156.505 E.00377
G1 X88.886 Y156.468 E.00055
G1 X88.886 Y155.408 E.00377
G3 X88.736 Y155.369 I.255 J-1.283 E.00055
G1 X88.736 Y156.432 E.00378
G1 X88.586 Y156.396 E.00055
G1 X88.586 Y155.323 E.00381
G1 X88.436 Y155.278 E.00056
G1 X88.436 Y156.355 E.00383
G1 X88.286 Y156.309 E.00056
G1 X88.286 Y155.232 E.00383
G1 X88.136 Y155.186 E.00056
G1 X88.136 Y156.263 E.00383
G1 X87.986 Y156.218 E.00056
G1 X87.986 Y155.14 E.00383
G1 X87.836 Y155.094 E.00056
G1 X87.836 Y156.172 E.00383
G1 X87.686 Y156.126 E.00056
G1 X87.686 Y155.046 E.00384
G1 X87.536 Y154.99 E.00057
G1 X87.536 Y156.08 E.00387
G1 X87.386 Y156.034 E.00056
G1 X87.386 Y154.935 E.00391
G1 X87.236 Y154.879 E.00057
G1 X87.236 Y155.978 E.00391
G1 X87.086 Y155.923 E.00057
G1 X87.086 Y154.823 E.00391
G1 X86.936 Y154.768 E.00057
G1 X86.936 Y155.867 E.00391
G1 X86.786 Y155.811 E.00057
G1 X86.786 Y154.712 E.00391
G3 X86.636 Y154.653 I.422 J-1.294 E.00057
G1 X86.636 Y155.755 E.00392
G1 X86.486 Y155.7 E.00057
G1 X86.486 Y154.587 E.00396
G1 X86.336 Y154.521 E.00058
G1 X86.336 Y155.644 E.00399
G3 X86.186 Y155.581 I.458 J-1.295 E.00058
G1 X86.186 Y154.455 E.004
G1 X86.036 Y154.389 E.00058
G1 X86.036 Y155.515 E.004
G1 X85.886 Y155.449 E.00058
G1 X85.886 Y154.323 E.004
G1 X85.736 Y154.256 E.00058
G1 X85.736 Y155.382 E.004
G1 X85.586 Y155.316 E.00058
G1 X85.586 Y154.184 E.00402
G1 X85.436 Y154.107 E.0006
G1 X85.436 Y155.25 E.00406
G1 X85.286 Y155.184 E.00058
G1 X85.286 Y154.03 E.0041
G1 X85.136 Y153.953 E.0006
G1 X85.136 Y155.112 E.00412
G1 X84.986 Y155.035 E.0006
G1 X84.986 Y153.876 E.00412
G1 X84.836 Y153.799 E.0006
G1 X84.836 Y154.958 E.00412
G1 X84.686 Y154.881 E.0006
G1 X84.686 Y153.722 E.00412
G1 X84.536 Y153.634 E.00062
G1 X84.536 Y154.804 E.00416
G1 X84.386 Y154.727 E.0006
G1 X84.386 Y153.545 E.0042
G1 X84.236 Y153.457 E.00062
G1 X84.236 Y154.65 E.00424
G3 X84.086 Y154.565 I.639 J-1.306 E.00061
G1 X84.086 Y153.368 E.00425
G1 X83.936 Y153.28 E.00062
G1 X83.936 Y154.476 E.00425
G1 X83.786 Y154.388 E.00062
G1 X83.786 Y153.191 E.00425
G3 X83.636 Y153.095 I.737 J-1.312 E.00063
G1 X83.636 Y154.299 E.00428
G1 X83.486 Y154.211 E.00062
G1 X83.486 Y152.994 E.00433
G1 X83.336 Y152.893 E.00064
G1 X83.336 Y154.122 E.00437
G1 X83.186 Y154.033 E.00062
G1 X83.186 Y152.792 E.00441
G1 X83.036 Y152.69 E.00064
G1 X83.036 Y153.933 E.00442
G1 X82.886 Y153.832 E.00064
G1 X82.886 Y152.589 E.00442
G3 X82.736 Y152.482 I.833 J-1.318 E.00066
G1 X82.736 Y153.731 E.00444
G1 X82.586 Y153.63 E.00064
G1 X82.586 Y152.367 E.00449
G1 X82.436 Y152.253 E.00067
G1 X82.436 Y153.529 E.00454
G1 X82.286 Y153.428 E.00064
G1 X82.286 Y152.138 E.00458
G1 X82.136 Y152.024 E.00067
G1 X82.136 Y153.32 E.00461
G1 X81.986 Y153.206 E.00067
G1 X81.986 Y151.909 E.00461
G1 X81.836 Y151.785 E.00069
G1 X81.836 Y153.091 E.00464
G1 X81.686 Y152.977 E.00067
G1 X81.686 Y151.656 E.00469
G1 X81.536 Y151.527 E.0007
G1 X81.536 Y152.862 E.00475
G1 X81.386 Y152.748 E.00067
G1 X81.386 Y151.398 E.0048
G1 X81.236 Y151.268 E.0007
G1 X81.236 Y152.629 E.00484
G1 X81.086 Y152.499 E.0007
G1 X81.086 Y151.138 E.00484
G1 X80.936 Y150.993 E.00074
G1 X80.936 Y152.37 E.0049
G1 X80.786 Y152.241 E.0007
G1 X80.786 Y150.847 E.00495
G1 X80.636 Y150.702 E.00074
G1 X80.636 Y152.112 E.00501
G1 X80.486 Y151.982 E.0007
G1 X80.486 Y150.556 E.00507
G1 X80.336 Y150.41 E.00074
G1 X80.336 Y151.847 E.00511
G1 X80.186 Y151.701 E.00074
G1 X80.186 Y150.251 E.00515
G1 X80.036 Y150.087 E.00079
G1 X80.036 Y151.555 E.00522
G1 X79.886 Y151.41 E.00074
G1 X79.886 Y149.923 E.00528
G1 X79.736 Y149.759 E.00079
G1 X79.736 Y151.264 E.00535
G1 X79.586 Y151.118 E.00074
G1 X79.586 Y149.595 E.00541
G3 X79.436 Y149.416 I1.438 J-1.354 E.00083
G1 X79.436 Y150.958 E.00548
G1 X79.286 Y150.794 E.00079
G1 X79.286 Y149.231 E.00556
G1 X79.136 Y149.046 E.00085
G1 X79.136 Y150.63 E.00563
G1 X78.986 Y150.466 E.00079
G1 X78.986 Y148.861 E.00571
G3 X78.836 Y148.674 I1.501 J-1.357 E.00085
G1 X78.836 Y150.302 E.00579
G3 X78.686 Y150.127 I1.402 J-1.352 E.00082
G1 X78.686 Y148.465 E.00591
G1 X78.536 Y148.256 E.00091
G1 X78.536 Y149.942 E.00599
G1 X78.386 Y149.757 E.00085
G1 X78.386 Y148.047 E.00608
G1 X78.236 Y147.838 E.00091
G1 X78.236 Y149.572 E.00617
G1 X78.086 Y149.388 E.00085
G1 X78.086 Y147.606 E.00633
G1 X77.936 Y147.369 E.001
G1 X77.936 Y149.187 E.00646
G1 X77.786 Y148.978 E.00091
G1 X77.786 Y147.131 E.00657
G1 X77.636 Y146.894 E.001
G1 X77.636 Y148.769 E.00667
G1 X77.486 Y148.56 E.00091
G1 X77.486 Y146.627 E.00687
G1 X77.336 Y146.355 E.0011
G1 X77.336 Y148.349 E.00709
G1 X77.186 Y148.111 E.001
G1 X77.186 Y146.083 E.00721
G3 X77.036 Y145.799 I2.318 J-1.406 E.00114
G1 X77.036 Y147.874 E.00738
G1 X76.886 Y147.636 E.001
G1 X76.886 Y145.484 E.00765
G1 X76.736 Y145.169 E.00124
G1 X76.736 Y147.398 E.00792
G3 X76.586 Y147.129 I2.196 J-1.399 E.0011
G1 X76.586 Y144.849 E.00811
G1 X76.436 Y144.479 E.00142
G1 X76.436 Y146.857 E.00845
G1 X76.286 Y146.585 E.0011
G1 X76.286 Y144.109 E.0088
G3 X76.136 Y143.715 I3.244 J-1.461 E.0015
G1 X76.136 Y146.306 E.00921
G1 X75.986 Y145.991 E.00124
G1 X75.986 Y143.06 E.01042
G1 X75.836 Y142.576 F30000
G1 F3600
G1 X75.836 Y145.676 E.01102
G1 X75.686 Y145.361 E.00124
G1 X75.686 Y142.027 E.01185
G1 X75.536 Y141.404 F30000
M73 P98 R0
G1 F3600
G1 X75.536 Y145.001 E.01279
G1 X75.386 Y144.631 E.00142
G1 X75.386 Y140.691 E.01401
G1 X75.236 Y139.705 F30000
G1 F3600
G1 X75.236 Y144.441 E.01683
G1 X75.086 Y144.037 F30000
G1 F3600
G1 X75.086 Y137.467 E.02336
; WIPE_START
G1 F24000
G1 X75.086 Y139.467 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.111 J1.212 P1  F30000
G1 X112.286 Y136.059 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X112.286 Y130.738 E.01892
G2 X112.136 Y130.325 I-3.55 J1.058 E.00156
G1 X112.136 Y134.687 E.0155
G1 X111.986 Y133.791 F30000
G1 F3600
G1 X111.986 Y129.956 E.01363
G1 X111.836 Y129.586 E.00142
G1 X111.836 Y133.078 E.01241
G1 X111.686 Y132.506 F30000
G1 F3600
G1 X111.686 Y129.243 E.0116
G1 X111.536 Y128.928 E.00124
G1 X111.536 Y131.957 E.01077
G1 X111.386 Y131.504 F30000
G1 F3600
G1 X111.386 Y128.613 E.01028
G1 X111.283 Y128.398 E.00085
G2 X111.236 Y128.304 I-.815 J.354 E.00037
G1 X111.236 Y130.85 E.00905
G2 X111.086 Y130.478 I-3.202 J1.078 E.00142
G1 X111.086 Y128.032 E.00869
G1 X110.936 Y127.76 E.0011
G1 X110.936 Y130.108 E.00835
G2 X110.786 Y129.75 I-3.096 J1.085 E.00138
G1 X110.786 Y127.488 E.00804
G2 X110.636 Y127.229 I-2.257 J1.134 E.00106
G1 X110.636 Y129.435 E.00784
G1 X110.486 Y129.12 E.00124
G1 X110.486 Y126.992 E.00757
G1 X110.336 Y126.754 E.001
G1 X110.336 Y128.806 E.0073
G1 X110.186 Y128.534 E.0011
G1 X110.186 Y126.516 E.00717
G2 X110.036 Y126.285 I-2.024 J1.148 E.00098
G1 X110.036 Y128.262 E.00703
G1 X109.886 Y127.99 E.0011
G1 X109.886 Y126.076 E.0068
G1 X109.736 Y125.867 E.00091
G1 X109.736 Y127.734 E.00664
G1 X109.586 Y127.496 E.001
G1 X109.586 Y125.658 E.00653
G1 X109.436 Y125.449 E.00091
G1 X109.436 Y127.259 E.00643
G1 X109.286 Y127.021 E.001
G1 X109.286 Y125.256 E.00627
G1 X109.136 Y125.071 E.00085
G1 X109.136 Y126.798 E.00614
G1 X108.986 Y126.589 E.00091
G1 X108.986 Y124.886 E.00605
G1 X108.836 Y124.702 E.00085
G1 X108.836 Y126.38 E.00597
G1 X108.686 Y126.171 E.00091
G1 X108.686 Y124.517 E.00588
G2 X108.536 Y124.348 I-1.498 J1.179 E.0008
G1 X108.536 Y125.967 E.00576
G1 X108.386 Y125.782 E.00085
G1 X108.386 Y124.184 E.00568
G1 X108.236 Y124.02 E.00079
G1 X108.236 Y125.598 E.00561
G1 X108.086 Y125.413 E.00085
G1 X108.086 Y123.856 E.00553
G1 X107.936 Y123.692 E.00079
G1 X107.936 Y125.228 E.00546
G2 X107.786 Y125.055 I-1.534 J1.177 E.00081
G1 X107.786 Y123.537 E.00539
G1 X107.636 Y123.392 E.00074
G1 X107.636 Y124.891 E.00533
G1 X107.486 Y124.727 E.00079
G1 X107.486 Y123.246 E.00526
G1 X107.336 Y123.1 E.00074
G1 X107.336 Y124.563 E.0052
G1 X107.186 Y124.399 E.00079
G1 X107.186 Y122.955 E.00513
G1 X107.036 Y122.809 E.00074
G1 X107.036 Y124.245 E.00511
G1 X106.886 Y124.1 E.00074
G1 X106.886 Y122.678 E.00505
G1 X106.736 Y122.549 E.0007
G1 X106.736 Y123.954 E.00499
G1 X106.586 Y123.808 E.00074
G1 X106.586 Y122.42 E.00494
G1 X106.436 Y122.291 E.0007
G1 X106.436 Y123.663 E.00488
G2 X106.286 Y123.522 I-1.264 J1.193 E.00073
G1 X106.286 Y122.161 E.00484
G1 X106.136 Y122.032 E.0007
G1 X106.136 Y123.392 E.00484
G1 X105.986 Y123.263 E.0007
G1 X105.986 Y121.918 E.00478
G1 X105.836 Y121.803 E.00067
G1 X105.836 Y123.134 E.00473
G1 X105.686 Y123.005 E.0007
G1 X105.686 Y121.689 E.00468
G1 X105.536 Y121.574 E.00067
G1 X105.536 Y122.875 E.00463
G2 X105.386 Y122.756 I-1.08 J1.204 E.00068
G1 X105.386 Y121.46 E.00461
G1 X105.236 Y121.345 E.00067
G1 X105.236 Y122.642 E.00461
G1 X105.086 Y122.527 E.00067
G1 X105.086 Y121.242 E.00457
G1 X104.936 Y121.141 E.00064
G1 X104.936 Y122.413 E.00452
G1 X104.786 Y122.298 E.00067
G1 X104.786 Y121.04 E.00447
G1 X104.636 Y120.939 E.00064
G1 X104.636 Y122.184 E.00443
G2 X104.486 Y122.08 I-.948 J1.212 E.00065
G1 X104.486 Y120.838 E.00442
G1 X104.336 Y120.737 E.00064
G1 X104.336 Y121.979 E.00442
G1 X104.186 Y121.878 E.00064
G1 X104.186 Y120.64 E.0044
G1 X104.036 Y120.551 E.00062
G1 X104.036 Y121.777 E.00436
G1 X103.886 Y121.676 E.00064
G1 X103.886 Y120.463 E.00431
G1 X103.736 Y120.374 E.00062
G1 X103.736 Y121.575 E.00427
G2 X103.586 Y121.482 I-.855 J1.217 E.00063
G1 X103.586 Y120.285 E.00425
G1 X103.436 Y120.197 E.00062
G1 X103.436 Y121.394 E.00425
G1 X103.286 Y121.305 E.00062
G1 X103.286 Y120.108 E.00425
G2 X103.136 Y120.027 I-.759 J1.223 E.00061
G1 X103.136 Y121.216 E.00423
G1 X102.986 Y121.128 E.00062
G1 X102.986 Y119.95 E.00419
G1 X102.836 Y119.873 E.0006
G1 X102.836 Y121.039 E.00415
G2 X102.686 Y120.954 I-.79 J1.221 E.00061
G1 X102.686 Y119.796 E.00412
G1 X102.536 Y119.719 E.0006
G1 X102.536 Y120.877 E.00412
G1 X102.386 Y120.8 E.0006
G1 X102.386 Y119.642 E.00412
G1 X102.236 Y119.565 E.0006
G1 X102.236 Y120.723 E.00412
G1 X102.086 Y120.646 E.0006
G1 X102.086 Y119.496 E.00409
G1 X101.936 Y119.43 E.00058
G1 X101.936 Y120.569 E.00405
G1 X101.786 Y120.492 E.0006
G1 X101.786 Y119.364 E.00401
G1 X101.636 Y119.298 E.00058
G1 X101.636 Y120.424 E.004
G1 X101.486 Y120.358 E.00058
G1 X101.486 Y119.232 E.004
G1 X101.336 Y119.166 E.00058
G1 X101.336 Y120.292 E.004
G1 X101.186 Y120.225 E.00058
G1 X101.186 Y119.099 E.004
G2 X101.036 Y119.039 I-.582 J1.234 E.00057
G1 X101.036 Y120.159 E.00398
G1 X100.886 Y120.093 E.00058
G1 X100.886 Y118.984 E.00394
G1 X100.736 Y118.928 E.00057
G1 X100.736 Y120.027 E.00391
G1 X100.586 Y119.971 E.00057
G1 X100.586 Y118.872 E.00391
G1 X100.436 Y118.816 E.00057
G1 X100.436 Y119.916 E.00391
G1 X100.286 Y119.86 E.00057
G1 X100.286 Y118.761 E.00391
G1 X100.136 Y118.705 E.00057
G1 X100.136 Y119.804 E.00391
G1 X99.986 Y119.749 E.00057
G1 X99.986 Y118.652 E.0039
G1 X99.836 Y118.606 E.00056
G1 X99.836 Y119.693 E.00386
G1 X99.686 Y119.638 E.00057
G1 X99.686 Y118.56 E.00383
G1 X99.536 Y118.515 E.00056
G1 X99.536 Y119.592 E.00383
G1 X99.386 Y119.546 E.00056
G1 X99.386 Y118.469 E.00383
G1 X99.236 Y118.423 E.00056
G1 X99.236 Y119.5 E.00383
G1 X99.086 Y119.455 E.00056
G1 X99.086 Y118.377 E.00383
G1 X98.936 Y118.331 E.00056
G1 X98.936 Y119.409 E.00383
G1 X98.786 Y119.363 E.00056
G1 X98.786 Y118.293 E.0038
G1 X98.636 Y118.257 E.00055
G1 X98.636 Y119.317 E.00377
G1 X98.486 Y119.281 E.00055
G1 X98.486 Y118.221 E.00377
G1 X98.336 Y118.185 E.00055
G1 X98.336 Y119.245 E.00377
G1 X98.186 Y119.208 E.00055
G1 X98.186 Y118.148 E.00377
G1 X98.036 Y118.112 E.00055
G1 X98.036 Y119.172 E.00377
G1 X97.886 Y119.136 E.00055
G1 X97.886 Y118.076 E.00377
G2 X97.736 Y118.042 I-.362 J1.247 E.00055
G1 X97.736 Y119.1 E.00376
G1 X97.586 Y119.063 E.00055
G1 X97.586 Y118.015 E.00373
G1 X97.436 Y117.988 E.00054
G1 X97.436 Y119.035 E.00372
G1 X97.286 Y119.008 E.00054
G1 X97.286 Y117.961 E.00372
G1 X97.136 Y117.934 E.00054
G1 X97.136 Y118.981 E.00372
G1 X96.986 Y118.954 E.00054
G1 X96.986 Y117.907 E.00372
G1 X96.836 Y117.88 E.00054
G1 X96.836 Y118.927 E.00372
G1 X96.686 Y118.9 E.00054
G1 X96.686 Y117.853 E.00372
G2 X96.536 Y117.831 I-.259 J1.253 E.00054
G1 X96.536 Y118.873 E.0037
G2 X96.386 Y118.851 I-.26 J1.253 E.00054
G1 X96.386 Y117.813 E.00369
G1 X96.236 Y117.796 E.00054
G1 X96.236 Y118.833 E.00369
G1 X96.086 Y118.815 E.00054
G1 X96.086 Y117.778 E.00369
G1 X95.936 Y117.76 E.00054
G1 X95.936 Y118.798 E.00369
G1 X95.786 Y118.78 E.00054
G1 X95.786 Y117.742 E.00369
G1 X95.636 Y117.724 E.00054
G1 X95.636 Y118.762 E.00369
G1 X95.486 Y118.744 E.00054
G1 X95.486 Y117.706 E.00369
G2 X95.336 Y117.696 I-.163 J1.258 E.00053
G1 X95.336 Y118.728 E.00367
G1 X95.186 Y118.719 E.00053
G1 X95.186 Y117.687 E.00367
G1 X95.036 Y117.678 E.00053
G1 X95.036 Y118.71 E.00367
G1 X94.886 Y118.701 E.00053
G1 X94.886 Y117.669 E.00367
G1 X94.736 Y117.66 E.00053
G1 X94.736 Y118.692 E.00367
G1 X94.586 Y118.684 E.00053
G1 X94.586 Y117.651 E.00367
G1 X94.436 Y117.642 E.00053
G1 X94.436 Y118.675 E.00367
G1 X94.286 Y118.666 E.00053
G1 X94.286 Y117.634 E.00367
G1 X94.136 Y117.634 E.00053
G1 X94.136 Y118.664 E.00366
G1 X93.986 Y118.664 E.00053
G1 X93.986 Y117.634 E.00366
G1 X93.836 Y117.634 E.00053
G1 X93.836 Y118.664 E.00366
G1 X93.686 Y118.664 E.00053
G1 X93.686 Y117.634 E.00366
G1 X93.536 Y117.634 E.00053
G1 X93.536 Y118.664 E.00366
G1 X93.386 Y118.664 E.00053
G1 X93.386 Y117.634 E.00366
G1 X93.236 Y117.634 E.00053
G1 X93.236 Y118.664 E.00366
G2 X93.086 Y118.669 I-.04 J1.266 E.00053
G1 X93.086 Y117.636 E.00367
G1 X92.936 Y117.645 E.00053
G1 X92.936 Y118.677 E.00367
G1 X92.786 Y118.686 E.00053
G1 X92.786 Y117.654 E.00367
G1 X92.636 Y117.663 E.00053
G1 X92.636 Y118.695 E.00367
G1 X92.486 Y118.704 E.00053
G1 X92.486 Y117.672 E.00367
G1 X92.336 Y117.681 E.00053
G1 X92.336 Y118.713 E.00367
G1 X92.186 Y118.722 E.00053
G1 X92.186 Y117.69 E.00367
G1 X92.036 Y117.699 E.00053
G1 X92.036 Y118.732 E.00367
G1 X91.886 Y118.749 E.00054
G1 X91.886 Y117.712 E.00369
G1 X91.736 Y117.73 E.00054
G1 X91.736 Y118.767 E.00369
G1 X91.586 Y118.785 E.00054
G1 X91.586 Y117.747 E.00369
G1 X91.436 Y117.765 E.00054
G1 X91.436 Y118.803 E.00369
G1 X91.286 Y118.821 E.00054
G1 X91.286 Y117.783 E.00369
G1 X91.136 Y117.801 E.00054
G1 X91.136 Y118.839 E.00369
G1 X90.986 Y118.857 E.00054
G1 X90.986 Y117.819 E.00369
G1 X90.836 Y117.837 E.00054
G1 X90.836 Y118.881 E.00371
G1 X90.686 Y118.908 E.00054
G1 X90.686 Y117.861 E.00372
G1 X90.536 Y117.888 E.00054
G1 X90.536 Y118.935 E.00372
G1 X90.386 Y118.962 E.00054
G1 X90.386 Y117.915 E.00372
G1 X90.236 Y117.942 E.00054
G1 X90.236 Y118.989 E.00372
G1 X90.086 Y119.016 E.00054
G1 X90.086 Y117.969 E.00372
G1 X89.936 Y117.996 E.00054
G1 X89.936 Y119.043 E.00372
G2 X89.786 Y119.075 I.19 J1.279 E.00055
G1 X89.786 Y118.023 E.00374
G1 X89.636 Y118.051 E.00054
G1 X89.636 Y119.111 E.00377
G1 X89.486 Y119.147 E.00055
G1 X89.486 Y118.087 E.00377
G1 X89.336 Y118.123 E.00055
G1 X89.336 Y119.183 E.00377
G1 X89.186 Y119.22 E.00055
G1 X89.186 Y118.159 E.00377
G1 X89.036 Y118.196 E.00055
G1 X89.036 Y119.256 E.00377
G1 X88.886 Y119.292 E.00055
G1 X88.886 Y118.232 E.00377
G1 X88.736 Y118.268 E.00055
G1 X88.736 Y119.331 E.00378
G1 X88.586 Y119.377 E.00056
G1 X88.586 Y118.304 E.00381
G2 X88.436 Y118.345 I.27 J1.284 E.00055
G1 X88.436 Y119.423 E.00383
G1 X88.286 Y119.469 E.00056
G1 X88.286 Y118.391 E.00383
G1 X88.136 Y118.437 E.00056
G1 X88.136 Y119.514 E.00383
G1 X87.986 Y119.56 E.00056
G1 X87.986 Y118.483 E.00383
G1 X87.836 Y118.529 E.00056
G1 X87.836 Y119.606 E.00383
G1 X87.777 Y119.624 E.00022
G2 X87.686 Y119.654 I.209 J.784 E.00034
G1 X87.686 Y118.574 E.00384
G1 X87.536 Y118.62 E.00056
G1 X87.536 Y119.71 E.00387
G1 X87.386 Y119.766 E.00057
G1 X87.386 Y118.666 E.00391
G1 X87.236 Y118.722 E.00057
G1 X87.236 Y119.821 E.00391
G1 X87.086 Y119.877 E.00057
G1 X87.086 Y118.778 E.00391
G1 X86.936 Y118.834 E.00057
G1 X86.936 Y119.933 E.00391
G1 X86.786 Y119.989 E.00057
G1 X86.786 Y118.889 E.00391
G1 X86.636 Y118.945 E.00057
G1 X86.636 Y120.048 E.00392
G1 X86.486 Y120.114 E.00058
G1 X86.486 Y119.001 E.00396
G1 X86.336 Y119.056 E.00057
G1 X86.336 Y120.18 E.00399
G1 X86.186 Y120.246 E.00058
G1 X86.186 Y119.12 E.004
G1 X86.036 Y119.186 E.00058
G1 X86.036 Y120.312 E.004
G1 X85.886 Y120.378 E.00058
G1 X85.886 Y119.252 E.004
G1 X85.736 Y119.318 E.00058
G1 X85.736 Y120.444 E.004
G2 X85.586 Y120.516 I.533 J1.3 E.00059
G1 X85.586 Y119.384 E.00402
G1 X85.436 Y119.45 E.00058
G1 X85.436 Y120.593 E.00406
G1 X85.286 Y120.67 E.0006
G1 X85.286 Y119.516 E.0041
G2 X85.136 Y119.589 I.537 J1.3 E.00059
G1 X85.136 Y120.747 E.00412
G1 X84.986 Y120.824 E.0006
G1 X84.986 Y119.666 E.00412
G1 X84.836 Y119.743 E.0006
G1 X84.836 Y120.901 E.00412
G1 X84.686 Y120.978 E.0006
G1 X84.686 Y119.82 E.00412
G1 X84.536 Y119.897 E.0006
G1 X84.536 Y121.066 E.00416
G1 X84.386 Y121.155 E.00062
G1 X84.386 Y119.974 E.0042
G1 X84.236 Y120.051 E.0006
G1 X84.236 Y121.244 E.00424
G1 X84.086 Y121.332 E.00062
G1 X84.086 Y120.135 E.00425
G1 X83.936 Y120.224 E.00062
G1 X83.936 Y121.421 E.00425
G1 X83.786 Y121.509 E.00062
G1 X83.786 Y120.313 E.00425
G1 X83.636 Y120.401 E.00062
G1 X83.636 Y121.606 E.00428
G1 X83.486 Y121.707 E.00064
G1 X83.486 Y120.49 E.00433
G1 X83.336 Y120.578 E.00062
G1 X83.336 Y121.808 E.00437
G1 X83.186 Y121.909 E.00064
G1 X83.186 Y120.667 E.00441
G1 X83.036 Y120.767 E.00064
G1 X83.036 Y122.01 E.00442
G1 X82.886 Y122.111 E.00064
G1 X82.886 Y120.869 E.00442
G1 X82.736 Y120.97 E.00064
G1 X82.736 Y122.219 E.00444
G1 X82.586 Y122.333 E.00067
G1 X82.586 Y121.071 E.00449
G1 X82.436 Y121.172 E.00064
G1 X82.436 Y122.448 E.00454
G1 X82.286 Y122.562 E.00067
G1 X82.286 Y121.273 E.00458
G2 X82.136 Y121.38 I.832 J1.318 E.00066
G1 X82.136 Y122.677 E.00461
G1 X81.986 Y122.791 E.00067
G1 X81.986 Y121.495 E.00461
G1 X81.836 Y121.609 E.00067
G1 X81.836 Y122.915 E.00464
G1 X81.686 Y123.044 E.0007
G1 X81.686 Y121.724 E.00469
G1 X81.536 Y121.838 E.00067
G1 X81.536 Y123.174 E.00475
G1 X81.386 Y123.303 E.0007
G1 X81.386 Y121.953 E.0048
G2 X81.236 Y122.072 I.927 J1.323 E.00068
G1 X81.236 Y123.432 E.00484
G1 X81.086 Y123.562 E.00071
G1 X81.086 Y122.201 E.00484
G1 X80.936 Y122.33 E.0007
G1 X80.936 Y123.707 E.0049
G1 X80.786 Y123.853 E.00074
G1 X80.786 Y122.46 E.00495
G1 X80.636 Y122.589 E.0007
G1 X80.636 Y123.999 E.00501
G1 X80.486 Y124.144 E.00074
G1 X80.486 Y122.718 E.00507
G2 X80.336 Y122.854 I1.068 J1.332 E.00072
G1 X80.336 Y124.29 E.00511
G2 X80.186 Y124.449 I1.265 J1.343 E.00078
G1 X80.186 Y122.999 E.00515
G1 X80.036 Y123.145 E.00074
G1 X80.036 Y124.613 E.00522
G1 X79.886 Y124.777 E.00079
G1 X79.886 Y123.291 E.00528
G1 X79.736 Y123.436 E.00074
G1 X79.736 Y124.941 E.00535
G1 X79.586 Y125.105 E.00079
G1 X79.586 Y123.582 E.00541
G2 X79.436 Y123.742 I1.276 J1.344 E.00078
G1 X79.436 Y125.284 E.00548
G1 X79.286 Y125.469 E.00085
G1 X79.286 Y123.906 E.00556
G1 X79.136 Y124.07 E.00079
G1 X79.136 Y125.654 E.00563
G1 X78.986 Y125.839 E.00085
G1 X78.986 Y124.234 E.00571
G1 X78.836 Y124.398 E.00079
G1 X78.836 Y126.026 E.00579
G1 X78.686 Y126.235 E.00091
G1 X78.686 Y124.573 E.00591
G1 X78.536 Y124.758 E.00085
G1 X78.536 Y126.444 E.00599
G1 X78.386 Y126.653 E.00091
G1 X78.386 Y124.943 E.00608
G1 X78.236 Y125.128 E.00085
G1 X78.236 Y126.862 E.00617
G2 X78.086 Y127.094 I1.876 J1.38 E.00098
G1 X78.086 Y125.313 E.00633
G2 X77.936 Y125.513 I1.611 J1.364 E.00089
G1 X77.936 Y127.332 E.00646
G1 X77.786 Y127.569 E.001
G1 X77.786 Y125.722 E.00657
G1 X77.636 Y125.931 E.00091
G1 X77.636 Y127.807 E.00667
G2 X77.486 Y128.073 I2.172 J1.397 E.00109
G1 X77.486 Y126.14 E.00687
G2 X77.336 Y126.352 I1.707 J1.369 E.00092
G1 X77.336 Y128.346 E.00709
G1 X77.186 Y128.618 E.0011
G1 X77.186 Y126.589 E.00721
G1 X77.036 Y126.827 E.001
G1 X77.036 Y128.902 E.00738
G1 X76.886 Y129.217 E.00124
G1 X76.886 Y127.064 E.00765
G1 X76.736 Y127.302 E.001
G1 X76.736 Y129.531 E.00792
G2 X76.586 Y129.852 I2.624 J1.424 E.00126
G1 X76.586 Y127.572 E.00811
G1 X76.436 Y127.844 E.0011
G1 X76.436 Y130.222 E.00845
G1 X76.286 Y130.592 E.00142
G1 X76.285 Y128.116 E.0088
G2 X76.136 Y128.395 I2.272 J1.4 E.00112
G1 X76.136 Y131.196 E.00996
G1 X75.986 Y131.64 F30000
G1 F3600
G1 X75.986 Y128.71 E.01042
G1 X75.836 Y129.025 E.00124
G1 X75.836 Y132.125 E.01102
G1 X75.686 Y132.674 F30000
G1 F3600
G1 X75.686 Y129.34 E.01185
G2 X75.536 Y129.699 I9.633 J4.23 E.00138
G1 X75.536 Y133.297 E.01279
G1 X75.386 Y134.009 F30000
G1 F3600
G1 X75.386 Y130.069 E.01401
G1 X75.236 Y130.439 E.00142
G1 X75.236 Y134.995 E.0162
; WIPE_START
G1 F24000
G1 X75.236 Y132.995 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.216 J-.043 P1  F30000
G1 X75.086 Y137.233 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X75.086 Y130.663 E.02336
G1 X74.936 Y131.107 F30000
G1 F3600
G1 X74.936 Y143.594 E.04439
G1 X74.786 Y143.15 F30000
G1 F3600
G1 X74.786 Y131.55 E.04123
G1 X74.636 Y132.095 F30000
G1 F3600
G1 X74.636 Y142.606 E.03736
G1 X74.486 Y142.057 F30000
G1 F3600
G1 X74.486 Y132.644 E.03346
G1 X74.336 Y133.339 F30000
G1 F3600
G1 X74.336 Y141.361 E.02852
G1 X74.186 Y140.565 F30000
G1 F3600
G1 X74.186 Y134.135 E.02286
; WIPE_START
G1 F24000
G1 X74.186 Y136.135 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.201 J-.199 P1  F30000
G1 X74.036 Y135.228 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
G1 X74.036 Y139.473 E.01509
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X74.036 Y137.473 E-.76
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
G1 Z3.5 F900 ; lower z a little
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

    G1 Z103 F600
    G1 Z101

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

