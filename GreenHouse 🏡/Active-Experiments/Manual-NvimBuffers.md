# Configs Buffers: Referência Rápida

> *"Um buffer é como uma mesa de trabalho digital - você pode ter vários arquivos abertos, organizá-los e alternar entre eles rapidamente."*

---

## 🤔 **O que são Buffers?**

Imagine que você está trabalhando em um projeto. Você precisa editar vários arquivos ao mesmo tempo:
- `main.py` (arquivo principal)
- `config.json` (configurações)
- `README.md` (documentação)

No Neovim, cada arquivo aberto vira um **buffer** - uma área de memória onde o arquivo fica carregado para edição. É como ter várias folhas de papel espalhadas na sua mesa, mas de forma organizada.

### 🆚 **Buffer vs Tab vs Window**
- **Buffer** = O arquivo em si (na memória)
- **Window** = A "janela" onde você vê o buffer
- **Tab** = Um conjunto de windows agrupadas

---

## 🎯 **Conceitos Fundamentais**

### **Estados de um Buffer:**
- 🟢 **Limpo** - Sem modificações
- 🟡 **Modificado** - Tem alterações não salvas (●)
- 🔴 **Erro** - Problemas de sintaxe ou LSP
- 📁 **Oculto** - Aberto mas não visível

### **Tipos de Buffer:**
- **Normal** - Arquivos comuns (.py, .lua, .md)
- **Especial** - Neo-tree, Terminal, Help
- **Temporário** - Scratch, noname

---

## 🚀 **Nível Iniciante: Primeiros Passos**

### **1. Abrindo Arquivos**
```bash
# No terminal
nvim arquivo1.py arquivo2.js arquivo3.md
```
✨ *Agora você tem 3 buffers abertos!*

### **2. Navegação Básica**
| Tecla | Ação | Como lembrar |
|-------|------|-------------|
| `H` | Buffer anterior | **H**ome = volta |
| `L` | Próximo buffer | **L**ast = vai |

**💡 Dica:** H e L são suas mãos no teclado - esquerda volta, direita avança!

### **3. Fechando Buffers**
| Tecla | Ação | Situação |
|-------|------|----------|
| `<leader>x` | Fechar atual | Arquivo salvo |
| `<leader>X` | Forçar fechar | Arquivo com erro |
| `Ctrl+q` | Fechar inteligente | **Recomendado!** |

**🎭 Cenário:** Você editou um arquivo e esqueceu de salvar. Pressiona `Ctrl+q`:
```
Buffer modificado!
[1] Salvar  [2] Descartar  [3] Cancelar
```

---

## 💪 **Nível Intermediário: Eficiência**

### **4. Navegação Direta**
Imagine que você tem 5 arquivos abertos:
```
[1] main.py  [2] utils.py  [3] config.json  [4] README.md  [5] test.py
```

| Tecla | Vai para | Exemplo |
|-------|----------|---------|
| `Alt+1` | Buffer 1 | main.py |
| `Alt+2` | Buffer 2 | utils.py |
| `Alt+3` | Buffer 3 | config.json |

**🚀 Super Poder:** Pressione `Alt+4` e você pula instantaneamente para README.md!

### **5. Organização com Pick**
Muitos buffers abertos? Use o **Buffer Pick**:

Pressione `<leader>p` e veja a mágica:
```
[a] main.py    [s] utils.py    [d] config.json
[f] README.md  [g] test.py
```
Digite `s` = vai para utils.py!

**💡 Analogia:** É como ter atalhos numerados nas abas do seu navegador.

### **6. Limpeza Estratégica**
| Tecla | Ação | Quando usar |
|-------|------|-------------|
| `<leader>bo` | Fechar outros | Focar em 1 arquivo |
| `<leader>h` | Mover buffer ← | Reorganizar |
| `<leader>l` | Mover buffer → | Reorganizar |

---

## 🎓 **Nível Avançado: Workflows Profissionais**

### **7. Workflow: Debugging**
**Situação:** Bug em produção, precisa investigar 4 arquivos relacionados.

```
1. nvim main.py error.log config.py utils.py
2. Alt+1 (main.py) - encontra o erro
3. Alt+4 (utils.py) - verifica função
4. Alt+3 (config.py) - ajusta configuração  
5. Alt+2 (error.log) - confirma correção
6. <leader>bo - fecha extras, foca no main.py
```

### **8. Workflow: Feature Development**
**Situação:** Desenvolvendo nova feature que afeta múltiplos arquivos.

