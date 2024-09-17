## arch_updater
Archlinux automatic updater. A simple bash script. 

### Requirements
* Arch linux (`pacman`) - likely this can be changed
* systemd linux
* root access or modify commands

It won't update if:
* mobile hot-spot is used (my phone' hot-spot is: `Asus Zen8`)
* Firefox is about to be updated (in order not to break your work since Firefox needs restart after being updated)

## Instalation

Change `Asus Zen8` hot-spot name to your's in `arch_updater.sh`

1. copy `arch_updater.sh` to `/usr/local/bin` (make it executable `chmod 755 arch_updater.sh`)
2. copy `arch_updater.service` and `arch_updater.timer` to `/etc/systemd/system/`
3. check whether everything is fine by now: `systemd-analyze verify /etc/systemd/system/arch_updater.*`
4. `sudo systemctl start arch_updater.timer` acrtivate timer for the current session
5. `sudo systemctl enable arch_updater.timer` activated on boot

## Logs
`journalctl --no-pager -u arch_updater.service`


## Todo
* enable more blocking sw (Firefox now)
* rewrite to python (bash is becoming hard to read)
* use variable for hot-spot name

