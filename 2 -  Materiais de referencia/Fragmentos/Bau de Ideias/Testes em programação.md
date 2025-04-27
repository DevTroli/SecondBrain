O assunto testes automatizados é algo  **EXTREMAMENTE** FUNDAMENTAL na essência de quem se diz uma pessoa que trabalha com tecnologia num geral, mesmo como um assunto praticamente infinito ele tem que ser destrinchado por pequenas porções periódicas do assunto para ele ser um assunto que estar ao redor de tudo sobre aprender tecnologia.

> "A principal função de um teste automatizado é prover segurança para futuras alterações"

### Pensamentos Soltos
- Incluir testes no workflow diário é um pouco inconveniente e desconfortável de início mas com a devida persistência eles só melhoram na saúde periódica do seu projeto
- Por mais que você insista que não precisa automatizar seus testes pode basicamente fazer testes manuais de features ou tratamentos de erros, é preciso ter em mente que o lance não é trabalhar "duro" e sim ser esperto no trabalho porque um humano é falho e tem energia e vontade limitadas comparado a uma maquina que não teoricamente não tem essas "falhas" do ser humano então os testes automatizados (a maquina) vão sempre lembrar a ordem correta de verificação de cada componente estar funcionado 100% conforme o humano tenha configurado para oque os testes vão cobrir
- Oferece uma tranquilidade ao adicionar novas funcionalidades,corrigir bugs e tratar erros
- A falta de testes gera um bola de neve de problemas onde lhe cria ansiedade, medo, um peso nos seus ombros sobre mexer no sistema do jeito que tá só vai abrir brecha para mais problemas e termina com você só fazendo alterações no código fonte quando é extramente necessário (mas custando muito stress) e assim perdendo seu estilo modificável de ser, aquela que no passado já foi uma de suas fortes características
- Pelo fato de com essa **habilidade** de criar esses testes você pode criar vários cenários, mas objetivos deles são de testar sua aplicação até encontrar o cenário que sua aplicação quebre (revele brechas) para você ter consciência dos erros de sua aplicação para assim poder tratar ele com mais confiança e de quebra ganhar um registro "hardcoded" da captura e manutenção desse erro salafrário
- Como discutido abaixo no modo arqueiro tem o conceito de você atirar a flecha e no meio do percurso da flecha você dá uma corridinha para colocar o alvo no local onde a flecha vai atingir o alvo com 100% de certeza, no mundo da programação é conhecido como TDD (Test Driven Deevelopment), ou conhecido no Brasil como o famoso Desenvolvimento Orientado por testes. Sendo os testes que orientam o desenolvimento e não o desenvolvimento de uma feature guie como será os testes.

### Test Framework === Test Runner
Esse conhecimento se introduzido de forma que não é de bom tom e com uma didática inapropriada vai parecer que  é uma habilidade extra-terrestre, algo de outro mundo, mas num fim isso de testar é simplesmente um código que vai executar outro código de mais mais automático para que não seja preciso fazer tudo manualmente no "hard coded". Para isso que lhe é útil o Test Runner (Uma sequencia de comandos para executar testes),  pois para cada trecho que se encontre, tipo a verificar se o sistema de cadastro de email e senha está funcionado tudo 100% sem afetar nada interno nem externo sobre ele.

_Os testes automatizados são regidos por duas máximas:_
1. Espera que aconteça toda vez
2. Oque realmente acontece ao fazer os testes 

Essas máximas evitam que seu projeto não cai em regressão, por meios de suas suites de testes oque mais importa são os testes que são acusados de não passarem, essa barreira dos testes lhe dá a segurança que o sistema não desmorone por um falha humana sua, porque pode estar tudo passando nos testes, mas se uma nova alteração no código fonte do sistema um erro se reportado (por qualquer motivo que seja !) e os reporte de testes dando errado isso que dizer que houve uma regressão no estado saudável da aplicação para um estado insalubre do sistema, isso tudo de forma programática e visual como report.

**Oque precisa em um testes runner para ele excepcional:**
- 

### Criando um "Teste" de teste
Com um test runner prontamente escolhido ele irá nos contar se estamos "quentes" ou "frios" de nosso objetivo, ou seja, se estamos nos aproximando de concluir nossa meta para alcançar o objetivo ou se apenas estamos nos afastando do que realmente importa (o objetivo). A questão que fica no ar é  - _"Mas qual esse tal objetivo?"_ é exatamente aqui que iremos te mostrar ele pelo Modo Arqueiro:

#### Ativando seu modo arqueiro
É de conhecimento geral que todo arquivo precisa de um alvo certo? e também tem que ter um objetivo para estar gastando suas flechas no alvo não é mesmo? Sim & Sim, mas na programação é um pouco diferente...

Não precisa seguir o fluxo de ter um alvo e um objetivo de acertar esse alvo, na tecnologia (principalmente em testes automatizados) você pode fazer o contrario, olha só:
1. Você atira a flecha
2. Sai correndo para colocar o alvo no lugar exato que você quer
3. Assim acertando o seu alvo mais facilmente (sendo esse a parte mais importante)

Para criar um teste de teste o nosso alvo e nossa flecha acabam sendo ambos a mesma coisa que seria escrever um teste automatizado (e executar para ele passar)

**Um conceito importante para ter em mente seria:**
O modo que o Jest trabalha sua sintaxe é meio confusa, ele tem dois lados e pode até parecer um pouco inversa o jeito como funciona, mas vamos tentar simplificar ela...
- Na esquerda há um *valor gerado dinamicamente* por um componente do sistema
- Na direita há o Valor Esperado (Hardcoded) 
Se esses dois estiverem um união estável, excelente o teste passa com sucesso, mas se um dos lados não estiverem unidos por exemplo se o lado esquerdo começar a retornar um outro valor que não seja o esperado do lado direito essa união vai quebrar e o testes falhar.

