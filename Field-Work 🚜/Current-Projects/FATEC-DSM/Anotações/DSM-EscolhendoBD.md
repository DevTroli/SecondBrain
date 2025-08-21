# 🧭 Capítulo 7: Escolhendo o Banco de Dados — Perguntas Que Salvam Projetos

A essa altura já vimos **conceitos, práticas e ferramentas**. Mas chega o momento da pergunta crucial: *qual banco escolher?*

Spoiler: **não existe resposta única**. O que existe são critérios para tomar uma decisão consciente — e não baseada em hype ou na moda do momento.

## 🔑 Perguntas-Chave

1. **Qual é a natureza dos dados?**

   * Estruturados, com regras rígidas → **SQL**.
   * Flexíveis, semi-estruturados (JSON, logs) → **NoSQL**.

2. **Qual é o volume esperado?**

   * Milhares de registros → SQLite já resolve.
   * Milhões/dia → pense em PostgreSQL ou Cassandra

3. **Qual é a necessidade de consistência?**

   * Bancos e finanças exigem **ACID** → SQL.
   * Redes sociais podem lidar com inconsistências eventuais → NoSQL.

4. **Qual é a expertise da equipe?**

   * Se ninguém domina Postgres, talvez MySQL seja mais prático.
   * Se o time já trabalha com Node.js, MongoDB pode acelerar.

5. **Precisa de alta disponibilidade?**

   * Replicação e failover automáticos → PostgreSQL e Cassandra são fortes.
   * Apps locais ou offline → SQLite brilha.

---

## 🎯 Regra de Ouro

Não existe banco de dados “certo”. Existe banco **adequado ao problema**.
Muitos sistemas modernos misturam tecnologias:

* SQL para dados críticos.
* NoSQL para dados de alta escala ou flexibilidade.

Isso não é “traição” a nenhuma tecnologia, é apenas **pragmatismo**.

---

# ✅ Conclusão: Navegando Entre Mitos e Realidades

Bancos de dados são o **alicerce invisível** de qualquer sistema. Da simplicidade do SQLite à robustez do PostgreSQL e à flexibilidade do MongoDB, cada escolha carrega **forças e limitações**.

O grande erro é cair em extremos:

* **Supernormalizar** até que cada consulta vire um quebra-cabeça.
* Ou **desorganizar** em NoSQL, acreditando que “esquema flexível” resolve tudo.

A jornada correta é de **equilíbrio**:

* Entenda o contexto.
* Prototipe antes de decidir.
* Domine os fundamentos (SQL, modelo relacional, normalização).
* Use abstrações (ORMs) com consciência — mas nunca como muleta eterna.

No fim, bancos de dados não são sobre tabelas, índices ou replicação.
São sobre **confiar nos dados** que sustentam negócios, pesquisas, produtos e até decisões pessoais.

Como Alan Kay disse:

> *“O melhor jeito de prever o futuro é inventá-lo.”*

Escolha o banco de dados que não apenas **resolva hoje**, mas que permita evoluir amanhã.
Esse é o verdadeiro poder de quem sabe navegar no labirinto de dados.