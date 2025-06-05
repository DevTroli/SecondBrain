### Pensamentos Soltos
- Arquitetura de software != Organização de pastas
- Oque define uma arquitetura de software seria o escopo dos componentes por onde eles começam & terminam em conjunto com o tipo de interação entre eles, sendo assim cada estilo de arquitetura é uma nova abordagem de definir um escopo e suas interação.
- Complexidade na arquitetura & pasta afeta ter um código fonte intuitivo para que outros ajudem o projeto porque você impóis uma escopo com interação que só você entende.
- Uma arquitetura simples com uma ótima modelagem faz seu projeto ir muito longe!
- Em empresas que não são grandes ou referencia em tecnologia é comum não ser utilizado de nenhuma arquitetura de software apenas um amontoado de código em diversas pastas que não tinha começo nem fim por seu escopo nem tendo interações eficazes dos componentes sem nenhum deles ter uma responsabilidade definida dentro de um sistema, Tornado um projeto que tem Under-engineering, só por não ter uma arquitetura de software bem definida (muito menos ter um boa estrutura de pastas)

## Estilos de Arquitetura
**MVC**:
Criada em 1979 essa é uma das arquiteturas mais comuns de se ter na maioria dos projetos web atuais <\Claude Escreva mais sobre essa arquitetura>

**MTV**:
-> Elabore melhor essa estilo <-

**Clean Arquitetcture**:

<- elaborar um desenvolvimento melhor para o os estilos subjacentes ->

Exemplo basico de um aruitetura simples e eficaz para um projeto web com js & next.js:
📦 root/
├─ 📁 node_modules/
├─ 📁 .next/
┣ 📂 pages
┃ ┗ 📜 index.js
┣ 📂 models
┃ ┣ 📜 user.js
┃ ┣ 📜 content.js
┃ ┗ 📜 password.js
┣ 📂 infra
┃ ┗ 📜 database.js
┃ ┣ 📂 migrations
┃ ┣ 📂 provisioning
┃ ┃ ┣ 📂 staging
┃ ┃ ┣ 📂 production
┣ 📂 tests
┣ 📜 .editorconfig
┣ 📜 .gitignore
┣ 📜 .tool-version
┣ 📜 .prettierrc
┣  📜 package-lock.json
┣  📜 package.json
┣  📄 README.md






