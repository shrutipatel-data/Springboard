hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar \
-file /project/autoinc_mapper1.py    -mapper /project/autoinc_mapper1.py \
-file /project/autoinc_reducer1.py   -reducer /project/autoinc_reducer1.py \
-input /input/data.csv \
-output /output

