# 🏗️ **Capítulo 9: Os 7 Pilares da Orientação a Objetos**

## 1. Abstração - Focando no Essencial

**Definição:** Mostrar apenas o que importa, escondendo detalhes desnecessários.

**Exemplo do mundo real:** 
- Você dirige um carro sem precisar entender como o motor funciona
- Interface simples (volante, pedais) esconde complexidade interna

**No código:**
```c
struct Carro {
    char modelo[30];
    int velocidade;
    
    // Interface simples para o usuário
    void acelerar();
    void frear();
    void ligar();
};

// Usuário não precisa saber como acelerar() funciona internamente
// Só precisa saber que existe e como usar
```

**Por que importa:** Reduz complexidade mental, facilita uso.

## 2. Encapsulamento - Protegendo os Dados

**Definição:** Juntar dados e métodos, controlando o acesso a eles.

**Analogia:** Remédio tem uma bula. Você não pode simplesmente misturar os componentes - tem que seguir o protocolo seguro.

```c
struct ContaBancaria {
    // Dados privados (em C, convenção de nomenclatura)
    double _saldo;  // _ indica "privado"
    
    // Métodos públicos para acesso controlado
    void depositar(double valor);
    int sacar(double valor);  // Retorna 1 se sucesso, 0 se falha
    double consultar_saldo();
};

// Implementação protege regras de negócio
int sacar(struct ContaBancaria* conta, double valor) {
    if (valor > conta->_saldo) {
        return 0;  // Não pode sacar mais que tem
    }
    conta->_saldo -= valor;
    return 1;
}
```

**Benefício:** Evita estados inválidos, garante regras de negócio.

## 3. Herança - Reutilização Inteligente

**Definição:** Classe filha herda características da classe pai, podendo adicionar suas próprias.

**Exemplo hierárquico:**
```c
// Classe base
struct Veiculo {
    char marca[20];
    int ano;
    int velocidade_maxima;
    
    void acelerar();
    void frear();
};

// Classe derivada (herda de Veiculo)
struct Carro {
    struct Veiculo base;  // Herança em C (composição)
    int num_portas;
    int tem_ar_condicionado;
    
    void ligar_ar();  // Método específico de carro
};

struct Moto {
    struct Veiculo base;  // Mesma herança
    int cilindradas;
    
    void empinar();  // Método específico de moto
};
```

**Vantagem:** Evita duplicação, cria hierarquias lógicas.

## 4. Polimorfismo - Mesma Interface, Comportamentos Diferentes

**Definição:** Objetos diferentes respondem à mesma mensagem de formas diferentes.

**Exemplo com ponteiros para função (C):**
```c
struct Animal {
    char nome[20];
    void (*fazer_som)(struct Animal*);  // Ponteiro para função
};

// Implementações específicas
void som_cachorro(struct Animal* animal) {
    printf("%s faz: Au au!\n", animal->nome);
}

void som_gato(struct Animal* animal) {
    printf("%s faz: Miau!\n", animal->nome);
}

// Uso polimórfico
struct Animal rex = {"Rex", som_cachorro};
struct Animal mimi = {"Mimi", som_gato};

rex.fazer_som(&rex);   // Rex faz: Au au!
mimi.fazer_som(&mimi); // Mimi faz: Miau!
```

**Poder:** Mesmo código pode trabalhar com objetos diferentes.

## 5. Persistência - Objetos que Sobrevivem

**Definição:** Capacidade de manter estado dos objetos entre execuções do programa.

**Implementação simples:**
```c
// Salvar objeto em arquivo
void salvar_usuario(struct Usuario* user, FILE* arquivo) {
    fwrite(user, sizeof(struct Usuario), 1, arquivo);
}

// Carregar objeto de arquivo
struct Usuario carregar_usuario(FILE* arquivo) {
    struct Usuario user;
    fread(&user, sizeof(struct Usuario), 1, arquivo);
    return user;
}
```

**Por que importa:** Dados não se perdem quando programa fecha.

## 6. Classes - Os Moldes dos Objetos

**Definição:** Template que define características e comportamentos que objetos desse tipo terão.

```c
// Classe = struct + funções relacionadas
struct Pessoa {
    char nome[50];
    int idade;
    double altura;
};

// "Construtor" - inicializa objeto
struct Pessoa criar_pessoa(char* nome, int idade, double altura) {
    struct Pessoa p;
    strcpy(p.nome, nome);
    p.idade = idade;
    p.altura = altura;
    return p;
}

// Uso
struct Pessoa joao = criar_pessoa("João", 25, 1.75);
struct Pessoa maria = criar_pessoa("Maria", 30, 1.68);
```

**Analogia:** Classe é a forma de biscoito, objetos são os biscoitos feitos.

## 7. Métodos - Ações que Objetos Sabem Fazer

**Definição:** Funções que operam sobre os dados de um objeto específico.

```c
struct Calculadora {
    double memoria;
};

// Métodos da calculadora
double somar(struct Calculadora* calc, double a, double b) {
    double resultado = a + b;
    calc->memoria = resultado;  // Salva na memória
    return resultado;
}

double recuperar_memoria(struct Calculadora* calc) {
    return calc->memoria;
}

void limpar_memoria(struct Calculadora* calc) {
    calc->memoria = 0.0;
}
```

**Diferença de função normal:** Método sempre trabalha com dados de um objeto específico.
