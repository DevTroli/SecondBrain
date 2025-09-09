#### O que são Threads?

Imagine que um programa é como um restaurante e um processo é uma mesa sendo atendida. Cada thread é um garçom que serve essa mesa. Ou seja, threads são as menores unidades de execução que um sistema operacional pode gerenciar dentro de um processo. Elas permitem que um programa faça várias tarefas ao mesmo tempo, como tocar música enquanto você escreve um texto.

Threads são fundamentais porque tornam o uso da CPU mais eficiente, permitindo multitarefa real dentro de uma aplicação.

#### Processo vs Thread

| Aspecto          | Processo                                      | Thread                                     |
| ---------------- | --------------------------------------------- | ------------------------------------------ |
| Definição        | Programa em execução completo                 | Linha de execução dentro do processo       |
| Peso             | Mais “pesado”, consome mais recursos          | Mais “leve”, consome menos recursos        |
| Memória          | Cada processo tem sua própria área de memória | Threads compartilham a memória do processo |
| Tempo de criação | Mais lento                                    | Mais rápido                                |
| Comunicação      | Complexa entre processos                      | Simples entre threads                      |

#### O que é o Escalonador?

O escalonador é o "diretor de tráfego" da CPU. Quando muitos processos ou threads querem usar o processador, ele decide quem executa primeiro e por quanto tempo. É isso que dá a ilusão de que várias tarefas acontecem ao mesmo tempo no computador.

#### Por que precisamos de escalonamento?

Imagine só: se só uma pessoa pudesse assistir TV e as outras tiveram que esperar até que ela acabasse, seria injusto e ineficiente. O escalonamento cria uma "fila" organizada para que todos possam usar a CPU de forma justa e eficiente, garantindo que ninguém fique esperando demais.

#### Principais Algoritmos de Escalonamento

1. **FCFS (First Come, First Served - Quem chega primeiro é atendido primeiro)**
   - Simples como uma fila de padaria.
   - O primeiro processo a chegar é o primeiro a executar.
   - Pode causar espera longa para processos que chegaram depois.

2. **SJF (Shortest Job First - Trabalho mais curto primeiro)**
   - Prioriza os processos que precisam de menos tempo para terminar.
   - Reduz o tempo médio de espera.
   - Pode deixar processos longos esperando muito (starvation).

3. **Round Robin (RR)**
   - Cada processo recebe um tempo fixo (quantum) para usar a CPU.
   - Ao acabar o tempo, passa para o próximo na fila.
   - Justo e usado em sistemas interativos, como Windows e Linux.

4. **Escalonamento por Prioridades**
   - Processos são classificados por importância.
   - Os mais importantes executam primeiro.
   - Como emergências em um hospital.

#### Como as Threads são Escalonadas?

- **Threads de Usuário:** Gerenciadas pelas próprias bibliotecas do programa, mais rápidas para criar, mas se uma trava, todas travam.
- **Threads de Kernel:** Gerenciadas pelo sistema operacional, mais seguras, e uma thread travada não afeta as outras.

#### Context Switching (Troca de Contexto)

Quando a CPU para de executar uma thread e começa outra, ela salva o estado da primeira para continuar depois. Isso é a troca de contexto, como pausar e retomar um jogo.

#### Critérios de Escalonamento

O escalonador considera vários fatores para tomar decisões, como:  
- Utilização máxima da CPU  
- Quantidade de processos concluídos por tempo  
- Tempo de resposta para o usuário  
- Tempo de espera na fila  
- Garantir justiça para todos os processos.

#### Aplicações Práticas

- Sistemas interativos (Windows, Android): Round Robin é ideal para resposta rápida.
- Sistemas em tempo real (controle de aviões): usam prioridades e deadlines rigorosos.
- Servidores Web: combinam algoritmos para alta eficiência.

***

### Resumo Simples

- Threads são mini-processos dentro de um processo.  
- O escalonador decide quem executa quando e por quanto tempo.  
- Algoritmos como FCFS, SJF, Round Robin e Prioridades organizam essa execução.  
- Essa gestão cria a multitarefa percebida nos computadores modernos.