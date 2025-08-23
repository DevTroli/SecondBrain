# 🔄 **Capítulo 10: Tipos de Relacionamentos em POO**

## 1. Todo-Parte (Composição)

**Definição:** Um objeto é **composto** de outros objetos. Se o todo morre, as partes morrem também.

**Exemplo:**
```c
struct Motor {
    int cilindros;
    double potencia;
};

struct Pneu {
    char marca[20];
    double pressao;
};

struct Carro {
    struct Motor motor;      // Carro TEM UM motor
    struct Pneu pneus[4];    // Carro TEM pneus
    char modelo[30];
};

// Se o carro é destruído, motor e pneus também são
void destruir_carro(struct Carro* carro) {
    // Motor e pneus são automaticamente destruídos
    // porque estão "dentro" do carro
}
```

**Característica:** Relacionamento forte - partes não existem sem o todo.

## 2. Generalização-Especialização (Herança)

**Definição:** Classe filha É UM TIPO DE classe pai, mas com características adicionais.

**Exemplo:**
```c
// Generalização
struct Funcionario {
    char nome[50];
    double salario_base;
    void (*calcular_salario)(struct Funcionario*);
};

// Especializações
struct Gerente {
    struct Funcionario base;  // É UM funcionário
    double bonus_gerencia;    // Mas tem características extras
};

struct Vendedor {
    struct Funcionario base;  // É UM funcionário  
    double comissao;          // Mas tem características diferentes
    int vendas_mes;
};
```

**Regra:** Se você pode dizer "X é um tipo de Y", então X pode herdar de Y.

## 3. Agregação (Tem Um)

**Definição:** Um objeto USA outro objeto, mas ambos podem existir independentemente.

**Exemplo:**
```c
struct Professor {
    char nome[50];
    int id;
};

struct Turma {
    char disciplina[30];
    struct Professor* professor;  // Turma TEM UM professor
    int num_alunos;
};

// Professor pode existir sem turma
// Turma precisa de professor, mas professor não "pertence" à turma
```

**Diferença da composição:** Objetos têm vida independente.

## 4. Dependência (Usa)

**Definição:** Um objeto USA temporariamente outro objeto para realizar uma tarefa.

**Exemplo:**
```c
struct Documento {
    char conteudo[1000];
};

struct Impressora {
    char modelo[30];
    int toner;
};

// Documento USA impressora temporariamente
void imprimir_documento(struct Documento* doc, struct Impressora* imp) {
    if (imp->toner > 0) {
        printf("Imprimindo: %s\n", doc->conteudo);
        imp->toner--;
    }
}
```

**Característica:** Relacionamento temporário, só durante a operação.

## 5. Associação (Conhece)

**Definição:** Objetos mantêm referência um ao outro para colaborar.

**Exemplo:**
```c
struct Cliente {
    char nome[50];
    struct Pedido* pedidos[100];  // Cliente CONHECE seus pedidos
    int num_pedidos;
};

struct Pedido {
    int numero;
    struct Cliente* cliente;       // Pedido CONHECE seu cliente
    double valor;
};
```

**Característica:** Relacionamento bidirecionais, objetos se "conhecem".

## Resumo dos Relacionamentos

| Tipo | Força | Exemplo | Frase Chave |
|------|-------|---------|-------------|
| **Composição** | Muito forte | Carro-Motor | "É parte de" |
| **Herança** | Forte | Gerente-Funcionário | "É um tipo de" |
| **Agregação** | Média | Turma-Professor | "Tem um" |
| **Associação** | Fraca | Cliente-Pedido | "Conhece" |
| **Dependência** | Muito fraca | Documento-Impressora | "Usa" |
