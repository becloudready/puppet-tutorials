#/bin/bash

type=`cat a.cfg | cut -d' ' -f1`
options=`cat a.cfg | cut -d' ' -f2`

/bin/mount -t $type -o $options $1 $2

