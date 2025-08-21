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
- `<!DOCTYPE html>`: Diz ao navegador "isso é HTML5, não HTML antigo"
- `<html lang="pt-BR">`: Define idioma (ajuda screen readers e Google)
- `<meta charset="UTF-8">`: Suporta acentos e caracteres especiais
- `<h1>`: Hierarquia de títulos (h1 é o mais importante)
- `<a href="">`: O hyperlink que conecta toda a web

## 💻 Construindo Um Dashboard Real

Vamos sair da teoria e construir algo que você usaria na vida real:

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Vendas Online</title>
</head>
<body>
    <!-- Navegação do site -->
    <nav>
        <ul>
            <li><a href="#dashboard">Dashboard</a></li>
            <li><a href="#produtos">Produtos</a></li>
            <li><a href="#clientes">Clientes</a></li>
        </ul>
    </nav>

    <!-- Conteúdo principal -->
    <main>
        <h1>Dashboard de Vendas</h1>
        
        <!-- Seção: Tabela de vendas -->
        <section>
            <h2>Vendas do Mês</h2>
            <table>
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Valor (R$)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>iPhone 15</td>
                        <td>120</td>
                        <td>240.000</td>
                    </tr>
                    <tr>
                        <td>MacBook Pro</td>
                        <td>45</td>
                        <td>180.000</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Seção: Formulário para adicionar produto -->
        <section>
            <h2>Adicionar Produto</h2>
            <form action="/produtos" method="POST">
                <label for="nome">Nome do Produto:</label>
                <input type="text" id="nome" name="nome" required>
                
                <label for="preco">Preço (R$):</label>
                <input type="number" id="preco" name="preco" step="0.01" required>
                
                <label for="categoria">Categoria:</label>
                <select id="categoria" name="categoria">
                    <option>Eletrônicos</option>
                    <option>Roupas</option>
                    <option>Casa</option>
                </select>
                
                <label for="descricao">Descrição:</label>
                <textarea id="descricao" name="descricao"></textarea>
                
                <button type="submit">Adicionar Produto</button>
            </form>
        </section>
    </main>
</body>
</html>
```

## 🔧 Cada Elemento na Prática

**Navegação (`<nav>`)**:
- Não é apenas uma lista - é o mapa do seu site
- Screen readers usam isso para navegar
- Google usa para entender estrutura do site

**Tabelas (`<table>`)**:
- Use apenas para dados tabulares (vendas, relatórios)
- `<thead>`, `<tbody>` ajudam na organização
- Nunca use tabela para layout de página

**Formulários (`<form>`)**:
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

## 💻 Site Completo e Funcional

Aqui está um exemplo real que funciona:

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechStore - Loja de Eletrônicos</title>
</head>
<body>
    <header>
        <h1>TechStore</h1>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#produtos">Produtos</a></li>
                <li><a href="#contato">Contato</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <!-- Hero Section -->
        <section id="home">
            <h2>Os Melhores Eletrônicos</h2>
            <p>Encontre iPhone, MacBook e muito mais com o melhor preço.</p>
            <img src="hero-iphone.jpg" alt="iPhone 15 em destaque" width="600" height="400">
        </section>

        <!-- Produtos -->
        <section id="produtos">
            <h2>Nossos Produtos</h2>
            
            <article>
                <h3>iPhone 15 Pro</h3>
                <img src="iphone15.jpg" alt="iPhone 15 Pro azul" width="300" height="300">
                <p>O mais avançado iPhone já criado.</p>
                <p><strong>R$ 8.999,00</strong></p>
                
                <!-- Formulário de compra -->
                <form action="/comprar" method="POST">
                    <input type="hidden" name="produto" value="iphone-15-pro">
                    <label for="quantidade">Quantidade:</label>
                    <input type="number" id="quantidade" name="quantidade" min="1" value="1">
                    <button type="submit">Comprar</button>
                </form>
            </article>

            <article>
                <h3>MacBook Pro M3</h3>
                <img src="macbook.jpg" alt="MacBook Pro aberto" width="300" height="300">
                <p>Performance profissional para criadores.</p>
                <p><strong>R$ 15.999,00</strong></p>
                
                <form action="/comprar" method="POST">
                    <input type="hidden" name="produto" value="macbook-pro-m3">
                    <label for="quantidade2">Quantidade:</label>
                    <input type="number" id="quantidade2" name="quantidade" min="1" value="1">
                    <button type="submit">Comprar</button>
                </form>
            </article>
        </section>

        <!-- Contato -->
        <section id="contato">
            <h2>Fale Conosco</h2>
            <form action="/contato" method="POST">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="assunto">Assunto:</label>
                <select id="assunto" name="assunto">
                    <option value="duvida">Dúvida sobre produto</option>
                    <option value="suporte">Suporte técnico</option>
                    <option value="reclamacao">Reclamação</option>
                </select>
                
                <label for="mensagem">Mensagem:</label>
                <textarea id="mensagem" name="mensagem" required></textarea>
                
                <button type="submit">Enviar Mensagem</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 TechStore. Todos os direitos reservados.</p>
        <nav>
            <ul>
                <li><a href="#politica">Política de Privacidade</a></li>
                <li><a href="#termos">Termos de Uso</a></li>
            </ul>
        </nav>
    </footer>
</body>
</html>
```

## 🧠 O que Você Precisa Saber

**80% do HTML que você usa será**:
- `<div>` e `<section>` para organizar
- `<h1>` até `<h3>` para títulos
- `<p>` para textos
- `<a>` para links
- `<img>` para imagens
- `<form>`, `<input>`, `<button>` para interação
- `<ul>`, `<ol>`, `<li>` para listas

**20% são os detalhes**:
- Atributos de acessibilidade
- Otimizações de SEO
- Tags semânticas específicas

---
💡 **Insight**: HTML é como LEGO para adultos. Você tem peças básicas (tags) que se encaixam de formas infinitas. A diferença é que no LEGO você constrói castelos - no HTML você constrói experiências que bilhões de pessoas vão usar. Cada `<form>` que você cria pode processar milhares de pedidos. Cada `<table>` pode mostrar dados críticos para empresas. Você não está apenas escrevendo código - está construindo a interface da economia digital.