## 📌 O Modelo Relacional

* Criado por **Edgar F. Codd** nos anos 1970, mudou totalmente como pensamos dados.
* A ideia central: **organizar tudo em tabelas (relações)** → linhas (**tuplas**) e colunas (**atributos**).
* Cada tabela deve ter uma **chave primária** (PK) que identifica unicamente cada linha.
* Tabelas podem se conectar entre si por **chaves estrangeiras** (FK).

🔎 Exemplo simples:

* Tabela **Alunos**: (id, nome, curso\_id)
* Tabela **Cursos**: (id, nome)
* `curso_id` em Alunos é **FK** que aponta para **id** em Cursos.

## 🧮 Normalização

Normalização é o processo de **organizar colunas e tabelas** para reduzir redundâncias e inconsistências.
É como “limpar” o banco para evitar bagunça.

### 🔹 1FN — Primeira Forma Normal

* Cada célula só pode ter **um único valor** (sem listas, sem dados repetidos).
* Exemplo errado: `telefone = "9999-9999, 9888-8888"`
* Exemplo certo: criar tabela **Telefones** ligada ao aluno.

---

### 🔹 2FN — Segunda Forma Normal

* Atende à 1FN.
* Todos os atributos **dependem da chave primária inteira**, e não de parte dela.
* Problema típico: tabelas com **chaves compostas** (ex.: aluno\_id + curso\_id).

---

### 🔹 3FN — Terceira Forma Normal

* Atende à 2FN.
* Nenhum atributo deve depender de outro atributo que não seja a chave.
* Exemplo: se em uma tabela Alunos temos `cep → cidade`, isso deveria estar em outra tabela Endereços.

---

### 🔹 BCNF — Forma Normal de Boyce-Codd

* É como uma 3FN “mais rígida”.
* Resolve casos raros de dependências complexas.

---

## ⚖️ O Equilíbrio da Normalização

* **Benefícios:** consistência, menos redundância, dados mais organizados.
* **Cuidado:** excesso de normalização pode deixar o banco “engessado” e consultas lentas (muitos JOINs).
* **Prática comum:** normalizar até 3FN e, depois, **desnormalizar parcialmente** em casos de performance.

---

## 📚 Álgebra Relacional

* É a **base matemática** que garante que as operações no SQL façam sentido.
* Principais operações:

  * **σ (seleção):** filtrar linhas → `SELECT * FROM alunos WHERE curso_id=1;`
  * **π (projeção):** escolher colunas → `SELECT nome FROM alunos;`
  * **⋈ (junção):** combinar tabelas → `SELECT * FROM alunos JOIN cursos ON alunos.curso_id=cursos.id;`

Essas operações formam a lógica que sustenta qualquer consulta SQL.

---

## ✅ Resumo

* Modelo Relacional = **tabelas interligadas por chaves**.
* Normalização = **organizar para evitar bagunça** (1FN → 3FN → BCNF).
* Álgebra Relacional = **teoria que dá base ao SQL**.
* O equilíbrio está entre **teoria limpa** e **pragmatismo na prática**.
