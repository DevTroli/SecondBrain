# Roadmap Tech Definitivo: Do Zero ao Profissional Confiante

## **Dia 1**: Montando uma Fundação
### [[Função VS Estetica]] 
Uma explicação sobre Ambiente de desenvolvimento e porque quanto mais simples for um ambiente de desenvolvimento, maior flexibilidade você terá e, numa visão grosseira, não deveria passar de um lugar para **escrever** códigos e outro lugar para **executar** eles ou outros serviços

**Registro do meu Ambiente de desenvolvimento Atual** 06/06/25:
- Operacional System: Arch Linux - Hyprland
- Editor de texto: Nvim personalizado
- Database: MySql & Postgres
- Linguagens de programação: Python, Node.js, Ruby (gerenciando pelo versionador MISE)
- Ferramentas para melhor workflow: Tmux, Lazygit, Docker, Obsidian, Ghostty, yazi, clipcat

### [[ParalisiaPorAnalise | Paralisia por análise]]
Este é o **primeiro grande inimigo** do profissional tech. Acontece quando você passa mais tempo pesquisando "qual é a melhor stack" do que realmente desenvolvendo.

**Sinais de que você está preso:**
- Lê 50 artigos sobre "React vs Vue vs Angular" mas nunca construiu nada
- Muda de decisão tecnológica a cada semana
- Sempre acha que precisa aprender "mais uma coisa" antes de começar

**Como quebrar o ciclo:**
- **Regra 80/20**: 80% das decisões técnicas podem ser mudadas depois
- Escolha uma stack e **comece agora**
- A experiência prática vale mais que análise teórica infinita
- "Done is better than perfect"

### [[GIT]]
Aqui você irá entender tudo que precisa sobre Git para ser produtivo e uma explicação com uma analogia para esclarecer uma confusão comum entre GitHub e Git, apesar de ser uma visão superficial do que é cada uma destas coisas

### [[DEV-REPOSITORIOS | REPOSITORIOS]]
Tudo começa na criação do repositório, que é onde você irá guardar os arquivos do seu projeto e o histórico de alteração deles, e aqui eu explico todos os detalhes de como fazer isto na interface do GitHub e os diferentes tipos de repos

### 🎁 Bônus
- Sistema Operacionais: especialmente o Linux/Arch-Linux (TODO: um index sobre SO, futuramente)
- Text-Editor (TODO: um index com tudo sobre editor de texto principalmente NVIM, futuramente)

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Qual o ambiente de desenvolvimento & ferramentas devo usar?
- [ ] Como evitar paralisia por análise e começar a construir
- [ ] O que é & como usar o GIT para ser produtivo
- [ ] O entendimento geral de Repositórios e suas nuances

---

## **Dia 2**: Disciplina e Organização Mental

### [[Constâncias em projetos]]
**Motivação para Iniciar, Disciplina para Terminar: Domine Seu Cérebro**

Você enfrenta dois caminhos ao procrastinar:
1. **Desapontar seu cérebro agora** (exigir que ele gaste energia em algo desconfortável)
2. **Decepcionar seu "eu futuro"** (arruinar sua autoestima e confiança a longo prazo)

**Como dividir um projeto em microtarefas:**
1. **Liste o objetivo final**: Ex.: "Criar um aplicativo de tarefas"
2. **Quebre em 10 partes**: Design, banco de dados, função de lembrete...
3. **Divida cada parte em tarefas de 15 minutos**:
   - Ex.: "Design da interface" → Esboçar 3 telas no papel; Escolher paleta de cores; Prototipar uma tela

**Resultado**: 30 tarefas curtas que seu cérebro não consegue recusar.

### [[Organização de tarefas]]
**Produtividade Inteligente: Fazer Muito com Pouco**

O cérebro humano busca *"trabalhar pouco e ganhar muito"*, mas a realidade geralmente é:
- **Trabalhar muito → Ganhar pouco** (desgaste sem recompensa)
- **Trabalhar pouco → Ganhar pouco** (conforto imediato, estagnação)

**A solução**: Inverter a lógica do planejamento
- **Planeje menos, execute mais** (foco em ação, não em planos perfeitos)
- **Aceite os erros como ajustes** (bugs são mais fáceis de corrigir quando você já está em movimento)

**Níveis de Organização:**
1. **Tarefas Individuais**: "O que eu preciso fazer hoje?"
2. **Coordenação**: "Quem faz o quê?"
3. **Aprimoramento**: "Como melhorar o que já fazemos?"
4. **Métricas**: "Valeu a pena?"

