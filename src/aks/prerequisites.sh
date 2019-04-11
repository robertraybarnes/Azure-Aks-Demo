#!/bin/bash
#This code sets the storage account access key to env variable.  
#To run this script cd to the aks folder and run chmod 755 prerequisites.sh && . prerequisites.sh

read -sp 'enter the access key for your azure storage account:' access_key

prereq_check() {
    if [[ "$ARM_ACCESS_KEY" = "$access_key" ]]
    then
        echo "environment variable is correctly set"
    else
        export ARM_ACCESS_KEY="$access_key"
        #echo $ARM_ACCESS_KEY
    fi
}

prereq_check