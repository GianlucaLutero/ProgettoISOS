include "gisInterface.iol"

execution {concurrent}

inputPort GisService {
  Location: "socket://localhost:8002"
  Protocol: http
  Interfaces: GisInterface
}

/*
    Mettere la lista dei luoghi
*/

main{
    getPlace( request )( response ) {
        response.location = "{ location :Forli catering center }"

    }
}
