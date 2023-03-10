# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/Users/TEMP/Desktop/project 223/project223.cache/wt} [current_project]
set_property parent.project_path {D:/Users/TEMP/Desktop/project 223/project223.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib -sv {
  {D:/Users/TEMP/Desktop/project 223/project223.srcs/sources_1/new/ALUSort.sv}
  {D:/Users/TEMP/Desktop/project 223/project223.srcs/sources_1/new/sortMainTester.sv}
}
synth_design -top sortMainTester -part xc7a35tcpg236-1
write_checkpoint -noxdef sortMainTester.dcp
catch { report_utilization -file sortMainTester_utilization_synth.rpt -pb sortMainTester_utilization_synth.pb }
