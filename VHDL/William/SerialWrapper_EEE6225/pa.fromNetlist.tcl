
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name SerialWrapper_EEE6225 -dir "E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/SerialWrapper_EEE6225/planAhead_run_4" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/SerialWrapper_EEE6225/top_level.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/SerialWrapper_EEE6225} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top_level.ucf" [current_fileset -constrset]
add_files [list {top_level.ucf}] -fileset [get_property constrset [current_run]]
link_design
