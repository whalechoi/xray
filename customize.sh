####################
# Xray Customization
####################
SKIPUNZIP=1
magisk_busybox="/data/adb/magisk/busybox"
xray_dir="/data/adb/xray"

# check device
if [ "${ARCH}" != "arm64" ] ; then
    rm -rf "${MODPATH}"
    abort "This module only support arm64 device!"
fi

# prepare xray execute environment
ui_print "- Prepare Xray execute environment."
rm -rf ${xray_dir}/bin
rm -rf ${MODPATH}/script
mkdir -p ${xray_dir} >&2
mkdir -p ${xray_dir}/bin >&2
mkdir -p ${xray_dir}/etc >&2
mkdir -p ${MODPATH}/script >&2

# install module file
ui_print "- Install module files."
${magisk_busybox} unzip -j -o "${ZIPFILE}" "xray/bin/*" -d ${xray_dir}/bin >&2
${magisk_busybox} unzip -j -o "${ZIPFILE}" "xray/etc/*" -d ${xray_dir}/etc >&2
${magisk_busybox} unzip -j -o "${ZIPFILE}" "script/*" -d ${MODPATH}/script >&2
${magisk_busybox} unzip -j -o "${ZIPFILE}" "module.prop" -d ${MODPATH} >&2
${magisk_busybox} unzip -j -o "${ZIPFILE}" "service.sh" -d ${MODPATH} >&2
${magisk_busybox} unzip -j -o "${ZIPFILE}" "uninstall.sh" -d ${MODPATH} >&2

# for module update
[ -f ${xray_dir}/etc/config.json ] || \
cp ${xray_dir}/etc/config.json.template ${xray_dir}/etc/config.json

set_perm_recursive ${MODPATH}   0 0 0755 0644
set_perm_recursive ${xray_dir}  0 0 0755 0644
set_perm  ${MODPATH}/service.sh    0  0  0755
set_perm  ${MODPATH}/uninstall.sh  0  0  0755
set_perm  ${xray_dir}/bin/xray     0  0  0755
set_perm  ${xray_dir}/bin/tun2socks    0  0  0755
set_perm  ${MODPATH}/script/start.sh   0  0  0755
set_perm  ${MODPATH}/script/xray.service   0  0  0755
set_perm  ${MODPATH}/script/xray.inotify   0  0  0755
set_perm  ${MODPATH}/script/tun2socks.service   0  0  0755
