
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name SerialWrapper_EEE6225 -dir "E:/Georgina/Documents/William/System-Design/VHDL/William/SerialWrapper_EEE6225/planAhead_run_3" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/Georgina/Documents/William/System-Design/VHDL/William/SerialWrapper_EEE6225/top_level.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/Georgina/Documents/William/System-Design/VHDL/William/SerialWrapper_EEE6225} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "E:/Georgina/Documents/William/System-Design/VHDL/William/SerialWrapper_EEE6225/Nexys3(spartan6)/Nexys3Constraints.ucf" [current_fileset -constrset]
add_files [list {E:/Georgina/Documents/William/System-Design/VHDL/William/SerialWrapper_EEE6225/Nexys3(spartan6)/Nexys3_master.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {E:/Georgina/Documents/William/System-Design/VHDL/William/SerialWrapper_EEE6225/Nexys3(spartan6)/Nexys3Constraints.ucf}] -fileset [get_property constrset [current_run]]
link_design
