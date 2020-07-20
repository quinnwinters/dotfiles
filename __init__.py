try: 
    from pyspark.rdd import RDD
except ImportError:
    raise ImportError("Could not import pyspark.rdd.RDD. Please configure pyspark")


