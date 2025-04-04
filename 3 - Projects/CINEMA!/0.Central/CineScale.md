###### O que é o CineScale?
>Sistema híbrido de **pontuação dinâmica com marcos orientadores**, combinando simplicidade de acompanhamento com adaptabilidade a mudanças de escopo.

### 📈 Método de Progresso CineScale (Sistema Híbrido)

**1. Componentes Chave:**
- **Unidades de Valor (UV):** Atribua pontos a cada tarefa (★) baseado em:
  - ★ = Complexidade técnica
  - ★ = Impacto no projeto
  - ★ = Esforço necessário
  
- **Marcos Dinâmicos:** Divisões flexíveis do projeto (ex: MVP Alpha, Beta, Lançamento) com peso percentual pré-definido

**2. Fórmula de Progresso:**
```
Progresso Total = Σ(UVs Concluídas) / Σ(UVs Totais Atuais) * 100
Progresso por Marco = (UVs do Marco Concluídas / UVs do Marco Total) * Peso do Marco
```

### 🔄 Sistema de Atualização Semanal

1. **Revisão de Escopo:**
```markdown
- [ ] Atualizar UVs totais (se houver mudanças de escopo)
- [ ] Recalcular automaticamente porcentagens
```

2. **Template de Registro:**
```markdown
## 📌 Progresso Semanal CineScale

**UVs Concluídas:** 15 ★  
**Novas UVs Adicionadas:** 20 ★  
**Progresso Anterior:** 12% → **Atual:** 14.7% (+2.7pp)

### Detalhamento por Área
| Área             | UVs Concl. | UVs Adic. | Notas               |
|------------------|------------|-----------|---------------------|
| Design           | 5★         | 0★        | Finalização palette |
| Backend          | 10★        | 15★       | Novos endpoints     |
| Documentação     | 0★         | 5★        | Adiada para Beta    |
```

---

### 💡 Vantagens do Sistema
1. **Resistente a Diluição:** Novas tarefas aumentam o denominador mas mantêm o valor conquistado
2. **Visão Granular:** Progresso por área + visão geral integrada
3. **Auto-documentado:** Histórico natural de mudanças de escopo
4. **Adaptável:** Permite diferentes pesos para tarefas críticas vs rotineiras

Este sistema permite que você:
- Mantenha o progresso histórico mesmo com escopo mutável
- Veja imediatamente o impacto de novas features/aditamentos
- Priorize tarefas de alto UV para impulsionar as métricas
- Tenha visibilidade multidimensional (técnico/design/comunidade)