#!/usr/bin/env bash

start=1
end=244
i=$start

while [ $i -le $end ]
do 
day=$i
ios=$( grep 'ios' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
andr=$( grep 'android' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
error=$( grep 'error' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
google=$( grep 'google' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
invite=$( grep 'invite_a_friend' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
article=$( grep 'article' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
paid=$( grep 'paid' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
germany=$( grep 'germany' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
brazil=$( grep 'brazil' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
us=$( grep 'united_states' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
sweden=$( grep 'sweden' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
philip=$( grep 'philippines' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
born197=$( grep '197' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
born198=$( grep '198' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
born199=$( grep '199' /home/hamid/WEEK1/TASK/raw_data/registration_event/reg_event_day_$i | wc -l )
super=$( grep 'sent_a_super_tree' /home/hamid/WEEK1/TASK/raw_data/paid_tree/paid_tree_day_$i | wc -l )
freetree=$( grep 'sent_a_free_tree' /home/hamid/WEEK1/TASK/raw_data/free_tree/free_tree_day_$i | wc -l )

echo "$day"$'\t'"$ios"$'\t'"$andr"$'\t'"$error"$'\t'"$google"$'\t'"$invite"$'\t'"$article"$'\t'"$paid"$'\t'"$germany"$'\t'"$brazil"$'\t'"$us"$'\t'"$sweden"$'\t'"$philip"$'\t'"$born197"$'\t'"$born198"$'\t'"$born199"$'\t'"$super"$'\t'"$freetree" >> /home/hamid/WEEK1/TASK/raw_data/daily_report_table.csv
i=$((i+1))
done
