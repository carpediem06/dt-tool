#!/bin/bash
#
# File: dts2dtb.sh
#

INDIR=dts
OUTDIR=dtb
mkdir -p ${OUTDIR}

for item in ./dts/*
do
  if [[ -f "$item" ]]; then
		echo -ne "$item\n"
		file=$(basename -- "$item")
		filename="${file%.*}"

		IDE=$filename
		SRC=${INDIR}/$IDE.dts
		TMP=$IDE.tmp.dts
		DST=${OUTDIR}/$IDE.dtb
		cpp -nostdinc -I include -undef -x assembler-with-cpp $SRC > $TMP
		dtc -O dtb -b 0 -o $DST $TMP
		rm $TMP
  fi
done



