#!/bin/bash

if shopt -q login_shell ; then

date=`date`
load=`cat /proc/loadavg | awk '{print $1}'`
cpu=`cat /proc/cpuinfo |grep "model name" |awk -F: '{print $2}'`
root_usage=`df -h / | awk '/\// {print $(NF-1)}'`
memory_usage=`free -m | awk '/Mem:/ { total=$2 } /buffers\/cache/ { used=$3 } END { printf("%3.1f%%", used/total*100)}'`
swap_usage=`free -m | awk '/Swap/ { if($2 > 0){printf("%3.1f%%", $3/$2*100)}else printf("n/a") }'`
users=`users | wc -w`
time=`uptime | grep -ohe 'up .*' | sed 's/,//g' | awk '{ printf $2" "$3 }'`
ip=`ip addr show eth0 | grep "inet " | awk '{print $2}'`
release=`cat /etc/redhat-release`
kernel=`uname -r`
name="[38;5;57ms[38;5;57mt[38;5;93me[38;5;93ml[38;5;99ml[38;5;147ma [38;5;147ms[38;5;99me[38;5;93mr[38;5;93mv[38;5;57me[38;5;57mr[0m ~ Dedibox SC gen2"

#echo "<------------------------------------------------------------------------------>"
echo "
             [38;5;97m▄[48;5;97;38;5;182m▄▄[49;38;5;97m▄[00m
  [38;5;97m▄▄[39m [38;5;17m▄▄[48;5;17;38;5;60m▄[48;5;60;38;5;17m▄[48;5;17;38;5;54m▄[38;5;205m▄[48;5;60;38;5;17m▄[49m▄[48;5;97;38;5;97m█[48;5;182;38;5;182m█[38;5;139m▄[38;5;182m█[48;5;97m▄[49;38;5;97m▄[00m           $name
  [38;5;97m▀[48;5;182;38;5;139m▄[48;5;97;38;5;182m▄[48;5;60;38;5;97m▄[38;5;60m█[38;5;54m▄[48;5;54;38;5;205m▄[48;5;205;38;5;60m▄[48;5;60m██[38;5;17m▄[48;5;17;38;5;182m▄[48;5;139;38;5;97m▄[48;5;182;38;5;182m█[48;5;139;38;5;97m▄[48;5;182;38;5;182m█[48;5;97;38;5;97m█[00m     $cpu
  [48;5;17;38;5;17m█[48;5;60;38;5;60m█[48;5;139m▄[48;5;182;38;5;54m▄[48;5;54m█[48;5;205;38;5;205m██[48;5;60;38;5;60m███[48;5;17m▄[48;5;182;38;5;17m▄[38;5;182m██[48;5;97m▄[48;5;182m█[48;5;97;38;5;97m█[48;5;17;38;5;61m▄[00m           $release
 [48;5;17;38;5;17m█[48;5;60;38;5;60m██[38;5;54m▄[48;5;54m█[38;5;205m▄[48;5;205m██[48;5;60;38;5;60m███[38;5;17m▄[48;5;17m█[48;5;182;38;5;182m█████[48;5;61;38;5;61m█[48;5;17m▄[00m              $kernel
 [48;5;17;38;5;17m█[48;5;60;38;5;60m██[48;5;54;38;5;54m█[49m▀[48;5;205;38;5;97m▄[38;5;182m▄[48;5;182m█[38;5;139m▄[38;5;182m████[38;5;16m▄▄[38;5;182m███[48;5;61;38;5;61m█[38;5;17m▄[49;39m           [38;5;17m▄▄▄▄▄[00m
 [38;5;17m▀[39m    [48;5;97;38;5;97m█[48;5;182;38;5;139m▄[48;5;139;38;5;182m▄[48;5;16;38;5;16m█[48;5;182;38;5;182m████[48;5;16;38;5;16m█[48;5;139m▄[48;5;182;38;5;182m██[38;5;97m▄[48;5;61;38;5;61m█[48;5;17;38;5;17m█[49;39m        [38;5;17m▄[48;5;17;38;5;60m▄▄[48;5;60m█[38;5;205m▄▄▄[38;5;60m█[48;5;17m▄▄[49;38;5;17m▄▄[00m
      [38;5;97m▄[48;5;97;38;5;139m▄[48;5;182;38;5;182m██[48;5;16m▄[48;5;182;38;5;16m▄▄[48;5;16;38;5;182m▄[48;5;139m▄[48;5;182m███[48;5;97;38;5;17m▄[48;5;61;38;5;61m█[48;5;17;38;5;17m█[49;39m       [48;5;17;38;5;17m█[48;5;60;38;5;60m█[38;5;205m▄[48;5;205;38;5;54m▄▄▄▄▄[38;5;205m██[48;5;60m▄[38;5;60m██[48;5;17m▄[49;38;5;17m▄[00m       System information as of:
      [38;5;97m▀[48;5;182m▄[38;5;182m█[38;5;139m▄[38;5;182m███[38;5;139m▄[38;5;97m▄[48;5;17;38;5;17m█[38;5;61m▄▄[48;5;61m█[38;5;17m▄[48;5;54;38;5;54m█[48;5;17;38;5;17m█[49;39m [38;5;97m▄▄▄▄[48;5;17;38;5;17m█[48;5;60;38;5;205m▄[48;5;205;38;5;54m▄[48;5;54;38;5;60m▄[48;5;60;38;5;17m▄▄[38;5;60m███[48;5;54m▄▄[48;5;205;38;5;54m▄[38;5;205m█[48;5;60m▄[38;5;60m██[48;5;17m▄[49;38;5;17m▄[00m   $date
        [38;5;97m▀▀▀▀▀[48;5;97m█[48;5;182;38;5;182m█[38;5;17m▄▄▄[48;5;17;38;5;61m▄[48;5;61m█[48;5;54;38;5;205m▄[48;5;17;38;5;17m█[48;5;97;38;5;182m▄[48;5;182m█[38;5;231m▄[38;5;182m█[38;5;231m▄[38;5;182m█[48;5;97;38;5;97m█[49;38;5;17m▀▀[39m  [38;5;17m▀▀[48;5;60m▄[38;5;60m██[48;5;54m▄[38;5;54m█[48;5;205;38;5;205m█[48;5;60m▄[38;5;60m███[48;5;17m▄[49;38;5;17m▄[00m
             [48;5;97;38;5;97m█[48;5;182;38;5;182m█[48;5;17m▄[48;5;61;38;5;17m▄[38;5;54m▄▄[48;5;54;38;5;205m▄[48;5;205;38;5;61m▄[48;5;17;38;5;17m█[48;5;182;38;5;182m█[38;5;231m▄[38;5;205m▄[48;5;205m█[48;5;182m▄[38;5;182m██[48;5;97;38;5;97m█[49;39m      [38;5;17m▀[48;5;60m▄[38;5;60m█[48;5;54m▄[48;5;205;38;5;54m▄[38;5;205m█[48;5;60m▄[38;5;60m███[48;5;17m▄[49;38;5;17m▄[00m
              [48;5;97;38;5;97m█[48;5;182;38;5;182m█[48;5;17m▄[48;5;205;38;5;17m▄[38;5;61m▄[48;5;61m█[38;5;17m▄[48;5;17;38;5;182m▄[48;5;182m█[38;5;231m▄[38;5;205m▄[48;5;205;38;5;182m▄[48;5;182;38;5;205m▄[38;5;231m▄[38;5;182m█[48;5;97;38;5;97m█[49;39m        [48;5;17;38;5;17m█[48;5;60;38;5;60m█[48;5;54;38;5;54m█[48;5;205m▄[38;5;205m█[48;5;60;38;5;60m████[48;5;17m▄[49;38;5;17m▄[39m [00m
           [38;5;96m▄[48;5;96;38;5;139m▄▄▄[48;5;97;38;5;96m▄[48;5;182;38;5;97m▄[48;5;17;38;5;182m▄▄▄[48;5;182m███[48;5;97m▄[48;5;182;38;5;97m▄[38;5;182m███[48;5;97;38;5;97m█[49;39m         [38;5;17m▀[48;5;60m▄[38;5;60m█[48;5;54;38;5;54m█[48;5;205;38;5;205m██[48;5;60;38;5;60m████[48;5;17m▄[49;38;5;17m▄[39m[00m
           [48;5;96;38;5;96m█[48;5;139;38;5;139m██[48;5;96;38;5;96m█[49m▀▀[48;5;97;38;5;97m█[48;5;182;38;5;182m██[48;5;97;38;5;97m█[49m▀▀[48;5;97;38;5;96m▄[38;5;139m▄[38;5;96m▄[48;5;182;38;5;97m▄[38;5;182m█[48;5;97m▄▄[49;38;5;97m▄[39m        [48;5;17;38;5;17m█[48;5;60;38;5;60m█[48;5;54;38;5;54m█[48;5;205;38;5;205m██[48;5;60;38;5;60m███[38;5;17m▄[49m▀[39m[00m IP Addr:    $ip
           [48;5;96;38;5;96m█[48;5;139;38;5;139m███[48;5;96m▄[49;38;5;96m▄[48;5;97;38;5;97m█[48;5;182;38;5;182m██[48;5;97;38;5;97m█[49;39m   [48;5;96;38;5;96m█[48;5;139;38;5;139m█[48;5;97m▄[48;5;182;38;5;97m▄[38;5;182m██[48;5;97;38;5;97m█[49;39m        [48;5;17;38;5;17m█[48;5;60;38;5;60m█[48;5;54;38;5;54m█[48;5;205;38;5;205m██[48;5;60;38;5;60m██[48;5;17;38;5;17m█[00m   Sys load:   $load     
           [38;5;96m▀[48;5;139m▄[38;5;139m███[48;5;97;38;5;97m█[48;5;182;38;5;182m███[48;5;97;38;5;97m█[49;39m   [48;5;96;38;5;96m█[48;5;139;38;5;139m██[48;5;97;38;5;97m█[48;5;182;38;5;182m██[48;5;97m▄[49;38;5;97m▄[39m       [48;5;17;38;5;17m█[48;5;60;38;5;54m▄[48;5;54m█[48;5;205;38;5;205m█[38;5;17m▄[48;5;60m▄[49m▀[00m    Mem usage:  $memory_usage 
            [48;5;96;38;5;96m█[48;5;139m▄[38;5;139m█[38;5;96m▄[48;5;97;38;5;97m█[48;5;182;38;5;182m███[48;5;97;38;5;97m█[49;39m   [48;5;96;38;5;96m█[48;5;139;38;5;139m██[48;5;97;38;5;97m█[48;5;182;38;5;182m███[48;5;97;38;5;97m█[49;39m       [48;5;17;38;5;17m█[48;5;54;38;5;54m█[48;5;169;38;5;17m▄[49m▀[00m       Swap usage: $swap_usage
             [38;5;96m▀▀[48;5;97;38;5;97m█[48;5;182;38;5;182m████[48;5;97;38;5;97m█[49;39m   [48;5;96;38;5;96m█[48;5;139;38;5;139m██[48;5;97;38;5;97m█[48;5;182;38;5;182m███[48;5;97m▄[49;38;5;97m▄[39m      [48;5;17;38;5;17m█[49m▀[00m         Usage on /: $root_usage 
              [48;5;97;38;5;97m█[38;5;182m▄[48;5;182m███[38;5;97m▄[49m▀[39m   [38;5;96m▀▀▀[48;5;97;38;5;97m█[48;5;182;38;5;182m████[48;5;97;38;5;97m█[00m                 Uptime:     $time
              [38;5;97m▀▀▀▀▀▀[39m       [38;5;97m▀▀▀▀▀▀[00m                 Users:      $users"
#echo "<------------------------------------------------------------------------------>"
############
fi
