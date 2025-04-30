>"Variáveis de ambiente são um pedaço de informação dentro do código fonte da aplicação que é volátil conforme o ambiente que ele estiver inserido"

#### pensamentos soltos
- As variaveis de ambientes, podem servir para deixar a camada da aplicação statelles, ou seja,  a variável de ambiente é uma forma de armazenar informações configuráveis para seu aplicativo, como credenciais ou URLs do banco de dados, de forma segura e flexível.
- sempre que possível deixar o estado da aplicação com stateless, ou seja com o estado dela vindo de fora por outra camada, pois um serviço / sistema pode ser constituido por varias camadas como Interface, Aplicação, Persistêmcia e etc... um bom exemplo seria a simples calculadora do seu celular pois ela possui a 3 camadas citadas acima.
**Camadas de uma aplicação stateless:**
Interface --> fornece um bom layout e boa experiência ao usuário; 
Aplicação --> Implementa a regra de negócios de modo que compute de a logica certa
Persistência --> Camada para persistência de dados que são usados pela camada de aplicação, como se fosse um mini banco de dados

- Para conseguir construir e escalar uma aplicação sem perrengues é separada as camadas da aplicação para algo mais stateless (sem estado)
- Quando você tem uma maquina pura (tipo no docker) você pode mudar certos comportamentos por meio de **Variáveis** que estão vindo direto de seu **Ambiente**, como por exemplo credencias de API_KEY, database authentication ou dados sensíveis. 
- Variáveis de ambiente não tem a finalidade de apenas registrar endereços e credencias, elas também podem ser usadas para coisas como: O Rate Limit de cada Endpoint da API.
- Embora o conceito de state esteja mais diretamente relacionado aos dados vindos da interação do usuário com a aplicação,O _**princípio**_ no fim das contas é o mesmo: _a camada da aplicação não guarda nenhum dado_. No caso específico desta aula, esse dado diz respeito a qual banco de dados ela deve se conectar.
- Em relação a stateful versus stateless o lance é o seguinte mesmo que o uso de variáveis de ambiente injetadas dinamicamente não defina diretamente se uma aplicação é stateless ou stateful, podemos dizer que isso torna ela stateless do ponto de vista do servidor em que ela é executada. É como se o "cliente" nesse sentido fosse o servidor em que ela é executada, pois é ele quem injeta os dados necessários. Ficou mais claro?

### Entendendo sobre variáveis de ambiente e seus nuances
<-- Escrever trecho sobre isso de forma explanatoria e didatica pra referencias futuras -->

### Relação entre Variáveis de Ambiente, process, env


**Oque entra no seu código?**


### Stateful Vs Stateless

---

- Trade-off UX-Complexidade de Desenvolvimento & Escalabilidade

#### Estado / State

---

- **Estado** é um contexto - como um conjunto de configurações ou o histórico de compras - que é **necessário ou complementa** o funcionamento de um aplicativo, serviço, etc e "**personaliza**" ele entre diferentes sessões / usuários
    - O estado é geralmente associado a um contexto dinâmico gerado pelo uso de uma aplicação por um usuário - como a realização de transações bancárias, a produção de um histórico de compras ou uma lista de amigos em uma rede social

#### Stateful

---

- O serviço salva, maneja e considera o estado da aplicação para o usário

**Pros**

- É necessário quando o servidor precisa ser
- cliente/usuário não deve ser capaz de manipular o estado da aplicação como quiser - como é o caso  
    **Contras:**
- **↓ Escalabilidade** → Como o estado é armazenado na mesma máquina que provê o serviço, ao escalar horizontalmente passa-se a ter **duplicatas do estado** - o que é uma ocupação redudante de espaço - e essa duplicação pode resultar em **inconsistência** entre os estados.
    - _(autoral)_ nesse sentido é preferível escalar verticalemente
- **↓ Memória e Processamento** → Parte das capacidades do computador são dedicados a salvar e manejar o estado
- **↑ Complexidade de desenvolvimento** → É necessário implementar as manipulações e processamentos do estado.

#### Stateless

---

- O serviço - isoladamente - não faz menor ideia de qual o estado da aplicação para o usuário.
    - A responsabilidade de armazenar e manejar o estado do cliente - caso isso for desejado - torna-se do cliente ou de um serviço terceiro.
    - **Autenticação:** pode ser feita por meio de [[JWT Tokens]]

**Pros**

- **↑ Escalabilidade** → Como o funcionamento do serviço independe de estado é simples escalar o serviço horizontalmente ou verticalmente - já que que cada máquina/container só precisa conhecer o source que é de fácil duplicação
    
- **↑ Resistência a Falha** → Caso um das máquinas/containers falhe - seja por questões de hardware, de ambiente ou algum erro no próprio código - uma outra máquina pode imediatamente substituí-la de forma impeceptível para o usuário
    
- [?] Hoje em dia a maioria dos servidores seriam stateless? Já que majoritariamente utilizam-se camadas de persistêncais de serviços terceiros para armazenar os estados?
    

#### Outras Interpretações

---

- Tradicionalmente, `state`, `stateful` e `stateless` referem-se ao estado de um servidor com relação a um cleinte, entretanto é possível extrapolar esse sentido.
    - `stateful` por vezes é generalizado como processos que consideram contexto e, ao contrário, `stateless` como processos que ignoram contexto
        - **Firewall Stateful** : é aquele que considera todo o contexto do fluxo de rede - pacotes / requisições - para definir se algo é um ataque ou não
        - **Protocolos Stateful:** É um protocolo que considera o contexto - por vezes possibilitado por meio de comunicação contínua - como é o caso do [[File Transfer Protocol (FTP)]] que pode transferir múltiplos arquivos com uma única sessão, sem necessidade de reautenticação ou reconexão
        - **Firewall Stateless**: É aquele que analisa características isoladas do pacote por meio de uma série de regras "simples" sem considerar o contexto de outros pacores
        - **Protocolo Stateless**: É um protocolo que transmite uma informação por vez se considerar comunicações anteriores, como é o caso do HTTP. (1) sugere que é por isso que HTTP dominou a world wide web.
    - É possível pensar na relação `stateful` e `stateless` considerando como serviço - como o código / aplicação / backend - e o cliente - como o ambiente (dev, stag, prod)
        - **Credencias:** Por mais que esses não sejam valores dinâmicamente gerados pelo uso do app - o Filipe sugere pensar esses como um estado - provavelmente porque customiza o comportamento da aplicação e podem ser modificados
            - **Credenciais Hard-Coded:** Nesse caso, é responsabilidade do aplicação armazenar e utilizar essas credenciais, portanto trataria-se um situação stateful. Por mais que, sendo hard-coded, essas crendencias não serão operacionalizadas dinamicamente.
            - **Credenciais Baseadas em Variáveis de Ambiente**: Nesse caso, o ambiente é responsável por prover as credenciais - sendo a aplicação por si só, ignorante de quais seriam as credenciais, resultanto em uma abordagem stateless

#### Resources

---

1. [https://redis.io/glossary/stateful-vs-stateless-architectures/?utm_source=chatgpt.com](https://redis.io/glossary/stateful-vs-stateless-architectures/?utm_source=chatgpt.com)
2. [https://www.redhat.com/en/topics/cloud-native-apps/stateful-vs-stateless](https://www.redhat.com/en/topics/cloud-native-apps/stateful-vs-stateless)

Responder