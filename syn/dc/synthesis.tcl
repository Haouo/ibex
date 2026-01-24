source ${SCRIPT_DIR}/setup.tcl
source "${READ_SOURCES}.tcl"

elaborate $TOP_MODULE
current_design $TOP_MODULE
link
check_design

source ${SCRIPT_DIR}/constraint.tcl
compile

source ${SCRIPT_DIR}/report.tcl
