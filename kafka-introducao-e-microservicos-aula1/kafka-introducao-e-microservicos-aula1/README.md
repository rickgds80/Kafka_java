# Exemplo de Microservicos Java e Kafka
Este projeto serve como exemplo para uso de microservicos no kafka


Plataforma:
Windows (intellj)


# Uso

Ap�s subir o zookeeper e um cluster de kafka
Basta abrir no seu editor de java (recomendavel intellj) e rodar os servicos


# Descricao dos Servicos

Servico de Novo pedido: simula novos pedidos

Servico de e-mail: l� dos t�picos de novos pedidos e simula envio de e-mail

Servico de Fraude: simula a validacao de fraude a cada novo pedido

Servico de log: captura e gera logs de todos os servicos

Servico de log2: captura as logs e gera a sa�da em arquivo (necess�rio alterar o caminho do arquivo)# Kafka_java
