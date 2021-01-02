#######################################
# Xray Magisk Module Uninstaller Script
#######################################
xray_dir="/data/adb/xray"

remove_xray_data_dir() {
  rm -rf ${xray_dir}
}

remove_xray_data_dir
