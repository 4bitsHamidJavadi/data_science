#!/usr/bin/env bash

start=1
end=242
i=$start
while [ $i -le $end ]
do
cat /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i >> reg_merged.csv
cat /home/hamid/WEEK1/TASK/raw_data/free_tree/free_tree_day_$i >> free_merged.csv
cat /home/hamid/WEEK1/TASK/raw_data/paid_tree/paid_tree_day_$i >> paid_merged.csv
i=$((i+1))
done