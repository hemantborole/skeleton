#!/bin/bash

this_path=$(readlink -f $0)        ## Path of this file including filename
dir_name=`dirname ${this_path}`    ## Dir where this file is
myname=`basename ${this_path}`     ## file name of this script.
logger="${myname}.log"

function usage {
  echo "
  usage: $myname [options]

  -h           optional  Print this help message
  -q           optional  Suppress log messages on screen, just log them.
  -f           optional  Force
  -i <file>    required  input file
  -l <log>     optional  print errors and output to this file.
               default ${myname}.log
  -o <outdir>  optional  store output here.
               default is <put ur default here>"
  exit 1
}

function logit {
  if [[ $quiet == "true" ]]
  then
    echo $1 1>> $logger
  else
    echo $1 |tee -a $logger
  fi
}

logit "Initializing `date`"

## Start coding from here. Some basic flags are already provide. Feel free to override, add, delete
while getopts :hqfi:o:l: args
do
  case $args in
  h) usage ;;
  q) quiet='true' ;; ## Suppress messages, just log them.
  f) force='true' ;;
  l) logger="$OPTARG" ;;
  i) infile="$OPTARG" ;;
  o) outdir="$OPTARG" ;;
  :) logit "The argument -$OPTARG requires a parameter" ;;
  *) usage ;;
  esac
done

## Do parameter validations here.
## Below is an example.
if [[ ! -r $infile ]]
then
  echo ""
  logit "Input file $infile does not exist or it is not readable !!"
fi

## Put your main code here.
function main {
  usage
}

## Boot strap the script. Nothing much to do here.
main "$@"
