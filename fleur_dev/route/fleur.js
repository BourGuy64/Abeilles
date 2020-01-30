import express from 'express';
import db from '../controllers/Database.js'
import ReqStatus from '../class/ReqStatus.js';
import Fleur from '../class/Fleur.js';

const router = express.Router();

//GET sur la totalité des fleurs
router.get('/', Fleur.get);

//GET sur une fleur selon son ID
router.get('/:id', Fleur.getById);

//GET pour récupéré l'image d'une fleur
router.get('/:id/img', Fleur.getImg);

//POST, création d'une fleur
router.post('/', Fleur.create);

//PATCH, edition d'une fleur
router.patch('/:id', Fleur.edit);

//DELETE, suppression d'une fleur
router.delete('/:id', Fleur.delete);

//Gestion des erreurs 405, méthode non autorisée
router.all('/', ReqStatus.notAllowed);
router.all('/:id', ReqStatus.notAllowed);


export default router;
