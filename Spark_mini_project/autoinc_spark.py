#!/usr/bin/env python
# coding: utf-8

# In[23]:


import findspark
findspark.init()
import pyspark
findspark.find()


# In[24]:


from pyspark.sql import SparkSession


# In[25]:


from operator import add


# In[26]:


spark = SparkSession.builder.appName("appName").getOrCreate()


# In[36]:


raw_rdd = spark.sparkContext.textFile("C:\SpringBoard\Spark_Mini_Project\data.csv")


# In[75]:


vin_kv=raw_rdd.map(lambda x:((x.split(",")[2]),(x.split(",")[3],x.split(",")[5],x.split(",")[1])))


# In[74]:


#print(vin_kv)


# In[76]:


enhance_make_year=vin_kv.groupByKey().mapValues(lambda x:list(x)).flatMap(lambda x: [(item[0],item[1]) for (item) in x[1]]).filter(lambda x:x[0]!="" and x[1]!="")


# In[77]:


#print(enhance_make_year)


# In[58]:


# Map to get a RDD of ((make, year),1)
make_year=enhance_make_year.map(lambda x: ((x[0],x[1]),1))


# In[59]:


# ReduceByKey to count the number of accidents per make and year
accident_rec_per_year=make_year.reduceByKey(add)


# In[60]:


# A new RDD created using map to get the output in specific format 
accident_rec_per_year_frmt=accident_rec_per_year.map(lambda i:i[0][0]+"-"+i[0][1]+","+str(i[1]))


# In[50]:


#print(accident_rec_per_year_frmt)


# In[62]:


# Save the final RDD 'accident_rec_per_year' as text file
accident_rec_per_year_frmt.saveAsTextFile("accident_records_count")


# In[ ]:




