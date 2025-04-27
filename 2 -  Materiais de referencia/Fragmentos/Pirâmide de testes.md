Baseado nos conceitos de [Practical Test Pyramid, de Ham Vocke](https://github.com/paulojunior-ufla/piramide-de-teste-pratica?tab=readme-ov-file#sec-unit-tests)

_Um norte padrão para seguir na escolha de qual testes é mais adequado para o seu escopo_

**Funcionamento do esquema da pirâmide:**
- A base da pirâmide começa com os testes unitários, segundo esse conceito é o tipo de teste que seu código deveria mais ter
- Acima dele porem em menor quantidade ter um uso razoável de testes de integração, também conhecido por testes de serviços
- Por fim no topo da pirâmide de testes em menor quantidade (só o necessário) ainda do que o anterior serve para testar por completo a UI, infra e tudo mais de seu sistema 
Essa ordem vem primariamente pela ordem de execução de começar rápido e ir cadenciando até chegar no topo da pirâmide fazendo um paralelo em começar fácil e conforme o sistema avance a dificuldade também avance gradualmente

Parece que chegamos em consenso geral e essa o conceito definitivo de como lidar com testes em nossos projetos, não é mesmo? parece que chegamos em um acordo, que bom né? **Não**, com o tempo essa ideia tão difundida começou a ficar ultrapassada e arcaica no conceito de certas pessoas  indo de pirâmide de testes algo sagrado em areas como os de QA para chegar ao ponto de ser só mais uma abordagem de como lidar com os vários tipos de testes no seu workflow. agora temos diversas variantes da Pirâmide de testes como por exemplo: Trofeu de testes, Testes favo de mel (que por acaso é oque o spotify usa), Teste A/B, entre outras várias réplicas da Pirâmide de testes.

##### Qual a linha tênue que separa os de integração para os unitários afinal?
Isso vem porque Acredito que a polêmica surge porque a ideia de unidade é abstrata e não necessariamente mapeia para blocos de código. Se você "enxerga" o sistema como partes/componentes/unidades interligadas, o teste de unidade vai testar um componente. Agora, se você identifica o componente por funcionalidade, ou por classe/objeto, ou por função (em sentido estrito), isso depende da sua interpretação/modelagem/arquitetura. Eventualmente você escreverá testes de unidade para um componente que na verdade é combinação de outros: aí provavelmente também vai querer escrever testes de unidade para os componentes menores, e os testes de integração entre eles podem acabar se confundindo com os testes de unidade do componente composto. É tudo semântica, no final das contas o que importa mesmo é testar e ter a tranquilidade de mexer sabendo o que quebrou ou não.
