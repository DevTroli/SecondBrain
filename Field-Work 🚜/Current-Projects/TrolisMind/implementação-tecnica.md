# 🛠️ Implementação Técnica: Hugo + Hextra Blog
*Da ideia ao deploy em produção - passo a passo completo*

## 🏗️ Stack Final Definida

### Core Stack
- **SSG:** Hugo (Go-based, super rápido)
- **Theme:** Hextra (docs-like, clean, profissional)
- **Content:** Markdown + Front Matter YAML
- **Deploy:** Vercel (automático via GitHub)
- **Versioning:** GitHub (source + deploy trigger)
- **Development:** Local Hugo server + Docker opcional

### Estrutura de Projeto
```
trolismind/
├── archetypes/
│   ├── default.md              # Modelo padrão
│   ├── post.md                 # Modelo para posts
│   ├── milestone.md            # Modelo para milestones
│   └── roadmap.md              # Modelo para roadmaps
├── assets/                    # CSS, JS e arquivos processados por Hugo Pipes
│   ├── css/
│   └── js/
├── content/
│   ├── posts/
│   │   ├── 2025/
│   │   │   ├── 09/
│   │   │   │   └── conteudo1/
│   │   │   │       └── index.md  # URL: /posts/2025/09/docker101/
│   │   │   │   └── conteudo2/
│   │   │   │       └── index.md
│   │   │   └── 08/
│   │   │       └── cybersecurity/
│   │   │           └── index.md
│   ├── milestones/
│   │   └── fundamentos/
│   │       └── fundamento1/
│   │           └── index.md       # URL: /milestones/fundamentos/docker/
│   │       └── fundamentos2/
│   │           └── index.md
│   ├── roadmaps/
│   │   ├── devops/
│   │   │   └── index.md           # URL: /roadmaps/devops/
│   │   └── security/
│   │       └── index.md
│   └── sobre/
│       └── index.md               # Página institucional /sobre/
├── data/                       # Dados em yaml, json, toml para uso dinâmico
├── i18n/                       # Traduções
├── layouts/                    # Templates HTML personalizados
│   ├── posts/
│   ├── milestones/
│   ├── roadmaps/
│   └── sobre/
├── static/                     # Arquivos estáticos diretos (images, fontes, etc.)
├── themes/                     # Temas Hugo, se aplicável
├── hugo.toml                   # Configuração geral do Hugo
├── docker-compose.yml          # Se usar containers para dev
├── .github/workflows/          # Pipeline CI/CD
└── README.md

```

---

## 🚀 Step-by-Step Implementation

### 1️⃣ Setup Inicial (10 min)

```bash
# Instalar Hugo (se não tiver)
# macOS
brew install hugo

# Ubuntu/Debian  
sudo snap install hugo

# Windows (via Chocolatey)
choco install hugo -confirm

# Verificar instalação
hugo version
```

```bash
# Criar projeto base
hugo new site trolismind
cd trolismind

# Inicializar Git
git init
git branch -M main

# Adicionar Hextra como submodule
git submodule add https://github.com/imfing/hextra.git themes/hextra
```

### 2️⃣ Configuração Base (15 min)

**hugo.toml**
```toml
baseURL = 'https://meu-blog.vercel.app'
languageCode = 'pt-br'
title = 'Troli’s Mind - My Tech Grail Diary'

# Configuração dos menus - nome, referência e ordem
[menu]
  [[menu.main]]
    name = "Posts"
    url = "/posts/"
    weight = 10
  [[menu.main]]
    name = "Roadmaps"
    url = "/roadmaps/"
    weight = 20
  [[menu.main]]
    name = "Milestones"
    url = "/milestones/"
    weight = 30
  [[menu.main]]
    name = "Sobre"
    url = "/sobre/"
    weight = 40

# Parâmetros do tema e site
[params]
  description = "Backup do cérebro tech + laboratório de comunicação"
  author = "Troli"
# Configurações do rodapé
  [params.footer]
    enable = true
    copyright = "© 2024 Troli's Mind — Conteúdo com autenticidade, profundidade e contexto"

# Configurações do Markdown e sintaxe de destaque
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
  [markup.highlight]
    style = "github"
    anchorLineNos = false
    codeFences = true
    guessSyntax = false
    hl_Lines = ""
    lineAnchors = ""
    lineNoStart = 1
    lineNos = false
    lineNumbersInTable = true
    noClasses = true
    tabWidth = 4


# Taxonomias pensando na semântica editorial do manifesto
[taxonomies]
  tag = "tags"
  milestone = "milestones"
  roadmap = "roadmaps"
  posttype = "posttypes"
  offtopic = "offtopics"

# Configuração de permalinks para refletir URLs padronizadas
[permalinks]
  posts = "/posts/:year/:month/:slug/"
  milestones = "/milestones/:sections/:slug/"
  roadmaps = "/roadmaps/:slug/"
  sobre = "/sobre/"

# Sitemap configurado para trazer URLs importantes e organização
[sitemap]
  changefreq = "monthly"
  priority = 0.5
  filename = "sitemap.xml"

# Configuração SEO e social sharing (caso deseje expandir)
[params.seo]
  enable = true
  twitterCard = "summary_large_image"
  defaultImage = "/images/og-default.jpg"

# Hextra configurações específicas, caso queira usar
[params.hextra]
  showThemeCredit = false

```

