file=$1

#sed -e '1d' -e '$d' -e 's/^.\{9\}//' -e 's/.\{2\}$//' test.hex | od -w4  -a -An -v | awk '{print $3$4$1$2}'
#sed -e '1d' -e '$d' -e 's/^.\{9\}//' -e 's/.\{3\}$//' $file | awk 'BEGIN{line = "" }{line = line $0}END{print line}' | od -w4  -a -An -v
sed -e '1d' -e '$d' -e 's/^.\{9\}//' -e 's/.\{3\}$//' $file | awk 'BEGIN{line = "" }{line = line $0}END{print line}' | od -w4  -a -An -v | sed '$d' | awk '{print $3$4$1$2}'
