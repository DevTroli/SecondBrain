29-March-2025 | 22:25

**Status:**  
- **Tags:** #ruby #backend  

---
## Conceitos Centrais  
- **Definição Simplificada:**  
  - `puts`: Exibe dados com nova linha ao final.  
  - `print`: Exibe dados sem nova linha.  
  - `gets`: Captura entrada do usuário (incluindo `\n`).  
  - `chomp`: Remove `\n` da entrada.  
  - `p`: Exibe representação crua do objeto (útil para debugging).  

- **Palavras-Chave:** Saída formatada, entrada de usuário, métodos de I/O.  

## Perguntas Críticas  
1. **O que é a diferença entre `puts` e `print`?**  
   - `puts` adiciona `\n` ao final; `print` mantém na mesma linha.  
2. **Por que usar `chomp` com `gets`?**  
   - Para remover o `\n` da entrada do usuário.  
3. **Como `p` difere de `puts`?**  
   - `p` mostra a representação interna do objeto (ex: `"texto"` com aspas), enquanto `puts` chama `to_s`.  
4. **O que acontece se usar `gets` sem `chomp`?**  
   - A string incluirá uma quebra de linha, podendo causar erros em comparações ou processamento.  

## O que fazer & O que não fazer  
| Correto | Errado | Por Que? |  
|---------|--------|----------|  
| `puts "Olá"` | `print "Olá"` sem espaço | `print` não quebra linha, podendo juntar textos. |  
| `input = gets.chomp` | `input = gets` | Evita `\n` na string. |  
| `p variavel` para debugging | `puts variavel` quando precisa de detalhes | `p` revela estrutura (ex: `nil` vs string vazia). |  

## Conexões  
- **Relacionado a:** Manipulação de arquivos (`File.read`, `File.open`), debugging.  
- **Diferenças-chave:**  
  - `puts` vs `p`: Formatação de saída para usuário vs inspeção de objetos.  
  - `gets` vs `readline`: Captura de entrada simples vs leitura de arquivos.  

## Aplicações Práticas  
- **Casos de Uso:**  
  - Menus interativos (`puts` para opções, `gets` para escolha).  
  - Logs formatados (`print` para progresso contínuo).  
- **Exercícios/Desafios:**  
  - Criar um programa que valide senhas com entrada do usuário.  
  - Ler um arquivo e exibir seu conteúdo com numeração de linhas.  
- **Erros Comuns:**  
  - Esquecer `chomp`, causando comparações incorretas.  
  - Usar `print` para múltiplas saídas sem espaçamento.  

## Resumo Rápido  
- ✅ `puts` para saída com quebra de linha.  
- ✅ `print` para saída contínua.  
- ✅ `gets.chomp` para entrada limpa.  
- ✅ `p` para inspecionar objetos.  

## Autoavaliação  
- [x] Sei diferenciar `puts`, `print` e `p`.  
- [ ] Consigo capturar entrada do usuário corretamente.  
- [x] Entendo o uso de `chomp` e seus impactos.  

## Referências  
1. [Ruby I/O Tutorial](https://www.tutorialspoint.com/ruby/ruby_input_output.htm)  
2. [Diferenças entre puts, print e p](https://www.rubyguides.com/2018/10/puts-vs-print/)  
3. [Uso de ponto e vírgula em Ruby](https://stackoverflow.com/questions/3951239/can-you-use-semicolons-in-ruby)  

## FAQ  
- **Q:** Quando usar `p` em vez de `puts`?  
  **A:** Quando precisar inspecionar a estrutura exata do objeto (ex: diferenciar `nil` de string vazia).  

- **Q:** Posso usar `;` para múltiplos comandos?  
  **A:** Sim, mas evite em códigos complexos para manter o [[Ruby Style Guide]]. Ex: `puts "a"; puts "b"`