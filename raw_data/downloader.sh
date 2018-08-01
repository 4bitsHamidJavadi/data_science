#!/usr/bin/env bash

start=203
end=228
i=$start
while [ $i -le $end ]
do 
wget 46.101.230.157/jds_may/day_$i
i=$((i+1))
done
