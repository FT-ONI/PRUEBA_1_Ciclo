const http = require('http');

const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('¡Servidor de TechMarket funcionando en EKS!\n');
});

server.listen(port, () => {
  console.log(`¡Servidor de TechMarket iniciado y escuchando en el puerto ${port}!`);
});
