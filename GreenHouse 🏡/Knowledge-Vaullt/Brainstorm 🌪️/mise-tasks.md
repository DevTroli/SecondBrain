### Definição
O mise é um gerenciador universal de versões e tarefas para projetos de software. O recurso Monorepo Tasks permite organizar e executar tarefas em múltiplos projetos dentro de um mesmo repositório, cada um com suas próprias ferramentas e comandos.

### Aplicação
Ideal para monorepos com projetos diferentes (ex: frontend em Next.js e backend em Django), facilitando o gerenciamento de versões e execução de tarefas específicas de cada projeto.

### Como implementar
1. Ative o Monorepo Tasks no `mise.toml` da raiz com `experimental_monorepo_root = true`.
2. Defina as versões das ferramentas na raiz e sobrescreva nos projetos se necessário.
3. Crie tarefas nos arquivos `mise.toml` de cada projeto.
4. Execute tarefas com comandos como `mise //frontend:build` ou `mise //backend:test`.

### Vantagens
- Gerenciamento centralizado de versões e tarefas.
- Execução fácil de comandos em qualquer projeto do monorepo.
- Menos scripts personalizados e menos erros de ambiente.
---

### Exemplo prático: Mise Monorepo Tasks com Next.js e Django

#### 1. Estrutura de pastas

```
my-monorepo/
├── frontend/
│   └── mise.toml
├── backend/
│   └── mise.toml
└── mise.toml
```

#### 2. Configuração do mise na raiz
No arquivo `my-monorepo/mise.toml`:

```toml
experimental_monorepo_root = true
[tools]
node = "20"
python = "3.12"
```

#### 3. Configuração do mise no frontend (Next.js)
No arquivo `frontend/mise.toml`:

```toml
[tools]
node = "20"

[tasks.build]
cmd = "npm run build"
desc = "Build do Next.js"

[tasks.dev]
cmd = "npm run dev"
desc = "Servidor de desenvolvimento Next.js"
```

#### 4. Configuração do mise no backend (Django)
No arquivo `backend/mise.toml`:

```toml
[tools]
python = "3.12"

[tasks.run]
cmd = "python manage.py runserver"
desc = "Servidor Django"

[tasks.test]
cmd = "pytest"
desc = "Testes Django"
```

#### 5. Rodando tarefas com mise

- Para rodar o build do Next.js de qualquer lugar:
  ```
  mise //frontend:build
  ```
- Para rodar os testes do Django:
  ```
  mise //backend:test
  ```
- Para rodar todos os servidores (se ambos tiverem a tarefa "run"):
  ```
  mise //...:run
  ```

O mise cuida de usar a versão certa de Node ou Python para cada projeto e executa o comando na pasta correta.