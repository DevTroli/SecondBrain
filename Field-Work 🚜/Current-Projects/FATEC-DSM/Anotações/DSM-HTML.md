# HTML na Prática - Da Tag ao Site Real

## 🎯 HTML: A Linguagem que Tim Berners-Lee Criou

Tim Berners-Lee tinha um problema nos anos 90: como conectar documentos científicos de forma não-linear? Sua solução revolucionou tudo: **hyperlinks** - textos que podem "pular" para outros textos, criando uma web de conhecimento interconectado.

HTML não é sobre fazer páginas bonitas. É sobre estruturar informação de forma que máquinas entendam e humanos naveguem.

## 🔧 As Tags que Realmente Importam

**A Estrutura Mínima Funcional**:
```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Meu Site</title>
</head>
<body>
    <h1>Título Principal</h1>
    <p>Texto normal com <a href="outro-site.com">um link</a>.</p>
</body>
</html>
```

**Por que cada tag importa**:
- `<!DOCTYPE html>`: Liz ao navegador "isso é HTML5, não HTML antigo"
- `<html lang="pt-BR">`: Define idioma (ajuda screen readers e Google)
- `<meta charset="UTF-8">`: Suporta acentos e caracteres especiais
- `<h1>`: Hierarquia de títulos (h1 é o mais importante)
- `<a href="">`: O hyperlink que conecta toda a web

## 🔧 Cada Elemento na Prática

**Navegação (`<nav>`)**:
- Não é apenas uma lista - é o mapa do seu site
- Screen readers usam isso para navegar
- Google usa para entender estrutura do site

## 📊 Tabelas: O HTML Puro da Era Clássica

**Tabelas (`<table>`)** - A arte perdida do HTML sem semântica :[1][2]
- Use **apenas para dados tabulares** (vendas, relatórios, planilhas)
- Nunca use tabela para layout de página - isso é coisa do passado
- Mas quando precisar de uma tabela de dados real, domine completamente

### **Estrutura Básica da Tabela Clássica**

```html
<table border="1" cellpadding="5" cellspacing="2" width="100%">
    <caption>Vendas do Mês de Janeiro</caption>
    
    <thead>
        <tr>
            <th>Produto</th>
            <th>Vendedor</th>
            <th>Valor</th>
        </tr>
    </thead>
    
    <tbody>
        <tr>
            <td>Notebook Dell</td>
            <td>João Silva</td>
            <td>R$ 2.500,00</td>
        </tr>
        <tr>
            <td>Mouse Logitech</td>
            <td>Maria Santos</td>
            <td>R$ 89,90</td>
        </tr>
    </tbody>
    
    <tfoot>
        <tr>
            <td colspan="2"><strong>Total:</strong></td>
            <td><strong>R$ 2.589,90</strong></td>
        </tr>
    </tfoot>
</table>
```

### **Anatomia das Tags de Tabela**

**Tags de Estrutura** :
- `<table>`: Contêiner principal da tabela
- `<tr>`: Table row - cada linha da tabela  
- `<td>`: Table data - célula de dados comum
- `<th>`: Table header - célula de cabeçalho (automaticamente em negrito e centralizada)

**Tags Semânticas Organizacionais** :
- `<thead>`: Cabeçalho da tabela - onde ficam os títulos das colunas
- `<tbody>`: Corpo da tabela - onde ficam os dados principais
- `<tfoot>`: Rodapé da tabela - totais, médias, observações
- `<caption>`: Legenda da tabela - descrição do que a tabela representa[6][7]

### **Atributos Clássicos que Controlam Aparência**

**Bordas e Dimensões** :
```html
<table border="2" width="500" height="300">
```
- `border="1"`: Espessura da borda em pixels
- `width="100%"` ou `width="500"`: Largura em porcentagem ou pixels  
- `height="200"`: Altura da tabela

**Espaçamento - A Arte do Cellpadding e Cellspacing** :
```html
<table cellpadding="10" cellspacing="5">
```
- `cellpadding="10"`: Espaço **interno** entre o conteúdo e a borda da célula
- `cellspacing="5"`: Espaço **externo** entre as células adjacentes

