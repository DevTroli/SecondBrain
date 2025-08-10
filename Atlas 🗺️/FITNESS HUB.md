> **Seu sistema completo de desenvolvimento físico através da calistenia**  
> *Última atualização: {{date}} | Próxima revisão: {{date:+4w}}*


## 🚀 Modo Hoje — Comece Agora
> **Ação imediata** — Tudo que você precisa para iniciar o dia sem pensar demais.

[[📆 MODO HOJE]] —> Painel diário com treinos, foco e checklist  
[[📝 Template Treino Hoje]] —> Registro da sessão atual  
[[💪 Exercícios do Dia]] —> Consulta rápida do treino  
[[🎯 Foco da Semana]] —> Prioridade atual  

```dataview
LIST
FROM "Templates"
WHERE file.cday = date(today) AND contains(file.name, "Treino")
SORT file.mtime DESC
````

---

## 📊 Status Atual — Onde Estou Agora

> **Entenda seu momento antes de planejar o próximo passo.**

[[📈 DASHBOARD-PROGRESSO]] —> Métricas e histórico geral
 [[📋 TEMPLATES-REGISTROS]] —> Formulários para tracking diário
[[🎖️ Sistema de Conquistas]] —> Marcos e recompensas

### 📅 Últimos 7 Dias

```dataview
TABLE file.name AS "Registro", treino, repetições, carga
FROM "Registros"
WHERE file.cday >= date(today) - dur(7 days)
SORT file.cday DESC
```

---

## 🗺️ Plano de Ação — Próximos Passos

> **Estratégia organizada por fases** para evoluir de forma estruturada.

* [[📅 CRONOGRAMA-SEMANAL]] —> Rotina completa
* [[🔄 Protocolos de Progressão]] —> Evolução por exercício
* [[⚡ Planos de Emergência]] —> Adaptações rápidas

### Mapa da Jornada

#### 🌱 Fase 1 — Base (Semanas 1–6)
[[📋 Checklist Fase 1]]
[[🎯 Metas Fase 1]]
[[📊 Progresso Fase 1]]

#### 💪 Fase 2 — Desenvolvimento (Semanas 7–14)
[[📋 Checklist Fase 2]]
[[🎯 Metas Fase 2]]
[[📊 Progresso Fase 2]]

#### 🏆 Fase 3 — Especialização (Semanas 15–24)
[[📋 Checklist Fase 3]]
[[🎯 Metas Fase 3]]
[[📊 Progresso Fase 3]]

---

## 📚 Conhecimento & Estratégias

> **Aprenda para treinar melhor.**

[[🧬 Base Científica]] —> Fundamentos e fisiologia
[[💭 Ferramentas Mentais]] —> Mentalidade e motivação
[[🔧 Troubleshooting]] —> Solução de problemas
[[📚 Recursos Complementares]] —> Conteúdo extra

---

## 🎯 Metas & Direção

> **Defina para onde você está indo.**

[[🏆 Objetivos SMART]] — Metas claras e mensuráveis
[[🔮 Visão de Longo Prazo]] — Planejamento de 6–12 meses
[[🏖️ Projeto Verão]] — Meta sazonal
[[💪 Definição Absoluta]] — Corte e secagem
[[🏃‍♂️ Resistência Máxima]] — Foco cardiovascular

```dataview
TABLE objetivo, prazo, status
FROM "Objetivos"
WHERE status != "Completo"
SORT prazo ASC
```

---

## 🆘 Emergência & Segurança

> **Respostas rápidas para situações inesperadas.**

[[❓ Sem Motivação Hoje]]
[[⚠️ Dor ou Desconforto]]
[[📉 Performance Caindo]]
[[⏰ Sem Tempo Para Treino]]
[[🩹 Primeiros Socorros (Fitness)]]
[[📞 Contatos de Emergência]]
[[🏥 Quando Procurar Ajuda]]

---

## 🎨 Personalização & Extras

> **Ajuste o sistema ao seu jeito.**

[[🎛️ Preferências Pessoais]]
[[🔔 Lembretes e Alertas]]
[[📊 Métricas Personalizadas]]

### Ambientes de Treino
[[🌊 Treino na Praia]]
🏡 [[Home Gym]]
🏞️ [[Outdoor Natural]]

---

## 📜 Changelog Automático

```dataview
TABLE file.name AS "Arquivo", file.mtime AS "Última modificação"
FROM "Fitness Hub"
SORT file.mtime DESC
LIMIT 10
```

---

## 💡 Dicas Rápidas

> 💡 Use `Ctrl+O` (ou `Cmd+O`) para buscar arquivos
> 🔥 Crie *notes* diárias linkando para este hub
> 🎯 Sempre comece pelo **Modo Hoje**