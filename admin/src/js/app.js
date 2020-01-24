const monthNames = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];

Vue.filter('toMonth', function(date){
  return monthNames[date - 1]
});

const Api = 'localhost'; //Use when dev on local Docker's
// const Api = '51.158.67.211'; //Use for Prod

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
        url: 'http://'+ Api +':19080/fleurs',
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
        url: 'http://'+ Api +':19080/fleurs',
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
      this.editTargetId = fleur.id;
      this.goEdit();
      this.create = false;
    },

    sendEdit(){
      let dataToSend = this.edition;
      let file_data = $('#img').prop('files')[0];
      let form_data = new FormData();
      form_data.append('file', file_data);
      $.ajax({
        type: 'POST',
        url: '../upload.php',
        data: form_data,
        dataType: 'text',
        cache: false,
        contentType: false,
        processData: false,
        context: this,
        success: function(data){
          if($('#img').prop('files').length > 0)
            dataToSend.photo = $('#img').prop('files')[0].name;
          $.ajax({
            type: 'PATCH',
            url: 'http://'+ Api +':19080/fleurs/' + this.editTargetId,
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
        error: function(data){
          console.log(data);
        }
      });
    },

    createQR(fleurID){
        this.viewQR = true;
        this.generatedQR = fleurID;
        document.getElementById('qrcode-container').innerHTML = "";
        let qrcode = new QRCode(document.getElementById('qrcode-container'));
        qrcode.makeCode(fleurID.toString());
    },

    leaveQR(){
        this.viewQR = false;
    },

    deleteFleur(fleurID){
      $.ajax({
        type: 'DELETE',
        url: 'http://'+ Api +':19080/fleurs/' + fleurID,
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
        this.leaveQR();
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
