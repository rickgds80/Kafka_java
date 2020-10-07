package br.com.alura.ecommerce;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.time.Duration;
import java.util.Collections;
import java.util.Properties;
import java.util.regex.Pattern;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

/* grava log em arquivo */
public class LogService2 {

    public static void main(String[] args) {
        var consumer = new KafkaConsumer<String, String>(properties());
        consumer.subscribe(Pattern.compile("ECOMMERCE.*"));
        while(true) {
            var records = consumer.poll(Duration.ofMillis(100));
            if (!records.isEmpty()) {

                String path = "C:\\Users\\User\\Desktop\\kafka\\app2.log";
                String content = "Encontrei " + records.count() + " registros\n";

                try (FileWriter writer = new FileWriter(path, true);
                     BufferedWriter bw = new BufferedWriter(writer)) {

                        /*System.out.println("Encontrei " + records.count() + " registros");*/

                            for (var record : records) {
                               /* System.out.println("------------------------------------------");*/
                                content = content + "------------------------------------------\n";
                                /*System.out.println("LOG: " + record.topic());*/
                                content = content + "LOG: " + record.topic() + "\n";
                                /*System.out.println(record.key());*/
                                content = content + "Chave: " + record.key() + "\n";
                                /*System.out.println(record.value());*/
                                content = content + "Valor: " + record.value() + "\n";
                                /*System.out.println(record.partition());*/
                                content = content + "Particao: " + record.partition() + "\n";
                               /* System.out.println(record.offset());*/
                                content = content + "Offset: " + record.offset() + "\n";
                                content = content + "Tempo: " + record.timestamp() + "\n";
                                bw.write(content);
                    }


                } catch (IOException e) {
                    e.printStackTrace();
                }



            }
        }
    }

    private static Properties properties() {
        var properties = new Properties();
        properties.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.setProperty(ConsumerConfig.GROUP_ID_CONFIG, LogService.class.getSimpleName());
        return properties;
    }
}
