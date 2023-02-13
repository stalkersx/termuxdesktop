#!/bin/bash

# var
tmx="/data/data/com.termux/files/usr/bin"
lnx="/usr/bin"

# os
if [ -d $tmx ];then
  locshc=$tmx/shc; echo "[!] termux"
elif [ -d $lnx ];then
  locshc=$lnx/shc; echo "[!] linux"
else
  echo "[!] folder bin not found"; exit
fi

# check
if [ -z $1 ];then
  echo "[!] ./compiler.sh <opsi> <file.sh>"; exit
elif ! [ -f $2 ];then
  echo "[!] file <$2> not found"; exit
elif ! [ -f $locshc ];then
  echo "[!] sudo apt install shc gcc g++"; exit
fi

# run
if [[ $1 == "--help" ]] && [ -z $2 ];then
  echo -e "you make a backup file first before run\nuse : ./compile [opsi] [file]"
elif [[ $1 -eq 1 ]] && [ $2 ];then
  shc -f $2 && rm $2.x.c
elif [[ $1 -eq 2 ]] && [ $2 ];then
  shc -f $2 && rm {$2,$2.x.c} && mv $2.x $2
else
  echo -e "[!] opsi :\n1 --> compile tanpa hapus file lama\n2 --> hapus file lama"
fi
