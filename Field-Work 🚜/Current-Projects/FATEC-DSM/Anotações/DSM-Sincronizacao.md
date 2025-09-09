#### O que é Sincronização de Processos?

Sincronização é o mecanismo que permite que processos que estão executando ao mesmo tempo coordenem o acesso a recursos compartilhados, para evitar que dados fiquem inconsistentes ou sejam corrompidos.

Por exemplo: imagine um sistema de matrícula online com 5 vagas disponíveis. Dois usuários concluem a matrícula exatamente ao mesmo tempo, ambos descontando 1 vaga simultaneamente. Sem sincronização, o sistema pode acabar mostrando 4 vagas restantes para o próximo usuário, quando na verdade deveriam ser 3. Esse erro pode gerar falhas graves no sistema.

#### Por que a sincronização é tão importante?

Quando vários processos acessam a mesma memória ou recursos (como arquivos, impressoras ou dispositivos), sem controle, pode haver:

- **Corrupção de dados:** se dois processos modificam o mesmo dado simultaneamente, o resultado final pode ser errado.
- **Inconsistência:** o sistema pode "ver" dados que não correspondem ao real estado.
- **Condições de corrida (race conditions):** erro que ocorre quando o resultado depende da ordem de execução não controlada dos processos.

#### Conceito de Exclusão Mútua

A maneira mais usada para garantir sincronização é a **exclusão mútua**: só um processo pode acessar sua "região crítica" por vez, enquanto os outros esperam.

A região crítica é a parte do programa que acessa os recursos compartilhados.

Para evitar que vários processos entrem na região crítica ao mesmo tempo, usa-se:

- **Locks (travas)**
- **Semáforos**
- **Monitores**

#### Mecanismos de Sincronização

- **Semáforos:** variáveis que indicam se um recurso está disponível ou ocupado, controlando o acesso.
- **Mutexes:** tipo especial de semáforo que garante exclusão mútua.
- **Monitores:** estruturas de alto nível que encapsulam variáveis compartilhadas e operações para garantir exclusão, evitando erros comuns.

#### Exemplo prático de sincronização

Voltando à matrícula online: quando um processo entra na região crítica para atualizar o número de vagas, ele "trava" o acesso, impedindo que outro processo entre enquanto o primeiro não terminar a operação. Assim, evita-se a perda de vagas e garante a integridade dos dados.

#### Sincronização é fundamental para:

- Sistemas multitarefa e multiprocessados  
- Evitar erros em arquivos, bancos de dados e dispositivos compartilhados  
- Garantir que os programas concorrentes funcionem como esperado, sem conflitos  
