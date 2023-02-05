for i in {1..5}
do
	sysbench --test=fileio --file-total-size=1G --test-mode=rndrw prepare
	sysbench --test=fileio --file-total-size=1G --file-test-mode=rndrw prepare
	echo "Config 1, iteration $i"
	echo "Threads = 1, size = 1gb, time = 30"
	sysbench --test=fileio --file-total-size=1G --time=30 --file-test-mode=rndrw run
	sysbench --test=fileio --file-total-size=1G --file-test-mode=rndrw cleanup
done

for j in {1..5}
do
        sysbench --test=fileio --file-total-size=2G --test-mode=rndrw prepare
        sysbench --test=fileio --file-total-size=2G --file-test-mode=rndrw prepare
        echo "Config 2, iteration $j"
        echo "Threads = 16, size = 2gb"
        sysbench --num-threads=16 --test=fileio --file-total-size=2G --file-test-mode=rndrw run
        sysbench --test=fileio --file-total-size=2G --file-test-mode=rndrw cleanup
done


for k in {1..5}
do
        sysbench --test=fileio --file-total-size=1G --test-mode=rndrw prepare
        sysbench --test=fileio --file-total-size=1G --file-test-mode=rndrw prepare
        echo "Config 3, iteration $k"
        echo "Threads = 20, size = 1gb"
        sysbench --num-threads=20 --test=fileio --file-total-size=1G --file-test-mode=rndrwrun
        sysbench --test=fileio --file-total-size=1G --file-test-mode=rndrw cleanup
done