**Cores de Fundo** :
```html
<table bgcolor="yellow">
<tr bgcolor="lightblue">
```

## 🔧 Formulários (`<form>`)**:
- `action`: para onde enviar os dados
- `method="POST"`: para dados sensíveis/grandes
- `required`: validação automática do navegador
- `label for="id"`: conecta rótulo ao campo (acessibilidade)

**Inputs Essenciais**:
```html
<input type="text">      <!-- Texto geral -->
<input type="email">     <!-- Valida email automaticamente -->
<input type="number">    <!-- Só aceita números -->
<input type="date">      <!-- Calendário nativo -->
<input type="file">      <!-- Upload de arquivos -->
<textarea>               <!-- Textos longos -->
<select>                 <!-- Lista de opções -->
```

## 🔧 Imagens e Mídia que Funcionam

**Imagem Responsiva**:
```html
<img src="produto.jpg" 
     alt="iPhone 15 na cor azul" 
     width="400" 
     height="300"
     loading="lazy">
```

**Vídeo Simples**:
```html
<video controls width="640" height="360">
    <source src="demo-produto.mp4" type="video/mp4">
    <p>Seu navegador não suporta vídeo.</p>
</video>
```

**Por que estes atributos importam**:
- `alt`: Screen readers leem isso para pessoas cegas
- `loading="lazy"`: Carrega imagem só quando usuário rolar até ela
- `width/height`: Evita "pulo" da página quando imagem carrega

## 🔧 Listas que Organizam

**Lista de Navegação**:
```html
<nav>
    <ul>
        <li><a href="#home">Home</a></li>
        <li>
            <a href="#produtos">Produtos</a>
            <ul>
                <li><a href="#iphone">iPhone</a></li>
                <li><a href="#macbook">MacBook</a></li>
            </ul>
        </li>
    </ul>
</nav>
```

**Lista de Características**:
```html
<section>
    <h3>Características do iPhone 15</h3>
    <ul>
        <li>Tela de 6.1 polegadas</li>
        <li>Chip A17 Pro</li>
        <li>Câmera de 48MP</li>
        <li>USB-C</li>
    </ul>
</section>
```

## 🔗 Conexão com Cliente-Servidor

Quando você faz `<form action="/produtos" method="POST">`, está criando uma ponte entre seu HTML (cliente) e o servidor. O navegador empacota os dados do formulário e envia via HTTP - exatamente o processo que estudamos no capítulo anterior.

## 🧠 HTML Semântico na Prática

**Antes (HTML antigo)**:
```html
<div id="header">...</div>
<div id="nav">...</div>
<div id="content">...</div>
```

**Agora (HTML5 semântico)**:
```html
<header>...</header>
<nav>...</nav>
<main>...</main>
```

**Por que semântica importa**:
- Google entende melhor seu conteúdo (SEO)
- Screen readers navegam melhor
- Seu CSS fica mais limpo
- Outros desenvolvedores entendem seu código

## 🧠 O que Você Precisa Saber

**80% do HTML que você usa será**:
- `<div>` e `<section>` para organizar
- `<h1>` até `<h3>` para títulos
- `<p>` para textos
- `<a>` para links
- `<img>` para imagens
- `<form>`, `<input>`, `<button>` para interação
- `<ul>`, `<ol>`, `<li>` para listas
- **`<table>`, `<tr>`, `<td>`, `<th>` para dados tabulares reais**

***
💡 **Insight**: HTML é como LEGO para adultos. Você tem peças básicas (tags) que se encaixam de formas infinitas. A diferença é que no LEGO você constrói castelos - no HTML você constrói experiências que bilhões de pessoas vão usar. Cada `<form>` que você cria pode processar milhares de pedidos. **Cada `<table>` pode mostrar dados críticos que definem o rumo de empresas inteiras**. Você não está apenas escrevendo código - está construindo a interface da economia digital. E quando um CEO olha um relatório de vendas na tela, ele está vendo sua tabela HTML funcionando perfeitamente, célula por célula, dados organizados como uma planilha digital que roda em qualquer navegador do mundo.