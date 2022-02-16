const express = require('express');

const app = express();

app.get('/', (request, response) => {
    console.log('Servidor foi chamado!');

    return response.send("Hello World");
});

app.get('/products', (request, response) => {
    return response.send("Sucesso");
});

app.listen(7777);