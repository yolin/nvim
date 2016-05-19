#!/bin/bash
defaultCodeBaseName=${1:-/ISD2}
defaultDepth=${2:-1}

if [ "$1" = "" -o "$2" != "" ]; then
    genfolder=`find $defaultCodeBaseName \-maxdepth $defaultDepth \-type d |grep -v "^$defaultCodeBaseName/\.git$\|^$defaultCodeBaseName/crosslibs$\|^$defaultCodeBaseName$\|^$defaultCodeBaseName/TARGET_RAMDISK$"|grep -v "dir/toolchain-"`
else
    genfolder=$1
fi

echo "CodeBase:$defaultCodeBaseName"
echo "Folder:$genfolder"

exgentype=`printf '\-name "*.c" "*.h" "Makefile*" "*.cpp"' | sed 's/" /" -or -name /g'`

CSCOPE_DIR=~/CSCOPE
echo "--------Start Scanning---------"
for d in $genfolder
do
    echo "Scanning... $d"
    mkdir -p $CSCOPE_DIR/$d
    eval "find $d -type f \\( ! -path '*/.*' \\) -and \\( $exgentype \\) > $CSCOPE_DIR/$d/cscope.files"
    sed -i -e 's/^/"/g' $CSCOPE_DIR/$d/cscope.files
    sed -i -e 's/$/"/g' $CSCOPE_DIR/$d/cscope.files
    cscope -bkq -i $CSCOPE_DIR/$d/cscope.files -f $CSCOPE_DIR/$d/cscope.out
done
echo "--------Finish Scanning---------"
