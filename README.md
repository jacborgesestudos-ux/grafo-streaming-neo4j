# grafo-streaming-neo4j

# Modelagem de Dados em Grafos – Serviço de Streaming

Este projeto apresenta a modelagem de um grafo para um serviço de streaming utilizando Neo4j e Cypher.

## 📌 Entidades (Nós)

- User
- Movie
- Series
- Genre
- Actor
- Director

## 🔗 Relacionamentos

- (User)-[:WATCHED {rating}]->(Movie | Series)
- (Actor)-[:ACTED_IN]->(Movie | Series)
- (Director)-[:DIRECTED]->(Movie | Series)
- (Movie | Series)-[:IN_GENRE]->(Genre)

## 🧠 Descrição

O modelo permite representar usuários assistindo filmes e séries, avaliando-os, além de relacionar atores, diretores e gêneros aos conteúdos disponíveis na plataforma.

## ▶️ Execução

1. Abra o Neo4j Browser ou Neo4j Desktop
2. Copie o conteúdo do arquivo `streaming_graph.cypher`
3. Execute o script para criar constraints e popular o banco de dados

---

Projeto desenvolvido para fins acadêmicos.
