### pensamentos soltos
- ser future-proof é uma boa habilidade ao escolher um banco de dados
- Existem 3 estagios da flexibilidade de dados em equipes de desenvolvimento: 
1. Buscar dados de uma interface visual pré-construida; 2. A relação entre vários dados dentro de uma planilha; 3.  Por ultimo quando pesar muito todos esses dados na planilha transferir tudo para um SQL e tem capacidades ilimitada com os dados.
- ORM (Object-Relational Mapping): O Mapeamento Objeto-Relacional é uma abstração que conecta o mundo dos bancos de dados relacionais com o mundo dos objetos que são presente em linguagens de programação Orientada a Objetos com a finalidade de ao ínvés de ter que escrever as querys da linguagem SQL no puro hard-coded assim facilitando sua vida na hora de lidar com banco de dados nos seus projetos. (sem mencionar que é uma treta na bolha tech isso de ORM é nocivo ao aprendizado ou não?)

## Qual banco de dados escolher?
A escolha de um banco de dados não arbitraria porque não é um escolhe um banco de dados popular e modular sem nem levar em consideração esses três pilares:
1. **DBMS (Data Base Management System)**: São comummente conhecidos como banco de dados, mas são apenas sistemas de gerenciamento de banco de dados, ou seja um pacotão de features relacionadas a banco de dados que deve ser separado para gerenciar, proteger e distribuir os dados armazenados onde eles fazem exatamente oque um banco normal faz porem ao invés de ser dinheiro ele guarda dados (por isso banco de dados). Existem dois tipos de bancos os relacionais e os não relacionais alguns exemplos seriam o MongoDB(Não relacional), PostgresSQL (Relacional), MySQL/MAriaDB(Relacional), Cassandra (Não Relacional), entre outros tipos banco de dados super interessante como os Espacial & Série Temporal.
2. **Query / com ORM ou sem?**:
3. **Migrations (Processo de migração)**: 

## Banco de dados Relacional VS Não Relacional
Como dito acima mencionei diverso tipos de bancos de dados, mas quem sobrevalesse e competem entre si são os NoSQL contra os SQL (oque muitas vezes é só porque as pessoas tem medo de SQL eé dizem que NoSQL é melhor que SQL por isso essa richa)

## Investigando Logs

### Oque é um Log ???
Se traduzir a palavra Log vai ficar algo como Tora ou pedaço de madeira, mas oque isso tem haver com tecnologia e sobre o jeito que eles funcionam??

Então não tem nexo com madeira e sim com navegação marítima!! Isso mesmo pois nas antigas os marinhos usavam um pedaço de madeira, ou seja, um 'log' que ficava pendurado em uma corda medindo a velocidade do navio, porém tinha um macete nessa técnica marítima da qual eles davam nós (Knots) espaçados uniformemente, sendo assim que funciona o macete, eles jogando o Log no mar do qual seria puxado e a velocidade do navio seria mensurado pela quantidade de nós que iam passando por eles em um tempo fixo. Nessa época isso virou uma medida de velocidade em navegações no contexto de serem mensuradas, anotadas em um caderno de 'logs' (que alguns podem conhecer como diário de bordo como é mais comummente chamado)

Dessa forma que conecta com a tecnologia pois a maioria das aplicações modernas pro funcionarem com e por muitos protocolos e syntaxes eles sempre tem um diário de bordo neles os ditos Logs da Aplicação, Logs do servidor, Logs da Infraestrutura. Basta você escrever e mensurar os dados e informações precisas nele, aliais algumas coisas já vem por padrão, entretanto você não deve confiar muito nelas e sim pegar a vida pelos chifres e domar ela do jeito que deve ser, pois você não sabe oque esta sendo logado no diário de bordo da aplicação se não tiver algo parecido com uma funcionalidade de tratamento de erros que deve ser responsável tanto na captura quanto do fluxo da aplicação quanto o que é registrado de informação interna e é escolhida ser devolvido e exposto de forma publica.

> [!Observação]
> O fluxo fica assim Primeiro faz o registro do Log em seguida Consulta e debuga o log

#### Botando a cara tapas
Não tem nada que eu ache mais nocivo em desenvolvimento doque ficarm muito tempo sem fazer deploy para produção. É como deixar um deixar usar um carro por 3 meses e quando for usar ele denovo e não querer dar partida e ligar ou até pode ser tipo você deixar um caixa vazia sem ninguem por 1 ano ela começa se deteriorar sozinha pelo tempo e a vida mesmo.
É sempre de bom tom colocar-se para luta ou, seja para dar a cara a tapas fazendo um deploy em produção periodicamente mesmo que seja de um commit bem simples e minimo isso já faz total diferença doque demorar meses parar fazer um commit grande e inovador.

#### Aprendendo a isolar o problema
Para facilitar o entendimento de oque está acontecendo é preciso usar uma das principais táticas para resolver problemas em ambientes complexos e diversos, para ai sim descartar tudo que não for relevante é só isolar oque importa o problema em questão.
_Aqui será listado alguns pontos de destaque para um boa investigação nesse caso de logs:_
1.  Problemas Fixos, ou seja, dado uma mesma ação, retorna o mesmo erro
2.  Problemas de natureza intermitente, ou seja, dado uma ação nunca retorna o mesmo erro, sendo assim inverso do primeiro ponto
3. Diversidade nas abordagens, sempre tenha muitos métodos de como atacar um problema do mais eficaz até o mais conveniente no contexto de logs seria algo como verificar e analisar os logs do servidor, da aplicação e da sua infraestrutura pois em algum deles ira ter alguma informação relevante
4. Nunca tente absorver uma mensagem de log de erro por inteiro. Prefira scanear as informações. Procure aquilo que aparentemente faça sentido. Quais são os números e palavras que você reconhece em uma mensagem de erro?
