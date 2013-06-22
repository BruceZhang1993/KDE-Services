#!/bin/bash

#################################################################
# For KDE Services. 2011-2013.					#
# By Geovani Barzaga Rodriguez <igeo.cu@gmail.com>		#
#################################################################

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/$USER/bin
BEGIN_TIME=""
FINAL_TIME=""
ELAPSED_TIME=""
DBUSREF=""
COUNT=""
COUNTFILES=""
FILE="$1"

###################################
############ Functions ############
###################################

if-cancel-exit() {
    if [ "$?" != "0" ]; then
        qdbus $DBUSREF close
        exit 0
    fi
}

if-avisplit-cancel() {
    if [ "$?" != "0" ]; then
        qdbus $DBUSREF close
        kdialog --icon=application-exit --title="AVI Split (By Time Range)" \
                       --passivepopup="[Canceled]   Check the path and filename not contain spaces. Check video format errors. Try again"
        exit 0
    fi
}

progressbar-start() {
    COUNT="0"
    COUNTFILES=$(echo $FILE|wc -w)
    COUNTFILES=$(expr $COUNTFILES + 1)
    DBUSREF=$(kdialog --icon=video-x-generic --caption="AVI Split (By Time Range)" --progressbar "                      " /ProgressDialog)
}

progressbar-close() {
    qdbus $DBUSREF Set "" value $COUNTFILES
    sleep 1
    qdbus $DBUSREF close
}

qdbusinsert() {
    qdbus $DBUSREF setLabelText "AVI Split (By Time Range):  $(basename $FILE)"
    qdbus $DBUSREF Set "" value $COUNT
}

elapsedtime() {
    if [ "$ELAPSED_TIME" -lt "60" ]; then
        kdialog --icon=video-x-generic --title="AVI Split (By Time Range):  $(basename $FILE)" \
                       --passivepopup="[Finished]	Elapsed Time: $ELAPSED_TIME s."
        
    elif [ "$ELAPSED_TIME" -gt "59" ] && [ "$ELAPSED_TIME" -lt "3600" ]; then
        ELAPSED_TIME=$(echo "$ELAPSED_TIME/60"|bc -l|sed 's/...................$//')
        kdialog --icon=video-x-generic --title="AVI Split (By Time Range):  $(basename $FILE)" \
                       --passivepopup="[Finished]	Elapsed Time: $ELAPSED_TIME m."
        
    elif [ "$ELAPSED_TIME" -gt "3599" ] && [ "$ELAPSED_TIME" -lt "86400" ]; then
        ELAPSED_TIME=$(echo "$ELAPSED_TIME/3600"|bc -l|sed 's/...................$//')
        kdialog --icon=video-x-generic --title="AVI Split (By Time Range):  $(basename $FILE)" \
                       --passivepopup="[Finished]	Elapsed Time: $ELAPSED_TIME h."
        
    elif [ "$ELAPSED_TIME" -gt "86399" ]; then
        ELAPSED_TIME=$(echo "$ELAPSED_TIME/86400"|bc -l|sed 's/...................$//')
        kdialog --icon=video-x-generic --title="AVI Split (By Time Range):  $(basename $FILE)" \
                       --passivepopup="[Finished]	Elapsed Time: $ELAPSED_TIME d."
    fi
}

##############################
############ Main ############
##############################

TIMERANGE=$(kdialog --icon=video-x-generic --caption="AVI Split (By Time Range)" \
          --inputbox="Enter time range (One range: 00:10:00-00:11:00 or multi-range: 00:10:00-00:11:00,00:23:00-00:24:00)" 00:05:00-00:06:00 \
          2> /dev/null)
if-cancel-exit

BEGIN_TIME=$(date +%s)
progressbar-start
COUNT=$(expr $COUNT + 1)
qdbusinsert

avisplit -i $1 -c -o "`echo $1 | perl -pe 's/\\.[^.]+$//'`_edit.avi" -t $TIMERANGE
if-avisplit-cancel

FINAL_TIME=$(date +%s)
ELAPSED_TIME=$(echo "$FINAL_TIME-$BEGIN_TIME"|bc)
elapsedtime

progressbar-close
echo "Finish Splitting AVI" > /tmp/speak
text2wave -F 48000 -o /tmp/speak.wav /tmp/speak
play /tmp/speak.wav 2> /dev/null
rm -fr /tmp/speak*

exit 0
