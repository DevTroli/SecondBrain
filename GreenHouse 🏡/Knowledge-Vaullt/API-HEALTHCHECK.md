# Como Criar APIs de Health Check que Funcionam de Verdade

## Por que você precisa disso

Sabe aquela sensação de acordar 3h da manhã com o celular explodindo de notificações porque o sistema "caiu"? Ou pior ainda: descobrir que o sistema estava com problemas há horas e ninguém percebeu?

Um endpoint de health check resolve isso. É como ter um médico que examina sua aplicação constantemente e te avisa antes que as coisas saiam do controle.

**A diferença na prática:**
- **Sem health check**: "O sistema tá fora do ar!" → Você corre feito louco sem saber por onde começar
- **Com health check**: "O banco de dados está com 95% das conexões ocupadas" → Você já sabe exatamente o que fazer

## O que realmente importa monitorar

Não precisa virar uma NASA. Foque no que quebra com mais frequência:

### 1. Banco de dados (o vilão #1)
```javascript
// Verificações essenciais do banco
const checkDatabase = async () => {
  const startTime = Date.now();
  
  try {
    // Testa se está respondendo
    const versionResult = await db.query("SELECT version();");
    
    // Quantas conexões estão sendo usadas
    const activeConnections = await db.query(
      "SELECT count(*) FROM pg_stat_activity WHERE state = 'active';"
    );
    
    // Qual o limite máximo
    const maxConnections = await db.query("SHOW max_connections;");
    
    const responseTime = Date.now() - startTime;
    const usage = (activeConnections.rows[0].count / maxConnections.rows[0].max_connections) * 100;
    
    return {
      status: usage > 80 ? "warning" : "ok",
      response_time_ms: responseTime,
      connections_used: activeConnections.rows[0].count,
      connections_max: maxConnections.rows[0].max_connections,
      usage_percent: Math.round(usage)
    };
  } catch (error) {
    return {
      status: "error",
      message: error.message,
      response_time_ms: Date.now() - startTime
    };
  }
};
```

### 2. Serviços externos (o que você não controla)
```javascript
const checkExternalServices = async () => {
  const services = [
    { name: "payment_gateway", url: "https://api.payment.com/health" },
    { name: "email_service", url: "https://api.email.com/status" }
  ];
  
  const results = {};
  
  for (const service of services) {
    const startTime = Date.now();
    try {
      const response = await fetch(service.url, { timeout: 5000 });
      results[service.name] = {
        status: response.ok ? "ok" : "error",
        response_time_ms: Date.now() - startTime
      };
    } catch (error) {
      results[service.name] = {
        status: "error",
        response_time_ms: Date.now() - startTime,
        error: error.message
      };
    }
  }
  
  return results;
};
```

### 3. Recursos do servidor
```javascript
const checkServerResources = () => {
  const memUsage = process.memoryUsage();
  const uptime = process.uptime();
  
  return {
    memory_usage_mb: Math.round(memUsage.rss / 1024 / 1024),
    uptime_hours: Math.round(uptime / 3600),
    cpu_usage: process.cpuUsage()
  };
};
```

## Montando o endpoint completo

Aqui está um exemplo que funciona na vida real:

```javascript
const express = require('express');
const app = express();

app.get('/api/health', async (req, res) => {
  const healthCheck = {
    timestamp: new Date().toISOString(),
    status: "ok", // Vai mudar se algo estiver ruim
    checks: {}
  };
  
  let hasErrors = false;
  
  // Verifica banco de dados
  try {
    healthCheck.checks.database = await checkDatabase();
    if (healthCheck.checks.database.status !== "ok") {
      hasErrors = true;
    }
  } catch (error) {
    healthCheck.checks.database = { status: "error", message: error.message };
    hasErrors = true;
  }
  
  // Verifica serviços externos
  try {
    healthCheck.checks.external_services = await checkExternalServices();
    Object.values(healthCheck.checks.external_services).forEach(service => {
      if (service.status !== "ok") hasErrors = true;
    });
  } catch (error) {
    healthCheck.checks.external_services = { status: "error", message: error.message };
    hasErrors = true;
  }
  
  // Verifica recursos do servidor
  healthCheck.checks.server = checkServerResources();
  
  // Define status geral
  if (hasErrors) {
    healthCheck.status = "degraded";
  }
  
  // Retorna status HTTP apropriado
  const httpStatus = healthCheck.status === "ok" ? 200 : 503;
  res.status(httpStatus).json(healthCheck);
});
```

## Como testar se está funcionando

Não adianta criar e esquecer. Teste sempre:

```javascript
// Teste básico
const testHealthEndpoint = async () => {
  const response = await fetch('http://localhost:3000/api/health');
  const data = await response.json();
  
  console.log('Status HTTP:', response.status);
  console.log('Status da aplicação:', data.status);
  console.log('Banco de dados:', data.checks.database.status);
  
  if (data.status !== 'ok') {
    console.warn('⚠️  Sistema com problemas:', data);
  } else {
    console.log('✅ Tudo funcionando');
  }
};

// Rode isso de tempos em tempos
setInterval(testHealthEndpoint, 60000); // A cada minuto
```

## Dicas que ninguém te conta

### 1. Não monitore tudo
Comece simples. Banco + 1 ou 2 serviços críticos. Adicione mais conforme a necessidade.

### 2. Defina limites realistas
```javascript
const THRESHOLDS = {
  database_response_time: 1000, // 1 segundo
  connection_usage: 80,         // 80%
  memory_usage: 1024           // 1GB
};
```

