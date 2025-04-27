## Interface (Programática de aplicações)
Considere que tudo na web como uma interface (oque é verdade de modo bruto tudo é mesmo), do mesmo jeito que o google ou youtube são uma interface, o seu microondas também tem uma nterface (Programática própria) que você não entende 100% de como ela ela funciona mas entende o basico para usar de acordo com sua proposta de uso, porque tudo que você interage, "cavulca" na tecnologia mas não interfere em seus detalhes de funcionamento técnico isso torna esse seu objeto de interação com a tecnologia uma interface, justamente para evitar em mexer o nucleo técnico do seu sistema ou aparelho  eletronico e é basicamente essa a propsota de uso adequade de uma API **Usar uma interface como preocupação de evitar que você mexe no detalhes técnicos do produto**
É por isso que Abstrações e interfaces existem de monte ultimamente, isso é para você evitar de mexer no que não deve ou não sabe sobre os detalhes de implementação técnica

###### Programável Vs Gráfica e porque as maquinas preferem as programáveis
<-- Desenvolver melhor uma ideia mais elaborada sobre esse asunto e seus conceitos -->
(Porque a modularidade das API são por vias programática e seria um grande erro se elas fossem  guiadas por interfaces gráficas e seus ruídos da web)

**Como melhorar (via API) a usabilidade do usuário sem dificultar o trabalho das maquinas ?**

#### Versionamento de API
Uma interface Gráfica (Web) tende muito mais a mudar com o tempo se comparado com uma interface programática (API) como foi dito acima, porém uma APi também pode mudar conforme o tempo (não por layout ou UX igual na Web), ela não possui uma layout assim por dizer porque ela trabalha com informação pura em textos de forma estruturada (como em arquivos JSON, XML, GraphQl), só tende a necessidade de fornecer as informações requisitadas por meio de uma interface como dito explicado acima sobre interfaces, podemos organizar essas mudanças na APi em duas grandes categorias:

1. Breaking Changes -> Quando um script se integra na API e isso faz ela quebrar de vez

> [!Explicação]
> Isso acontece se você por exemplo for trocar uma informação essencial de dentro da APi tipo trocar username para nome_usuario, isso vai ser uma quebra nas diretrizes e protocolos que já estavam estabelecidos (nesse caso o username) assim quebrando o fluxo de comunicação por protocolos fazendo que ela pare de funcionar por mal funcionamento, ou seja, tudo que for feito e não tiver mais compatibilidade com as versões anteriores (isso do conceito em inglês de Backward compatibility)

2. Non-breaking Change -> Quando for adicionar uma nova propriedade na API existente

> [!Explicação]
> Conteudo sobre como uma non-breaking Change ocorre

##### Estratégias de versionamento na API

**(A mais aceita no mundo tech) URL Path Versioning:**
``` bash
https://www.tabnews.com.br/api/v1/contentes
https://www.tabnews.com.br/api/v2/contentes
```

**Header Versioning:**
```
Accepts-version: 1.5
Accepts-Version: 2025-04-27
```


