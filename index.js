const express = require('express');
const client = require('prom-client');

const app = express();
const register = new client.Registry();

client.collectDefaultMetrics({ register });

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'UP',
    timestamp: new Date().toISOString()
  });
});

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

app.get('/', (req, res) => {
  res.status(200).send('Projeto DevOps rodando');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Servidor ativo na porta ${PORT}`);
});