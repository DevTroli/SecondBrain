# Capítulo 2: Padronização ANSI

## 🏛️ **ANSI: American National Standards Institute**

**Fundação:** 1918 - Coordena padrões nacionais americanos
**Papel em BD:** Estabeleceu arquitetura universal para sistemas de banco de dados

**Por que padronizar?**
- **Portabilidade:** Código funciona em diferentes SGBDs
- **Interoperabilidade:** Sistemas distintos se comunicam
- **Qualidade:** Padrões garantem consistência
- **Economia:** Reduz custos de treinamento e migração

## 🏗️ **Arquitetura ANSI/SPARC (1975)**

**SPARC:** Standards Planning and Requirements Committee

### **Nível 1: Esquema Interno (Físico)**
**Função:** Como os dados são fisicamente armazenados no storage.

**Responsabilidades:**
- Estruturas de armazenamento (B-trees, hash tables)
- Índices e clusters
- Compressão e criptografia
- Organização física dos arquivos

**Exemplo:**
```
Tabela CLIENTE armazenada como:
- Arquivo sequencial indexado
- Índice primário em ID_CLIENTE
- Índice secundário em NOME
- Blocos de 4KB no disco
```

### **Nível 2: Esquema Conceitual (Lógico)**
**Função:** Visão completa e integrada dos dados da organização.

**Características:**
- Único por organização
- Independente de aplicações específicas
- Define estrutura, restrições e relacionamentos
- Base para todos os esquemas externos

**Exemplo:**
```sql
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    data_cadastro DATE DEFAULT CURRENT_DATE
);
```

### **Nível 3: Esquema Externo (Visão)**
**Função:** Visões customizadas para diferentes usuários/aplicações.

**Características:**
- Múltiplos esquemas externos possíveis
- Subconjunto do esquema conceitual
- Personalizados por necessidade de negócio
- Controle de segurança e acesso

**Exemplo:**
```sql
-- Visão para departamento comercial
CREATE VIEW CLIENTE_VENDAS AS
SELECT nome, email, valor_total_compras
FROM CLIENTE c JOIN PEDIDOS p ON c.id = p.id_cliente;

-- Visão para suporte técnico (sem dados financeiros)
CREATE VIEW CLIENTE_SUPORTE AS  
SELECT nome, email, telefone, status_conta
FROM CLIENTE;
```

## 🔄 **Independência de Dados**

### **Independência Física**
**Definição:** Mudanças no nível físico não afetam os níveis superiores.

**Benefícios:**
- Trocar SGBD sem alterar aplicações
- Otimizar performance sem reescrever código
- Migrar para novas tecnologias de storage

**Exemplo:**
```
Mudança: HDD → SSD
Impacto no código da aplicação: ZERO
```

### **Independência Lógica**
**Definição:** Mudanças no esquema conceitual minimamente afetam esquemas externos.

**Benefícios:**
- Evolução do banco sem quebrar aplicações
- Adição de novos campos/tabelas transparente
- Refatoração de estruturas sem impacto nas views

## 📊 **Aplicação no Contexto dos 175 ZB**

**Problema de escala:** 175 × 10²¹ bytes requerem arquitetura distribuída.

**ANSI adaptado para Big Data:**

### **Nível Físico Distribuído**
- Sharding horizontal
- Replicação geográfica  
- Consistência eventual
- Storage engines otimizados (Cassandra, HBase)

### **Nível Conceitual Federado**
- Data lakes com schema-on-read
- Metadados centralizados
- Governança de dados global
- Lineage tracking

### **Nível Externo Especializado**
- APIs específicas por domínio
- Data marts temáticos
- Agregações pré-computadas
- Views materializadas

## 🌐 **Padrões ANSI Relevantes Hoje**

**SQL ANSI (ISO/IEC 9075):**
- SQL-86, SQL-89, SQL-92, SQL:1999, SQL:2003, SQL:2008, SQL:2016
- Portabilidade entre Oracle, PostgreSQL, SQL Server, MySQL

**Exemplo de portabilidade:**
```sql
-- Padrão ANSI - funciona em qualquer SGBD
SELECT c.nome, COUNT(p.id) as total_pedidos
FROM CLIENTE c 
LEFT JOIN PEDIDOS p ON c.id = p.id_cliente
GROUP BY c.nome
HAVING COUNT(p.id) > 5;
```

## 🔗 **Conexão com os 4 Pilares**

**ANSI operacionaliza a hierarquia DIKW:**
- **Nível Físico:** Armazena DADOS eficientemente
- **Nível Conceitual:** Estrutura dados em INFORMAÇÃO
- **Nível Externo:** Apresenta CONHECIMENTO contextualizado
- **Aplicações:** Implementam INTELIGÊNCIA de negócio

---
*💡 Insight: lembre-se ANSI não é burocracia - é a base que permite escalar de KB para ZB mantendo consistência.*