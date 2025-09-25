const http = require('http');

const todos = [
  { id: 1, task: 'Studiare Node.js senza Express', done: false },
  { id: 2, task: 'Creare una API JSON', done: true }
];

const server = http.createServer((req, res) => {
  if (req.url === '/api/todos') {
    res.writeHead(200, {'Content-Type': 'application/json'});
    res.end(JSON.stringify(todos));
  } else if (req.url === '/') {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end('<h1>Test apertura link!</h1>');
  } else {
    res.writeHead(404, {'Content-Type': 'text/plain'});
    res.end('Pagina non trovata');
  }
});

server.listen(3000, () => {
  console.log('Server attivo su http://localhost:3000/');
});