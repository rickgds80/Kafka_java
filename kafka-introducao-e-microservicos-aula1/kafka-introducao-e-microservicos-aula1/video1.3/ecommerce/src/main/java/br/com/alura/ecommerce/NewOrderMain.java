package br.com.alura.ecommerce;

import java.math.BigDecimal;
import java.util.UUID;
import java.util.concurrent.ExecutionException;


/* Producer - simulando novas ordens de pedido */
public class NewOrderMain {

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        try (var dispatcher = new KafkaDispatcher()) {
            for (var i = 0; i < 10; i++) {

                var key = UUID.randomUUID().toString();

                double valor = Math.random();
                var value = key + ",prod: " + valor;
                dispatcher.send("ECOMMERCE_NOVO_PEDIDO", key, value);

                var email = "Obrigado por comprar conosco! Estamos processando o seu pedido!";
                dispatcher.send("ECOMMERCE_SEND_EMAIL", key, email);
            }
        }
    }

}
