# Código Organizado, Projeto Sustentável: Princípios de Arquitetura de Software

## Desmistificando Conceitos e Estruturas

Na jornada do desenvolvimento de software, frequentemente confundimos os conceitos de arquitetura de software e organização de pastas. Essa confusão, aparentemente simples, pode levar a projetos confusos, difíceis de manter e que eventualmente sucumbem sob o peso de sua própria complexidade. Vamos explorar esses conceitos para entender como podemos construir sistemas que são ao mesmo tempo simples e poderosos.

### Arquitetura de Software ≠ Organização de Pastas

Primeiro, precisamos esclarecer: **arquitetura de software não é meramente organização de pastas**. Embora a estrutura de diretórios possa refletir decisões arquiteturais, a verdadeira arquitetura reside em algo mais profundo.

A arquitetura de software é definida pelo escopo dos componentes – onde eles começam e terminam – e pelo tipo de interação entre eles. Cada estilo arquitetural representa uma abordagem distinta para definir esses escopos e interações. Em essência, a arquitetura determina as regras do jogo, enquanto a estrutura de pastas é apenas uma manifestação física dessas regras.

### O Impacto da Complexidade

A complexidade excessiva na arquitetura e na organização de pastas pode tornar o código fonte menos intuitivo, criando barreiras para novos colaboradores. Quando você impõe um escopo e interações que apenas você compreende completamente, está essencialmente construindo um labirinto que outros terão dificuldade em navegar.

