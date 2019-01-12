include "chirpterInterface.iol"
include "console.iol"
include "time.iol"
include "message_digest.iol"
include "json_utils.iol"

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
  global.users[0].chirpStream[0].chirpStreamId ="idProva1";
	global.users[0].chirpStream[0].chirp[0].time ="1/1/2019";
  global.users[0].chirpStream[0].chirp[0].msg ="Forza Bari";
	global.users[0].chirpStream[0].chirp[1].time ="2/1/2019";
	global.users[0].chirpStream[0].chirp[1].msg ="asdasdfdfsdfsd";
	global.users[0].chirpStream[1].chirpStreamId ="idProva2";
	global.users[0].chirpStream[1].chirp[0].time ="10/1/2019";
	global.users[0].chirpStream[1].chirp[0].msg ="Forza Bari un cazzo";

	global.users[1].name = "davide";
  global.users[1].password = "password2";
	global.users[1].authKey = "sbt";
	global.users[1].chirpStream[0].chirpStreamId ="idProva1";
  global.users[1].chirpStream[0].chirp[0].time ="1/1/2019";
  global.users[1].chirpStream[0].chirp[0].msg ="Forza Samb";

	global.users[2].name = "filippo";
  global.users[2].password = "password3";
	global.users[2].authKey = "crisso";
	global.users[2].chirpStream[0].chirpStreamId ="idProva1";
  global.users[2].chirpStream[0].chirp[0].time ="1/1/2019";
  global.users[2].chirpStream[0].chirp[0].msg ="W Forli"

}


main {

	while(true){

		//Authentication done with authKey
		//createChirpStream
		[ createChirpStream(request)(response){

			for ( i=0, i < #global.users, i++ ) {
        if( global.users[i].authKey == request.authKey ) {
					tmp.chirpStreamId = global.users[i].name+"chirpStream"+#global.users[i].chirpStream;
					getCurrentDateTime@Time()(tmp.chirp.time);
          tmp.chirp.msg = request.msg;
					global.users[i].chirpStream[#global.users[i].chirpStream] << tmp;
					response.response = "{status: chirtpstream_created,id:"+tmp.chirpStreamId+"}"
        }
      }

		}]
		//publish
		[ publish( request )( response ){
      println@Console("Publishing chirp")();
      for ( i=0, i < #global.users, i++ ) {
        if( global.users[i].authKey == request.authKey ) {
					for ( j=0, j < #global.users[i].chirpStream, j++ ) {
							if( global.users[i].chirpStream[j].chirpStreamId == request.chirpID ) {
								getCurrentDateTime@Time()(tmp.pTime);
								tmp.msg = request.msg;
								println@Console(tmp.msg+": chirp published by "+global.users[i].name+" in date "+tmp.time + "in stream "+global.users[i].chirpStream[j].chirpStreamId )();
								global.users[i].chirpStream[j].chirp[#global.users[i].chirpStream[j].chirp] << tmp;
								response.response = "{status: published}"
							}
					}
        }
      }

		}]

		// getChirpList
		[ getChirpList( request )( response ){
	//		leng = #global.users;
        for ( i=0, i < #global.users, i++ ) {

            if( global.users[i].authKey == request.authKey ) {
								response.response = "{chirpStreamList : [";

								for ( j=0,j< #global.users[i].chirpStream,j++) {
										getJsonString@JsonUtils(global.users[i].chirpStream[j])(chirplistTMP);
										println@Console(chirplistTMP)();
										response.response = response.response + chirplistTMP;

										if(#global.users[i].chirpList - j >= 0){
					                    response.response =	response.response + ","
					          }
								};
								response.response = response.response + "]}"
            }
        }
		}]

	}
}
