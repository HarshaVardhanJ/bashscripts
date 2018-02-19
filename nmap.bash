#! /bin/bash
# Makes and saves .nse scripts (or .lua libraries) in the right directory (use the -n flag with as argument the name of the script/lib)
# Author: Henri Cattoire

# Flag
while getopts ":n:" name; do 
  case $name in
    n)
      n=${OPTARG}
      ;;
   esac
done
# Variables
SCRIPT="${n}" # or LIB="$OPTARG" for libraries
# Going to the right directory
cd /usr/local/share/nmap/scripts # or cd /usr/local/share/nmap/nselib for libraries
# Main
curl https://svn.nmap.org/nmap/scripts/"$SCRIPT" >> "$SCRIPT" # or curl https://svn.nmap.org/nmap/nselib/"$LIB" >> "$LIB" for libraries
CHECK="$(find "$SCRIPT")"
echo "FOLLOWING FILE WAS ADDED: "$SCRIPT"" # or echo "FOLLOWING FILE WAS ADDED: "$LIB""