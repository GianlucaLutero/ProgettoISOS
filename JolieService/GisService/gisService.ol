include "gisInterface.iol"
include "selectorInterface.iol"
include "console.iol"
include "json_utils.iol"


execution {concurrent}

inputPort GisService {
  Location: "socket://localhost:8002"
  Protocol: http
  Interfaces: GisInterface
}

outputPort Selector {
  Interfaces: SelectorInterface
}

embedded {
  JavaScript: "placeSelector.js" in Selector
}

/*
    Mettere la lista dei luoghi
*/

init{
  global.place[0].name = "Pronto Catering";
  global.place[0].location = "Parma";
  global.place[0].address = "Via Emilia 0888871";
  global.place[0].x = 0.0;
  global.place[0].y = 0.0;

  global.place[1].name = "Catering Express";
  global.place[1].location = "Bologna";
  global.place[1].address = "Via Zamboni 9";
  global.place[1].x = 15.0;
  global.place[1].y = 90.0;

  global.place[1].name = "Catering Express";
  global.place[1].location = "Bologna";
  global.place[1].address = "Via Lame 21";
  global.place[1].x = 05.0;
  global.place[1].y = 80.0;

  global.place[2].name = "Bla Bla Catering";
  global.place[2].location = "Forli";
  global.place[2].address = "Via Forli 1";
  global.place[2].x = 35.0;
  global.place[2].y = 78.0;

  global.place[3].name = "Bomba Catering";
  global.place[3].location = "Napoli";
  global.place[3].address = "Via Brombeis 15";
  global.place[3].x = 150.0;
  global.place[3].y = 67.0

}

main{

    [getPlace(request)(response){
        println@Console("Searching place")();
        response.location = "{status: no_place_found}";
        for ( i=0, i < #global.place, i++ ) {
          if(request.name == global.place[i].name){
            getJsonString@JsonUtils(global.place[i])(placeList);
            println@Console(placeList)();
            response.location = placeList;
            i = #global.place
          }
        }
    }]

    [getNearestPlace( request )( response ) {

        println@Console("Retrieving place "+request.place+" coordinate")();
        println@Console("List of candidates "+request.placeList)();

        //getJsonString@JsonUtils(request.placeList)(tmp);
        //getJsonString@JsonUtils(request)(tmp);
        pRequest.list = request.placeList;
        placeSelector@Selector(pRequest)(tmp);
        println@Console("example "+tmp)();
        response.location = tmp

    }]
}