**obs**: O problema tido anteriormente sobre ter uma dissonância (uma inversão) que confunde quem esta usando, esse é o fato de que seu teste espera no esta no expect()(usando exemplo o Jest) que fica no lado esquerdo e sim é declarado no toBe() e o valor que vem computado de forma dinâmica pelo sistema é declarado do expect(). E se isso parece confuso, você não está entende nada e está inseguro se vai conseguir adicionar isso ao seu workflow do cotidiano esse é ponto que você sabe que no caminho como disse anteriormente sobre o começo certo é aquele é um pouco inconveniente e desconfortável de início, mas que no fim da tudo certo porque tudo foi um ganho na sua produtividade e confiança em si próprio e não uma perda de alguma coisa.

### Erro de Sintaxe & Erro de lógica nos test
A função de um teste automatizado em sua base é a execução de código real (muitas vezes em tempo real) para que ele possa expor oque um cenário (bateria de testes diversos) recebe de entrada e oque se esperar encontrar como saída... é um fluxo quase perfeito, só não perfeito pelos seguintes erros abaixo que você deve se atentar pra não cair em ciladas:

**Erros de lógica:**
> "Um teste não tem a capacidade de dizer 100%  se um código esta funcionado, ele em principio tem a capacidade de mostrar se oque foi esperado esta correto ou errado."

A frase acima é uma representação que os erros de lógica passam despercebidos pelos testes segundo seus principios por exemplo em um função de somar o codigo da soma esta errado esta num1 * num2  e quando você vai fazer os testes de com os dois argumentos sendo o numero 2  o teste passa com sucesso, mas os testes com os dois argumentos sendo 3 ele ja não passa mas porque? essa é a rasteira que os testes te dão por não se atentar a lógica central de seu código pois por acaso 2 + 2 é 4 e 2*2 também é 4 mas isso não se aplica ao 3 + 3 ou 3* * 3, tornado ele um erro quase ininterceptável dependendo da sua atenção tonando um perigo comparado com os erros de syntax que é só siga a syntax padrão e na lógica é muito mais sobre a função central do código no qual você não pode abrir brecha para só fazer testes "fofos" & leves que possam cair em erros de lógica
<- Desenvolver mais sobre o assunto de erro de lógica em testes de forma elaborada ->

**Erros de Syntax:**
elabore melhor a ideia proposta

### Diferenças entre teste unitário, integrado e E2E
>- `Unit`: Teste de uma unidade, como um componente a parte do sistema;
>- `Integration`: Teste de integração consiste em verificar a comunicação de uma ou mais unidades, por exemplo, requisições de um sistema para outro verificando se o retorno veio o esperado;
>- `E2E`: Analisa o funcionamento da aplicação inteira, verifica se ela por inteiro está funcional.


 **Testes Unitários:**
 Nos testes unitários ele funciona por conta própria sem dependentes com o objetivo de se assegurar que cada micro-função do sistema esteja funcionado sem precisar de nada além de seu escopo nem mesmo sobra a infraestrutura é requirido para ele concluir o seu tipo de teste de forma por cada unidade de funcionalidade na aplicação. Tornado tão puro e autossuficiente que ele é modular e portável para qualquer contexto que precisar dele.
 > " O único dever dele é  fazer os testes da unidade base... nada mais, nada menos "

É muito difícil definir o que é uma unidade, dessa forma a divisão dele fica mais clara, testar uma requisição que o cliente usa de ponta a ponta = teste de integração, vs testar uma unidade interna do sistema, independente se ela integra com vários outros client/server (usuarios mesmo), seria um teste de unidade.


**Testes de Integração:**
> "São testes que não se preocupam mais se com o comportamento micro da funcionalidade, mas testa sua integração entre várias unidades/camadas da aplicação"

<-- Desenvolver melhor uma elaborada explicação sobre esse assunto -->

**End-to-End:**
Teste completo de ponta a ponta onde envolve a interface, infraestrutura, backend e etc...

<-- Desenvolver melhor uma elaborada explicação sobre esse assunto -->

##### Porque nenhum teste é melhor que o outro?
Quanto mais você querer se certificar que tudo esta em seus conformes (tipo um E2E) mais lebto vai ser o fluxo de desenvolvimento, os teste vão sair de modo mais demorado, além de ser muito mais custoso doque só fazer um simples teste unitario. 
Então está ai respostas testes unitarios são bala de prata para esse prblema, mas ai que ta a cilada porque em muitos casos esse tipo de teste são rapidos porem simplórios e não dão muita segurança que tudo esta 100% quanto um E2E pode proporcionar, pensando assim só resta um escolha que seria viver no equilibrio e ver os testes de integração como definitivos porque ele tem o melhor dos dois mundos ao você se preocupar só na sua integração que sera validada pelos testes, certo? Errado denovo, entretanto a um certo ponto existem pessoas que acreditam que eles são os melhores e outras não por isso começou um guerra ideologica sobre Testes Automatizados: Test Unit Vs. Test Integration.
Não adianta de nada sua feature estar funcionando tudo certinho se sua utilidade é nula porque tem uma péssima integração com o ecossistema todo do seu sistema fazendo um tipo um Feature-Creep que na teoria/pratica funciona, mas sua relevevancia e uso não.
Por isso que como um desenvolver pragmatico que eu sei que você é (ou aspira ser) a mlehor solução ṕara não se perder nesses debates ideologicos onde bom norte a se seguir seria a [Pirâmide de Testes]() (Escrever sepradamente sobre) 