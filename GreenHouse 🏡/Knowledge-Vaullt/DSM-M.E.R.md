# Modelagem Conceitual (MER)

## 🎯 **O Que É Modelagem Conceitual?**

**Definição:** Representação abstrata das regras de negócio em estruturas de dados, independente de implementação técnica.

**Objetivo:** Capturar O QUE o sistema precisa armazenar, não COMO será armazenado.

**Analogia:** É como a planta arquitetônica de uma casa - define espaços e relações antes de pensar em material de construção.

## 🏗️ **Modelo Entidade-Relacionamento (MER)**

**Criado por:** Peter Chen (1976)
**Propósito:** Linguagem visual universal para modelar dados

### **Componentes Fundamentais:**

## 📦 **1. Entidades**

**Definição:** "Coisa" do mundo real que pode ser identificada e sobre a qual queremos armazenar informações.

**Características:**
- Têm existência independente
- Possuem atributos que as descrevem
- Podem se relacionar com outras entidades

**Tipos:**

### **Entidade Forte:**
```
┌─────────────┐
│   CLIENTE   │  ← Existe independentemente
└─────────────┘
```

### **Entidade Fraca:**
```
╔═════════════╗
║  DEPENDENTE ║  ← Só existe se CLIENTE existir
╚═════════════╝
```

**Exemplos práticos:**
- **E-commerce:** CLIENTE, PRODUTO, PEDIDO
- **Escola:** ALUNO, PROFESSOR, DISCIPLINA
- **Hospital:** PACIENTE, MÉDICO, CONSULTA

## 🏷️ **2. Atributos**

**Definição:** Propriedades que descrevem uma entidade.

### **Classificações:**

**Por Cardinalidade:**
```
○ nome        ← Simples (valor único)
⊙ telefones   ← Multivalorado (vários valores)
```

**Por Divisibilidade:**
```
○ nome           ← Atômico
⟟ endereco       ← Composto
  ├── rua
  ├── numero  
  ├── cidade
  └── cep
```

**Por Origem:**
```
○ data_nascimento    ← Armazenado
⊙ idade              ← Derivado (calculado)
```

**Por Obrigatoriedade:**
```
● cpf                ← Obrigatório (NOT NULL)
○ telefone_opcional  ← Opcional
```

### **Chave Primária:**
```
Cliente
├── ⬢ cpf           ← Chave primária (identifica unicamente)
├── ● nome
├── ○ email
└── ○ telefone
```

## 🔗 **3. Relacionamentos**

**Definição:** Associações entre entidades que representam regras de negócio.

### **Representação Visual:**
```
┌─────────┐    ◇───────◇    ┌──────────┐
│ CLIENTE │────  REALIZA  ────│  PEDIDO  │
└─────────┘                  └──────────┘
```

### **Cardinalidades:**

**1:1 (Um para Um):**
```
PESSOA ────1:1──── PASSAPORTE
"Cada pessoa tem exatamente um passaporte"
```

**1:N (Um para Muitos):**
```
CLIENTE ────1:N──── PEDIDO  
"Um cliente pode fazer vários pedidos"
```

**N:M (Muitos para Muitos):**
```
PRODUTO ────N:M──── CATEGORIA
"Um produto pode ter várias categorias,
uma categoria pode ter vários produtos"
```

### **Participação:**
```
CLIENTE ════════ PEDIDO     ← Total (todo cliente DEVE ter pedido)
CLIENTE ──────── FEEDBACK   ← Parcial (cliente pode não dar feedback)
```

## 🔧 **4. Atributos de Relacionamento**

**Quando usar:** Relacionamento N:M com informações específicas da associação.

**Exemplo:**
```
       quantidade, data_adicao
PRODUTO ──────N:M────── PEDIDO
```

## 🎨 **Exemplo Completo: Sistema de E-commerce**

```
                 data_pedido, valor_total
    ┌─────────┐        ◇─────────◇        ┌──────────┐
    │ CLIENTE │─────── REALIZA ─────────│  PEDIDO  │
    └─────────┘                         └──────────┘
    ● cpf                               ● id_pedido
    ● nome                              ○ observacoes  
    ○ email                                   │
    ⊙ telefones                               │1:N
                                              │
                 quantidade, preco_unitario   │
           ┌──────────┐    ◇─────◇           │
           │ PRODUTO  │──── ITEM ──────────────
           └──────────┘                
           ● id_produto              
           ● nome                    
           ○ descricao               
           ⊙ categorias              
```

## ⚡ **Regras de Negócio em MER**

### **Restrições de Integridade:**

**Integridade de Entidade:**
- Chave primária não pode ser NULL
- Chave primária deve ser única

**Integridade Referencial:**
- Chave estrangeira deve existir na tabela referenciada
- Ou ser NULL (se permitido)

**Integridade de Domínio:**
- Valores devem respeitar tipo e restrições
- Ex: idade >= 0, email com formato válido

### **Exemplo de Restrições:**
```sql
-- Representação das regras em SQL
CREATE TABLE cliente (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    CONSTRAINT idade_valida 
        CHECK (data_nascimento <= CURRENT_DATE)
);
```

## 🔍 **Técnicas de Identificação**

### **1. Identificando Entidades:**
**Perguntas-chave:**
- Sobre o que precisamos armazenar informações?
- O que tem existência própria no negócio?
- O que pode ser identificado unicamente?

### **2. Identificando Atributos:**
**Perguntas-chave:**
- Que informações descrevem essa entidade?
- Quais dados são essenciais vs opcionais?
- O que é calculado vs armazenado?

### **3. Identificando Relacionamentos:**
**Perguntas-chave:**
- Como as entidades se conectam?
- Quais as regras de associação?
- Que informações surgem da associação?

## 🎯 **Boas Práticas de MER**

### **Nomenclatura:**
```
✅ Entidades: SUBSTANTIVOS (CLIENTE, PRODUTO)
✅ Relacionamentos: VERBOS (COMPRA, POSSUI)
✅ Atributos: qualificadores (nome_cliente, data_nascimento)
```

### **Granularidade:**
```
❌ Muito genérico: PESSOA
✅ Específico o suficiente: CLIENTE, FUNCIONARIO, FORNECEDOR
```

### **Normalização Conceitual:**
```
❌ Atributos repetitivos: telefone1, telefone2, telefone3
✅ Entidade separada: TELEFONE (multivalorado)
```

## 🔗 **Conexão com Arquitetura ANSI**

**MER é o Nível Conceitual puro:**
- **Independente** de SGBD específico
- **Independente** de implementação física  
- **Dependente** apenas das regras de negócio