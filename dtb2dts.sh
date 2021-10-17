#!/bin/bash
#
# File: dtb2dts.sh
#

INDIR=dtb
OUTDIR=dts
mkdir -p ${OUTDIR}

for item in ./${INDIR}/*
do
  if [[ -f "$item" ]]; then
		echo -ne "$item\n"
		file=$(basename -- "$item")
		filename="${file%.*}"

		IDE=$filename
		SRC=${INDIR}/$IDE.dtb
		DST=${OUTDIR}/$IDE.dts
		dtc -I dtb -O dts ${SRC} > ${DST}
  fi
done