```
📂 Estrutura:
├── models/user.py      [1]
├── views/user_view.py  [2] 
├── tests/test_user.py  [3]
└── docs/api.md         [4]

🔄 Fluxo:
Alt+1 → escreve model
Alt+2 → implementa view  
Alt+3 → testa código
Alt+4 → documenta API
H/L → revisa mudanças
```

### **9. Diagnósticos Visuais**
O bufferline mostra informações importantes:

```
[1] main.py ●     ← Modificado (●)
[2] utils.py      ← Limpo
[3] config.py ⚠️  ← Warning LSP
[4] broken.py ❌  ← Erro de sintaxe
```

---

## 🏢 **Nível Expert: Gestão de Sessões**

### **10. Salvando seu Trabalho**
Fim do dia, 15 buffers abertos, projeto complexo:

| Tecla | Ação | Resultado |
|-------|------|-----------|
| `<leader>ss` | Salvar sessão | Guarda tudo |
| `<leader>sr` | Restaurar sessão | Volta exatamente como estava |
| `<leader>sl` | Última sessão | Última vez que trabalhou |

**🎬 Cenário Real:**
```
17:30 - Fim do expediente
<leader>ss - Salva 12 buffers + posições

09:00 - Próximo dia  
nvim + <leader>sr - Tudo volta exatamente igual!
```

### **11. Workflow com Tabs + Buffers**
**Situação:** Trabalhando em 2 projetos simultaneamente.

```
Tab 1: Frontend          Tab 2: Backend
├── [1] App.jsx         ├── [1] server.py
├── [2] style.css       ├── [2] models.py  
└── [3] index.html      └── [3] routes.py

Navegação:
gt/gT = muda projeto
H/L = muda arquivo dentro do projeto
<leader>1 = Tab 1, <leader>2 = Tab 2
```

---

## 🔥 **Dicas de Produtividade**

### **Combinações Poderosas:**
1. **Code Review:** `Alt+1` → `Alt+2` → `Alt+1` (compara arquivos)
2. **Quick Fix:** `Ctrl+q` (se não salvou) → salva tempo
3. **Focus Mode:** `<leader>bo` → elimina distrações
4. **Project Jump:** `<leader>1` → `<leader>2` (entre projetos)

### **Sinais Visuais:**
- `●` = Arquivo modificado
- `⚠️` = Warning (ex: variável não usada)
- `❌` = Erro (código quebrado)
- `[3]` = Número do buffer para Alt+3

---

## 🎯 **Cheat Sheet Rápido**

```
🔄 NAVEGAÇÃO
H/L          = Anterior/Próximo
Alt+1-9      = Buffer direto
<leader>p    = Pick buffer

❌ FECHAR  
<leader>x    = Fechar atual
<leader>X    = Forçar fechar
Ctrl+q       = Fechar inteligente
<leader>bo   = Fechar outros

📂 ORGANIZAR
<leader>h/l  = Mover buffer
gt/gT        = Navegar tabs
Ctrl+t       = Nova tab
Ctrl+w       = Fechar tab

💾 SESSÕES
<leader>ss   = Salvar sessão
<leader>sr   = Restaurar sessão  
<leader>sl   = Última sessão
```

---

## 🎖️ **Exercícios Práticos**

### **Exercício 1: Navegação Básica**
1. Abra 3 arquivos: `nvim file1.txt file2.txt file3.txt`
2. Use `H` e `L` para navegar
3. Use `Alt+2` para ir direto ao file2.txt
4. Feche todos com `<leader>x`

### **Exercício 2: Workflow Real**
1. Abra um projeto com 5+ arquivos
2. Modifique 2 arquivos (sem salvar)
3. Use `<leader>p` para navegar
4. Use `Ctrl+q` para fechar com confirmação
5. Salve a sessão com `<leader>ss`

### **Exercício 3: Multi-Projeto**
1. Abra projeto A em Tab 1
2. Crie Tab 2 com `Ctrl+t`
3. Abra projeto B
4. Navegue entre projetos com `<leader>1` e `<leader>2`

---

## 🏆 **Conclusão**

Dominar buffers é como aprender a tocar piano - no início parece complicado, mas depois vira segunda natureza. Com essas técnicas, você vai:

- ⚡ **Navegar 10x mais rápido** entre arquivos
- 🧠 **Manter contexto mental** do projeto  
- 💾 **Nunca perder trabalho** com sessões
- 🎯 **Focar no que importa** fechando distrações

**Lembre-se:** A prática leva à perfeição. Comece com H/L e Ctrl+q, depois evolua gradualmente. Em 1 semana você estará navegando como um ninja! 🥷

---

*"O segredo não é ter todas as funcionalidades, mas dominar as que você mais usa."*