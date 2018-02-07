#! /bin/bash
# Makes and saves .nse scripts (or .lua libraries) in the right directory
# Author: Henri Cattoire

# Going to the right directory
cd /usr/local/share/nmap/scripts # option for the scripts
#cd /usr/local/share/nmap/nselib # option for the libraries
# Main (URL and name should be changed to the script you want)
curl https://svn.nmap.org/nmap/scripts/ajp-auth.nse >> ajp.auth.nse

