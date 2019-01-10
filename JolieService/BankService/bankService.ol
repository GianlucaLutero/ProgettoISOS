include "console.iol"
include "time.iol"
include "bankInterface.iol"



inputPort BankService {
	Location: "socket://localhost:8000"
	Protocol: soap{
	//	.wsdl = "./BankService.wsdl";
	//	.wsdl.port = "BankServicePort";
		.namespace = "org.camunda.bpm.ExternalService.xsd";
		.dropRootValue = true
	}
	Interfaces: BankInterface
}

init {

	global.users[0].name = "cataldo";
	global.users[0].password = "password1";
	global.users[0].authKey = "taranto";
	global.users[0].credit = 1;
	global.users[0].transactionList[0].from = "filippo";
	global.users[0].transactionList[0].amount = 1;
	global.users[0].transactionList[0].time = "1/1/2019";
	global.users[0].transactionList[1].from = "davide";
	global.users[0].transactionList[1].amount = 100;
	global.users[0].transactionList[1].time = "1/1/2019";

	global.users[1].name = "davide";
  global.users[1].password = "password2";
	global.users[1].authKey = "sbt";
  global.users[1].credit = 10000;
	global.users[1].transactionList[0].from = "abc";
	global.users[1].transactionList[0].amount = 1;
	global.users[1].transactionList[0].time = "1/1/2019";

	global.users[2].name = "filippo";
  global.users[2].password = "password3";
	global.users[2].authKey = "crisso";
  global.users[2].credit = 111;
	global.users[2].transactionList[0].from = "abc";
	global.users[2].transactionList[0].amount = 1;
	global.users[2].transactionList[0].time = "1/1/2019"
}

main {

	while(true){

		//Authentication done with authKey

		//payment
		[ payment( request )( response ){
			leng = #global.users;
			for( i = 0, i < leng, i++){
				// println@Console("user name:" + global.users[i].name)();
				if( request.authKey == global.users[i].authKey ) {
						response.response = "{ status : OK }";
			//			response.response = global.users[i].name + " has " +  global.users[i].credit;

						for ( j = 0, j < leng, j++ ) {
							if(request.receiver == global.users[j].name){
								if(global.users[i].credit > request.amount){
									global.users[j].credit = global.users[j].credit + request.amount;
									t.from = global.users[i].name;
									t.amount = request.amount;
									getCurrentDateTime@Time()(t.time);
									println@Console("Payment done for "+t.from+" in date "+t.time+" of " + t.amount)();
									global.users[j].transactionList[#global.users[j].transactionList] << t;
									//global.users[j].transactionList[#global.users[j].transactionList+1].from = request.receiver;
									//global.users[j].transactionList[#global.users[j].transactionList+1].amount = request.amount;
									global.users[i].credit = global.users[i].credit - request.amount
								}else{
									response.response = "{status : sono_povero}"
								}
							}
						};

						i = leng
				}else {
					response.response = "{error : wrong_authentication}"
				}
			}


		}]

		// check account
		[ checkAccount( request )( response ){
			leng = #global.users;
			for( i = 0, i < leng, i++){
				 println@Console("user name:" + global.users[i].name)();
				if( request.user == global.users[i].authKey ) {
						response.response = "{ status: OK ,amount:"+global.users[i].credit+" ,transactions : [";

						// Aggiungere tutte le transazioni con il for e in json

						println@Console("Number of transactions :" + #global.users[i].transactionList)();

						for ( j = 0 , j < #global.users[i].transactionList, j++ ) {
							println@Console("Transaction :" + global.users[i].transactionList[j].from)();

							response.response =	response.response + "{ from : "+global.users[i].transactionList[j].from;
							response.response = response.response + ", amount : "+global.users[i].transactionList[j].amount;
							response.response = response.response + ", time : "+global.users[i].transactionList[j].time+"}";

							if(#global.users[i].transactionList - j > 1){
								response.response =	response.response + ","
							}
						};
						//response.response =	response.response + "{ from : "+global.users[i].transactionList.from;
						//response.response = response.response + ", amount : "+global.users[i].transactionList.amount+"}";

					 	response.response =	response.response + "]}";
						i = leng

				}else {
					response.response = "{error : wrong_authentication}"
				}
			}

		}]

	}
}
