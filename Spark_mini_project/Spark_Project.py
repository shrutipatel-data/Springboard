import findspark
findspark.init()
import pyspark as sp
findspark.find()

#Initiate Spark Context
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession

sc = sp.SparkContext(appName='myApp')
numeric_val= sc.parallelize([1,2,3,4,5], 5)
rddCollect = numeric_val.map(lambda x:x*x*x).collect()
print(rddCollect)
