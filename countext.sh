#!/bin/bash

# This script counts total number of files with a certain extension within your system.

PARAMS=$(getopt -o he:s --long help,extension:,total-size -- "$@" 2> /dev/null)

EXT="NOEXTDEFINED"
SIZE="NDEF"
DIR="/"

while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            echo -n "Use $0 [-e --extension] file extinsion to be counted"
            echo -n " [-s --total-size] to calculate total size of files containing the extension"
            echo " [-p --path] path in which files will be searched. Defaults to root."
            shift
            exit 0
            ;;
        
        -e|--extension)
            EXT=$2
            shift 2
            ;;
        
        -s|--total-size)
            SIZE="DEF"
            shift
            ;;
        
        -p|--path)
            DIR=$(realpath -s $2)
            shift 2
            ;;
        *)
            shift
            ;;

    esac
done

if [ $EXT == "NOEXTDEFINED" ]; then
    echo "No extension argument found."
    echo "Use $0 -h for more information."
    exit 1
else
    echo "Searching inside $DIR"
    FOUND=$(find $DIR -name "*.$EXT" -type f 2> /dev/null)
    
    if [ -z "$FOUND" ]; then
        COUNT=0
    else
    
        COUNT=$(echo "$FOUND" | wc -l)
    fi
    echo "Found $COUNT files."
        if [ $SIZE == "DEF" ] & [ $COUNT -gt 0 ]; then
            ls -l $FOUND 2> /dev/null | awk 'BEGIN{}{TOTALSIZE += $5 }END{ print "Total size:",TOTALSIZE/1000/1000"MB" }'
        fi
fi

exit 0
