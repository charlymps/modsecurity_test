#!/bin/bash

# Check if a old execution still running, and kill it
Status=0;
while [ $Status -eq 0 ]; do
  PmlogcBatch=`/sbin/pidof -x /usr/bin/mlogc-batch-load`
  PplStatus=$?
  Pmlogc=`/sbin/pidof -x /usr/bin/mlogc`
  PmlogcStatus=$?

  if [ $PplStatus -eq 0 ]; then
     kill -9 $PmlogcBatch
     echo "Killing $PmlogcBatch"
  fi
  if [ $PmlogcStatus -eq 0 ]; then
     kill -9 $Pmlogc
     echo "Killing $Pmlogc"
  fi

  if [ $PplStatus -ne 0 -a $PmlogcStatus -ne 0 ]; then
     Status=1;
  fi
done

# Start mlogc push
echo "Sending logs to WAF-FLE";
date
/usr/bin/mlogc-batch-load /var/log/mlogc/data /usr/bin/mlogc /etc/mlogc.conf

find  /var/log/mlogc/data -mindepth 1 -type d -empty -delete

