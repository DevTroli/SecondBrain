# Documento do Estudo de Caso: Abrigo “Vida Animal”

## Introdução

O abrigo “Vida Animal” é uma organização sem fins lucrativos dedicada a **resgatar, cuidar, castrar e disponibilizar para adoção animais abandonados**. O abrigo recebe doações em dinheiro, alimentos e medicamentos, tanto de doadores avulsos quanto de parceiros recorrentes. O sistema solicitado deve permitir o gerenciamento eficiente dos animais, processos de adoção, voluntários, doações recebidas, eventos beneficentes e tratamentos veterinários realizados.

## Objetivos do Sistema

- **Cadastrar animais resgatados** e acompanhar o status de cada um (tratamento, adoção, etc.).
  - Campos: id_animal, nome, espécie, raça, idade estimada, status, data de resgate.
- **Registrar pessoas interessadas em adotar** e acompanhar o processo de adoção.
  - Campos: id_pessoa, nome, tipo, e-mail, telefone, endereço.
- **Registrar voluntários e suas atividades**.
  - Campos: id_tratamento, tipo, veterinário, data, observações.
- **Controlar doações recebidas** de diferentes tipos.
  - Campos: id_doacao, tipo, descrição, data da doação, valor estimado.
- **Organizar eventos de arrecadação e campanhas**.
  - Campos: id_evento, nome, data, descrição, valor arrecadado.
- **Gerar relatórios** de adoções, doações e gastos com animais.

## Relacionamentos Entre Entidades

- **Cada animal pode ter diversos tratamentos**, mas apenas uma adoção.
- **Somente pessoas cadastradas como “Adotante”** podem realizar adoções.
- **As doações podem ser monetárias ou materiais**, e ambos os tipos precisam de registro no sistema.
- **Eventos devem registrar o valor arrecadado** e podem estar associados a múltiplas doações.
- **Voluntários podem também ser doadores e/ou adotantes**.

## Resumo das Informações Que Devem Ser Cadastradas

| Entidade   | Campos principais                                                    |
| ---------- | -------------------------------------------------------------------- |
| Animal     | id_animal, nome, espécie, raça, idade_estimada, status, data_resgate |
| Pessoa     | id_pessoa, nome, tipo, email, telefone, endereço                     |
| Tratamento | id_tratamento, tipo, veterinario, data, observaçoes                  |
| Doação     | id_doacao, tipo (dinheiro/material), descriçao, data, valor_estimado |
| Evento     | id_evento, nome, data, descrição, valor_arrecadado                   |

## Regras de Negócio

- Animais só podem ser adotados uma vez, mas podem receber vários tratamentos veterinários.
- Adoção só pode ser feita por pessoas cadastradas com o tipo “Adotante”.
- Deve ser possível associar doações e voluntários aos eventos e aos animais.
- Voluntários podem ser também doadores e/ou futuros adotantes.

## Relatórios Esperados

- Quantidade e detalhes das adoções realizadas.
- Histórico e tipos das doações recebidas, com valores.
- Gastos com animais, tratamentos e eventos realizados.

## Observação

As etapas deste estudo serão detalhadas ao longo do bimestre, seguindo as instruções da disciplina.