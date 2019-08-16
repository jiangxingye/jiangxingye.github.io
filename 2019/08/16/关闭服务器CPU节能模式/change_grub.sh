#!/bin/sh
cmd="intel_pstate=disable intel_idle.max_cstate=0 processor.max_cstate=1 idle=poll quiet"

check=$(cat /etc/default/grub |grep "intel_pstate=disable intel_idle.max_cstate=0 processor.max_cstate=1 idle=poll" | wc -l ) 
if [ $check -eq 0 ]
    then 
        sed -i "/GRUB_CMDLINE_LINUX/ s/quiet/$cmd/g" /etc/default/grub
    else
        printf "the file has been edited at a earlier time"
        exit 0
fi
if [ $? -ne 0 ]
then
    printf "faild,please change it by edit the file"
    exit 1
fi

grub2-mkconfig -o /boot/grub2/grub.cfg && reboot
