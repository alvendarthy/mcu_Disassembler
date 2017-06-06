file=$1
file_len=`stat --format=%s $file`

#echo $file length $file_len

hex_len=0

let "hex_len = $file_len -43"

#echo hex length $hex_len

od -w4 -j26 -a $file -N $hex_len -An -v | awk '{print $3$4$1$2}'
