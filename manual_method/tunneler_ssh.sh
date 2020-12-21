#!/usr/bin/sh
######################################################################################
#Name:          tunneler_ssh.sh
#Created on,by: 30th Jun 2015, Ram
#Updated:       30th Jun 2015
#Description:   Create a SSH session to hostname.domain and keep it open
#               Please use it at your own risk.
#Author:        Ram
######################################################################################
output="$(ps aux|grep ssh|grep 6100)"
date_time="$(date)"
prefix="persistentssh_log_"
filedate=$(date +"%d-%b-%y")
filename=$prefix$filedate

if [ -n "$output" ];
then
	echo  $date_time "SSH Exists $output">>/home/tunneler_r/logs/$filename
else
	echo $date_time "Session does not exist">>/home/tunneler_r/logs/$filename
	ssh_cmd="ssh -fN -o ExitOnForwardFailure=yes -L 6100:127.0.0.1:3306 tunneler_r@hostname.domain"
	su tunneler_r sh -c "$ssh_cmd"
	echo $date_time "Session Established">>/home/tunneler_r/logs/$filename
fi
	# example: ssh_cmd="ssh -fN -o ExitOnForwardFailure=yes -i ~tunneler_r/.ssh/id_rsa_<servername> -L 6100:127.0.0.1:3306 tunneler_r@hostname.domain"
    # example(with key): ssh_cmd="ssh -fN -o ExitOnForwardFailure=yes -i ~tunneler_r/.ssh/id_rsa_<servername> -L 6100:127.0.0.1:3306 tunneler_r@hostname.domain"
exit
