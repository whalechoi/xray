# Xray Magisk Module
This is a Xray module for Magisk, and includes binaries for arm64 only.

Without Magisk Mount, So you can use it on [Magisk Lite](<https://github.com/vvb2060/magisk_files>)!

## Included
* [Xray core](<https://github.com/XTLS/Xray-core>)
* [BadVPN_tun2socks](<https://github.com/ambrop72/badvpn>)
* [module_installer](https://github.com/topjohnwu/Magisk)

## Install
You can download the release installer zip file and install it via the Magisk Manager App.

## Config

-  All files except scripts are store in `/data/adb/xray/` .

- Please make sure the config is correct. You can check it by running a command :

   `export XRAY_LOCATION_ASSET=/data/adb/xray/etc; /data/adb/xray/bin/xray -test -config /data/adb/xray/etc/config.json`  in android terminal or ssh.

- Tips: Please notice that the default configuration has already set inbounds section to cooperate work with transparent proxy script. It is recommended that you only edit the first element of outbounds section to your proxy server.

## Usage

### Normal usage ( Default and Recommended )

#### Manage service start / stop

- Xray service is auto-run after system boot up by default.
- You can start or stop Xray service by simply turn on or turn off the module via Magisk Manager App. Start service may wait about 10 second and stop service may take effect immediately.

### Advanced usage ( for Debug and Develop only )

#### Enter manual mode

If you want to control Xray by running command totally, just add a file `/data/adb/xray/manual`.  In this situation, V2Ray service won't start on boot automatically and you cann't manage service start/stop via Magisk Manager App. 

#### Manage service start / stop

- Xray service script is `$MODDIR/scripts/xray.service`.

- For example, in my environment ( Magisk Lite version: 21201 ; Magisk Lite Manager version: 4792 )

  - Start service : 

    `/data/adb/lite_modules/xray/scripts/xray.service start`

  - Stop service :

    `/data/adb/lite_modules/xray/scripts/xray.service stop`

#### Manage tun2socks enable / disable

- Transparent proxy script is `$MODDIR/scripts/tun2socks.service`.

- For example, in my environment ( Magisk Lite version: 21201 ; Magisk Lite Manager version: 4792 )

  - Enable tun2socks : 

    `/data/adb/lite_modules/xray/scripts/tun2socks.service start`

  - Disable tun2socks :

    `/data/adb/lite_modules/xray/scripts/tun2socks.service stop`

## Uninstall
Uninstall the module via Magisk Manager App.

## Project X
Project X is a set of network tools that help you to build your own computer network. It secures your network connections and thus protects your privacy. See [Project X](https://github.com/XTLS) for more information.

## License
[Mozilla Public License 2.0](https://raw.githubusercontent.com/XTLS/Xray-core/main/LICENSE)

## Declaration
Only for debugging.
