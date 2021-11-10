General Info
This project is Spark Optimization Mini Project that will optimize existing Pyspark code to improve its performance.

Description
Spark can give you a tremendous advantage when it comes quickly processing massive datasets. However, the tool is only as powerful as the one who wields it. Spark performance can become sluggish if poor decisions are made in the layout of the code and the functions that are chosen.

Technologies
Project is created with:
Python 3.7+
Spark2

Step 1: For each method, restart spark and submit the spark job using following command:

spark-submit --master spark://192.168.0.2:7077 optimize.py
Step 2: Get the duration of completed job at Spark webui (localhost:8080)

Step 3: Repeat step 1 and 2 N times (N = 5) in this experiment

Step 4: Collect the results and compute the average runtime


Analysis
Changing join order would not improve the performance in this case. The reason is the sizes of two tables are similar.
The default no of partitions in Spark is 200 reduced to 4 to avoid more shuffles in the join. But that didn't improve the performance.
Caching dataframe improve the performance neraly two times. The reason is cach work best for small dataset and standalone server where master and worker nodes locate in the same physical machine.