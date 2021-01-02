#!/system/bin/sh
MODDIR=${0%/*}

script_dir="${MODDIR}/script"

(
until [ $(getprop sys.boot_completed) -eq 1 ] ; do
  sleep 5
done
${script_dir}/start.sh &
)&
