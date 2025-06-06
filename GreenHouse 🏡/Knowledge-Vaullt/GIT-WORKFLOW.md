## **Git como Sistema de Controle de Versão Distribuído (SCVD)**  
O Git é reconhecido como um **SCVD** (*Sistema de Controle de Versão Distribuído*). Em sistemas centralizados (como SVN), o fluxo exigia uma conexão constante entre **cliente -> servidor** (apenas online), onde:  
- O servidor hospedava o repositório principal.  
- Os desenvolvedores *checkout* (baixavam) arquivos para edição no cliente (software local).  
- As alterações eram confirmadas **diretamente no servidor central**.  

Já em um **SCVD como o Git**:  
- **Não há dependência de um servidor central único**: cada desenvolvedor tem um [[DEV-REPOSITORIOS#**1. Repositório Local**|Repositório Local]] completo.  
- O trabalho offline é possível: commits são feitos localmente e sincronizados posteriormente via `git push` (envio) ou `git pull` (atualização do [[DEV-REPOSITORIOS#**2. Repositório Remoto (Origin)**| Repositório Remoto]] )

---

## **Os 5 Estágios do Workflow do Git**  
###### 1. **Modificação**:  
   Ocorre quando arquivos do repositório são alterados (adição, remoção ou edição de código).  
   - **Exemplo prático**: Editar `index.html` no editor de código.  

###### 2. **Preparação (Staging)**:  
   Você seleciona quais mudanças serão incluídas no próximo commit, usando a *staging area*.  
   - **Comando**:  
     ```bash  
     git add .              # Adiciona todas as mudanças  
     git add arquivo.txt    # Adiciona um arquivo específico  
     ```  

###### 3. **Verificação**:  
   Confirma se as mudanças estão na staging area e identifica arquivos não rastreados.  
   - **Comandos**:  
     ```bash  
     git status            # Exibe o estado atual  
     git diff --staged     # Mostra diferenças na staging area  
     ```  

###### 4. **Registro (Commit)**:  
   Registra oficialmente as alterações no histórico do repositório local.  
   - **Comando**:  
     ```bash  
     git commit -m "Adiciona funcionalidade X"  
     ```  
   - **Bônus**: Corrija o último commit com:  
     ```bash  
     git commit --amend    # Altera mensagem ou inclui arquivos esquecidos  
     ```  

###### 5. **Sincronização (Push)**:  
   Envia os commits locais para o repositório remoto (ex: GitHub).  
   ```bash  
   git push origin main  
   ```  