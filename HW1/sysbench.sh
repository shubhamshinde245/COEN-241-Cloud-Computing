for i in {1..5}
do
	echo "Config 1, iteration $i"
	echo "CPU = 5000", Thread = 1, Time = 35
	sysbench cpu --cpu-max-prime=5000  --num-threads=1 --time=35 run
done

for j in {1..5}
do
        echo "Config 1, iteration $j"
        echo "CPU = 10000", Thread = 1, Time = 30
        sysbench cpu --cpu-max-prime=10000  --num-threads=1 --time=30 run
done

for k in {1..5}
do
        echo "Config 1, iteration $k"
        echo "CPU = 150000", Thread = 1, Time = 50
        sysbench cpu --cpu-max-prime=150000  --num-threads=1 --time=50 run

done