Como podemos ver no exemplo do barbeiro na discussão sobre [[Overengineering#A Analogia do Barbeiro | Over Engineering]], há um perigo em cortar demais – em adicionar complexidade desnecessária que não pode ser facilmente revertida. No contexto da arquitetura, isso significa estabelecer padrões rígidos e estruturas complicadas que eventualmente limitam a flexibilidade do projeto.

### A Potência da Simplicidade Bem Modelada

> "Uma arquitetura simples com uma ótima modelagem faz seu projeto ir muito longe!"

Esta frase captura perfeitamente a essência do equilíbrio que buscamos. A combinação de uma arquitetura que não é excessivamente complexa, mas que apresenta uma modelagem cuidadosa e bem pensada, pode proporcionar uma base sólida para o crescimento do projeto.

Steve Jobs dizia que "a simplicidade é a sofisticação máxima", e isso se aplica perfeitamente à arquitetura de software. Um sistema simples mas bem concebido terá sempre vantagem sobre um sistema complexo e confuso, especialmente quando consideramos a manutenção e evolução a longo prazo.

### O Underengineering na Ausência de Arquitetura

Em muitas empresas que não são referência em tecnologia, é comum encontrar projetos sem uma arquitetura de software claramente definida – apenas um amontoado de código em diversas pastas, sem começo nem fim definidos, sem interações eficazes entre componentes, e sem responsabilidades claras.

Esse cenário caracteriza o underengineering – a falta de engenharia suficiente. É o oposto do overengineering, mas igualmente problemático. Sem uma estrutura adequada, o código rapidamente se torna um emaranhado difícil de entender, manter ou expandir.

## Estilos de Arquitetura

Existem diversos estilos arquiteturais, cada um com suas próprias vantagens e contextos ideais de aplicação. Vamos explorar alguns dos mais relevantes:

### MVC (Model-View-Controller)

Criado em 1979, o MVC permanece como um dos padrões arquiteturais mais comuns em projetos web. Sua longevidade é testemunho de sua eficácia e adaptabilidade.

O MVC divide a aplicação em três componentes interconectados:

1. **Model (Modelo)**: Responsável pela lógica de negócios e acesso a dados. É o coração da aplicação, contendo as regras que governam como os dados podem ser manipulados e transformados.

2. **View (Visão)**: Responsável pela apresentação dos dados ao usuário. A View recebe dados do Model e os exibe de forma apropriada.

3. **Controller (Controlador)**: Age como um intermediário entre Model e View, processando as solicitações do usuário, manipulando os dados através do Model, e selecionando a View apropriada para exibição.

O MVC promove a separação de responsabilidades, facilitando a manutenção e permitindo que múltiplos desenvolvedores trabalhem em diferentes componentes simultaneamente. Sua clareza conceitual o torna particularmente adequado para projetos web, onde as interfaces de usuário estão claramente separadas da lógica de negócios.

### MTV (Model-Template-View)

O MTV é uma variação do MVC popularizada pelo framework Django. Enquanto conceitualmente similar ao MVC, o MTV renomeia e redefine ligeiramente os componentes:

1. **Model**: Similar ao Model do MVC, gerencia os dados e a lógica de negócios.

2. **Template**: Corresponde aproximadamente à View do MVC, sendo responsável pela apresentação e formatação dos dados.

3. **View**: Mais próximo do Controller do MVC, processa as solicitações e determina quais dados serão exibidos.

Esta abordagem é particularmente eficaz em frameworks web que utilizam sistemas de templates para gerar HTML dinamicamente.

### Clean Architecture

Desenvolvida por Robert C. Martin (Uncle Bob), a Clean Architecture propõe uma abordagem em camadas que enfatiza a separação de responsabilidades e a independência de frameworks e ferramentas.

As camadas típicas da Clean Architecture incluem:

1. **Entities**: Representam os objetos de negócio da aplicação.

2. **Use Cases**: Implementam a lógica de negócios específica da aplicação.

3. **Interface Adapters**: Convertem dados entre o formato mais conveniente para use cases e entities, e o formato requerido por elementos externos como UI e banco de dados.

4. **Frameworks and Drivers**: A camada mais externa, contendo frameworks, ferramentas e sistemas de entrega.

A regra fundamental da Clean Architecture é que as dependências só podem apontar para dentro, ou seja, código em uma camada interna não deve conhecer nada sobre camadas externas.

Esta arquitetura promove a testabilidade e a manutenibilidade, permitindo que as regras de negócio sejam desenvolvidas e testadas independentemente de preocupações externas.

## Uma Proposta Prática: Arquitetura para Projetos Next.js

Considerando a discussão na issue compartilhada e os princípios discutidos, podemos propor uma estrutura que seja ao mesmo tempo simples e eficaz para projetos Next.js, equilibrando a necessidade de organização com a evitação do overengineering.

```
📦 root/
├─ 📁 src/
│  ├─ 📁 components/   # Componentes React reutilizáveis
│  │  ├─ 📁 global/    # Componentes utilizados em todo o projeto
│  │  └─ 📁 ui/        # Componentes de interface sem lógica de negócio
│  │
│  ├─ 📁 hooks/        # Hooks React personalizados
│  │
│  ├─ 📁 contexts/     # Context API para gerenciamento de estado global
│  │
│  ├─ 📁 pages/        # Estrutura do Next.js para rotas
│  │  ├─ 📁 feature/   # Páginas agrupadas por funcionalidade
│  │  │  └─ 📄 index.js # Ponto de entrada da funcionalidade
│  │  └─ 📁 api/       # Endpoints da API do Next.js
│  │
│  ├─ 📁 models/       # Modelos de dados e lógica de negócio central
│  │
│  ├─ 📁 services/     # Serviços para comunicação com APIs externas
│  │
│  └─ 📁 utils/        # Funções utilitárias e helpers
│
├─ 📁 public/          # Arquivos estáticos
├─ 📁 tests/           # Testes
├─ 📄 next.config.js   # Configuração do Next.js
└─ 📄 package.json
```

Esta estrutura segue alguns princípios importantes:

1. **Separação de Responsabilidades**: Mantém uma clara distinção entre componentes, lógica de negócio e apresentação.

2. **Escalabilidade**: Permite adicionar novas funcionalidades sem sobrecarregar diretórios existentes.

3. **Intuitividade**: A organização é relativamente autoexplicativa, facilitando que novos desenvolvedores entendam onde cada coisa está localizada.

4. **Flexibilidade**: Não impõe estruturas rígidas dentro das pastas, permitindo adaptação às necessidades específicas do projeto.

#### Reflexões sobre a Discussão na Issue

A discussão na da [issue: propostas de arquitetura e pastas](https://github.com/filipedeschamps/tabnews.com.br/issues/12) traz algumas perspectivas interessantes sobre como estruturar um projeto Next.js. A proposta inicial sugere uma separação clara entre componentes globais, hooks, contextos e módulos específicos para cada página.

Uma observação particularmente valiosa foi feita por @filipedeschamps:

> "Algo lá no fundo da minha cabeça diz que a gente deveria se isolar ao máximo do Next.js, por exemplo programar o máximo que der tudo de funcionalidade numa pasta core que é cega ao que é implementado dentro da visão do Next.js..."

Esta perspectiva alinha-se perfeitamente com os princípios da Clean Architecture, onde as regras de negócio devem ser independentes de frameworks e ferramentas. Ao isolar a lógica central do projeto do framework Next.js, estamos criando uma aplicação mais resiliente a mudanças e mais fácil de testar.

A sugestão do @pscruzzz de utilizar o pageExtension para melhor organizar as páginas também é valiosa, pois permite uma estrutura de diretórios mais flexível sem violar as convenções do Next.js.

## Encontrando o Equilíbrio

A arquitetura de software, assim como muitos aspectos do desenvolvimento, é uma busca constante pelo equilíbrio entre simplicidade e funcionalidade. Não existe uma solução única que atenda a todos os projetos – o que existe são princípios e padrões que podemos adaptar às nossas necessidades específicas.

Ao abordar a arquitetura de um novo projeto, considere:

1. **Qual é o escopo do projeto?** Um projeto pequeno pode não necessitar de uma arquitetura elaborada, enquanto projetos maiores se beneficiam de estruturas mais claras.

2. **Quem vai trabalhar no projeto?** Se várias pessoas estarão contribuindo, uma organização mais clara e documentada pode ser necessária.

3. **Quais são as prioridades?** Velocidade de desenvolvimento inicial, facilidade de manutenção a longo prazo, testabilidade – diferentes prioridades podem levar a diferentes escolhas arquiteturais.

Lembre-se sempre que o objetivo da arquitetura não é criar a estrutura mais impressionante ou tecnicamente sofisticada, mas sim proporcionar uma base sólida que permita que o projeto cresça e evolua de forma sustentável.

A capacidade de modificação – de adaptar-se às mudanças de requisitos e às novas tecnologias – é a verdadeira medida do sucesso de uma arquitetura. E isso frequentemente é melhor alcançado através da simplicidade cuidadosamente planejada do que através da complexidade impensada.

Para melhor entendimento atente-se o princípio discutido no texto sobre [[Overengineering]]  : ![[Overengineering#Entre o caos & Equilíbrio]]