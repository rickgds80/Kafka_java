#zookeeper start
C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows>zookeeper-server-start.bat C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\config\zookeeper.properties

cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows

#kafka start
C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows>kafka-server-start.bat ..\..\config\server.properties



cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows

#criar um topico
kafka-topics.bat --create --bootstrap-server localhost:2181 --replication-factor 1 --partitions 1 --topic ECOMMERCE_NEW_ORDER
kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic ECOMMERCE_NEW_ORDER

#listar topicos
kafka-topics.bat --list --zookeeper localhost:2181
###kafka-topics.bat --list --bootstrap-server localhost:2181


#describe dos topicos
kafka-topics.bat --bootstrap-server localhost:9092 --describe


#deletar
kafka-topics.bat --zookeeper localhost:2181 --delete --topic ECOMMERCE_NEW_ORDER




#produtor
kafka-console-producer.bat --broker-list localhost:9092 --topic teste

#consumidor
kafka-console-consumer.bat --topic teste --from-beginning --bootstrap-server localhost:9092

#consultar os grupos entrada e o já consumidor
kafka-consumer-groups.bat --bootstrap-server 127.0.0.1:9092 --list --command-config C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\config\consumer.properties
kafka-consumer-groups.bat --bootstrap-server 127.0.0.1:9092 --all-groups --command-config C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\config\consumer.properties --describe

 
 
#splunk start
C:\Program Files\Splunk\bin
splunk.exe start
splunk.exe status
splunk.exe stop
