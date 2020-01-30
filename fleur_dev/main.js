import express from 'express';
import body_parser from 'body-parser';
import fs from 'fs';
import ReqStatus from './class/ReqStatus.js';
import fleur from './route/fleur.js';
import cors from 'cors';
import multer from 'multer';

//Limite la taille des fichiers uploadable à 1 mébioctet
const maxSize = 1 * 1024 * 1024;

//Configuration de la gestion du stockage pour enregistrer les images uploader
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './uploads');
     },
    filename: function (req, file, cb) {
        cb(null , file.originalname);
    }
});

const upload = multer({ storage: storage, limits: {fileSize: maxSize} })

const app = express();

app.use(body_parser({extended: false}));
app.use(express.json());

app.use(cors({origin: '*'}));

app.get('/', function(req, res){
  res.send('API de fleur');
});

//Route vers la quelle la requête ajax pointera pour upload une immage
app.post('/uploadfile', upload.single('file_uploaded'), function(req, res, next){
    if (res instanceof multer.MulterError){
      res.status(403).send();
    }
    else if (res){
      res.status(200).send();
    }
});

app.use('/fleurs', fleur);

//Gestion des erreurs 400, requête ou route invalide
app.all('/*', ReqStatus.badRequest);

app.listen(8080);
