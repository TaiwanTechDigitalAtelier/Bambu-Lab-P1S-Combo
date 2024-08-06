; HEADER_BLOCK_START
; BambuStudio 01.06.01.02
; model printing time: 6m 44s; total estimated time: 12m 33s
; total layer number: 25
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; additional_cooling_fan_speed = 70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_difference = 10
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
; close_fan_the_first_x_layers = 1
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = brim_type;fan_max_speed;fan_min_speed;filament_deretraction_speed;filament_retract_when_changing_layer;filament_retraction_length;filament_retraction_minimum_travel;filament_retraction_speed;filament_wipe;filament_wipe_distance;filament_z_hop;slow_down_layer_time;
; draft_shield = disabled
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 56
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; fan_cooling_layer_time = 100
; fan_max_speed = 70
; fan_min_speed = 70
; filament_colour = #00AE42
; filament_cost = 24.99
; filament_density = 1.26
; filament_deretraction_speed = 30
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98
; filament_ids = GFA00
; filament_is_support = 0
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_retract_when_changing_layer = 1
; filament_retraction_length = 0.8
; filament_retraction_minimum_travel = 1
; filament_retraction_speed = 30
; filament_settings_id = "Bambu PLA Basic @BBL X1"
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filament_wipe = 1
; filament_wipe_distance = 2
; filament_z_hop = 0.4
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; host_type = octoprint
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; independent_support_layer_height = 1
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
; ironing_flow = 10%
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
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
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
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
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
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
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
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
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 2
; slow_down_min_speed = 20
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
; temperature_vitrification = 55
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
; thick_bridges = 0
; timelapse_type = 0
; top_shell_layers = 3
; top_shell_thickness = 0.6
; top_surface_acceleration = 2000
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
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
; wipe_tower_y = 240
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Spiral Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R12
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
M73 P34 R8
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
M73 P35 R8
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
M73 P37 R7
G1 X76 F15000
M73 P39 R7
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
M73 P40 R7
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
    G29 A X83.7239 Y92.1248 I43.9995 J87.12
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
M73 P41 R7
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
; filament start gcode
M106 P3 S255
M981 S1 P20000 ;open spaghetti detector
M106 S0
M106 P2 S0
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/25
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
G1 X112.028 Y120.941 F30000
G1 Z.4
G1 Z.2
M73 P42 R7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X112.028 Y168.807 E1.78284
G3 X99.419 Y168.807 I-6.304 J-.015 E.73656
G1 X99.419 Y120.941 E1.78284
G1 X111.968 Y120.941 E.46739
G1 X111.571 Y121.398 F30000
; FEATURE: Outer wall
G1 F3000
G1 X111.571 Y168.802 E1.76563
M73 P43 R7
G3 X99.876 Y168.802 I-5.847 J-.01 E.68347
G1 X99.876 Y121.398 E1.76563
G1 X111.511 Y121.398 E.43334
; WIPE_START
G1 F24000
G1 X111.513 Y123.398 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.202 J.191 P1  F30000
G1 X112.109 Y119.655 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
M73 P44 R7
G1 F3000
M73 P44 R6
G1 X99.329 Y119.655 E.47603
G1 X99.171 Y115.896 E.14011
G2 X96.932 Y109.905 I-17.08 J2.967 E.23961
G1 X93.536 Y104.301 E.24407
G1 X94.028 Y103.428 E.03732
G1 X117.42 Y103.428 E.87126
G1 X117.911 Y104.301 E.03732
G1 X114.515 Y109.905 E.24407
G2 X112.276 Y115.896 I14.862 J8.967 E.2396
G1 X112.121 Y119.604 E.13822
G1 X111.68 Y119.198 F30000
; FEATURE: Outer wall
G1 F3000
G1 X99.767 Y119.198 E.44373
G1 X99.626 Y115.844 E.12503
M73 P45 R6
G2 X97.326 Y109.672 I-17.549 J3.027 E.24675
G1 X94.065 Y104.292 E.23429
G1 X94.295 Y103.885 E.01742
G1 X117.152 Y103.885 E.85136
G1 X117.382 Y104.292 E.01742
G1 X114.122 Y109.672 E.23429
G2 X111.821 Y115.844 I15.269 J9.206 E.24674
G1 X111.683 Y119.138 E.1228
; WIPE_START
G1 F24000
G1 X109.683 Y119.148 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.028 J.651 P1  F30000
G1 X126.538 Y92.548 Z.6
G1 Z.2
M73 P46 R6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X115.605 Y110.587 E.78563
G2 X113.314 Y118.789 I13.653 J8.235 E.32109
G1 X113.314 Y168.788 E1.8623
G3 X98.134 Y168.788 I-7.59 J.002 E.88828
G1 X98.134 Y118.789 E1.8623
G2 X95.842 Y110.587 I-15.944 J.033 E.32109
G1 X84.912 Y92.548 E.78559
G1 X126.478 Y92.548 E1.54818
; WIPE_START
G1 F24000
G1 X125.445 Y94.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.118 J.481 P1  F30000
G1 X126.98 Y90.697 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G3 X127.088 Y92.523 I-1.27 J.991 E.07243
G1 X115.999 Y110.819 E.79687
M73 P47 R6
G2 X113.771 Y118.793 I13.259 J8.002 E.31217
G1 X113.771 Y168.793 E1.86231
G3 X97.676 Y168.793 I-8.047 J-.003 E.94137
G1 X97.676 Y118.793 E1.86231
G2 X95.449 Y110.819 I-15.487 J.028 E.31217
G1 X84.321 Y92.455 E.79976
G3 X84.625 Y90.525 I1.41 J-.767 E.07827
G1 X126.824 Y90.525 E1.57173
G1 X126.842 Y90.543 E.00097
G3 X126.942 Y90.651 I-1.133 J1.145 E.00548
; WIPE_START
G1 F24000
G1 X127.167 Y90.997 E-.15685
G1 X127.243 Y91.185 E-.07707
G1 X127.306 Y91.45 E-.10351
G1 X127.323 Y91.725 E-.10457
G1 X127.292 Y92.003 E-.10648
G1 X127.186 Y92.336 E-.13262
G1 X127.089 Y92.519 E-.07889
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J.041 P1  F30000
G1 X127.107 Y91.987 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50072
G1 F6300
G1 X126.033 Y90.913 E.05667
G1 X125.386 Y90.913 E.02415
G1 X126.632 Y92.159 E.06574
G1 X125.984 Y92.159 E.02415
G1 X124.738 Y90.913 E.06574
G1 X124.091 Y90.913 E.02415
G1 X125.337 Y92.159 E.06574
G1 X124.689 Y92.159 E.02415
G1 X123.443 Y90.913 E.06574
G1 X122.796 Y90.913 E.02415
G1 X124.042 Y92.159 E.06574
G1 X123.394 Y92.159 E.02415
G1 X122.148 Y90.913 E.06574
G1 X121.501 Y90.913 E.02415
G1 X122.747 Y92.159 E.06574
M73 P48 R6
G1 X122.1 Y92.159 E.02415
G1 X120.854 Y90.913 E.06574
G1 X120.206 Y90.913 E.02415
G1 X121.452 Y92.159 E.06574
G1 X120.805 Y92.159 E.02415
G1 X119.559 Y90.913 E.06574
G1 X118.911 Y90.913 E.02415
G1 X120.157 Y92.159 E.06574
G1 X119.51 Y92.159 E.02415
G1 X118.264 Y90.913 E.06574
G1 X117.616 Y90.913 E.02415
G1 X118.863 Y92.159 E.06574
G1 X118.215 Y92.159 E.02415
G1 X116.969 Y90.913 E.06574
G1 X116.322 Y90.913 E.02415
G1 X117.568 Y92.159 E.06574
G1 X116.92 Y92.159 E.02415
G1 X115.674 Y90.913 E.06574
G1 X115.027 Y90.913 E.02415
G1 X116.273 Y92.159 E.06574
G1 X115.625 Y92.159 E.02415
G1 X114.379 Y90.913 E.06574
G1 X113.732 Y90.913 E.02415
G1 X114.978 Y92.159 E.06574
G1 X114.331 Y92.159 E.02415
G1 X113.085 Y90.913 E.06574
G1 X112.437 Y90.913 E.02415
G1 X113.683 Y92.159 E.06574
G1 X113.036 Y92.159 E.02415
G1 X111.79 Y90.913 E.06574
G1 X111.142 Y90.913 E.02415
G1 X112.388 Y92.159 E.06573
G1 X111.741 Y92.159 E.02415
M73 P49 R6
G1 X110.495 Y90.913 E.06573
G1 X109.847 Y90.913 E.02415
G1 X111.093 Y92.159 E.06573
G1 X110.446 Y92.159 E.02415
G1 X109.2 Y90.913 E.06573
G1 X108.553 Y90.913 E.02415
G1 X109.799 Y92.159 E.06573
G1 X109.151 Y92.159 E.02415
G1 X107.905 Y90.913 E.06573
G1 X107.258 Y90.913 E.02415
G1 X108.504 Y92.159 E.06573
G1 X107.856 Y92.159 E.02415
G1 X106.61 Y90.913 E.06573
G1 X105.963 Y90.913 E.02415
G1 X107.209 Y92.159 E.06573
G1 X106.561 Y92.159 E.02415
G1 X105.315 Y90.913 E.06573
G1 X104.668 Y90.913 E.02415
G1 X105.914 Y92.159 E.06573
G1 X105.267 Y92.159 E.02415
G1 X104.021 Y90.913 E.06573
G1 X103.373 Y90.913 E.02415
G1 X104.619 Y92.159 E.06573
G1 X103.972 Y92.159 E.02415
G1 X102.726 Y90.913 E.06573
G1 X102.078 Y90.913 E.02415
G1 X103.324 Y92.159 E.06573
G1 X102.677 Y92.159 E.02415
G1 X101.431 Y90.913 E.06573
G1 X100.783 Y90.913 E.02415
G1 X102.029 Y92.159 E.06573
G1 X101.382 Y92.159 E.02415
G1 X100.136 Y90.914 E.06573
G1 X99.489 Y90.914 E.02415
G1 X100.735 Y92.159 E.06573
G1 X100.087 Y92.159 E.02415
G1 X98.841 Y90.914 E.06573
G1 X98.194 Y90.914 E.02415
G1 X99.44 Y92.159 E.06573
G1 X98.792 Y92.159 E.02415
G1 X97.546 Y90.914 E.06573
G1 X96.899 Y90.914 E.02415
G1 X98.145 Y92.159 E.06573
G1 X97.497 Y92.159 E.02415
G1 X96.252 Y90.914 E.06573
G1 X95.604 Y90.914 E.02415
G1 X96.85 Y92.159 E.06573
G1 X96.203 Y92.159 E.02415
G1 X94.957 Y90.914 E.06573
G1 X94.309 Y90.914 E.02415
G1 X95.555 Y92.159 E.06573
G1 X94.908 Y92.159 E.02415
G1 X93.662 Y90.914 E.06573
G1 X93.014 Y90.914 E.02415
G1 X94.26 Y92.159 E.06573
G1 X93.613 Y92.159 E.02415
G1 X92.367 Y90.914 E.06573
G1 X91.72 Y90.914 E.02415
G1 X92.965 Y92.159 E.06573
G1 X92.318 Y92.159 E.02415
G1 X91.072 Y90.914 E.06573
G1 X90.425 Y90.914 E.02415
G1 X91.671 Y92.159 E.06573
G1 X91.023 Y92.159 E.02415
G1 X89.777 Y90.914 E.06573
G1 X89.13 Y90.914 E.02415
G1 X90.376 Y92.159 E.06573
G1 X89.728 Y92.159 E.02415
G1 X88.482 Y90.914 E.06573
G1 X87.835 Y90.914 E.02415
G1 X89.081 Y92.159 E.06573
G1 X88.433 Y92.159 E.02415
G1 X87.188 Y90.914 E.06573
G1 X86.54 Y90.914 E.02415
G1 X87.786 Y92.159 E.06573
G1 X87.139 Y92.159 E.02415
G1 X85.893 Y90.914 E.06573
G1 X85.245 Y90.914 E.02415
G1 X86.491 Y92.159 E.06573
G1 X85.844 Y92.159 E.02415
G1 X84.709 Y91.025 E.05985
G2 X84.53 Y91.493 I1.157 J.712 E.0188
G1 X85.402 Y92.365 E.04601
; WIPE_START
G1 F24000
G1 X84.53 Y91.493 E-.4687
G1 X84.592 Y91.255 E-.09335
G1 X84.709 Y91.025 E-.0982
G1 X84.895 Y91.211 E-.09975
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.046 J1.216 P1  F30000
G1 X125.304 Y92.731 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.50132
G1 F6300
G1 X125.72 Y93.147 E.02199
G1 X125.476 Y93.551 E.01763
G1 X124.862 Y92.936 E.03245
G1 X124.213 Y92.936 E.02422
G1 X125.231 Y93.954 E.05377
G1 X124.987 Y94.358 E.01763
G1 X123.565 Y92.936 E.07509
G1 X122.917 Y92.936 E.02422
G1 X124.742 Y94.762 E.09642
G1 X124.497 Y95.165 E.01763
G1 X122.269 Y92.936 E.11774
G1 X121.62 Y92.936 E.02422
G1 X124.253 Y95.569 E.13906
G1 X124.008 Y95.972 E.01763
G1 X120.972 Y92.936 E.16038
G1 X120.324 Y92.936 E.02422
G1 X123.763 Y96.376 E.18171
G1 X123.519 Y96.78 E.01763
G1 X119.675 Y92.936 E.20303
G1 X119.027 Y92.936 E.02422
G1 X123.274 Y97.183 E.22435
G1 X123.03 Y97.587 E.01763
G1 X118.379 Y92.936 E.24568
G1 X117.731 Y92.936 E.02422
G1 X122.785 Y97.991 E.267
G1 X122.54 Y98.394 E.01763
M73 P50 R6
G1 X117.082 Y92.936 E.28832
G1 X116.434 Y92.936 E.02422
G1 X122.296 Y98.798 E.30965
G1 X122.051 Y99.202 E.01763
G1 X115.786 Y92.936 E.33097
G1 X115.137 Y92.936 E.02422
G1 X121.806 Y99.605 E.35229
G1 X121.562 Y100.009 E.01763
G1 X114.489 Y92.936 E.37361
G1 X113.841 Y92.936 E.02422
G1 X121.317 Y100.413 E.39494
G1 X121.072 Y100.816 E.01763
G1 X113.193 Y92.936 E.41626
G1 X112.544 Y92.936 E.02422
G1 X120.828 Y101.22 E.43758
G1 X120.583 Y101.624 E.01763
G1 X111.896 Y92.936 E.45891
G1 X111.248 Y92.936 E.02422
G1 X120.339 Y102.027 E.48023
G1 X120.094 Y102.431 E.01763
G1 X110.6 Y92.936 E.50155
G1 X109.951 Y92.936 E.02422
G1 X119.849 Y102.834 E.52287
G1 X119.605 Y103.238 E.01763
G1 X109.303 Y92.936 E.5442
G1 X108.655 Y92.936 E.02422
G1 X119.36 Y103.642 E.56552
G1 X119.115 Y104.045 E.01763
G1 X108.006 Y92.936 E.58684
G1 X107.358 Y92.936 E.02422
G1 X118.871 Y104.449 E.60817
G1 X118.626 Y104.853 E.01763
G1 X118.256 Y104.482 E.01957
G1 X118.011 Y104.886 E.01763
G1 X118.381 Y105.256 E.01957
G1 X118.137 Y105.66 E.01763
G1 X117.766 Y105.289 E.01957
G1 X117.522 Y105.693 E.01763
G1 X117.892 Y106.064 E.01957
G1 X117.648 Y106.467 E.01763
G1 X117.277 Y106.097 E.01957
G1 X117.032 Y106.5 E.01763
G1 X117.403 Y106.871 E.01957
G1 X117.158 Y107.275 E.01763
G1 X116.788 Y106.904 E.01957
G1 X116.543 Y107.308 E.01763
G1 X116.914 Y107.678 E.01957
G1 X116.669 Y108.082 E.01763
G1 X116.299 Y107.711 E.01957
G1 X116.054 Y108.115 E.01763
G1 X116.424 Y108.485 E.01957
G1 X116.18 Y108.889 E.01763
G1 X115.809 Y108.519 E.01957
G1 X115.565 Y108.922 E.01763
G1 X115.935 Y109.293 E.01957
G1 X115.691 Y109.696 E.01763
G1 X115.32 Y109.326 E.01957
G1 X115.075 Y109.73 E.01763
G1 X115.446 Y110.1 E.01957
G2 X115.203 Y110.506 I9.555 J5.988 E.01766
G1 X114.831 Y110.134 E.01965
G1 X114.594 Y110.545 E.01773
G1 X114.966 Y110.917 E.01965
G2 X114.741 Y111.34 I4.943 J2.889 E.01792
G1 X114.365 Y110.964 E.01988
G2 X114.144 Y111.391 I5.115 J2.922 E.01797
G1 X114.526 Y111.773 E.02017
G2 X114.319 Y112.215 I5.164 J2.684 E.01822
G1 X113.936 Y111.832 E.02022
G2 X113.739 Y112.283 I5.28 J2.577 E.0184
G1 X114.127 Y112.671 E.0205
G2 X113.946 Y113.138 I5.482 J2.39 E.01873
G1 X113.551 Y112.743 E.02087
G1 X113.376 Y113.216 E.01884
G1 X113.776 Y113.617 E.02115
M73 P51 R6
G2 X113.617 Y114.106 I5.75 J2.136 E.01923
G1 X113.214 Y113.703 E.02131
G2 X113.063 Y114.2 I5.858 J2.043 E.01943
G1 X113.476 Y114.613 E.02179
G2 X113.347 Y115.133 I6.131 J1.79 E.02001
G1 X112.925 Y114.71 E.02234
G1 X112.801 Y115.235 E.02015
G1 X113.233 Y115.666 E.0228
G2 X113.134 Y116.215 I6.494 J1.457 E.02085
G1 X112.695 Y115.776 E.02319
G2 X112.645 Y116.375 I2.004 J.467 E.02252
G1 X113.238 Y116.968 E.03133
; WIPE_START
G1 F24000
G1 X112.645 Y116.375 E-.31876
G1 X112.663 Y115.941 E-.16503
G1 X112.695 Y115.776 E-.06373
G1 X113.09 Y116.172 E-.21248
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.164 J.354 P1  F30000
G1 X117.019 Y103.245 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X106.71 Y92.936 E.54457
G1 X106.062 Y92.936 E.02422
G1 X116.165 Y103.039 E.5337
G1 X115.516 Y103.039 E.02422
G1 X105.413 Y92.936 E.5337
G1 X104.765 Y92.936 E.02422
G1 X114.868 Y103.039 E.5337
G1 X114.22 Y103.039 E.02422
G1 X104.117 Y92.936 E.5337
G1 X103.469 Y92.936 E.02422
G1 X113.572 Y103.039 E.5337
G1 X112.923 Y103.039 E.02422
G1 X102.82 Y92.936 E.5337
G1 X102.172 Y92.936 E.02422
G1 X112.275 Y103.039 E.5337
G1 X111.627 Y103.039 E.02422
G1 X101.524 Y92.936 E.5337
G1 X100.875 Y92.936 E.02422
G1 X110.978 Y103.039 E.5337
G1 X110.33 Y103.039 E.02422
G1 X100.227 Y92.936 E.5337
G1 X99.579 Y92.936 E.02422
G1 X109.682 Y103.039 E.5337
G1 X109.034 Y103.039 E.02422
G1 X98.931 Y92.936 E.5337
G1 X98.282 Y92.936 E.02422
G1 X108.385 Y103.039 E.5337
G1 X107.737 Y103.039 E.02422
G1 X97.634 Y92.936 E.5337
G1 X96.986 Y92.936 E.02422
G1 X107.089 Y103.039 E.5337
G1 X106.441 Y103.039 E.02422
G1 X96.337 Y92.936 E.5337
G1 X95.689 Y92.936 E.02422
G1 X105.792 Y103.039 E.5337
G1 X105.144 Y103.039 E.02422
G1 X95.041 Y92.936 E.5337
G1 X94.393 Y92.936 E.02422
G1 X104.496 Y103.039 E.5337
G1 X103.847 Y103.039 E.02422
G1 X93.744 Y92.936 E.5337
G1 X93.096 Y92.936 E.02422
G1 X103.199 Y103.039 E.5337
G1 X102.551 Y103.039 E.02422
G1 X92.448 Y92.936 E.5337
G1 X91.8 Y92.936 E.02422
G1 X101.903 Y103.039 E.5337
G1 X101.254 Y103.039 E.02422
G1 X91.151 Y92.936 E.5337
G1 X90.503 Y92.936 E.02422
G1 X100.606 Y103.039 E.5337
G1 X99.958 Y103.039 E.02422
G1 X89.855 Y92.936 E.5337
G1 X89.206 Y92.936 E.02422
G1 X99.309 Y103.039 E.5337
G1 X98.661 Y103.039 E.02422
G1 X88.558 Y92.936 E.5337
G1 X87.91 Y92.936 E.02422
G1 X98.013 Y103.039 E.5337
G1 X97.365 Y103.039 E.02422
G1 X87.262 Y92.936 E.5337
G1 X86.613 Y92.936 E.02422
G1 X96.716 Y103.039 E.5337
G1 X96.068 Y103.039 E.02422
G1 X85.965 Y92.936 E.5337
G1 X85.601 Y92.936 E.01359
G1 X86.039 Y93.658 E.03154
G1 X95.42 Y103.039 E.49556
G1 X94.772 Y103.039 E.02422
G1 X87.036 Y95.304 E.40866
M73 P52 R6
G1 X88.033 Y96.949 E.07185
G1 X94.123 Y103.039 E.32175
G1 X93.801 Y103.039 E.01205
G1 X93.683 Y103.248 E.00893
G1 X89.029 Y98.594 E.24585
G1 X90.026 Y100.239 E.07185
G1 X93.45 Y103.662 E.18085
G1 X93.216 Y104.077 E.01778
G1 X91.023 Y101.884 E.11585
G1 X92.02 Y103.529 E.07185
G1 X93.528 Y105.038 E.07968
G1 X94.526 Y106.683 E.07188
G1 X93.017 Y105.174 E.07971
M73 P52 R5
G1 X94.014 Y106.819 E.07185
G1 X95.523 Y108.329 E.07973
G1 X96.52 Y109.974 E.07188
G1 X95.01 Y108.465 E.07976
G1 X96.007 Y110.11 E.07185
G1 X97.317 Y111.419 E.06916
G3 X97.836 Y112.586 I-13.655 J6.772 E.04774
G1 X96.832 Y111.583 E.05303
G3 X97.355 Y112.754 I-13.707 J6.823 E.04793
G1 X98.2 Y113.599 E.04462
G3 X98.473 Y114.521 I-10.854 J3.724 E.03594
G1 X97.72 Y113.767 E.03981
G3 X97.993 Y114.688 I-11.095 J3.787 E.0359
G1 X98.675 Y115.371 E.03607
G1 X98.784 Y115.941 E.02169
G1 X98.792 Y116.136 E.00728
G1 X98.189 Y115.532 E.03188
G3 X98.329 Y116.321 I-9.333 J2.069 E.02993
G1 X99.035 Y117.028 E.03731
G1 X98.649 Y117.309 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.737771
G1 F3000
G3 X98.692 Y118.116 I-38.357 J2.41 E.04578
G1 X98.72 Y119.14 E.05798
; WIPE_START
G1 F24000
G1 X98.692 Y118.116 E-.42469
G1 X98.649 Y117.309 E-.33531
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I0 J1.217 P1  F30000
G1 X112.798 Y117.309 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.736761
G1 F3000
M73 P53 R5
G2 X112.727 Y119.14 I45.437 J2.67 E.10361
; WIPE_START
G1 F24000
G1 X112.798 Y117.309 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.209 J.137 P1  F30000
G1 X113.131 Y120.259 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.501289
G1 F6300
G1 X112.508 Y119.636 E.03289
G1 X112.491 Y120.043 E.01523
G1 X112.267 Y120.043 E.00836
G1 X112.925 Y120.701 E.03475
G1 X112.925 Y121.349 E.02421
G1 X111.414 Y119.838 E.07986
G1 X111.686 Y120.758 F30000
G1 F6300
G1 X110.971 Y120.043 E.03774
G1 X110.323 Y120.043 E.02421
G1 X110.832 Y120.552 E.02688
G1 X110.183 Y120.552 E.02421
G1 X109.675 Y120.043 E.02688
G1 X109.026 Y120.043 E.02421
G1 X109.535 Y120.552 E.02688
G1 X108.887 Y120.552 E.02421
G1 X108.378 Y120.043 E.02688
G1 X107.73 Y120.043 E.02421
G1 X108.239 Y120.552 E.02688
G1 X107.59 Y120.552 E.02421
G1 X107.082 Y120.043 E.02688
G1 X106.433 Y120.043 E.02421
G1 X106.942 Y120.552 E.02688
G1 X106.294 Y120.552 E.02421
G1 X105.785 Y120.043 E.02688
G1 X105.137 Y120.043 E.02421
G1 X105.646 Y120.552 E.02688
G1 X104.998 Y120.552 E.02421
G1 X104.489 Y120.043 E.02688
G1 X103.84 Y120.043 E.02421
G1 X104.349 Y120.552 E.02688
G1 X103.701 Y120.552 E.02421
G1 X103.192 Y120.043 E.02688
G1 X102.544 Y120.043 E.02421
G1 X103.053 Y120.552 E.02688
G1 X102.405 Y120.552 E.02421
G1 X101.896 Y120.043 E.02688
G1 X101.247 Y120.043 E.02421
G1 X101.756 Y120.552 E.02688
G1 X101.108 Y120.552 E.02421
G1 X100.599 Y120.043 E.02688
G1 X99.951 Y120.043 E.02421
G1 X100.46 Y120.552 E.02688
G1 X99.812 Y120.552 E.02421
G1 X98.787 Y119.527 E.05413
G1 X98.522 Y119.533 E.0099
G1 X98.522 Y119.911 E.01411
G1 X99.163 Y120.552 E.03388
G1 X99.031 Y120.552 E.00495
G1 X99.031 Y121.068 E.01926
G1 X98.522 Y120.559 E.02688
G1 X98.522 Y121.207 E.02421
G1 X99.031 Y121.716 E.02688
G1 X99.031 Y122.364 E.02421
G1 X98.522 Y121.855 E.02688
G1 X98.522 Y122.504 E.02421
G1 X99.031 Y123.012 E.02688
G1 X99.031 Y123.661 E.02421
G1 X98.522 Y123.152 E.02688
G1 X98.522 Y123.8 E.02421
G1 X99.031 Y124.309 E.02688
G1 X99.031 Y124.957 E.02421
G1 X98.522 Y124.448 E.02688
G1 X98.522 Y125.096 E.02421
G1 X99.031 Y125.605 E.02688
G1 X99.031 Y126.254 E.02421
G1 X98.522 Y125.745 E.02688
G1 X98.522 Y126.393 E.02421
G1 X99.031 Y126.902 E.02688
G1 X99.031 Y127.55 E.02421
G1 X98.522 Y127.041 E.02688
G1 X98.522 Y127.689 E.02421
G1 X99.031 Y128.198 E.02688
G1 X99.031 Y128.846 E.02421
G1 X98.522 Y128.338 E.02688
G1 X98.522 Y128.986 E.02421
G1 X99.031 Y129.495 E.02688
G1 X99.031 Y130.143 E.02421
G1 X98.522 Y129.634 E.02688
G1 X98.522 Y130.282 E.02421
G1 X99.031 Y130.791 E.02688
G1 X99.031 Y131.439 E.02421
G1 X98.522 Y130.931 E.02688
G1 X98.522 Y131.579 E.02421
G1 X99.031 Y132.088 E.02688
G1 X99.031 Y132.736 E.02421
G1 X98.522 Y132.227 E.02688
G1 X98.522 Y132.875 E.02421
G1 X99.031 Y133.384 E.02688
G1 X99.031 Y134.032 E.02421
G1 X98.522 Y133.524 E.02688
G1 X98.522 Y134.172 E.02421
G1 X99.031 Y134.681 E.02688
G1 X99.031 Y135.329 E.02421
G1 X98.522 Y134.82 E.02688
G1 X98.522 Y135.468 E.02421
G1 X99.031 Y135.977 E.02688
G1 X99.031 Y136.625 E.02421
G1 X98.522 Y136.116 E.02688
G1 X98.522 Y136.765 E.02421
G1 X99.031 Y137.274 E.02688
G1 X99.031 Y137.922 E.02421
G1 X98.522 Y137.413 E.02688
G1 X98.522 Y138.061 E.02421
G1 X99.031 Y138.57 E.02688
G1 X99.031 Y139.218 E.02421
G1 X98.522 Y138.709 E.02688
G1 X98.522 Y139.358 E.02421
G1 X99.031 Y139.866 E.02688
G1 X99.031 Y140.515 E.02421
G1 X98.522 Y140.006 E.02688
G1 X98.522 Y140.654 E.02421
M73 P54 R5
G1 X99.031 Y141.163 E.02688
G1 X99.031 Y141.811 E.02421
G1 X98.522 Y141.302 E.02688
G1 X98.522 Y141.951 E.02421
G1 X99.031 Y142.459 E.02688
G1 X99.031 Y143.108 E.02421
G1 X98.522 Y142.599 E.02688
G1 X98.522 Y143.247 E.02421
G1 X99.031 Y143.756 E.02688
G1 X99.031 Y144.404 E.02421
G1 X98.522 Y143.895 E.02688
G1 X98.522 Y144.543 E.02421
G1 X99.031 Y145.052 E.02688
G1 X99.031 Y145.701 E.02421
G1 X98.522 Y145.192 E.02688
G1 X98.522 Y145.84 E.02421
G1 X99.031 Y146.349 E.02688
G1 X99.031 Y146.997 E.02421
G1 X98.522 Y146.488 E.02688
G1 X98.522 Y147.136 E.02421
G1 X99.031 Y147.645 E.02688
G1 X99.031 Y148.293 E.02421
G1 X98.522 Y147.785 E.02688
G1 X98.522 Y148.433 E.02421
G1 X99.031 Y148.942 E.02688
G1 X99.031 Y149.59 E.02421
G1 X98.522 Y149.081 E.02688
G1 X98.522 Y149.729 E.02421
G1 X99.031 Y150.238 E.02688
G1 X99.031 Y150.886 E.02421
G1 X98.522 Y150.378 E.02688
G1 X98.522 Y151.026 E.02421
G1 X99.031 Y151.535 E.02688
G1 X99.031 Y152.183 E.02421
G1 X98.522 Y151.674 E.02688
G1 X98.522 Y152.322 E.02421
G1 X99.031 Y152.831 E.02688
G1 X99.031 Y153.479 E.02421
G1 X98.522 Y152.97 E.02688
G1 X98.522 Y153.619 E.02421
G1 X99.031 Y154.128 E.02688
G1 X99.031 Y154.776 E.02421
G1 X98.522 Y154.267 E.02688
G1 X98.522 Y154.915 E.02421
G1 X99.031 Y155.424 E.02688
G1 X99.031 Y156.072 E.02421
G1 X98.522 Y155.563 E.02688
G1 X98.522 Y156.212 E.02421
G1 X99.031 Y156.72 E.02688
G1 X99.031 Y157.369 E.02421
G1 X98.522 Y156.86 E.02688
G1 X98.522 Y157.508 E.02421
G1 X99.031 Y158.017 E.02688
G1 X99.031 Y158.665 E.02421
G1 X98.522 Y158.156 E.02688
G1 X98.522 Y158.805 E.02421
G1 X99.031 Y159.313 E.02688
G1 X99.031 Y159.962 E.02421
G1 X98.522 Y159.453 E.02688
G1 X98.522 Y160.101 E.02421
G1 X99.031 Y160.61 E.02688
G1 X99.031 Y161.258 E.02421
G1 X98.522 Y160.749 E.02688
G1 X98.522 Y161.397 E.02421
G1 X99.031 Y161.906 E.02688
G1 X99.031 Y162.555 E.02421
G1 X98.522 Y162.046 E.02688
G1 X98.522 Y162.694 E.02421
G1 X99.031 Y163.203 E.02688
G1 X99.031 Y163.851 E.02421
G1 X98.522 Y163.342 E.02688
G1 X98.522 Y163.99 E.02421
G1 X99.031 Y164.499 E.02688
G1 X99.031 Y165.147 E.02421
G1 X98.522 Y164.639 E.02688
G1 X98.522 Y165.287 E.02421
G1 X99.031 Y165.796 E.02688
G1 X99.031 Y166.444 E.02421
G1 X98.522 Y165.935 E.02688
G1 X98.522 Y166.583 E.02421
G1 X99.031 Y167.092 E.02688
G1 X99.031 Y167.74 E.02421
G1 X98.522 Y167.232 E.02688
G1 X98.522 Y167.88 E.02421
G1 X99.031 Y168.389 E.02688
G2 X99.046 Y169.052 I5.031 J.216 E.02481
G1 X98.522 Y168.528 E.02769
G2 X98.54 Y169.194 I7.689 J.126 E.0249
G1 X99.103 Y169.757 E.02972
G2 X99.279 Y170.581 I4.799 J-.594 E.03152
G1 X98.376 Y169.678 E.04769
; WIPE_START
G1 F24000
G1 X99.279 Y170.581 E-.48517
G1 X99.189 Y170.246 E-.1317
G1 X99.124 Y169.875 E-.14313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.168 J.343 P1  F30000
G1 X113.131 Y122.203 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X112.416 Y121.489 E.03774
G1 X112.416 Y122.137 E.02421
G1 X112.925 Y122.646 E.02688
G1 X112.925 Y123.294 E.02421
G1 X112.416 Y122.785 E.02688
G1 X112.416 Y123.433 E.02421
G1 X112.925 Y123.942 E.02688
G1 X112.925 Y124.59 E.02421
G1 X112.416 Y124.082 E.02688
G1 X112.416 Y124.73 E.02421
G1 X112.925 Y125.239 E.02688
G1 X112.925 Y125.887 E.02421
G1 X112.416 Y125.378 E.02688
G1 X112.416 Y126.026 E.02421
G1 X112.925 Y126.535 E.02688
G1 X112.925 Y127.183 E.02421
G1 X112.416 Y126.675 E.02688
G1 X112.416 Y127.323 E.02421
G1 X112.925 Y127.832 E.02688
G1 X112.925 Y128.48 E.02421
G1 X112.416 Y127.971 E.02688
G1 X112.416 Y128.619 E.02421
G1 X112.925 Y129.128 E.02688
G1 X112.925 Y129.776 E.02421
G1 X112.416 Y129.267 E.02688
G1 X112.416 Y129.916 E.02421
G1 X112.925 Y130.425 E.02688
G1 X112.925 Y131.073 E.02421
G1 X112.416 Y130.564 E.02688
G1 X112.416 Y131.212 E.02421
G1 X112.925 Y131.721 E.02688
G1 X112.925 Y132.369 E.02421
G1 X112.416 Y131.86 E.02688
G1 X112.416 Y132.509 E.02421
G1 X112.925 Y133.017 E.02688
G1 X112.925 Y133.666 E.02421
G1 X112.416 Y133.157 E.02688
G1 X112.416 Y133.805 E.02421
G1 X112.925 Y134.314 E.02688
G1 X112.925 Y134.962 E.02421
G1 X112.416 Y134.453 E.02688
G1 X112.416 Y135.102 E.02421
G1 X112.925 Y135.61 E.02688
G1 X112.925 Y136.259 E.02421
G1 X112.416 Y135.75 E.02688
G1 X112.416 Y136.398 E.02421
G1 X112.925 Y136.907 E.02688
G1 X112.925 Y137.555 E.02421
G1 X112.416 Y137.046 E.02688
G1 X112.416 Y137.695 E.02421
G1 X112.925 Y138.203 E.02688
G1 X112.925 Y138.852 E.02421
G1 X112.416 Y138.343 E.02688
G1 X112.416 Y138.991 E.02421
G1 X112.925 Y139.5 E.02688
G1 X112.925 Y140.148 E.02421
G1 X112.416 Y139.639 E.02688
G1 X112.416 Y140.287 E.02421
M73 P55 R5
G1 X112.925 Y140.796 E.02688
G1 X112.925 Y141.445 E.02421
G1 X112.416 Y140.936 E.02688
G1 X112.416 Y141.584 E.02421
G1 X112.925 Y142.093 E.02688
G1 X112.925 Y142.741 E.02421
G1 X112.416 Y142.232 E.02688
G1 X112.416 Y142.88 E.02421
G1 X112.925 Y143.389 E.02688
G1 X112.925 Y144.037 E.02421
G1 X112.416 Y143.529 E.02688
G1 X112.416 Y144.177 E.02421
G1 X112.925 Y144.686 E.02688
G1 X112.925 Y145.334 E.02421
G1 X112.416 Y144.825 E.02688
G1 X112.416 Y145.473 E.02421
G1 X112.925 Y145.982 E.02688
G1 X112.925 Y146.63 E.02421
G1 X112.416 Y146.122 E.02688
G1 X112.416 Y146.77 E.02421
G1 X112.925 Y147.279 E.02688
G1 X112.925 Y147.927 E.02421
G1 X112.416 Y147.418 E.02688
G1 X112.416 Y148.066 E.02421
G1 X112.925 Y148.575 E.02688
G1 X112.925 Y149.223 E.02421
G1 X112.416 Y148.714 E.02688
G1 X112.416 Y149.363 E.02421
G1 X112.925 Y149.872 E.02688
G1 X112.925 Y150.52 E.02421
G1 X112.416 Y150.011 E.02688
G1 X112.416 Y150.659 E.02421
G1 X112.925 Y151.168 E.02688
G1 X112.925 Y151.816 E.02421
G1 X112.416 Y151.307 E.02688
G1 X112.416 Y151.956 E.02421
G1 X112.925 Y152.464 E.02688
G1 X112.925 Y153.113 E.02421
G1 X112.416 Y152.604 E.02688
G1 X112.416 Y153.252 E.02421
G1 X112.925 Y153.761 E.02688
G1 X112.925 Y154.409 E.02421
G1 X112.416 Y153.9 E.02688
G1 X112.416 Y154.549 E.02421
G1 X112.925 Y155.057 E.02688
G1 X112.925 Y155.706 E.02421
G1 X112.416 Y155.197 E.02688
G1 X112.416 Y155.845 E.02421
G1 X112.925 Y156.354 E.02688
G1 X112.925 Y157.002 E.02421
G1 X112.416 Y156.493 E.02688
G1 X112.416 Y157.141 E.02421
G1 X112.925 Y157.65 E.02688
G1 X112.925 Y158.299 E.02421
G1 X112.416 Y157.79 E.02688
G1 X112.416 Y158.438 E.02421
G1 X112.925 Y158.947 E.02688
G1 X112.925 Y159.595 E.02421
G1 X112.416 Y159.086 E.02688
G1 X112.416 Y159.734 E.02421
G1 X112.925 Y160.243 E.02688
G1 X112.925 Y160.891 E.02421
G1 X112.416 Y160.383 E.02688
G1 X112.416 Y161.031 E.02421
G1 X112.925 Y161.54 E.02688
G1 X112.925 Y162.188 E.02421
G1 X112.416 Y161.679 E.02688
G1 X112.416 Y162.327 E.02421
G1 X112.925 Y162.836 E.02688
G1 X112.925 Y163.484 E.02421
G1 X112.416 Y162.976 E.02688
G1 X112.416 Y163.624 E.02421
G1 X112.925 Y164.133 E.02688
G1 X112.925 Y164.781 E.02421
G1 X112.416 Y164.272 E.02688
G1 X112.416 Y164.92 E.02421
G1 X112.925 Y165.429 E.02688
G1 X112.925 Y166.077 E.02421
G1 X112.416 Y165.568 E.02688
G1 X112.416 Y166.217 E.02421
G1 X112.925 Y166.726 E.02688
G1 X112.925 Y167.374 E.02421
G1 X112.416 Y166.865 E.02688
G1 X112.416 Y167.513 E.02421
G1 X112.925 Y168.022 E.02688
G1 X112.925 Y168.67 E.02421
G1 X112.416 Y168.161 E.02688
G1 X112.416 Y168.81 E.02421
G1 X112.903 Y169.296 E.0257
G3 X112.838 Y169.879 I-3.353 J-.081 E.02194
G1 X112.386 Y169.427 E.02388
G3 X112.307 Y169.997 I-3.297 J-.163 E.02151
G1 X112.732 Y170.422 E.02246
G3 X112.599 Y170.937 I-4.001 J-.759 E.01989
G1 X112.19 Y170.527 E.02164
G3 X112.034 Y171.02 I-2.904 J-.643 E.01933
G1 X112.427 Y171.414 E.02077
G3 X112.231 Y171.865 I-2.68 J-.896 E.01843
G1 X111.849 Y171.483 E.02018
G3 X111.637 Y171.92 I-2.599 J-.993 E.01814
G1 X112.012 Y172.294 E.01979
G3 X111.772 Y172.703 I-2.453 J-1.168 E.01771
G1 X111.401 Y172.332 E.01959
G3 X111.142 Y172.721 I-2.354 J-1.285 E.01749
G1 X111.505 Y173.084 E.01917
G3 X111.217 Y173.444 I-2.2 J-1.468 E.01725
G1 X110.861 Y173.088 E.0188
G3 X110.552 Y173.427 I-2.094 J-1.597 E.01716
G1 X110.91 Y173.785 E.01894
G3 X110.586 Y174.109 I-2.016 J-1.695 E.01714
G1 X110.217 Y173.741 E.01946
G1 X109.872 Y174.044 E.01716
G1 X110.233 Y174.405 E.01908
G3 X109.867 Y174.687 I-2.338 J-2.655 E.01728
G1 X109.498 Y174.318 E.01949
G3 X109.101 Y174.569 I-1.634 J-2.145 E.01757
G1 X109.472 Y174.941 E.01961
G1 X109.061 Y175.178 E.01772
G1 X108.681 Y174.797 E.02011
G3 X108.235 Y175 I-1.381 J-2.445 E.01831
G1 X108.62 Y175.385 E.02035
G3 X108.155 Y175.568 I-1.281 J-2.564 E.01869
G1 X107.76 Y175.173 E.0209
G3 X107.25 Y175.312 I-1.047 J-2.841 E.01975
G1 X107.664 Y175.726 E.02188
G3 X107.143 Y175.853 I-.986 J-2.915 E.02007
G1 X106.705 Y175.415 E.02313
G3 X106.116 Y175.474 I-.762 J-4.621 E.02213
G1 X106.586 Y175.944 E.02483
G3 X105.986 Y175.992 I-.574 J-3.406 E.02252
G1 X105.474 Y175.48 E.02703
G3 X104.761 Y175.416 I.012 J-4.104 E.02676
G1 X105.333 Y175.987 E.03019
G3 X104.604 Y175.907 I.252 J-5.619 E.0274
G1 X103.631 Y174.934 E.05139
; WIPE_START
G1 F24000
G1 X104.604 Y175.907 E-.52284
G1 X105.225 Y175.975 E-.23716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.04 J-1.216 P1  F30000
G1 X104.063 Y176.014 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X102.926 Y174.877 E.06005
G1 X102.131 Y174.445 E.0338
G3 X100.786 Y173.317 I4.142 J-6.302 E.06573
G1 X100.246 Y172.645 E.03219
G3 X99.645 Y171.596 I7.345 J-4.907 E.0452
G1 X98.799 Y170.749 E.04471
G2 X99.172 Y171.771 I7.086 J-2.012 E.04068
G1 X102.75 Y175.349 E.18898
G3 X100.866 Y174.113 I2.85 J-6.4 E.08453
G1 X99.404 Y172.651 E.07724
M106 S178.5
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X100.818 Y174.065 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/25
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
G3 Z.6 I1.192 J.247 P1  F30000
G1 X111.773 Y121.196 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
M73 P56 R5
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.295 Y109.775 E.2363
G2 X112.022 Y115.867 I15.13 J9.116 E.21693
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.479 J9.321 E.206
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.016 J.669 P1  F30000
G1 X126.233 Y93.543 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.66612
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X85.217 Y93.543 E.66609
G1 X126.173 Y93.543 E1.35859
; WIPE_START
G1 F24000
G1 X125.141 Y95.256 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.03 J.649 P1  F30000
G1 X127.504 Y91.505 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.511 Y91.588 E.00256
G3 X127.252 Y92.618 I-1.825 J.089 E.0331
G1 X116.162 Y110.916 E.65746
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X84.154 Y92.547 E.65997
G3 X83.943 Y91.505 I1.605 J-.868 E.03314
G1 X127.444 Y91.505 E1.33667
M204 S10000
; WIPE_START
G1 F24000
G1 X127.511 Y91.588 E-.04037
G1 X127.502 Y91.888 E-.11405
G1 X127.441 Y92.191 E-.11731
G1 X127.329 Y92.478 E-.11732
G1 X127.252 Y92.618 E-.06042
G1 X126.829 Y93.317 E-.31052
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.005 J-1.217 P1  F30000
G1 X125.871 Y93.321 Z.8
G1 Z.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X127.29 Y91.901 E.06168
G1 X126.946 Y91.713
G1 X125.337 Y93.321 E.06989
G1 X124.804 Y93.321
G1 X126.412 Y91.713 E.06989
G1 X125.879 Y91.713
G1 X124.271 Y93.321 E.06989
G1 X123.738 Y93.321
G1 X125.346 Y91.713 E.06989
G1 X124.813 Y91.713
G1 X123.204 Y93.321 E.06989
G1 X122.671 Y93.321
G1 X124.279 Y91.713 E.06989
G1 X123.746 Y91.713
G1 X122.138 Y93.321 E.06989
G1 X121.604 Y93.321
G1 X123.213 Y91.713 E.06989
G1 X122.68 Y91.713
G1 X121.071 Y93.321 E.06989
G1 X120.538 Y93.321
G1 X122.146 Y91.713 E.06989
G1 X121.613 Y91.713
G1 X120.005 Y93.321 E.06989
G1 X119.471 Y93.321
G1 X121.08 Y91.713 E.06989
G1 X120.546 Y91.713
G1 X118.938 Y93.321 E.06989
G1 X118.405 Y93.321
G1 X120.013 Y91.713 E.06989
G1 X119.48 Y91.713
G1 X117.872 Y93.321 E.06989
G1 X117.338 Y93.321
G1 X118.947 Y91.713 E.06989
G1 X118.413 Y91.713
G1 X116.805 Y93.321 E.06989
G1 X116.272 Y93.321
G1 X117.88 Y91.713 E.06989
G1 X117.347 Y91.713
G1 X115.739 Y93.321 E.06989
G1 X115.205 Y93.321
G1 X116.814 Y91.713 E.06989
G1 X116.28 Y91.713
G1 X114.672 Y93.321 E.06989
G1 X114.139 Y93.321
G1 X115.747 Y91.713 E.06989
G1 X115.214 Y91.713
G1 X113.605 Y93.321 E.06989
G1 X113.072 Y93.321
G1 X114.68 Y91.713 E.06989
G1 X114.147 Y91.713
G1 X112.539 Y93.321 E.06989
G1 X112.006 Y93.321
G1 X113.614 Y91.713 E.06989
G1 X113.081 Y91.713
G1 X111.472 Y93.321 E.06989
G1 X110.939 Y93.321
G1 X112.547 Y91.713 E.06989
G1 X112.014 Y91.713
G1 X110.406 Y93.321 E.06989
G1 X109.873 Y93.321
G1 X111.481 Y91.713 E.06989
M73 P57 R5
G1 X110.948 Y91.713
G1 X109.339 Y93.321 E.06989
G1 X108.806 Y93.321
G1 X110.414 Y91.713 E.06989
G1 X109.881 Y91.713
G1 X108.273 Y93.321 E.06989
G1 X107.739 Y93.321
G1 X109.348 Y91.713 E.06989
G1 X108.814 Y91.713
G1 X107.206 Y93.321 E.06989
G1 X106.673 Y93.321
G1 X108.281 Y91.713 E.06989
G1 X107.748 Y91.713
G1 X106.14 Y93.321 E.06989
G1 X105.606 Y93.321
G1 X107.215 Y91.713 E.06989
G1 X106.681 Y91.713
G1 X105.073 Y93.321 E.06989
G1 X104.54 Y93.321
G1 X106.148 Y91.713 E.06989
G1 X105.615 Y91.713
G1 X104.007 Y93.321 E.06989
G1 X103.473 Y93.321
G1 X105.082 Y91.713 E.06989
G1 X104.548 Y91.713
G1 X102.94 Y93.321 E.06989
G1 X102.407 Y93.321
G1 X104.015 Y91.713 E.06989
G1 X103.482 Y91.713
G1 X101.873 Y93.321 E.06989
G1 X101.34 Y93.321
G1 X102.949 Y91.713 E.06989
G1 X102.415 Y91.713
G1 X100.807 Y93.321 E.06989
G1 X100.274 Y93.321
G1 X101.882 Y91.713 E.06989
G1 X101.349 Y91.713
G1 X99.74 Y93.321 E.06989
G1 X99.207 Y93.321
G1 X100.815 Y91.713 E.06989
G1 X100.282 Y91.713
G1 X98.674 Y93.321 E.06989
G1 X98.141 Y93.321
G1 X99.749 Y91.713 E.06989
G1 X99.216 Y91.713
G1 X97.607 Y93.321 E.06989
G1 X97.074 Y93.321
G1 X98.682 Y91.713 E.06989
G1 X98.149 Y91.713
G1 X96.541 Y93.321 E.06989
G1 X96.007 Y93.321
G1 X97.616 Y91.713 E.06989
G1 X97.083 Y91.713
G1 X95.474 Y93.321 E.06989
G1 X94.941 Y93.321
G1 X96.549 Y91.713 E.06989
G1 X96.016 Y91.713
G1 X94.408 Y93.321 E.06989
G1 X93.874 Y93.321
G1 X95.483 Y91.713 E.06989
G1 X94.949 Y91.713
G1 X93.341 Y93.321 E.06989
G1 X92.808 Y93.321
G1 X94.416 Y91.713 E.06989
G1 X93.883 Y91.713
G1 X92.275 Y93.321 E.06989
G1 X91.741 Y93.321
G1 X93.35 Y91.713 E.06989
G1 X92.816 Y91.713
G1 X91.208 Y93.321 E.06989
G1 X90.675 Y93.321
G1 X92.283 Y91.713 E.06989
G1 X91.75 Y91.713
G1 X90.142 Y93.321 E.06989
G1 X89.608 Y93.321
G1 X91.217 Y91.713 E.06989
G1 X90.683 Y91.713
G1 X89.075 Y93.321 E.06989
G1 X88.542 Y93.321
G1 X90.15 Y91.713 E.06989
G1 X89.617 Y91.713
G1 X88.008 Y93.321 E.06989
G1 X87.475 Y93.321
G1 X89.083 Y91.713 E.06989
G1 X88.55 Y91.713
G1 X86.942 Y93.321 E.06989
G1 X86.409 Y93.321
G1 X88.017 Y91.713 E.06989
G1 X87.484 Y91.713
G1 X85.875 Y93.321 E.06989
G1 X85.342 Y93.321
G1 X86.95 Y91.713 E.06989
G1 X86.417 Y91.713
G1 X84.844 Y93.285 E.06834
G1 X84.643 Y92.953
G1 X85.884 Y91.713 E.05391
G1 X85.351 Y91.713
G1 X84.442 Y92.621 E.03948
G1 X84.256 Y92.274
G1 X84.817 Y91.713 E.02439
M204 S10000
; WIPE_START
G1 F24000
G1 X84.256 Y92.274 E-.30159
G1 X84.442 Y92.621 E-.14973
G1 X85.016 Y92.047 E-.30869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.007 J1.217 P1  F30000
G1 X127.178 Y92.306 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881702
G1 F15000
G1 X127.128 Y92.379 E.00033
; LINE_WIDTH: 0.112666
G1 X127.041 Y92.496 E.00083
; LINE_WIDTH: 0.153816
G1 X126.908 Y92.665 E.00194
; LINE_WIDTH: 0.195543
G1 X126.776 Y92.833 E.00267
; LINE_WIDTH: 0.23727
G1 X126.644 Y93.002 E.0034
; LINE_WIDTH: 0.278997
G1 X126.511 Y93.171 E.00413
; LINE_WIDTH: 0.320725
G1 X126.379 Y93.34 E.00486
; WIPE_START
G1 F24000
G1 X126.511 Y93.171 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.064 J-.591 P1  F30000
G1 X112.045 Y119.219 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420066
G1 F15000
G1 X113.257 Y118.007 E.05266
G3 X113.294 Y117.436 I6.826 J.157 E.01757
G1 X112.246 Y118.485 E.04555
G1 X112.269 Y117.928 E.01712
G1 X113.357 Y116.84 E.04726
G3 X113.447 Y116.217 I7.477 J.765 E.01938
G1 X112.293 Y117.371 E.05017
G1 X112.316 Y116.814 E.01712
G1 X113.569 Y115.562 E.05445
G3 X113.728 Y114.869 I8.34 J1.551 E.02184
G1 X112.34 Y116.258 E.06034
G3 X112.4 Y115.663 I2.045 J-.091 E.01843
G1 X113.936 Y114.127 E.06675
G3 X114.21 Y113.321 I9.749 J2.852 E.02618
G1 X112.54 Y114.99 E.07255
G3 X112.72 Y114.277 I8.586 J1.783 E.0226
G1 X114.564 Y112.433 E.08015
G3 X115.057 Y111.407 I15.807 J6.961 E.035
G1 X112.949 Y113.515 E.09163
G3 X113.241 Y112.689 I10.7 J3.323 E.02692
G1 X115.775 Y110.155 E.11016
G1 X116.596 Y108.801 E.04866
G1 X113.619 Y111.778 E.1294
G3 X114.141 Y110.723 I12.839 J5.696 E.03621
G1 X117.416 Y107.447 E.14236
G1 X118.237 Y106.093 E.04866
G1 X114.885 Y109.445 E.14569
G1 X115.706 Y108.091 E.04866
G1 X119.058 Y104.739 E.14569
G1 X119.878 Y103.385 E.04866
G1 X116.526 Y106.737 E.14569
G1 X117.347 Y105.383 E.04866
G1 X120.699 Y102.031 E.14569
G1 X121.519 Y100.677 E.04866
G1 X118.167 Y104.03 E.14569
G1 X118.579 Y103.35 E.02443
G1 X118.314 Y103.35 E.00816
G1 X122.34 Y99.324 E.17498
G1 X123.16 Y97.97 E.04866
G1 X117.78 Y103.35 E.23383
G1 X117.247 Y103.35 E.01639
G1 X123.981 Y96.616 E.29267
G1 X124.802 Y95.262 E.04866
G1 X116.714 Y103.35 E.35152
G1 X116.18 Y103.35 E.01639
G1 X125.641 Y93.877 E.41146
G1 X125.12 Y93.877 E.01601
G1 X115.647 Y103.35 E.41173
G1 X115.114 Y103.35 E.01639
G1 X124.587 Y93.877 E.41173
G1 X124.053 Y93.877 E.01639
G1 X114.58 Y103.35 E.41173
G1 X114.047 Y103.35 E.01639
G1 X123.52 Y93.877 E.41173
G1 X122.987 Y93.877 E.01639
G1 X113.513 Y103.35 E.41173
G1 X112.98 Y103.35 E.01639
G1 X122.453 Y93.877 E.41173
G1 X121.92 Y93.877 E.01639
G1 X112.447 Y103.35 E.41173
G1 X111.913 Y103.35 E.01639
G1 X121.387 Y93.877 E.41173
G1 X120.853 Y93.877 E.01639
G1 X111.38 Y103.35 E.41173
G1 X110.847 Y103.35 E.01639
G1 X120.32 Y93.877 E.41173
G1 X119.786 Y93.877 E.01639
G1 X110.313 Y103.35 E.41173
G1 X109.78 Y103.35 E.01639
G1 X119.253 Y93.877 E.41173
G1 X118.72 Y93.877 E.01639
G1 X109.247 Y103.35 E.41173
G1 X108.713 Y103.35 E.01639
G1 X118.186 Y93.877 E.41173
G1 X117.653 Y93.877 E.01639
G1 X108.18 Y103.35 E.41173
G1 X107.646 Y103.35 E.01639
G1 X117.12 Y93.877 E.41173
G1 X116.586 Y93.877 E.01639
G1 X107.113 Y103.35 E.41173
G1 X106.58 Y103.35 E.01639
G1 X116.053 Y93.877 E.41173
G1 X115.52 Y93.877 E.01639
G1 X106.046 Y103.35 E.41173
G1 X105.513 Y103.35 E.01639
G1 X114.986 Y93.877 E.41173
M73 P58 R5
G1 X114.453 Y93.877 E.01639
G1 X104.98 Y103.35 E.41173
G1 X104.446 Y103.35 E.01639
G1 X113.919 Y93.877 E.41173
G1 X113.386 Y93.877 E.01639
G1 X103.913 Y103.35 E.41173
G1 X103.38 Y103.35 E.01639
G1 X112.853 Y93.877 E.41173
G1 X112.319 Y93.877 E.01639
G1 X102.846 Y103.35 E.41173
G1 X102.313 Y103.35 E.01639
G1 X111.786 Y93.877 E.41173
G1 X111.253 Y93.877 E.01639
G1 X101.779 Y103.35 E.41173
G1 X101.246 Y103.35 E.01639
G1 X110.719 Y93.877 E.41173
G1 X110.186 Y93.877 E.01639
G1 X100.713 Y103.35 E.41173
G1 X100.179 Y103.35 E.01639
G1 X109.652 Y93.877 E.41173
G1 X109.119 Y93.877 E.01639
G1 X99.646 Y103.35 E.41173
G1 X99.113 Y103.35 E.01639
G1 X108.586 Y93.877 E.41173
G1 X108.052 Y93.877 E.01639
G1 X98.579 Y103.35 E.41173
G1 X98.046 Y103.35 E.01639
G1 X107.519 Y93.877 E.41173
G1 X106.986 Y93.877 E.01639
G1 X97.513 Y103.35 E.41173
G1 X96.979 Y103.35 E.01639
G1 X106.452 Y93.877 E.41173
G1 X105.919 Y93.877 E.01639
G1 X96.446 Y103.35 E.41173
G1 X95.912 Y103.35 E.01639
G1 X105.386 Y93.877 E.41173
G1 X104.852 Y93.877 E.01639
G1 X95.379 Y103.35 E.41173
G1 X94.846 Y103.35 E.01639
G1 X104.319 Y93.877 E.41173
G1 X103.785 Y93.877 E.01639
G1 X94.312 Y103.35 E.41173
G1 X93.779 Y103.35 E.01639
G1 X103.252 Y93.877 E.41173
G1 X102.719 Y93.877 E.01639
G1 X92.189 Y104.406 E.45766
G1 X92.39 Y104.739 E.01193
G1 X93.212 Y103.917 E.03572
G1 X93.413 Y104.249 E.01193
G1 X92.591 Y105.071 E.03572
G1 X92.793 Y105.403 E.01193
G1 X93.614 Y104.581 E.03572
G1 X93.816 Y104.913 E.01193
G1 X92.994 Y105.735 E.03572
G1 X93.195 Y106.067 E.01193
G1 X94.017 Y105.245 E.03572
G1 X94.218 Y105.577 E.01193
G1 X93.396 Y106.399 E.03572
G1 X93.597 Y106.731 E.01193
G1 X94.419 Y105.909 E.03572
G1 X94.621 Y106.241 E.01193
G1 X93.799 Y107.063 E.03572
G1 X94 Y107.396 E.01193
G1 X94.822 Y106.574 E.03573
G1 X95.023 Y106.906 E.01193
G1 X94.201 Y107.728 E.03573
G1 X94.402 Y108.06 E.01193
G1 X95.224 Y107.238 E.03573
G1 X95.426 Y107.57 E.01193
G1 X94.604 Y108.392 E.03573
G1 X94.805 Y108.724 E.01193
G1 X95.627 Y107.902 E.03573
G1 X95.828 Y108.234 E.01193
G1 X95.006 Y109.056 E.03573
G1 X95.207 Y109.388 E.01193
G1 X96.03 Y108.566 E.03573
G1 X96.231 Y108.898 E.01193
G1 X95.409 Y109.72 E.03573
G1 X95.61 Y110.053 E.01193
G1 X96.432 Y109.23 E.03573
G1 X96.633 Y109.562 E.01193
G1 X95.811 Y110.385 E.03573
G3 X96.009 Y110.72 I-7.927 J4.914 E.01197
G1 X96.835 Y109.895 E.03587
G3 X97.031 Y110.232 I-7.942 J4.847 E.01199
G1 X96.205 Y111.058 E.03591
G3 X96.39 Y111.406 I-4.06 J2.385 E.01212
G1 X97.226 Y110.57 E.03634
G1 X97.409 Y110.92 E.01214
G1 X96.571 Y111.758 E.03642
G1 X96.742 Y112.12 E.01232
G1 X97.59 Y111.272 E.03686
G1 X97.761 Y111.635 E.01232
G1 X96.907 Y112.489 E.03712
G1 X97.065 Y112.864 E.01252
G1 X97.927 Y112.003 E.03746
G1 X98.085 Y112.378 E.01252
G1 X97.212 Y113.251 E.03794
G3 X97.353 Y113.643 I-4.6 J1.884 E.01281
G1 X98.234 Y112.762 E.03828
G1 X98.379 Y113.151 E.01275
G1 X97.484 Y114.045 E.03888
G3 X97.606 Y114.457 I-4.848 J1.656 E.0132
G1 X98.511 Y113.552 E.03933
G3 X98.638 Y113.958 I-4.772 J1.724 E.01308
G1 X97.721 Y114.875 E.03988
G1 X97.822 Y115.307 E.01364
G1 X98.755 Y114.375 E.04053
G3 X98.863 Y114.8 I-5.017 J1.497 E.0135
G1 X97.914 Y115.749 E.04122
G3 X97.997 Y116.199 I-5.323 J1.218 E.01407
G1 X98.964 Y115.232 E.042
G3 X99.05 Y115.68 I-5.282 J1.249 E.014
G1 X98.066 Y116.664 E.04276
G3 X98.122 Y117.141 I-5.664 J.906 E.01478
G1 X99.104 Y116.159 E.04266
G1 X99.125 Y116.671 E.01575
G1 X98.167 Y117.63 E.04167
G1 X98.198 Y118.132 E.01545
G1 X99.147 Y117.183 E.04123
G1 X99.168 Y117.695 E.01575
G1 X98.209 Y118.654 E.04169
G3 X98.212 Y119.185 I-12.662 J.332 E.01631
G1 X99.19 Y118.207 E.0425
G1 X99.211 Y118.719 E.01575
G1 X98.212 Y119.718 E.04343
G1 X98.212 Y120.251 E.01639
G1 X99.233 Y119.231 E.04437
G1 X99.264 Y119.733 E.01547
G1 X98.212 Y120.785 E.04572
G1 X98.212 Y121.318 E.01639
G1 X99.967 Y119.563 E.07627
G1 X91.864 Y104.198 F30000
G1 F15000
G1 X102.185 Y93.877 E.44859
G1 X101.652 Y93.877 E.01639
G1 X91.786 Y103.742 E.42879
G1 X91.585 Y103.41 E.01193
G1 X101.119 Y93.877 E.41435
G1 X100.585 Y93.877 E.01639
G1 X91.384 Y103.078 E.39992
G1 X91.183 Y102.746 E.01193
G1 X100.052 Y93.877 E.38548
G1 X99.519 Y93.877 E.01639
G1 X90.981 Y102.414 E.37105
G1 X90.78 Y102.082 E.01193
G1 X98.985 Y93.877 E.35662
G1 X98.452 Y93.877 E.01639
G1 X90.579 Y101.75 E.34218
G1 X90.378 Y101.417 E.01193
G1 X97.918 Y93.877 E.32775
G1 X97.385 Y93.877 E.01639
G1 X90.176 Y101.085 E.31331
G1 X89.975 Y100.753 E.01193
G1 X96.852 Y93.877 E.29888
G1 X96.318 Y93.877 E.01639
G1 X89.774 Y100.421 E.28444
G1 X89.573 Y100.089 E.01193
G1 X95.785 Y93.877 E.27001
G1 X95.252 Y93.877 E.01639
G1 X89.371 Y99.757 E.25557
G1 X89.17 Y99.425 E.01193
G1 X94.718 Y93.877 E.24114
G1 X94.185 Y93.877 E.01639
G1 X88.969 Y99.093 E.2267
G1 X88.768 Y98.76 E.01193
G1 X93.652 Y93.877 E.21227
G1 X93.118 Y93.877 E.01639
G1 X88.566 Y98.428 E.19783
G1 X88.365 Y98.096 E.01193
G1 X92.585 Y93.877 E.1834
G1 X92.051 Y93.877 E.01639
G1 X88.164 Y97.764 E.16896
G1 X87.963 Y97.432 E.01193
G1 X91.518 Y93.877 E.15453
G1 X90.985 Y93.877 E.01639
G1 X87.761 Y97.1 E.14009
G1 X87.56 Y96.768 E.01193
G1 X90.451 Y93.877 E.12566
G1 X89.918 Y93.877 E.01639
G1 X87.359 Y96.436 E.11122
G1 X87.158 Y96.103 E.01193
G1 X89.385 Y93.877 E.09679
G1 X88.851 Y93.877 E.01639
G1 X86.956 Y95.771 E.08236
G1 X86.755 Y95.439 E.01193
G1 X88.318 Y93.877 E.06792
G1 X87.785 Y93.877 E.01639
G1 X86.554 Y95.107 E.05349
G1 X86.353 Y94.775 E.01193
G1 X87.251 Y93.877 E.03905
G1 X86.718 Y93.877 E.01639
G1 X86.151 Y94.443 E.02462
G1 X85.95 Y94.111 E.01193
G1 X86.354 Y93.707 E.01756
; WIPE_START
G1 F24000
G1 X85.95 Y94.111 E-.21708
G1 X86.151 Y94.443 E-.14757
G1 X86.718 Y93.877 E-.30437
G1 X86.957 Y93.877 E-.09099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.149 J.4 P1  F30000
G1 X113.352 Y169.649 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X111.511 Y171.489 E.08
G2 X111.83 Y170.637 I-4.712 J-2.25 E.02801
G1 X113.215 Y169.252 E.0602
G2 X113.236 Y168.698 I-6.36 J-.511 E.01703
G1 X112.005 Y169.929 E.0535
G2 X112.084 Y169.316 I-17.795 J-2.618 E.01899
G1 X113.236 Y168.165 E.05005
G1 X113.236 Y167.631 E.01639
G1 X112.106 Y168.761 E.04908
G1 X112.106 Y168.227 E.01639
G1 X113.236 Y167.098 E.04908
G1 X113.236 Y166.565 E.01639
G1 X112.106 Y167.694 E.04908
G1 X112.106 Y167.161 E.01639
G1 X113.236 Y166.031 E.04908
G1 X113.236 Y165.498 E.01639
G1 X112.106 Y166.627 E.04908
G1 X112.106 Y166.094 E.01639
G1 X113.236 Y164.965 E.04908
G1 X113.236 Y164.431 E.01639
G1 X112.106 Y165.56 E.04908
G1 X112.106 Y165.027 E.01639
G1 X113.236 Y163.898 E.04908
G1 X113.236 Y163.364 E.01639
G1 X112.106 Y164.494 E.04908
G1 X112.106 Y163.96 E.01639
G1 X113.236 Y162.831 E.04908
G1 X113.236 Y162.298 E.01639
G1 X112.106 Y163.427 E.04908
G1 X112.106 Y162.894 E.01639
G1 X113.236 Y161.764 E.04908
G1 X113.236 Y161.231 E.01639
G1 X112.106 Y162.36 E.04908
M73 P59 R5
G1 X112.106 Y161.827 E.01639
G1 X113.236 Y160.698 E.04908
G1 X113.236 Y160.164 E.01639
G1 X112.106 Y161.294 E.04908
G1 X112.106 Y160.76 E.01639
G1 X113.236 Y159.631 E.04908
G1 X113.236 Y159.098 E.01639
G1 X112.106 Y160.227 E.04908
G1 X112.106 Y159.693 E.01639
G1 X113.236 Y158.564 E.04908
G1 X113.236 Y158.031 E.01639
G1 X112.106 Y159.16 E.04908
G1 X112.106 Y158.627 E.01639
G1 X113.236 Y157.497 E.04908
G1 X113.236 Y156.964 E.01639
G1 X112.106 Y158.093 E.04908
G1 X112.106 Y157.56 E.01639
G1 X113.236 Y156.431 E.04908
G1 X113.236 Y155.897 E.01639
G1 X112.106 Y157.027 E.04908
G1 X112.106 Y156.493 E.01639
G1 X113.236 Y155.364 E.04908
G1 X113.236 Y154.831 E.01639
G1 X112.106 Y155.96 E.04908
G1 X112.106 Y155.427 E.01639
G1 X113.236 Y154.297 E.04908
G1 X113.236 Y153.764 E.01639
G1 X112.106 Y154.893 E.04908
G1 X112.106 Y154.36 E.01639
G1 X113.236 Y153.23 E.04908
G1 X113.236 Y152.697 E.01639
G1 X112.106 Y153.826 E.04908
G1 X112.106 Y153.293 E.01639
G1 X113.236 Y152.164 E.04908
G1 X113.236 Y151.63 E.01639
G1 X112.106 Y152.76 E.04908
G1 X112.106 Y152.226 E.01639
G1 X113.236 Y151.097 E.04908
G1 X113.236 Y150.564 E.01639
G1 X112.106 Y151.693 E.04908
G1 X112.106 Y151.16 E.01639
G1 X113.236 Y150.03 E.04908
G1 X113.236 Y149.497 E.01639
G1 X112.106 Y150.626 E.04908
G1 X112.106 Y150.093 E.01639
G1 X113.236 Y148.964 E.04908
G1 X113.236 Y148.43 E.01639
G1 X112.106 Y149.56 E.04908
G1 X112.106 Y149.026 E.01639
G1 X113.236 Y147.897 E.04908
G1 X113.236 Y147.363 E.01639
G1 X112.106 Y148.493 E.04908
G1 X112.106 Y147.959 E.01639
G1 X113.236 Y146.83 E.04908
G1 X113.236 Y146.297 E.01639
G1 X112.106 Y147.426 E.04908
G1 X112.106 Y146.893 E.01639
G1 X113.236 Y145.763 E.04908
G1 X113.236 Y145.23 E.01639
G1 X112.106 Y146.359 E.04908
G1 X112.106 Y145.826 E.01639
G1 X113.236 Y144.697 E.04908
G1 X113.236 Y144.163 E.01639
G1 X112.106 Y145.293 E.04908
G1 X112.106 Y144.759 E.01639
G1 X113.236 Y143.63 E.04908
G1 X113.236 Y143.097 E.01639
G1 X112.106 Y144.226 E.04908
G1 X112.106 Y143.693 E.01639
G1 X113.236 Y142.563 E.04908
G1 X113.236 Y142.03 E.01639
G1 X112.106 Y143.159 E.04908
G1 X112.106 Y142.626 E.01639
G1 X113.236 Y141.496 E.04908
G1 X113.236 Y140.963 E.01639
G1 X112.106 Y142.092 E.04908
G1 X112.106 Y141.559 E.01639
G1 X113.236 Y140.43 E.04908
G1 X113.236 Y139.896 E.01639
G1 X112.106 Y141.026 E.04908
G1 X112.106 Y140.492 E.01639
G1 X113.236 Y139.363 E.04908
G1 X113.236 Y138.83 E.01639
G1 X112.106 Y139.959 E.04908
G1 X112.106 Y139.426 E.01639
G1 X113.236 Y138.296 E.04908
G1 X113.236 Y137.763 E.01639
G1 X112.106 Y138.892 E.04908
G1 X112.106 Y138.359 E.01639
G1 X113.236 Y137.23 E.04908
G1 X113.236 Y136.696 E.01639
G1 X112.106 Y137.825 E.04908
G1 X112.106 Y137.292 E.01639
G1 X113.236 Y136.163 E.04908
G1 X113.236 Y135.629 E.01639
G1 X112.106 Y136.759 E.04908
G1 X112.106 Y136.225 E.01639
G1 X113.236 Y135.096 E.04908
G1 X113.236 Y134.563 E.01639
G1 X112.106 Y135.692 E.04908
G1 X112.106 Y135.159 E.01639
G1 X113.236 Y134.029 E.04908
G1 X113.236 Y133.496 E.01639
G1 X112.106 Y134.625 E.04908
G1 X112.106 Y134.092 E.01639
G1 X113.236 Y132.963 E.04908
G1 X113.236 Y132.429 E.01639
G1 X112.106 Y133.559 E.04908
G1 X112.106 Y133.025 E.01639
G1 X113.236 Y131.896 E.04908
G1 X113.236 Y131.363 E.01639
G1 X112.106 Y132.492 E.04908
G1 X112.106 Y131.958 E.01639
G1 X113.236 Y130.829 E.04908
G1 X113.236 Y130.296 E.01639
G1 X112.106 Y131.425 E.04908
G1 X112.106 Y130.892 E.01639
G1 X113.236 Y129.762 E.04908
G1 X113.236 Y129.229 E.01639
G1 X112.106 Y130.358 E.04908
G1 X112.106 Y129.825 E.01639
G1 X113.236 Y128.696 E.04908
G1 X113.236 Y128.162 E.01639
G1 X112.106 Y129.292 E.04908
G1 X112.106 Y128.758 E.01639
G1 X113.236 Y127.629 E.04908
G1 X113.236 Y127.096 E.01639
G1 X112.106 Y128.225 E.04908
G1 X112.106 Y127.692 E.01639
G1 X113.236 Y126.562 E.04908
G1 X113.236 Y126.029 E.01639
G1 X112.106 Y127.158 E.04908
G1 X112.106 Y126.625 E.01639
G1 X113.236 Y125.496 E.04908
G1 X113.236 Y124.962 E.01639
G1 X112.106 Y126.091 E.04908
G1 X112.106 Y125.558 E.01639
G1 X113.236 Y124.429 E.04908
G1 X113.236 Y123.895 E.01639
G1 X112.106 Y125.025 E.04908
G1 X112.106 Y124.491 E.01639
G1 X113.236 Y123.362 E.04908
G1 X113.236 Y122.829 E.01639
G1 X112.106 Y123.958 E.04908
G1 X112.106 Y123.425 E.01639
G1 X113.236 Y122.295 E.04908
G1 X113.236 Y121.762 E.01639
G1 X112.106 Y122.891 E.04908
G1 X112.106 Y122.358 E.01639
G1 X113.236 Y121.229 E.04908
G1 X113.236 Y120.695 E.01639
G1 X112.106 Y121.825 E.04908
G1 X112.106 Y121.291 E.01639
G1 X113.236 Y120.162 E.04908
G1 X113.236 Y119.629 E.01639
G1 X112.002 Y120.862 E.05362
G1 X111.468 Y120.862 E.01639
G1 X113.236 Y119.095 E.0768
G3 X113.24 Y118.557 I12.849 J-.154 E.01654
G1 X110.935 Y120.862 E.1002
G1 X110.402 Y120.862 E.01639
G1 X111.531 Y119.733 E.04908
G1 X110.998 Y119.733 E.01639
G1 X109.868 Y120.862 E.04908
G1 X109.335 Y120.862 E.01639
G1 X110.464 Y119.733 E.04908
G1 X109.931 Y119.733 E.01639
G1 X108.802 Y120.862 E.04908
G1 X108.268 Y120.862 E.01639
G1 X109.398 Y119.733 E.04908
G1 X108.864 Y119.733 E.01639
G1 X107.735 Y120.862 E.04908
G1 X107.202 Y120.862 E.01639
G1 X108.331 Y119.733 E.04908
G1 X107.797 Y119.733 E.01639
G1 X106.668 Y120.862 E.04908
G1 X106.135 Y120.862 E.01639
G1 X107.264 Y119.733 E.04908
G1 X106.731 Y119.733 E.01639
G1 X105.601 Y120.862 E.04908
G1 X105.068 Y120.862 E.01639
G1 X106.197 Y119.733 E.04908
G1 X105.664 Y119.733 E.01639
G1 X104.535 Y120.862 E.04908
G1 X104.001 Y120.862 E.01639
G1 X105.131 Y119.733 E.04908
G1 X104.597 Y119.733 E.01639
G1 X103.468 Y120.862 E.04908
G1 X102.935 Y120.862 E.01639
G1 X104.064 Y119.733 E.04908
G1 X103.531 Y119.733 E.01639
G1 X102.401 Y120.862 E.04908
G1 X101.868 Y120.862 E.01639
G1 X102.997 Y119.733 E.04908
G1 X102.464 Y119.733 E.01639
G1 X101.334 Y120.862 E.04908
G1 X100.801 Y120.862 E.01639
G1 X101.93 Y119.733 E.04908
G1 X101.397 Y119.733 E.01639
G1 X100.268 Y120.862 E.04908
G1 X99.734 Y120.862 E.01639
G1 X100.864 Y119.733 E.04908
G1 X100.33 Y119.733 E.01639
G1 X98.212 Y121.852 E.09208
G1 X98.212 Y122.385 E.01639
G1 X99.341 Y121.256 E.04908
G1 X99.341 Y121.789 E.01639
G1 X98.212 Y122.918 E.04908
G1 X98.212 Y123.452 E.01639
G1 X99.341 Y122.322 E.04908
G1 X99.341 Y122.856 E.01639
G1 X98.212 Y123.985 E.04908
G1 X98.212 Y124.518 E.01639
G1 X99.341 Y123.389 E.04908
G1 X99.341 Y123.922 E.01639
G1 X98.212 Y125.052 E.04908
G1 X98.212 Y125.585 E.01639
G1 X99.341 Y124.456 E.04908
G1 X99.341 Y124.989 E.01639
G1 X98.212 Y126.118 E.04908
G1 X98.212 Y126.652 E.01639
G1 X99.341 Y125.523 E.04908
G1 X99.341 Y126.056 E.01639
G1 X98.212 Y127.185 E.04908
G1 X98.212 Y127.719 E.01639
G1 X99.341 Y126.589 E.04908
G1 X99.341 Y127.123 E.01639
G1 X98.212 Y128.252 E.04908
G1 X98.212 Y128.785 E.01639
G1 X99.341 Y127.656 E.04908
G1 X99.341 Y128.189 E.01639
G1 X98.212 Y129.319 E.04908
G1 X98.212 Y129.852 E.01639
G1 X99.341 Y128.723 E.04908
G1 X99.341 Y129.256 E.01639
G1 X98.212 Y130.385 E.04908
G1 X98.212 Y130.919 E.01639
G1 X99.341 Y129.789 E.04908
G1 X99.341 Y130.323 E.01639
G1 X98.212 Y131.452 E.04908
G1 X98.212 Y131.985 E.01639
G1 X99.341 Y130.856 E.04908
G1 X99.341 Y131.39 E.01639
G1 X98.212 Y132.519 E.04908
G1 X98.212 Y133.052 E.01639
G1 X99.341 Y131.923 E.04908
G1 X99.341 Y132.456 E.01639
G1 X98.212 Y133.586 E.04908
G1 X98.212 Y134.119 E.01639
G1 X99.341 Y132.99 E.04908
G1 X99.341 Y133.523 E.01639
G1 X98.212 Y134.652 E.04908
G1 X98.212 Y135.186 E.01639
G1 X99.341 Y134.056 E.04908
G1 X99.341 Y134.59 E.01639
G1 X98.212 Y135.719 E.04908
G1 X98.212 Y136.252 E.01639
G1 X99.341 Y135.123 E.04908
G1 X99.341 Y135.656 E.01639
G1 X98.212 Y136.786 E.04908
G1 X98.212 Y137.319 E.01639
G1 X99.341 Y136.19 E.04908
G1 X99.341 Y136.723 E.01639
G1 X98.212 Y137.852 E.04908
G1 X98.212 Y138.386 E.01639
G1 X99.341 Y137.257 E.04908
G1 X99.341 Y137.79 E.01639
G1 X98.212 Y138.919 E.04908
G1 X98.212 Y139.453 E.01639
G1 X99.341 Y138.323 E.04908
G1 X99.341 Y138.857 E.01639
G1 X98.212 Y139.986 E.04908
G1 X98.212 Y140.519 E.01639
G1 X99.341 Y139.39 E.04908
G1 X99.341 Y139.923 E.01639
G1 X98.212 Y141.053 E.04908
G1 X98.212 Y141.586 E.01639
G1 X99.341 Y140.457 E.04908
G1 X99.341 Y140.99 E.01639
G1 X98.212 Y142.119 E.04908
G1 X98.212 Y142.653 E.01639
G1 X99.341 Y141.523 E.04908
G1 X99.341 Y142.057 E.01639
G1 X98.212 Y143.186 E.04908
G1 X98.212 Y143.719 E.01639
G1 X99.341 Y142.59 E.04908
G1 X99.341 Y143.124 E.01639
G1 X98.212 Y144.253 E.04908
G1 X98.212 Y144.786 E.01639
G1 X99.341 Y143.657 E.04908
G1 X99.341 Y144.19 E.01639
G1 X98.212 Y145.32 E.04908
G1 X98.212 Y145.853 E.01639
G1 X99.341 Y144.724 E.04908
G1 X99.341 Y145.257 E.01639
G1 X98.212 Y146.386 E.04908
G1 X98.212 Y146.92 E.01639
G1 X99.341 Y145.79 E.04908
G1 X99.341 Y146.324 E.01639
G1 X98.212 Y147.453 E.04908
G1 X98.212 Y147.986 E.01639
G1 X99.341 Y146.857 E.04908
G1 X99.341 Y147.39 E.01639
G1 X98.212 Y148.52 E.04908
G1 X98.212 Y149.053 E.01639
G1 X99.341 Y147.924 E.04908
G1 X99.341 Y148.457 E.01639
G1 X98.212 Y149.587 E.04908
G1 X98.212 Y150.12 E.01639
G1 X99.341 Y148.991 E.04908
G1 X99.341 Y149.524 E.01639
G1 X98.212 Y150.653 E.04908
G1 X98.212 Y151.187 E.01639
G1 X99.341 Y150.057 E.04908
G1 X99.341 Y150.591 E.01639
G1 X98.212 Y151.72 E.04908
G1 X98.212 Y152.253 E.01639
G1 X99.341 Y151.124 E.04908
G1 X99.341 Y151.657 E.01639
G1 X98.212 Y152.787 E.04908
G1 X98.212 Y153.32 E.01639
G1 X99.341 Y152.191 E.04908
G1 X99.341 Y152.724 E.01639
G1 X98.212 Y153.853 E.04908
G1 X98.212 Y154.387 E.01639
G1 X99.341 Y153.257 E.04908
G1 X99.341 Y153.791 E.01639
G1 X98.212 Y154.92 E.04908
G1 X98.212 Y155.454 E.01639
G1 X99.341 Y154.324 E.04908
G1 X99.341 Y154.858 E.01639
G1 X98.212 Y155.987 E.04908
G1 X98.212 Y156.52 E.01639
G1 X99.341 Y155.391 E.04908
G1 X99.341 Y155.924 E.01639
G1 X98.212 Y157.054 E.04908
G1 X98.212 Y157.587 E.01639
G1 X99.341 Y156.458 E.04908
G1 X99.341 Y156.991 E.01639
G1 X98.212 Y158.12 E.04908
G1 X98.212 Y158.654 E.01639
G1 X99.341 Y157.524 E.04908
G1 X99.341 Y158.058 E.01639
G1 X98.212 Y159.187 E.04908
G1 X98.212 Y159.72 E.01639
G1 X99.341 Y158.591 E.04908
G1 X99.341 Y159.124 E.01639
G1 X98.212 Y160.254 E.04908
G1 X98.212 Y160.787 E.01639
G1 X99.341 Y159.658 E.04908
G1 X99.341 Y160.191 E.01639
G1 X98.212 Y161.321 E.04908
G1 X98.212 Y161.854 E.01639
G1 X99.341 Y160.725 E.04908
G1 X99.341 Y161.258 E.01639
G1 X98.212 Y162.387 E.04908
G1 X98.212 Y162.921 E.01639
G1 X99.341 Y161.791 E.04908
G1 X99.341 Y162.325 E.01639
G1 X98.212 Y163.454 E.04908
G1 X98.212 Y163.987 E.01639
G1 X99.341 Y162.858 E.04908
G1 X99.341 Y163.391 E.01639
G1 X98.212 Y164.521 E.04908
G1 X98.212 Y165.054 E.01639
G1 X99.341 Y163.925 E.04908
G1 X99.341 Y164.458 E.01639
G1 X98.212 Y165.587 E.04908
G1 X98.212 Y166.121 E.01639
G1 X99.341 Y164.992 E.04908
G1 X99.341 Y165.525 E.01639
G1 X98.212 Y166.654 E.04908
G1 X98.212 Y167.188 E.01639
G1 X99.341 Y166.058 E.04908
G1 X99.341 Y166.592 E.01639
G1 X98.212 Y167.721 E.04908
G1 X98.212 Y168.254 E.01639
G1 X99.341 Y167.125 E.04908
G1 X99.341 Y167.658 E.01639
G1 X98.212 Y168.788 E.04908
G2 X98.235 Y169.298 I3.907 J.082 E.01572
G1 X99.341 Y168.192 E.04809
G1 X99.341 Y168.725 E.01639
G1 X98.278 Y169.788 E.04621
G2 X98.357 Y170.242 I3.502 J-.38 E.01417
G1 X99.368 Y169.231 E.04394
G2 X99.411 Y169.722 I2.269 J.049 E.01516
G1 X98.454 Y170.679 E.0416
G2 X98.578 Y171.089 I2.406 J-.501 E.01317
G1 X99.491 Y170.175 E.03971
G2 X99.604 Y170.596 I2.46 J-.432 E.01341
G1 X98.714 Y171.485 E.03865
G1 X98.871 Y171.862 E.01255
G1 X99.742 Y170.991 E.03788
G1 X99.891 Y171.375 E.01266
G1 X99.045 Y172.221 E.03677
G2 X99.229 Y172.57 I2.089 J-.876 E.01215
G1 X100.064 Y171.736 E.03627
G2 X100.253 Y172.08 I2.06 J-.911 E.01208
G1 X99.437 Y172.896 E.03549
G2 X99.653 Y173.213 I1.921 J-1.076 E.01181
G1 X100.461 Y172.405 E.03512
G2 X100.693 Y172.707 I1.49 J-.91 E.01171
G1 X99.885 Y173.515 E.03515
G2 X100.131 Y173.802 I1.764 J-1.266 E.01164
G1 X100.931 Y173.002 E.03476
G2 X101.187 Y173.279 I1.393 J-1.032 E.01162
G1 X100.386 Y174.08 E.03481
M73 P60 R5
G2 X100.657 Y174.343 I2.063 J-1.863 E.0116
G1 X101.457 Y173.542 E.03478
G1 X101.747 Y173.786 E.01163
G1 X100.947 Y174.586 E.03478
G2 X101.244 Y174.822 I1.509 J-1.595 E.01168
G1 X102.058 Y174.009 E.03535
G1 X102.377 Y174.223 E.01182
G1 X101.558 Y175.042 E.03561
G2 X101.886 Y175.247 I1.338 J-1.772 E.01191
G1 X102.713 Y174.42 E.03596
G2 X103.067 Y174.6 I1.204 J-1.932 E.01221
G1 X102.224 Y175.442 E.03663
G2 X102.586 Y175.614 I1.163 J-1.979 E.01232
G1 X103.444 Y174.756 E.03732
G2 X103.843 Y174.891 I.971 J-2.207 E.01294
G1 X102.957 Y175.776 E.03849
G1 X103.348 Y175.919 E.01279
G1 X104.262 Y175.005 E.0397
G2 X104.705 Y175.095 I.737 J-2.487 E.01392
G1 X103.76 Y176.04 E.04107
G2 X104.185 Y176.148 I1.006 J-3.072 E.0135
G1 X105.177 Y175.157 E.04309
G1 X105.688 Y175.179 E.01572
G1 X104.642 Y176.225 E.04544
G2 X105.116 Y176.284 I.694 J-3.626 E.0147
G1 X106.254 Y175.146 E.04944
G2 X106.861 Y175.072 I-.034 J-2.81 E.01884
G1 X105.632 Y176.302 E.05344
G2 X106.176 Y176.291 I.21 J-3.116 E.01675
G1 X107.559 Y174.908 E.06012
G2 X108.427 Y174.573 I-2.133 J-6.827 E.02861
G1 X106.767 Y176.234 E.07217
G2 X107.422 Y176.111 I-.37 J-3.804 E.02052
G1 X113.032 Y170.501 E.24383
G3 X112.817 Y171.25 I-4.957 J-1.021 E.02397
G1 X108.176 Y175.891 E.20169
G2 X109.095 Y175.506 I-1.742 J-5.442 E.03065
G1 X112.432 Y172.169 E.14504
G3 X111.262 Y173.872 I-6.591 J-3.274 E.0637
G1 X109.894 Y175.24 E.05946
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X111.262 Y173.872 E-.73525
G1 X111.304 Y173.822 E-.02475
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/25
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
G3 Z.8 I1.217 J.011 P1  F30000
G1 X111.773 Y121.196 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.157 J9.125 E.21693
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.515 J9.334 E.20599
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.015 J.671 P1  F30000
G1 X125.523 Y94.714 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.62073
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
M73 P60 R4
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X85.924 Y94.714 E.62073
G1 X125.463 Y94.714 E1.3116
; WIPE_START
G1 F24000
G1 X124.432 Y96.427 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.977 J.726 P1  F30000
G1 X127.217 Y92.675 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.162 Y110.916 E.65539
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X84.23 Y92.675 E.65539
G1 X127.157 Y92.675 E1.31903
M204 S10000
G1 X126.604 Y93.287 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X126.2 Y92.883 E.01755
G1 X125.667 Y92.883
G1 X126.403 Y93.619 E.03198
G1 X126.202 Y93.951
G1 X125.134 Y92.883 E.04641
G1 X124.601 Y92.883
G1 X126.001 Y94.283 E.06083
G1 X125.676 Y94.491
G1 X124.067 Y92.883 E.06989
G1 X123.534 Y92.883
G1 X125.142 Y94.491 E.06989
G1 X124.609 Y94.491
G1 X123.001 Y92.883 E.06989
G1 X122.468 Y92.883
G1 X124.076 Y94.491 E.06989
G1 X123.543 Y94.491
G1 X121.934 Y92.883 E.06989
G1 X121.401 Y92.883
G1 X123.009 Y94.491 E.06989
G1 X122.476 Y94.491
G1 X120.868 Y92.883 E.06989
G1 X120.334 Y92.883
G1 X121.943 Y94.491 E.06989
G1 X121.409 Y94.491
G1 X119.801 Y92.883 E.06989
G1 X119.268 Y92.883
G1 X120.876 Y94.491 E.06989
G1 X120.343 Y94.491
G1 X118.735 Y92.883 E.06989
G1 X118.201 Y92.883
G1 X119.81 Y94.491 E.06989
G1 X119.276 Y94.491
G1 X117.668 Y92.883 E.06989
G1 X117.135 Y92.883
G1 X118.743 Y94.491 E.06989
G1 X118.21 Y94.491
G1 X116.602 Y92.883 E.06989
G1 X116.068 Y92.883
G1 X117.677 Y94.491 E.06989
G1 X117.143 Y94.491
G1 X115.535 Y92.883 E.06989
G1 X115.002 Y92.883
G1 X116.61 Y94.491 E.06989
G1 X116.077 Y94.491
G1 X114.468 Y92.883 E.06989
G1 X113.935 Y92.883
G1 X115.543 Y94.491 E.06989
G1 X115.01 Y94.491
G1 X113.402 Y92.883 E.06989
G1 X112.869 Y92.883
G1 X114.477 Y94.491 E.06989
G1 X113.944 Y94.491
G1 X112.335 Y92.883 E.06989
G1 X111.802 Y92.883
G1 X113.41 Y94.491 E.06989
G1 X112.877 Y94.491
G1 X111.269 Y92.883 E.06989
G1 X110.736 Y92.883
G1 X112.344 Y94.491 E.06989
G1 X111.811 Y94.491
G1 X110.202 Y92.883 E.06989
G1 X109.669 Y92.883
G1 X111.277 Y94.491 E.06989
G1 X110.744 Y94.491
G1 X109.136 Y92.883 E.06989
G1 X108.602 Y92.883
G1 X110.211 Y94.491 E.06989
M73 P61 R4
G1 X109.678 Y94.491
G1 X108.069 Y92.883 E.06989
G1 X107.536 Y92.883
G1 X109.144 Y94.491 E.06989
G1 X108.611 Y94.491
G1 X107.003 Y92.883 E.06989
G1 X106.469 Y92.883
G1 X108.078 Y94.491 E.06989
G1 X107.544 Y94.491
G1 X105.936 Y92.883 E.06989
G1 X105.403 Y92.883
G1 X107.011 Y94.491 E.06989
G1 X106.478 Y94.491
G1 X104.87 Y92.883 E.06989
G1 X104.336 Y92.883
G1 X105.945 Y94.491 E.06989
G1 X105.411 Y94.491
G1 X103.803 Y92.883 E.06989
G1 X103.27 Y92.883
G1 X104.878 Y94.491 E.06989
G1 X104.345 Y94.491
G1 X102.737 Y92.883 E.06989
G1 X102.203 Y92.883
G1 X103.812 Y94.491 E.06989
G1 X103.278 Y94.491
G1 X101.67 Y92.883 E.06989
G1 X101.137 Y92.883
G1 X102.745 Y94.491 E.06989
G1 X102.212 Y94.491
G1 X100.603 Y92.883 E.06989
G1 X100.07 Y92.883
G1 X101.678 Y94.491 E.06989
G1 X101.145 Y94.491
G1 X99.537 Y92.883 E.06989
G1 X99.004 Y92.883
G1 X100.612 Y94.491 E.06989
G1 X100.079 Y94.491
G1 X98.47 Y92.883 E.06989
G1 X97.937 Y92.883
G1 X99.545 Y94.491 E.06989
G1 X99.012 Y94.491
G1 X97.404 Y92.883 E.06989
G1 X96.871 Y92.883
G1 X98.479 Y94.491 E.06989
G1 X97.946 Y94.491
G1 X96.337 Y92.883 E.06989
G1 X95.804 Y92.883
G1 X97.412 Y94.491 E.06989
G1 X96.879 Y94.491
G1 X95.271 Y92.883 E.06989
G1 X94.737 Y92.883
G1 X96.346 Y94.491 E.06989
G1 X95.812 Y94.491
G1 X94.204 Y92.883 E.06989
G1 X93.671 Y92.883
G1 X95.279 Y94.491 E.06989
G1 X94.746 Y94.491
G1 X93.138 Y92.883 E.06989
G1 X92.604 Y92.883
G1 X94.213 Y94.491 E.06989
G1 X93.679 Y94.491
G1 X92.071 Y92.883 E.06989
G1 X91.538 Y92.883
G1 X93.146 Y94.491 E.06989
G1 X92.613 Y94.491
G1 X91.005 Y92.883 E.06989
G1 X90.471 Y92.883
G1 X92.08 Y94.491 E.06989
G1 X91.546 Y94.491
G1 X89.938 Y92.883 E.06989
G1 X89.405 Y92.883
G1 X91.013 Y94.491 E.06989
G1 X90.48 Y94.491
G1 X88.871 Y92.883 E.06989
G1 X88.338 Y92.883
G1 X89.947 Y94.491 E.06989
G1 X89.413 Y94.491
G1 X87.805 Y92.883 E.06989
G1 X87.272 Y92.883
G1 X88.88 Y94.491 E.06989
G1 X88.347 Y94.491
G1 X86.738 Y92.883 E.06989
G1 X86.205 Y92.883
G1 X87.813 Y94.491 E.06989
G1 X87.28 Y94.491
G1 X85.672 Y92.883 E.06989
G1 X85.139 Y92.883
G1 X86.747 Y94.491 E.06989
G1 X86.214 Y94.491
G1 X84.605 Y92.883 E.06989
M204 S10000
; WIPE_START
G1 F24000
G1 X86.02 Y94.297 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.746 J-.962 P1  F30000
G1 X85.745 Y94.51 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.313848
G1 F15000
G1 X85.605 Y94.331 E.00501
; LINE_WIDTH: 0.268712
G1 X85.465 Y94.153 E.00418
; LINE_WIDTH: 0.223576
G1 X85.325 Y93.974 E.00334
; LINE_WIDTH: 0.178441
G1 X85.185 Y93.795 E.00251
; LINE_WIDTH: 0.133305
G1 X85.044 Y93.617 E.00167
; WIPE_START
G1 F24000
G1 X85.185 Y93.795 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.057 J.603 P1  F30000
G1 X99.875 Y119.563 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421031
G1 F15000
G1 X101.174 Y120.862 E.0566
G1 X101.709 Y120.862 E.01648
G1 X100.579 Y119.733 E.04921
G1 X101.114 Y119.733 E.01648
G1 X102.243 Y120.862 E.04921
G1 X102.778 Y120.862 E.01648
G1 X101.649 Y119.733 E.04921
G1 X102.183 Y119.733 E.01648
G1 X103.313 Y120.862 E.04921
G1 X103.847 Y120.862 E.01648
G1 X102.718 Y119.733 E.04921
G1 X103.253 Y119.733 E.01648
G1 X104.382 Y120.862 E.04921
G1 X104.917 Y120.862 E.01648
G1 X103.788 Y119.733 E.04921
G1 X104.322 Y119.733 E.01648
G1 X105.452 Y120.862 E.04921
G1 X105.986 Y120.862 E.01648
G1 X104.857 Y119.733 E.04921
G1 X105.392 Y119.733 E.01648
G1 X106.521 Y120.862 E.04921
G1 X107.056 Y120.862 E.01648
G1 X105.927 Y119.733 E.04921
G1 X106.461 Y119.733 E.01648
G1 X107.591 Y120.862 E.04921
G1 X108.125 Y120.862 E.01648
G1 X106.996 Y119.733 E.04921
G1 X107.531 Y119.733 E.01648
G1 X108.66 Y120.862 E.04921
G1 X109.195 Y120.862 E.01648
G1 X108.065 Y119.733 E.04921
G1 X108.6 Y119.733 E.01648
G1 X109.729 Y120.862 E.04921
G1 X110.264 Y120.862 E.01648
G1 X109.135 Y119.733 E.04921
G1 X109.67 Y119.733 E.01648
G1 X110.799 Y120.862 E.04921
G1 X111.334 Y120.862 E.01648
G1 X110.204 Y119.733 E.04921
G1 X110.739 Y119.733 E.01648
G1 X113.236 Y122.229 E.10878
G1 X113.236 Y121.695 E.01648
G1 X111.274 Y119.733 E.08548
G1 X111.809 Y119.733 E.01648
G1 X113.236 Y121.16 E.06218
G1 X113.236 Y120.625 E.01648
G1 X112.2 Y119.589 E.04514
G1 X112.221 Y119.076 E.01583
G1 X113.236 Y120.091 E.0442
G1 X113.236 Y119.556 E.01648
G1 X112.243 Y118.563 E.04326
G1 X112.264 Y118.05 E.01583
G1 X113.236 Y119.021 E.04232
G3 X113.242 Y118.493 I12.62 J-.117 E.01629
G1 X112.286 Y117.537 E.04165
G1 X112.307 Y117.023 E.01583
G1 X113.259 Y117.975 E.04147
G1 X113.291 Y117.472 E.01553
G1 X112.329 Y116.51 E.04191
G1 X112.35 Y115.997 E.01583
G1 X113.341 Y116.988 E.04317
G3 X113.403 Y116.515 I5.667 J.5 E.0147
G1 X112.425 Y115.536 E.04264
G3 X112.516 Y115.093 I5.327 J.868 E.01395
G1 X113.475 Y116.052 E.04179
G1 X113.561 Y115.603 E.01408
G1 X112.618 Y114.66 E.0411
G3 X112.731 Y114.238 I5.081 J1.136 E.01346
G1 X113.658 Y115.166 E.04042
G3 X113.763 Y114.736 I5.172 J1.038 E.01363
G1 X112.849 Y113.822 E.03985
G1 X112.98 Y113.418 E.01307
G1 X113.88 Y114.318 E.03922
G3 X114.007 Y113.91 I4.93 J1.308 E.01317
G1 X113.117 Y113.021 E.03877
G1 X113.262 Y112.631 E.01281
G1 X114.14 Y113.508 E.03824
G1 X114.285 Y113.119 E.01281
G1 X113.416 Y112.25 E.03784
G1 X113.575 Y111.874 E.01258
G1 X114.437 Y112.736 E.03756
G1 X114.595 Y112.359 E.01258
G1 X113.745 Y111.51 E.03703
G3 X113.918 Y111.148 I4.394 J1.884 E.01235
G1 X114.764 Y111.994 E.03687
G3 X114.938 Y111.633 I4.387 J1.891 E.01235
G1 X114.102 Y110.797 E.03644
G3 X114.29 Y110.45 I4.226 J2.068 E.01216
G1 X115.122 Y111.282 E.03625
G3 X115.312 Y110.938 I4.206 J2.095 E.01213
G1 X114.486 Y110.112 E.036
G3 X114.685 Y109.776 I8.106 J4.572 E.01203
G1 X115.508 Y110.599 E.03587
G3 X115.709 Y110.265 I8.063 J4.624 E.01201
G1 X114.887 Y109.443 E.03583
G1 X115.088 Y109.11 E.012
G1 X115.911 Y109.932 E.03583
G1 X116.112 Y109.599 E.012
G1 X115.29 Y108.777 E.03583
G1 X115.492 Y108.444 E.012
G1 X116.314 Y109.266 E.03583
G1 X116.516 Y108.933 E.012
G1 X115.694 Y108.111 E.03583
G1 X115.895 Y107.778 E.012
G1 X116.718 Y108.6 E.03583
G1 X116.919 Y108.267 E.012
G1 X116.097 Y107.445 E.03583
G1 X116.299 Y107.112 E.012
G1 X117.121 Y107.934 E.03583
G1 X117.323 Y107.601 E.012
G1 X116.501 Y106.779 E.03583
G1 X116.703 Y106.446 E.012
G1 X117.525 Y107.268 E.03583
G1 X117.727 Y106.935 E.012
G1 X116.904 Y106.113 E.03583
G1 X117.106 Y105.78 E.012
G1 X117.928 Y106.603 E.03583
G1 X118.13 Y106.27 E.012
G1 X117.308 Y105.447 E.03583
G1 X117.51 Y105.114 E.012
G1 X118.332 Y105.937 E.03583
G1 X118.534 Y105.604 E.012
G1 X117.712 Y104.781 E.03583
G1 X117.913 Y104.449 E.012
G1 X118.736 Y105.271 E.03583
M73 P62 R4
G1 X118.937 Y104.938 E.012
G1 X118.115 Y104.116 E.03583
G1 X118.317 Y103.783 E.012
G1 X119.139 Y104.605 E.03583
G1 X119.341 Y104.272 E.012
G1 X110.116 Y95.047 E.40197
G1 X110.651 Y95.047 E.01648
G1 X119.543 Y103.939 E.38746
G1 X119.744 Y103.606 E.012
G1 X111.185 Y95.047 E.37295
G1 X111.72 Y95.047 E.01648
G1 X119.946 Y103.273 E.35845
G1 X120.148 Y102.94 E.012
G1 X112.255 Y95.047 E.34394
G1 X112.789 Y95.047 E.01648
G1 X120.35 Y102.607 E.32943
G1 X120.552 Y102.274 E.012
G1 X113.324 Y95.047 E.31492
G1 X113.859 Y95.047 E.01648
G1 X120.753 Y101.941 E.30042
G1 X120.955 Y101.608 E.012
G1 X114.394 Y95.047 E.28591
G1 X114.928 Y95.047 E.01648
G1 X121.157 Y101.275 E.2714
G1 X121.359 Y100.942 E.012
G1 X115.463 Y95.047 E.25689
G1 X115.998 Y95.047 E.01648
G1 X121.56 Y100.609 E.24239
G1 X121.762 Y100.277 E.012
G1 X116.533 Y95.047 E.22788
G1 X117.067 Y95.047 E.01648
G1 X121.964 Y99.944 E.21337
G1 X122.166 Y99.611 E.012
G1 X117.602 Y95.047 E.19886
G1 X118.137 Y95.047 E.01648
G1 X122.368 Y99.278 E.18436
G1 X122.569 Y98.945 E.012
G1 X118.671 Y95.047 E.16985
G1 X119.206 Y95.047 E.01648
G1 X122.771 Y98.612 E.15534
G1 X122.973 Y98.279 E.012
G1 X119.741 Y95.047 E.14083
G1 X120.276 Y95.047 E.01648
G1 X123.175 Y97.946 E.12632
G1 X123.377 Y97.613 E.012
G1 X120.81 Y95.047 E.11182
G1 X121.345 Y95.047 E.01648
G1 X123.578 Y97.28 E.09731
G1 X123.78 Y96.947 E.012
G1 X121.88 Y95.047 E.0828
G1 X122.415 Y95.047 E.01648
G1 X123.982 Y96.614 E.06829
G1 X124.184 Y96.281 E.012
G1 X122.949 Y95.047 E.05379
G1 X123.484 Y95.047 E.01648
G1 X124.385 Y95.948 E.03928
G1 X124.587 Y95.615 E.012
G1 X124.019 Y95.047 E.02477
G1 X124.553 Y95.047 E.01648
G1 X124.913 Y95.406 E.01565
G1 X118.054 Y103.519 F30000
G1 F15000
G1 X109.581 Y95.047 E.36918
G1 X109.046 Y95.047 E.01648
G1 X117.349 Y103.35 E.36179
G1 X116.814 Y103.35 E.01648
G1 X108.512 Y95.047 E.36179
G1 X107.977 Y95.047 E.01648
G1 X116.28 Y103.35 E.36179
G1 X115.745 Y103.35 E.01648
G1 X107.442 Y95.047 E.36179
G1 X106.907 Y95.047 E.01648
G1 X115.21 Y103.35 E.36179
G1 X114.676 Y103.35 E.01648
G1 X106.373 Y95.047 E.36179
G1 X105.838 Y95.047 E.01648
G1 X114.141 Y103.35 E.36179
G1 X113.606 Y103.35 E.01648
G1 X105.303 Y95.047 E.36179
G1 X104.768 Y95.047 E.01648
G1 X113.071 Y103.35 E.36179
G1 X112.537 Y103.35 E.01648
G1 X104.234 Y95.047 E.36179
G1 X103.699 Y95.047 E.01648
G1 X112.002 Y103.35 E.36179
G1 X111.467 Y103.35 E.01648
G1 X103.164 Y95.047 E.36179
G1 X102.63 Y95.047 E.01648
G1 X110.932 Y103.35 E.36179
G1 X110.398 Y103.35 E.01648
G1 X102.095 Y95.047 E.36179
G1 X101.56 Y95.047 E.01648
G1 X109.863 Y103.35 E.36179
G1 X109.328 Y103.35 E.01648
G1 X101.025 Y95.047 E.36179
G1 X100.491 Y95.047 E.01648
G1 X108.793 Y103.35 E.36179
G1 X108.259 Y103.35 E.01648
G1 X99.956 Y95.047 E.36179
G1 X99.421 Y95.047 E.01648
G1 X107.724 Y103.35 E.36179
G1 X107.189 Y103.35 E.01648
G1 X98.886 Y95.047 E.36179
G1 X98.352 Y95.047 E.01648
G1 X106.655 Y103.35 E.36179
G1 X106.12 Y103.35 E.01648
G1 X97.817 Y95.047 E.36179
G1 X97.282 Y95.047 E.01648
G1 X105.585 Y103.35 E.36179
G1 X105.05 Y103.35 E.01648
G1 X96.748 Y95.047 E.36179
G1 X96.213 Y95.047 E.01648
G1 X104.516 Y103.35 E.36179
G1 X103.981 Y103.35 E.01648
G1 X95.678 Y95.047 E.36179
G1 X95.143 Y95.047 E.01648
G1 X103.446 Y103.35 E.36179
G1 X102.911 Y103.35 E.01648
G1 X94.609 Y95.047 E.36179
G1 X94.074 Y95.047 E.01648
G1 X102.377 Y103.35 E.36179
G1 X101.842 Y103.35 E.01648
G1 X93.539 Y95.047 E.36179
G1 X93.004 Y95.047 E.01648
G1 X101.307 Y103.35 E.36179
G1 X100.773 Y103.35 E.01648
G1 X92.47 Y95.047 E.36179
G1 X91.935 Y95.047 E.01648
G1 X100.238 Y103.35 E.36179
G1 X99.703 Y103.35 E.01648
G1 X91.4 Y95.047 E.36179
G1 X90.866 Y95.047 E.01648
G1 X99.168 Y103.35 E.36179
G1 X98.634 Y103.35 E.01648
G1 X90.331 Y95.047 E.36179
G1 X89.796 Y95.047 E.01648
G1 X98.099 Y103.35 E.36179
G1 X97.564 Y103.35 E.01648
G1 X89.261 Y95.047 E.36179
G1 X88.727 Y95.047 E.01648
G1 X97.029 Y103.35 E.36179
G1 X96.495 Y103.35 E.01648
G1 X88.192 Y95.047 E.36179
G1 X87.657 Y95.047 E.01648
G1 X95.96 Y103.35 E.36179
G1 X95.425 Y103.35 E.01648
G1 X87.122 Y95.047 E.36179
G1 X86.588 Y95.047 E.01648
G1 X94.891 Y103.35 E.36179
G1 X94.356 Y103.35 E.01648
G1 X87.227 Y96.221 E.31062
G1 X88.05 Y97.578 E.0489
G1 X93.821 Y103.35 E.25147
G1 X93.286 Y103.35 E.01648
G1 X88.873 Y98.936 E.19233
G1 X89.695 Y100.293 E.0489
G1 X93.047 Y103.645 E.14606
G1 X93.87 Y105.003 E.0489
G1 X90.518 Y101.651 E.14606
G1 X91.34 Y103.008 E.0489
G1 X94.693 Y106.36 E.14606
G1 X95.515 Y107.717 E.0489
G1 X92.163 Y104.365 E.14606
G1 X92.986 Y105.723 E.0489
G1 X96.338 Y109.075 E.14606
G3 X97.128 Y110.4 I-31.198 J19.502 E.04753
G1 X93.808 Y107.08 E.14464
G1 X94.631 Y108.438 E.0489
G1 X97.701 Y111.508 E.13378
G3 X98.119 Y112.461 I-11.147 J5.46 E.03207
G1 X95.454 Y109.795 E.11615
G3 X96.236 Y111.112 I-31.007 J19.306 E.04719
G1 X98.431 Y113.307 E.09565
G3 X98.674 Y114.084 I-9.143 J3.28 E.0251
G1 X96.771 Y112.182 E.0829
G3 X97.156 Y113.102 I-16.467 J7.434 E.03073
G1 X98.865 Y114.81 E.07446
G3 X99.015 Y115.495 I-8.082 J2.128 E.0216
G1 X97.445 Y113.925 E.06839
G3 X97.669 Y114.684 I-8.932 J3.05 E.02438
G1 X99.102 Y116.117 E.06242
G1 X99.125 Y116.675 E.01721
G1 X97.842 Y115.392 E.05592
G3 X97.973 Y116.057 I-7.876 J1.896 E.02091
G1 X99.149 Y117.233 E.05123
G1 X99.172 Y117.791 E.01721
G1 X98.07 Y116.689 E.04803
G3 X98.138 Y117.292 I-7.153 J1.113 E.0187
G1 X99.196 Y118.349 E.04608
G1 X99.219 Y118.907 E.01721
G1 X98.182 Y117.87 E.0452
G3 X98.204 Y118.427 I-6.631 J.548 E.01719
G1 X100.639 Y120.862 E.1061
G1 X100.104 Y120.862 E.01648
G1 X98.212 Y118.97 E.08247
G1 X98.212 Y119.504 E.01648
G1 X99.57 Y120.862 E.05917
G1 X99.341 Y120.862 E.00704
G1 X99.341 Y121.168 E.00943
G1 X98.212 Y120.039 E.04921
G1 X98.212 Y120.574 E.01648
G1 X99.341 Y121.703 E.04921
G1 X99.341 Y122.238 E.01648
G1 X98.212 Y121.109 E.04921
G1 X98.212 Y121.643 E.01648
G1 X99.341 Y122.773 E.04921
G1 X99.341 Y123.307 E.01648
G1 X98.212 Y122.178 E.04921
G1 X98.212 Y122.713 E.01648
G1 X99.341 Y123.842 E.04921
G1 X99.341 Y124.377 E.01648
G1 X98.212 Y123.248 E.04921
G1 X98.212 Y123.782 E.01648
G1 X99.341 Y124.912 E.04921
G1 X99.341 Y125.446 E.01648
G1 X98.212 Y124.317 E.04921
G1 X98.212 Y124.852 E.01648
G1 X99.341 Y125.981 E.04921
G1 X99.341 Y126.516 E.01648
G1 X98.212 Y125.386 E.04921
G1 X98.212 Y125.921 E.01648
G1 X99.341 Y127.051 E.04921
G1 X99.341 Y127.585 E.01648
G1 X98.212 Y126.456 E.04921
G1 X98.212 Y126.991 E.01648
G1 X99.341 Y128.12 E.04921
G1 X99.341 Y128.655 E.01648
G1 X98.212 Y127.525 E.04921
G1 X98.212 Y128.06 E.01648
G1 X99.341 Y129.189 E.04921
G1 X99.341 Y129.724 E.01648
G1 X98.212 Y128.595 E.04921
G1 X98.212 Y129.13 E.01648
G1 X99.341 Y130.259 E.04921
G1 X99.341 Y130.794 E.01648
G1 X98.212 Y129.664 E.04921
G1 X98.212 Y130.199 E.01648
G1 X99.341 Y131.328 E.04921
G1 X99.341 Y131.863 E.01648
G1 X98.212 Y130.734 E.04921
G1 X98.212 Y131.268 E.01648
G1 X99.341 Y132.398 E.04921
G1 X99.341 Y132.933 E.01648
G1 X98.212 Y131.803 E.04921
G1 X98.212 Y132.338 E.01648
G1 X99.341 Y133.467 E.04921
G1 X99.341 Y134.002 E.01648
G1 X98.212 Y132.873 E.04921
G1 X98.212 Y133.407 E.01648
G1 X99.341 Y134.537 E.04921
G1 X99.341 Y135.071 E.01648
G1 X98.212 Y133.942 E.04921
G1 X98.212 Y134.477 E.01648
G1 X99.341 Y135.606 E.04921
G1 X99.341 Y136.141 E.01648
G1 X98.212 Y135.012 E.04921
M73 P63 R4
G1 X98.212 Y135.546 E.01648
G1 X99.341 Y136.676 E.04921
G1 X99.341 Y137.21 E.01648
G1 X98.212 Y136.081 E.04921
G1 X98.212 Y136.616 E.01648
G1 X99.341 Y137.745 E.04921
G1 X99.341 Y138.28 E.01648
G1 X98.212 Y137.151 E.04921
G1 X98.212 Y137.685 E.01648
G1 X99.341 Y138.815 E.04921
G1 X99.341 Y139.349 E.01648
G1 X98.212 Y138.22 E.04921
G1 X98.212 Y138.755 E.01648
G1 X99.341 Y139.884 E.04921
G1 X99.341 Y140.419 E.01648
G1 X98.212 Y139.289 E.04921
G1 X98.212 Y139.824 E.01648
G1 X99.341 Y140.953 E.04921
G1 X99.341 Y141.488 E.01648
G1 X98.212 Y140.359 E.04921
G1 X98.212 Y140.894 E.01648
G1 X99.341 Y142.023 E.04921
G1 X99.341 Y142.558 E.01648
G1 X98.212 Y141.428 E.04921
G1 X98.212 Y141.963 E.01648
G1 X99.341 Y143.092 E.04921
G1 X99.341 Y143.627 E.01648
G1 X98.212 Y142.498 E.04921
G1 X98.212 Y143.033 E.01648
G1 X99.341 Y144.162 E.04921
G1 X99.341 Y144.697 E.01648
G1 X98.212 Y143.567 E.04921
G1 X98.212 Y144.102 E.01648
G1 X99.341 Y145.231 E.04921
G1 X99.341 Y145.766 E.01648
G1 X98.212 Y144.637 E.04921
G1 X98.212 Y145.171 E.01648
G1 X99.341 Y146.301 E.04921
G1 X99.341 Y146.835 E.01648
G1 X98.212 Y145.706 E.04921
G1 X98.212 Y146.241 E.01648
G1 X99.341 Y147.37 E.04921
G1 X99.341 Y147.905 E.01648
G1 X98.212 Y146.776 E.04921
G1 X98.212 Y147.31 E.01648
G1 X99.341 Y148.44 E.04921
G1 X99.341 Y148.974 E.01648
G1 X98.212 Y147.845 E.04921
G1 X98.212 Y148.38 E.01648
G1 X99.341 Y149.509 E.04921
G1 X99.341 Y150.044 E.01648
G1 X98.212 Y148.915 E.04921
G1 X98.212 Y149.449 E.01648
G1 X99.341 Y150.579 E.04921
G1 X99.341 Y151.113 E.01648
G1 X98.212 Y149.984 E.04921
G1 X98.212 Y150.519 E.01648
G1 X99.341 Y151.648 E.04921
G1 X99.341 Y152.183 E.01648
G1 X98.212 Y151.053 E.04921
G1 X98.212 Y151.588 E.01648
G1 X99.341 Y152.718 E.04921
G1 X99.341 Y153.252 E.01648
G1 X98.212 Y152.123 E.04921
G1 X98.212 Y152.658 E.01648
G1 X99.341 Y153.787 E.04921
G1 X99.341 Y154.322 E.01648
G1 X98.212 Y153.192 E.04921
G1 X98.212 Y153.727 E.01648
G1 X99.341 Y154.856 E.04921
G1 X99.341 Y155.391 E.01648
G1 X98.212 Y154.262 E.04921
G1 X98.212 Y154.797 E.01648
G1 X99.341 Y155.926 E.04921
G1 X99.341 Y156.461 E.01648
G1 X98.212 Y155.331 E.04921
G1 X98.212 Y155.866 E.01648
G1 X99.341 Y156.995 E.04921
G1 X99.341 Y157.53 E.01648
G1 X98.212 Y156.401 E.04921
G1 X98.212 Y156.936 E.01648
G1 X99.341 Y158.065 E.04921
G1 X99.341 Y158.6 E.01648
G1 X98.212 Y157.47 E.04921
G1 X98.212 Y158.005 E.01648
G1 X99.341 Y159.134 E.04921
G1 X99.341 Y159.669 E.01648
G1 X98.212 Y158.54 E.04921
G1 X98.212 Y159.074 E.01648
G1 X99.341 Y160.204 E.04921
G1 X99.341 Y160.738 E.01648
G1 X98.212 Y159.609 E.04921
G1 X98.212 Y160.144 E.01648
G1 X99.341 Y161.273 E.04921
G1 X99.341 Y161.808 E.01648
G1 X98.212 Y160.679 E.04921
G1 X98.212 Y161.213 E.01648
G1 X99.341 Y162.343 E.04921
G1 X99.341 Y162.877 E.01648
G1 X98.212 Y161.748 E.04921
G1 X98.212 Y162.283 E.01648
G1 X99.341 Y163.412 E.04921
G1 X99.341 Y163.947 E.01648
G1 X98.212 Y162.818 E.04921
G1 X98.212 Y163.352 E.01648
G1 X99.341 Y164.482 E.04921
G1 X99.341 Y165.016 E.01648
G1 X98.212 Y163.887 E.04921
G1 X98.212 Y164.422 E.01648
G1 X99.341 Y165.551 E.04921
G1 X99.341 Y166.086 E.01648
G1 X98.212 Y164.956 E.04921
G1 X98.212 Y165.491 E.01648
G1 X99.341 Y166.62 E.04921
G1 X99.341 Y167.155 E.01648
G1 X98.212 Y166.026 E.04921
G1 X98.212 Y166.561 E.01648
G1 X99.341 Y167.69 E.04921
G1 X99.341 Y168.225 E.01648
G1 X98.212 Y167.095 E.04921
G1 X98.212 Y167.63 E.01648
G1 X99.341 Y168.759 E.04921
G2 X99.375 Y169.328 I4.329 J.028 E.01756
G1 X98.212 Y168.165 E.05068
G1 X98.212 Y168.7 E.01648
G1 X99.449 Y169.937 E.05392
G2 X99.617 Y170.639 I3.964 J-.574 E.02227
G1 X98.231 Y169.253 E.06039
G2 X98.286 Y169.844 I4.534 J-.13 E.01829
G1 X100.338 Y171.896 E.08942
G1 X104.24 Y176.332 F30000
G1 F15000
G1 X98.416 Y170.508 E.25374
G2 X98.631 Y171.258 I4.388 J-.85 E.02404
G1 X103.26 Y175.887 E.20171
G3 X102.337 Y175.498 I1.76 J-5.475 E.03089
G1 X99.03 Y172.192 E.14408
G2 X100.406 Y174.102 I6.536 J-3.256 E.07285
G1 X101.541 Y175.237 E.04944
G1 X102.626 Y174.183 F30000
G1 F15000
G1 X104.671 Y176.229 E.08914
G2 X105.271 Y176.294 I.808 J-4.631 E.01861
G1 X103.88 Y174.903 E.06062
G2 X104.59 Y175.078 I1.357 J-3.972 E.02256
G1 X105.814 Y176.302 E.05332
G2 X106.325 Y176.278 I.119 J-2.93 E.01578
G1 X105.205 Y175.158 E.0488
G1 X105.76 Y175.179 E.01712
G1 X106.808 Y176.226 E.04566
G1 X107.263 Y176.146 E.01422
G1 X106.262 Y175.146 E.0436
G2 X106.744 Y175.093 I0 J-2.227 E.01497
G1 X107.691 Y176.04 E.04124
G2 X108.103 Y175.917 I-.492 J-2.419 E.01327
G1 X107.192 Y175.006 E.03971
G1 X107.614 Y174.893 E.01345
G1 X108.495 Y175.775 E.03841
G2 X108.867 Y175.612 I-.745 J-2.207 E.01252
G1 X108.008 Y174.752 E.03745
G2 X108.384 Y174.594 I-.721 J-2.227 E.01259
G1 X109.229 Y175.439 E.03684
G1 X109.568 Y175.243 E.01206
G1 X108.743 Y174.418 E.03596
G1 X109.082 Y174.222 E.01206
G1 X109.899 Y175.04 E.03562
G2 X110.213 Y174.818 I-2.373 J-3.695 E.01183
G1 X109.401 Y174.007 E.03535
G2 X109.706 Y173.777 I-.897 J-1.506 E.01179
G1 X110.508 Y174.579 E.03494
G1 X110.797 Y174.336 E.01164
G1 X109.991 Y173.527 E.03519
G2 X110.272 Y173.273 I-1.02 J-1.408 E.01169
G1 X111.066 Y174.068 E.03461
G2 X111.327 Y173.794 I-1.432 J-1.627 E.01167
G1 X110.527 Y172.994 E.03485
G2 X110.768 Y172.7 I-1.564 J-1.52 E.01173
G1 X111.571 Y173.503 E.03502
G2 X111.802 Y173.2 I-1.619 J-1.472 E.01177
G1 X110.995 Y172.392 E.03519
G1 X111.203 Y172.066 E.01193
G1 X112.023 Y172.885 E.03572
G2 X112.222 Y172.55 I-1.815 J-1.309 E.01203
G1 X111.392 Y171.72 E.03619
G2 X111.565 Y171.358 I-1.977 J-1.172 E.01236
G1 X112.414 Y172.207 E.03698
G1 X112.584 Y171.842 E.0124
G1 X111.722 Y170.98 E.03756
G1 X111.85 Y170.574 E.01313
G1 X112.739 Y171.463 E.03875
G1 X112.882 Y171.071 E.01285
G1 X111.957 Y170.146 E.04033
G2 X112.038 Y169.692 I-2.551 J-.691 E.01421
G1 X112.996 Y170.65 E.04176
G2 X113.098 Y170.218 I-3.249 J-.994 E.01371
G1 X112.089 Y169.208 E.04398
G2 X112.106 Y168.691 I-5.875 J-.457 E.01595
G1 X113.167 Y169.752 E.04622
G2 X113.215 Y169.265 I-2.754 J-.515 E.0151
G1 X112.106 Y168.156 E.0483
G1 X112.106 Y167.622 E.01648
G1 X113.236 Y168.751 E.04921
G1 X113.236 Y168.216 E.01648
G1 X112.106 Y167.087 E.04921
G1 X112.106 Y166.552 E.01648
G1 X113.236 Y167.681 E.04921
G1 X113.236 Y167.147 E.01648
G1 X112.106 Y166.017 E.04921
G1 X112.106 Y165.483 E.01648
G1 X113.236 Y166.612 E.04921
G1 X113.236 Y166.077 E.01648
G1 X112.106 Y164.948 E.04921
G1 X112.106 Y164.413 E.01648
G1 X113.236 Y165.543 E.04921
G1 X113.236 Y165.008 E.01648
G1 X112.106 Y163.879 E.04921
G1 X112.106 Y163.344 E.01648
G1 X113.236 Y164.473 E.04921
G1 X113.236 Y163.938 E.01648
G1 X112.106 Y162.809 E.04921
G1 X112.106 Y162.274 E.01648
G1 X113.236 Y163.404 E.04921
G1 X113.236 Y162.869 E.01648
G1 X112.106 Y161.74 E.04921
G1 X112.106 Y161.205 E.01648
G1 X113.236 Y162.334 E.04921
G1 X113.236 Y161.799 E.01648
G1 X112.106 Y160.67 E.04921
G1 X112.106 Y160.135 E.01648
G1 X113.236 Y161.265 E.04921
G1 X113.236 Y160.73 E.01648
G1 X112.106 Y159.601 E.04921
G1 X112.106 Y159.066 E.01648
G1 X113.236 Y160.195 E.04921
G1 X113.236 Y159.661 E.01648
G1 X112.106 Y158.531 E.04921
G1 X112.106 Y157.996 E.01648
G1 X113.236 Y159.126 E.04921
G1 X113.236 Y158.591 E.01648
G1 X112.106 Y157.462 E.04921
G1 X112.106 Y156.927 E.01648
G1 X113.236 Y158.056 E.04921
G1 X113.236 Y157.522 E.01648
G1 X112.106 Y156.392 E.04921
G1 X112.106 Y155.858 E.01648
G1 X113.236 Y156.987 E.04921
G1 X113.236 Y156.452 E.01648
G1 X112.106 Y155.323 E.04921
G1 X112.106 Y154.788 E.01648
G1 X113.236 Y155.917 E.04921
G1 X113.236 Y155.383 E.01648
G1 X112.106 Y154.253 E.04921
G1 X112.106 Y153.719 E.01648
G1 X113.236 Y154.848 E.04921
G1 X113.236 Y154.313 E.01648
G1 X112.106 Y153.184 E.04921
G1 X112.106 Y152.649 E.01648
G1 X113.236 Y153.778 E.04921
G1 X113.236 Y153.244 E.01648
G1 X112.106 Y152.114 E.04921
G1 X112.106 Y151.58 E.01648
G1 X113.236 Y152.709 E.04921
G1 X113.236 Y152.174 E.01648
G1 X112.106 Y151.045 E.04921
G1 X112.106 Y150.51 E.01648
G1 X113.236 Y151.64 E.04921
G1 X113.236 Y151.105 E.01648
G1 X112.106 Y149.976 E.04921
G1 X112.106 Y149.441 E.01648
G1 X113.236 Y150.57 E.04921
G1 X113.236 Y150.035 E.01648
G1 X112.106 Y148.906 E.04921
G1 X112.106 Y148.371 E.01648
G1 X113.236 Y149.501 E.04921
G1 X113.236 Y148.966 E.01648
G1 X112.106 Y147.837 E.04921
G1 X112.106 Y147.302 E.01648
G1 X113.236 Y148.431 E.04921
G1 X113.236 Y147.896 E.01648
G1 X112.106 Y146.767 E.04921
G1 X112.106 Y146.232 E.01648
G1 X113.236 Y147.362 E.04921
G1 X113.236 Y146.827 E.01648
G1 X112.106 Y145.698 E.04921
G1 X112.106 Y145.163 E.01648
G1 X113.236 Y146.292 E.04921
G1 X113.236 Y145.758 E.01648
G1 X112.106 Y144.628 E.04921
G1 X112.106 Y144.094 E.01648
G1 X113.236 Y145.223 E.04921
G1 X113.236 Y144.688 E.01648
G1 X112.106 Y143.559 E.04921
G1 X112.106 Y143.024 E.01648
G1 X113.236 Y144.153 E.04921
G1 X113.236 Y143.619 E.01648
G1 X112.106 Y142.489 E.04921
G1 X112.106 Y141.955 E.01648
G1 X113.236 Y143.084 E.04921
G1 X113.236 Y142.549 E.01648
G1 X112.106 Y141.42 E.04921
G1 X112.106 Y140.885 E.01648
G1 X113.236 Y142.014 E.04921
G1 X113.236 Y141.48 E.01648
G1 X112.106 Y140.35 E.04921
G1 X112.106 Y139.816 E.01648
G1 X113.236 Y140.945 E.04921
G1 X113.236 Y140.41 E.01648
G1 X112.106 Y139.281 E.04921
G1 X112.106 Y138.746 E.01648
G1 X113.236 Y139.876 E.04921
G1 X113.236 Y139.341 E.01648
G1 X112.106 Y138.211 E.04921
G1 X112.106 Y137.677 E.01648
G1 X113.236 Y138.806 E.04921
G1 X113.236 Y138.271 E.01648
G1 X112.106 Y137.142 E.04921
G1 X112.106 Y136.607 E.01648
G1 X113.236 Y137.737 E.04921
G1 X113.236 Y137.202 E.01648
G1 X112.106 Y136.073 E.04921
G1 X112.106 Y135.538 E.01648
G1 X113.236 Y136.667 E.04921
G1 X113.236 Y136.132 E.01648
G1 X112.106 Y135.003 E.04921
G1 X112.106 Y134.468 E.01648
G1 X113.236 Y135.598 E.04921
G1 X113.236 Y135.063 E.01648
G1 X112.106 Y133.934 E.04921
G1 X112.106 Y133.399 E.01648
G1 X113.236 Y134.528 E.04921
G1 X113.236 Y133.993 E.01648
G1 X112.106 Y132.864 E.04921
G1 X112.106 Y132.329 E.01648
G1 X113.236 Y133.459 E.04921
G1 X113.236 Y132.924 E.01648
G1 X112.106 Y131.795 E.04921
G1 X112.106 Y131.26 E.01648
G1 X113.236 Y132.389 E.04921
G1 X113.236 Y131.855 E.01648
G1 X112.106 Y130.725 E.04921
G1 X112.106 Y130.191 E.01648
G1 X113.236 Y131.32 E.04921
G1 X113.236 Y130.785 E.01648
G1 X112.106 Y129.656 E.04921
G1 X112.106 Y129.121 E.01648
G1 X113.236 Y130.25 E.04921
G1 X113.236 Y129.716 E.01648
G1 X112.106 Y128.586 E.04921
G1 X112.106 Y128.052 E.01648
G1 X113.236 Y129.181 E.04921
G1 X113.236 Y128.646 E.01648
G1 X112.106 Y127.517 E.04921
G1 X112.106 Y126.982 E.01648
G1 X113.236 Y128.111 E.04921
G1 X113.236 Y127.577 E.01648
G1 X112.106 Y126.447 E.04921
G1 X112.106 Y125.913 E.01648
G1 X113.236 Y127.042 E.04921
G1 X113.236 Y126.507 E.01648
G1 X112.106 Y125.378 E.04921
G1 X112.106 Y124.843 E.01648
G1 X113.236 Y125.973 E.04921
G1 X113.236 Y125.438 E.01648
G1 X112.106 Y124.309 E.04921
G1 X112.106 Y123.774 E.01648
G1 X113.236 Y124.903 E.04921
G1 X113.236 Y124.368 E.01648
G1 X112.106 Y123.239 E.04921
G1 X112.106 Y122.704 E.01648
G1 X113.236 Y123.834 E.04921
G1 X113.236 Y123.299 E.01648
G1 X112.106 Y122.17 E.04921
G1 X112.106 Y121.635 E.01648
G1 X113.405 Y122.934 E.0566
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.106 Y121.635 E-.69808
G1 X112.106 Y121.798 E-.06192
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/25
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
G3 Z1 I1.065 J-.589 P1  F30000
G1 X111.773 Y121.196 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.196 J9.14 E.21692
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.554 J9.349 E.20599
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
M73 P64 R4
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.014 J.673 P1  F30000
G1 X124.814 Y95.884 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.57533
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X86.633 Y95.884 E.57533
G1 X124.754 Y95.884 E1.26455
; WIPE_START
G1 F24000
G1 X123.723 Y97.597 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.977 J.725 P1  F30000
G1 X126.508 Y93.846 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.162 Y110.916 E.61334
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X84.939 Y93.846 E.61334
G1 X126.448 Y93.846 E1.27544
M204 S10000
; WIPE_START
G1 F24000
G1 X125.416 Y95.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.151 J-1.208 P1  F30000
G1 X124.597 Y95.661 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X126.039 Y94.219 E.0627
G1 X125.672 Y94.053
G1 X124.063 Y95.661 E.06989
G1 X123.53 Y95.661
G1 X125.138 Y94.053 E.06989
G1 X124.605 Y94.053
G1 X122.997 Y95.661 E.06989
G1 X122.463 Y95.661
G1 X124.072 Y94.053 E.06989
G1 X123.538 Y94.053
G1 X121.93 Y95.661 E.06989
G1 X121.397 Y95.661
G1 X123.005 Y94.053 E.06989
G1 X122.472 Y94.053
G1 X120.864 Y95.661 E.06989
G1 X120.33 Y95.661
G1 X121.939 Y94.053 E.06989
G1 X121.405 Y94.053
G1 X119.797 Y95.661 E.06989
G1 X119.264 Y95.661
G1 X120.872 Y94.053 E.06989
G1 X120.339 Y94.053
G1 X118.731 Y95.661 E.06989
G1 X118.197 Y95.661
G1 X119.806 Y94.053 E.06989
G1 X119.272 Y94.053
G1 X117.664 Y95.661 E.06989
G1 X117.131 Y95.661
G1 X118.739 Y94.053 E.06989
G1 X118.206 Y94.053
G1 X116.597 Y95.661 E.06989
G1 X116.064 Y95.661
G1 X117.673 Y94.053 E.06989
G1 X117.139 Y94.053
G1 X115.531 Y95.661 E.06989
G1 X114.998 Y95.661
G1 X116.606 Y94.053 E.06989
G1 X116.073 Y94.053
G1 X114.464 Y95.661 E.06989
G1 X113.931 Y95.661
G1 X115.539 Y94.053 E.06989
G1 X115.006 Y94.053
G1 X113.398 Y95.661 E.06989
G1 X112.865 Y95.661
G1 X114.473 Y94.053 E.06989
G1 X113.94 Y94.053
G1 X112.331 Y95.661 E.06989
G1 X111.798 Y95.661
G1 X113.406 Y94.053 E.06989
G1 X112.873 Y94.053
G1 X111.265 Y95.661 E.06989
G1 X110.732 Y95.661
G1 X112.34 Y94.053 E.06989
G1 X111.807 Y94.053
G1 X110.198 Y95.661 E.06989
G1 X109.665 Y95.661
G1 X111.273 Y94.053 E.06989
G1 X110.74 Y94.053
G1 X109.132 Y95.661 E.06989
G1 X108.598 Y95.661
G1 X110.207 Y94.053 E.06989
G1 X109.673 Y94.053
G1 X108.065 Y95.661 E.06989
G1 X107.532 Y95.661
G1 X109.14 Y94.053 E.06989
G1 X108.607 Y94.053
G1 X106.999 Y95.661 E.06989
G1 X106.465 Y95.661
G1 X108.074 Y94.053 E.06989
G1 X107.54 Y94.053
G1 X105.932 Y95.661 E.06989
G1 X105.399 Y95.661
G1 X107.007 Y94.053 E.06989
G1 X106.474 Y94.053
G1 X104.866 Y95.661 E.06989
G1 X104.332 Y95.661
G1 X105.941 Y94.053 E.06989
G1 X105.407 Y94.053
G1 X103.799 Y95.661 E.06989
G1 X103.266 Y95.661
G1 X104.874 Y94.053 E.06989
G1 X104.341 Y94.053
G1 X102.732 Y95.661 E.06989
G1 X102.199 Y95.661
G1 X103.807 Y94.053 E.06989
G1 X103.274 Y94.053
G1 X101.666 Y95.661 E.06989
G1 X101.133 Y95.661
G1 X102.741 Y94.053 E.06989
G1 X102.208 Y94.053
G1 X100.599 Y95.661 E.06989
G1 X100.066 Y95.661
G1 X101.674 Y94.053 E.06989
G1 X101.141 Y94.053
G1 X99.533 Y95.661 E.06989
G1 X99 Y95.661
G1 X100.608 Y94.053 E.06989
G1 X100.075 Y94.053
G1 X98.466 Y95.661 E.06989
G1 X97.933 Y95.661
G1 X99.541 Y94.053 E.06989
G1 X99.008 Y94.053
G1 X97.4 Y95.661 E.06989
M73 P65 R4
G1 X96.866 Y95.661
G1 X98.475 Y94.053 E.06989
G1 X97.942 Y94.053
G1 X96.333 Y95.661 E.06989
G1 X95.8 Y95.661
G1 X97.408 Y94.053 E.06989
G1 X96.875 Y94.053
G1 X95.267 Y95.661 E.06989
G1 X94.733 Y95.661
G1 X96.342 Y94.053 E.06989
G1 X95.808 Y94.053
G1 X94.2 Y95.661 E.06989
G1 X93.667 Y95.661
G1 X95.275 Y94.053 E.06989
G1 X94.742 Y94.053
G1 X93.134 Y95.661 E.06989
G1 X92.6 Y95.661
G1 X94.209 Y94.053 E.06989
G1 X93.675 Y94.053
G1 X92.067 Y95.661 E.06989
G1 X91.534 Y95.661
G1 X93.142 Y94.053 E.06989
G1 X92.609 Y94.053
G1 X91.001 Y95.661 E.06989
G1 X90.467 Y95.661
G1 X92.076 Y94.053 E.06989
G1 X91.542 Y94.053
G1 X89.934 Y95.661 E.06989
G1 X89.401 Y95.661
G1 X91.009 Y94.053 E.06989
G1 X90.476 Y94.053
G1 X88.867 Y95.661 E.06989
G1 X88.334 Y95.661
G1 X89.942 Y94.053 E.06989
G1 X89.409 Y94.053
G1 X87.801 Y95.661 E.06989
G1 X87.268 Y95.661
G1 X88.876 Y94.053 E.06989
G1 X88.343 Y94.053
G1 X86.734 Y95.661 E.06989
G1 X86.252 Y95.611
G1 X87.809 Y94.053 E.06769
G1 X87.276 Y94.053
G1 X86.05 Y95.279 E.05326
G1 X85.849 Y94.947
G1 X86.743 Y94.053 E.03883
G1 X86.21 Y94.053
G1 X85.648 Y94.615 E.0244
M204 S10000
; WIPE_START
G1 F24000
G1 X86.21 Y94.053 E-.30179
G1 X86.743 Y94.053 E-.20264
G1 X86.267 Y94.529 E-.25557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.014 J1.217 P1  F30000
G1 X125.583 Y94.97 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X125.443 Y95.148 E.00083
; LINE_WIDTH: 0.132479
G1 X125.304 Y95.325 E.00165
; LINE_WIDTH: 0.176789
G1 X125.165 Y95.503 E.00246
; LINE_WIDTH: 0.221099
G1 X125.026 Y95.68 E.00328
G1 X122.368 Y97.591 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.542313
G1 F12615.328
G1 X122.671 Y97.091 E.02376
G1 X88.777 Y97.091 E1.37928
G1 X89.079 Y97.591 E.02376
G1 X122.308 Y97.591 E1.35221
G1 X122.615 Y98.029 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X123.449 Y96.653 E.04943
G1 X87.999 Y96.653 E1.08928
G1 X88.833 Y98.029 E.04943
G1 X122.555 Y98.029 E1.03619
G1 X122.827 Y98.406 F30000
G1 F15000
G1 X124.118 Y96.276 E.07653
G1 X87.329 Y96.276 E1.13042
G1 X88.62 Y98.406 E.07653
G1 X122.767 Y98.406 E1.04924
G1 X117.701 Y104.827 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.858 Y106.22 E.05401
G1 X117.658 Y107.02 E.03755
G2 X114.815 Y111.853 I48.019 J31.504 E.18607
G1 X113.995 Y111.033 E.03843
G3 X115.688 Y108.149 I34.799 J18.483 E.11096
G1 X118.951 Y104.886 E.15308
G1 X120.554 Y102.24 E.10263
G1 X117.112 Y98.798 E.16149
G1 X117.363 Y98.798 E.00833
G1 X112.827 Y103.335 E.21282
G1 X113.973 Y103.335 E.03802
G1 X109.436 Y98.798 E.21282
G1 X109.687 Y98.798 E.00833
G1 X105.151 Y103.335 E.21282
G1 X106.297 Y103.335 E.03802
G1 X101.76 Y98.798 E.21282
G1 X102.011 Y98.798 E.00833
G1 X97.475 Y103.335 E.21282
G1 X98.621 Y103.335 E.03802
G1 X94.084 Y98.798 E.21282
G1 X94.335 Y98.798 E.00833
G1 X90.893 Y102.241 E.16149
G1 X92.496 Y104.886 E.10263
G1 X95.759 Y108.149 E.15308
G3 X97.452 Y111.033 I-33.111 J21.37 E.11096
G1 X96.633 Y111.853 E.03843
G2 X93.789 Y107.02 I-50.861 J26.671 E.18607
G1 X94.59 Y106.22 E.03755
G1 X93.746 Y104.827 E.05401
; WIPE_START
G1 F24000
G1 X94.59 Y106.22 E-.61876
G1 X94.327 Y106.482 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.538 J1.092 P1  F30000
G1 X112.463 Y115.417 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X99.326 Y122.883 F30000
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.662 J-.076 E.05197
G1 X98.644 Y171.249 E.04143
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.276 Y175.398 E.03851
G2 X112.802 Y171.248 I-3.852 J-6.846 E.18447
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.175 J-.316 P1  F30000
G1 X99.822 Y171.447 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51385
G1 F13377.783
G1 X99.914 Y171.663 E.00899
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P66 R4
G1 F24000
G1 X99.822 Y171.447 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/25
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
G3 Z1.2 I1.184 J.282 P1  F30000
G1 X111.773 Y121.196 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.068 J9.093 E.21694
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.418 J9.298 E.20601
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.013 J.675 P1  F30000
G1 X124.105 Y97.054 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.52994
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X87.342 Y97.054 E.52994
G1 X124.045 Y97.054 E1.21749
; WIPE_START
G1 F24000
G1 X123.014 Y98.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.977 J.725 P1  F30000
G1 X125.799 Y95.016 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.162 Y110.916 E.57129
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X85.649 Y95.016 E.57129
G1 X125.739 Y95.016 E1.23185
M204 S10000
G1 X125.196 Y95.611 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X124.808 Y95.223 E.01684
G1 X124.275 Y95.223
G1 X124.994 Y95.943 E.03126
G1 X124.793 Y96.275
G1 X123.742 Y95.223 E.04569
G1 X123.208 Y95.223
G1 X124.592 Y96.607 E.06012
G1 X124.283 Y96.832
G1 X122.675 Y95.223 E.06989
G1 X122.142 Y95.223
G1 X123.75 Y96.832 E.06989
G1 X123.217 Y96.832
G1 X121.609 Y95.223 E.06989
G1 X121.075 Y95.223
G1 X122.684 Y96.832 E.06989
G1 X122.15 Y96.832
G1 X120.542 Y95.223 E.06989
G1 X120.009 Y95.223
G1 X121.617 Y96.832 E.06989
G1 X121.084 Y96.832
G1 X119.475 Y95.223 E.06989
G1 X118.942 Y95.223
G1 X120.55 Y96.832 E.06989
G1 X120.017 Y96.832
G1 X118.409 Y95.223 E.06989
G1 X117.876 Y95.223
G1 X119.484 Y96.832 E.06989
G1 X118.951 Y96.832
G1 X117.342 Y95.223 E.06989
G1 X116.809 Y95.223
G1 X118.417 Y96.832 E.06989
G1 X117.884 Y96.832
G1 X116.276 Y95.223 E.06989
G1 X115.743 Y95.223
G1 X117.351 Y96.832 E.06989
G1 X116.818 Y96.832
G1 X115.209 Y95.223 E.06989
G1 X114.676 Y95.223
G1 X116.284 Y96.832 E.06989
G1 X115.751 Y96.832
G1 X114.143 Y95.223 E.06989
G1 X113.609 Y95.223
G1 X115.218 Y96.832 E.06989
G1 X114.685 Y96.832
G1 X113.076 Y95.223 E.06989
G1 X112.543 Y95.223
G1 X114.151 Y96.832 E.06989
G1 X113.618 Y96.832
G1 X112.01 Y95.223 E.06989
G1 X111.476 Y95.223
G1 X113.085 Y96.832 E.06989
G1 X112.551 Y96.832
G1 X110.943 Y95.223 E.06989
G1 X110.41 Y95.223
G1 X112.018 Y96.832 E.06989
G1 X111.485 Y96.832
G1 X109.877 Y95.223 E.06989
G1 X109.343 Y95.223
G1 X110.952 Y96.832 E.06989
G1 X110.418 Y96.832
G1 X108.81 Y95.223 E.06989
G1 X108.277 Y95.223
G1 X109.885 Y96.832 E.06989
G1 X109.352 Y96.832
G1 X107.743 Y95.223 E.06989
G1 X107.21 Y95.223
G1 X108.819 Y96.832 E.06989
G1 X108.285 Y96.832
G1 X106.677 Y95.223 E.06989
G1 X106.144 Y95.223
G1 X107.752 Y96.832 E.06989
G1 X107.219 Y96.832
G1 X105.61 Y95.223 E.06989
G1 X105.077 Y95.223
G1 X106.685 Y96.832 E.06989
G1 X106.152 Y96.832
G1 X104.544 Y95.223 E.06989
M73 P67 R4
G1 X104.011 Y95.223
G1 X105.619 Y96.832 E.06989
G1 X105.086 Y96.832
G1 X103.477 Y95.223 E.06989
G1 X102.944 Y95.223
G1 X104.552 Y96.832 E.06989
G1 X104.019 Y96.832
G1 X102.411 Y95.223 E.06989
G1 X101.878 Y95.223
G1 X103.486 Y96.832 E.06989
G1 X102.953 Y96.832
G1 X101.344 Y95.223 E.06989
G1 X100.811 Y95.223
G1 X102.419 Y96.832 E.06989
G1 X101.886 Y96.832
G1 X100.278 Y95.223 E.06989
G1 X99.744 Y95.223
G1 X101.353 Y96.832 E.06989
G1 X100.819 Y96.832
G1 X99.211 Y95.223 E.06989
G1 X98.678 Y95.223
G1 X100.286 Y96.832 E.06989
G1 X99.753 Y96.832
G1 X98.145 Y95.223 E.06989
G1 X97.611 Y95.223
G1 X99.22 Y96.832 E.06989
G1 X98.686 Y96.832
G1 X97.078 Y95.223 E.06989
G1 X96.545 Y95.223
G1 X98.153 Y96.832 E.06989
G1 X97.62 Y96.832
G1 X96.012 Y95.223 E.06989
G1 X95.478 Y95.223
G1 X97.087 Y96.832 E.06989
G1 X96.553 Y96.832
G1 X94.945 Y95.223 E.06989
G1 X94.412 Y95.223
G1 X96.02 Y96.832 E.06989
G1 X95.487 Y96.832
G1 X93.878 Y95.223 E.06989
G1 X93.345 Y95.223
G1 X94.954 Y96.832 E.06989
G1 X94.42 Y96.832
G1 X92.812 Y95.223 E.06989
G1 X92.279 Y95.223
G1 X93.887 Y96.832 E.06989
G1 X93.354 Y96.832
G1 X91.745 Y95.223 E.06989
G1 X91.212 Y95.223
G1 X92.82 Y96.832 E.06989
G1 X92.287 Y96.832
G1 X90.679 Y95.223 E.06989
G1 X90.146 Y95.223
G1 X91.754 Y96.832 E.06989
G1 X91.221 Y96.832
G1 X89.612 Y95.223 E.06989
G1 X89.079 Y95.223
G1 X90.687 Y96.832 E.06989
G1 X90.154 Y96.832
G1 X88.546 Y95.223 E.06989
G1 X88.012 Y95.223
G1 X89.621 Y96.832 E.06989
G1 X89.088 Y96.832
G1 X87.479 Y95.223 E.06989
G1 X86.946 Y95.223
G1 X88.554 Y96.832 E.06989
G1 X88.021 Y96.832
G1 X86.413 Y95.223 E.06989
G1 X86.229 Y95.573
G1 X87.488 Y96.832 E.05472
M204 S10000
G1 X87.098 Y96.851 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.216806
G1 F15000
G1 X86.961 Y96.675 E.00316
; LINE_WIDTH: 0.173927
G1 X86.823 Y96.5 E.00238
; LINE_WIDTH: 0.131048
G1 X86.685 Y96.324 E.0016
G1 X93.746 Y104.827 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X94.59 Y106.22 E.05401
G1 X93.789 Y107.02 E.03755
G3 X96.633 Y111.853 I-48.018 J31.503 E.18607
G1 X97.452 Y111.033 E.03843
G2 X95.759 Y108.149 I-34.803 J18.486 E.11096
G1 X92.496 Y104.886 E.15308
G1 X90.893 Y102.241 E.10263
G1 X93.165 Y99.968 E.10659
G1 X95.254 Y99.968 E.06931
G1 X98.621 Y103.335 E.15792
G1 X97.475 Y103.335 E.03802
G1 X100.841 Y99.968 E.15792
G1 X102.93 Y99.968 E.06931
G1 X106.297 Y103.335 E.15792
G1 X105.151 Y103.335 E.03802
G1 X108.517 Y99.968 E.15792
G1 X110.606 Y99.968 E.06931
G1 X113.973 Y103.335 E.15792
G1 X112.827 Y103.335 E.03802
G1 X116.193 Y99.968 E.15792
G1 X118.282 Y99.968 E.06931
G1 X120.554 Y102.24 E.10659
G1 X118.951 Y104.886 E.10263
G1 X115.688 Y108.149 E.15308
G2 X113.995 Y111.033 I33.107 J21.368 E.11096
G1 X114.815 Y111.853 E.03843
G3 X117.658 Y107.02 I50.862 J26.671 E.18607
G1 X116.858 Y106.22 E.03755
G1 X117.701 Y104.827 E.05401
G1 X121.659 Y98.761 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.542309
G1 F12615.429
G1 X121.961 Y98.262 E.02376
G1 X89.486 Y98.262 E1.32155
G1 X89.789 Y98.761 E.02376
G1 X121.599 Y98.761 E1.29447
G1 X121.906 Y99.199 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X122.739 Y97.823 E.04943
G1 X88.708 Y97.823 E1.04569
G1 X89.542 Y99.199 E.04943
G1 X121.846 Y99.199 E.9926
G1 X122.118 Y99.576 F30000
G1 F15000
G1 X123.409 Y97.446 E.07653
G1 X88.039 Y97.446 E1.08683
G1 X89.329 Y99.576 E.07653
G1 X122.058 Y99.576 E1.00565
G1 X112.463 Y115.417 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X99.326 Y122.883 F30000
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.746 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.831 J-6.833 E.18448
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
M73 P68 R4
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/25
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
G3 Z1.4 I1.2 J-.205 P1  F30000
G1 X111.773 Y121.196 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.33 J2.996 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.273 J9.169 E.21691
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X99.454 Y114.183 I-19.517 J3.442 E.05157
G1 X99.454 Y114.183 E0
G2 X97.489 Y109.575 I-17.402 J4.698 E.15443
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.63 J9.377 E.20598
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.011 J.677 P1  F30000
G1 X123.396 Y98.225 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.48454
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
M73 P68 R3
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X88.052 Y98.225 E.48454
G1 X123.336 Y98.225 E1.17043
; WIPE_START
G1 F24000
G1 X122.305 Y99.939 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.977 J.725 P1  F30000
G1 X125.089 Y96.186 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.931 Y98.097 E.06865
G1 X116.162 Y110.916 E.46059
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X102.979 Y176.563 I-8.238 J-.001 E.48356
G1 X102.979 Y176.563 E0
G3 X97.486 Y168.795 I2.75 J-7.77 E.31159
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X86.358 Y96.186 E.52924
G1 X125.029 Y96.186 E1.18826
M204 S10000
; WIPE_START
G1 F24000
G1 X124.033 Y97.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.139 J-1.209 P1  F30000
G1 X123.322 Y98.002 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X124.399 Y96.926 E.04676
G1 X124.397 Y96.394
G1 X122.789 Y98.002 E.06989
G1 X122.256 Y98.002
G1 X123.864 Y96.394 E.06989
G1 X123.331 Y96.394
G1 X121.723 Y98.002 E.06989
G1 X121.189 Y98.002
G1 X122.798 Y96.394 E.06989
G1 X122.264 Y96.394
G1 X120.656 Y98.002 E.06989
G1 X120.123 Y98.002
G1 X121.731 Y96.394 E.06989
G1 X121.198 Y96.394
G1 X119.59 Y98.002 E.06989
G1 X119.056 Y98.002
G1 X120.665 Y96.394 E.06989
G1 X120.131 Y96.394
G1 X118.523 Y98.002 E.06989
G1 X117.99 Y98.002
G1 X119.598 Y96.394 E.06989
G1 X119.065 Y96.394
G1 X117.456 Y98.002 E.06989
G1 X116.923 Y98.002
G1 X118.532 Y96.394 E.06989
G1 X117.998 Y96.394
G1 X116.39 Y98.002 E.06989
G1 X115.857 Y98.002
G1 X117.465 Y96.394 E.06989
G1 X116.932 Y96.394
G1 X115.323 Y98.002 E.06989
G1 X114.79 Y98.002
G1 X116.398 Y96.394 E.06989
G1 X115.865 Y96.394
G1 X114.257 Y98.002 E.06989
G1 X113.724 Y98.002
G1 X115.332 Y96.394 E.06989
G1 X114.799 Y96.394
G1 X113.19 Y98.002 E.06989
G1 X112.657 Y98.002
G1 X114.265 Y96.394 E.06989
G1 X113.732 Y96.394
G1 X112.124 Y98.002 E.06989
G1 X111.59 Y98.002
G1 X113.199 Y96.394 E.06989
G1 X112.666 Y96.394
G1 X111.057 Y98.002 E.06989
G1 X110.524 Y98.002
G1 X112.132 Y96.394 E.06989
G1 X111.599 Y96.394
G1 X109.991 Y98.002 E.06989
G1 X109.457 Y98.002
G1 X111.066 Y96.394 E.06989
G1 X110.532 Y96.394
G1 X108.924 Y98.002 E.06989
G1 X108.391 Y98.002
G1 X109.999 Y96.394 E.06989
G1 X109.466 Y96.394
G1 X107.858 Y98.002 E.06989
G1 X107.324 Y98.002
G1 X108.933 Y96.394 E.06989
G1 X108.399 Y96.394
G1 X106.791 Y98.002 E.06989
G1 X106.258 Y98.002
G1 X107.866 Y96.394 E.06989
G1 X107.333 Y96.394
G1 X105.725 Y98.002 E.06989
G1 X105.191 Y98.002
G1 X106.8 Y96.394 E.06989
G1 X106.266 Y96.394
G1 X104.658 Y98.002 E.06989
M73 P69 R3
G1 X104.125 Y98.002
G1 X105.733 Y96.394 E.06989
G1 X105.2 Y96.394
G1 X103.591 Y98.002 E.06989
G1 X103.058 Y98.002
G1 X104.666 Y96.394 E.06989
G1 X104.133 Y96.394
G1 X102.525 Y98.002 E.06989
G1 X101.992 Y98.002
G1 X103.6 Y96.394 E.06989
G1 X103.067 Y96.394
G1 X101.458 Y98.002 E.06989
G1 X100.925 Y98.002
G1 X102.533 Y96.394 E.06989
G1 X102 Y96.394
G1 X100.392 Y98.002 E.06989
G1 X99.859 Y98.002
G1 X101.467 Y96.394 E.06989
G1 X100.934 Y96.394
G1 X99.325 Y98.002 E.06989
G1 X98.792 Y98.002
G1 X100.4 Y96.394 E.06989
G1 X99.867 Y96.394
G1 X98.259 Y98.002 E.06989
G1 X97.725 Y98.002
G1 X99.334 Y96.394 E.06989
G1 X98.801 Y96.394
G1 X97.192 Y98.002 E.06989
G1 X96.659 Y98.002
G1 X98.267 Y96.394 E.06989
G1 X97.734 Y96.394
G1 X96.126 Y98.002 E.06989
G1 X95.592 Y98.002
G1 X97.201 Y96.394 E.06989
G1 X96.667 Y96.394
G1 X95.059 Y98.002 E.06989
G1 X94.526 Y98.002
G1 X96.134 Y96.394 E.06989
G1 X95.601 Y96.394
G1 X93.993 Y98.002 E.06989
G1 X93.459 Y98.002
G1 X95.068 Y96.394 E.06989
G1 X94.534 Y96.394
G1 X92.926 Y98.002 E.06989
G1 X92.393 Y98.002
G1 X94.001 Y96.394 E.06989
G1 X93.468 Y96.394
G1 X91.859 Y98.002 E.06989
G1 X91.326 Y98.002
G1 X92.935 Y96.394 E.06989
G1 X92.401 Y96.394
G1 X90.793 Y98.002 E.06989
G1 X90.26 Y98.002
G1 X91.868 Y96.394 E.06989
G1 X91.335 Y96.394
G1 X89.726 Y98.002 E.06989
G1 X89.193 Y98.002
G1 X90.801 Y96.394 E.06989
G1 X90.268 Y96.394
G1 X88.66 Y98.002 E.06989
G1 X88.127 Y98.002
G1 X89.735 Y96.394 E.06989
G1 X89.202 Y96.394
G1 X87.66 Y97.935 E.06698
G1 X87.459 Y97.603
G1 X88.668 Y96.394 E.05255
G1 X88.135 Y96.394
G1 X87.258 Y97.271 E.03812
G1 X87.057 Y96.939
G1 X87.602 Y96.394 E.02369
M204 S10000
; WIPE_START
G1 F24000
G1 X87.057 Y96.939 E-.29298
G1 X87.258 Y97.271 E-.14754
G1 X87.852 Y96.677 E-.31948
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.034 J1.216 P1  F30000
G1 X123.942 Y97.677 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881692
G1 F15000
G1 X123.807 Y97.849 E.0008
; LINE_WIDTH: 0.128268
G1 X123.672 Y98.021 E.00152
G1 X120.949 Y99.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.542309
G1 F12615.429
G1 X121.252 Y99.432 E.02376
G1 X90.195 Y99.432 E1.26382
G1 X90.498 Y99.931 E.02376
G1 X120.889 Y99.931 E1.23674
G1 X121.196 Y100.37 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X122.03 Y98.994 E.04943
G1 X89.417 Y98.994 E1.0021
G1 X90.251 Y100.37 E.04943
G1 X121.136 Y100.37 E.94901
G1 X121.409 Y100.747 F30000
G1 F15000
G1 X122.7 Y98.617 E.07653
G1 X88.748 Y98.617 E1.04324
G1 X90.039 Y100.747 E.07653
G1 X121.349 Y100.747 E.96206
G1 X117.701 Y104.827 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.858 Y106.22 E.05401
G1 X117.658 Y107.02 E.03755
G2 X114.815 Y111.853 I48.018 J31.504 E.18607
G1 X113.995 Y111.033 E.03843
G3 X115.688 Y108.149 I34.8 J18.484 E.11096
G1 X118.951 Y104.886 E.15308
G1 X120.554 Y102.24 E.10263
G1 X119.453 Y101.139 E.05169
G1 X115.023 Y101.139 E.14695
G1 X112.827 Y103.335 E.10302
G1 X113.973 Y103.335 E.03802
G1 X111.777 Y101.139 E.10302
G1 X107.347 Y101.139 E.14695
G1 X105.151 Y103.335 E.10302
G1 X106.297 Y103.335 E.03802
G1 X104.101 Y101.139 E.10302
G1 X99.671 Y101.139 E.14695
G1 X97.475 Y103.335 E.10302
G1 X98.621 Y103.335 E.03802
G1 X96.425 Y101.139 E.10302
G1 X91.995 Y101.139 E.14695
G1 X90.893 Y102.241 E.05169
G1 X92.496 Y104.886 E.10263
G1 X95.759 Y108.149 E.15308
G3 X97.452 Y111.033 I-33.111 J21.37 E.11096
G1 X96.633 Y111.853 E.03843
G2 X93.789 Y107.02 I-50.862 J26.671 E.18607
G1 X94.59 Y106.22 E.03755
G1 X93.746 Y104.827 E.05401
; WIPE_START
G1 F24000
G1 X94.59 Y106.22 E-.61876
G1 X94.327 Y106.482 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.538 J1.092 P1  F30000
G1 X112.463 Y115.417 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X99.326 Y122.883 F30000
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.62 J-.072 E.05197
G1 X98.644 Y171.249 E.04145
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
M73 P70 R3
G1 X109.276 Y175.398 E.03851
G2 X112.802 Y171.248 I-3.854 J-6.847 E.18447
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/25
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
G3 Z1.6 I1.2 J-.205 P1  F30000
G1 X111.773 Y121.196 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.068 J9.093 E.21694
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.418 J9.298 E.20601
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.009 J.68 P1  F30000
G1 X122.686 Y99.395 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.43915
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X88.761 Y99.395 E.43915
G1 X122.626 Y99.395 E1.12338
; WIPE_START
G1 F24000
G1 X121.596 Y101.109 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.977 J.725 P1  F30000
G1 X124.38 Y97.357 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.327 Y99.094 E.06242
G1 X116.162 Y110.916 E.42477
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X87.067 Y97.357 E.48719
G1 X124.32 Y97.357 E1.14467
M204 S10000
G1 X123.787 Y97.935 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X123.416 Y97.564 E.01612
G1 X122.883 Y97.564
G1 X123.586 Y98.267 E.03055
G1 X123.384 Y98.599
G1 X122.349 Y97.564 E.04498
G1 X121.816 Y97.564
G1 X123.183 Y98.931 E.05941
G1 X122.891 Y99.172
G1 X121.283 Y97.564 E.06989
G1 X120.75 Y97.564
G1 X122.358 Y99.172 E.06989
G1 X121.825 Y99.172
G1 X120.216 Y97.564 E.06989
G1 X119.683 Y97.564
G1 X121.291 Y99.172 E.06989
G1 X120.758 Y99.172
G1 X119.15 Y97.564 E.06989
G1 X118.616 Y97.564
G1 X120.225 Y99.172 E.06989
G1 X119.691 Y99.172
G1 X118.083 Y97.564 E.06989
G1 X117.55 Y97.564
G1 X119.158 Y99.172 E.06989
G1 X118.625 Y99.172
G1 X117.017 Y97.564 E.06989
G1 X116.483 Y97.564
G1 X118.092 Y99.172 E.06989
G1 X117.558 Y99.172
G1 X115.95 Y97.564 E.06989
G1 X115.417 Y97.564
G1 X117.025 Y99.172 E.06989
G1 X116.492 Y99.172
G1 X114.884 Y97.564 E.06989
G1 X114.35 Y97.564
G1 X115.959 Y99.172 E.06989
G1 X115.425 Y99.172
G1 X113.817 Y97.564 E.06989
G1 X113.284 Y97.564
G1 X114.892 Y99.172 E.06989
G1 X114.359 Y99.172
G1 X112.75 Y97.564 E.06989
G1 X112.217 Y97.564
G1 X113.826 Y99.172 E.06989
G1 X113.292 Y99.172
G1 X111.684 Y97.564 E.06989
G1 X111.151 Y97.564
G1 X112.759 Y99.172 E.06989
G1 X112.226 Y99.172
G1 X110.617 Y97.564 E.06989
G1 X110.084 Y97.564
G1 X111.692 Y99.172 E.06989
G1 X111.159 Y99.172
G1 X109.551 Y97.564 E.06989
G1 X109.018 Y97.564
G1 X110.626 Y99.172 E.06989
G1 X110.093 Y99.172
G1 X108.484 Y97.564 E.06989
G1 X107.951 Y97.564
G1 X109.559 Y99.172 E.06989
G1 X109.026 Y99.172
G1 X107.418 Y97.564 E.06989
G1 X106.885 Y97.564
G1 X108.493 Y99.172 E.06989
G1 X107.96 Y99.172
G1 X106.351 Y97.564 E.06989
G1 X105.818 Y97.564
G1 X107.426 Y99.172 E.06989
G1 X106.893 Y99.172
G1 X105.285 Y97.564 E.06989
G1 X104.751 Y97.564
M73 P71 R3
G1 X106.36 Y99.172 E.06989
G1 X105.826 Y99.172
G1 X104.218 Y97.564 E.06989
G1 X103.685 Y97.564
G1 X105.293 Y99.172 E.06989
G1 X104.76 Y99.172
G1 X103.152 Y97.564 E.06989
G1 X102.618 Y97.564
G1 X104.227 Y99.172 E.06989
G1 X103.693 Y99.172
G1 X102.085 Y97.564 E.06989
G1 X101.552 Y97.564
G1 X103.16 Y99.172 E.06989
G1 X102.627 Y99.172
G1 X101.019 Y97.564 E.06989
G1 X100.485 Y97.564
G1 X102.094 Y99.172 E.06989
G1 X101.56 Y99.172
G1 X99.952 Y97.564 E.06989
G1 X99.419 Y97.564
G1 X101.027 Y99.172 E.06989
G1 X100.494 Y99.172
G1 X98.885 Y97.564 E.06989
G1 X98.352 Y97.564
G1 X99.96 Y99.172 E.06989
G1 X99.427 Y99.172
G1 X97.819 Y97.564 E.06989
G1 X97.286 Y97.564
G1 X98.894 Y99.172 E.06989
G1 X98.361 Y99.172
G1 X96.752 Y97.564 E.06989
G1 X96.219 Y97.564
G1 X97.827 Y99.172 E.06989
G1 X97.294 Y99.172
G1 X95.686 Y97.564 E.06989
G1 X95.153 Y97.564
G1 X96.761 Y99.172 E.06989
G1 X96.228 Y99.172
G1 X94.619 Y97.564 E.06989
G1 X94.086 Y97.564
G1 X95.694 Y99.172 E.06989
G1 X95.161 Y99.172
G1 X93.553 Y97.564 E.06989
G1 X93.019 Y97.564
G1 X94.628 Y99.172 E.06989
G1 X94.095 Y99.172
G1 X92.486 Y97.564 E.06989
G1 X91.953 Y97.564
G1 X93.561 Y99.172 E.06989
G1 X93.028 Y99.172
G1 X91.42 Y97.564 E.06989
G1 X90.886 Y97.564
G1 X92.495 Y99.172 E.06989
G1 X91.961 Y99.172
G1 X90.353 Y97.564 E.06989
G1 X89.82 Y97.564
G1 X91.428 Y99.172 E.06989
G1 X90.895 Y99.172
G1 X89.287 Y97.564 E.06989
G1 X88.753 Y97.564
G1 X90.362 Y99.172 E.06989
G1 X89.828 Y99.172
G1 X88.22 Y97.564 E.06989
G1 X87.687 Y97.564
G1 X89.295 Y99.172 E.06989
G1 X88.762 Y99.172
G1 X87.869 Y98.28 E.03878
M204 S10000
; WIPE_START
G1 F24000
G1 X88.762 Y99.172 E-.47961
G1 X89.295 Y99.172 E-.20264
G1 X89.15 Y99.028 E-.07775
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.277 J-1.185 P1  F30000
G1 X88.451 Y99.191 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119761
G1 F15000
G1 X88.326 Y99.031 E.00127
; WIPE_START
G1 F24000
G1 X88.451 Y99.191 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.053 J-.611 P1  F30000
G1 X87.496 Y97.545 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.124676
G1 F15000
G1 X87.535 Y97.716 E.00116
; LINE_WIDTH: 0.0942761
G1 X87.667 Y97.883 E.00089
; LINE_WIDTH: 0.138095
G1 X87.799 Y98.051 E.00165
; LINE_WIDTH: 0.181913
G1 X87.93 Y98.219 E.00242
; WIPE_START
G1 F24000
G1 X87.799 Y98.051 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.993 J.703 P1  F30000
G1 X91.652 Y103.494 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X92.496 Y104.886 E.05401
G1 X95.759 Y108.149 E.15308
G3 X97.452 Y111.033 I-33.111 J21.37 E.11096
G1 X96.633 Y111.853 E.03843
G2 X93.789 Y107.02 I-50.861 J26.671 E.18607
G1 X94.59 Y106.22 E.03755
G1 X92.841 Y103.335 E.1119
G1 X97.475 Y103.335 E.15369
G1 X98.5 Y102.309 E.04812
G1 X97.595 Y102.309 E.03003
G1 X98.621 Y103.335 E.04812
G1 X105.151 Y103.335 E.21661
G1 X106.176 Y102.309 E.04812
G1 X105.271 Y102.309 E.03003
G1 X106.297 Y103.335 E.04812
G1 X112.827 Y103.335 E.21661
G1 X113.852 Y102.309 E.04812
G1 X112.947 Y102.309 E.03003
G1 X113.973 Y103.335 E.04812
G1 X118.606 Y103.335 E.15369
G1 X116.858 Y106.22 E.1119
G1 X117.658 Y107.02 E.03755
G2 X114.815 Y111.853 I48.019 J31.504 E.18607
G1 X113.995 Y111.033 E.03843
G3 X115.688 Y108.149 I34.8 J18.484 E.11096
G1 X118.951 Y104.886 E.15308
G1 X119.795 Y103.494 E.05401
G1 X120.24 Y101.102 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.542308
G1 F12615.441
G1 X120.543 Y100.602 E.02376
G1 X90.905 Y100.602 E1.20609
G1 X91.207 Y101.102 E.02376
G1 X120.18 Y101.102 E1.17902
G1 X120.487 Y101.54 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X121.321 Y100.164 E.04943
G1 X90.127 Y100.164 E.95851
G1 X90.96 Y101.54 E.04943
G1 X120.427 Y101.54 E.90542
G1 X120.699 Y101.917 F30000
G1 F15000
G1 X121.99 Y99.787 E.07653
G1 X89.457 Y99.787 E.99965
G1 X90.748 Y101.917 E.07653
G1 X120.639 Y101.917 E.91848
G1 X112.463 Y115.417 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X99.326 Y122.883 F30000
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.745 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.832 J-6.834 E.18448
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
M73 P72 R3
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/25
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
G3 Z1.8 I1.2 J-.205 P1  F30000
G1 X111.773 Y121.196 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.068 J9.093 E.21694
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.418 J9.298 E.20601
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.007 J.683 P1  F30000
G1 X121.977 Y100.565 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.39375
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X89.47 Y100.565 E.39375
G1 X121.917 Y100.565 E1.07632
; WIPE_START
G1 F24000
G1 X120.888 Y102.28 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.978 J.725 P1  F30000
G1 X123.671 Y98.527 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.723 Y100.091 E.05619
G1 X116.162 Y110.916 E.38895
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X103.007 Y176.572 I-8.246 J-.012 E.48243
G1 X103.007 Y176.572 E0
G3 X97.486 Y168.795 I2.747 J-7.798 E.31235
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X87.777 Y98.527 E.44514
G1 X123.611 Y98.527 E1.10108
M204 S10000
; WIPE_START
G1 F24000
G1 X122.723 Y100.091 E-.6833
G1 X122.618 Y100.263 E-.0767
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.188 J.263 P1  F30000
G1 X122.758 Y99.633 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X122.048 Y100.343 E.03083
G1 X121.515 Y100.343
G1 X123.123 Y98.734 E.06989
G1 X122.59 Y98.734
G1 X120.982 Y100.343 E.06989
G1 X120.449 Y100.343
G1 X122.057 Y98.734 E.06989
G1 X121.524 Y98.734
G1 X119.915 Y100.343 E.06989
G1 X119.382 Y100.343
G1 X120.99 Y98.734 E.06989
G1 X120.457 Y98.734
G1 X118.849 Y100.343 E.06989
G1 X118.315 Y100.343
G1 X119.924 Y98.734 E.06989
G1 X119.39 Y98.734
G1 X117.782 Y100.343 E.06989
G1 X117.249 Y100.343
G1 X118.857 Y98.734 E.06989
G1 X118.324 Y98.734
G1 X116.716 Y100.343 E.06989
G1 X116.182 Y100.343
G1 X117.791 Y98.734 E.06989
G1 X117.257 Y98.734
G1 X115.649 Y100.343 E.06989
G1 X115.116 Y100.343
G1 X116.724 Y98.734 E.06989
G1 X116.191 Y98.734
G1 X114.583 Y100.343 E.06989
G1 X114.049 Y100.343
G1 X115.658 Y98.734 E.06989
G1 X115.124 Y98.734
G1 X113.516 Y100.343 E.06989
G1 X112.983 Y100.343
G1 X114.591 Y98.734 E.06989
G1 X114.058 Y98.734
G1 X112.449 Y100.343 E.06989
G1 X111.916 Y100.343
G1 X113.525 Y98.734 E.06989
G1 X112.991 Y98.734
G1 X111.383 Y100.343 E.06989
G1 X110.85 Y100.343
G1 X112.458 Y98.734 E.06989
G1 X111.925 Y98.734
G1 X110.316 Y100.343 E.06989
G1 X109.783 Y100.343
G1 X111.391 Y98.734 E.06989
G1 X110.858 Y98.734
G1 X109.25 Y100.343 E.06989
G1 X108.717 Y100.343
G1 X110.325 Y98.734 E.06989
G1 X109.792 Y98.734
G1 X108.183 Y100.343 E.06989
G1 X107.65 Y100.343
G1 X109.258 Y98.734 E.06989
G1 X108.725 Y98.734
G1 X107.117 Y100.343 E.06989
G1 X106.583 Y100.343
G1 X108.192 Y98.734 E.06989
G1 X107.659 Y98.734
G1 X106.05 Y100.343 E.06989
G1 X105.517 Y100.343
G1 X107.125 Y98.734 E.06989
G1 X106.592 Y98.734
G1 X104.984 Y100.343 E.06989
G1 X104.45 Y100.343
G1 X106.059 Y98.734 E.06989
G1 X105.525 Y98.734
M73 P73 R3
G1 X103.917 Y100.343 E.06989
G1 X103.384 Y100.343
G1 X104.992 Y98.734 E.06989
G1 X104.459 Y98.734
G1 X102.851 Y100.343 E.06989
G1 X102.317 Y100.343
G1 X103.926 Y98.734 E.06989
G1 X103.392 Y98.734
G1 X101.784 Y100.343 E.06989
G1 X101.251 Y100.343
G1 X102.859 Y98.734 E.06989
G1 X102.326 Y98.734
G1 X100.718 Y100.343 E.06989
G1 X100.184 Y100.343
G1 X101.793 Y98.734 E.06989
G1 X101.259 Y98.734
G1 X99.651 Y100.343 E.06989
G1 X99.118 Y100.343
G1 X100.726 Y98.734 E.06989
G1 X100.193 Y98.734
G1 X98.584 Y100.343 E.06989
G1 X98.051 Y100.343
G1 X99.659 Y98.734 E.06989
G1 X99.126 Y98.734
G1 X97.518 Y100.343 E.06989
G1 X96.985 Y100.343
G1 X98.593 Y98.734 E.06989
G1 X98.06 Y98.734
G1 X96.451 Y100.343 E.06989
G1 X95.918 Y100.343
G1 X97.526 Y98.734 E.06989
G1 X96.993 Y98.734
G1 X95.385 Y100.343 E.06989
G1 X94.852 Y100.343
G1 X96.46 Y98.734 E.06989
G1 X95.927 Y98.734
G1 X94.318 Y100.343 E.06989
G1 X93.785 Y100.343
G1 X95.393 Y98.734 E.06989
G1 X94.86 Y98.734
G1 X93.252 Y100.343 E.06989
G1 X92.718 Y100.343
G1 X94.327 Y98.734 E.06989
G1 X93.794 Y98.734
G1 X92.185 Y100.343 E.06989
G1 X91.652 Y100.343
G1 X93.26 Y98.734 E.06989
G1 X92.727 Y98.734
G1 X91.119 Y100.343 E.06989
G1 X90.585 Y100.343
G1 X92.194 Y98.734 E.06989
G1 X91.66 Y98.734
G1 X90.052 Y100.343 E.06989
G1 X89.519 Y100.343
G1 X91.127 Y98.734 E.06989
G1 X90.594 Y98.734
G1 X89.069 Y100.259 E.06626
G1 X88.868 Y99.927
G1 X90.061 Y98.734 E.05184
G1 X89.527 Y98.734
G1 X88.667 Y99.595 E.03741
G1 X88.465 Y99.263
G1 X88.994 Y98.734 E.02298
M204 S10000
; WIPE_START
G1 F24000
G1 X88.465 Y99.263 E-.28418
G1 X88.667 Y99.595 E-.14754
G1 X89.277 Y98.984 E-.32829
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.002 J1.217 P1  F30000
G1 X123.121 Y99.031 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881692
G1 F15000
G1 X122.98 Y99.212 E.00085
; LINE_WIDTH: 0.134023
G1 X122.838 Y99.392 E.0017
; LINE_WIDTH: 0.179877
G1 X122.697 Y99.572 E.00256
G1 X119.795 Y103.494 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.951 Y104.886 E.05401
G1 X115.688 Y108.149 E.15308
G2 X113.995 Y111.033 I33.107 J21.368 E.11096
G1 X114.815 Y111.853 E.03843
G3 X117.658 Y107.02 I50.861 J26.671 E.18607
G1 X116.858 Y106.22 E.03755
G1 X117.701 Y104.827 E.05401
G1 X112.463 Y115.417 F30000
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X99.326 Y122.883 F30000
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.747 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.276 Y175.398 E.03851
G2 X112.802 Y171.248 I-3.854 J-6.847 E.18447
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.889 J-.831 P1  F30000
G1 X93.746 Y104.827 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X94.59 Y106.22 E.05401
G1 X93.789 Y107.02 E.03755
G3 X96.633 Y111.853 I-48.018 J31.503 E.18607
G1 X97.452 Y111.033 E.03843
G2 X95.759 Y108.149 I-34.803 J18.486 E.11096
G1 X92.496 Y104.886 E.15308
G1 X91.652 Y103.494 E.05401
G1 X93.437 Y103.291 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419983
G1 F15000
G1 X118.349 Y103.291 E.76543
G1 X118.452 Y103.322 E.0033
G1 X118.537 Y103.479 E.00551
G1 X118.567 Y103.173 E.00946
G1 X118.692 Y103.09 E.00462
G3 X119.99 Y103.087 I.998 J159.769 E.03988
G1 X121.281 Y100.957 E.07653
G1 X90.166 Y100.957 E.95602
G1 X91.457 Y103.087 E.07653
G1 X92.723 Y103.087 E.03888
G1 X92.881 Y103.173 E.00552
G1 X92.911 Y103.479 E.00946
G1 X92.996 Y103.322 E.00551
G1 X93.377 Y103.295 E.01176
G1 X93.142 Y102.914 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X118.305 Y102.914 E.77319
G1 X118.426 Y102.795 E.00521
G1 X118.725 Y102.71 E.00953
G1 X119.778 Y102.71 E.03236
G1 X120.612 Y101.334 E.04943
G1 X90.836 Y101.334 E.91492
G1 X91.67 Y102.71 E.04943
G1 X92.723 Y102.71 E.03236
G1 X93.021 Y102.795 E.00953
G1 X93.099 Y102.872 E.00337
G1 X93.283 Y102.537 F30000
G1 F15000
G1 X118.164 Y102.537 E.76453
G1 X118.293 Y102.452 E.00474
; LINE_WIDTH: 0.463935
G1 F14963.85
G1 X118.422 Y102.367 E.00529
; LINE_WIDTH: 0.543252
G1 F12591.659
G1 X118.55 Y102.282 E.00628
G3 X119.531 Y102.272 I.91 J39.508 E.03998
G1 X119.833 Y101.773 E.02381
G1 X118.725 Y101.773 E.04521
; LINE_WIDTH: 0.542308
G1 F12615.441
G1 X118.486 Y101.752 E.00973
; LINE_WIDTH: 0.501539
G1 F13736.913
G1 X118.248 Y101.732 E.00893
; LINE_WIDTH: 0.420392
G1 F15000
G1 X118.01 Y101.711 E.00735
G1 X93.437 Y101.711 E.75584
; LINE_WIDTH: 0.419999
G1 X93.199 Y101.732 E.00734
; LINE_WIDTH: 0.460769
G1 X92.961 Y101.752 E.00814
; LINE_WIDTH: 0.538749
G1 F12705.994
G1 X92.723 Y101.773 E.00966
G1 X91.614 Y101.773 E.0448
G1 X91.917 Y102.272 E.02359
M73 P74 R3
G1 X92.723 Y102.272 E.03257
; LINE_WIDTH: 0.542308
G1 F12615.441
G1 X92.888 Y102.34 E.00728
; LINE_WIDTH: 0.501539
G1 F13736.913
G1 X93.054 Y102.407 E.00669
; LINE_WIDTH: 0.45514
G1 F15000
G1 X93.24 Y102.495 E.00691
G1 X93.437 Y102.124 F30000
; LINE_WIDTH: 0.491142
G1 F14055.533
G1 X117.95 Y102.124 E.89532
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.95 Y102.124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/25
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
G3 Z2 I-1.189 J-.26 P1  F30000
G1 X111.773 Y121.196 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.008 E.62989
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.004 E.54588
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.381 J9.209 E.2169
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.738 J9.417 E.20596
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.005 J.687 P1  F30000
G1 X121.268 Y101.735 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.34836
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X90.18 Y101.735 E.34836
G1 X121.208 Y101.735 E1.02926
; WIPE_START
G1 F24000
G1 X120.18 Y103.451 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.978 J.725 P1  F30000
G1 X122.961 Y99.697 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.119 Y101.088 E.04995
G1 X116.162 Y110.916 E.35314
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X88.486 Y99.697 E.40309
G1 X122.901 Y99.697 E1.05749
M204 S10000
G1 X122.378 Y100.259 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X122.024 Y99.905 E.01541
G1 X121.49 Y99.905
G1 X122.177 Y100.591 E.02984
G1 X121.976 Y100.924
G1 X120.957 Y99.905 E.04427
G1 X120.424 Y99.905
G1 X121.775 Y101.256 E.0587
G1 X121.499 Y101.513
G1 X119.891 Y99.905 E.06989
G1 X119.357 Y99.905
G1 X120.966 Y101.513 E.06989
G1 X120.432 Y101.513
G1 X118.824 Y99.905 E.06989
G1 X118.291 Y99.905
G1 X119.899 Y101.513 E.06989
G1 X119.366 Y101.513
G1 X117.757 Y99.905 E.06989
G1 X117.224 Y99.905
G1 X118.833 Y101.513 E.06989
G1 X118.299 Y101.513
G1 X116.691 Y99.905 E.06989
G1 X116.158 Y99.905
G1 X117.766 Y101.513 E.06989
G1 X117.233 Y101.513
G1 X115.624 Y99.905 E.06989
G1 X115.091 Y99.905
G1 X116.699 Y101.513 E.06989
G1 X116.166 Y101.513
G1 X114.558 Y99.905 E.06989
G1 X114.025 Y99.905
G1 X115.633 Y101.513 E.06989
G1 X115.1 Y101.513
G1 X113.491 Y99.905 E.06989
G1 X112.958 Y99.905
G1 X114.566 Y101.513 E.06989
G1 X114.033 Y101.513
G1 X112.425 Y99.905 E.06989
G1 X111.891 Y99.905
G1 X113.5 Y101.513 E.06989
G1 X112.967 Y101.513
G1 X111.358 Y99.905 E.06989
G1 X110.825 Y99.905
G1 X112.433 Y101.513 E.06989
G1 X111.9 Y101.513
G1 X110.292 Y99.905 E.06989
G1 X109.758 Y99.905
G1 X111.367 Y101.513 E.06989
G1 X110.833 Y101.513
G1 X109.225 Y99.905 E.06989
G1 X108.692 Y99.905
G1 X110.3 Y101.513 E.06989
G1 X109.767 Y101.513
G1 X108.159 Y99.905 E.06989
G1 X107.625 Y99.905
G1 X109.234 Y101.513 E.06989
G1 X108.7 Y101.513
G1 X107.092 Y99.905 E.06989
G1 X106.559 Y99.905
G1 X108.167 Y101.513 E.06989
G1 X107.634 Y101.513
G1 X106.026 Y99.905 E.06989
G1 X105.492 Y99.905
G1 X107.101 Y101.513 E.06989
G1 X106.567 Y101.513
G1 X104.959 Y99.905 E.06989
G1 X104.426 Y99.905
G1 X106.034 Y101.513 E.06989
G1 X105.501 Y101.513
G1 X103.892 Y99.905 E.06989
G1 X103.359 Y99.905
G1 X104.967 Y101.513 E.06989
G1 X104.434 Y101.513
G1 X102.826 Y99.905 E.06989
G1 X102.293 Y99.905
G1 X103.901 Y101.513 E.06989
G1 X103.368 Y101.513
G1 X101.759 Y99.905 E.06989
G1 X101.226 Y99.905
G1 X102.834 Y101.513 E.06989
G1 X102.301 Y101.513
G1 X100.693 Y99.905 E.06989
G1 X100.16 Y99.905
G1 X101.768 Y101.513 E.06989
M73 P75 R3
G1 X101.235 Y101.513
G1 X99.626 Y99.905 E.06989
G1 X99.093 Y99.905
G1 X100.701 Y101.513 E.06989
G1 X100.168 Y101.513
G1 X98.56 Y99.905 E.06989
G1 X98.026 Y99.905
G1 X99.635 Y101.513 E.06989
G1 X99.102 Y101.513
G1 X97.493 Y99.905 E.06989
G1 X96.96 Y99.905
G1 X98.568 Y101.513 E.06989
G1 X98.035 Y101.513
G1 X96.427 Y99.905 E.06989
G1 X95.893 Y99.905
G1 X97.502 Y101.513 E.06989
G1 X96.968 Y101.513
G1 X95.36 Y99.905 E.06989
G1 X94.827 Y99.905
G1 X96.435 Y101.513 E.06989
G1 X95.902 Y101.513
G1 X94.294 Y99.905 E.06989
G1 X93.76 Y99.905
G1 X95.369 Y101.513 E.06989
G1 X94.835 Y101.513
G1 X93.227 Y99.905 E.06989
G1 X92.694 Y99.905
G1 X94.302 Y101.513 E.06989
G1 X93.769 Y101.513
G1 X92.16 Y99.905 E.06989
G1 X91.627 Y99.905
G1 X93.236 Y101.513 E.06989
G1 X92.702 Y101.513
G1 X91.094 Y99.905 E.06989
G1 X90.561 Y99.905
G1 X92.169 Y101.513 E.06989
G1 X91.636 Y101.513
G1 X90.027 Y99.905 E.06989
G1 X89.494 Y99.905
G1 X91.102 Y101.513 E.06989
G1 X90.569 Y101.513
G1 X88.961 Y99.905 E.06989
M204 S10000
; WIPE_START
G1 F24000
G1 X90.375 Y101.319 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.661 J-1.022 P1  F30000
G1 X90.046 Y101.532 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380922
G1 F15000
G1 X89.896 Y101.341 E.00669
; LINE_WIDTH: 0.33213
G1 X89.746 Y101.15 E.00572
; LINE_WIDTH: 0.283338
G1 X89.596 Y100.959 E.00476
; LINE_WIDTH: 0.234546
G1 X89.446 Y100.767 E.00379
; LINE_WIDTH: 0.185754
G1 X89.296 Y100.576 E.00283
; LINE_WIDTH: 0.136962
G1 X89.146 Y100.385 E.00186
; WIPE_START
G1 F24000
G1 X89.296 Y100.576 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.006 J.685 P1  F30000
G1 X94.633 Y108.412 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X93.789 Y107.02 E.05401
G1 X94.59 Y106.22 E.03755
G1 X93.636 Y104.646 E.06105
G1 X92.353 Y104.65 E.04256
G1 X92.496 Y104.886 E.00918
G1 X95.759 Y108.149 E.15308
G3 X97.452 Y111.033 I-33.112 J21.37 E.11096
G1 X96.633 Y111.853 E.03843
G3 X97.265 Y113.352 I-14.853 J7.151 E.05401
G1 X98.985 Y115.417 F30000
G1 F15476.087
G3 X99.125 Y117.036 I-5.415 J1.286 E.05408
G1 X98.202 Y117.959 E.04331
G3 X98.216 Y118.282 I-3.843 J.327 E.01073
G1 X99.22 Y119.286 E.04708
G1 X99.239 Y119.748 E.01535
G1 X99.682 Y119.748 E.01469
G1 X100.781 Y120.847 E.05157
G1 X102.99 Y120.847 E.07326
G1 X104.089 Y119.748 E.05157
G1 X107.358 Y119.748 E.10843
G1 X108.457 Y120.847 E.05157
G1 X110.666 Y120.847 E.07326
G1 X111.765 Y119.748 E.05157
G1 X112.208 Y119.748 E.01469
G1 X112.227 Y119.286 E.01535
G1 X113.231 Y118.282 E.04708
G3 X113.245 Y117.959 I3.857 J.004 E.01073
G1 X112.322 Y117.036 E.04331
G3 X112.463 Y115.417 I5.556 J-.332 E.05408
G1 X114.182 Y113.352 F30000
G1 F15476.087
G3 X114.815 Y111.853 I15.487 J5.652 E.05401
G1 X113.995 Y111.033 E.03843
G3 X115.688 Y108.149 I34.799 J18.484 E.11096
G1 X118.951 Y104.886 E.15308
G1 X119.094 Y104.65 E.00918
G1 X117.811 Y104.646 E.04256
G1 X116.858 Y106.22 E.06105
G1 X117.658 Y107.02 E.03755
G1 X116.814 Y108.412 E.05401
G1 X119.189 Y102.873 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.501992
G1 F13723.338
G2 X119.186 Y102.972 I-.029 J.049 E.00881
G1 X93.35 Y104.258 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X92.937 Y103.577 E.02445
G1 X92.943 Y103.373 E.00628
G1 X93.098 Y103.291 E.0054
G1 X118.349 Y103.291 E.77588
G1 X118.504 Y103.373 E.0054
G1 X118.51 Y103.577 E.00628
G1 X118.098 Y104.258 E.02445
G1 X119.281 Y104.258 E.03635
G1 X120.572 Y102.128 E.07653
G1 X90.876 Y102.128 E.91247
G1 X92.167 Y104.258 E.07653
G1 X93.29 Y104.258 E.03451
G1 X92.68 Y103.88 F30000
; LINE_WIDTH: 0.4339
G1 F15000
G1 X92.576 Y103.697 E.00672
G1 X92.632 Y103.159 E.01722
G1 X92.999 Y102.912 E.0141
G1 X93.098 Y102.906 E.00318
G1 X118.349 Y102.906 E.80448
G1 X118.815 Y103.159 E.01691
G1 X118.871 Y103.697 E.01722
G1 X118.767 Y103.88 E.00672
G1 X119.068 Y103.88 E.00959
G1 X119.902 Y102.505 E.05126
G2 X118.349 Y102.513 I-.371 J78.58 E.04949
G1 X93.098 Y102.513 E.80448
G2 X91.545 Y102.505 I-1.182 J78.584 E.04949
G1 X92.379 Y103.88 E.05126
G1 X92.62 Y103.88 E.00768
G1 X92.316 Y102.873 F30000
; LINE_WIDTH: 0.502
G1 F13723.097
G2 X92.313 Y102.972 I-.029 J.049 E.00881
; WIPE_START
G1 F24000
G1 X92.259 Y102.972 E-.18343
G1 X92.23 Y102.923 E-.19219
G1 X92.259 Y102.873 E-.19219
G1 X92.316 Y102.873 E-.19219
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.149 J.402 P1  F30000
G1 X99.326 Y122.883 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.747 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.115 J-2.481 E.18481
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.647 J-6.676 E.18473
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/25
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
G3 Z2.2 I1.2 J-.205 P1  F30000
G1 X111.773 Y121.196 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.008 E.62989
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.004 E.54588
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.573 Y119.4 E.40778
G1 X99.425 Y115.867 E.11729
G2 X97.152 Y109.775 I-17.342 J3 E.21694
G1 X93.46 Y103.683 E.2363
G1 X117.988 Y103.683 E.81363
G1 X114.296 Y109.775 E.2363
G2 X112.022 Y115.867 I15.068 J9.093 E.21694
G1 X111.876 Y119.348 E.11556
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
M73 P76 R3
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.418 J9.298 E.20601
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.002 J.69 P1  F30000
G1 X120.558 Y102.906 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.825 Y110.716 E.30296
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X90.889 Y102.906 E.30296
G1 X120.498 Y102.906 E.98221
; WIPE_START
G1 F24000
G1 X119.472 Y104.622 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.978 J.724 P1  F30000
G1 X122.252 Y100.868 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M73 P76 R2
G1 X121.515 Y102.085 E.04372
G1 X116.162 Y110.916 E.31732
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J0 E.79518
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X89.195 Y100.868 E.36104
G1 X122.192 Y100.868 E1.01391
M204 S10000
G1 X121.849 Y101.075 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X120.241 Y102.683 E.06989
G1 X119.708 Y102.683
G1 X121.316 Y101.075 E.06989
G1 X120.783 Y101.075
G1 X119.174 Y102.683 E.06989
G1 X118.641 Y102.683
G1 X120.249 Y101.075 E.06989
G1 X119.716 Y101.075
G1 X118.108 Y102.683 E.06989
G1 X117.575 Y102.683
G1 X119.183 Y101.075 E.06989
G1 X118.65 Y101.075
G1 X117.041 Y102.683 E.06989
G1 X116.508 Y102.683
G1 X118.116 Y101.075 E.06989
G1 X117.583 Y101.075
G1 X115.975 Y102.683 E.06989
G1 X115.442 Y102.683
G1 X117.05 Y101.075 E.06989
G1 X116.517 Y101.075
G1 X114.908 Y102.683 E.06989
G1 X114.375 Y102.683
G1 X115.983 Y101.075 E.06989
G1 X115.45 Y101.075
G1 X113.842 Y102.683 E.06989
G1 X113.308 Y102.683
G1 X114.917 Y101.075 E.06989
G1 X114.383 Y101.075
G1 X112.775 Y102.683 E.06989
G1 X112.242 Y102.683
G1 X113.85 Y101.075 E.06989
G1 X113.317 Y101.075
G1 X111.709 Y102.683 E.06989
G1 X111.175 Y102.683
G1 X112.784 Y101.075 E.06989
G1 X112.25 Y101.075
G1 X110.642 Y102.683 E.06989
G1 X110.109 Y102.683
G1 X111.717 Y101.075 E.06989
G1 X111.184 Y101.075
G1 X109.576 Y102.683 E.06989
G1 X109.042 Y102.683
G1 X110.651 Y101.075 E.06989
G1 X110.117 Y101.075
G1 X108.509 Y102.683 E.06989
G1 X107.976 Y102.683
G1 X109.584 Y101.075 E.06989
G1 X109.051 Y101.075
G1 X107.442 Y102.683 E.06989
G1 X106.909 Y102.683
G1 X108.518 Y101.075 E.06989
G1 X107.984 Y101.075
G1 X106.376 Y102.683 E.06989
G1 X105.843 Y102.683
G1 X107.451 Y101.075 E.06989
G1 X106.918 Y101.075
G1 X105.309 Y102.683 E.06989
G1 X104.776 Y102.683
G1 X106.384 Y101.075 E.06989
G1 X105.851 Y101.075
G1 X104.243 Y102.683 E.06989
G1 X103.71 Y102.683
G1 X105.318 Y101.075 E.06989
G1 X104.785 Y101.075
G1 X103.176 Y102.683 E.06989
G1 X102.643 Y102.683
G1 X104.251 Y101.075 E.06989
G1 X103.718 Y101.075
G1 X102.11 Y102.683 E.06989
G1 X101.577 Y102.683
G1 X103.185 Y101.075 E.06989
G1 X102.652 Y101.075
G1 X101.043 Y102.683 E.06989
G1 X100.51 Y102.683
G1 X102.118 Y101.075 E.06989
G1 X101.585 Y101.075
G1 X99.977 Y102.683 E.06989
G1 X99.443 Y102.683
G1 X101.052 Y101.075 E.06989
G1 X100.518 Y101.075
G1 X98.91 Y102.683 E.06989
G1 X98.377 Y102.683
G1 X99.985 Y101.075 E.06989
G1 X99.452 Y101.075
G1 X97.844 Y102.683 E.06989
G1 X97.31 Y102.683
G1 X98.919 Y101.075 E.06989
G1 X98.385 Y101.075
G1 X96.777 Y102.683 E.06989
G1 X96.244 Y102.683
G1 X97.852 Y101.075 E.06989
G1 X97.319 Y101.075
G1 X95.711 Y102.683 E.06989
G1 X95.177 Y102.683
G1 X96.786 Y101.075 E.06989
G1 X96.252 Y101.075
G1 X94.644 Y102.683 E.06989
G1 X94.111 Y102.683
G1 X95.719 Y101.075 E.06989
G1 X95.186 Y101.075
G1 X93.577 Y102.683 E.06989
G1 X93.044 Y102.683
G1 X94.652 Y101.075 E.06989
G1 X94.119 Y101.075
G1 X92.511 Y102.683 E.06989
G1 X91.978 Y102.683
G1 X93.586 Y101.075 E.06989
G1 X93.053 Y101.075
G1 X91.444 Y102.683 E.06989
G1 X90.911 Y102.683
M73 P77 R2
G1 X92.519 Y101.075 E.06989
G1 X91.986 Y101.075
G1 X90.478 Y102.584 E.06555
G1 X90.276 Y102.252
G1 X91.453 Y101.075 E.05112
G1 X90.92 Y101.075
G1 X90.075 Y101.92 E.0367
G1 X89.874 Y101.587
G1 X90.386 Y101.075 E.02227
M204 S10000
; WIPE_START
G1 F24000
G1 X89.874 Y101.587 E-.27537
G1 X90.075 Y101.92 E-.14754
G1 X90.702 Y101.292 E-.33709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.018 J1.217 P1  F30000
G1 X121.481 Y101.739 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X121.329 Y101.931 E.0009
; LINE_WIDTH: 0.137032
G1 X121.178 Y102.124 E.00188
; LINE_WIDTH: 0.185895
G1 X121.027 Y102.317 E.00285
; LINE_WIDTH: 0.234759
G1 X120.876 Y102.51 E.00383
; LINE_WIDTH: 0.283622
G1 X120.725 Y102.702 E.0048
G1 X118.461 Y103.294 F30000
; LINE_WIDTH: 0.41298
G1 F15000
G1 X92.986 Y103.294 E.7682
G1 X95.312 Y107.495 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X93.129 Y103.893 E.12942
G1 X92.95 Y103.885 E.00549
; LINE_WIDTH: 0.462603
G1 X92.771 Y103.878 E.00611
; LINE_WIDTH: 0.505206
G1 F13627.936
G1 X92.593 Y103.871 E.00673
; LINE_WIDTH: 0.589169
G1 F11533.207
G1 X92.507 Y103.662 E.01006
G1 X92.507 Y103.385 E.01229
G1 X91.74 Y103.385 E.03411
G1 X92.012 Y103.844 E.02373
; LINE_WIDTH: 0.583123
G1 F11662.283
G1 X92.104 Y104.036 E.00934
; LINE_WIDTH: 0.542342
G1 F12614.583
G1 X92.196 Y104.227 E.00863
; LINE_WIDTH: 0.501561
G1 F13736.234
G1 X92.287 Y104.418 E.00793
; LINE_WIDTH: 0.421836
G1 F15000
G1 X92.379 Y104.609 E.00655
G1 X94.129 Y107.495 E.1042
G1 X95.252 Y107.495 E.03467
G1 X94.695 Y107.148 F30000
; LINE_WIDTH: 0.360222
G1 F15000
G1 X92.933 Y104.24 E.08791
G1 X92.783 Y104.24 E.00389
G1 X92.478 Y104.102 E.00865
G1 X94.324 Y107.148 E.09209
G1 X94.635 Y107.148 E.00804
G1 X94.546 Y108.269 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X94.315 Y107.887 E.0148
G1 X95.497 Y107.887 E.03921
G1 X95.759 Y108.149 E.01231
G3 X97.452 Y111.033 I-33.111 J21.37 E.11096
G1 X96.633 Y111.853 E.03843
G3 X97.265 Y113.352 I-14.853 J7.151 E.05401
G1 X98.985 Y115.417 F30000
G1 F15476.087
G3 X99.125 Y117.036 I-5.415 J1.286 E.05408
G1 X98.202 Y117.959 E.04331
G3 X98.216 Y118.282 I-3.843 J.327 E.01073
G1 X99.22 Y119.286 E.04708
G1 X99.239 Y119.748 E.01535
G1 X99.682 Y119.748 E.01469
G1 X100.781 Y120.847 E.05157
G1 X102.99 Y120.847 E.07326
G1 X104.089 Y119.748 E.05157
G1 X107.358 Y119.748 E.10843
G1 X108.457 Y120.847 E.05157
G1 X110.666 Y120.847 E.07326
G1 X111.765 Y119.748 E.05157
G1 X112.208 Y119.748 E.01469
G1 X112.227 Y119.286 E.01535
G1 X113.231 Y118.282 E.04708
G3 X113.245 Y117.959 I3.857 J.004 E.01073
G1 X112.322 Y117.036 E.04331
G3 X112.463 Y115.417 I5.556 J-.332 E.05408
G1 X114.182 Y113.352 F30000
G1 F15476.087
G3 X114.815 Y111.853 I15.487 J5.652 E.05401
G1 X113.995 Y111.033 E.03843
G3 X115.688 Y108.149 I34.801 J18.484 E.11096
G1 X115.95 Y107.887 E.01231
G1 X117.132 Y107.887 E.03921
G1 X116.901 Y108.269 E.0148
G1 X116.136 Y107.495 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.319 Y107.495 E.03635
G1 X119.068 Y104.609 E.10369
G1 X119.148 Y104.437 E.00582
; LINE_WIDTH: 0.461335
G1 X119.228 Y104.266 E.00645
; LINE_WIDTH: 0.502671
G1 F13703.09
G1 X119.307 Y104.094 E.00709
; LINE_WIDTH: 0.544006
G1 F12572.692
G1 X119.507 Y103.74 E.01661
; LINE_WIDTH: 0.588135
G1 F11555.074
G1 X119.707 Y103.385 E.01807
G1 X118.941 Y103.385 E.03404
G1 X118.935 Y103.704 E.01417
; LINE_WIDTH: 0.583116
G1 F11662.434
G1 X118.879 Y103.834 E.00622
; LINE_WIDTH: 0.544006
G1 F12572.692
G1 X118.787 Y103.854 E.00383
; LINE_WIDTH: 0.502671
G1 F13703.09
G1 X118.695 Y103.873 E.00351
; LINE_WIDTH: 0.420855
G1 F15000
G3 X118.319 Y103.893 I-.234 J-.873 E.0117
G1 X116.167 Y107.444 E.12786
G1 X116.752 Y107.148 F30000
; LINE_WIDTH: 0.36022
G1 F15000
G1 X117.123 Y107.148 E.00959
G1 X119 Y104.051 E.09361
G1 X118.665 Y104.24 E.00995
G1 X118.514 Y104.24 E.00389
G1 X116.783 Y107.096 E.08635
G1 X112.121 Y122.883 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.121 Y124.511 E.05401
G1 X113.221 Y125.61 E.05157
G1 X113.221 Y125.969 E.01188
G1 X112.121 Y127.068 E.05157
G1 X112.121 Y132.187 E.16981
G1 X113.221 Y133.286 E.05157
G1 X113.221 Y133.645 E.01188
G1 X112.121 Y134.744 E.05157
G1 X112.121 Y139.863 E.16981
G1 X113.221 Y140.962 E.05157
G1 X113.221 Y141.321 E.01188
G1 X112.121 Y142.42 E.05157
G1 X112.121 Y147.539 E.16981
G1 X113.221 Y148.638 E.05157
G1 X113.221 Y148.997 E.01188
G1 X112.121 Y150.096 E.05157
G1 X112.121 Y155.215 E.16981
G1 X113.221 Y156.314 E.05157
G1 X113.221 Y156.672 E.01188
G1 X112.121 Y157.772 E.05157
G1 X112.121 Y162.891 E.16981
G1 X113.221 Y163.99 E.05157
G1 X113.221 Y164.348 E.01188
G1 X112.121 Y165.448 E.05157
G1 X112.121 Y168.812 E.11159
G3 X111.923 Y170.368 I-7.001 J-.103 E.05216
G1 X112.802 Y171.248 E.04125
G3 X109.274 Y175.396 I-7.36 J-2.685 E.18448
G1 X108.455 Y174.577 E.03842
G3 X102.989 Y174.58 I-2.737 J-5.807 E.1873
G1 X102.173 Y175.396 E.03826
G3 X98.645 Y171.248 I3.677 J-6.701 E.18469
G1 X99.527 Y170.366 E.04134
G3 X99.326 Y168.816 I6.547 J-1.635 E.05199
G1 X99.326 Y165.448 E.11172
G1 X98.227 Y164.348 E.05157
G1 X98.227 Y163.99 E.01188
G1 X99.326 Y162.891 E.05157
G1 X99.326 Y157.772 E.16981
G1 X98.227 Y156.672 E.05157
G1 X98.227 Y156.314 E.01188
G1 X99.326 Y155.215 E.05157
G1 X99.326 Y150.096 E.16981
G1 X98.227 Y148.997 E.05157
G1 X98.227 Y148.638 E.01188
G1 X99.326 Y147.539 E.05157
G1 X99.326 Y142.42 E.16981
G1 X98.227 Y141.321 E.05157
G1 X98.227 Y140.962 E.01188
G1 X99.326 Y139.863 E.05157
G1 X99.326 Y134.744 E.16981
G1 X98.227 Y133.645 E.05157
G1 X98.227 Y133.286 E.01188
G1 X99.326 Y132.187 E.05157
G1 X99.326 Y127.068 E.16981
G1 X98.227 Y125.969 E.05157
G1 X98.227 Y125.61 E.01188
G1 X99.326 Y124.511 E.05157
G1 X99.326 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X99.326 Y124.511 E-.61876
G1 X99.063 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/25
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
G3 Z2.4 I.33 J1.171 P1  F30000
G1 X111.773 Y121.196 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.008 E.62989
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.004 E.54588
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X114.296 Y109.775 I17.341 J3 E.21694
G1 X117.749 Y104.076 E.22105
G1 X119.849 Y104.076 E.06966
G1 X115.825 Y110.716 E.25757
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X91.598 Y104.076 E.25757
G1 X93.698 Y104.076 E.06966
G1 X97.152 Y109.775 E.22105
G3 X99.425 Y115.867 I-15.068 J9.093 E.21694
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.418 J9.298 E.20601
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.991 J.706 P1  F30000
G1 X121.543 Y102.038 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X120.91 Y103.082 E.03749
G1 X116.162 Y110.916 E.2815
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J0 E.79518
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X89.904 Y102.038 E.31899
G1 X121.483 Y102.038 E.97032
M204 S10000
G1 X120.97 Y102.584 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X120.631 Y102.245 E.0147
G1 X120.098 Y102.245
G1 X120.768 Y102.916 E.02913
G1 X120.567 Y103.248
G1 X119.565 Y102.245 E.04356
G1 X119.032 Y102.245
G1 X120.366 Y103.58 E.05799
G1 X120.107 Y103.854
G1 X118.498 Y102.245 E.06989
G1 X117.965 Y102.245
G1 X119.573 Y103.854 E.06989
G1 X119.04 Y103.854
M73 P78 R2
G1 X117.432 Y102.245 E.06989
G1 X116.898 Y102.245
G1 X118.507 Y103.854 E.06989
G1 X117.974 Y103.854
G1 X116.365 Y102.245 E.06989
G1 X115.832 Y102.245
G1 X117.44 Y103.854 E.06989
G1 X116.907 Y103.854
G1 X115.299 Y102.245 E.06989
G1 X114.765 Y102.245
G1 X116.374 Y103.854 E.06989
G1 X115.84 Y103.854
G1 X114.232 Y102.245 E.06989
G1 X113.699 Y102.245
G1 X115.307 Y103.854 E.06989
G1 X114.774 Y103.854
G1 X113.166 Y102.245 E.06989
G1 X112.632 Y102.245
G1 X114.241 Y103.854 E.06989
G1 X113.707 Y103.854
G1 X112.099 Y102.245 E.06989
G1 X111.566 Y102.245
G1 X113.174 Y103.854 E.06989
G1 X112.641 Y103.854
G1 X111.033 Y102.245 E.06989
G1 X110.499 Y102.245
G1 X112.108 Y103.854 E.06989
G1 X111.574 Y103.854
G1 X109.966 Y102.245 E.06989
G1 X109.433 Y102.245
G1 X111.041 Y103.854 E.06989
G1 X110.508 Y103.854
G1 X108.899 Y102.245 E.06989
G1 X108.366 Y102.245
G1 X109.974 Y103.854 E.06989
G1 X109.441 Y103.854
G1 X107.833 Y102.245 E.06989
G1 X107.3 Y102.245
G1 X108.908 Y103.854 E.06989
G1 X108.375 Y103.854
G1 X106.766 Y102.245 E.06989
G1 X106.233 Y102.245
G1 X107.841 Y103.854 E.06989
G1 X107.308 Y103.854
G1 X105.7 Y102.245 E.06989
G1 X105.167 Y102.245
G1 X106.775 Y103.854 E.06989
G1 X106.242 Y103.854
G1 X104.633 Y102.245 E.06989
G1 X104.1 Y102.245
G1 X105.708 Y103.854 E.06989
G1 X105.175 Y103.854
G1 X103.567 Y102.245 E.06989
G1 X103.033 Y102.245
G1 X104.642 Y103.854 E.06989
G1 X104.108 Y103.854
G1 X102.5 Y102.245 E.06989
G1 X101.967 Y102.245
G1 X103.575 Y103.854 E.06989
G1 X103.042 Y103.854
G1 X101.434 Y102.245 E.06989
G1 X100.9 Y102.245
G1 X102.509 Y103.854 E.06989
G1 X101.975 Y103.854
G1 X100.367 Y102.245 E.06989
G1 X99.834 Y102.245
G1 X101.442 Y103.854 E.06989
G1 X100.909 Y103.854
G1 X99.301 Y102.245 E.06989
G1 X98.767 Y102.245
G1 X100.376 Y103.854 E.06989
G1 X99.842 Y103.854
G1 X98.234 Y102.245 E.06989
G1 X97.701 Y102.245
G1 X99.309 Y103.854 E.06989
G1 X98.776 Y103.854
G1 X97.167 Y102.245 E.06989
G1 X96.634 Y102.245
G1 X98.243 Y103.854 E.06989
G1 X97.709 Y103.854
G1 X96.101 Y102.245 E.06989
G1 X95.568 Y102.245
G1 X97.176 Y103.854 E.06989
G1 X96.643 Y103.854
G1 X95.034 Y102.245 E.06989
G1 X94.501 Y102.245
G1 X96.109 Y103.854 E.06989
G1 X95.576 Y103.854
G1 X93.968 Y102.245 E.06989
G1 X93.435 Y102.245
G1 X95.043 Y103.854 E.06989
G1 X94.51 Y103.854
G1 X92.901 Y102.245 E.06989
G1 X92.368 Y102.245
G1 X93.976 Y103.854 E.06989
G1 X93.443 Y103.854
G1 X91.835 Y102.245 E.06989
G1 X91.302 Y102.245
G1 X92.91 Y103.854 E.06989
G1 X92.377 Y103.854
G1 X90.768 Y102.245 E.06989
G1 X90.331 Y102.341
G1 X91.843 Y103.854 E.06573
M204 S10000
G1 X91.399 Y103.873 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.283877
G1 F15000
G1 X91.246 Y103.678 E.00487
; LINE_WIDTH: 0.23495
G1 X91.093 Y103.483 E.00388
; LINE_WIDTH: 0.186024
G1 X90.94 Y103.288 E.00289
; LINE_WIDTH: 0.137097
G1 X90.787 Y103.093 E.0019
G1 X96.021 Y108.665 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X93.477 Y104.468 E.1508
G1 X92.294 Y104.468 E.03635
G1 X94.838 Y108.665 E.1508
G1 X95.961 Y108.665 E.03451
G1 X95.404 Y108.318 F30000
; LINE_WIDTH: 0.360222
G1 F15000
G1 X93.282 Y104.815 E.1059
G1 X92.911 Y104.815 E.00959
G1 X95.033 Y108.318 E.1059
G1 X95.344 Y108.318 E.00804
G1 X95.853 Y110.424 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X96.633 Y111.853 I-35.875 J20.518 E.05399
G1 X97.452 Y111.033 E.03843
G3 X99.078 Y115.907 I-16.33 J8.157 E.171
G1 X99.125 Y117.036 E.03747
G1 X98.202 Y117.959 E.04331
G3 X98.216 Y118.282 I-3.843 J.327 E.01073
G1 X99.22 Y119.286 E.04708
G1 X99.239 Y119.748 E.01535
G1 X99.682 Y119.748 E.01469
G1 X100.781 Y120.847 E.05157
G1 X102.99 Y120.847 E.07326
G1 X104.089 Y119.748 E.05157
G1 X107.358 Y119.748 E.10843
G1 X108.457 Y120.847 E.05157
G1 X110.666 Y120.847 E.07326
G1 X111.765 Y119.748 E.05157
G1 X112.208 Y119.748 E.01469
G1 X112.227 Y119.286 E.01535
G1 X113.231 Y118.282 E.04708
G3 X113.245 Y117.959 I3.857 J.004 E.01073
G1 X112.322 Y117.036 E.04331
G3 X113.32 Y112.519 I11.81 J.24 E.15443
G3 X113.995 Y111.033 I17.545 J7.084 E.05416
G1 X114.815 Y111.853 E.03843
G3 X115.595 Y110.424 I36.656 J19.09 E.05399
G1 X115.427 Y108.665 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X116.61 Y108.665 E.03635
G1 X119.153 Y104.468 E.1508
G1 X117.97 Y104.468 E.03635
G1 X115.458 Y108.614 E.14895
G1 X116.043 Y108.318 F30000
; LINE_WIDTH: 0.36022
G1 F15000
G1 X116.414 Y108.318 E.00959
G1 X118.537 Y104.815 E.1059
G1 X118.255 Y104.815 E.00728
G2 X118.119 Y104.892 I-.045 J.079 E.00483
G1 X116.074 Y108.267 E.10203
G1 X112.121 Y122.883 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.121 Y124.511 E.05401
G1 X113.221 Y125.61 E.05157
G1 X113.221 Y125.969 E.01188
G1 X112.121 Y127.068 E.05157
G1 X112.121 Y132.187 E.16981
G1 X113.221 Y133.286 E.05157
G1 X113.221 Y133.645 E.01188
G1 X112.121 Y134.744 E.05157
G1 X112.121 Y139.863 E.16981
M73 P79 R2
G1 X113.221 Y140.962 E.05157
G1 X113.221 Y141.321 E.01188
G1 X112.121 Y142.42 E.05157
G1 X112.121 Y147.539 E.16981
G1 X113.221 Y148.638 E.05157
G1 X113.221 Y148.997 E.01188
G1 X112.121 Y150.096 E.05157
G1 X112.121 Y155.215 E.16981
G1 X113.221 Y156.314 E.05157
G1 X113.221 Y156.672 E.01188
G1 X112.121 Y157.772 E.05157
G1 X112.121 Y162.891 E.16981
G1 X113.221 Y163.99 E.05157
G1 X113.221 Y164.348 E.01188
G1 X112.121 Y165.448 E.05157
G1 X112.121 Y168.812 E.11159
G3 X111.923 Y170.368 I-7.001 J-.103 E.05216
G1 X112.803 Y171.249 E.04132
G3 X109.272 Y175.394 I-7.098 J-2.471 E.18482
G1 X108.455 Y174.577 E.03833
G3 X102.989 Y174.58 I-2.737 J-5.807 E.1873
G1 X102.175 Y175.394 E.03817
G3 X98.645 Y171.248 I3.806 J-6.816 E.1845
G1 X99.527 Y170.366 E.04134
G3 X99.326 Y168.816 I6.547 J-1.635 E.05199
G1 X99.326 Y165.448 E.11172
G1 X98.227 Y164.348 E.05157
G1 X98.227 Y163.99 E.01188
G1 X99.326 Y162.891 E.05157
G1 X99.326 Y157.772 E.16981
G1 X98.227 Y156.672 E.05157
G1 X98.227 Y156.314 E.01188
G1 X99.326 Y155.215 E.05157
G1 X99.326 Y150.096 E.16981
G1 X98.227 Y148.997 E.05157
G1 X98.227 Y148.638 E.01188
G1 X99.326 Y147.539 E.05157
G1 X99.326 Y142.42 E.16981
G1 X98.227 Y141.321 E.05157
G1 X98.227 Y140.962 E.01188
G1 X99.326 Y139.863 E.05157
G1 X99.326 Y134.744 E.16981
G1 X98.227 Y133.645 E.05157
G1 X98.227 Y133.286 E.01188
G1 X99.326 Y132.187 E.05157
G1 X99.326 Y127.068 E.16981
G1 X98.227 Y125.969 E.05157
G1 X98.227 Y125.61 E.01188
G1 X99.326 Y124.511 E.05157
G1 X99.326 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X99.326 Y124.511 E-.61876
G1 X99.063 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/25
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
G3 Z2.6 I.33 J1.171 P1  F30000
G1 X111.773 Y121.196 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X114.296 Y109.775 I17.341 J3 E.21694
G1 X117.04 Y105.246 E.17565
G1 X119.14 Y105.246 E.06966
G1 X115.825 Y110.716 E.21217
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X92.307 Y105.246 E.21217
G1 X94.407 Y105.246 E.06966
G1 X97.152 Y109.775 E.17565
G3 X99.425 Y115.867 I-15.068 J9.093 E.21694
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.949 Y119.008 E.35487
G1 X99.816 Y115.822 E.09798
G2 X97.489 Y109.575 I-17.744 J3.051 E.20601
G1 X94.156 Y104.075 E.19762
G1 X117.292 Y104.075 E.71089
G1 X113.958 Y109.575 E.19762
G2 X111.632 Y115.822 I15.418 J9.298 E.20601
G1 X111.501 Y118.948 E.09613
M204 S10000
; WIPE_START
G1 F24000
G1 X109.501 Y118.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.988 J.711 P1  F30000
G1 X120.834 Y103.208 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X120.306 Y104.078 E.03126
G1 X116.162 Y110.916 E.24568
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J0 E.79518
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X90.614 Y103.208 E.27694
G1 X120.774 Y103.208 E.92673
M204 S10000
; WIPE_START
G1 F24000
G1 X120.306 Y104.078 E-.37533
G1 X119.782 Y104.944 E-.38467
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.119 J-1.211 P1  F30000
G1 X118.967 Y105.024 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X120.297 Y103.694 E.05778
G1 X120.042 Y103.416
G1 X118.434 Y105.024 E.06989
G1 X117.9 Y105.024
G1 X119.509 Y103.416 E.06989
G1 X118.975 Y103.416
G1 X117.367 Y105.024 E.06989
G1 X117.151 Y104.707
G1 X118.442 Y103.416 E.05609
G1 X117.909 Y103.416
G1 X117.457 Y103.868 E.01964
G1 X116.924 Y103.868
G1 X117.376 Y103.416 E.01964
G1 X116.842 Y103.416
G1 X116.39 Y103.868 E.01964
G1 X115.857 Y103.868
G1 X116.309 Y103.416 E.01964
G1 X115.776 Y103.416
G1 X115.324 Y103.868 E.01964
G1 X114.791 Y103.868
G1 X115.242 Y103.416 E.01964
G1 X114.709 Y103.416
G1 X114.257 Y103.868 E.01964
G1 X113.724 Y103.868
G1 X114.176 Y103.416 E.01964
G1 X113.643 Y103.416
G1 X113.191 Y103.868 E.01964
G1 X112.658 Y103.868
G1 X113.109 Y103.416 E.01964
G1 X112.576 Y103.416
G1 X112.124 Y103.868 E.01964
G1 X111.591 Y103.868
G1 X112.043 Y103.416 E.01964
G1 X111.51 Y103.416
G1 X111.058 Y103.868 E.01964
G1 X110.524 Y103.868
G1 X110.976 Y103.416 E.01964
G1 X110.443 Y103.416
G1 X109.991 Y103.868 E.01964
G1 X109.458 Y103.868
G1 X109.91 Y103.416 E.01964
G1 X109.377 Y103.416
G1 X108.925 Y103.868 E.01964
G1 X108.391 Y103.868
G1 X108.843 Y103.416 E.01964
G1 X108.31 Y103.416
G1 X107.858 Y103.868 E.01964
G1 X107.325 Y103.868
G1 X107.777 Y103.416 E.01964
G1 X107.243 Y103.416
G1 X106.792 Y103.868 E.01964
G1 X106.258 Y103.868
G1 X106.71 Y103.416 E.01964
G1 X106.177 Y103.416
G1 X105.725 Y103.868 E.01964
G1 X105.192 Y103.868
G1 X105.644 Y103.416 E.01964
G1 X105.11 Y103.416
G1 X104.658 Y103.868 E.01964
G1 X104.125 Y103.868
G1 X104.577 Y103.416 E.01964
G1 X104.044 Y103.416
G1 X103.592 Y103.868 E.01964
G1 X103.059 Y103.868
G1 X103.511 Y103.416 E.01964
G1 X102.977 Y103.416
G1 X102.525 Y103.868 E.01964
G1 X101.992 Y103.868
M73 P80 R2
G1 X102.444 Y103.416 E.01964
G1 X101.911 Y103.416
G1 X101.459 Y103.868 E.01964
G1 X100.926 Y103.868
G1 X101.377 Y103.416 E.01964
G1 X100.844 Y103.416
G1 X100.392 Y103.868 E.01964
G1 X99.859 Y103.868
G1 X100.311 Y103.416 E.01964
G1 X99.778 Y103.416
G1 X99.326 Y103.868 E.01964
G1 X98.792 Y103.868
G1 X99.244 Y103.416 E.01964
G1 X98.711 Y103.416
G1 X98.259 Y103.868 E.01964
G1 X97.726 Y103.868
G1 X98.178 Y103.416 E.01964
G1 X97.645 Y103.416
G1 X97.193 Y103.868 E.01964
G1 X96.659 Y103.868
G1 X97.111 Y103.416 E.01964
G1 X96.578 Y103.416
G1 X96.126 Y103.868 E.01964
G1 X95.593 Y103.868
G1 X96.045 Y103.416 E.01964
G1 X95.511 Y103.416
G1 X95.06 Y103.868 E.01964
G1 X94.526 Y103.868
G1 X94.978 Y103.416 E.01964
G1 X94.445 Y103.416
G1 X93.993 Y103.868 E.01964
G1 X94.268 Y104.66
G1 X93.903 Y105.024 E.01584
G1 X93.37 Y105.024
G1 X94.066 Y104.328 E.03027
G1 X93.865 Y103.996
G1 X92.837 Y105.024 E.04469
G1 X92.303 Y105.024
G1 X93.912 Y103.416 E.06989
G1 X93.378 Y103.416
G1 X91.886 Y104.908 E.06484
G1 X91.685 Y104.576
G1 X92.845 Y103.416 E.05041
G1 X92.312 Y103.416
G1 X91.484 Y104.244 E.03598
G1 X91.283 Y103.912
G1 X91.779 Y103.416 E.02155
M204 S10000
; WIPE_START
G1 F24000
G1 X91.283 Y103.912 E-.26657
G1 X91.484 Y104.244 E-.14754
G1 X92.127 Y103.6 E-.34589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.037 J1.216 P1  F30000
G1 X119.84 Y104.446 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X119.684 Y104.645 E.00093
; LINE_WIDTH: 0.137261
G1 X119.528 Y104.844 E.00194
; LINE_WIDTH: 0.186353
G1 X119.372 Y105.043 E.00296
G1 X117.374 Y107.15 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.268 Y106.256 E.03882
G1 X118.522 Y105.469
G1 X116.841 Y107.15 E.07305
G1 X116.308 Y107.15
G1 X117.989 Y105.469 E.07305
G1 X117.456 Y105.469
G1 X116.719 Y106.206 E.03202
M204 S10000
G1 X118.751 Y105.495 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.120409
G1 F15000
G1 X118.585 Y105.469 E.00106
G1 X117.811 Y107.008 F30000
; LINE_WIDTH: 0.0881693
G1 F15000
G1 X117.685 Y107.169 E.00075
G1 X116.78 Y106.267 F30000
; LINE_WIDTH: 0.225732
G1 F15000
G1 X116.638 Y106.447 E.00342
; LINE_WIDTH: 0.179877
G1 X116.497 Y106.627 E.00256
; LINE_WIDTH: 0.134023
G1 X116.355 Y106.808 E.0017
G1 X114.717 Y109.835 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X115.9 Y109.835 E.03635
G1 X117.402 Y107.357 E.08905
G1 X116.219 Y107.357 E.03635
G1 X114.748 Y109.784 E.0872
G1 X115.334 Y109.488 F30000
; LINE_WIDTH: 0.360223
G1 F15000
G1 X115.705 Y109.488 E.00959
G1 X116.786 Y107.704 E.05394
G1 X116.415 Y107.704 E.00959
G1 X115.365 Y109.437 E.05238
G1 X114.182 Y113.352 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X114.815 Y111.853 I15.487 J5.652 E.05401
G1 X113.995 Y111.033 E.03843
G2 X113.32 Y112.519 I16.87 J8.57 E.05416
G2 X112.322 Y117.036 I10.812 J4.757 E.15443
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G1 X99.078 Y115.907 E.03747
G2 X97.452 Y111.033 I-17.956 J3.283 E.171
G1 X96.633 Y111.853 E.03843
G3 X97.265 Y113.352 I-14.854 J7.151 E.05401
G1 X96.73 Y109.835 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X95.228 Y107.357 E.08905
G1 X94.045 Y107.357 E.03635
G1 X95.547 Y109.835 E.08905
G1 X96.67 Y109.835 E.03451
G1 X96.114 Y109.488 F30000
; LINE_WIDTH: 0.360221
G1 F15000
G1 X95.033 Y107.704 E.05394
G1 X94.662 Y107.704 E.00959
G1 X95.743 Y109.488 E.05394
G1 X96.054 Y109.488 E.00804
G1 X94.444 Y107.15 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X94.977 Y106.616 E.02319
G1 X94.776 Y106.284
G1 X93.91 Y107.15 E.03762
G1 X93.591 Y106.936
G1 X94.575 Y105.952 E.04274
G1 X94.374 Y105.62
G1 X93.39 Y106.604 E.04274
G1 X93.189 Y106.272
G1 X93.992 Y105.469 E.03489
G1 X93.458 Y105.469
G1 X92.988 Y105.94 E.02046
M204 S10000
G1 X94.327 Y105.545 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0952166
G1 F15000
G2 X94.204 Y105.45 I-.147 J.062 E.0007
G1 X99.326 Y122.883 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.747 J-.084 E.05199
G1 X98.645 Y171.248 E.04134
G2 X102.173 Y175.396 I7.203 J-2.552 E.18469
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.272 Y175.394 E.03833
G2 X112.803 Y171.249 I-3.567 J-6.616 E.18482
G1 X111.923 Y170.368 E.04132
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.2 J-.205 P1  F30000
G1 X111.773 Y121.196 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X114.296 Y109.775 I17.341 J3 E.21694
G1 X116.331 Y106.417 E.13026
G1 X118.431 Y106.417 E.06966
G1 X115.825 Y110.716 E.16678
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X93.017 Y106.417 E.16678
G1 X95.117 Y106.417 E.06966
G1 X97.152 Y109.775 E.13026
G3 X99.425 Y115.867 I-15.068 J9.093 E.21694
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X113.958 Y109.575 I17.744 J3.051 E.20601
G1 X117.107 Y104.379 E.18671
G1 X120.124 Y104.379 E.0927
G1 X116.162 Y110.916 E.23489
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X91.323 Y104.379 E.23489
G1 X94.34 Y104.379 E.0927
G1 X97.489 Y109.575 E.18671
G3 X99.816 Y115.822 I-15.418 J9.298 E.20601
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.211 J.116 P1  F30000
G1 X112.121 Y122.883 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M73 P81 R2
G1 X112.121 Y124.511 E.05401
G1 X113.221 Y125.61 E.05157
G1 X113.221 Y125.969 E.01188
G1 X112.121 Y127.068 E.05157
G1 X112.121 Y132.187 E.16981
G1 X113.221 Y133.286 E.05157
G1 X113.221 Y133.645 E.01188
G1 X112.121 Y134.744 E.05157
G1 X112.121 Y139.863 E.16981
G1 X113.221 Y140.962 E.05157
G1 X113.221 Y141.321 E.01188
G1 X112.121 Y142.42 E.05157
G1 X112.121 Y147.539 E.16981
G1 X113.221 Y148.638 E.05157
G1 X113.221 Y148.997 E.01188
G1 X112.121 Y150.096 E.05157
G1 X112.121 Y155.215 E.16981
G1 X113.221 Y156.314 E.05157
G1 X113.221 Y156.672 E.01188
G1 X112.121 Y157.772 E.05157
G1 X112.121 Y162.891 E.16981
G1 X113.221 Y163.99 E.05157
G1 X113.221 Y164.348 E.01188
G1 X112.121 Y165.448 E.05157
G1 X112.121 Y168.812 E.11159
G3 X111.923 Y170.368 I-7.001 J-.103 E.05216
G1 X112.802 Y171.248 E.04125
G3 X109.274 Y175.396 I-7.36 J-2.685 E.18448
G1 X108.455 Y174.577 E.03842
G3 X102.989 Y174.58 I-2.737 J-5.807 E.1873
G1 X102.173 Y175.396 E.03826
G3 X98.645 Y171.248 I3.677 J-6.701 E.18469
G1 X99.527 Y170.366 E.04134
G3 X99.326 Y168.816 I6.547 J-1.635 E.05199
G1 X99.326 Y165.448 E.11172
G1 X98.227 Y164.348 E.05157
G1 X98.227 Y163.99 E.01188
G1 X99.326 Y162.891 E.05157
G1 X99.326 Y157.772 E.16981
G1 X98.227 Y156.672 E.05157
G1 X98.227 Y156.314 E.01188
G1 X99.326 Y155.215 E.05157
G1 X99.326 Y150.096 E.16981
G1 X98.227 Y148.997 E.05157
G1 X98.227 Y148.638 E.01188
G1 X99.326 Y147.539 E.05157
G1 X99.326 Y142.42 E.16981
G1 X98.227 Y141.321 E.05157
G1 X98.227 Y140.962 E.01188
G1 X99.326 Y139.863 E.05157
G1 X99.326 Y134.744 E.16981
G1 X98.227 Y133.645 E.05157
G1 X98.227 Y133.286 E.01188
G1 X99.326 Y132.187 E.05157
G1 X99.326 Y127.068 E.16981
G1 X98.227 Y125.969 E.05157
G1 X98.227 Y125.61 E.01188
G1 X99.326 Y124.511 E.05157
G1 X99.326 Y122.883 E.05401
G1 X97.265 Y113.352 F30000
G1 F15476.087
G2 X96.633 Y111.853 I-15.486 J5.651 E.05401
G1 X97.087 Y111.398 E.02133
G1 X97.633 Y111.398 E.0181
G3 X99.078 Y115.907 I-15.524 J7.461 E.15757
G1 X99.125 Y117.036 E.03747
G1 X98.202 Y117.959 E.04331
G3 X98.216 Y118.282 I-3.843 J.327 E.01073
G1 X99.22 Y119.286 E.04708
G1 X99.239 Y119.748 E.01535
G1 X99.682 Y119.748 E.01469
G1 X100.781 Y120.847 E.05157
G1 X102.99 Y120.847 E.07326
G1 X104.089 Y119.748 E.05157
G1 X107.358 Y119.748 E.10843
G1 X108.457 Y120.847 E.05157
G1 X110.666 Y120.847 E.07326
G1 X111.765 Y119.748 E.05157
G1 X112.208 Y119.748 E.01469
G1 X112.227 Y119.286 E.01535
G1 X113.231 Y118.282 E.04708
G3 X113.245 Y117.959 I3.857 J.004 E.01073
G1 X112.322 Y117.036 E.04331
G3 X113.32 Y112.519 I11.81 J.24 E.15443
G3 X113.814 Y111.398 I13.614 J5.338 E.04067
G1 X114.36 Y111.398 E.0181
G1 X114.815 Y111.853 E.02133
G2 X114.182 Y113.352 I14.855 J7.151 E.05401
G1 X114.059 Y111.006 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X115.205 Y111.006 E.03522
G3 X116.693 Y108.527 I58.283 J33.296 E.08882
G1 X115.51 Y108.527 E.03635
G2 X114.087 Y110.953 I30.198 J19.348 E.08642
G1 X114.639 Y110.659 F30000
; LINE_WIDTH: 0.360195
G1 F15000
G1 X115.005 Y110.659 E.00947
G3 X116.077 Y108.875 I43.813 J25.104 E.05381
G1 X115.706 Y108.875 E.00959
G2 X114.669 Y110.607 I41.079 J25.769 E.0522
G1 X117.559 Y106.639 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.856 Y106.936 E.01289
G1 X117.655 Y107.268
G1 X117.026 Y106.639 E.02732
G1 X116.493 Y106.639
G1 X117.454 Y107.6 E.04175
G1 X117.252 Y107.932
G1 X116.269 Y106.948 E.04274
G1 X116.067 Y107.28
G1 X117.051 Y108.264 E.04274
G1 X116.574 Y108.32
G1 X115.866 Y107.612 E.03076
G1 X115.665 Y107.944
G1 X116.041 Y108.32 E.01633
M204 S10000
; WIPE_START
G1 F24000
G1 X115.665 Y107.944 E-.20192
G1 X115.866 Y107.612 E-.14754
G1 X116.574 Y108.32 E-.38035
G1 X116.653 Y108.311 E-.03019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.925 J.791 P1  F30000
G1 X119.561 Y104.908 Z3
G1 Z2.6
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X119.239 Y104.586 E.01399
G1 X118.706 Y104.586
G1 X119.36 Y105.24 E.02842
G1 X119.159 Y105.572
G1 X118.173 Y104.586 E.04285
G1 X117.639 Y104.586
G1 X118.957 Y105.904 E.05727
G1 X118.714 Y106.194
G1 X117.18 Y104.66 E.06669
G1 X116.978 Y104.992
G1 X118.181 Y106.194 E.05226
G1 X117.648 Y106.194
G1 X116.777 Y105.324 E.03783
G1 X116.576 Y105.656
G1 X117.115 Y106.194 E.0234
M204 S10000
; WIPE_START
G1 F24000
G1 X116.576 Y105.656 E-.28943
G1 X116.777 Y105.324 E-.14754
G1 X117.378 Y105.925 E-.32303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.3 J-1.179 P1  F30000
G1 X97.388 Y111.006 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G2 X95.937 Y108.527 I-33.493 J17.942 E.08826
G1 X94.754 Y108.527 E.03635
G3 X96.242 Y111.006 I-55.663 J35.094 E.08882
G1 X97.328 Y111.006 E.03338
G1 X96.809 Y110.659 F30000
; LINE_WIDTH: 0.360186
G1 F15000
G2 X95.742 Y108.875 I-43.654 J24.897 E.05375
G1 X95.371 Y108.875 E.00959
G3 X96.442 Y110.659 I-42.753 J26.895 E.05381
G1 X96.749 Y110.659 E.00792
G1 X94.629 Y106.639 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.549 Y107.56 E.04
G1 X95.776 Y108.32
G1 X94.095 Y106.639 E.07305
G1 X93.562 Y106.639
G1 X95.243 Y108.32 E.07305
G1 X94.71 Y108.32
G1 X94 Y107.61 E.03084
M204 S10000
G1 X96.017 Y108.295 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119584
G1 F15000
G1 X95.846 Y108.32 E.00108
G1 X95.093 Y106.808 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X94.945 Y106.62 E.00088
G1 X94.061 Y107.55 F30000
; LINE_WIDTH: 0.225731
G1 F15000
G1 X93.92 Y107.369 E.00342
; LINE_WIDTH: 0.179877
G1 X93.778 Y107.189 E.00256
; LINE_WIDTH: 0.134023
G1 X93.636 Y107.008 E.0017
; WIPE_START
G1 F24000
G1 X93.778 Y107.189 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.215 J-.063 P1  F30000
G1 X93.642 Y104.586 Z3
G1 Z2.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.117 Y106.061 E.06408
G1 X94.717 Y106.194
G1 X93.109 Y104.586 E.06989
G1 X92.576 Y104.586
G1 X94.184 Y106.194 E.06989
G1 X93.651 Y106.194
G1 X92.042 Y104.586 E.06989
G1 X91.971 Y105.048
G1 X93.117 Y106.194 E.0498
M204 S10000
G1 X92.752 Y106.213 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.186834
G1 F15000
G1 X92.59 Y106.007 E.00308
; LINE_WIDTH: 0.137502
G1 X92.428 Y105.8 E.00202
; WIPE_START
G1 F24000
G1 X92.59 Y106.007 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.389 J1.153 P1  F30000
G1 X94.66 Y105.309 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X94.515 Y105.124 E.00087
; LINE_WIDTH: 0.134577
G1 X94.369 Y104.938 E.00176
; LINE_WIDTH: 0.180984
G1 X94.224 Y104.753 E.00265
; LINE_WIDTH: 0.227391
G1 X94.078 Y104.567 E.00354
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X94.224 Y104.753 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/25
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
G3 Z3 I-.832 J.888 P1  F30000
G1 X111.773 Y121.196 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X102.594 Y173.973 I-6.053 J-.016 E.42385
G1 X102.594 Y173.973 E0
G3 X99.674 Y168.804 I3.163 J-5.196 E.20572
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X114.296 Y109.775 I17.341 J3 E.21694
G1 X115.621 Y107.587 E.08486
G1 X117.721 Y107.587 E.06966
G1 X115.825 Y110.716 E.12138
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
M73 P82 R2
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X93.726 Y107.587 E.12138
G1 X95.826 Y107.587 E.06966
G3 X97.52 Y110.412 I-66.525 J41.814 E.10928
G3 X99.425 Y115.867 I-15.232 J8.38 E.19256
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X113.958 Y109.575 I17.744 J3.051 E.20601
G1 X116.398 Y105.549 E.14466
G1 X119.415 Y105.549 E.0927
G1 X119.098 Y106.072 E.0188
G1 X116.162 Y110.916 E.17404
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.93 Y171.459 I-8.238 J-.006 E.71148
G1 X97.93 Y171.459 E0
G3 X97.486 Y168.795 I8.325 J-2.756 E.0833
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X92.032 Y105.549 E.19284
G1 X95.049 Y105.549 E.0927
G1 X97.489 Y109.575 E.14466
G3 X99.816 Y115.822 I-15.418 J9.298 E.20601
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.059 J.6 P1  F30000
G1 X112.463 Y115.417 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X97.936 Y112.176 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G2 X96.645 Y109.698 I-16.113 J6.818 E.08595
G1 X95.454 Y109.698 E.0366
G1 X96.287 Y111.082 E.04963
G3 X96.833 Y112.176 I-12.752 J7.057 E.0376
G1 X97.876 Y112.176 E.03203
G1 X97.404 Y111.829 F30000
; LINE_WIDTH: 0.360929
G1 F15000
G2 X96.446 Y110.047 I-13.362 J6.035 E.05249
G1 X96.071 Y110.047 E.00972
G3 X97.054 Y111.829 I-13.698 J8.717 E.05279
G1 X97.344 Y111.829 E.00752
G1 X95.836 Y109.49 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X96.386 Y108.94 E.0239
G1 X96.185 Y108.608
G1 X95.303 Y109.49 E.03833
G1 X94.995 Y109.265
G1 X95.984 Y108.276 E.04295
G1 X95.782 Y107.944
G1 X94.795 Y108.932 E.04291
G1 X94.594 Y108.599
G1 X95.384 Y107.809 E.03431
G1 X94.851 Y107.809
G1 X94.394 Y108.266 E.01984
M204 S10000
G1 X95.736 Y107.87 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0935501
G1 F15000
G2 X95.629 Y107.791 I-.124 J.056 E.00057
G1 X95.676 Y106.984 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.295 Y107.365 E.01655
G1 X94.762 Y107.365
G1 X95.475 Y106.652 E.03098
G1 X95.274 Y106.32
G1 X94.229 Y107.365 E.04541
G1 X93.696 Y107.365
G1 X95.073 Y105.988 E.05983
G1 X94.771 Y105.756
G1 X93.295 Y107.232 E.06413
G1 X93.094 Y106.9
G1 X94.237 Y105.756 E.0497
G1 X93.704 Y105.756
G1 X92.892 Y106.568 E.03527
G1 X92.691 Y106.236
G1 X93.171 Y105.756 E.02084
M204 S10000
; WIPE_START
G1 F24000
G1 X92.691 Y106.236 E-.25776
G1 X92.892 Y106.568 E-.14754
G1 X93.552 Y105.908 E-.3547
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.214 J-.087 P1  F30000
G1 X93.446 Y107.384 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0798268
G1 F15000
G3 X93.341 Y107.307 I.016 J-.132 E.00041
; WIPE_START
G1 F24000
G1 X93.38 Y107.356 E-.35466
G1 X93.446 Y107.384 E-.40534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.138 J.432 P1  F30000
G1 X99.326 Y122.883 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.747 J-.084 E.05199
G1 X98.643 Y171.25 E.04147
G2 X102.173 Y175.396 I7.225 J-2.578 E.18465
G1 X102.989 Y174.58 E.03827
G2 X108.455 Y174.577 I2.73 J-5.809 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.832 J-6.834 E.18448
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X113.516 Y112.176 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X114.614 Y112.176 E.03373
G3 X115.984 Y109.698 I21.2 J10.1 E.08706
G1 X114.801 Y109.698 E.03635
G2 X113.541 Y112.121 I14.767 J9.216 E.08402
G1 X114.051 Y111.83 F30000
; LINE_WIDTH: 0.359346
G1 F15000
G1 X114.394 Y111.83 E.00885
G3 X115.367 Y110.045 I17.414 J8.333 E.05245
G1 X114.996 Y110.045 E.00957
G2 X114.076 Y111.776 I13.353 J8.211 E.05057
G1 X117.248 Y107.809 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.567 Y109.49 E.07305
G1 X115.034 Y109.49
G1 X116.715 Y107.809 E.07305
G1 X116.181 Y107.809
G1 X115.078 Y108.913 E.04796
M204 S10000
G1 X116.991 Y108.362 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X116.841 Y108.553 E.0009
; LINE_WIDTH: 0.137002
G1 X116.691 Y108.744 E.00186
; LINE_WIDTH: 0.185835
G1 X116.541 Y108.935 E.00283
; LINE_WIDTH: 0.234668
G1 X116.391 Y109.127 E.0038
; LINE_WIDTH: 0.283501
G1 X116.24 Y109.318 E.00477
; LINE_WIDTH: 0.332334
G1 X116.09 Y109.509 E.00573
G1 X115.826 Y107.791 F30000
; LINE_WIDTH: 0.17562
G1 F15000
G1 X115.68 Y107.976 E.00255
; LINE_WIDTH: 0.131895
G1 X115.535 Y108.162 E.00171
G1 X115.139 Y108.974 F30000
; LINE_WIDTH: 0.22573
G1 F15000
G1 X115.002 Y109.148 E.0033
; LINE_WIDTH: 0.171244
G1 X114.866 Y109.322 E.00231
G1 X114.845 Y109.413 E.00097
; LINE_WIDTH: 0.200017
G1 X114.857 Y109.509 E.00125
; WIPE_START
G1 F24000
G1 X114.845 Y109.413 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.754 J.955 P1  F30000
G1 X118.656 Y106.402 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M73 P83 R2
G1 F12000
G1 X117.693 Y107.365 E.04184
G1 X117.16 Y107.365
G1 X118.768 Y105.756 E.06989
G1 X118.235 Y105.756
G1 X116.626 Y107.365 E.06989
G1 X116.093 Y107.365
G1 X117.701 Y105.756 E.06989
G1 X117.168 Y105.756
G1 X115.56 Y107.365 E.06989
M204 S10000
; WIPE_START
G1 F24000
G1 X116.974 Y105.95 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.735 J-.97 P1  F30000
G1 X116.693 Y105.738 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.322228
G1 F15000
G1 X116.547 Y105.922 E.00535
; LINE_WIDTH: 0.275416
G1 X116.402 Y106.107 E.00445
; LINE_WIDTH: 0.228604
G1 X116.257 Y106.292 E.00356
; LINE_WIDTH: 0.181792
G1 X116.112 Y106.477 E.00266
; LINE_WIDTH: 0.134981
G1 X115.967 Y106.662 E.00176
G1 X118.199 Y107.153 F30000
; LINE_WIDTH: 0.0881692
G1 F15000
G1 X118.109 Y107.268 E.00054
; LINE_WIDTH: 0.113286
G1 X118.018 Y107.384 E.00084
; WIPE_START
G1 F24000
G1 X118.109 Y107.268 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.072 J.576 P1  F30000
G1 X118.93 Y105.738 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.201095
G1 F15000
G1 X118.944 Y105.847 E.00142
; LINE_WIDTH: 0.163005
G1 X118.928 Y105.916 E.00069
; LINE_WIDTH: 0.118353
G1 X118.817 Y106.058 E.00111
; LINE_WIDTH: 0.154146
G1 X118.706 Y106.199 E.00163
; LINE_WIDTH: 0.189938
G1 X118.595 Y106.341 E.00215
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.706 Y106.199 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/25
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
G3 Z3.2 I-1.105 J-.511 P1  F30000
G1 X111.773 Y121.196 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X114.295 Y109.775 I17.341 J3 E.21694
G1 X114.912 Y108.757 E.03947
G1 X117.012 Y108.757 E.06966
G1 X115.825 Y110.716 E.07599
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.623 Y110.716 I-15.689 J.031 E.28154
G1 X94.435 Y108.757 E.07599
G1 X96.535 Y108.757 E.06966
G3 X98.169 Y111.718 I-22.734 J14.474 E.11226
G3 X99.425 Y115.867 I-15.87 J7.07 E.14416
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X113.958 Y109.575 I17.744 J3.051 E.20601
G1 X115.689 Y106.719 E.10261
G1 X118.706 Y106.719 E.0927
G1 X118.494 Y107.069 E.01257
G1 X116.162 Y110.916 E.13822
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X92.742 Y106.719 E.15079
G1 X95.758 Y106.719 E.0927
G1 X97.489 Y109.575 E.10261
G3 X99.816 Y115.822 I-15.418 J9.298 E.20601
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.059 J.6 P1  F30000
G1 X112.463 Y115.417 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X98.382 Y113.346 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G2 X97.316 Y110.868 I-15.934 J5.385 E.08299
G1 X96.158 Y110.868 E.03557
G3 X97.31 Y113.346 I-12.684 J7.401 E.08409
G1 X98.322 Y113.346 E.0311
G1 X97.889 Y112.999 F30000
; LINE_WIDTH: 0.359894
G1 F15000
G2 X97.106 Y111.215 I-16.201 J6.05 E.05036
G1 X96.748 Y111.215 E.00924
G3 X97.551 Y112.999 I-14.77 J7.72 E.05057
G1 X97.829 Y112.999 E.00719
G1 X95.903 Y108.98 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.153 Y110.229 E.05431
G1 X97.051 Y110.661
G1 X95.37 Y108.98 E.07305
G1 X94.836 Y108.98
G1 X96.517 Y110.661 E.07305
M204 S10000
G1 X96.026 Y110.68 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.34083
G1 F15000
G1 X95.898 Y110.516 E.00504
; LINE_WIDTH: 0.29872
G1 X95.771 Y110.353 E.00432
; LINE_WIDTH: 0.25661
G1 X95.643 Y110.189 E.00361
; LINE_WIDTH: 0.2145
G1 X95.515 Y110.025 E.0029
; LINE_WIDTH: 0.17239
G1 X95.388 Y109.862 E.00219
; LINE_WIDTH: 0.13028
G1 X95.26 Y109.698 E.00148
G1 X96.717 Y109.499 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X96.577 Y109.32 E.00084
; LINE_WIDTH: 0.133176
G1 X96.438 Y109.14 E.00167
; LINE_WIDTH: 0.178182
G1 X96.298 Y108.961 E.0025
G1 X96.525 Y108.535 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X94.916 Y106.927 E.06989
G1 X94.383 Y106.927
G1 X95.991 Y108.535 E.06989
G1 X95.458 Y108.535
G1 X93.85 Y106.927 E.06989
G1 X93.316 Y106.927
G1 X94.925 Y108.535 E.06989
G1 X94.391 Y108.535
G1 X93.612 Y107.756 E.03386
M204 S10000
G1 X93.673 Y107.695 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.225731
G1 F15000
G1 X93.532 Y107.514 E.00342
; LINE_WIDTH: 0.179877
G1 X93.39 Y107.334 E.00256
; LINE_WIDTH: 0.134023
G1 X93.249 Y107.154 E.0017
; WIPE_START
G1 F24000
G1 X93.39 Y107.334 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.278 J1.185 P1  F30000
G1 X96.301 Y108.016 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X96.156 Y107.832 E.00087
; LINE_WIDTH: 0.135281
G1 X96.011 Y107.647 E.00177
; LINE_WIDTH: 0.182393
G1 X95.866 Y107.462 E.00267
; LINE_WIDTH: 0.229505
G1 X95.721 Y107.277 E.00357
; LINE_WIDTH: 0.276617
G1 X95.576 Y107.093 E.00447
; LINE_WIDTH: 0.323729
G1 X95.431 Y106.908 E.00537
; WIPE_START
G1 F24000
G1 X95.576 Y107.093 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.184 J.281 P1  F30000
G1 X99.326 Y122.883 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.748 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03827
G2 X108.455 Y174.577 I2.73 J-5.808 E.1873
G1 X109.276 Y175.398 E.03851
G2 X112.802 Y171.248 I-3.854 J-6.847 E.18447
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
M73 P84 R2
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X113.071 Y113.346 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X114.137 Y113.346 E.03277
G3 X115.274 Y110.868 I18.44 J6.958 E.08385
G1 X114.131 Y110.868 E.03511
G2 X113.091 Y113.29 I14.436 J7.636 E.08108
G1 X113.562 Y113 F30000
; LINE_WIDTH: 0.359631
G1 F15000
G1 X113.896 Y113 E.00862
G3 X114.699 Y111.215 I15.374 J5.842 E.05053
G1 X114.341 Y111.215 E.00923
G2 X113.583 Y112.943 I13.809 J7.092 E.04874
G1 X115.634 Y108.98 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.246 Y109.592 E.02661
G1 X116.045 Y109.924
G1 X115.101 Y108.98 E.04104
G1 X114.863 Y109.275
G1 X115.844 Y110.256 E.04263
G1 X115.642 Y110.588
G1 X114.664 Y109.61 E.04253
G1 X114.465 Y109.944
G1 X115.182 Y110.661 E.03115
G1 X114.648 Y110.661
G1 X114.266 Y110.278 E.01662
M204 S10000
; WIPE_START
G1 F24000
G1 X114.648 Y110.661 E-.20559
G1 X115.182 Y110.661 E-.20264
G1 X114.527 Y110.006 E-.35176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.74 J.966 P1  F30000
G1 X118.152 Y107.232 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X117.847 Y106.927 E.01328
M73 P84 R1
G1 X117.314 Y106.927
G1 X117.951 Y107.564 E.0277
G1 X117.75 Y107.896
G1 X116.78 Y106.927 E.04213
G1 X116.247 Y106.927
G1 X117.549 Y108.228 E.05656
G1 X117.322 Y108.535
G1 X115.771 Y106.984 E.0674
G1 X115.57 Y107.316
G1 X116.789 Y108.535 E.05297
G1 X116.256 Y108.535
G1 X115.369 Y107.648 E.03854
G1 X115.167 Y107.98
G1 X115.722 Y108.535 E.02412
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.167 Y107.98 E-.29823
G1 X115.369 Y107.648 E-.14754
G1 X115.953 Y108.233 E-.31423
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.4 I-1.158 J-.374 P1  F30000
G1 X111.773 Y121.196 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.008 E.62989
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.004 E.54588
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X114.207 Y109.928 I17.063 J2.905 E.21111
G1 X116.303 Y109.928 E.06951
G1 X115.825 Y110.716 E.03059
G2 X113.569 Y118.791 I13.433 J8.105 E.28154
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X95.601 Y110.681 I-15.654 J.021 E.28294
G1 X95.145 Y109.928 E.02921
G1 X97.24 Y109.928 E.06951
G3 X99.425 Y115.867 I-15.082 J8.92 E.21108
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X111.818 Y114.892 I11.178 J1.757 E.02916
G1 X111.818 Y114.892 E0
G3 X113.958 Y109.575 I17.298 J3.873 E.17687
G1 X114.98 Y107.89 E.06056
G1 X117.996 Y107.89 E.0927
G1 X117.889 Y108.066 E.00634
G1 X116.162 Y110.916 E.1024
G2 X113.961 Y118.795 I13.095 J7.906 E.25448
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X93.451 Y107.89 E.10874
G1 X96.468 Y107.89 E.0927
G3 X98.209 Y110.884 I-34.84 J22.267 E.10647
G3 X99.816 Y115.822 I-16.278 J8.025 E.1601
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.059 J.6 P1  F30000
G1 X112.463 Y115.417 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X112.322 Y117.036 I5.415 J1.286 E.05408
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G2 X98.985 Y115.417 I-5.555 J-.332 E.05408
G1 X98.729 Y114.517 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G2 X97.878 Y112.038 I-15.029 J3.777 E.08061
G1 X96.769 Y112.038 E.03409
G3 X97.68 Y114.517 I-13.969 J6.544 E.08124
G1 X98.669 Y114.517 E.03039
G1 X98.271 Y114.167 F30000
; LINE_WIDTH: 0.36155
G1 F15000
G2 X97.648 Y112.385 I-15.666 J4.484 E.04903
G1 X97.304 Y112.385 E.00893
G1 X97.704 Y113.41 E.02856
G3 X97.939 Y114.167 I-65.81 J20.863 E.02058
G1 X98.211 Y114.167 E.00706
G1 X97.228 Y111.831 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.737 Y111.323 E.02209
G1 X97.559 Y110.967
G1 X96.695 Y111.831 E.03755
G1 X96.375 Y111.617
G1 X97.376 Y110.617 E.04348
G1 X97.184 Y110.275
G1 X96.192 Y111.267 E.0431
G1 X95.998 Y110.928
G1 X96.776 Y110.15 E.03382
G1 X96.243 Y110.15
G1 X95.799 Y110.594 E.01928
M204 S10000
G1 X97.085 Y109.308 F30000
M204 S2000
G1 F12000
G1 X96.688 Y109.705 E.01726
G1 X96.154 Y109.705
G1 X96.884 Y108.976 E.03169
G1 X96.682 Y108.644
G1 X95.621 Y109.705 E.04612
G1 X95.088 Y109.705
G1 X96.481 Y108.312 E.06055
G1 X96.163 Y108.097
G1 X94.704 Y109.556 E.06342
G1 X94.502 Y109.224
G1 X95.63 Y108.097 E.04899
G1 X95.096 Y108.097
G1 X94.301 Y108.892 E.03456
G1 X94.1 Y108.56
G1 X94.563 Y108.097 E.02013
M204 S10000
; WIPE_START
G1 F24000
G1 X94.1 Y108.56 E-.24896
G1 X94.301 Y108.892 E-.14754
G1 X94.977 Y108.216 E-.36351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.214 J-.085 P1  F30000
G1 X94.871 Y109.724 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0929204
G1 F15000
G3 X94.75 Y109.631 I.022 J-.154 E.00065
; WIPE_START
G1 F24000
G1 X94.8 Y109.695 E-.38826
G1 X94.871 Y109.724 E-.37174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.153 J.39 P1  F30000
G1 X99.326 Y122.883 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
M73 P85 R1
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.748 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03827
G2 X108.455 Y174.577 I2.73 J-5.809 E.1873
G1 X109.276 Y175.398 E.03851
G2 X112.802 Y171.248 I-3.854 J-6.847 E.18447
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X112.718 Y114.517 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.764 Y114.517 E.03213
G3 X114.679 Y112.038 I15.473 J4.305 E.08127
G1 X113.569 Y112.038 E.03409
G2 X112.734 Y114.459 I14.083 J6.215 E.07877
G1 X113.172 Y114.17 F30000
; LINE_WIDTH: 0.359887
G1 F15000
G1 X113.5 Y114.17 E.00847
G3 X114.144 Y112.385 I16.307 J4.872 E.04902
G1 X113.8 Y112.385 E.00888
G2 X113.189 Y114.112 I15.856 J6.586 E.04733
G1 X114.293 Y111.831 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.807 Y110.317 E.06577
G1 X115.441 Y110.15
G1 X113.76 Y111.831 E.07305
G1 X113.689 Y111.368
G1 X114.907 Y110.15 E.05293
M204 S10000
G1 X114.475 Y110.131 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.266816
G1 F15000
G1 X114.318 Y110.336 E.00471
; LINE_WIDTH: 0.217945
G1 X114.161 Y110.541 E.00368
; LINE_WIDTH: 0.169074
G1 X114.075 Y110.657 E.00149
; LINE_WIDTH: 0.128622
G1 X113.989 Y110.774 E.00101
G1 X115.382 Y111.036 F30000
; LINE_WIDTH: 0.0885427
G1 F15000
G1 X115.287 Y111.16 E.00058
; LINE_WIDTH: 0.123117
G1 X115.208 Y111.268 E.00088
; LINE_WIDTH: 0.163625
G1 X115.128 Y111.376 E.00132
; LINE_WIDTH: 0.204132
G1 X115.049 Y111.484 E.00176
; LINE_WIDTH: 0.244639
G1 X114.969 Y111.592 E.0022
; LINE_WIDTH: 0.309601
G1 X114.785 Y111.85 E.00688
; WIPE_START
G1 F24000
G1 X114.969 Y111.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.987 J.712 P1  F30000
G1 X117.494 Y108.097 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.885 Y109.705 E.06989
G1 X115.352 Y109.705
G1 X116.96 Y108.097 E.06989
G1 X116.427 Y108.097
G1 X114.819 Y109.705 E.06989
G1 X114.286 Y109.705
G1 X115.894 Y108.097 E.06989
M204 S10000
G1 X115.339 Y108.078 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419275
G1 F15000
G1 X115.195 Y108.263 E.00719
; LINE_WIDTH: 0.371974
G1 X115.05 Y108.447 E.00629
; LINE_WIDTH: 0.324673
G1 X114.905 Y108.632 E.00538
; LINE_WIDTH: 0.277373
G1 X114.76 Y108.816 E.00448
; LINE_WIDTH: 0.230072
G1 X114.616 Y109.001 E.00358
; LINE_WIDTH: 0.182771
G1 X114.471 Y109.185 E.00267
; LINE_WIDTH: 0.13547
G1 X114.326 Y109.37 E.00177
; WIPE_START
G1 F24000
G1 X114.471 Y109.185 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.277 J1.185 P1  F30000
G1 X117.379 Y108.507 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X117.242 Y108.681 E.00081
; LINE_WIDTH: 0.132654
G1 X117.106 Y108.855 E.00162
; LINE_WIDTH: 0.177138
G1 X116.969 Y109.029 E.00242
; LINE_WIDTH: 0.221623
G1 X116.833 Y109.202 E.00322
; LINE_WIDTH: 0.266107
G1 X116.697 Y109.376 E.00402
; LINE_WIDTH: 0.310592
G1 X116.56 Y109.55 E.00482
; LINE_WIDTH: 0.355076
G1 X116.424 Y109.724 E.00562
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.56 Y109.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.6 I-1.126 J-.463 P1  F30000
G1 X111.773 Y121.196 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.008 E.62989
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.004 E.54588
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X113.571 Y111.098 I17.486 J3.041 E.16688
G1 X115.595 Y111.098 E.06714
G2 X113.569 Y118.791 I13.731 J7.729 E.26679
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X95.853 Y111.098 I-15.756 J.035 E.26679
G1 X97.877 Y111.098 E.06714
G1 X98.169 Y111.718 E.02275
G3 X99.425 Y115.867 I-15.87 J7.07 E.14416
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X111.81 Y114.925 I10.772 J1.68 E.02809
G1 X111.81 Y114.925 E0
G3 X114.27 Y109.06 I17.822 J4.026 E.19644
G1 X117.285 Y109.063 E.09264
G2 X115.844 Y111.466 I56.583 J35.559 E.0861
G2 X113.961 Y118.795 I13.326 J7.331 E.23499
G1 X113.961 Y168.795 E1.53636
G3 X103.132 Y176.615 I-8.246 J-.012 E.47835
G1 X103.132 Y176.615 E0
G3 X97.486 Y168.795 I2.595 J-7.822 E.31657
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X94.16 Y109.06 E.06669
G1 X97.177 Y109.06 E.0927
G3 X99.816 Y115.822 I-15.315 J9.872 E.22453
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.651 J1.028 P1  F30000
G1 X113.033 Y116.079 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.362 Y116.079 E.02225
G1 X112.322 Y117.036 E.03176
G1 X113.245 Y117.959 E.04331
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X99.125 Y117.036 E.04331
G1 X99.085 Y116.079 E.03176
G1 X98.415 Y116.079 E.02225
G1 X98.992 Y115.687 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G2 X98.333 Y113.209 I-16.376 J3.028 E.07888
G1 X97.259 Y113.209 E.03299
G3 X97.958 Y115.687 I-16.331 J5.945 E.0792
G1 X98.932 Y115.687 E.02991
G1 X98.567 Y115.336 F30000
; LINE_WIDTH: 0.360553
G1 F15000
G2 X98.083 Y113.555 I-15.779 J3.338 E.04779
G1 X97.751 Y113.555 E.00858
G3 X98.239 Y115.338 I-12.888 J4.483 E.04788
G1 X98.507 Y115.336 E.00694
G1 X98.184 Y112.327 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.177 Y111.32 E.04374
G1 X96.644 Y111.32
G1 X98.325 Y113.001 E.07305
G1 X97.791 Y113.001
G1 X96.341 Y111.551 E.06304
M204 S10000
G1 X96.514 Y111.45 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.164083
G1 F15000
G1 X96.51 Y111.365 E.00084
G1 X96.23 Y111.38 E.00276
G1 X97.972 Y111.822 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
M73 P86 R1
G1 X97.881 Y111.692 E.00059
; LINE_WIDTH: 0.129812
G1 X97.789 Y111.562 E.00113
; LINE_WIDTH: 0.171455
G1 X97.697 Y111.432 E.00167
; LINE_WIDTH: 0.213098
G1 X97.606 Y111.302 E.00221
G1 X98.344 Y112.721 F30000
; LINE_WIDTH: 0.195261
G1 F15000
G1 X98.121 Y112.389 E.00497
G1 X97.23 Y113.02 F30000
; LINE_WIDTH: 0.402757
G1 F15000
G1 X97.139 Y112.884 E.0048
; LINE_WIDTH: 0.356404
G1 X97.047 Y112.748 E.00418
; LINE_WIDTH: 0.31005
G1 X96.956 Y112.612 E.00357
; LINE_WIDTH: 0.263697
G1 X96.865 Y112.476 E.00295
; LINE_WIDTH: 0.216587
G1 X96.772 Y112.338 E.00236
; LINE_WIDTH: 0.17
G1 X96.697 Y112.232 E.00135
; LINE_WIDTH: 0.129086
G1 X96.622 Y112.125 E.00092
G1 X97.548 Y110.092 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X96.724 Y109.267 E.03584
G1 X96.19 Y109.267
G1 X97.799 Y110.876 E.06989
G1 X97.265 Y110.876
G1 X95.657 Y109.267 E.06989
G1 X95.124 Y109.267
G1 X96.732 Y110.876 E.06989
G1 X96.199 Y110.876
G1 X94.591 Y109.267 E.06989
M204 S10000
; WIPE_START
G1 F24000
G1 X96.005 Y110.682 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.697 J-.998 P1  F30000
G1 X95.7 Y110.894 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.350949
G1 F15000
G1 X95.565 Y110.722 E.00549
; LINE_WIDTH: 0.307152
G1 X95.43 Y110.55 E.00471
; LINE_WIDTH: 0.263356
G1 X95.295 Y110.378 E.00393
; LINE_WIDTH: 0.219559
G1 X95.16 Y110.205 E.00315
; LINE_WIDTH: 0.175763
G1 X95.024 Y110.033 E.00237
; LINE_WIDTH: 0.131966
G1 X94.889 Y109.861 E.00159
; WIPE_START
G1 F24000
G1 X95.024 Y110.033 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.249 J1.191 P1  F30000
G1 X97.837 Y110.62 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X97.737 Y110.484 E.00062
; LINE_WIDTH: 0.135788
G1 X97.637 Y110.348 E.00128
; LINE_WIDTH: 0.183406
G1 X97.487 Y110.153 E.00281
G1 X97.121 Y109.37 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X97.026 Y109.248 E.00057
; WIPE_START
G1 F24000
G1 X97.121 Y109.37 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.201 J.196 P1  F30000
G1 X99.326 Y122.883 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.748 J-.084 E.05199
G1 X98.645 Y171.248 E.04134
G2 X102.173 Y175.396 I7.204 J-2.552 E.18469
G1 X102.989 Y174.58 E.03827
G2 X108.455 Y174.577 I2.73 J-5.809 E.1873
G1 X109.276 Y175.398 E.03851
G2 X112.802 Y171.248 I-3.696 J-6.713 E.18468
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X112.456 Y115.687 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.485 Y115.687 E.03163
G3 X114.189 Y113.209 I15.76 J3.134 E.07924
G1 X113.115 Y113.209 E.03299
G2 X112.467 Y115.628 I14.342 J5.136 E.07705
G1 X112.88 Y115.336 F30000
; LINE_WIDTH: 0.359514
G1 F15000
G1 X113.201 Y115.34 E.00826
G3 X113.696 Y113.555 I17.093 J3.785 E.04781
G1 X113.365 Y113.555 E.00855
G2 X112.893 Y115.277 I15.192 J5.091 E.04609
G1 X115.072 Y111.617 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.775 Y111.32 E.01291
G1 X114.242 Y111.32
G1 X114.896 Y111.975 E.02844
G1 X114.725 Y112.338
G1 X113.711 Y111.323 E.0441
G1 X113.54 Y111.685
G1 X114.567 Y112.712 E.04462
G1 X114.323 Y113.001
G1 X113.378 Y112.056 E.04107
G1 X113.22 Y112.432
G1 X113.789 Y113.001 E.02475
M204 S10000
G1 X115.041 Y111.675 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0963563
G1 F15000
G1 X114.986 Y111.751 E.00041
G1 X114.995 Y111.807 E.00025
; WIPE_START
G1 F24000
G1 X114.986 Y111.751 E-.28836
G1 X115.041 Y111.675 E-.47164
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.143 J.418 P1  F30000
G1 X115.921 Y109.267 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.543 Y109.888 E.02699
G1 X116.341 Y110.221
G1 X115.388 Y109.267 E.04142
G1 X114.855 Y109.267
G1 X116.14 Y110.553 E.05585
G1 X115.93 Y110.876
G1 X114.362 Y109.308 E.06811
G1 X114.161 Y109.64
G1 X115.397 Y110.876 E.05368
G1 X114.863 Y110.876
G1 X113.965 Y109.977 E.03903
G1 X113.77 Y110.315
G1 X114.33 Y110.876 E.02434
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.77 Y110.315 E-.30103
G1 X113.965 Y109.977 E-.14833
G1 X114.543 Y110.556 E-.31064
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z3.8 I-1.178 J-.307 P1  F30000
G1 X111.773 Y121.196 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X113.047 Y112.268 I16.929 J2.876 E.12437
G1 X115.004 Y112.268 E.0649
G1 X114.919 Y112.448 E.00659
G2 X113.569 Y118.791 I14.25 J6.349 E.21671
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X96.444 Y112.268 I-15.678 J.03 E.22326
G1 X98.4 Y112.268 E.0649
G3 X99.425 Y115.867 I-15.903 J6.474 E.12437
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X113.58 Y110.23 I17.525 J2.971 E.1828
G1 X116.578 Y110.23 E.09212
G1 X116.162 Y110.916 E.02465
G2 X113.961 Y118.795 I13.095 J7.906 E.25447
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J0 E.79518
G1 X97.486 Y118.795 E1.53636
G2 X95.285 Y110.916 I-15.297 J.026 E.25448
G1 X94.869 Y110.23 E.02464
G1 X97.867 Y110.23 E.09212
G3 X99.816 Y115.822 I-15.578 J8.563 E.1828
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
G1 X112.254 Y118.654 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.313 Y117.249 E.04663
G1 X112.536 Y117.249 E.00738
G1 X113.245 Y117.959 E.03329
G2 X113.231 Y118.282 I3.843 J.327 E.01073
G1 X112.227 Y119.286 E.04708
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.216 Y118.282 E.04708
G2 X98.202 Y117.959 I-3.857 J.004 E.01073
G1 X98.912 Y117.249 E.03329
G1 X99.134 Y117.249 E.00738
G1 X99.193 Y118.654 E.04663
G1 X99.074 Y116.857 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X99.034 Y115.912 E.02907
G2 X98.691 Y114.379 I-13.976 J2.329 E.0483
G1 X97.644 Y114.379 E.03216
G3 X98.146 Y116.857 I-17.437 J4.823 E.07776
G1 X99.014 Y116.857 E.02667
G1 X98.565 Y116.326 F30000
; LINE_WIDTH: 0.639126
G1 F10566.817
G1 X98.584 Y116.255 E.00358
; LINE_WIDTH: 0.592584
G1 F11461.555
G1 X98.603 Y116.184 E.0033
; LINE_WIDTH: 0.546042
G1 F12521.831
G1 X98.622 Y116.112 E.00302
; LINE_WIDTH: 0.499499
G1 F13798.268
G1 X98.641 Y116.041 E.00274
; LINE_WIDTH: 0.452957
G1 F15000
G1 X98.66 Y115.97 E.00246
; LINE_WIDTH: 0.3652
M73 P87 R1
G1 X98.679 Y115.899 E.00194
G1 X98.572 Y115.339 E.01497
; LINE_WIDTH: 0.358067
G2 X98.421 Y114.724 I-88.103 J21.336 E.01624
G1 X98.105 Y114.743 E.00813
G3 X98.367 Y115.958 I-13.889 J3.636 E.03194
; LINE_WIDTH: 0.359872
G1 X98.395 Y116.011 E.00154
; LINE_WIDTH: 0.406415
G1 X98.424 Y116.063 E.00177
; LINE_WIDTH: 0.452957
G1 X98.452 Y116.116 E.00199
; LINE_WIDTH: 0.499499
G1 F13798.268
G1 X98.48 Y116.168 E.00222
; LINE_WIDTH: 0.546042
G1 F12521.831
G1 X98.508 Y116.221 E.00244
; LINE_WIDTH: 0.592584
G1 F11461.555
G1 X98.536 Y116.273 E.00267
G1 X98.087 Y114.172 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.647 Y113.612 E.02432
G1 X98.516 Y113.21
G1 X97.554 Y114.172 E.04181
G1 X97.314 Y113.879
G1 X98.372 Y112.821 E.04598
G1 X98.168 Y112.491
G1 X97.179 Y113.48 E.043
G1 X97.034 Y113.092
G1 X97.635 Y112.491 E.02611
M204 S10000
G1 X98.507 Y113.176 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X98.422 Y113.037 E.0006
G1 X98.381 Y111.745 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.08 Y112.046 E.01306
G1 X97.547 Y112.046
G1 X98.213 Y111.379 E.02897
G1 X98.043 Y111.017
G1 X97.013 Y112.046 E.04472
G1 X96.48 Y112.046
G1 X97.861 Y110.665 E.06
G1 X97.555 Y110.438
G1 X96.074 Y111.919 E.06437
G1 X95.891 Y111.569
G1 X97.022 Y110.438 E.04916
G1 X96.489 Y110.438
G1 X95.702 Y111.224 E.03416
G1 X95.507 Y110.886
G1 X95.955 Y110.438 E.01948
M204 S10000
; WIPE_START
G1 F24000
G1 X95.507 Y110.886 E-.24087
G1 X95.702 Y111.224 E-.14833
G1 X96.392 Y110.534 E-.3708
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.184 J.281 P1  F30000
G1 X99.326 Y122.883 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.748 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.832 J-6.834 E.18448
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X112.373 Y116.857 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.296 Y116.857 E.02835
G3 X113.803 Y114.379 I16.019 J1.988 E.07781
G1 X112.752 Y114.379 E.03229
G2 X112.43 Y115.822 I14.458 J3.987 E.04546
G2 X112.376 Y116.797 I19.433 J1.571 E.03001
G1 X112.882 Y116.314 F30000
; LINE_WIDTH: 0.637472
G1 F10596.214
G1 X112.916 Y116.253 E.00338
; LINE_WIDTH: 0.591205
G1 F11490.381
G1 X112.949 Y116.192 E.00312
; LINE_WIDTH: 0.544938
G1 F12549.368
G1 X112.982 Y116.13 E.00285
; LINE_WIDTH: 0.49867
G1 F13823.369
G1 X113.016 Y116.069 E.00259
; LINE_WIDTH: 0.452403
G1 F15000
G1 X113.049 Y116.008 E.00233
; LINE_WIDTH: 0.361031
G1 X113.082 Y115.947 E.00181
G3 X113.345 Y114.726 I20.91 J3.863 E.03237
G1 X113.019 Y114.726 E.00845
G2 X112.771 Y115.887 I14.211 J3.644 E.03079
; LINE_WIDTH: 0.359868
G1 X112.787 Y115.949 E.00164
; LINE_WIDTH: 0.406136
G1 X112.803 Y116.01 E.00188
; LINE_WIDTH: 0.452403
G1 X112.819 Y116.072 E.00212
; LINE_WIDTH: 0.49867
G1 F13823.369
G1 X112.835 Y116.133 E.00236
; LINE_WIDTH: 0.544938
G1 F12549.368
G1 X112.851 Y116.195 E.0026
; LINE_WIDTH: 0.591205
G1 F11490.381
G1 X112.867 Y116.256 E.00284
G1 X114.283 Y113.44 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.552 Y114.172 E.03178
G1 X113.019 Y114.172
G1 X114.631 Y112.559 E.07006
G1 X114.167 Y112.491
G1 X112.692 Y113.966 E.06409
G1 X112.939 Y113.185
G1 X113.633 Y112.491 E.03015
M204 S10000
G1 X112.949 Y114.101 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155564
G1 F15000
G1 X112.863 Y114.137 E.00085
G1 X112.624 Y114.137 E.00219
; WIPE_START
G1 F24000
G1 X112.863 Y114.137 E-.54769
G1 X112.949 Y114.101 E-.21231
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.908 J.81 P1  F30000
G1 X116.194 Y110.463 Z4
G1 Z3.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.611 Y112.046 E.06879
G1 X114.078 Y112.046
G1 X115.686 Y110.438 E.06989
G1 X115.153 Y110.438
G1 X113.545 Y112.046 E.06989
G1 X113.012 Y112.046
G1 X114.62 Y110.438 E.06989
G1 X114.087 Y110.438
G1 X113.313 Y111.211 E.0336
M204 S10000
; WIPE_START
G1 F24000
G1 X114.087 Y110.438 E-.41549
G1 X114.62 Y110.438 E-.20264
G1 X114.356 Y110.702 E-.14186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.395 J1.151 P1  F30000
G1 X115.766 Y111.186 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0886292
G1 F15000
G1 X115.637 Y111.353 E.00079
; LINE_WIDTH: 0.137399
G1 X115.541 Y111.485 E.00126
; LINE_WIDTH: 0.186727
G1 X115.444 Y111.616 E.00191
; LINE_WIDTH: 0.236055
G1 X115.347 Y111.748 E.00257
; LINE_WIDTH: 0.285384
G1 X115.251 Y111.879 E.00322
; LINE_WIDTH: 0.336665
G1 X115.12 Y112.065 E.00542
; WIPE_START
G1 F24000
G1 X115.251 Y111.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.851 J-.87 P1  F30000
G1 X113.758 Y110.419 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.138689
G1 F15000
G1 X113.685 Y110.519 E.00097
; LINE_WIDTH: 0.11343
G1 X113.611 Y110.62 E.00072
G1 X113.375 Y111.273 F30000
; LINE_WIDTH: 0.214925
G1 F15000
G1 X113.283 Y111.403 E.00224
; LINE_WIDTH: 0.172367
G1 X113.192 Y111.534 E.00168
; LINE_WIDTH: 0.12981
G1 X113.1 Y111.665 E.00113
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.192 Y111.534 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z4 I-1.204 J-.177 P1  F30000
G1 X111.773 Y121.196 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X112.623 Y113.439 I16.517 J2.797 E.08306
G1 X114.521 Y113.439 E.06297
G2 X113.569 Y118.791 I14.756 J5.387 E.18126
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G2 X96.926 Y113.439 I-15.708 J.034 E.18126
G1 X98.824 Y113.439 E.06297
G1 X98.931 Y113.768 E.0115
G3 X99.425 Y115.867 I-18.638 J5.49 E.07155
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X112.995 Y111.401 I17.841 J3.079 E.14255
G1 X115.882 Y111.401 E.08873
G1 X115.844 Y111.466 E.00233
G2 X113.961 Y118.795 I13.326 J7.331 E.23499
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X95.565 Y111.401 I-15.223 J.008 E.23731
G1 X98.453 Y111.401 E.08873
G3 X99.816 Y115.822 I-16.433 J7.487 E.14255
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.973 J.732 P1  F30000
G1 X112.324 Y118.028 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.199 Y118.028 E.0269
G3 X113.516 Y115.549 I15.353 J.702 E.07686
G1 X112.482 Y115.549 E.03177
G1 X112.408 Y116.039 E.01521
G1 X112.327 Y117.968 E.05933
G1 X112.784 Y117.587 F30000
; LINE_WIDTH: 0.547262
G1 F12491.523
G1 X112.842 Y116.747 E.03459
; LINE_WIDTH: 0.5925
G1 F11463.3
G1 X112.872 Y116.428 E.01436
; LINE_WIDTH: 0.62838
G1 F10760.769
G1 X112.902 Y116.109 E.0153
G1 X113.383 Y113.661 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.005 Y114.284 E.02705
G1 X113.889 Y114.7
G1 X112.849 Y113.661 E.04516
G1 X112.682 Y114.027
G1 X113.781 Y115.126 E.04778
G1 X113.464 Y115.342
G1 X112.561 Y114.439 E.03923
M73 P88 R1
G1 X112.455 Y114.867
G1 X112.93 Y115.342 E.02065
M204 S10000
; WIPE_START
G1 F24000
G1 X112.455 Y114.867 E-.25536
G1 X112.561 Y114.439 E-.1674
G1 X113.188 Y115.067 E-.33724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1 J.694 P1  F30000
G1 X115.373 Y111.919 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X115.062 Y111.608 E.01352
G1 X114.529 Y111.608
G1 X115.202 Y112.281 E.02924
G1 X115.036 Y112.648
G1 X113.996 Y111.608 E.04518
G1 X113.463 Y111.608
G1 X114.878 Y113.023 E.06149
G1 X114.538 Y113.216
G1 X113.067 Y111.745 E.06391
G1 X112.909 Y112.121
G1 X114.004 Y113.216 E.0476
G1 X113.471 Y113.216
G1 X112.757 Y112.502 E.03102
G1 X112.613 Y112.891
G1 X112.938 Y113.216 E.01413
M204 S10000
G1 X113.221 Y119.913 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X113.228 Y118.42 I35.65 J-.563 E.04954
G1 X113.093 Y118.42 E.00447
G1 X112.227 Y119.286 E.04062
G1 X112.208 Y119.748 E.01535
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.22 Y119.286 E.01535
G1 X98.354 Y118.42 E.04062
G1 X98.219 Y118.42 E.00447
G3 X98.227 Y119.913 I-35.643 J.931 E.04954
G1 X99.123 Y118.028 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X99.034 Y115.912 E.06506
G1 X98.965 Y115.549 E.01135
G1 X97.936 Y115.549 E.03163
G3 X98.248 Y118.028 I-14.774 J3.118 E.07684
G1 X99.063 Y118.028 E.02505
G1 X98.54 Y116.049 F30000
; LINE_WIDTH: 0.665446
G1 F10120.059
G1 X98.572 Y116.385 E.01709
; LINE_WIDTH: 0.630125
G1 F10728.792
G1 X98.603 Y116.72 E.01612
; LINE_WIDTH: 0.588342
G1 F11550.689
G3 X98.661 Y117.527 I-18.525 J1.715 E.03596
G1 X98.952 Y114.695 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.918 Y113.661 E.04493
G1 X97.384 Y113.661
G1 X99.065 Y115.342 E.07305
G1 X98.532 Y115.342
G1 X97.43 Y114.24 E.04789
M204 S10000
G1 X97.954 Y115.361 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.19815
G1 F15000
G1 X97.542 Y114.639 E.01051
; WIPE_START
G1 F24000
G1 X97.954 Y115.361 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.217 J.014 P1  F30000
G1 X97.998 Y111.608 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.559 Y112.169 E.02437
G1 X98.886 Y113.03
G1 X97.464 Y111.608 E.06179
G1 X96.931 Y111.608
G1 X98.539 Y113.216 E.06989
G1 X98.006 Y113.216
G1 X96.398 Y111.608 E.06989
G1 X95.962 Y111.706
G1 X97.473 Y113.216 E.06565
G1 X96.94 Y113.216
G1 X96.441 Y112.718 E.02166
M204 S10000
G1 X98.967 Y113.193 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12712
G1 F15000
G1 X98.563 Y113.193 E.00278
G1 X96.504 Y112.656 F30000
; LINE_WIDTH: 0.210297
G1 F15000
G1 X96.401 Y112.503 E.0025
; LINE_WIDTH: 0.173168
G1 X96.324 Y112.393 E.00143
; LINE_WIDTH: 0.13067
G1 X96.246 Y112.282 E.00097
; WIPE_START
G1 F24000
G1 X96.324 Y112.393 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.17 J.335 P1  F30000
G1 X99.326 Y122.883 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.747 J-.084 E.05199
G1 X98.645 Y171.248 E.04134
G2 X102.173 Y175.396 I7.204 J-2.552 E.18469
G1 X102.989 Y174.58 E.03827
G2 X108.455 Y174.577 I2.73 J-5.808 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.677 J-6.701 E.18469
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.121 Y124.511 E-.61876
G1 X112.384 Y124.774 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z4.2 I1.2 J-.205 P1  F30000
G1 X111.773 Y121.196 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.022 Y115.867 E.11729
G3 X112.287 Y114.609 I15.122 J2.528 E.04266
G1 X114.145 Y114.609 E.06162
G1 X114.059 Y114.915 E.01055
G2 X113.569 Y118.791 I15.107 J3.881 E.12994
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J.005 E.81787
G1 X97.879 Y118.791 E1.65858
G2 X97.302 Y114.609 I-15.767 J.041 E.14047
G1 X99.16 Y114.609 E.06162
G3 X99.425 Y115.867 I-14.857 J3.786 E.04266
G1 X99.573 Y119.4 E.11729
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X112.51 Y112.571 I17.906 J3.095 E.10363
G1 X115.295 Y112.571 E.08555
G2 X113.961 Y118.795 I14.005 J6.256 E.19704
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J0 E.79518
G1 X97.486 Y118.795 E1.53636
G2 X96.153 Y112.571 I-15.339 J.032 E.19704
G1 X98.937 Y112.571 E.08555
G1 X99.076 Y112.946 E.01229
G3 X99.816 Y115.822 I-16.781 J5.846 E.09135
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
G1 X112.275 Y119.198 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.177 Y119.198 E.02771
G3 X113.32 Y116.72 I18.749 J-.161 E.07633
G1 X112.379 Y116.72 E.02891
G1 X112.278 Y119.138 E.07437
G1 X112.736 Y118.756 F30000
; LINE_WIDTH: 0.543281
G1 F12590.924
G3 X112.807 Y117.231 I33.219 J.796 E.06227
G1 X113.663 Y115.661 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.811 Y116.512 E.03701
G1 X112.278 Y116.512
G1 X113.817 Y114.973 E.0669
M73 P89 R1
G1 X113.426 Y114.831
G1 X112.239 Y116.018 E.05159
G1 X112.341 Y115.383
G1 X112.892 Y114.831 E.02396
M204 S10000
G1 X113.597 Y116.014 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.164126
G1 F15000
G1 X113.33 Y116.531 E.00575
G1 X113.221 Y119.612 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.215 Y119.59 E.03337
G1 X112.208 Y119.748 E.00524
G1 X111.765 Y119.748 E.01469
G1 X110.666 Y120.847 E.05157
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X99.682 Y119.748 E.05157
G1 X99.239 Y119.748 E.01469
G1 X99.233 Y119.59 E.00524
G1 X98.227 Y119.612 E.03337
G1 X99.172 Y119.198 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X99.068 Y116.72 E.07622
G1 X98.134 Y116.72 E.02871
G3 X98.275 Y119.198 I-18.263 J2.285 E.07633
G1 X99.112 Y119.198 E.02572
G1 X98.637 Y117.17 F30000
; LINE_WIDTH: 0.554121
G1 F12323.925
G3 X98.709 Y118.695 I-27.201 J2.047 E.06363
G1 X99.176 Y115.749 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.413 Y116.512 E.03316
G1 X97.925 Y116.467
G1 X99.091 Y115.301 E.05066
G1 X98.992 Y114.867
G1 X97.851 Y116.008 E.04959
G1 X97.765 Y115.56
G1 X98.494 Y114.831 E.03167
M204 S10000
G1 X99.132 Y115.705 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0979531
G1 F15000
G1 X99.132 Y115.526 E.0008
G1 X99.101 Y113.692 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.406 Y114.387 E.0302
G1 X97.872 Y114.387
G1 X98.97 Y113.289 E.04769
G1 X98.835 Y112.891
G1 X97.339 Y114.387 E.06499
G1 X96.991 Y114.202
G1 X98.414 Y112.778 E.06186
G1 X97.881 Y112.778
G1 X96.86 Y113.799 E.04437
G1 X96.718 Y113.408
G1 X97.348 Y112.778 E.02737
M204 S10000
G1 X96.729 Y112.759 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.187577
G1 F15000
G1 X96.632 Y113.227 E.00563
; WIPE_START
G1 F24000
G1 X96.729 Y112.759 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.179 J.302 P1  F30000
G1 X99.326 Y122.883 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.747 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03827
G2 X103.567 Y174.82 I6.276 J-14.303 E.02076
G1 X103.423 Y175.314 E.01708
G1 X104.279 Y175.584 E.02975
G1 X104.661 Y175.385 E.0143
G1 X104.746 Y175.116 E.00935
G2 X108.455 Y174.577 I.973 J-6.336 E.12619
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.832 J-6.834 E.18448
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X114.659 Y113.598 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.87 Y114.387 E.03427
G1 X113.337 Y114.387
G1 X114.946 Y112.778 E.06989
G1 X114.412 Y112.778
G1 X112.804 Y114.387 E.06989
G1 X112.271 Y114.387
G1 X113.879 Y112.778 E.06989
G1 X113.346 Y112.778
G1 X112.312 Y113.812 E.04492
M204 S10000
; WIPE_START
G1 F24000
G1 X113.346 Y112.778 E-.55555
G1 X113.879 Y112.778 E-.20264
G1 X113.876 Y112.782 E-.00181
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.202 J-.191 P1  F30000
G1 X103.963 Y175.026 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51091
G1 F13461.825
G1 X104.179 Y175.088 E.00857
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X103.963 Y175.026 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z4.4 I1.204 J.175 P1  F30000
G1 X111.773 Y121.196 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X112.026 Y115.779 E.1202
G1 X113.867 Y115.779 E.06106
G2 X113.569 Y118.791 I15.667 J3.07 E.10055
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.003 E.81736
G1 X97.879 Y118.791 E1.65858
G2 X97.581 Y115.779 I-15.965 J.058 E.10055
G1 X99.421 Y115.779 E.06106
G1 X99.573 Y119.4 E.1202
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X112.116 Y113.741 I19.288 J3.395 E.06568
G1 X114.827 Y113.741 E.08329
G1 X114.808 Y113.793 E.00169
G2 X113.961 Y118.795 I14.363 J5.005 E.15664
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.008 E.79469
G1 X97.486 Y118.795 E1.53636
G2 X96.62 Y113.741 I-15.403 J.038 E.1583
G1 X99.331 Y113.741 E.08329
G3 X99.816 Y115.822 I-18.804 J5.476 E.06568
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.137 J-.434 P1  F30000
G1 X110.301 Y120.306 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519736
G1 F13212.644
G1 X112.069 Y120.318 E.06871
; LINE_WIDTH: 0.519735
G1 X112.379 Y120.343 E.01206
; LINE_WIDTH: 0.42263
G1 F15000
G2 X113.177 Y120.368 I.554 J-4.938 E.02474
G3 X113.211 Y117.89 I37.546 J-.728 E.0767
G1 X112.33 Y117.89 E.02725
G1 X112.258 Y119.611 E.0533
; LINE_WIDTH: 0.419999
G1 X112.209 Y119.687 E.00278
; LINE_WIDTH: 0.454449
G1 X112.16 Y119.764 E.00304
; LINE_WIDTH: 0.518833
M73 P90 R1
G1 F13237.724
G1 X112.111 Y119.84 E.00351
G1 X112.069 Y119.842 E.00161
G1 X109.856 Y119.842 E.08584
G1 X110.259 Y120.263 E.02262
G1 X112.688 Y119.879 F30000
; LINE_WIDTH: 0.643618
G1 F10487.799
G1 X112.711 Y119.334 E.02671
; LINE_WIDTH: 0.577077
G1 F11794.284
G2 X112.75 Y118.391 I-132.354 J-5.953 E.0411
G1 X112.381 Y120.76 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.753 Y120.76 E.05401
G1 X110.666 Y120.847 E.00408
G1 X108.457 Y120.847 E.07326
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X100.781 Y120.847 E.07326
G1 X100.695 Y120.76 E.00408
G1 X99.066 Y120.76 E.05401
G1 X101.117 Y120.318 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519736
G1 F13212.644
G1 X101.592 Y119.842 E.02614
G1 X99.378 Y119.842 E.08601
; LINE_WIDTH: 0.519735
G1 X99.285 Y119.739 E.00539
; LINE_WIDTH: 0.421318
G1 F15000
G1 X99.192 Y119.636 E.00427
G3 X99.117 Y117.89 I463.08 J-20.739 E.05388
G1 X98.242 Y117.89 E.027
G3 X98.271 Y120.368 I-56.835 J1.899 E.07643
; LINE_WIDTH: 0.419999
G1 X98.824 Y120.343 E.01703
; LINE_WIDTH: 0.507358
G1 F13564.787
G1 X99.378 Y120.318 E.02098
G1 X101.057 Y120.318 E.06354
G1 X98.759 Y119.879 F30000
; LINE_WIDTH: 0.64361
G1 F10487.939
G1 X98.736 Y119.334 E.02671
; LINE_WIDTH: 0.596822
G1 F11373.854
G1 X98.713 Y118.789 E.02463
; LINE_WIDTH: 0.550034
G1 F12423.243
G1 X98.7 Y118.387 E.01662
G1 X98.659 Y116.002 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.232 Y116.575 E.02492
G1 X99.255 Y117.132
G1 X98.125 Y116.002 E.04911
G1 X97.892 Y116.302
G1 X99.273 Y117.683 E.06001
G1 X98.74 Y117.683
G1 X97.989 Y116.932 E.03264
M204 S10000
G1 X98.231 Y117.702 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23519
G1 F15000
G1 X98.005 Y117.214 E.00841
; WIPE_START
G1 F24000
G1 X98.231 Y117.702 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.149 J.402 P1  F30000
G1 X99.335 Y114.545 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.739 Y113.949 E.0259
G1 X98.205 Y113.949
G1 X99.493 Y115.236 E.05594
G1 X99.28 Y115.557
G1 X97.672 Y113.949 E.06989
G1 X97.139 Y113.949
G1 X98.747 Y115.557 E.06989
G1 X98.214 Y115.557
G1 X97.05 Y114.393 E.05056
G1 X97.247 Y115.123
G1 X97.681 Y115.557 E.01884
M204 S10000
; WIPE_START
G1 F24000
G1 X97.247 Y115.123 E-.23294
G1 X97.05 Y114.393 E-.28728
G1 X97.497 Y114.84 E-.23979
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.046 J-.622 P1  F30000
G1 X96.956 Y113.93 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.139296
G1 F15000
G1 X97.005 Y114.308 E.003
G1 X97.156 Y113.932 F30000
; LINE_WIDTH: 0.123094
G1 F15000
G1 X97.036 Y114.408 E.00321
; WIPE_START
G1 F24000
G1 X97.156 Y113.932 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.183 J.287 P1  F30000
G1 X99.326 Y122.883 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.747 J-.084 E.05199
G1 X98.645 Y171.248 E.04134
G2 X102.173 Y175.396 I7.203 J-2.552 E.18469
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.809 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.677 J-6.701 E.18469
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X113.057 Y116.002 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.527 Y116.472 E.02044
G1 X113.458 Y116.936
G1 X112.524 Y116.002 E.04061
G1 X112.229 Y116.241
G1 X113.407 Y117.419 E.0512
G1 X113.138 Y117.683
G1 X112.208 Y116.752 E.04042
G1 X112.186 Y117.264
G1 X112.605 Y117.683 E.01818
M204 S10000
; WIPE_START
G1 F24000
G1 X112.186 Y117.264 E-.22486
G1 X112.208 Y116.752 E-.19465
G1 X112.841 Y117.386 E-.34049
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.071 J.577 P1  F30000
G1 X114.335 Y114.614 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.67 Y113.949 E.02891
G1 X113.137 Y113.949
G1 X114.221 Y115.033 E.04713
G1 X114.12 Y115.465
G1 X112.604 Y113.949 E.0659
G1 X112.229 Y114.108
G1 X113.679 Y115.557 E.06298
G1 X113.145 Y115.557
G1 X112.117 Y114.528 E.0447
G1 X112.015 Y114.96
G1 X112.612 Y115.557 E.02593
M204 S10000
; WIPE_START
G1 F24000
G1 X112.015 Y114.96 E-.32071
G1 X112.117 Y114.528 E-.1686
G1 X112.62 Y115.032 E-.27069
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.672 J1.015 P1  F30000
G1 X114.285 Y113.93 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137965
G1 F15000
G1 X114.408 Y114.419 E.00391
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.285 Y113.93 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z4.6 I-1.15 J-.398 P1  F30000
G1 X111.773 Y121.196 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X111.977 Y116.95 E.08135
G1 X113.68 Y116.95 E.05651
G1 X113.623 Y117.491 E.01807
G2 X113.569 Y118.791 I15.463 J1.301 E.04317
G1 X113.569 Y168.789 E1.65853
G3 X97.879 Y168.791 I-7.845 J.001 E.81755
G1 X97.879 Y118.791 E1.65858
G2 X97.767 Y116.95 I-17.075 J.111 E.06123
G1 X99.47 Y116.95 E.05651
G1 X99.573 Y119.4 E.08135
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.09798
G3 X111.814 Y114.912 I10.938 J1.712 E.02853
G1 X113.222 Y114.912 E.04327
G1 X114.468 Y114.912 E.03828
G2 X113.961 Y118.795 I14.982 J3.93 E.12068
G1 X113.961 Y168.795 E1.53634
G3 X97.486 Y168.795 I-8.237 J-.005 E.79484
G1 X97.486 Y118.795 E1.53636
G2 X96.98 Y114.912 I-15.49 J.046 E.12068
G1 X99.634 Y114.912 E.08155
G3 X99.816 Y115.822 I-10.756 J2.622 E.02853
G1 X99.949 Y119.008 E.09798
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.56 Y117.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.12 J.477 P1  F30000
G1 X112.712 Y119.716 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.594572
G1 F11420.243
G1 X112.717 Y119.578 E.00622
M73 P91 R1
G1 X109.686 Y120.456 F30000
; LINE_WIDTH: 0.360223
G1 F15000
G1 X111.977 Y120.456 E.05923
G1 X112.073 Y120.471 E.00253
; LINE_WIDTH: 0.399624
G1 X112.17 Y120.486 E.00285
; LINE_WIDTH: 0.439024
G1 X112.267 Y120.5 E.00316
; LINE_WIDTH: 0.478425
G1 F14465.981
G1 X112.364 Y120.515 E.00347
; LINE_WIDTH: 0.517825
G1 F13265.811
G1 X112.401 Y120.645 E.00523
; LINE_WIDTH: 0.478364
G1 F14467.991
G1 X112.438 Y120.775 E.0048
; LINE_WIDTH: 0.438903
G1 F15000
G1 X112.475 Y120.905 E.00436
; LINE_WIDTH: 0.368766
G3 X112.514 Y121.192 I-.502 J.214 E.00778
G1 X112.83 Y121.192 E.00837
; LINE_WIDTH: 0.359981
G1 X112.81 Y120.976 E.00559
; LINE_WIDTH: 0.399442
G1 X112.79 Y120.761 E.00628
; LINE_WIDTH: 0.438903
G1 X112.77 Y120.546 E.00698
; LINE_WIDTH: 0.478364
G1 F14467.991
G1 X112.751 Y120.33 E.00767
; LINE_WIDTH: 0.517825
G1 F13265.811
G1 X112.732 Y120.023 E.01191
; LINE_WIDTH: 0.580359
G1 F11722.265
G1 X112.712 Y119.716 E.01348
G1 X112.39 Y120.128 E.02291
; LINE_WIDTH: 0.517825
G1 F13265.811
G1 X112.286 Y120.131 E.004
; LINE_WIDTH: 0.478425
G1 F14465.981
G1 X112.183 Y120.133 E.00367
; LINE_WIDTH: 0.439024
G1 F15000
G1 X112.08 Y120.136 E.00333
; LINE_WIDTH: 0.361546
G1 X109.381 Y120.139 E.07006
G1 X109.644 Y120.413 E.00986
G1 X109.538 Y120.803 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X111.977 Y120.803 E.07494
G1 X112.095 Y120.846 E.00387
G1 X112.166 Y121.039 E.00631
G1 X112.171 Y121.539 E.01537
G1 X113.177 Y121.539 E.0309
G1 X113.177 Y119.06 E.07615
G1 X112.281 Y119.06 E.02753
G1 X112.258 Y119.611 E.01694
G1 X112.168 Y119.764 E.00546
G1 X111.977 Y119.792 E.00593
G1 X108.567 Y119.792 E.10475
G1 X109.496 Y120.76 E.04123
G1 X106.829 Y120.847 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.457 Y120.847 E.05401
G1 X107.358 Y119.748 E.05157
G1 X104.089 Y119.748 E.10843
G1 X102.99 Y120.847 E.05157
G1 X104.618 Y120.847 E.05401
; WIPE_START
G1 F24000
G1 X102.99 Y120.847 E-.61876
G1 X103.253 Y120.584 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.615 J-1.05 P1  F30000
G1 X99.326 Y122.883 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X99.326 Y124.511 E.05401
G1 X98.227 Y125.61 E.05157
G1 X98.227 Y125.969 E.01188
G1 X99.326 Y127.068 E.05157
G1 X99.326 Y132.187 E.16981
G1 X98.227 Y133.286 E.05157
G1 X98.227 Y133.645 E.01188
G1 X99.326 Y134.744 E.05157
G1 X99.326 Y139.863 E.16981
G1 X98.227 Y140.962 E.05157
G1 X98.227 Y141.321 E.01188
G1 X99.326 Y142.42 E.05157
G1 X99.326 Y147.539 E.16981
G1 X98.227 Y148.638 E.05157
G1 X98.227 Y148.997 E.01188
G1 X99.326 Y150.096 E.05157
G1 X99.326 Y155.215 E.16981
G1 X98.227 Y156.314 E.05157
G1 X98.227 Y156.672 E.01188
G1 X99.326 Y157.772 E.05157
G1 X99.326 Y162.891 E.16981
G1 X98.227 Y163.99 E.05157
G1 X98.227 Y164.348 E.01188
G1 X99.326 Y165.448 E.05157
G1 X99.326 Y168.816 E.11172
G2 X99.527 Y170.366 I6.751 J-.084 E.05199
G1 X98.644 Y171.249 E.04141
G2 X102.173 Y175.396 I7.216 J-2.566 E.18467
G1 X102.989 Y174.58 E.03826
G2 X108.455 Y174.577 I2.729 J-5.81 E.1873
G1 X109.274 Y175.396 E.03842
G2 X112.802 Y171.248 I-3.832 J-6.834 E.18448
G1 X111.923 Y170.368 E.04125
G2 X112.121 Y168.812 I-6.803 J-1.659 E.05216
G1 X112.121 Y165.448 E.11159
G1 X113.221 Y164.348 E.05157
G1 X113.221 Y163.99 E.01188
G1 X112.121 Y162.891 E.05157
G1 X112.121 Y157.772 E.16981
G1 X113.221 Y156.672 E.05157
G1 X113.221 Y156.314 E.01188
G1 X112.121 Y155.215 E.05157
G1 X112.121 Y150.096 E.16981
G1 X113.221 Y148.997 E.05157
G1 X113.221 Y148.638 E.01188
G1 X112.121 Y147.539 E.05157
G1 X112.121 Y142.42 E.16981
G1 X113.221 Y141.321 E.05157
G1 X113.221 Y140.962 E.01188
G1 X112.121 Y139.863 E.05157
G1 X112.121 Y134.744 E.16981
G1 X113.221 Y133.645 E.05157
G1 X113.221 Y133.286 E.01188
G1 X112.121 Y132.187 E.05157
G1 X112.121 Y127.068 E.16981
G1 X113.221 Y125.969 E.05157
G1 X113.221 Y125.61 E.01188
G1 X112.121 Y124.511 E.05157
G1 X112.121 Y122.883 E.05401
G1 X113.363 Y118.094 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.604 Y118.853 E.03298
G1 X112.122 Y118.802
G1 X113.399 Y117.525 E.05548
G1 X113.218 Y117.172
G1 X112.145 Y118.245 E.04663
G1 X112.169 Y117.688
G1 X112.685 Y117.172 E.02244
M204 S10000
G1 X113.109 Y118.614 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.211789
G1 F15000
G1 X113.364 Y118.872 E.00499
; WIPE_START
G1 F24000
G1 X113.109 Y118.614 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.154 J.386 P1  F30000
G1 X114.049 Y115.808 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.13 Y116.727 E.03996
G1 X112.596 Y116.727
G1 X114.2 Y115.123 E.0697
G1 X113.671 Y115.119
G1 X112.063 Y116.727 E.06989
G1 X111.813 Y116.444
G1 X113.138 Y115.119 E.05757
G1 X112.605 Y115.119
G1 X111.837 Y115.887 E.03338
M204 S10000
G1 X113.985 Y116.161 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.111969
G1 F15000
G2 X113.682 Y116.746 I28.691 J15.231 E.0037
; WIPE_START
G1 F24000
G1 X113.985 Y116.161 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.195 J.233 P1  F30000
G1 X114.114 Y115.498 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.129406
G1 F15000
G1 X113.982 Y115.741 E.00194
; WIPE_START
G1 F24000
G1 X114.114 Y115.498 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.1 J-1.213 P1  F30000
G1 X99.265 Y116.727 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.631 Y116.361 E.0159
G1 X99.609 Y115.849
G1 X98.731 Y116.727 E.03814
G1 X98.198 Y116.727
G1 X99.524 Y115.401 E.05762
G1 X99.273 Y115.119
G1 X97.665 Y116.727 E.06989
G1 X97.498 Y116.361
G1 X98.74 Y115.119 E.05397
G1 X98.207 Y115.119
G1 X97.417 Y115.908 E.0343
G1 X97.327 Y115.465
G1 X97.673 Y115.119 E.01504
M204 S10000
; WIPE_START
G1 F24000
G1 X97.327 Y115.465 E-.186
G1 X97.417 Y115.908 E-.17185
G1 X98.166 Y115.16 E-.40215
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.203 J.187 P1  F30000
G1 X98.739 Y118.853 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X99.304 Y118.288 E.02456
G1 X99.282 Y117.776
G1 X98.205 Y118.853 E.0468
G1 X98.093 Y118.432
G1 X99.261 Y117.264 E.05074
G1 X98.82 Y117.172
G1 X98.074 Y117.918 E.03243
M204 S10000
G1 X98.237 Y117.153 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.237528
G1 F15000
G1 X98.044 Y117.681 E.00891
G1 X98.147 Y117.992 F30000
; LINE_WIDTH: 0.0895258
G1 F15000
G1 X98.071 Y118.188 E.0008
G1 X98.728 Y119.518 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580588
G1 F11717.268
G1 X98.733 Y119.656 E.00607
G1 X101.762 Y120.456 F30000
; LINE_WIDTH: 0.360223
G1 F15000
G1 X102.066 Y120.139 E.01137
G1 X99.471 Y120.139 E.0671
G1 X99.368 Y120.136 E.00267
; LINE_WIDTH: 0.399623
G1 X99.264 Y120.133 E.003
; LINE_WIDTH: 0.439023
G1 X99.161 Y120.131 E.00333
; LINE_WIDTH: 0.478423
G1 F14466.031
G1 X99.058 Y120.128 E.00367
; LINE_WIDTH: 0.517823
G1 F13265.867
G1 X98.896 Y119.922 E.01012
; LINE_WIDTH: 0.583123
G1 F11662.294
G1 X98.735 Y119.716 E.01151
G1 X98.697 Y120.33 E.0271
; LINE_WIDTH: 0.517823
G1 F13265.867
G1 X98.677 Y120.496 E.00645
; LINE_WIDTH: 0.478423
G1 F14466.031
G1 X98.657 Y120.661 E.00591
; LINE_WIDTH: 0.439023
G1 F15000
G1 X98.637 Y120.827 E.00538
; LINE_WIDTH: 0.367658
G2 X98.618 Y121.191 I1.522 J.265 E.00969
G1 X98.935 Y121.191 E.0084
G1 X98.935 Y120.992 E.00528
; LINE_WIDTH: 0.360223
G1 X98.972 Y120.873 E.00323
; LINE_WIDTH: 0.399623
G1 X99.009 Y120.753 E.00363
; LINE_WIDTH: 0.439023
G1 X99.046 Y120.634 E.00403
; LINE_WIDTH: 0.478423
G1 F14466.031
G1 X99.084 Y120.515 E.00443
; LINE_WIDTH: 0.517823
G1 F13265.867
G1 X99.16 Y120.501 E.00299
; LINE_WIDTH: 0.479475
G1 F14431.189
G1 X99.236 Y120.488 E.00275
; LINE_WIDTH: 0.441126
G1 F15000
G1 X99.312 Y120.474 E.00251
; LINE_WIDTH: 0.361746
G3 X99.471 Y120.456 I.15 J.624 E.00416
G1 X101.702 Y120.456 E.05796
G1 X101.91 Y120.803 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X102.88 Y119.792 E.04307
G1 X99.378 Y119.792 E.1076
G1 X99.28 Y119.764 E.00314
G1 X99.19 Y119.611 E.00546
G1 X99.167 Y119.06 E.01694
M73 P92 R1
G1 X98.271 Y119.06 E.02753
G1 X98.271 Y121.539 E.07615
G1 X99.282 Y121.539 E.03109
G1 X99.282 Y120.992 E.0168
G1 X99.391 Y120.821 E.00623
G3 X99.471 Y120.803 I.08 J.171 E.00252
G1 X101.85 Y120.803 E.0731
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X99.85 Y120.803 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z4.8 I-.04 J1.216 P1  F30000
G1 X111.773 Y121.196 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.207 J.156 P1  F30000
G1 X111.866 Y119.4 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.874 Y119.4 E.00026
G1 X111.928 Y118.12 E.04249
G1 X113.583 Y118.12 E.0549
G1 X113.569 Y118.791 E.02228
G1 X113.569 Y168.791 E1.65858
G3 X97.879 Y168.791 I-7.845 J-.001 E.8175
G1 X97.879 Y118.791 E1.65858
G1 X97.864 Y118.12 E.02228
G1 X99.52 Y118.12 E.0549
G1 X99.549 Y118.812 E.02297
G1 X99.573 Y119.4 E.01952
G1 X111.806 Y119.4 E.40579
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.621 Y116.082 E.08998
G1 X114.208 Y116.082 E.07949
G1 X114.174 Y116.26 E.00556
G2 X113.961 Y118.795 I14.991 J2.537 E.07829
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79482
G1 X97.486 Y118.795 E1.53636
G2 X97.239 Y116.082 I-15.664 J.058 E.08383
G1 X99.826 Y116.082 E.07949
G1 X99.949 Y119.008 E.08998
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.563 Y117.012 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.915 J.803 P1  F30000
G1 X112.731 Y118.342 Z5
G1 Z4.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X113.346 Y118.958 E.02674
G1 X113.346 Y119.491
M73 P92 R0
G1 X112.198 Y118.342 E.04991
G1 X112.122 Y118.8
G1 X113.346 Y120.023 E.05317
G1 X112.812 Y120.023
G1 X112.1 Y119.311 E.03093
G1 X111.878 Y119.622
G1 X112.279 Y120.023 E.01743
G1 X111.746 Y120.023
G1 X111.345 Y119.622 E.01743
G1 X110.811 Y119.622
G1 X111.212 Y120.023 E.01743
M204 S10000
G1 X110.431 Y120.28 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517858
G1 F13264.888
G1 X110.18 Y120.036 E.01354
; LINE_WIDTH: 0.421842
G1 F15000
G1 X109.93 Y119.792 E.0108
G1 X101.518 Y119.792 E.25973
G1 X101.154 Y120.174 E.01629
; LINE_WIDTH: 0.424128
G1 X101.085 Y120.227 E.00269
; LINE_WIDTH: 0.515369
G1 F13334.774
G1 X101.017 Y120.28 E.00334
G1 X99.471 Y120.28 E.05951
; LINE_WIDTH: 0.517858
G1 F13264.888
G1 X99.134 Y120.255 E.01308
; LINE_WIDTH: 0.420135
G1 F15000
G2 X98.271 Y120.231 I-.6 J5.935 E.02656
G1 X98.271 Y168.787 E1.49253
G1 X98.329 Y169.701 E.02817
G2 X99.244 Y172.475 I7.671 J-.993 E.09034
G2 X100.183 Y173.778 I9.051 J-5.535 E.04941
G2 X103.117 Y175.775 I5.658 J-5.158 E.11007
G2 X104.392 Y176.115 I2.161 J-5.548 E.04065
G2 X106.627 Y176.192 I1.388 J-7.746 E.06898
G2 X109.685 Y175.092 I-.934 J-7.397 E.10071
G1 X110.234 Y174.722 E.02036
G1 X110.941 Y174.097 E.02899
G2 X113.132 Y169.465 I-5.101 J-5.247 E.16093
G1 X113.177 Y168.783 E.02102
G1 X113.177 Y120.231 E1.4924
G1 X112.651 Y120.231 E.01616
; LINE_WIDTH: 0.419999
G1 X112.314 Y120.255 E.01039
; LINE_WIDTH: 0.508788
G1 F13523.157
G1 X111.977 Y120.28 E.01283
G1 X110.491 Y120.28 E.0564
G1 X109.714 Y120.456 F30000
; LINE_WIDTH: 0.360364
G1 F15000
G1 X110.146 Y120.456 E.01118
G1 X110.044 Y120.413 E.00286
G1 X109.781 Y120.139 E.00982
G1 X101.666 Y120.139 E.20993
G1 X101.351 Y120.449 E.01143
G1 X109.654 Y120.456 E.21478
G1 X101.734 Y120.803 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X110.026 Y120.803 E.25479
G1 X110.228 Y120.779 E.00627
; LINE_WIDTH: 0.512152
G1 F13426.197
G1 X110.431 Y120.755 E.0078
G1 X111.977 Y120.755 E.0591
; LINE_WIDTH: 0.517858
G1 F13264.888
G1 X112.066 Y120.842 E.00483
; LINE_WIDTH: 0.420052
G1 F15000
G1 X112.155 Y120.93 E.00384
G1 X112.165 Y120.992 E.00194
G1 X112.165 Y168.809 E1.46948
G3 X109.42 Y174.066 I-6.464 J-.03 E.18937
G1 X108.705 Y174.508 E.0258
G3 X104.889 Y175.179 I-2.985 J-5.781 E.12092
G1 X104.064 Y175.022 E.0258
G3 X102.275 Y174.238 I1.894 J-6.759 E.06023
G3 X100.619 Y172.708 I3.308 J-5.242 E.06969
G1 X100.149 Y172.025 E.02546
G1 X99.88 Y171.506 E.01798
G1 X99.585 Y170.748 E.02499
G3 X99.298 Y169.057 I6.233 J-1.926 E.05286
G1 X99.282 Y168.781 E.00849
G1 X99.282 Y120.992 E1.46863
; LINE_WIDTH: 0.419999
G1 X99.331 Y120.913 E.00285
; LINE_WIDTH: 0.453819
G1 X99.38 Y120.835 E.0031
; LINE_WIDTH: 0.516281
G1 F13309.101
G1 X99.429 Y120.756 E.00357
G1 X101.017 Y120.755 E.06122
; LINE_WIDTH: 0.517858
G1 F13264.888
G1 X101.345 Y120.777 E.01275
; LINE_WIDTH: 0.468929
G1 F14788.437
G1 X101.674 Y120.799 E.01143
G1 X98.935 Y120.992 F30000
; LINE_WIDTH: 0.360105
G1 F15000
G1 X98.956 Y120.812 E.00468
G1 X99.22 Y120.588 E.00895
G1 X98.628 Y120.588 E.0153
G1 X98.618 Y168.783 E1.24568
G1 X98.674 Y169.671 E.023
G2 X99.552 Y172.315 I7.26 J-.942 E.07245
G2 X100.897 Y174.01 I7.097 J-4.252 E.05608
G2 X102.431 Y175.09 I5.235 J-5.806 E.04862
G1 X103.256 Y175.458 E.02334
G2 X108.408 Y175.375 I2.466 J-6.848 E.13612
G2 X110.024 Y174.448 I-3.372 J-7.746 E.04825
G1 X110.704 Y173.849 E.02341
G2 X112.825 Y168.849 I-5.031 J-5.085 E.144
G1 X112.83 Y120.992 E1.23695
G3 X112.82 Y120.588 I4.761 J-.32 E.01045
G1 X112.176 Y120.588 E.01664
G1 X112.492 Y120.812 E.01001
G1 X112.512 Y120.992 E.00468
G1 X112.512 Y168.766 E1.2348
G3 X109.619 Y174.352 I-6.835 J.002 E.16895
G1 X108.879 Y174.807 E.02248
G3 X104.844 Y175.524 I-3.166 J-6.104 E.10756
G1 X103.989 Y175.36 E.02248
G3 X102.108 Y174.542 I2.038 J-7.259 E.05318
G3 X100.346 Y172.927 I3.498 J-5.584 E.06213
G1 X99.857 Y172.211 E.02239
G1 X99.571 Y171.665 E.01593
G1 X99.262 Y170.873 E.02198
G3 X98.949 Y169.08 I6.727 J-2.097 E.04718
G1 X98.935 Y168.781 E.00773
G1 X98.935 Y121.052 E1.23363
G1 X101.044 Y119.987 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.679 Y119.622 E.01584
G1 X100.146 Y119.622
G1 X100.547 Y120.023 E.01743
G1 X100.014 Y120.023
G1 X99.613 Y119.622 E.01743
G1 X99.326 Y118.802
G1 X98.866 Y118.342 E.01996
G1 X98.333 Y118.342
G1 X99.349 Y119.358 E.04415
G1 X99.481 Y120.023
G1 X98.098 Y118.641 E.06009
G1 X98.101 Y119.177
G1 X98.947 Y120.023 E.03678
M204 S10000
G1 X99.725 Y120.001 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101871
G1 F15000
G1 X99.594 Y120.022 E.00064
; WIPE_START
G1 F24000
G1 X99.725 Y120.001 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J-.028 P1  F30000
G1 X99.657 Y117.001 Z5
G1 Z4.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.946 Y116.289 E.03091
G1 X98.413 Y116.289
G1 X99.681 Y117.557 E.0551
G1 X99.488 Y117.898
G1 X97.88 Y116.289 E.06989
G1 X97.512 Y116.455
G1 X98.955 Y117.898 E.0627
G1 X98.421 Y117.898
G1 X97.594 Y117.07 E.03596
M204 S10000
G1 X97.87 Y117.916 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159691
G1 F15000
G1 X97.608 Y117.351 E.00593
G1 X97.663 Y117.001 F30000
; LINE_WIDTH: 0.125246
G1 F15000
G1 X97.559 Y116.789 E.00159
; WIPE_START
G1 F24000
G1 X97.663 Y117.001 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.055 J1.216 P1  F30000
G1 X113.344 Y116.289 Z5
G1 Z4.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.881 Y116.826 E.02331
G1 X113.829 Y117.307
G1 X112.811 Y116.289 E.04421
G1 X112.278 Y116.289
G1 X113.789 Y117.8 E.06567
G1 X113.353 Y117.898
G1 X111.817 Y116.361 E.06675
G1 X111.795 Y116.873
G1 X112.82 Y117.898 E.04451
G1 X112.286 Y117.898
G1 X111.774 Y117.385 E.02227
M204 S10000
G1 X113.754 Y117.381 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973647
G1 F15000
G1 X113.822 Y117.566 E.00087
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.754 Y117.381 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z5 I-1.08 J-.561 P1  F30000
G1 X111.773 Y121.196 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.773 Y168.804 E1.57927
G3 X99.674 Y168.804 I-6.049 J-.012 E.6296
M73 P93 R0
G1 X99.674 Y121.196 E1.57927
G1 X111.713 Y121.196 E.39934
G1 X111.381 Y121.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.207 J.158 P1  F30000
G1 X111.874 Y119.392 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.879 Y119.29 E.00337
G1 X113.569 Y119.29 E.05606
G1 X113.569 Y168.791 E1.64203
G3 X97.879 Y168.791 I-7.845 J-.002 E.81745
G1 X97.879 Y119.29 E1.64203
G1 X99.569 Y119.29 E.05606
G1 X99.573 Y119.4 E.00363
G1 X111.822 Y119.4 E.40632
G1 X111.498 Y119.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.572 Y117.252 E.05399
G1 X114.043 Y117.252 E.07593
G2 X113.961 Y118.795 I16.272 J1.638 E.0475
G1 X113.961 Y168.795 E1.53636
G3 X97.486 Y168.795 I-8.237 J-.006 E.79478
G1 X97.486 Y118.795 E1.53636
G2 X97.404 Y117.252 I-16.352 J.095 E.0475
G1 X99.876 Y117.252 E.07593
G1 X99.949 Y119.008 E.05399
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.572 Y117.252 E-.66901
G1 X111.811 Y117.252 E-.09099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.542 J1.09 P1  F30000
G1 X113.765 Y118.225 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X112.922 Y119.068 E.03665
G1 X112.389 Y119.068
G1 X113.798 Y117.659 E.06124
G1 X113.464 Y117.46
G1 X111.856 Y119.068 E.06989
G1 X111.72 Y118.67
G1 X112.931 Y117.46 E.05261
G1 X112.397 Y117.46
G1 X111.743 Y118.114 E.02842
M204 S10000
; WIPE_START
G1 F24000
G1 X112.397 Y117.46 E-.35151
G1 X112.931 Y117.46 E-.20264
G1 X112.548 Y117.843 E-.20585
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.561 J1.08 P1  F30000
G1 X113.776 Y118.481 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.296906
G1 F15000
G1 X113.521 Y119.087 E.0136
; WIPE_START
G1 F24000
G1 X113.776 Y118.481 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.2 J-.204 P1  F30000
G1 X113.698 Y118.025 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.121654
G1 F15000
G1 X113.782 Y118.241 E.00149
G1 X112.929 Y121.194 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.346 Y120.777 E.01812
G1 X113.346 Y120.243
G1 X112.396 Y121.194 E.04129
G1 X111.995 Y121.061
G1 X113.346 Y119.71 E.05871
G1 X113.011 Y119.513
G1 X111.55 Y120.973 E.06347
G1 X111.017 Y120.973
G1 X112.477 Y119.513 E.06347
G1 X111.835 Y119.622
G1 X110.484 Y120.973 E.05871
G1 X110.067 Y120.857
G1 X111.301 Y119.622 E.05365
G1 X110.768 Y119.622
G1 X109.806 Y120.584 E.04182
G1 X109.545 Y120.312
G1 X110.235 Y119.622 E.02999
G1 X109.702 Y119.622
G1 X109.284 Y120.04 E.01816
M204 S10000
G1 X109.728 Y120.803 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X108.758 Y119.792 E.04307
G1 X102.689 Y119.792 E.18649
G1 X101.719 Y120.803 E.04307
G1 X109.668 Y120.803 E.24426
G1 X108.542 Y120.456 F30000
; LINE_WIDTH: 0.360222
G1 F15000
G1 X108.914 Y120.456 E.00962
G1 X108.61 Y120.139 E.01137
G1 X102.837 Y120.139 E.14926
G1 X102.533 Y120.456 E.01137
G1 X108.482 Y120.456 E.15383
G1 X100.885 Y120.973 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.236 Y119.622 E.05871
G1 X101.702 Y119.622
G1 X100.351 Y120.973 E.05871
G1 X99.818 Y120.973
G1 X101.169 Y119.622 E.05871
G1 X100.636 Y119.622
G1 X99.064 Y121.194 E.06829
G1 X98.531 Y121.194
G1 X100.103 Y119.622 E.06829
G1 X99.569 Y119.622
G1 X98.101 Y121.091 E.06381
G1 X98.101 Y120.557
G1 X99.146 Y119.513 E.04539
G1 X98.612 Y119.513
G1 X98.101 Y120.024 E.02222
M204 S10000
G1 X102.415 Y119.603 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.207619
G1 F15000
G1 X102.416 Y119.709 E.00141
; LINE_WIDTH: 0.175496
G1 X102.404 Y119.744 E.0004
; LINE_WIDTH: 0.114477
G1 X102.393 Y119.779 E.00022
G1 X101.205 Y120.992 E.0099
G1 X99.282 Y121.401 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X98.271 Y121.401 E.03109
G1 X98.271 Y168.787 E1.45603
G1 X98.329 Y169.701 E.02816
G2 X98.94 Y171.872 I7.897 J-1.052 E.06952
G2 X99.609 Y173.032 I5.414 J-2.35 E.04124
G1 X100.184 Y173.779 E.02898
G2 X101.695 Y175.066 I6.133 J-5.67 E.06112
G1 X102.517 Y175.521 E.02887
G2 X104.392 Y176.115 I3.157 J-6.705 E.06061
G2 X106.627 Y176.193 I1.389 J-7.769 E.06895
G2 X109.124 Y175.413 I-.846 J-7.095 E.08082
G1 X109.939 Y174.94 E.02898
G2 X111.408 Y173.607 I-5.225 J-7.23 E.06107
G2 X113.132 Y169.465 I-5.761 J-4.828 E.13998
G1 X113.177 Y168.783 E.02101
G1 X113.177 Y121.401 E1.4559
G1 X112.165 Y121.401 E.03109
G1 X112.165 Y168.809 E1.4567
G3 X108.934 Y174.369 I-6.414 J-.008 E.207
G1 X108.196 Y174.746 E.02544
G3 X104.889 Y175.179 I-2.468 J-5.998 E.10365
G1 X104.064 Y175.022 E.0258
G3 X102.495 Y174.371 I1.955 J-6.935 E.05234
G1 X101.814 Y173.917 E.02516
G3 X100.619 Y172.708 I3.975 J-5.123 E.05235
G1 X100.149 Y172.026 E.02547
G1 X99.888 Y171.525 E.01734
G1 X99.585 Y170.748 E.02563
G3 X99.298 Y169.057 I6.232 J-1.926 E.05287
G1 X99.282 Y168.781 E.00849
G1 X99.282 Y121.461 E1.45402
G1 X98.935 Y121.748 F30000
; LINE_WIDTH: 0.359864
G1 F15000
G1 X98.618 Y121.748 E.00819
G1 X98.618 Y168.783 E1.21476
G1 X98.674 Y169.671 E.02298
G2 X99.263 Y171.746 I7.548 J-1.02 E.0559
G2 X100.45 Y173.556 I7.326 J-3.511 E.05607
G2 X101.895 Y174.78 I5.702 J-5.273 E.04903
G1 X102.684 Y175.217 E.02329
G2 X105.695 Y175.897 I3.12 J-6.807 E.08031
G1 X106.597 Y175.847 E.02331
G2 X108.972 Y175.105 I-.825 J-6.81 E.06462
G1 X109.753 Y174.647 E.02338
G2 X112.83 Y168.766 I-4.096 J-5.888 E.17822
G1 X112.83 Y121.748 E1.21433
G1 X112.512 Y121.748 E.00819
G1 X112.512 Y168.766 E1.21433
G3 X109.115 Y174.668 I-6.792 J.02 E.18423
G1 X108.343 Y175.06 E.02237
G3 X104.844 Y175.524 I-2.636 J-6.438 E.09216
G1 X103.989 Y175.36 E.02247
G3 X102.335 Y174.676 I1.963 J-7.084 E.04634
G1 X101.621 Y174.205 E.0221
G3 X100.347 Y172.927 I4.304 J-5.567 E.04673
G1 X99.857 Y172.212 E.02239
G1 X99.581 Y171.685 E.01535
G1 X99.262 Y170.874 E.02251
G3 X98.949 Y169.08 I6.723 J-2.097 E.04717
G1 X98.935 Y168.781 E.00773
G1 X98.935 Y121.808 E1.21317
G1 X99.716 Y118.408 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.057 Y119.068 E.02865
G1 X98.524 Y119.068
G1 X99.695 Y117.897 E.05089
G1 X99.599 Y117.46
G1 X97.991 Y119.068 E.06989
M73 P94 R0
G1 X97.694 Y118.831
G1 X99.066 Y117.46 E.05961
G1 X98.532 Y117.46
G1 X97.684 Y118.308 E.03688
G1 X97.658 Y117.8
G1 X97.999 Y117.46 E.01481
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X97.658 Y117.8 E-.18313
G1 X97.684 Y118.308 E-.19323
G1 X98.398 Y117.594 E-.38364
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/25
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z5.2 I-.358 J1.163 P1  F30000
G1 X111.381 Y121.588 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F12000
G1 X111.381 Y168.8 E1.4507
G3 X100.066 Y168.8 I-5.657 J-.008 E.54564
G1 X100.066 Y121.588 E1.4507
G1 X111.321 Y121.588 E.34582
M204 S10000
; WIPE_START
G1 F24000
G1 X111.323 Y123.588 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.216 J.046 P1  F30000
G1 X111.498 Y119.008 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X111.523 Y118.422 E.018
G1 X113.969 Y118.422 E.07516
G1 X113.961 Y168.795 E1.54782
G3 X97.486 Y168.795 I-8.237 J-.006 E.7948
G1 X97.479 Y118.422 E1.54782
G1 X99.925 Y118.422 E.07516
G1 X99.949 Y119.008 E.018
G1 X111.438 Y119.008 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X111.523 Y118.422 E-.22467
G1 X112.931 Y118.422 E-.53533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.122 J.472 P1  F30000
G1 X113.019 Y118.63 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X113.761 Y119.372 E.03227
G1 X113.761 Y119.906
G1 X112.485 Y118.63 E.05543
G1 X111.952 Y118.63
G1 X113.761 Y120.439 E.0786
G1 X113.761 Y120.972
G1 X111.709 Y118.92 E.08915
G1 X111.471 Y119.215
G1 X113.761 Y121.505 E.09952
G1 X113.761 Y122.038
G1 X110.937 Y119.215 E.12269
G1 X110.404 Y119.215
G1 X113.761 Y122.571 E.14585
G1 X113.761 Y123.105
G1 X109.871 Y119.215 E.16902
G1 X109.338 Y119.215
G1 X111.503 Y121.38 E.09409
G1 X110.97 Y121.38
G1 X108.804 Y119.215 E.09409
G1 X108.271 Y119.215
G1 X110.436 Y121.38 E.09409
G1 X109.903 Y121.38
G1 X107.738 Y119.215 E.09409
G1 X107.205 Y119.215
G1 X109.37 Y121.38 E.09409
G1 X108.837 Y121.38
G1 X106.671 Y119.215 E.09409
G1 X106.138 Y119.215
G1 X108.303 Y121.38 E.09409
G1 X107.77 Y121.38
G1 X105.605 Y119.215 E.09409
G1 X105.072 Y119.215
G1 X107.237 Y121.38 E.09409
G1 X106.703 Y121.38
G1 X104.538 Y119.215 E.09409
G1 X104.005 Y119.215
G1 X106.17 Y121.38 E.09409
G1 X105.637 Y121.38
G1 X103.472 Y119.215 E.09409
G1 X102.938 Y119.215
G1 X105.104 Y121.38 E.09409
G1 X104.57 Y121.38
G1 X102.405 Y119.215 E.09409
G1 X101.872 Y119.215
G1 X104.037 Y121.38 E.09409
G1 X103.504 Y121.38
G1 X101.339 Y119.215 E.09409
G1 X100.805 Y119.215
G1 X102.971 Y121.38 E.09409
G1 X102.437 Y121.38
G1 X100.272 Y119.215 E.09409
M204 S10000
; WIPE_START
G1 F24000
G1 X101.686 Y120.629 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.754 J-.955 P1  F30000
G1 X99.154 Y118.63 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X101.904 Y121.38 E.11952
G1 X101.371 Y121.38
G1 X98.62 Y118.63 E.11952
G1 X98.087 Y118.63
G1 X100.837 Y121.38 E.11952
G1 X100.304 Y121.38
G1 X97.686 Y118.762 E.11377
G1 X97.686 Y119.295
G1 X99.859 Y121.468 E.09442
G1 X99.859 Y122.002
G1 X97.686 Y119.829 E.09442
G1 X97.686 Y120.362
G1 X99.859 Y122.535 E.09442
G1 X99.859 Y123.068
G1 X97.686 Y120.895 E.09441
G1 X97.686 Y121.429
G1 X99.859 Y123.601 E.09441
G1 X99.859 Y124.135
G1 X97.687 Y121.962 E.0944
G1 X97.687 Y122.496
G1 X99.859 Y124.668 E.0944
G1 X99.859 Y125.201
G1 X97.687 Y123.029 E.0944
G1 X97.687 Y123.562
G1 X99.859 Y125.734 E.09439
G1 X99.859 Y126.268
G1 X97.687 Y124.096 E.09439
G1 X97.687 Y124.629
G1 X99.859 Y126.801 E.09439
G1 X99.859 Y127.334
G1 X97.687 Y125.162 E.09438
G1 X97.687 Y125.696
G1 X99.859 Y127.868 E.09438
G1 X99.859 Y128.401
G1 X97.687 Y126.229 E.09438
G1 X97.687 Y126.762
G1 X99.859 Y128.934 E.09437
G1 X99.859 Y129.467
G1 X97.687 Y127.296 E.09437
G1 X97.687 Y127.829
G1 X99.859 Y130.001 E.09437
G1 X99.859 Y130.534
G1 X97.688 Y128.362 E.09436
G1 X97.688 Y128.896
G1 X99.859 Y131.067 E.09436
G1 X99.859 Y131.6
G1 X97.688 Y129.429 E.09435
G1 X97.688 Y129.962
G1 X99.859 Y132.134 E.09435
G1 X99.859 Y132.667
G1 X97.688 Y130.496 E.09435
G1 X97.688 Y131.029
G1 X99.859 Y133.2 E.09434
G1 X99.859 Y133.734
G1 X97.688 Y131.563 E.09434
G1 X97.688 Y132.096
G1 X99.859 Y134.267 E.09434
G1 X99.859 Y134.8
G1 X97.688 Y132.629 E.09433
G1 X97.688 Y133.163
G1 X99.859 Y135.333 E.09433
G1 X99.859 Y135.867
G1 X97.688 Y133.696 E.09433
G1 X97.688 Y134.229
G1 X99.859 Y136.4 E.09432
M73 P95 R0
G1 X99.859 Y136.933
G1 X97.689 Y134.763 E.09432
G1 X97.689 Y135.296
G1 X99.859 Y137.466 E.09431
G1 X99.859 Y138
G1 X97.689 Y135.829 E.09431
G1 X97.689 Y136.363
G1 X99.859 Y138.533 E.09431
G1 X99.859 Y139.066
G1 X97.689 Y136.896 E.0943
G1 X97.689 Y137.429
G1 X99.859 Y139.6 E.0943
G1 X99.859 Y140.133
G1 X97.689 Y137.963 E.0943
G1 X97.689 Y138.496
G1 X99.859 Y140.666 E.09429
G1 X99.859 Y141.199
G1 X97.689 Y139.029 E.09429
G1 X97.689 Y139.563
G1 X99.859 Y141.733 E.09429
G1 X99.859 Y142.266
G1 X97.689 Y140.096 E.09428
G1 X97.689 Y140.63
G1 X99.859 Y142.799 E.09428
G1 X99.859 Y143.332
G1 X97.69 Y141.163 E.09428
G1 X97.69 Y141.696
G1 X99.859 Y143.866 E.09427
G1 X99.859 Y144.399
G1 X97.69 Y142.23 E.09427
G1 X97.69 Y142.763
G1 X99.859 Y144.932 E.09426
G1 X99.859 Y145.465
G1 X97.69 Y143.296 E.09426
G1 X97.69 Y143.83
G1 X99.859 Y145.999 E.09426
G1 X99.859 Y146.532
G1 X97.69 Y144.363 E.09425
G1 X97.69 Y144.896
G1 X99.859 Y147.065 E.09425
G1 X99.859 Y147.599
G1 X97.69 Y145.43 E.09425
G1 X97.69 Y145.963
G1 X99.859 Y148.132 E.09424
G1 X99.859 Y148.665
G1 X97.69 Y146.496 E.09424
G1 X97.69 Y147.03
G1 X99.859 Y149.198 E.09424
G1 X99.859 Y149.732
G1 X97.691 Y147.563 E.09423
G1 X97.691 Y148.096
G1 X99.859 Y150.265 E.09423
G1 X99.859 Y150.798
G1 X97.691 Y148.63 E.09423
G1 X97.691 Y149.163
G1 X99.859 Y151.331 E.09422
G1 X99.859 Y151.865
G1 X97.691 Y149.697 E.09422
G1 X97.691 Y150.23
G1 X99.859 Y152.398 E.09421
G1 X99.859 Y152.931
G1 X97.691 Y150.763 E.09421
G1 X97.691 Y151.297
G1 X99.859 Y153.465 E.09421
G1 X99.859 Y153.998
G1 X97.691 Y151.83 E.0942
G1 X97.691 Y152.363
G1 X99.859 Y154.531 E.0942
G1 X99.859 Y155.064
G1 X97.691 Y152.897 E.0942
G1 X97.691 Y153.43
G1 X99.859 Y155.598 E.09419
G1 X99.859 Y156.131
G1 X97.692 Y153.963 E.09419
G1 X97.692 Y154.497
G1 X99.859 Y156.664 E.09419
G1 X99.859 Y157.197
G1 X97.692 Y155.03 E.09418
G1 X97.692 Y155.563
G1 X99.859 Y157.731 E.09418
G1 X99.859 Y158.264
G1 X97.692 Y156.097 E.09417
G1 X97.692 Y156.63
G1 X99.859 Y158.797 E.09417
G1 X99.859 Y159.331
G1 X97.692 Y157.164 E.09417
G1 X97.692 Y157.697
G1 X99.859 Y159.864 E.09416
G1 X99.859 Y160.397
G1 X97.692 Y158.23 E.09416
G1 X97.692 Y158.764
G1 X99.859 Y160.93 E.09416
G1 X99.859 Y161.464
G1 X97.692 Y159.297 E.09415
G1 X97.692 Y159.83
G1 X99.859 Y161.997 E.09415
G1 X99.859 Y162.53
G1 X97.693 Y160.364 E.09415
G1 X97.693 Y160.897
G1 X99.859 Y163.063 E.09414
G1 X99.859 Y163.597
G1 X97.693 Y161.43 E.09414
G1 X97.693 Y161.964
G1 X99.859 Y164.13 E.09414
G1 X99.859 Y164.663
G1 X97.693 Y162.497 E.09413
G1 X97.693 Y163.03
G1 X99.859 Y165.196 E.09413
G1 X99.859 Y165.73
G1 X97.693 Y163.564 E.09412
G1 X97.693 Y164.097
G1 X99.859 Y166.263 E.09412
G1 X99.859 Y166.796
G1 X97.693 Y164.63 E.09412
G1 X97.693 Y165.164
G1 X99.859 Y167.33 E.09411
G1 X99.859 Y167.863
G1 X97.693 Y165.697 E.09411
G1 X97.693 Y166.231
G1 X99.859 Y168.396 E.09411
G1 X99.868 Y168.938
G1 X97.694 Y166.764 E.09448
G1 X97.694 Y167.297
G1 X99.905 Y169.509 E.0961
G1 X100.023 Y170.159
G1 X97.694 Y167.831 E.1012
G1 X97.694 Y168.364
G1 X100.282 Y170.952 E.11246
G1 X100.851 Y172.055
G1 X97.696 Y168.9 E.13711
M204 S10000
; WIPE_START
G1 F24000
G1 X99.11 Y170.314 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.161 J.364 P1  F30000
G1 X113.761 Y123.638 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X111.588 Y121.466 E.09439
G1 X111.588 Y121.999
G1 X113.76 Y124.171 E.09439
G1 X113.76 Y124.704
G1 X111.588 Y122.532 E.09439
G1 X111.588 Y123.065
G1 X113.76 Y125.237 E.09438
G1 X113.76 Y125.771
G1 X111.588 Y123.599 E.09438
G1 X111.588 Y124.132
G1 X113.76 Y126.304 E.09438
G1 X113.76 Y126.837
G1 X111.588 Y124.665 E.09437
G1 X111.588 Y125.199
G1 X113.76 Y127.37 E.09437
G1 X113.76 Y127.903
G1 X111.588 Y125.732 E.09436
G1 X111.588 Y126.265
G1 X113.76 Y128.437 E.09436
G1 X113.76 Y128.97
G1 X111.588 Y126.798 E.09436
G1 X111.588 Y127.332
G1 X113.76 Y129.503 E.09435
G1 X113.76 Y130.036
G1 X111.588 Y127.865 E.09435
G1 X111.588 Y128.398
M73 P96 R0
G1 X113.759 Y130.569 E.09435
G1 X113.759 Y131.102
G1 X111.588 Y128.931 E.09434
G1 X111.588 Y129.465
G1 X113.759 Y131.636 E.09434
G1 X113.759 Y132.169
G1 X111.588 Y129.998 E.09434
G1 X111.588 Y130.531
G1 X113.759 Y132.702 E.09433
G1 X113.759 Y133.235
G1 X111.588 Y131.065 E.09433
G1 X111.588 Y131.598
G1 X113.759 Y133.768 E.09433
G1 X113.759 Y134.302
G1 X111.588 Y132.131 E.09432
G1 X111.588 Y132.664
G1 X113.759 Y134.835 E.09432
G1 X113.759 Y135.368
G1 X111.588 Y133.198 E.09431
G1 X111.588 Y133.731
G1 X113.759 Y135.901 E.09431
G1 X113.759 Y136.434
G1 X111.588 Y134.264 E.09431
G1 X111.588 Y134.797
G1 X113.758 Y136.968 E.0943
G1 X113.758 Y137.501
G1 X111.588 Y135.331 E.0943
G1 X111.588 Y135.864
G1 X113.758 Y138.034 E.0943
G1 X113.758 Y138.567
G1 X111.588 Y136.397 E.09429
G1 X111.588 Y136.93
G1 X113.758 Y139.1 E.09429
G1 X113.758 Y139.633
G1 X111.588 Y137.464 E.09429
G1 X111.588 Y137.997
G1 X113.758 Y140.167 E.09428
G1 X113.758 Y140.7
G1 X111.588 Y138.53 E.09428
G1 X111.588 Y139.064
G1 X113.758 Y141.233 E.09427
G1 X113.758 Y141.766
G1 X111.588 Y139.597 E.09427
G1 X111.588 Y140.13
G1 X113.758 Y142.299 E.09427
G1 X113.758 Y142.833
G1 X111.588 Y140.663 E.09426
G1 X111.588 Y141.197
G1 X113.757 Y143.366 E.09426
G1 X113.757 Y143.899
G1 X111.588 Y141.73 E.09426
G1 X111.588 Y142.263
G1 X113.757 Y144.432 E.09425
G1 X113.757 Y144.965
G1 X111.588 Y142.796 E.09425
G1 X111.588 Y143.33
G1 X113.757 Y145.499 E.09425
G1 X113.757 Y146.032
G1 X111.588 Y143.863 E.09424
G1 X111.588 Y144.396
G1 X113.757 Y146.565 E.09424
G1 X113.757 Y147.098
G1 X111.588 Y144.93 E.09424
G1 X111.588 Y145.463
G1 X113.757 Y147.631 E.09423
G1 X113.757 Y148.164
G1 X111.588 Y145.996 E.09423
G1 X111.588 Y146.529
G1 X113.757 Y148.698 E.09422
G1 X113.757 Y149.231
G1 X111.588 Y147.063 E.09422
G1 X111.588 Y147.596
G1 X113.756 Y149.764 E.09422
G1 X113.756 Y150.297
G1 X111.588 Y148.129 E.09421
G1 X111.588 Y148.662
G1 X113.756 Y150.83 E.09421
G1 X113.756 Y151.364
G1 X111.588 Y149.196 E.09421
G1 X111.588 Y149.729
G1 X113.756 Y151.897 E.0942
G1 X113.756 Y152.43
G1 X111.588 Y150.262 E.0942
G1 X111.588 Y150.796
G1 X113.756 Y152.963 E.0942
G1 X113.756 Y153.496
G1 X111.588 Y151.329 E.09419
G1 X111.588 Y151.862
G1 X113.756 Y154.03 E.09419
G1 X113.756 Y154.563
G1 X111.588 Y152.395 E.09419
G1 X111.588 Y152.929
G1 X113.756 Y155.096 E.09418
G1 X113.756 Y155.629
G1 X111.588 Y153.462 E.09418
G1 X111.588 Y153.995
G1 X113.755 Y156.162 E.09417
G1 X113.755 Y156.695
G1 X111.588 Y154.528 E.09417
G1 X111.588 Y155.062
G1 X113.755 Y157.229 E.09417
G1 X113.755 Y157.762
G1 X111.588 Y155.595 E.09416
G1 X111.588 Y156.128
G1 X113.755 Y158.295 E.09416
G1 X113.755 Y158.828
G1 X111.588 Y156.661 E.09416
G1 X111.588 Y157.195
G1 X113.755 Y159.361 E.09415
G1 X113.755 Y159.895
G1 X111.588 Y157.728 E.09415
G1 X111.588 Y158.261
G1 X113.755 Y160.428 E.09415
G1 X113.755 Y160.961
G1 X111.588 Y158.795 E.09414
G1 X111.588 Y159.328
G1 X113.755 Y161.494 E.09414
G1 X113.755 Y162.027
G1 X111.588 Y159.861 E.09413
G1 X111.588 Y160.394
M73 P97 R0
G1 X113.754 Y162.561 E.09413
G1 X113.754 Y163.094
G1 X111.588 Y160.928 E.09413
G1 X111.588 Y161.461
G1 X113.754 Y163.627 E.09412
G1 X113.754 Y164.16
G1 X111.588 Y161.994 E.09412
G1 X111.588 Y162.527
G1 X113.754 Y164.693 E.09412
G1 X113.754 Y165.226
G1 X111.588 Y163.061 E.09411
G1 X111.588 Y163.594
G1 X113.754 Y165.76 E.09411
G1 X113.754 Y166.293
G1 X111.588 Y164.127 E.09411
G1 X111.588 Y164.661
G1 X113.754 Y166.826 E.0941
G1 X113.754 Y167.359
G1 X111.588 Y165.194 E.0941
G1 X111.588 Y165.727
G1 X113.754 Y167.892 E.0941
G1 X113.754 Y168.426
G1 X111.588 Y166.26 E.09409
G1 X111.588 Y166.794
G1 X113.746 Y168.952 E.09378
G1 X113.724 Y169.463
G1 X111.588 Y167.327 E.09282
G1 X111.588 Y167.86
G1 X113.665 Y169.937 E.09024
G1 X113.591 Y170.396
G1 X111.588 Y168.393 E.08701
G1 X111.583 Y168.922
G1 X113.486 Y170.824 E.08267
G1 X113.371 Y171.242
G1 X111.551 Y169.423 E.07906
G1 X111.483 Y169.888
G1 X113.228 Y171.633 E.07583
G1 X113.075 Y172.014
G1 X111.386 Y170.324 E.07341
G1 X111.258 Y170.73
G1 X112.906 Y172.377 E.0716
G1 X112.72 Y172.724
G1 X111.107 Y171.112 E.07007
G1 X110.936 Y171.474
G1 X112.524 Y173.062 E.06902
G1 X112.308 Y173.38
G1 X110.747 Y171.818 E.06786
G1 X110.539 Y172.144
G1 X112.088 Y173.693 E.06731
G1 X111.845 Y173.983
G1 X110.309 Y172.447 E.06674
G1 X110.063 Y172.734
G1 X111.597 Y174.269 E.06666
G1 X111.331 Y174.535
G1 X109.801 Y173.006 E.06646
G1 X109.517 Y173.255
G1 X111.059 Y174.796 E.06698
G1 X110.768 Y175.039
G1 X109.227 Y173.498 E.06697
G1 X108.913 Y173.717
G1 X110.466 Y175.27 E.06748
G1 X110.151 Y175.489
G1 X108.578 Y173.915 E.06836
G1 X108.225 Y174.096
G1 X109.825 Y175.696 E.06953
G1 X109.486 Y175.89
G1 X107.854 Y174.258 E.07094
G1 X107.461 Y174.398
G1 X109.125 Y176.063 E.07233
G1 X108.759 Y176.23
G1 X107.04 Y174.511 E.07469
G1 X106.591 Y174.594
G1 X108.368 Y176.372 E.07724
G1 X107.965 Y176.502
G1 X106.101 Y174.638 E.081
G1 X105.586 Y174.656
G1 X107.544 Y176.615 E.08509
G1 X107.097 Y176.701
G1 X105.01 Y174.614 E.09072
G1 X104.36 Y174.497
G1 X106.634 Y176.771 E.09881
G1 X106.143 Y176.814
G1 X103.583 Y174.253 E.11128
G1 X102.466 Y173.67
G1 X105.616 Y176.819 E.13687
G1 X105.055 Y176.792
G1 X97.73 Y169.466 E.31833
G1 X97.797 Y170.067
G1 X104.455 Y176.725 E.28933
G1 X103.78 Y176.584
G1 X97.938 Y170.741 E.25388
G1 X98.165 Y171.501
G1 X103.02 Y176.356 E.21097
G1 X102.083 Y175.953
G1 X98.582 Y172.452 E.15214
M204 S10000
G1 X98.644 Y172.391 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.219155
G1 F15000
G1 X98.5 Y172.194 E.0035
; LINE_WIDTH: 0.191746
G1 X98.355 Y171.998 E.00296
; WIPE_START
G1 F24000
G1 X98.5 Y172.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.445 J1.133 P1  F30000
G1 X102.406 Y173.73 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.231634
G1 F15000
G1 X102.119 Y173.49 E.00575
; LINE_WIDTH: 0.161526
G1 X101.374 Y172.776 E.00997
; LINE_WIDTH: 0.139702
G1 X101.12 Y172.492 E.003
; LINE_WIDTH: 0.191506
G3 X100.791 Y172.116 I3.385 J-3.291 E.00606
; WIPE_START
G1 F24000
G1 X101.12 Y172.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.665 J1.019 P1  F30000
G1 X104.295 Y174.562 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.179996
G1 F15000
G3 X104.023 Y174.408 I3.414 J-6.339 E.0035
; WIPE_START
G1 F24000
G1 X104.295 Y174.562 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.391 J-1.152 P1  F30000
G1 X101.384 Y175.55 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0881713
G1 F15000
G1 X101.214 Y175.407 E.00082
; LINE_WIDTH: 0.125708
G1 X101.043 Y175.264 E.0015
; LINE_WIDTH: 0.163245
G1 X100.872 Y175.12 E.00219
; LINE_WIDTH: 0.200783
G1 X100.616 Y174.886 E.00447
; LINE_WIDTH: 0.251262
G3 X99.87 Y174.161 I7.921 J-8.902 E.01766
; LINE_WIDTH: 0.26138
G1 X99.635 Y173.904 E.00621
; LINE_WIDTH: 0.230966
G1 X99.399 Y173.647 E.00534
; LINE_WIDTH: 0.200553
G1 X99.285 Y173.514 E.00226
; LINE_WIDTH: 0.173616
G1 X99.171 Y173.381 E.00187
; LINE_WIDTH: 0.146679
G1 X99.08 Y173.267 E.00123
; LINE_WIDTH: 0.117424
G1 X98.989 Y173.153 E.00088
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X99.08 Y173.267 E-.76
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
G1 Z5.5 F900 ; lower z a little
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

    G1 Z105 F600
    G1 Z103

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

