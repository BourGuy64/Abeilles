import db from '../controllers/Database.js'
import ReqStatus from './ReqStatus.js'

export class Fleur{
  static get(req, res){
    db.select().from('fleurs').then( (result) => {
      res.json(result);
    }).catch( (result) => {
      ReqStatus.internalError(req, res);
    });
  }

  static getById(req, res){
    db.select().where('id', req.params.id).from('fleurs').then( (result) => {
      if(result.length > 0){
        res.json(result);
      }
      else{
        ReqStatus.notFound(req, res);
      }
    }).catch( (result) => {
      ReqStatus.internalError(req, res);
    });
  }

  static create(req, res){
    if(req.body.length == ''){

    }
    db.insert({
      n_latin : req.body.n_latin,
      n_fr :req.body.n_fr,
      length :req.body.length,
      color :req.body.color,
      nectar :req.body.nectar,
      pollen :req.body.pollen,
      bloom_start : new Date(req.body.bloom_start),
      bloom_end : new Date(req.body.bloom_end),
      localisation :req.body.localisation,
      photo :req.body.photo,
      created_at: new Date()
    }).into('fleurs').then( (result) => {
      res.send('Fleur crée !');
    }).catch( (result) => {
      // ReqStatus.internalError(req, res);
      res.send(result)
    });
  }

  static edit(req, res){
    db.select().where('id', req.params.id).from('fleurs').then( (result) =>{
      let toEdit = result[0];
      for(let key in toEdit){
        if(typeof req.body[key] !== "undefined"){
          if(key == "bloom_start" || key == "bloom_end"){
            toEdit[key] = new Date(req.body[key]);
          }
          else if (key == 'created_at' || key == 'updated_at'){}
          else{
            toEdit[key] = req.body[key];
          }
        }
        toEdit['updated_at'] = new Date();
      }
      db.where('id', req.params.id).from('fleurs').update(toEdit).then( (result) => {
        res.send('Modification effectuée.');
      }).catch( (result) => {
        ReqStatus.internalError(req, res);

      })
    }).catch( (result) => {
      ReqStatus.internalError(req, res);
    });
  }

  static delete(req, res){
    db.where('id', req.params.id).from('fleurs').del().then( (result) => {
      res.send('La fleur ' + req.params.id + ' à été supprimé !');
    }).catch( (result) => {
      ReqStatus.internalError(req, res);
    });
  }
}

export default Fleur;
