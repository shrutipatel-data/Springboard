hadoop jar usrhdpcurrenthadoop-mapreduce-clienthadoop-streaming.jar 
-file homehdfsautoinc_mapper1.py    -mapper homehdfsautoinc_mapper1.py 
-file homehdfsautoinc_reducer1.py   -reducer homehdfsautoinc_reducer1.py 
-input hadoopminiprkdata.csv 
-output output