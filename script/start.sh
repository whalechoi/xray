#!/system/bin/sh
MODDIR=${0%/*}/..

xray_dir="/data/adb/xray"
script_dir="${MODDIR}/script"
log_dir="${xray_dir}/log"

log_path="${log_dir}/module.log"

start_proxy () {
  mkdir -p ${log_dir} >&2
  ${script_dir}/xray.service start &> ${log_path} && \
  ${script_dir}/tun2socks.service start &>> ${log_path}
}

if [ ! -f ${xray_dir}/manual ] ; then
  start_proxy
  inotifyd ${script_dir}/xray.inotify ${MODDIR} &>> ${log_path} &
fi
