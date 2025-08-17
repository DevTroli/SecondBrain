# ASCII, Binário e Hexadecimal

## 🎯 O Bit: Axioma Base de Todo Software

**Definição**: O bit (binary digit) é a menor unidade de informação em computação, podendo assumir apenas dois estados: 0 ou 1.

Todo software, desde o mais simples "Hello World" até sistemas complexos como o kernel do Linux, é fundamentalmente construído sobre este axioma binário. Não existe computação sem a dualidade bit.

## 🔧 Sistemas de Representação

**ASCII (American Standard Code for Information Interchange)**:
- Padrão criado em 1963 para codificar caracteres em 7 bits
- Permite representar 128 caracteres (2^7)
- Base para comunicação entre sistemas diferentes

**Sistema Binário**:
- Base matemática de toda computação digital
- Cada posição representa uma potência de 2

**Sistema Hexadecimal**:
- Base 16, usando dígitos 0-9 e letras A-F
- Cada dígito hex representa 4 bits
- Facilita leitura de endereços de memória e códigos de cor

## 💻 Aplicação Prática

**Exemplo**: A palavra "Hi" em diferentes representações:

```
ASCII: H = 72, i = 105
Binário: H = 01001000, i = 01101001  
Hexadecimal: H = 0x48, i = 0x69
```

**Uso do Hexadecimal**:
- Endereços de memória: `0x7FFF5FBFF6AC`
- Códigos de cor web: `#FF5733` (vermelho-alaranjado)
- Debugging e dumps de memória

## 🧠 Por Que Isso Importa?

Compreender estes sistemas é fundamental porque:
- **Debugging**: Erros muitas vezes aparecem em hex/binário
- **Performance**: Operações bit-level são as mais rápidas
- **Compatibilidade**: ASCII ainda é base de protocolos modernos
- **Segurança**: Exploits frequentemente manipulam bits diretamente

---
💡 **Insight**: Quando você vê `0xFF` em código, não é apenas um número - é 11111111 em binário, representando todos os bits ligados, frequentemente usado como máscara para operações bit-wise.

# Álgebra Booleana & Lógica Binária : 0 e 1
**Axioma fundamental:** Só existem duas possibilidades - verdadeiro ou falso.

## 🔧 **Operações Básicas**

| Operação  | Símbolo | Exemplo   |
| --------- | ------- | --------- |
| AND (E)   | ∧       | 1 ∧ 1 = 1 |
| OR (OU)   | ∨       | 0 ∨ 1 = 1 |
| NOT (NÃO) | ¬       | ¬1 = 0    |

**Fato crucial:** NAND e NOR são *funcionalmente completos* - qualquer função lógica pode ser construída só com eles.

## 💻 **Por Que Computadores Usam Binário?**
**Resposta física:** Circuitos elétricos têm dois estados estáveis:
- **1:** Corrente passa
- **0:** Corrente não passa

**Vantagem:** Mais confiável que sistemas com múltiplos níveis.

> [!NOTE]
> Boole criou isso em 1854 - 100 anos antes do primeiro computador digital!


## 💻 **Por Que Binário? (Análise de Shannon)**

**Tese de Claude Shannon (1937):** Circuitos elétricos implementam álgebra booleana perfeitamente.

**Vantagens físicas:**
- **Resistência a ruído:** Grande diferença entre 0V e 5V
- **Velocidade:** Transições rápidas entre estados
- **Simplicidade:** Circuitos mais simples que sistemas multi-valued

**Alternativas tentadas e abandonadas:**
- **Ternário:** Soviéticos tentaram (Setun computer)
- **Decimal:** IBM 702 usava BCD
- **Analógico:** Computadores diferenciais

## ⚡  Fundamentos Matemáticos

**Sistema axiomático completo:** 3 operações básicas geram todas as outras.

**Axiomas de Huntington (1904):**
```
1. Fechamento: A ∧ B ∈ {0,1}
2. Comutatividade: A ∧ B = B ∧ A  
3. Distributividade: A ∧ (B ∨ C) = (A ∧ B) ∨ (A ∧ C)
4. Identidade: A ∧ 1 = A, A ∨ 0 = A
5. Complemento: A ∧ ¬A = 0, A ∨ ¬A = 1
```

