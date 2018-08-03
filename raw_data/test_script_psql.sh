#!/usr/bin/env bash

psql -U hamid -d postgres -c "INSERT INTO test_table2 VALUES ( 6, 'SMITH'); INSERT INTO test_table3 VALUES ( 123,'AUS');"