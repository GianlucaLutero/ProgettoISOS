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

main {
	
	payment( request )( response ){
		if( request.user == "Gian" ) {
			if( request.password == "prova" ) {	
				response.response = "OK"
			}else {
				response.response = "Failed 1"
			}
		}else {
			response.response = "Failed 2"
		}
	}

}