### 3️⃣ Estrutura de Conteúdo (20 min)

**content/_index.md** (Homepage)
```yaml
---
title: "The Grail Diary"
layout: hextra-home
---

{{< hextra/hero-badge >}}
  <div class="hx-w-2 hx-h-2 hx-rounded-full hx-bg-primary-400"></div>
  <span>Backup do cérebro tech</span>
{{< /hextra/hero-badge >}}

<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline >}}
  Onde experiência tech&nbsp;<br class="sm:hx-block hx-hidden" />encontra comunicação humana
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">
{{< hextra/hero-subtitle >}}
  RANTs construtivos, deep dives técnicos e lições de carreira.&nbsp;<br class="sm:hx-block hx-hidden" />
  Para devs que querem comunicar melhor e profissionais que trabalham com tech.
{{< /hextra/hero-subtitle >}}
</div>

{{< hextra/hero-button text="Começar pelos Roadmaps" link="/roadmaps" >}}
{{< hextra/hero-button text="Explorar Posts" link="/posts" style="secondary" >}}

## Por que este blog existe

Sou desenvolvedor. Como todo dev, sou péssimo comunicando ideias complexas. 
Este blog é meu laboratório pessoal para consertar isso, enquanto documento 
minha jornada tech para não esquecer daqui 3 anos.

## Como navegar

- **📍 Roadmaps:** Bússolas para quando você não sabe por onde ir
- **📖 Milestones:** Minhas experiências organizadas em sagas  
- **✍️ Posts:** RANTs, análises técnicas e field notes
```

**content/posts/_index.md**
```yaml
---
title: "Posts"
description: "Todos os posts organizados por data e tema"
---

# Posts

Experiências, análises e insights organizados em ordem cronológica. 
Use os filtros para encontrar por tema ou milestone específica.
```

**content/roadmaps/_index.md**
```yaml
---
title: "Roadmaps"  
description: "Bússolas para navegar no mundo tech"
---

# Roadmaps

*"Se você não sabe aonde quer ir, qualquer caminho serve pois qualquer caminho vai dar em nada"* - Gato de Alice

Trilhas curadas para diferentes aspectos da carreira tech. Cada roadmap conecta teoria, prática e experiências reais.

{{< cards >}}
  {{< card link="/roadmaps/fundamentos-dev" title="Fundamentos de Desenvolvimento" subtitle="Da lógica aos padrões de design" >}}
  {{< card link="/roadmaps/arquitetura-sistemas" title="Arquitetura de Sistemas" subtitle="Do monolito aos microserviços" >}}
  {{< card link="/roadmaps/carreira-tech" title="Carreira Tech" subtitle="Do júnior ao tech lead" >}}
{{< /cards >}}
```

### 4️⃣ Primeiro Post de Exemplo (15 min)

**content/posts/manifesto-grail-diary.md**
```yaml
---
title: "Manifesto: Por que este blog existe"
date: 2024-12-28T10:00:00-03:00
draft: false
tags: ["manifesto", "comunicacao", "meta"]
milestone: "foundations"
roadmap: ["fundamentos-dev"]
description: "Por que programadores são péssimos comunicadores e como pretendo consertar isso em mim"
---

## O Problema Real

Sou desenvolvedor há X anos. Sei resolver problemas técnicos complexos, mas quando preciso explicar minhas decisões para um PM, CEO, ou mesmo outro dev de área diferente, acontece aquele momento constrangedor:

*"Ah, é óbvio! Você não entende porque..."*

E aí me dou conta: o burro aqui sou eu, que não consegue explicar.

## Por que Escrever?

Este blog nasceu da necessidade de consertar essa falha. Inspirado pela sabedoria do [Akita](https://akitaonrails.com/), descobri que:

1. **Blog como backup do cérebro:** Para não esquecer como resolvi problema X daqui 3 anos
2. **Exercício de comunicação:** Cada post é prática deliberada para explicar melhor
3. **Ponte entre mundos:** Conectar complexidade técnica com impacto humano

## Para Quem é Este Blog

**Para você que:**
- Tem conhecimento técnico mas luta para comunicar valor
- Quer profundidade além dos tutoriais de 5 minutos  
- Busca experiências reais, não apenas teoria
- Valoriza contexto tanto quanto código

**Não é para quem quer:**
- Tutoriais step-by-step básicos
- Hype sobre últimas tecnologias
- Conteúdo sempre positivo sem nuances

## O Que Prometo

- **Autenticidade brutal:** Só experiências reais
- **RANTs construtivos:** Frustração + análise técnica
- **Conexões úteis:** Como isso impacta seu trabalho
- **Evolução pública:** Admito quando mudo de opinião

## Como Navegar

Este blog tem duas formas de navegar:

### 🗺️ Roadmaps
Bússolas para quando você está perdido. Trilhas curadas que conectam conhecimentos dispersos com contexto prático.

### 📖 Milestones  
Minhas experiências organizadas em sagas. Acompanhe minha evolução como profissional e pessoa.

---

**Bem-vindo ao meu Grail Diary. Vamos documentar essa jornada juntos.**
```

