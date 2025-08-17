# Implementação Prática e Ferramentas

## 📌 Da teoria à prática

Depois de entender **modelagem, normalização e teoria relacional**, chega o momento de **implementar**.
A prática começa escolhendo o **SGBD** e colocando o modelo em funcionamento.
Aqui, cada ferramenta tem seu espaço e suas peculiaridades.

---

## 🗄️ PostgreSQL — O Canivete Suíço Relacional

* Banco relacional **orientado a objetos**.
* Código aberto, mais de **30 anos de desenvolvimento**.
* Reconhecido por **confiabilidade e robustez**.
* Suporte a **SQL + JSON** (mistura de relacional com flexibilidade NoSQL).

### Exemplo prático:

```bash
# Entrar no usuário postgres
$ sudo -i -u postgres

# Acessar o shell
$ psql
```

Criando e removendo um banco:

```sql
CREATE DATABASE trolii;
DROP DATABASE IF EXISTS trolii;
```

Criando usuário e tabela:

```sql
CREATE USER trolii WITH PASSWORD 'senhasegura';
CREATE TABLE aluno (id INT NOT NULL, nome VARCHAR(120) NOT NULL);
```

Comandos úteis:

* `\dt` → lista tabelas
* `\d aluno` → descrição da tabela
* `\c test` → conectar a outro DB

👉 Ideal para: **sistemas críticos**, SaaS complexos, aplicações que pedem consistência.

---

## 📱 SQLite — O Minimalista Onipresente

* Armazena tudo em **um único arquivo** `.db`.
* Não precisa de servidor → leve, portátil, roda em celulares, IoT, até aviões.
* Simplicidade extrema → perfeito para protótipos e aplicações locais.

### Exemplo prático:

```bash
# Criar banco teste.db
$ sqlite3 teste.db
```

Criando tabela:

```sql
CREATE TABLE aluno (
   id INTEGER PRIMARY KEY,
   nome TEXT
);
```

CRUD:

```sql
INSERT INTO aluno VALUES (1, 'Maria');
SELECT * FROM aluno;
DELETE FROM aluno WHERE id=1;
```

👉 Ideal para: **mobile, desktop leve, protótipos rápidos**.

---

## 🐬 MySQL — Popular e Eficiente

* Um dos bancos mais usados no mundo.
* Simples de instalar, forte em **aplicações web**.
* Bom desempenho para grande volume de leituras.

### Exemplo prático:

```bash
# Acessar mysql
$ sudo mysql

# Criar DB e usar
mysql> CREATE DATABASE teste;
mysql> USE teste;
```

Criando tabela:

```sql
CREATE TABLE aluno (
  id INT NOT NULL,
  nome VARCHAR(120) NOT NULL
);
```

CRUD:

```sql
INSERT INTO aluno VALUES (1, 'João');
SELECT * FROM aluno;
DELETE FROM aluno WHERE id=1;
```

👉 Ideal para: **websites, sistemas ERP simples, aplicações com alto volume de leitura**.

---

## 📦 MongoDB — O Rebelde Flexível (NoSQL)

* Banco de documentos → dados armazenados em **JSON-like**.
* Escalabilidade horizontal nativa (fácil distribuir em vários servidores).
* Sem esquema rígido → **flexibilidade** para dados variados.

👉 Ideal para: **logs em tempo real, redes sociais, dados semi-estruturados**.

---

## ⚙️ ORM — O Atalho do Dev

* ORM (**Object Relational Mapping**) permite usar **objetos** no lugar de SQL.
* Exemplo em Python (Django/SQLAlchemy):

```python
User.create(name="Ana", email="ana@email.com")
```

### ✅ Vantagens:

* Menos código repetitivo (CRUD rápido).
* Portabilidade entre bancos (MySQL ↔ PostgreSQL).
* Proteção básica contra SQL Injection.

### ❌ Desvantagens:

* Perda de performance em queries complexas.
* Dependência da abstração (difícil tunar).
* Pode esconder a lógica real do SQL.

👉 Use ORM para **produtividade inicial**, mas **não abra mão de aprender SQL**.

---

## 🔄 Migrações e Versionamento

Em qualquer banco, mudanças no schema precisam ser **controladas**.
Ferramentas: **Alembic (Python), Flyway, Liquibase**.

Boas práticas:

1. Versione cada alteração.
2. Teste em **staging** antes da produção.
3. Tenha sempre **backup automático**.

---

## ✅ Resumo

* **Postgres:** robustez, flexibilidade relacional + JSON.
* **SQLite:** simplicidade e portabilidade extrema.
* **MySQL:** popularidade e força em web.
* **MongoDB:** escalabilidade e flexibilidade não-relacional.
* **ORMs:** produtividade, mas cuidado com o “piloto automático”.
* **Migrações:** disciplina para evolução sem quebrar o sistema.