include "chirpterInterface.iol"
include "console.iol"
include "time.iol"

inputPort ChirpterService {
	Location: "socket://localhost:8001"
	Protocol: soap{
		.namespace = "org.camunda.bpm.ExternalService.xsd";
		.dropRootValue = true
	}
	Interfaces: ChirpterInterface
}

init {

	global.users[0].name = "cataldo";
	global.users[0].password = "password1";
	global.users[0].authKey = "taranto";
  global.users[0].chirpList[0].time ="1/1/2019";
  global.users[0].chirpList[0].msg ="Forza Bari";


	global.users[1].name = "davide";
  global.users[1].password = "password2";
	global.users[1].authKey = "sbt";
  global.users[1].chirpList[0].time ="1/1/2019";
  global.users[1].chirpList[0].msg ="Forza Samb";

	global.users[2].name = "filippo";
  global.users[2].password = "password3";
	global.users[2].authKey = "crisso";
  global.users[2].chirpList[0].time ="1/1/2019";
  global.users[2].chirpList[0].msg ="W Forli"

}


main {

	while(true){

		//Authentication done with authKey

		//publish
		[ publish( request )( response ){
      println@Console("Publishing chirp")();
      for ( i=0, i < #global.users, i++ ) {
        if( global.users[i].authKey == request.authKey ) {
          tmp.msg = request.msg;
          getCurrentDateTime@Time()(tmp.time);
          println@Console(tmp.msg+": chirp published by "+global.users[i].name+" in date "+tmp.time)();
          global.users[i].chirpList[#global.users[i].chirpList] << tmp;
          response.response = "{status: published}"
        }
      }

		}]

		// getChirpList
		[ getChirpList( request )( response ){
	//		leng = #global.users;
        for ( i=0, i < #global.users, i++ ) {
            if( global.users[i].authKey == request.authKey ) {
                response.response = "{chirplist : [";

                for ( j=0, j< #global.users[i].chirpList, j++ ) {
          //        println@Console( "Chirp found" )();
                  response.response = response.response + "{ msg : "+global.users[i].chirpList[j].msg;
                  response.response = response.response + ", time : "+global.users[i].chirpList[j].time+"}";
          //        println@Console(#global.users[i].chirpList - j + " left")();

                  if(#global.users[i].chirpList - j > 1){
                    response.response =	response.response + ","
                  }

                };

                response.response = response.response + "]}"
            }
        }
		}]

	}
}