### 5️⃣ DevOps Setup (Opcional - 10 min)

**docker-compose.yml**
```yaml
version: '3.8'

services:
  hugo:
    image: hugomods/hugo:latest
    container_name: blog-hugo-dev
    volumes:
      - .:/src
    ports:
      - "1313:1313"
    command: hugo server --bind 0.0.0.0 --buildDrafts --disableFastRender
    environment:
      - HUGO_ENV=development
    working_dir: /src

  # Opcional: para processar imagens  
  imagemin:
    image: node:18-alpine
    container_name: blog-imagemin
    volumes:
      - ./static/images:/app/images
    working_dir: /app
    command: sh -c "npm install imagemin imagemin-pngquant imagemin-mozjpeg && node process-images.js"
    profiles: ["tools"]
```

**Makefile** (para comandos rápidos)
```makefile
.PHONY: dev build deploy clean

# Desenvolvimento local
dev:
	hugo server --buildDrafts --disableFastRender

# Com Docker  
dev-docker:
	docker-compose up hugo

# Build para produção
build:
	hugo --gc --minify

# Novo post
post:
	@read -p "Título do post: " title; \
	hugo new "posts/$$(echo $$title | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g').md"

# Limpar arquivos temporários
clean:
	rm -rf public/ resources/
```

### 6️⃣ Deploy Automático (15 min)

**.github/workflows/deploy.yml**
```yaml
name: Deploy Hugo site to Vercel

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout
      uses: actions/checkout@v4
      with:
        submodules: recursive
        fetch-depth: 0

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
        hugo-version: 'latest'
        extended: true

    - name: Build
      run: |
        hugo --gc --minify --baseURL ${{ secrets.BASE_URL }}

    - name: Deploy to Vercel
      uses: amondnet/vercel-action@v25
      with:
        vercel-token: ${{ secrets.VERCEL_TOKEN }}
        github-token: ${{ secrets.GITHUB_TOKEN }}
        vercel-args: '--prod'
        vercel-org-id: ${{ secrets.ORG_ID}}
        vercel-project-id: ${{ secrets.PROJECT_ID}}
        working-directory: ./public
```

**vercel.json**
```json
{
  "build": {
    "env": {
      "HUGO_VERSION": "0.121.0"
    }
  },
  "redirects": [
    {
      "source": "/rss.xml",
      "destination": "/index.xml",
      "permanent": true
    }
  ],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options", 
          "value": "DENY"
        }
      ]
    }
  ]
}
```

---

## 🔄 Development Workflow

### Daily Workflow
```bash
# Iniciar desenvolvimento
make dev
# ou com Docker
make dev-docker

# Criar novo post
make post
# Vai perguntar o título e criar o arquivo com template

# Preview local
open http://localhost:1313

# Commit & push (deploy automático)
git add .
git commit -m "feat: novo post sobre X"
git push origin main
```

### Estrutura de Branches
```bash
# Main branch: produção
main/

# Feature branches para posts grandes
feature/serie-microservices
feature/roadmap-arquitetura

# Hotfix para correções urgentes
hotfix/typo-post-X
```

### Content Creation Workflow
```bash
# 1. Criar ideia no Obsidian (template de captura)
# 2. Quando pronto para escrever:
make post
# Título: "RANT - Por que microservices são cilada"

# 3. Escrever no arquivo gerado:
# content/posts/rant-por-que-microservices-sao-cilada.md

# 4. Testar localmente
hugo server -D

# 5. Review & publish
git add .
git commit -m "post: RANT sobre microservices"
git push origin main
```

## 🎯 Próximos Passos Imediatos

### Hoje (30 min)
```bash
# 1. Setup básico
hugo new site meu-blog-tech
cd meu-blog-tech
git submodule add https://github.com/imfing/hextra.git themes/hextra

# 2. Configuração inicial
# Copie o hugo.toml acima
# Crie content/_index.md

# 3. Primeiro teste
hugo server -D
# Abra http://localhost:1313
```

### Esta Semana  
- [ ] Deploy no Vercel configurado
- [ ] GitHub Actions funcionando
- [ ] Primeiro post publicado
- [ ] Estrutura de roadmaps/milestones criada

### Próximas 2 Semanas
- [ ] 3-5 posts iniciais
- [ ] Primeiro roadmap completo
- [ ] Primeira milestone iniciada  
- [ ] Workflow de desenvolvimento estabilizado

## 🔧 Troubleshooting Common Issues

### Hugo não reconhece o tema
```bash
# Verificar submodule
git submodule status
git submodule update --init --recursive
```

### Build falhando no deploy
```bash
# Verificar hugo.toml
hugo --gc --minify --verbose
```

### Performance lenta  
```bash
# Usar hugo --gc --minify para produção
# Verificar tamanho das imagens
```