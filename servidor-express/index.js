var express = require('express');
var bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json())

app.get('/', (req, res) => {
    console.log('Servidor foi chamado!');

    return res.send("Tudo ok");
});

app.post('/products', function(req, res) {
    console.log(req.body);
    res.send("Sucesso");
    
});

app.listen(7777);