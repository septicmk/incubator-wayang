#!/bin/bash

# Update system
apt-get update
apt-get upgrade

# Install Java
#sudo apt-get install openjdk-8-jdk

# Verify Java installation
#java -version

# Install Scala
#apt-get install scala

# Verify Scala installation
#scala -version

# Download Hadoop
#wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
wget https://archive.apache.org/dist/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz

# Extract Hadoop
tar xvf hadoop-3.2.0.tar.gz

# Set Hadoop environment variables
echo 'export HADOOP_HOME=$HOME/hadoop-3.3.0' >> ~/rheem/wayang.sh
echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/rheem/wayang.sh
source ~/rheem/wayang.sh

# Download Spark
#wget https://downloads.apache.org/spark/spark-3.4.0/spark-3.4.0-bin-hadoop2.7.tgz
wget https://www.apache.org/dyn/closer.lua/spark/spark-3.2.4/spark-3.2.4-bin-hadoop3.2.tgz

# Extract Spark
tar xvf spark-3.2.4-bin-hadoop3.2.tgz

# Set Spark environment variables
#echo 'export SPARK_HOME=$HOME/spark-3.4.0-bin-hadoop2.7' >> ~/rheem/wayang.sh
#echo 'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' >> ~/rheem/wayang.sh
source ~/rheem/wayang.sh

# Verify installation
hadoop version
spark-shell

