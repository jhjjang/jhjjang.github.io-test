MEMINFO=`cat /proc/meminfo | grep 'MemTotal\|MemFree\|Buffers\|Cached'`
MEMTOTAL=`echo $MEMINFO | awk '{print $2}'`
MEMUSED=`echo $MEMINFO | awk '{print ($2-$5-$8-$11)}'`
MEMFREE=`echo $MEMINFO | awk '{print ($5+$8+$11)}'`

## 메모리 사용률
MEMUSEDRATE=`echo $MEMUSED $MEMTOTAL | awk '{printf "%.1f\n", $1/$2*100}'`

echo "MEMTOTAL=$MEMTOTAL / MEMUSED=$MEMUSED / MEMFREE=$MEMFREE / MEMUSEDRATE=${MEMUSEDRATE}%"

# php-fpm 갯수
count=`ps -ylC php-fpm --sort:rss | wc -l`
echo "php-fpm count : ${count}"

# php-fpm 1개 프로세스의 메모리점유율
pcnt=`ps --no-headers -o "rss,cmd" -C php-fpm | awk '{ sum+=$1 } END { printf ("%d%s\n", sum/NR/1024,"M") }'`
echo "php-fpm 1개 프로세스의 메모리점유율 : ${pcnt}"
