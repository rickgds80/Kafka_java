rem #zookeeper start
cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows
zookeeper-server-start.bat C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\config\zookeeper.properties


rem zookeeper-server-start.bat C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\config\zookeeper.properties & KAFKA_OPTS="$KAFKA_OPTS -javaagent:C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows\jmx_prometheus_javaagent-0.2.0.jar=7071:C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows\kafka-0-8-2.yml" 


rem #kafka start
cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows
kafka-server-start.bat ..\..\config\server.properties


rem #criar um topico
cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows

rem #criar um topico
kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic TESTE

rem #listar topicos
kafka-topics.bat --list --zookeeper localhost:2181

rem #describe dos topicos
kafka-topics.bat --bootstrap-server 127.0.0.1:9092 --describe



rem #produtor
cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows
kafka-console-producer.bat --broker-list localhost:9092 --topic TESTE

rem #consumidor
cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows
kafka-console-consumer.bat --topic TESTE --bootstrap-server localhost:9092
kafka-console-consumer.bat --topic TESTE --from-beginning --bootstrap-server localhost:9092


 rem # mostrar desenho da aplicacao
 rem #abrir Java
 


rem #consultar os grupos entrada e o consumidor
cd C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\bin\windows
kafka-consumer-groups.bat --bootstrap-server 127.0.0.1:9092 --list --command-config C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\config\consumer.properties
kafka-consumer-groups.bat --bootstrap-server 127.0.0.1:9092 --all-groups --command-config C:\kafka_2.13-2.6.0\kafka_2.13-2.6.0\config\consumer.properties --describe