### [[TOOLS-GerenciadoresDeVersão |Gerenciadores de Versões Universal]]
**Pro ASDF & MISE | contra gerenciadores específicos**

Gerenciadores de versão resolvem o problema de ter múltiplos projetos com diferentes versões de linguagens.

**Por que MISE/ASDF são superiores:**
- **Universais**: Um único gerenciador para todas as linguagens
- **Consistência**: Mesmo workflow para todas as ferramentas
- **Performance**: MISE é especialmente rápido (feito em Rust)

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Dominar meu cérebro através de microtarefas e disciplina
- [ ] Implementar sistema de organização de tarefas eficiente
- [ ] Configurar gerenciadores de versão universais
- [ ] Quebrar projetos grandes em partes executáveis

---

## **Dia 3**: Fundamentos da Web

### [[WEB-ProtocolosDeRede|Protocolos de Rede]]
**Antes de tudo, o que seria um servidor web?**
A internet funciona por meio de comunicações via protocolos que mantêm os servidores web operacionais. Esses servidores são computadores que armazenam e distribuem arquivos de um site.

**Mas o que é um protocolo?**
Um protocolo é um **conjunto de regras padronizadas** que permite comunicação, respondendo:
- "Como uma 'conversa' se inicia?"
- "Onde as informações devem ser inseridas?"
- "Como obter uma resposta?"
- "Qual o início e fim do processo?"

**Principais Protocolos:**
- **HTTP**: Gerencia documentos de hipertexto (web)
- **FTP**: Transferência de arquivos
- **SMTP**: Envio de e-mails
- **UDP**: Transmissões rápidas sem garantia (streaming)

### [[WEB-CLIENT->SERVER|CLIENT -> SERVER]]
Esta é a arquitetura fundamental da web. O **cliente** (navegador, app) faz **requisições** para o **servidor**, que processa e retorna **resposta**.

**Fluxo básico:**
1. Cliente faz requisição (GET, POST, PUT, DELETE)
2. Servidor processa a requisição
3. Servidor retorna resposta (HTML, JSON, etc.)
4. Cliente renderiza/processa a resposta

### [[WEB-DNS|DNS]]
DNS é a "agenda telefônica" da internet - traduz nomes legíveis para endereços IP.

**Como funciona:**
1. Você digita `exemplo.com`
2. Seu computador pergunta ao DNS resolver
3. Resolver consulta servidores DNS hierarquicamente
4. Retorna o IP correspondente
5. Navegador conecta no IP

**Tipos de registro:**
- **A**: Nome → IPv4
- **CNAME**: Nome → Outro nome
- **MX**: Servidores de email

### 🎁 Bônus
- Linguagens de programação (TODO: um index sobre o assunto como um overview, futuramente)

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Compreender como protocolos de rede funcionam
- [ ] Entender a arquitetura Cliente-Servidor
- [ ] Conhecer o papel do DNS na internet
- [ ] Visualizar como dados fluem na web

---

## **Dia 4**: Mentalidade e Metodologia

### [[MVP&PoC]]
**Proof of Concept (PoC):**
- **Objetivo**: Provar que algo é tecnicamente possível
- **Qualidade**: Código descartável, foco na funcionalidade
- **Timeline**: Dias/semanas

**MVP (Minimum Viable Product):**
- **Objetivo**: Validar hipóteses de negócio com usuários reais
- **Qualidade**: Código de produção, mas simples
- **Timeline**: Semanas/meses

**Quando usar cada um:**
- PoC para validar viabilidade técnica
- MVP para validar demanda de mercado

### [[Não é magia, É tecnologia]]
**Mentalidade crucial**: Toda tecnologia pode ser compreendida se você investir tempo suficiente.

**Como desmistificar tecnologia:**
1. **Read the docs** - documentação oficial primeiro
2. **Experimente** em pequenos projetos
3. **Olhe o código fonte** quando possível
4. **Construa** versões simples para entender

**Benefícios desta mentalidade:**
- Menos medo de novas tecnologias
- Debugging mais eficaz
- Escolhas arquiteturais mais informadas
- Confiança para contribuir com open source

### [[Programação Orgânica vs Impressora 3D]]
**Programação Impressora 3D** (Waterfall):
- Planeja tudo antes de começar
- Segue especificações rígidas
- Difícil de mudar no meio do processo

**Programação Orgânica** (Agile):
- Cresce e se adapta iterativamente
- Responde a mudanças rapidamente
- Aprende fazendo

**Quando usar cada uma:**
- "Impressora 3D" para sistemas críticos, compliance
- "Orgânica" para produtos, startups, inovação

