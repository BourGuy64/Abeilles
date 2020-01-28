//Liste des mois de l'année afin de les afficher
const monthNames = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];

Vue.filter('toMonth', function(date){
  return monthNames[date - 1]
});

Vue.filter('meterSize', function(taille){
  taille = taille.toString();
  if(taille.length > 2){
    let cm = taille.slice(2)
    let m = taille.slice(0, 2);
    if (cm == '00')
      return m + ' m ';
    else
      return m + ' m ' + cm + ' cm'
  }
  else{
    return taille + ' cm';
  }

});

const Api = 'localhost'; //Use when dev on local Docker's
// const Api = '51.158.67.211'; //Use for Prod

let app = new Vue({
  el: '#app',
  data: {
    monthNames: monthNames,
    fleurs: [],
    showEdit: false,
    create: true,
    edition: {
      n_latin :'',
      n_fr :'',
      length :0,
      color :'',
      nectar :0,
      pollen :0,
      bloom_start :'',
      bloom_end :'',
      localisation :'',
      position :'',
      photo :''
    },
    viewQR: false,
    generatedQR: '',
    editTargetId: 0
  },
  methods:{
   /**
    * Recupère les fleurs depuis l'API et les ajoutent à la VUE
    */
    getFleurs(){
      $.ajax({
        type: 'GET',
        url: 'http://'+ Api +':19080/fleurs',
        dataType: 'json',
        context: this,
        success: function(data){this.fleurs = data;},
        error: function(data){console.log(data);}
      });
    },

  /**
   * Envoi les données et l'instruction de création d'une nouvelle fleur
   */
    createFleur(){
      $.ajax({
        type: 'POST',
        url: 'http://'+ Api +':19080/fleurs',
        context: this,
        data: this.edition,
        success: function(data){
                  this.initEditionFields();
                  this.leaveEdit();
                  this.getFleurs();
                },
        error: function(data){console.log(data);}
      });
    },

    /**
     * Remet le formulaire à zéro, notamment dans le cas où on veut passer en mode création,
     * effacer les valeurs déjà renseignées
     */
    initEditionFields(){
      this.edition = {
        n_latin :'',
        n_fr :'',
        length :0,
        color :'',
        nectar :0,
        pollen :0,
        bloom_start :'',
        bloom_end :'',
        localisation :'',
        position :'',
        photo :''
      }
    },

    /**
     * Quitte la fenêtre contenant le formulaire de création/édition
     */
    leaveEdit(){
      this.showEdit = false;
      this.create = true;
      this.initEditionFields();
    },

    /**
     * Affiche la fenêtre contenant le formulaire de création/édition
     */
    goEdit(){
      this.showEdit = true;
    },

    /**
     * Récupère les informations de la fleur à modifier
     * ouvre la fenêtre contenant le formulaire et prérempli les champs
     * @params fleur, objet contenant les informations de la fleur
     */
    editFleur(fleur){
      this.edition = Object.assign({}, fleur);
      this.editTargetId = fleur.id;
      this.goEdit();
      this.create = false;
    },

    /**
     * Envoi a l'API l'instruction de modifier la fleur
     */
    sendEdit(){
      //Récpuère l'image transmise dans le formulaire
      let file_data = $('#img').prop('files')[0];
      let form_data = new FormData();
      form_data.append('file_uploaded', file_data);

      //Transmet l'image à un script PHP pour généré l'image sur le serveur
      $.ajax({
        type: 'POST',
        url: 'http://'+Api+':19080/uploadfile',
        data: form_data,
        dataType: 'text',
        cache: false,
        contentType: false,
        processData: false,
        context: this,
        success: function(data){
                  //Vérifi si il y a bien une image a transmettre
                  if($('#img').prop('files').length > 0)
                    this.edition.photo = $('#img').prop('files')[0].name;
                  else
                    delete this.edition.photo; //Evite de remplacer l'image existante

                  //Envoi l'instruction a l'API de modifié la fleur
                  $.ajax({
                    type: 'PATCH',
                    url: 'http://'+ Api +':19080/fleurs/' + this.editTargetId,
                    data: this.edition,
                    context: this,
                    success: function(data){
                              this.leaveEdit();
                              this.getFleurs();
                            },
                    error: function(data){
                      console.log(data);
                    }
                  });
                },
        error: function(data){
          console.log(data);
          alert('La taille maximum pour téléverser une image est de 1 Mo.');
        }
      });
    },

    /**
     * Génère le code QR de l'ID de la fleur et affiche la fenêtre contenant le code QR
     * @params fleurID, id de la fleur dont on va généré le code QR
     */
    createQR(fleurID){
        this.viewQR = true;
        this.generatedQR = fleurID;
        document.getElementById('qrcode-container').innerHTML = "";
        let qrcode = new QRCode(document.getElementById('qrcode-container'));
        qrcode.makeCode(fleurID.toString());
    },

    /**
     * Quitte la fenêtre contenant le code QR
     */
    leaveQR(){
        this.viewQR = false;
    },

    /**
     * Envoi l'instruction a l'API afin de supprimer la fleur
     * @params fleurID, id de la fleur à supprimer
     */
    deleteFleur(fleurID){
      $.ajax({
        type: 'DELETE',
        url: 'http://'+ Api +':19080/fleurs/' + fleurID,
        context: this,
        success: function(data){
                    this.leaveEdit();
                    this.getFleurs();
                  },
        error: function(data){console.log(data);}
      });
    },

    /**
     * Ajout un eventListener qui va permettre de fermer un popup
     */
    escKeyToLeaveAWindow(){
      document.onkeydown = evt => {
        evt = evt || window.event;
        if (evt.keyCode == 27) {
          this.leaveEdit();
          this.leaveQR();
        }
      };
    }

  },

  created: function(){
    this.getFleurs();
    this.initEditionFields();
    this.escKeyToLeaveAWindow();
  },

  computed:{
    /**
     * Génère le titre de la fenêtre de création/modification selon l'action en cours
     */
    actionTitle(){
      if(this.create)
        return 'Création';
      else
        return 'Modification'
    }
  }
});
