Vue.filter('toLocaleDate', function(date){
  if(date instanceof Date == false)
    date = new Date(date);
  return date.toLocaleDateString('fr-FR', {month: "long", day: "numeric"});
});

let app = new Vue({
  el: '#app',
  data: {
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
    getFleurs(){
      $.ajax({
        type: 'GET',
        url: 'http://localhost:19080/fleurs',
        dataType: 'json',
        context: this,
        success: function(data){
          this.fleurs = data;
        },
        error: function(data){
        },
        completed: function(data){
          console.log(data);
        }
      });
    },

    createFleur(){
      $.ajax({
        type: 'POST',
        url: 'http://localhost:19080/fleurs',
        context: this,
        data: this.edition,
        success: function(data){
          this.initEditionFields();
          this.leaveEdit();
          this.getFleurs();
          console.log(data);
        },
        error: function(data){
          console.log(data);
        },
        completed: function(data){
          console.log(data);
        }
      });
    },

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

    leaveEdit(){
      this.showEdit = false;
      this.create = true;
      this.initEditionFields();
    },

    goEdit(){
      this.showEdit = true;
    },

    editFleur(fleur){
      this.edition = Object.assign({}, fleur);
      this.edition.bloom_start = new Date(this.edition.bloom_start).toISOString().split('T')[0];
      this.edition.bloom_end = new Date(this.edition.bloom_end).toISOString().split('T')[0];
      this.editTargetId = fleur.id;
      this.goEdit();
      this.create = false;
    },

    sendEdit(){
      let dataToSend = this.edition;
      $.ajax({
        type: 'PATCH',
        url: 'http://localhost:19080/fleurs/' + this.editTargetId,
        data: dataToSend,
        context: this,
        success: function(data){
          this.leaveEdit();
          this.getFleurs();
        },
        error: function(data){
          console.log(data);
        },
        completed: function(data){
          console.log(data);
        }
      });
    },

    createQR(fleurID){
        this.viewQR = true;
        this.generatedQR = fleurID;
        document.getElementById('qrcode-container').innerHTML = "";
        let qrcode = new QRCode(document.getElementById('qrcode-container'));
        fleurID = 'http://localhost:19080/fleurs/' + fleurID,
        qrcode.makeCode(fleurID.toString());
    },

    leaveQR(){
        this.viewQR = false;
    },

    deleteFleur(fleurID){
      $.ajax({
        type: 'DELETE',
        url: 'http://localhost:19080/fleurs/' + fleurID,
        context: this,
        success: function(data){
          this.leaveEdit();
          this.getFleurs();
        },
        error: function(data){
          console.log(data);
        },
        completed: function(data){
          console.log(data);
        }
      });
    }
  },
  created: function(){
    this.getFleurs();
    this.initEditionFields();
    document.onkeydown = evt => {
      evt = evt || window.event;
      if (evt.keyCode == 27) {
        this.leaveEdit();
      }
    };
  },
  computed:{
    actionTitle(){
      if(this.create)
        return 'Création';
      else
        return 'Modification'
    }
  }
});
