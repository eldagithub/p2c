#!/bin/sh
#####################################################################################################
#  Script Name: xxx.sh
#
#  Description: This script install docker 
#
#
#
#######################################################################################################
#
# Change Log:
#
# Date          Author          Comments
# 20/11/2020    MOS             Original
#
#
####################################################################


####################################################################
# Function usage
#
# Displays usage help


####################################################################


# usage : define function usage 
usage()
{
    echo "" 
    echo "" 
    echo "Usage of install : " 
    echo "   checkinput <AS_NAME> " 
    echo "   ant_task <AS_NAME> " 
}


sudo systemctl start docker
sudo usermod -aG docker $USER
