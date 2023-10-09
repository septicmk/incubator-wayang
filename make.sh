#mvn clean compile
#./mvnw clean
#./mvnw clean package -pl :wayang-assembly -Pdistribution
#./mvnw package -Pstandalone
mvn package -Pstandalone -DskipTests
