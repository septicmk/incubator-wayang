package test;

import org.apache.wayang.api.JavaPlanBuilder;
import org.apache.wayang.basic.data.Tuple2;
import org.apache.wayang.core.api.Configuration;
import org.apache.wayang.core.api.WayangContext;
import org.apache.wayang.core.optimizer.cardinality.DefaultCardinalityEstimator;
import org.apache.wayang.java.Java;
import org.apache.wayang.spark.Spark;

import java.util.Collection;
import java.util.Arrays;

public class WordCount {

    public static void main(String[] args) {

        /* Create a Wayang context and specify the platforms Wayang will consider */
        WayangContext wayangContext = new WayangContext(new Configuration())
                .withPlugin(Java.basicPlugin())
                .withPlugin(Spark.basicPlugin());
        
        /* Get a plan builder */
        JavaPlanBuilder planBuilder = new JavaPlanBuilder(wayangContext)
                .withJobName("WordCount")
                .withUdfJarOf(WordCount.class);

        /* Start building the Apache WayangPlan */
        Collection<Tuple2<String, Integer>> wordcounts = planBuilder
                /* Read the text file */
                .readTextFile(args[0]).withName("Load file")

                /* Split each line by non-word characters */
                .flatMap(line -> Arrays.asList(line.split("\\W+")))
                .withName("Split words")

                /* Filter empty tokens */
                .filter(token -> !token.isEmpty())
                .withName("Filter empty words")
                /* you can also specify the desired platform per operator */
                //.withTargetPlatform(Java.platform())

                /* Attach counter to each word */
                .map(word -> new Tuple2<>(word.toLowerCase(), 1)).withName("To lower case, add counter")

                /* Sum up counters for every word. */
                .reduceByKey(
                        Tuple2::getField0,
                        (t1, t2) -> new Tuple2<>(t1.getField0(), t1.getField1() + t2.getField1())
                )
                .withName("Add counters")

                /* Execute the plan and collect the results */
                .collect();

        System.out.println(wordcounts);
    }
}

