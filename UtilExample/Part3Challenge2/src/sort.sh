#!/bin/sh
#
# Basic sort of the file by key (start/end year in office)
#
. ./setenv.sh
hlq=`hlq`
in=${hlq}.CLIENT.ORIG.BIN
out=${hlq}.CLIENT.SORT.BIN

drm -f ${out}
dtouch -rfb -l170 -tseq ${out}
mvscmd --pgm=SORT --args='LIST' --sysout=* --sortin=${in} --sortout=${out} --sysin=stdin <<zz
 SORT FIELDS=(1,8,CH,A)
 SUM FIELDS=NONE
zz
