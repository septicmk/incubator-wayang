export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
#export WAYANG_HOME=/root/rheem/incubator-wayang/wayang-assembly/target/wayang-assembly-0.6.1-SNAPSHOT-dist/wayang-0.6.1-SNAPSHOT
export WAYANG_HOME=/root/rheem/incubator-wayang/wayang-assembly/target/wayang-0.6.1-SNAPSHOT
export PATH=$PATH:${WAYANG_HOME}/bin

export HADOOP_HOME=$HOME/rheem/hadoop-3.2.0
export PATH=$PATH:$HADOOP_HOME/bin
export SPARK_HOME=$HOME/rheem/spark-3.2.4-bin-hadoop3.2
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