### 3. Cache quando faz sentido
```javascript
let lastHealthCheck = null;
let lastCheckTime = 0;

app.get('/api/health', async (req, res) => {
  const now = Date.now();
  
  // Cache por 30 segundos para evitar sobrecarga
  if (lastHealthCheck && (now - lastCheckTime) < 30000) {
    return res.json(lastHealthCheck);
  }
  
  // Faz verificação completa
  lastHealthCheck = await performHealthCheck();
  lastCheckTime = now;
  
  res.json(lastHealthCheck);
});
```

### 4. Proteja informações sensíveis
```javascript
const sanitizeForPublic = (healthData) => {
  // Remove info sensível para usuários não-admin
  const publicData = { ...healthData };
  
  if (publicData.checks.database) {
    delete publicData.checks.database.connections_max;
    delete publicData.checks.server.memory_usage_mb;
  }
  
  return publicData;
};
```

### 5. Integre com alertas
```javascript
const sendAlert = (healthData) => {
  if (healthData.status !== 'ok') {
    // Slack, Discord, email, etc.
    console.error('🚨 ALERTA: Sistema com problemas!', {
      timestamp: healthData.timestamp,
      issues: Object.entries(healthData.checks)
        .filter(([_, check]) => check.status !== 'ok')
        .map(([name, check]) => ({ service: name, issue: check }))
    });
  }
};
```

## Monitoramento automático

Crie um script que roda constantemente verificando a saúde:

```javascript
class HealthMonitor {
  constructor(url, interval = 60000) {
    this.url = url;
    this.interval = interval;
    this.isRunning = false;
  }
  
  start() {
    this.isRunning = true;
    this.check();
  }
  
  stop() {
    this.isRunning = false;
  }
  
  async check() {
    if (!this.isRunning) return;
    
    try {
      const response = await fetch(this.url);
      const data = await response.json();
      
      if (data.status !== 'ok') {
        this.handleUnhealthyStatus(data);
      } else {
        console.log(`✅ ${new Date().toLocaleTimeString()} - Sistema saudável`);
      }
    } catch (error) {
      this.handleError(error);
    }
    
    // Agenda próxima verificação
    setTimeout(() => this.check(), this.interval);
  }
  
  handleUnhealthyStatus(data) {
    console.warn(`⚠️  ${new Date().toLocaleTimeString()} - Problemas detectados:`);
    
    Object.entries(data.checks).forEach(([service, check]) => {
      if (check.status !== 'ok') {
        console.warn(`  - ${service}: ${check.status} ${check.message || ''}`);
      }
    });
    
    // Aqui você pode integrar com sistemas de alerta
    this.sendToSlack(data);
  }
  
  handleError(error) {
    console.error(`🚨 ${new Date().toLocaleTimeString()} - Erro ao verificar saúde:`, error.message);
  }
  
  sendToSlack(healthData) {
    // Implementar webhook do Slack, Discord, etc.
  }
}

// Usar assim:
const monitor = new HealthMonitor('http://localhost:3000/api/health');
monitor.start();
```

## Erros comuns (e como evitar)

### 1. **Health check muito lento**
```javascript
// ❌ Ruim - demora muito
const slowCheck = async () => {
  const result = await heavyDatabaseQuery(); // 5 segundos
  return result;
};

// ✅ Bom - rápido e eficiente  
const fastCheck = async () => {
  const result = await db.query('SELECT 1'); // Milissegundos
  return { status: 'ok', response_time: Date.now() - start };
};
```

### 2. **Não ter timeout**
```javascript
// ✅ Sempre defina timeout
const checkWithTimeout = async (url, timeoutMs = 5000) => {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), timeoutMs);
  
  try {
    const response = await fetch(url, { signal: controller.signal });
    clearTimeout(timeout);
    return response;
  } catch (error) {
    clearTimeout(timeout);
    throw error;
  }
};
```

### 3. **Expor informações demais**
```javascript
// ❌ Perigoso
{
  "database_password": "senha123",
  "api_keys": ["key1", "key2"]
}

// ✅ Seguro
{
  "database_status": "ok",
  "external_services_count": 2
}
```

## Quando usar ferramentas prontas vs. fazer na mão

**Faça na mão quando:**
- Aplicação simples com poucas dependências
- Quer controle total sobre o que monitora
- Time pequeno que conhece bem o sistema

**Use ferramentas prontas quando:**
- Sistema complexo com muitos serviços
- Precisa de dashboards bonitos
- Quer integração com alertas sofisticados

**Ferramentas populares:**
- **Prometheus + Grafana**: Para quem quer gráficos bonitos
- **New Relic**: Para quem tem budget e quer tudo pronto
- **DataDog**: Similar ao New Relic
- **Pingdom**: Para monitoramento externo

## Conclusão: Comece simples, evolua conforme precisa

Seu primeiro health check pode ser assim:

```javascript
app.get('/health', async (req, res) => {
  try {
    await db.query('SELECT 1');
    res.json({ status: 'ok', timestamp: new Date().toISOString() });
  } catch (error) {
    res.status(503).json({ 
      status: 'error', 
      message: error.message,
      timestamp: new Date().toISOString() 
    });
  }
});
```

Depois você vai adicionando:
1. Mais verificações (serviços externos, recursos)
2. Alertas automáticos
3. Dashboards
4. Histórico de métricas

O importante é **começar**. Um health check simples que funciona é infinitamente melhor que um complexo que nunca sai do papel.

> [! Opcional]
> > Se quiser se aprofundar mais no assunto leia essa texto-ensaio [[API-HEALTH]]