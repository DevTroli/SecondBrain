# Integração do endpoint `/status` 
### pensamentos soltos
- Um pagina que contém informações da saúde de nossa aplicação por meio de endpoints na api `api/v1/status`, nesse endpoint deve prover informações que nos mostre se nossa aplicação está saudável ou não por informações como `update_at`, `dependencies` tipo webserver & database, 
- serverless é um modelo de computação em nuvem onde você não precisa se preocupar com a infraestrutura do servidor. Em vez de configurar e manter servidores, você escreve funções que são executadas sob demanda, e a nuvem se encarrega de tudo por trás
- Fazer um parsing é fazer a conversão de um texto puro para um JSON
- Usando a arquitetura MVC o Fluxo começa pelo **Controller** (nesse contexto o user pedindo as informações do endpoint /status na API), em seguida ele pede para o **Model** por uma informação pois ele computa uma informação ou executa alguma regra de negócios que é a zona de responsabilidade das **Views**, mas antes de passar do **Model** para a **View** o **Model** devolve uma resposta da requisição que o Controller iniciou para só assim retornar e passar do **Controller** para a **View** para que ela se responsabilize em resolver a situação do usuário interessado na em suas funções ou regras de negócios     ( nesse contexto: mostrar ao usuario uma response sobre se o sistema está saudável )
- Em resumo: Os **Controlers** coordenam as operações entre vários **Models** que existem no sistema e executam de forma concreta as ações ṕara que as **Views** devolvam as uma response aos requests dos consumidores desses dados (um usuário no caso)
- 

##  😵 Não se sinta burro (pelo menos não sozinho)!

Eu fui até a documentação e fiquei completamente perdido.

🕵️‍♂️ Tive que brincar de James Bond pra entender
1️⃣ Como pegar a versão do Postgres
Usei o ChatGPT, mas de um jeito diferente:
Pedi pra ele me mostrar na documentação oficial onde estava isso.

⚠️ Spoiler: a doc é densíssima!

Acabei achando essa belezinha:

SELECT version();

2️⃣ Como pegar o max_connections
Aqui fui corajoso 🐗 e tentei sozinho.

Digitei "max_connections" na busca da documentação e veio uma avalanche de info.
Depois de muito mato, tentei isso aqui:

SELECT max_connections();

Errado. 😓

Depois de MUITO suor, cheguei na resposta certa:

SHOW max_connections;

Foi um parto anormal. A criança saiu pela orelha. 🫠

3️⃣ O tal do used_connections
Se eu apanhei do max_connections, aqui eu apanhei de cinta.

Simplesmente não achei nada sobre isso na doc.
Depois de 3 dias de investigação, apelei ao "deus" deste século: ChatGPT.
E encontrei:

SELECT count(*) FROM pg_stat_activity;

Logo pensei #%ta que $a%r!u como eu iria advinar isso? Sorry este foi meu real sentimento.

🧠 Resumo filosófico
Meu código está certo?
👉 Talvez não.
Mas agora entendi a diferença entre funções e tabelas no SQL!

SELECT algo FROM tabela -- consulta simples
SELECT funcao()         -- chamada de função

Ainda tô inconformado. Vou montar minha própria doc tipo "diário de sobrevivência". 😂

status/index.js
import database from "infra/database";

async function status(req, res) {
  const updatedAt = new Date().toISOString();

  const postgresVersionRaw = await database.query("SELECT version();");
  const postgresVersionString = postgresVersionRaw.rows[0].version;
  const postgresVersion = postgresVersionString.match(/\d+.\d+/)[0];

  const connectionsList = await database.query("SHOW max_connections");
  const connectionObj = connectionsList.rows[0];

  const usedConnections = await database.query(
    "SELECT count(*) FROM pg_stat_activity",
  );
  const usedConnectionsCount = usedConnections.rows[0].count;

  res.status(200).json({
    updated_at: updatedAt,
    max_connections: connectionObj.max_connections,
    postgres_version: postgresVersion,
    used_connections: usedConnectionsCount,
  });
}

export default status;

get.test.js
test("GET to /api/v1/status should return 200", async () => {
  const response = await fetch("http://localhost:3000/api/v1/status");
  expect(response.status).toBe(200);

  const responseBody = await response.json();

  expect(responseBody.updated_at).toBeDefined();
});

test("GET to /api/v1/status should return max_connections", async () => {
  const response = await fetch("http://localhost:3000/api/v1/status");
  const responseBody = await response.json();

  expect(responseBody.max_connections).toBeDefined();
  expect(responseBody.max_connections).toBeTruthy();
  expect(Number(responseBody.max_connections)).toBeGreaterThan(0);
});

test("GET to /api/v1/status should return postgres_version", async () => {
  const response = await fetch("http://localhost:3000/api/v1/status");
  const responseBody = await response.json();

  expect(responseBody.postgres_version).toBeDefined();
  expect(responseBody.postgres_version).toBeTruthy();
  expect(responseBody.postgres_version).toMatch(/^\d+\.\d+$/);
});

test("GET to /api/v1/status should return used_connections", async () => {
  const response = await fetch("http://localhost:3000/api/v1/status");
  const responseBody = await response.json();

  expect(responseBody.used_connections).toBeDefined();
  expect(responseBody.used_connections).toBeTruthy();
  expect(Number(responseBody.used_connections)).toBeGreaterThan(0);
});