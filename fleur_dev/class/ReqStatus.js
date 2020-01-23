export class ReqStatus{

  //Erreur 400
  static badRequest(req, res){
    res.status(405).json({
      "error" :
      {
        "status" : "400",
        "message" : "La requête est invalide."
      }
    });
  }

  //Erreur 404
  static notFound(req, res){
    res.status(405).json({
      "error" :
      {
        "status" : "404",
        "message" : "La ressource est introuvable, vérifiez le paramètre"
      }
    });
  }

  //Erreur 405
  static notAllowed(req, res){
    res.status(405).json({
      "error" :
      {
        "status" : "405",
        "message" : "Cette opération n'est pas possible."
      }
    });
  }

  //Erreur 500
  static internalError(req, res){
    res.status(500).json({
      "error" :
      {
        "status" : "500",
        "message" : "Une erreur interne est survenue."
      }
    });
  }

}

export default ReqStatus;
