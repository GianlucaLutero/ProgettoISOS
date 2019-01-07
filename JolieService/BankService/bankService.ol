include "console.iol"
include "bankInterface.iol"



inputPort BankService {
	Location: "socket://localhost:8000"
	Protocol: soap{
		.wsdl = "./BankService.wsdl";
		.wsdl.port = "BankServicePort"
	}
	Interfaces: BankInterface
}

init {

	global.users[0].name = "cataldo";
	global.users[0].password = "password1";
	global.users[0].authKey = "taranto";
	global.users[0].credit = 1;
	global.users[0].tListlength = 1;
	global.users[0].transactionList[0].from = "abc";
	global.users[0].transactionList[0].amount = 1;

	global.users[1].name = "davide";
  global.users[1].password = "password2";
	global.users[1].authKey = "sbt";
  global.users[1].credit = 10000;
	global.users[1].tListlength = 1;
	global.users[1].transactionList[0].from = "abc";
	global.users[1].transactionList[0].amount = 1;

	global.users[2].name = "filippo";
  global.users[2].password = "password3";
	global.users[2].authKey = "crisso";
  global.users[2].credit = 111;
	global.users[2].tListlength = 1;
	global.users[2].transactionList[0].from = "abc";
	global.users[2].transactionList[0].amount = 1
}

main {

	while(true){

		//Authentication done with authKey

		//payment
		[ payment( request )( response ){
			leng = #global.users;
			for( i = 0, i < leng, i++){
				// println@Console("user name:" + global.users[i].name)();
				if( request.user == global.users[i].name ) {
					if( request.password == global.users[i].password ) {
						response.response = "OK";
						response.response = global.users[i].name + " has " +  global.users[i].credit;
						global.users[i].tListLength = global.users[i].tListLength + 1;
						global.users[i].transactionList[global.users[i].tListLength].from = request.receiver;
						global.users[i].transactionList[global.users[i].tListLength].amount = request.amount;
						i = leng
					} else {
						response.response = "{error : wrong_authentication}"
					}
				}else {
					response.response = "{error : wrong_authentication}"
				}
			}


		}]

		// check account
		[ checkAccount( request )( response ){

			for( i = 0, i < leng, i++){
				 println@Console("user name:" + global.users[i].name)();
				if( request.user == global.users[i].authKey ) {
						response.response = "{ status: OK , transactions : [";

						// Aggiungere tutte le transazioni con il for e in json
						response.response =	response.response + global.users[i].transactionList.from;

					 	response.response =	response.response + "]}";
						i = leng

				}else {
					response.response = "{error : wrong_authentication}"
				}
			}

		}]

	}
}
