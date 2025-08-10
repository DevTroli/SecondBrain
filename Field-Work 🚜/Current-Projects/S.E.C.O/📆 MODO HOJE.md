# 📆 Modo Hoje — Painel Diário

> **Painel de ação imediata** para o dia de hoje.  
> Tudo o que precisa ver antes de treinar, sem distrações.

## 🏋️ Treino do Dia
```dataview
LIST
FROM "Templates"
WHERE file.cday = date(today) AND contains(file.name, "Treino")
SORT file.mtime DESC
````

🔹 **Se não aparecer nada acima:** criar [[📝 Template Treino Hoje]]

---

## 🎯 Foco Atual

* **Meta micro:** +1 repetição no braço esquerdo
* **Técnica em foco:** Flexões com princípio do membro mais fraco
* **Prioridade física:** Correção de assimetrias

## ✅ Checklist Diário

### ☀️ Manhã

* [ ] Revisar treino do dia
* [ ] Avaliar energia/motivação (1–10)
* [ ] Definir foco da sessão

### 💪 Durante o Treino

* [ ] Executar treino planejado
* [ ] Registrar no \[\[📝 Template Treino Hoje]]
* [ ] Aplicar técnica do foco semanal

### 🌙 Noite

* [ ] Atualizar \[\[📈 DASHBOARD-PROGRESSO]]
* [ ] Registrar reflexões no diário
* [ ] Preparar treino de amanhã mentalmente

---

## 📊 Status Rápido

```dataview
TABLE file.name AS "Registro", treino, repetições, carga
FROM "Registros"
WHERE file.cday = date(today)
SORT file.mtime DESC
```

💡 Atualize no fim do treino para ver progresso instantâneo.

---

## 🔄 Links Rápidos

* [[📅 CRONOGRAMA-SEMANAL]] — ver a rotina completa
* [[💪 Exercícios do Dia]] — detalhes técnicos
* [[🎯 Foco da Semana]] — prioridade atual
* [[🔢 Tabela de Progressões]] — referência rápida

## 📈 Consistência na Semana

```dataview
TABLE file.name AS "Dia", treino, cardio, humor
FROM "Registros"
WHERE file.cday >= date(today) - dur(6 days)
SORT file.cday DESC
```

---

## 🆘 Emergência Imediata

* \[\[❓ Sem Motivação Hoje]]
* \[\[⚠️ Dor ou Desconforto]]
* \[\[⏰ Sem Tempo Para Treino]]

---

> 🎯 **Regra de ouro:** Primeiro termine este painel, depois explore o resto do Hub.