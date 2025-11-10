### **1. Estrutura Básica de um Programa Java**
- Todo programa Java inicia com uma **classe pública** contendo o método `public static void main(String[] args)`.
- O método `main` é o **ponto de entrada** (entry point) da aplicação.
- Arquivos têm extensão `.java` e o nome do arquivo **deve ser idêntico** ao nome da classe pública.
- Estrutura típica:
  ```java
  public class NomeDaClasse {
      public static void main(String[] args) {
          // código aqui
      }
  }
  ```

---

### **2. Ciclo de Desenvolvimento: Compilação e Execução**

#### **2.1 Escrita do Código-Fonte**
- Código escrito em editor de texto ou IDE.
- Arquivo salvo com extensão `.java`.
- Utiliza conceitos de POO: classes, métodos, atributos, construtores.

#### **2.2 Compilação**
- Comando: `javac NomeDoArquivo.java`
- O compilador Java (`javac`) transforma o código-fonte em **bytecode**.
- Gera arquivo `.class` (bytecode intermediário).
- Bytecode é **independente de plataforma** (não é código de máquina nativo).

#### **2.3 Execução**
- Comando: `java NomeDaClasse` (sem extensão)
- A **JVM (Java Virtual Machine)** interpreta o bytecode.
- JVM converte bytecode em instruções específicas do sistema operacional.
- Pode usar:
  - **Interpretador:** execução linha por linha.
  - **JIT Compiler (Just-In-Time):** compila partes frequentemente executadas em tempo de execução para melhor desempenho.

---

### **3. Java Virtual Machine (JVM)**

#### **3.1 Função Principal**
- Executa o bytecode gerado pelo compilador.
- Atua como camada de abstração entre o bytecode e o hardware/SO.

#### **3.2 Características e Vantagens**
- **Portabilidade:** "Write Once, Run Anywhere" (WORA) - o mesmo bytecode roda em qualquer sistema com JVM.
- **Gerenciamento de Memória:** Garbage Collector (coleta de lixo) automática.
- **Segurança:** Verifica bytecode antes da execução, previne acessos indevidos.
- **Isolamento:** Aplicações rodam em ambiente controlado (sandbox).
- **Otimização:** JIT Compiler melhora performance em tempo de execução.

#### **3.3 Componentes da JVM**
- **Class Loader:** Carrega classes na memória.
- **Bytecode Verifier:** Valida segurança do código.
- **Execution Engine:** Interpreta/compila e executa o bytecode.
- **Runtime Data Areas:** Heap, Stack, Method Area, etc.

---

### **4. Programação Orientada a Objetos (POO)**

#### **4.1 Conceitos Fundamentais**

**Classe**
- Modelo/template que define estrutura e comportamento.
- Contém atributos (variáveis) e métodos (funções).

**Objeto**
- Instância concreta de uma classe.
- Criado com operador `new`.

**Encapsulamento**
- Proteção de dados através de modificadores de acesso (`private`, `protected`, `public`).
- Uso de getters e setters para controlar acesso aos atributos.

**Herança**
- Mecanismo de reutilização de código.
- Classe filha (`extends`) herda atributos e métodos da classe pai.
- Promove hierarquia e especialização.

**Polimorfismo**
- Capacidade de objetos assumirem múltiplas formas.
- **Sobrescrita (Override):** redefinir métodos herdados.
- **Sobrecarga (Overload):** múltiplos métodos com mesmo nome, parâmetros diferentes.

**Abstração**
- Simplificação destacando características essenciais.
- Classes abstratas e interfaces definem contratos.

**Interface**
- Contrato que define métodos a serem implementados.
- Classe pode implementar (`implements`) múltiplas interfaces.
- Todos os métodos são públicos e abstratos por padrão.

**Métodos**
- Definem comportamentos/ações da classe.
- Podem receber parâmetros e retornar valores.

---

### **5. Organização do Código**

#### **5.1 Pacotes (Packages)**
- Agrupam classes relacionadas em namespaces.
- Declaração: `package com.empresa.projeto;`
- Evitam conflitos de nomes e facilitam modularização.
- Estrutura de diretórios reflete estrutura de pacotes.

#### **5.2 Importação (Import)**
- Permite usar classes de outros pacotes.
- Sintaxe: `import java.util.Scanner;`
- Import estático: `import static java.lang.Math.*;`

---

### **6. Comandos e Ferramentas Essenciais**

| Comando | Função |
|---------|--------|
| `javac` | Compila arquivo `.java` → `.class` |
| `java` | Executa bytecode via JVM |
| `package` | Declara pacote da classe |
| `import` | Importa classes de outros pacotes |

---

### **7. Extensões de Arquivo**
- **`.java`** → Código-fonte (texto legível)
- **`.class`** → Bytecode compilado (interpretado pela JVM)

---

### **8. Fluxo Resumido**
```
[Código .java] 
    ↓ (javac)
[Bytecode .class] 
    ↓ (java)
[JVM interpreta/compila]
    ↓
[Execução no Sistema Operacional]
```

---

### **9. Vantagens da Plataforma Java**
✓ **Portabilidade:** Multiplataforma (Windows, Linux, Mac)  
✓ **Orientação a Objetos:** Código modular e reutilizável  
✓ **Segurança:** Verificação de bytecode, sandbox  
✓ **Robustez:** Tratamento de exceções, tipagem forte  
✓ **Performance:** JIT Compiler otimiza código em tempo real  
✓ **Gerenciamento Automático de Memória:** Garbage Collection  
✓ **Grande Ecossistema:** Bibliotecas, frameworks, comunidade ativa

---

### **10. Conceitos Complementares Importantes**
- **JDK (Java Development Kit):** Kit completo para desenvolvimento (inclui JVM, compilador, ferramentas).
- **JRE (Java Runtime Environment):** Ambiente apenas para execução (JVM + bibliotecas).
- **API Java:** Conjunto de classes e interfaces pré-construídas (java.lang, java.util, java.io, etc).
- **Garbage Collection:** Liberação automática de memória não utilizada.
- **Exception Handling:** Tratamento de erros com try-catch-finally.

---

Essa versão está mais estruturada, completa e reflete melhor os conceitos interligados do mapa mental de Java!