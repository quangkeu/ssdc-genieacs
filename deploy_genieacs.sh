nbi="genieacs-nbi"
fs="genieacs-fs"
cwmp="genieacs-cwmp"
DEPLOY_FOLDER="/home/ubuntu/DeployGenieacs"
GENIEACS_FOLDER="/home/ubuntu/genieacs"
cd $GENIEACS_FOLDER/bin
#restart cwmp
        PID=$(pgrep -f $cwmp)

        if [ "$PID" = "" ]
        then
                echo "The process of $cwmp is none of exist"

        else
                echo "The process of $cwmp is exist"
                echo "Kill process : $PID"
                kill -9 $PID
        fi
BUILD_ID=dontKillMe nohup node genieacs-cwmp > $DEPLOY_FOLDER/logs/cwmp.out 2>&1&
#restart nbi
        PID=$(pgrep -f $nbi)

        if [ "$PID" = "" ]
        then
                echo "The process of $nbi is none of exist"

        else
                echo "The process of $nbi is exist"
                echo "Kill process : $PID"
                kill -9 $PID
        fi
BUILD_ID=dontKillMe nohup node genieacs-nbi > $DEPLOY_FOLDER/logs/nbi.out 2>&1&
#restart fs
        PID=$(pgrep -f $fs)

        if [ "$PID" = "" ]
        then
                echo "The process of $fs is none of exist"

        else
                echo "The process of $fs is exist"
                echo "Kill process : $PID"
                kill -9 $PID
        fi
BUILD_ID=dontKillMe nohup node genieacs-fs > $DEPLOY_FOLDER/logs/fs.out 2>&1&

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
