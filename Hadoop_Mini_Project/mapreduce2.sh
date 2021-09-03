hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar \
-file /project/autoinc_mapper2.py    -mapper /project/autoinc_mapper2.py \
-file /project/autoinc_reducer2.py   -reducer /project/autoinc_reducer2.py \
-input /output/ \
-output /accidents_count_per_make
