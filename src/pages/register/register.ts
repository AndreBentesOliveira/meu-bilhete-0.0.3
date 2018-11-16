import { Component, ViewChild } from '@angular/core';

import { NavController, AlertController } from 'ionic-angular';

import { HomePage } from '../home/home';

import {Http, Headers, RequestOptions}  from '@angular/http';

import { LoadingController } from 'ionic-angular';

import 'rxjs/add/operator/map';

@Component({

selector: 'page-register',

templateUrl: 'register.html'

})

export class RegisterPage {

@ViewChild("nomecompleto") nomecompleto;

@ViewChild("cpf") cpf;

@ViewChild("datanascimento") datanascimento;

@ViewChild("email") email;

@ViewChild("password") password;

@ViewChild("logadouro") logadouro;

@ViewChild("numero") numero;

@ViewChild("bairro") bairro;

@ViewChild("cep") cep;

@ViewChild("mobile") mobile;

@ViewChild("codcartao") codcartao;

constructor(public navCtrl: NavController, public alertCtrl: AlertController,  private http: Http,  public loading: LoadingController) {

}

Register(){

//// check to confirm the username, email, telephone and password fields are filled

if(this.nomecompleto.value=="" ){

let alert = this.alertCtrl.create({

title:"ATTENTION",

subTitle:"Username field is empty",

buttons: ['OK']

});

alert.present();

} else

if(this.email.value==""){

let alert = this.alertCtrl.create({

title:"ATTENTION",

subTitle:"Email field is empty",

buttons: ['OK']

});

alert.present();

}

else

if(this.mobile.value=="" ){

let alert = this.alertCtrl.create({

title:"ATTENTION",

subTitle:"Mobile number field is empty",

buttons: ['OK']

});

alert.present();

} else

if(this.password.value==""){

let alert = this.alertCtrl.create({

title:"ATTENTION",

subTitle:"Password field is empty",

buttons: ['OK']

});

alert.present();

}

else

{

var headers = new Headers();

headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json' );

let options = new RequestOptions({ headers: headers });

let data = {

nomecompleto: this.nomecompleto.value,
cpf: this.cpf.value,
datanascimento: this.datanascimento.value,
email: this.email.value,
password: this.password.value,
logadouro: this.logadouro.value,
numero: this.numero.value,
bairro: this.bairro.value,
cep: this.cep.value,
mobile: this.mobile.value,
codcartao: this.codcartao.value

};

let loader = this.loading.create({

content: 'Processando... Aguarde',

});

loader.present().then(() => {

this.http.post('/register/',data, options)

.map(res => res.json())

.subscribe(res => {

loader.dismiss()

if(res=="Cadastro Efetuado com Sucesso"){

let alert = this.alertCtrl.create({

title:"Mensagem",

subTitle:(res),

buttons: ['OK']

});

alert.present();

this.navCtrl.push(HomePage);

}else

{

let alert = this.alertCtrl.create({

title:"Mensagem",

subTitle:(res),

buttons: ['OK']

});

alert.present();

}

});

});

}

}

}


