## Conceitos Centrais  
- **Definição Simplificada:**  
  O *Ruby Style Guide* é um conjunto de recomendações para escrever código Ruby claro, consistente e fácil de manter.  
- **Palavras-Chave:**  
  Legibilidade, Consistência, Convenções.  

## Perguntas Críticas  
1. **Por que seguir um guia de estilo?**  
   Para garantir que o código seja legível e mantenha padrões, facilitando a colaboração entre desenvolvedores.  
2. **Quais são as regras mais importantes?**  
   Indentação com 2 espaços, nomes descritivos, evitar métodos complexos e preferir convenções da comunidade.  
3. **O que acontece se não seguir?**  
   Código confuso, dificuldade de manutenção e conflitos em equipes.  

---

## O que fazer & O que não fazer  
| **Correto** | **Errado** | **Por Que?** |  
|-------------|------------|--------------|  
| `nome_do_metodo` | `nomeDoMetodo` | Snake case é padrão em Ruby. |  
| `each` para loops | `for` | `for` pode vazar variáveis. |  
| `user.active?` | `is_user_active` | `?` indica método booleano. |  

---

## Layout do Código  
- **Indentação:** 2 espaços, nunca tabs.  
- **Linhas:** Máximo 80 caracteres.  
- **Espaçamento:**  
  ```ruby  
  # Bom  
  [1, 2, 3].each { |num| puts num }  

  # Ruim  
  [1,2,3].each{|num|puts num}  
  ```  

---

## Nomenclatura  
- **Snake Case:** Para métodos e variáveis (`calcular_total`).  
- **CamelCase:** Para classes e módulos (`ClassUsuario`).  
- **SCREAMING_SNAKE:** Constantes (`MAX_TENTATIVAS`).  

---

## Métodos  
- **Métodos curtos:** Foque em uma única responsabilidade.  
- **Prefira `each`:** Evite loops `for`.  
  ```ruby  
  # Bom  
  [1, 2, 3].each { |n| puts n * 2 }  

  # Ruim  
  for n in [1, 2, 3]  
    puts n * 2  
  end  
  ```  

---

## Condicionais  
- **Ternário:** Para condições simples.  
  ```ruby  
  status = idade >= 18 ? :adulto : :menor  
  ```  
- **Evite `unless` complexo:**  
  ```ruby  
  # Ruim  
  puts "Acesso negado" unless !user.admin?  

  # Bom  
  puts "Acesso negado" if user.admin?  
  ```  

---

## Coleções  
- **Prefira literais:**  
  ```ruby  
  array = [1, 2, 3]  
  hash = { nome: "Ana", idade: 30 }  
  ```  
- **Métodos úteis:**  
  ```ruby  
  numeros.select { |n| n.even? }.map { |n| n * 2 }  
  ```  

---

## Comentários  
- **Clareza:** Comente o "porquê", não o "como".  
- **Anotações:** Use `TODO` ou `FIXME` para lembrete.  
  ```ruby  
  # TODO: Refatorar para usar Service Object  
  def calcular_desconto  
    # ...  
  end  
  ```  

---

## Erros Comuns  
- **`nil` desnecessário:** Use `&.` (*safe navigation*).  
  ```ruby  
  user&.address&.city  
  ```  
- **Métodos destrutivos:** Use `!` apenas quando modificar o objeto.  
  ```ruby  
  nomes = ["ana", "joão"]  
  nomes.map!(&:upcase)  # Altera o array original  
  ```  

---

## Ferramentas  
- **RuboCop:** Analisa o código seguindo o guia.  
- **RubyMine:** IDE com suporte a convenções de estilo.  

---

**Resumo Rápido**  
- ✅ **Snake case** para métodos/variáveis.  
- ✅ **2 espaços** para indentação.  
- ✅ **Métodos curtos** e focados.  

**Autoavaliação**  
- [ ] Meu código usa snake_case?  
- [ ] Evitei loops `for`?  

**Referências**  
- [Guia Completo](https://rubystyle.guide)  
- Livro: *Eloquent Ruby* (Russ Olsen).  

**FAQ**  
- **Q:** Posso usar `unless` com `else`?  
  **A:** Não! Reescreva com `if` para clareza.  
- **Q:** Quando usar `do...end` vs `{}`?  
  **A:** `{}` para uma linha, `do...end` para múltiplas.