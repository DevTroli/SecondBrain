# 🔧 **Capítulo 7.2: Fundamentos de C - A Base de Tudo**

## Por Que Começar com C?

C é como aprender a dirigir com câmbio manual - mais difícil no início, mas você entende **como as coisas realmente funcionam** por baixo dos panos.

### Estrutura Básica - Anatomia de um Programa C

```c
#include <stdio.h>    // Biblioteca para entrada/saída
#include <conio.h>    // Biblioteca para console (Windows)

int main() {          // Função principal - sempre começa aqui
    printf("Hello World!");
    getch();          // Pausa para ver o resultado
    return 0;         // Programa terminou com sucesso
}
```

**Explicação linha por linha:**

1. **`#include <stdio.h>`** - "Importa" funções como `printf()` e `scanf()`
2. **`#include <conio.h>`** - Funções de console como `getch()` (específico Windows)
3. **`int main()`** - Onde seu programa realmente começa a executar
4. **`printf()`** - Mostra texto na tela
5. **`getch()`** - Espera você apertar qualquer tecla
6. **`return 0`** - Informa ao sistema que tudo deu certo

### Hexadecimal em C - Falando a Língua do Computador

**Por que hexadecimal?** Computadores pensam em binário (0s e 1s), mas hexadecimal é mais fácil para humanos lerem.

```c
#include <stdio.h>

int main() {
    int numero = 255;           // Decimal
    
    printf("Decimal: %d\n", numero);      // 255
    printf("Hexadecimal: %X\n", numero);  // FF
    printf("Hexadecimal: 0x%X\n", numero); // 0xFF
    
    // Definindo diretamente em hex
    int hex_number = 0xFF;      // Mesmo que 255
    printf("Hex definido: %d\n", hex_number); // 255
    
    return 0;
}
```

**Aplicação prática:** Endereços de memória, cores em programação gráfica, debugging.

### Memória e Ponteiros - Onde Objetos Vivem

```c
#include <stdio.h>

int main() {
    int idade = 25;
    
    printf("Valor: %d\n", idade);        // 25
    printf("Endereço: %p\n", &idade);    // Ex: 0x7fff5fbff61c
    
    return 0;
}
```

**Conceito-chave:** Todo objeto tem um **valor** (o que contém) e um **endereço** (onde está na memória).
