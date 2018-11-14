include "twiceInterface.iol"

inputPort TwiceService {

	Location: "socket://localhost:8000"
	Protocol: soap {
		.wsdl = "./TwiceService.wsdl";
		.wsdl.port = "TwiceServiceServicePort"
	}
	Interfaces: TwiceInterface
}


main
{

	twice( request )( response ) {
		response.twice = request.value * 2
	}
}
