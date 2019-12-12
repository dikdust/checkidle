#!/bin/bash

idle=false
idleAfter=300000     # consider idle after 3000 ms

while true; do
  idleTimeMillis=$(./getIdle)
  #echo $idleTimeMillis  # just for debug purposes.
  if [[ $idleTimeMillis -gt $idleAfter && $idle = false  ]] ; then
    #echo "start idle"   # or whatever command(s) you want to run...
    systemctl start idle
    idle=true
  fi

  if [[ $idleTimeMillis -lt $idleAfter && $idle = true ]] ; then
    #echo "end idle"     # same here.
    systemctl stop idle
    idle=false
  fi
  sleep 1      # polling interval

done
