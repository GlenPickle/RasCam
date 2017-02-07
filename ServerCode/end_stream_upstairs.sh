#!/bin/bash

pid_string=$( ssh upstairs_cam 'ps -e | grep raspivid' )

pid_string=$( echo $pid_string | awk '{print $1}' )

pid_string2=$( ssh upstairs_cam 'ps -e | grep vlc' )

pid_string2=$( echo $pid_string2 | awk '{print $1}' )

ssh upstairs_cam "kill $pid_string $pid_string2"

nohup ./us_notification_daemon.sh > upstairs_daemon.out 2> upstairs_daemon.err < /dev/null &
