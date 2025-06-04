### **Visão Geral**  
O CineTab é uma plataforma minimalista de discussão sobre cinema, focada em **texto, comunidade e simplicidade radical**. Combina a curadoria colaborativa de fóruns antigos com tecnologias modernas para evitar os vícios das redes sociais tradicionais (algoritmos, métricas vazias, polarização).  

---

## **Stack Escolhida**  
*(Foco: Performance, Baixo Custo e Manutenção Simplificada)*  

| Camada            | Tecnologias                                             | Justificativas                                                                                                               |
| ----------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| **Frontend**      | Next.js 13 + Tailwind CSS                               | - **Performance**: SSR/SSG para carregamento instantâneo.<br>- **UI Minimalista**: Tailwind permite customização sem bloat.  |
| **Backend**       | Node.js + PostgreSQL (com pgvector)                     | - **Escalabilidade**: Node lida bem com I/O assíncrono (debates).<br>- **Busca Semântica**: pgvector para posts similares.   |
| **Autenticação**  | Ainda em definição                                      | - **Acesso Simplificado**: Ideal para usuários não técnicos.                                                                 |
| **Armazenamento** | AWS S3 (imagens) + Cloudflare R2 (backups)              | - **Custo-Efetivo**: Pagamento por uso.<br>- **Globalização**: CDN da Cloudflare para mídia estática e segurança contra DDoS |
| **Deploy**        | Vercel (Frontend) + Railway (Backend)                   | - **Custo Zero Inicial**: Planos gratuitos robustos.<br>- **Escala Automática**: Ideal para MVP e crescimento orgânico.      |
| **Monitoramento** | Sentry (erros) + Plausible Analytics (métricas simples) | - **Privacidade**: Plausible não usa cookies.<br>- **Debugging Rápido**: Sentry identifica falhas em tempo real.             |

---

### **Funcionalidades Definidas**  
*(Priorizadas por MVP e Alinhadas à Filosofia)*  

#### **1. Funcionalidades Essenciais (MVP)**  
| Recurso                | Descrição                                                                     | Justificativa de Negócio                                                            |
| ---------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| **Posts em Markdown**  | Texto puro com suporte a links, imagens e formatação simples.                 | - Reduz necessidade de moderação complexa.<br>- Alinha com a estética "old-school". |
| **Sistema de Tags**    | Tags fixas (`#Crítica`, `#Debate`, `#Confissão`) sem criação customizada.     | - Evita poluição de conteúdo.<br>- Facilita descoberta sem algoritmos.              |
| **CineCoins**          | Moeda virtual ganha por posts/comentários úteis (não compráveis com dinheiro) | - Incentiva qualidade, não quantidade.<br>- Base para futura economia comunitária.  |
| **Moderação Orgânica** | Usuários avaliam (e assim moderam) posts e comentarios da plataforma;         | - Reduz custo com moderação profissional.<br>- Empodera a comunidade.               |

#### **2. Funcionalidades Secundárias (Fase 2)**  
| Recurso              | Descrição                                                               | Impacto no Negócio                                                                       |
| -------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| **Badges de Perfil** | Reconhecimento visual por contribuições (ex: `🎬 Crítico do Povo`).     | - Fidelização de usuários ativos.<br>- Metrica não intrusiva de reputação.               |
| **API Pública**      | Acesso a posts via REST/GraphQL para integrações (ex: blogs de cinema). | - Amplia alcance da marca.<br>- Possibilidade de monetização indireta por licenciamento. |

#### **3. Funcionalidades Futuras (Pós-MVP)**  
| Recurso              | Descrição                                                                 | Visão Estratégica                                                                       |
| -------------------- | ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| **Sistema de Clubs** | Grupos privados para discussões temáticas (ex: "Fãs de Filmes de Zumbi"). | - Atrai comunidades nichadas.<br>- Possibilidade de parcerias com cineclubes.           |
| **CineTab EDU**      | Cursos gratuitos financiados por CineCoins (ex: "Introdução à Crítica").  | - Posiciona o CineTab como referência educacional.<br>- Gera receita via certificações. |
| **Debates ao Vivo**  | Salas temporárias para discussões em tempo real (usando PartyKit).        | - Aumenta engajamento.<br>- Atrai eventos patrocinados por festivais.                   |

---

### **Arquitetura do Sistema**  
![Diagrama Simplificado](https://exemplo.com/arquitetura-cinetab.png)  
- **Frontend**: Estático, hospedado na Vercel com pré-renderização (SSG).  
- **Backend**: API REST em Node.js, rodando na Railway com auto-scaling.  
- **Banco de Dados**: PostgreSQL para dados estruturados (posts, usuários) + Redis para cache de sessões.  
- **Segurança**: HTTPS via Cloudflare, autenticação sem senha (Magic Links), e sanitização de Markdown para evitar XSS.  

---

### **Desafios Técnicos e Soluções**  
| Desafio                   | Solução Proposta                                                                                |     |
| ------------------------- | ----------------------------------------------------------------------------------------------- | --- |
| **Real-time Updates**     | (Meta para o futuro) Uso de WebSockets (via Ably) apenas para debates ao vivo, reduzindo custos |     |
| **Busca Semântica**       | pgvector + embeddings de texto via TensorFlow.js (modelo leve).                                 |     |
| **Moderação em Escala**   | Ferramenta interna de "votação comunitária" + integração com OpenAI para análise de toxicidade. |     |
| **Economia de CineCoins** | Blockchain leve (ex: Hyperledger Fabric) para evitar fraudes (opcional pós-MVP).                |     |

---

### **Próximos Passos Técnicos**  
1. **Setup Inicial**:  
   ```bash  
   git clone https://github.com/DevTroli/cinetab.art  
   npm install  
   ```  
2. **Testes Beta**:  
   - Convidar 100 usuários via comunidades de cinema no Reddit/Telegram ou Youtube  
   - Coletar feedback para ajustar fluxos de interação.

---

### **Para Stakeholders de Negócio**  
**Por que Esta Stack?**  
- **Custo Zero Inicial**: Vercel/Railway oferecem planos gratuitos generosos, permitindo validar a ideia sem investimento.  
- **Escalabilidade**: A arquitetura permite crescer conforme a demanda, sem refatoração cara.  
- **Alinhamento com a Filosofia**: Tecnologias leves e sem trackers garantem privacidade e simplicidade, diferenciais únicos de mercado.  

**Risco Principal**:  
- **Dependência de Terceiros** (ex: Vercel, Resend, railway). 
- Mitigação do Risco: Backup diário de dados e planos de migração para soluções self-hosted (ex: Kubernetes) em caso de escala.  

---

...Então **Pronto para Impactar o Cinema?**  
O CineTab não é só uma plataforma – é um movimento para resgatar a essência das discussões cinematográficas. Com uma stack enxuta e uma comunidade engajada, estamos construindo o futuro do cinema, um post por vez. 🎥🚀