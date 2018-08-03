#!/usr/bin/env bash

start=1
end=243
i=$start

while [ $i -le $end ]
do 
grep 'registration' day_$i > registration_event/reg_event_day_$i
grep 'sent_a_free_tree' day_$i > free_tree/free_tree_day_$i
grep 'sent_a_super_tree' day_$i > paid_tree/paid_tree_day_$i
i=$((i+1))
done