### 🎁 Bônus
- [[I.A nos tempos atuais]] (Conteúdo edificante ainda mais nos tempos atuais de A.I e seu uso desvairado em tudo por todos, mas isso sai da tangente do assunto principal, logo isso fica como um bônus sobre A.I )
- [[O Problema com os Detectores de I.A]] {Um ponto de vista interessante dos efeitos da I.A por pessoas fora da bolha tech (ou não também) que procuram saber oque é ou não I.A, mas isso sai da tangente do assunto principal, logo isso fica como um bônus sobre A.I}

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Distinguir quando usar PoC vs MVP para validação
- [ ] Desenvolver mentalidade de desmistificação tecnológica
- [ ] Escolher abordagem "Impressora 3D" vs "Orgânica" conforme contexto
- [ ] Aplicar metodologias de desenvolvimento apropriadas

---

## **Dia 5**: Qualidade e Padronização

### [[DEV-EstilizaçãoDeCódigo|Estilização de código]]
Estilização de código é sobre **legibilidade**, **consistência** e **manutenibilidade**.

**Ferramentas automáticas:**
- **Formatters**: Prettier (JS), Black (Python), gofmt (Go)
- **Linters**: ESLint (JS), Pylint (Python), RuboCop (Ruby)
- **Type checkers**: TypeScript, mypy (Python)

**Princípios fundamentais:**
- **Consistência** é mais importante que preferência pessoal
- **Automatize** formatação - não discuta espaços vs tabs
- **Configure** no projeto, não na máquina pessoal

### [[DEV-IssueInception|Issue Inception]]
Issue Inception é a arte de quebrar problemas grandes em tarefas pequenas e executáveis.

**Processo:**
1. **Identifique** o problema/feature
2. **Decomponha** em subtarefas menores
3. **Priorize** baseado em valor e dependências
4. **Estime** esforço necessário
5. **Documente** contexto e critérios de aceite

**Qualidades de uma boa issue:**
- **Específica**: Escopo bem definido
- **Testável**: Critérios claros de conclusão
- **Independente**: Pode ser feita isoladamente
- **Estimável**: Esforço previsível

### [[Teoria McDonlads]]
Sistemas bem-sucedidos são **simples**, **padronizados** e **replicáveis**.

**Aplicação em software:**
- **Convenções** sobre configurações
- **Padrões** repetíveis em toda codebase
- **Processos** automatizados e documentados
- **Onboarding** rápido para novos desenvolvedores

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Configurar formatação automática de código no projeto
- [ ] Praticar Issue Inception para quebrar problemas grandes
- [ ] Implementar padronização estilo "McDonald's" em projetos
- [ ] Estabelecer constâncias e convenções em desenvolvimento

---

## **Dia 6**: Arquitetura e Deployment

### [[Overengineering]]
Overengineering é criar soluções mais complexas que o necessário.

**Sinais de overengineering:**
- Arquitetura para "escala futura" sem evidência de necessidade
- Abstrações prematuras "para flexibilidade"
- Patterns complexos para problemas simples

