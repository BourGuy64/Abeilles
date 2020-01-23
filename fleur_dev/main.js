import express from 'express';
import body_parser from 'body-parser';
import fs from 'fs';
import ReqStatus from './class/ReqStatus.js';
import fleur from './route/fleur.js';
import cors from 'cors'


const app = express();

app.use(body_parser({extended: false}));
app.use(express.json());

app.use(cors({origin: '*'}));

app.get('/', function(req, res){
  res.send('API de fleur');
});

app.use('/fleurs', fleur);

//Gestion des erreurs 400, requête ou route invalide
app.all('/*', ReqStatus.badRequest);




app.listen(8080);
