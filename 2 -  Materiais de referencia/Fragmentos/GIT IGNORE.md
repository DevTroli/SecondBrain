# **Introdução ao .gitignore**

O `.gitignore` é um arquivo de texto que define quais arquivos ou diretórios o Git deve **ignorar** (não rastrear). Ele evita que:  
- Arquivos temporários (ex: `.log`, `.tmp`),  
- Dependências (ex: `node_modules/`),  
- Arquivos sensíveis (ex: `.env`, chaves SSH),  
- Ou arquivos específicos do ambiente (ex: `.DS_Store` no macOS) sejam commitados acidentalmente.  

---

## **Começando com o .gitignore: Criando e Usando ele**  
#### 1. **Criando o Arquivo**  
   - Na raiz do repositório, crie um arquivo chamado `.gitignore`:  
     ```bash  
     touch .gitignore  
     ```  
   - **Observação**: O nome deve ser exatamente `.gitignore` (incluindo o ponto inicial).  

#### 2. **Sintaxe Básica**  
   - **Ignorar um arquivo específico**:  
     ```  
     senhas.txt  
     ```  
   - **Ignorar uma extensão**:  
     ```  
     *.log  
     ```  
   - **Ignorar um diretório**:  
     ```  
     node_modules/  
     ```  
   - **Comentários**: Use `#` para adicionar notas:  
     ```  
     # Ignorar arquivos temporários  
     *.tmp  
     ```  

### **Boas Práticas**  
1. **O Que Ignorar**:  
   - Dependências (`node_modules/`, `vendor/`),  
   - Arquivos de build (`dist/`, `*.jar`),  
   - Configurações locais (`.env.local`),  
   - Arquivos de IDE (`.vscode/`, `.idea/`).  

2. **Segurança**:  
   **Nunca** commit arquivos com:  
   - Credenciais (`.env`, `*.pem`),  
   - Tokens de API ou senhas.  

3. **Use Templates Prontos**:  
   Reutilize templates para linguagens específicas no [GitHub Ignore Templates](https://github.com/github/gitignore).  

---

### **Recursos Avançados**  
#### 1. **Padrões Globais**  
   - **Ignorar tudo em um diretório**:  
     ```  
     logs/**/*  
     ```  
     O `**` corresponde a qualquer subdiretório aninhado.  

   - **Exceções (negação)**: Use `!` para não ignorar algo:  
     ```  
     *.txt       # Ignora todos .txt  
     !importante.txt  # Exceto este  
     ```  

#### 2. **Ignorar em Subdiretórios**  
   - Ignorar `temp/` em qualquer pasta:  
     ```  
     **/temp/  
     ```  
   - Ignorar `temp/` apenas na raiz:  
     ```  
     /temp/  
     ```  

#### 3. **Gitignore Global**  
   Crie um arquivo para ignorar padrões em **todos os repositórios** da sua máquina:  
   ```bash  
   git config --global core.excludesfile ~/.gitignore_global  
   ```  
   Exemplo de conteúdo:  
   ```  
   # Ignorar arquivos do sistema  
   .DS_Store  
   Thumbs.db  
   ```  

#### 4. **Ignorar Arquivos Já Rastreados**  
   Se um arquivo já foi commitado, adicione-o ao `.gitignore` e execute:  
   ```bash  
   git rm --cached arquivo.txt  # Remove do Git, mantém no disco  
   ```  

---

### **Dicas Profissionais** 

1. **Debugging**:  
   Verifique se um arquivo está sendo ignorado com:  
   ```bash  
   git check-ignore -v arquivo.txt  
   ```  

2. **Override Forçado**:  
   Para adicionar um arquivo ignorado temporariamente:  
   ```bash  
   git add -f arquivo_ignorado.txt  
   ```  

3. **Ordem Importa**:  
   Regras posteriores no `.gitignore` podem sobrescrever anteriores. Exemplo:  
   ```  
   *.txt        # Ignora todos .txt  
   !urgente.txt  # Exceto este  
   ```   