**Como evitar:**
- **YAGNI** (You Aren't Gonna Need It)
- Resolva o problema de hoje, não de amanhã
- **Regra dos 3**: Abstraia apenas na terceira repetição

### [[Arquitetura-de-Software-que-funciona]]
Arquitetura eficaz equilibra **simplicidade**, **funcionalidade** e **manutenibilidade**.

**Princípios fundamentais:**
- **Start simple**: Comece com monolito, evolua quando necessário
- **Separation of concerns**: Uma responsabilidade por módulo
- **Loose coupling**: Componentes independentes

### [[DEVOPS-Introdução | Introdução ao DevOps]]
DevOps une **Development** e **Operations**, quebrando silos entre quem desenvolve e quem mantém sistemas.

**Princípios fundamentais:**
- **Automação**: Testes, builds e deploys automáticos
- **Colaboração**: Dev e Ops trabalham juntos
- **Monitoramento**: Observabilidade constante
- **Iteração rápida**: Entregas pequenas e frequentes

### [[DEVOPS-PlataformasDeDeploy | Plataformas de Deploy]]
**Categorias:**
- **PaaS**: Heroku, Vercel, Netlify (simplicidade)
- **IaaS**: AWS, Google Cloud, Azure (controle)
- **Serverless**: AWS Lambda, Vercel Functions (escala automática)

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Identificar e evitar overengineering em projetos
- [ ] Aplicar princípios de arquitetura simples e eficaz
- [ ] Compreender princípios e benefícios do DevOps
- [ ] Escolher plataformas de deploy baseadas em necessidades

---

## **Dia 7**: Resilência e Confiabilidade

### [[Não confie 100% em nenhum serviço]]
**Princípio fundamental**: Tudo pode falhar.

**Exemplos de falhas:**
- AWS teve outages que derrubaram metade da internet
- GitHub já ficou fora por horas
- Bancos de dados podem corromper

**Estratégias de mitigação:**
- **Backups** múltiplos e testados
- **Redundância** geográfica
- **Circuit breakers** para serviços externos
- **Monitoring** proativo
- **Planos de contingência** documentados

### [[DEV-TestesAutomatizados| Testes Automatizados]]
Testes automatizados são código que verifica se seu código funciona, executado automaticamente a cada mudança.

**Pirâmide de testes:**
- **Unit tests** (base): Testam funções/classes isoladamente
- **Integration tests** (meio): Testam interação entre componentes
- **E2E tests** (topo): Testam fluxos completos do usuário

**Benefícios:**
- **Confidence** para fazer mudanças
- **Documentation** viva do comportamento esperado
- **Regression prevention** - bugs não voltam

### [[WEB-HTTPNaPratica|HTTP na Pratica]]
HTTP é o protocolo que alimenta toda a web moderna.

**Métodos HTTP principais:**
- **GET**: Buscar dados (idempotente)
- **POST**: Criar recursos
- **PUT**: Atualizar recurso completo
- **DELETE**: Remover recurso

**Status codes importantes:**
- **2xx**: Sucesso (200 OK, 201 Created)
- **4xx**: Erro do cliente (400, 401, 404)
- **5xx**: Erro do servidor (500, 502, 503)

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Implementar estratégias básicas de redundância e backup
- [ ] Desenvolver mindset de resiliência para sistemas
- [ ] Implementar testes automatizados básicos em um projeto
- [ ] Compreender estrutura e semântica do protocolo HTTP

---

## **Dia 8**: APIs e Integrações

### [[API]]
API (Application Programming Interface) é um contrato que define como diferentes softwares podem se comunicar.

**Tipos de APIs:**
- **REST**: Arquitetura baseada em HTTP/JSON
- **GraphQL**: Query language flexível
- **gRPC**: High-performance com Protocol Buffers
- **WebSockets**: Comunicação bidirecional em tempo real

**Analogia**: API é como o cardápio de um restaurante - você sabe o que pode pedir e como pedir, mas não precisa saber como a comida é preparada.

### [[API-REST]]
REST é um estilo arquitetural para APIs baseado em princípios da web.

**Convenções RESTful:**
```
GET    /users       # Lista usuários
GET    /users/123   # Busca usuário específico
POST   /users       # Cria novo usuário
PUT    /users/123   # Atualiza usuário completo
DELETE /users/123   # Remove usuário
```

**Boas práticas:**
- Use substantivos, não verbos nas URLs
- Seja consistente com naming conventions
- Use HTTP status codes apropriados
- Implemente paginação para listas grandes

### [[API-HEALTHCHECK]]
Health checks são endpoints que permitem monitorar se sua API está funcionando.

**Tipos de health check:**
- **Liveness**: API está rodando?
- **Readiness**: API está pronta para receber tráfego?
- **Startup**: API terminou de inicializar?

**Implementação básica:**
```json
GET /health
{
  "status": "healthy",
  "timestamp": "2025-06-06T10:00:00Z",
  "dependencies": {
    "database": "healthy",
    "redis": "healthy"
  }
}
```

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Compreender conceitos fundamentais de APIs
- [ ] Aplicar princípios e convenções REST em projetos
- [ ] Implementar health checks para monitoramento
- [ ] Integrar APIs de terceiros de forma robusta

---

## **Dia 9**: Dados e Infraestrutura

### [[DATABASE]]
Bancos de dados são sistemas para armazenar, gerenciar e recuperar informações eficientemente.

**Tipos principais:**
- **Relacionais (SQL)**: MySQL, PostgreSQL, SQLite
  - Estrutura rígida (schemas)
  - ACID compliance
  - Relações complexas

- **NoSQL**: MongoDB, Redis, Cassandra
  - Estrutura flexível
  - Horizontal scaling
  - Tipos específicos (documento, chave-valor, grafo)

**Quando usar cada tipo:**
- **SQL**: Dados estruturados, transações complexas, consistência crítica
- **NoSQL**: Escala massiva, dados semi-estruturados, performance

### [[DEV-ENVDEV|ENV DEV]]
Ambiente de desenvolvimento consistente é crucial para produtividade.

**Componentes essenciais:**
- **Runtime** das linguagens (Node.js, Python, etc.)
- **Editor/IDE** configurado
- **Banco de dados** local
- **Ferramentas** de build e teste
- **Variáveis de ambiente** configuradas

**Princípio fundamental:**
"Qualquer desenvolvedor deve conseguir rodar o projeto localmente com no máximo 3 comandos"

### [[DCK|Docker]]
Docker resolve o problema "funciona na minha máquina" criando ambientes isolados e reproduzíveis.

**Conceitos core:**
- **Image**: Template imutável (receita)
- **Container**: Instância rodando de uma image
- **Dockerfile**: Instruções para criar uma image
- **Volume**: Persistência de dados

**Benefícios principais:**
- **Consistency**: Mesmo ambiente em dev/staging/prod
- **Isolation**: Dependências não conflitam
- **Portability**: Roda em qualquer lugar que tenha Docker
- **Scalability**: Fácil de replicar e escalar

**Fazer uma revisão de tudo que foi aprendido de modo linear:**
- [ ] Compreender diferenças entre SQL e NoSQL
- [ ] Configurar ambiente de desenvolvimento reproduzível
- [ ] Containerizar uma aplicação com Docker
- [ ] Usar Docker Compose para orquestrar múltiplos serviços

---

## Dia 10


---

## 🎯 **Você Agora É Diferente dos 90% de Profissionais Mediocres**

**Parabéns!** Você completou um roadmap que a maioria dos "profissionais tech" nunca fez de forma estruturada. Agora você tem:

### **🧠 Mindset Diferenciado:**
- **Disciplina mental** para dominar procrastinação
- **Organização** para executar projetos complexos
- **Mentalidade** de desmistificação tecnológica
- **Resiliência** para construir sistemas confiáveis

### **🛠️ Fundamentos Sólidos:**
- **Ambiente de desenvolvimento** profissional
- **Versionamento** e colaboração eficiente
- **Protocolos web** e arquitetura cliente-servidor
- **APIs REST** e integrações robustas

### **🏗️ Capacidades Avançadas:**
- **Metodologias** de desenvolvimento ágil
- **Qualidade de código** através de automação
- **Arquitetura** simples e escalável
- **DevOps** e deployment automatizado
- **Containerização** com Docker
- **Testes automatizados** e monitoring

### **🚀 Próximos Passos para Dominar o Mercado:**

1. **Construa um portfólio** aplicando TODOS os conceitos aprendidos
2. **Contribua** para projetos open source (demonstre suas habilidades)
3. **Ensine** outros (solidifique seu conhecimento)
4. **Especialize-se** em uma área específica (backend, frontend, DevOps)
5. **Network** com outros profissionais de qualidade

### **💡 Lembre-se:**
- **90% dos "profissionais"** não sabem organizar projetos nem configurar ambientes adequados
- **Você agora tem** disciplina mental, fundamentos sólidos e visão sistêmica
- **O mercado** paga bem por profissionais que **fazem acontecer**, não apenas por quem fala bonito

**Não seja mais um. Seja o profissional que as empresas procuram e não encontram.**

*A jornada tech é contínua, mas agora você tem a base para crescer exponencialmente. Use este conhecimento para construir, não apenas para impressionar em entrevistas.*

---
## **🎯 Storytelling Estruturado:**

**Dias 1-2**: **Mindset e Disciplina Mental**
- Começamos com paralisia por análise (o maior bloqueio inicial)
- Disciplina mental e organização de tarefas (fundação psicológica)
- Só depois ferramentas técnicas

**Dias 3-4**: **Fundamentos Web e Metodologia**
- Protocolos de rede (com seu texto corrigido)
- MVP/PoC e mentalidade "Não é magia"
- Abordagens orgânica vs estruturada

**Dias 5-6**: **Qualidade e Arquitetura**
- Padronização e qualidade de código
- Anti-overengineering e arquitetura simples
- DevOps e deployment

**Dias 7-9**: **Profissionalização e Sistemas**
- Resiliência e testes
- APIs e integrações
- Infraestrutura e Docker

## **🔥 Tom Mais Intenso:**
- Foco em **se destacar dos 90% de mediocres**
- Ênfase na **execução** vs teorização
- **Mindset diferenciado** como vantagem competitiva
- Conclusão motivacional sobre **dominar o mercado**

## **✅ Correções Específicas:**
- **Constâncias**: Agora sobre disciplina mental e microtarefas
- **Organização**: Sobre produtividade inteligente e execução
- **Protocolos**: Usando seu texto sobre servidores web e protocolos
- **Progressão orgânica**: Evita fadiga mas mantém intensidade