# 💻 **Capítulo 7.1: Objetos Computacionais - Do Mundo Real ao Digital**

## O Que São Objetos Computacionais?

Objetos computacionais são **representações digitais de entidades** que existem dentro da máquina. Diferente dos objetos físicos que você pode tocar, objetos computacionais existem apenas na memória do computador.

**Axioma fundamental:** Todo objeto computacional precisa ocupar memória e ter um endereço único no sistema.

### A Ponte Entre Dois Mundos

**Mundo Real:**
- Mesa (física, você pode tocar)
- Características: cor, tamanho, peso
- Ações: mover, usar para trabalhar

**Mundo Computacional:**
- Objeto `Mesa` (existe só na memória)
- Atributos: `cor`, `tamanho`, `peso` (como variáveis)
- Métodos: `mover()`, `usar()` (como funções)

### Por Que Isso Importa?

Quando você cria um objeto no código, está **materializando uma ideia abstrata em bits e bytes**. É como dar vida digital a conceitos do mundo real.

```c
// Exemplo simples em C
struct Mesa {
    char cor[20];
    int altura;
    int largura;
};

struct Mesa minhaMesa = {"marrom", 75, 120};
```

Agora `minhaMesa` existe na memória RAM, tem um endereço específico, e o computador "conhece" suas características.
