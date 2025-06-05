## 🏠 O que é hospedagem?  
É como **alocar um apartamento** na internet - você paga para seu site morar nos servidores de uma empresa, em vez de deixá-lo no seu computador pessoal (que seria como morar na casa dos pais sem privacidade!).  

### Evolução Histórica: Da Gambiarra à Nuvem  

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'fontSize': '18px' } } }%%
timeline
    title 🕰️ Evolução da Hospedagem Web
    section Era Heroica (Anos 90)
        1991-1995 : "PC Caseiro como Servidor • Seu 486/Windows 98 como host • Site cai se o PC desligar • Conexão discada limitada"
    section Revolução Empresarial (2000s)
        2000-2005 : " VPS & Data Centers • 'Apartamentos' virtuais<br>• SSH como chave principal • Primeiras hospedagens compartilhadas"
    section Era Cloud (2010s)
        2010-2015 : "Cloud Computing • Escalabilidade sob demanda<br>• AWS, Google Cloud, Azure • Pagamento por uso"
    section Modernidade (2020+)
        2020-2025 : "PaaS/Serverless • Deploy com 1 clique • Vercel, Netlify, Heroku • Infra como serviço completo"
```

## 🔌 Como funcionava nos anos 90?  
Imagine seu Windows 98 virando um servidor:  
- 💾 Você instalava o Apache manualmente  
- 📞 A internet discada limitava a 5 visitantes simultâneos  
- ⚡ Se alguém ligasse no seu telefone fixo... *adeus site!*  

## ☁️ Como funciona hoje?  
1. **Escolhe seu "pacote de internet"**:  
   - 🏡 **Shared Hosting** (República): R$10/mês, divide servidor com outros sites  
   - 🏢 **VPS** (Kitnet Virtual): R$50/mês, seu cantinho dedicado  
   - 🌎 **Cloud** (Mansão Escalável): Paga só o que usar (AWS, GCP)  

2. **Deploy em 1 clique**:  
   - Conecta seu GitHub → **"Deploy Now"** → Pronto! Seu site tá no ar  

## 💡 Por que ninguém usa PC caseiro hoje?  
| Problema do PC      | Solução Cloud |
| ------------------- | ------------- |
| ⏳ 24/7 ligado       | Uptime 99.9%  |
| 🔌 Gasto de energia | Pay-as-you-go |
| 🛡️ Sem firewall    | Proteção DDoS |

## 🚀 Tipos Modernos de Hospedagem  
1. **PaaS (Platform as a Service)**:  
   - "Netflix de servidores" - você só coloca o código, eles cuidam do resto  
   - Ex: Vercel (frontends), Railway (backends)  

2. **Serverless**:  
   - Funciona só quando alguém acessa (como um Uber da computação)  
   - Cobrado por milissegundo de uso!  

## 🤯 Curiosidade Nerd  
Sim, esse fato é verídico: o primeiro site da história, hospedado em info.cern.ch, rodava em um computador NeXT de Tim Berners-Lee no CERN e exibia um adesivo manuscrito com as palavras “This machine is a server. DO NOT POWER DOWN!” ([home.cern][1], [thehackernews.com][2]).

Fontes:
[1]: https://home.cern/news/news/computing/month-1991-web-spreads-beyond-cern "This month in 1991: The web spreads beyond CERN | CERN"
[2]: https://thehackernews.com/2016/08/first-website-ever.html "On This Day 25-years Ago, The World's First Website Went Online"
[3]: https://cds.cern.ch/record/2669377/ "A laptop with a replica of the sticker pasted on ... - CERN Document Server"
[4]: https://alexloth.com/cern-the-worlds-first-website-went-online-20-years-ago-today/ "CERN: The world’s first website went online 20 years ago today"
