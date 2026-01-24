set search_path "/cad/process/ADFP/Executable_Package/Collaterals/IP/stdcell/N16ADFP_StdCell/CCS $search_path"
set search_path "/cad/process/ADFP/Executable_Package/Collaterals/IP/stdio/N16ADFP_StdIO/NLDM $search_path"
set target_library "N16ADFP_StdCellss0p72vm40c_ccs.db"
set target_library "N16ADFP_StdCellff0p88v125c_ccs.db $target_library"
set target_library "N16ADFP_StdIOss0p72v1p62v125c.db $target_library"
set target_library "N16ADFP_StdIOff0p88v1p98vm40c.db $target_library"
set link_library "* $target_library dw_foundation.sldb"
set symbol_library "generic.sdb"
set synthetic_library "dw_foundation.sldb"

set verilogout_no_tri true
set hdlin_enable_presto_for_vhdl "TRUE"
set sh_enable_line_editing true
history keep 100
alias h histor
